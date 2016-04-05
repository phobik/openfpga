/***********************************************************************************************************************
 * Copyright (C) 2016 Andrew Zonenberg and contributors                                                                *
 *                                                                                                                     *
 * This program is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General   *
 * Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) *
 * any later version.                                                                                                  *
 *                                                                                                                     *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied  *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for     *
 * more details.                                                                                                       *
 *                                                                                                                     *
 * You should have received a copy of the GNU Lesser General Public License along with this program; if not, you may   *
 * find one here:                                                                                                      *
 * https://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt                                                              *
 * or you may search the http://www.gnu.org website for the version 2.1 license, or you may write to the Free Software *
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA                                      *
 **********************************************************************************************************************/

#include "gp4par.h"

using namespace std;

void MakeIOBNodes(
	Greenpak4NetlistModule* module,
	Greenpak4Device* device,
	PARGraph*& ngraph,
	PARGraph*& dgraph,
	labelmap& lmap,
	uint32_t iob_label
	);
	
void MakeNetlistEdges(Greenpak4Netlist* netlist);
void MakeDeviceEdges(Greenpak4Device* device);

/**
	@brief Build the graphs
 */
void BuildGraphs(
	Greenpak4Netlist* netlist,
	Greenpak4Device* device,
	PARGraph*& ngraph,
	PARGraph*& dgraph,
	labelmap& lmap)
{
	//Create the graphs
	ngraph = new PARGraph;
	dgraph = new PARGraph;
	
	//This is the module being PAR'd
	Greenpak4NetlistModule* module = netlist->GetTopModule();
	
	//Create device entries for the IOBs
	uint32_t iob_label = AllocateLabel(ngraph, dgraph, lmap, "Unconstrained IOB");
	for(auto it = device->iobbegin(); it != device->iobend(); it ++)
	{
		Greenpak4IOB* iob = it->second;
		PARGraphNode* inode = new PARGraphNode(iob_label, iob);
		iob->SetPARNode(inode);
		dgraph->AddNode(inode);
	}
	
	//Create netlist nodes for the IOBs
	MakeIOBNodes(module, device, ngraph, dgraph, lmap, iob_label);
	
	//Make device nodes for each type of LUT
	uint32_t lut2_label = AllocateLabel(ngraph, dgraph, lmap, "GP_2LUT");
	uint32_t lut3_label = AllocateLabel(ngraph, dgraph, lmap, "GP_3LUT");
	uint32_t lut4_label = AllocateLabel(ngraph, dgraph, lmap, "GP_4LUT");
	for(unsigned int i=0; i<device->GetLUT2Count(); i++)
	{
		Greenpak4LUT* lut = device->GetLUT2(i);
		PARGraphNode* lnode = new PARGraphNode(lut2_label, lut);
		lut->SetPARNode(lnode);
		dgraph->AddNode(lnode);
	}
	for(unsigned int i=0; i<device->GetLUT3Count(); i++)
	{
		Greenpak4LUT* lut = device->GetLUT3(i);
		PARGraphNode* lnode = new PARGraphNode(lut3_label, lut);
		lnode->AddAlternateLabel(lut2_label);
		lut->SetPARNode(lnode);
		dgraph->AddNode(lnode);
	}
	for(unsigned int i=0; i<device->GetLUT4Count(); i++)
	{
		Greenpak4LUT* lut = device->GetLUT4(i);
		PARGraphNode* lnode = new PARGraphNode(lut4_label, lut);
		lnode->AddAlternateLabel(lut2_label);
		lnode->AddAlternateLabel(lut3_label);
		lut->SetPARNode(lnode);
		dgraph->AddNode(lnode);
	}
	
	//Make device nodes for the inverters
	uint32_t inv_label  = AllocateLabel(ngraph, dgraph, lmap, "GP_INV");
	for(unsigned int i=0; i<device->GetInverterCount(); i++)
	{
		Greenpak4Inverter* inv = device->GetInverter(i);
		PARGraphNode* inode = new PARGraphNode(inv_label, inv);
		inv->SetPARNode(inode);
		dgraph->AddNode(inode);
	}
	
	//Make device nodes for each type of flipflop
	uint32_t dff_label = AllocateLabel(ngraph, dgraph, lmap, "GP_DFF");
	uint32_t dffsr_label = AllocateLabel(ngraph, dgraph, lmap, "GP_DFFSR");
	for(unsigned int i=0; i<device->GetTotalFFCount(); i++)
	{
		Greenpak4Flipflop* flop = device->GetFlipflopByIndex(i);
		PARGraphNode* fnode = NULL;
		if(flop->HasSetReset())
		{
			fnode = new PARGraphNode(dffsr_label, flop);
			
			//It's legal to map a DFF to a DFFSR site, so add that as an alternate
			fnode->AddAlternateLabel(dff_label);
		}
		else
			fnode = new PARGraphNode(dff_label, flop);
		flop->SetPARNode(fnode);
		dgraph->AddNode(fnode);
	}
	
	//Make a device node for the low-frequency oscillator
	uint32_t lfosc_label = AllocateLabel(ngraph, dgraph, lmap, "GP_LFOSC");
	Greenpak4LFOscillator* lfosc = device->GetLFOscillator();
	PARGraphNode* lfnode = new PARGraphNode(lfosc_label, lfosc);
	lfosc->SetPARNode(lfnode);
	dgraph->AddNode(lfnode);
	
	//Make a device node for the reset block
	uint32_t sysrst_label = AllocateLabel(ngraph, dgraph, lmap, "GP_SYSRESET");
	Greenpak4SystemReset* sysrst = device->GetSystemReset();
	PARGraphNode* rstnode = new PARGraphNode(sysrst_label, sysrst);
	sysrst->SetPARNode(rstnode);
	dgraph->AddNode(rstnode);
	
	//Make a device node for the bandgap
	uint32_t bandgap_label = AllocateLabel(ngraph, dgraph, lmap, "GP_BANDGAP");
	Greenpak4Bandgap* bandgap = device->GetBandgap();
	PARGraphNode* bgnode = new PARGraphNode(bandgap_label, bandgap);
	bandgap->SetPARNode(bgnode);
	dgraph->AddNode(bgnode);
	
	//Make a device node for the power-on reset
	uint32_t por_label = AllocateLabel(ngraph, dgraph, lmap, "GP_POR");
	Greenpak4PowerOnReset* por = device->GetPowerOnReset();
	PARGraphNode* pornode = new PARGraphNode(por_label, por);
	por->SetPARNode(pornode);
	dgraph->AddNode(pornode);
	
	//Make device nodes for the counters
	uint32_t count8_label = AllocateLabel(ngraph, dgraph, lmap, "GP_COUNT8");
	uint32_t count14_label = AllocateLabel(ngraph, dgraph, lmap, "GP_COUNT14");
	for(unsigned int i=0; i<device->GetCounterCount(); i++)
	{
		auto counter = device->GetCounter(i);
		
		//Decide on primary label
		PARGraphNode* node = NULL;
		if(counter->GetDepth() == 14)
		{
			node = new PARGraphNode(count14_label, counter);
			
			//It's legal to map a COUNT8 to a COUNT14 site, so add that as an alternate
			node->AddAlternateLabel(count8_label);
		}
		else
			node = new PARGraphNode(count8_label, counter);
			
		//Add secondary labels for alternate functionality
		
		counter->SetPARNode(node);
		dgraph->AddNode(node);	
	}
	
	//TODO: make nodes for all of the other hard IP
	
	//Power nets
	uint32_t vdd_label = AllocateLabel(ngraph, dgraph, lmap, "GP_VDD");
	uint32_t vss_label = AllocateLabel(ngraph, dgraph, lmap, "GP_VSS");
	auto vdd = device->GetPowerRail(true);
	auto vss = device->GetPowerRail(false);
	PARGraphNode* vnode = new PARGraphNode(vdd_label, vdd);
	PARGraphNode* gnode = new PARGraphNode(vss_label, vss);
	vdd->SetPARNode(vnode);
	vss->SetPARNode(gnode);
	dgraph->AddNode(vnode);
	dgraph->AddNode(gnode);
	
	//Build inverse label map
	map<string, uint32_t> ilmap;
	for(auto it : lmap)
		ilmap[it.second] = it.first;
	
	//Add aliases for different primitive names that map to the same node type
	ilmap["GP_DFFR"] = dffsr_label;
	ilmap["GP_DFFSR"] = dffsr_label;
	
	//Make netlist nodes for cells
	for(auto it = module->cell_begin(); it != module->cell_end(); it ++)
	{
		//TODO: Support LOC constraints on individual cells
		//For now, just label by type
		
		//Figure out the type of node
		Greenpak4NetlistCell* cell = it->second;
		uint32_t label = 0;
		if(ilmap.find(cell->m_type) != ilmap.end())
			label = ilmap[cell->m_type];
		else
		{
			fprintf(
				stderr,
				"ERROR: Cell \"%s\" is of type \"%s\" which is not a valid GreenPak4 primitive\n",
				cell->m_name.c_str(), cell->m_type.c_str());
			exit(-1);			
		}
		
		//Create a node for the cell
		PARGraphNode* nnode = new PARGraphNode(label, cell);
		cell->m_parnode = nnode;
		ngraph->AddNode(nnode);
	}
	
	//Create edges in the netlist.
	//This requires breaking point-to-multipoint nets into multiple point-to-point links.
	MakeNetlistEdges(netlist);
		
	//Create edges in the device. This is static for all designs (TODO cache somehow?)
	MakeDeviceEdges(device);
}

/**
	@brief Make netlist nodes for the IOBs
 */
void MakeIOBNodes(
	Greenpak4NetlistModule* module,
	Greenpak4Device* device,
	PARGraph*& ngraph,
	PARGraph*& dgraph,
	labelmap& lmap,
	uint32_t iob_label
	)
{
	for(auto it = module->port_begin(); it != module->port_end(); it ++)
	{
		Greenpak4NetlistPort* port = it->second;
		
		if(!module->HasNet(it->first))
		{
			fprintf(stderr, "INTERNAL ERROR: Netlist has a port named \"%s\" but no corresponding net\n",
				it->first.c_str());
			exit(-1);
		}
		
		//Look up the net and make sure there's a LOC
		Greenpak4NetlistNet* net = module->GetNet(it->first);
		if(!net->HasAttribute("LOC"))
		{
			fprintf(
				stderr,
				"ERROR: Top-level port \"%s\" does not have a constrained location (LOC attribute).\n"
				"       In order to ensure proper device functionality all IO pins must be constrained.\n",
				it->first.c_str());
			exit(-1);
		}
		
		//Look up the matching IOB
		int pin_num;
		string sloc = net->GetAttribute("LOC");
		if(1 != sscanf(sloc.c_str(), "P%d", &pin_num))
		{
			fprintf(
				stderr,
				"ERROR: Top-level port \"%s\" has an invalid LOC constraint \"%s\" (expected P3, P5, etc)\n",
				it->first.c_str(),
				sloc.c_str());
			exit(-1);
		}
		Greenpak4IOB* iob = device->GetIOB(pin_num);
		if(iob == NULL)
		{
			fprintf(
				stderr,
				"ERROR: Top-level port \"%s\" has an invalid LOC constraint \"%s\" (no such pin, or not a GPIO)\n",
				it->first.c_str(),
				sloc.c_str());
			exit(-1);
		}
		
		//Type B IOBs cannot be used for inout
		if( (port->m_direction == Greenpak4NetlistPort::DIR_INOUT) &&
			(dynamic_cast<Greenpak4IOBTypeB*>(iob) != NULL) )
		{
			fprintf(
				stderr,
				"ERROR: Top-level inout port \"%s\" is constrained to a pin \"%s\" which does "
					"not support bidirectional IO\n",
				it->first.c_str(),
				sloc.c_str());
			exit(-1);
		}
		
		//Input-only pins cannot be used for IO or output
		if( (port->m_direction != Greenpak4NetlistPort::DIR_INPUT) &&
			iob->IsInputOnly() )
		{
			fprintf(
				stderr,
				"ERROR: Top-level port \"%s\" is constrained to an input-only pin \"%s\" but is not "
					"declared as an input\n",
				it->first.c_str(),
				sloc.c_str());
			exit(-1);
		}
		
		//Allocate a new graph label for these IOBs
		string sname = string("Constrained IOB ") + it->first;
		uint32_t label = AllocateLabel(ngraph, dgraph, lmap, sname);
		
		//If the IOB already has a custom label, we constrained two nets to the same place!
		PARGraphNode* ipnode = iob->GetPARNode();
		if(ipnode->GetLabel() != iob_label)
		{
			fprintf(
				stderr,
				"ERROR: Top-level port \"%s\" is constrained to pin \"%s\" but another port is already constrained "
				"to this pin.\n",
				it->first.c_str(),
				sloc.c_str());
			exit(-1);
		}
		
		//Create the node
		//TODO: Support buses here (for now, point to the entire port)
		PARGraphNode* netnode = new PARGraphNode(label, port);
		port->m_parnode = netnode;
		ngraph->AddNode(netnode);
		
		//Re-label the assigned IOB so we get a proper match to it
		ipnode->Relabel(label);
	}
}

/**
	@brief Make all of the edges in the netlist
 */
void MakeNetlistEdges(Greenpak4Netlist* netlist)
{
	for(auto it = netlist->nodebegin(); it != netlist->nodeend(); it ++)
	{
		Greenpak4NetlistNode* node = *it;
			
		//printf("    Node %s is sourced by:\n", node->m_name.c_str());
		
		PARGraphNode* source = NULL;
		string sourceport = "";
		
		//See if it was sourced by a port
		for(auto p : node->m_ports)
		{
			if(p->m_direction == Greenpak4NetlistPort::DIR_INPUT)
			{
				source = p->m_parnode;
				//Greenpak4NetlistNet* net = netlist->GetTopModule()->GetNet(p->m_name);
				//printf("        port %s (loc %s)\n", p->m_name.c_str(), net->m_attributes["LOC"].c_str());
			}
			
			else if(p->m_direction == Greenpak4NetlistPort::DIR_INOUT)
			{
				fprintf(
					stderr,
					"ERROR: Tristates not implemented\n");
				exit(-1);
			}
		}
		
		//See if it was sourced by a node
		for(auto c : node->m_nodeports)
		{
			Greenpak4NetlistModule* module = netlist->GetModule(c.m_cell->m_type);
			Greenpak4NetlistPort* port = module->GetPort(c.m_portname);
			
			if(port->m_direction == Greenpak4NetlistPort::DIR_INPUT)
				continue;
			else if(port->m_direction == Greenpak4NetlistPort::DIR_INOUT)
			{
				fprintf(
					stderr,
					"ERROR: Tristates not implemented\n");
				exit(-1);
			}
			
			source = c.m_cell->m_parnode;
			sourceport = c.m_portname;
			//printf("        cell %s port %s\n", c.m_cell->m_name.c_str(), c.m_portname.c_str());
		}
		
		//printf("        and drives\n");
		
		//DRC fail if undriven net
		if(source == NULL)
		{
			fprintf(
				stderr,
				"ERROR: Net \"%s\" has loads, but no driver\n",
				node->m_name.c_str());
			exit(-1);	
		}
		
		//Create edges from this source node to all sink nodes
		for(auto p : node->m_ports)
		{
			if(p->m_parnode != source)
			{
				//TODO: IOB port names
				source->AddEdge(sourceport, p->m_parnode);
				//Greenpak4NetlistNet* net = netlist->GetTopModule()->GetNet(p->m_name);
				//printf("        port %s (loc %s)\n", p->m_name.c_str(), net->m_attributes["LOC"].c_str());
			}
		}
		for(auto c : node->m_nodeports)
		{
			if(c.m_cell->m_parnode != source)
			{
				source->AddEdge(sourceport, c.m_cell->m_parnode, c.m_portname);
				//printf("        cell %s port %s\n", c.m_cell->m_name.c_str(), c.m_portname.c_str());
			}
		}
	}
}

/**
	@brief Make all of the edges for the device graph (list of all possible connections)
 */
void MakeDeviceEdges(Greenpak4Device* device)
{
	//Get all of the nodes in the device
	vector<PARGraphNode*> device_nodes;
	for(unsigned int i=0; i<device->GetEntityCount(); i++)
	{
		PARGraphNode* pnode = device->GetEntity(i)->GetPARNode();
		if(pnode)
			device_nodes.push_back(pnode);
	}
	
	//Add the O(n^2) edges between the main fabric nodes
	for(auto x : device_nodes)
	{
		auto oports = static_cast<Greenpak4BitstreamEntity*>(x->GetData())->GetOutputPorts();
		for(auto srcport : oports)
		{		
			for(auto y : device_nodes)
			{
				//Do not add edges to ourself (TODO: allow outputs of cell to feed its inputs?)
				if(x == y)
					continue;
					
				//Add paths to each cell input
				auto iports = static_cast<Greenpak4BitstreamEntity*>(y->GetData())->GetInputPorts();
				for(auto ip : iports)
					x->AddEdge(srcport, y, ip);
			}
		}
	}
	
	//Add dedicated routing between hard IP
	if(device->GetPart() == Greenpak4Device::GREENPAK4_SLG46620)
	{
		auto lfosc = device->GetLFOscillator()->GetPARNode();
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CLOCK INPUTS TO COUNTERS
		
		PARGraphNode* cnodes[] =
		{
			device->GetCounter(0)->GetPARNode(),
			device->GetCounter(1)->GetPARNode(),
			device->GetCounter(2)->GetPARNode(),
			device->GetCounter(3)->GetPARNode(),
			device->GetCounter(4)->GetPARNode(),
			device->GetCounter(5)->GetPARNode(),
			device->GetCounter(6)->GetPARNode(),
			device->GetCounter(7)->GetPARNode(),
			device->GetCounter(8)->GetPARNode(),
			device->GetCounter(9)->GetPARNode()
		};
		
		//TODO: other clock sources
		lfosc->AddEdge("CLKOUT", cnodes[0], "CLK");
		
		//TODO: other clock sources
		lfosc->AddEdge("CLKOUT", cnodes[1], "CLK");
		
		//TODO: other clock sources
		lfosc->AddEdge("CLKOUT", cnodes[2], "CLK");
		
		//TODO: other clock sources
		lfosc->AddEdge("CLKOUT", cnodes[3], "CLK");
		
		//TODO: other clock sources
		lfosc->AddEdge("CLKOUT", cnodes[4], "CLK");
		
		//TODO: other clock sources
		lfosc->AddEdge("CLKOUT", cnodes[5], "CLK");
		
		//TODO: other clock sources
		lfosc->AddEdge("CLKOUT", cnodes[6], "CLK");
		
		//TODO: other clock sources
		lfosc->AddEdge("CLKOUT", cnodes[7], "CLK");
		
		//TODO: other clock sources
		lfosc->AddEdge("CLKOUT", cnodes[8], "CLK");
		
		//TODO: other clock sources
		lfosc->AddEdge("CLKOUT", cnodes[9], "CLK");
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SYSTEM RESET
		
		//Can drive reset with ground or pin 2 only
		auto sysrst = device->GetSystemReset()->GetPARNode();
		auto pin2 = device->GetIOB(2)->GetPARNode();
		auto gnd = device->GetPowerRail(false)->GetPARNode();
		pin2->AddEdge("", sysrst, "RST");
		gnd->AddEdge("", sysrst, "RST");
	}
}
