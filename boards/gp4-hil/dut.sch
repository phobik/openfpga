EESchema Schematic File Version 2
LIBS:analog-azonenberg
LIBS:cmos
LIBS:cypress-azonenberg
LIBS:hirose-azonenberg
LIBS:memory-azonenberg
LIBS:microchip-azonenberg
LIBS:osc-azonenberg
LIBS:passive-azonenberg
LIBS:power-azonenberg
LIBS:special-azonenberg
LIBS:xilinx-azonenberg
LIBS:conn
LIBS:device
LIBS:gp4-hil-cache
EELAYER 25 0
EELAYER END
$Descr A2 23386 16535
encoding utf-8
Sheet 4 7
Title "GreenPak Hardware-In-Loop Test Platform"
Date "2016-05-19"
Rev "0.1"
Comp "Andrew Zonenberg"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_01X20 P1
U 1 1 5731797F
P 1400 1900
F 0 "P1" H 1478 1938 50  0000 L CNN
F 1 "GPAK_ZIF" H 1478 1846 50  0000 L CNN
F 2 "" H 1400 1900 60  0000 C CNN
F 3 "" H 1400 1900 60  0000 C CNN
	1    1400 1900
	-1   0    0    -1  
$EndComp
Text HLabel 3500 950  2    60   Input ~ 0
DUT_VDD1
Text HLabel 1900 1950 2    60   Input ~ 0
GND
Text Notes 4850 8300 0    60   ~ 0
Buffered indicator LEDs
Text HLabel 2400 1050 2    60   BiDi ~ 0
DUT_GPIO2
Text HLabel 2400 1150 2    60   BiDi ~ 0
DUT_GPIO3
Text HLabel 2400 1250 2    60   BiDi ~ 0
DUT_GPIO4
Text HLabel 2400 1350 2    60   BiDi ~ 0
DUT_GPIO5
Text HLabel 2400 1450 2    60   BiDi ~ 0
DUT_GPIO6
Text HLabel 2400 1550 2    60   BiDi ~ 0
DUT_GPIO7
Text HLabel 2400 1650 2    60   BiDi ~ 0
DUT_GPIO8
Text HLabel 2400 1750 2    60   BiDi ~ 0
DUT_GPIO9
Text HLabel 2400 1850 2    60   BiDi ~ 0
DUT_GPIO10
Text HLabel 2400 2050 2    60   BiDi ~ 0
DUT_GPIO12
Text HLabel 2400 2150 2    60   BiDi ~ 0
DUT_GPIO13
Text HLabel 2400 2250 2    60   BiDi ~ 0
DUT_GPIO14
Text HLabel 2400 2350 2    60   BiDi ~ 0
DUT_GPIO15
Text HLabel 2400 2450 2    60   BiDi ~ 0
DUT_GPIO16
Text HLabel 2400 2550 2    60   BiDi ~ 0
DUT_GPIO17
Text HLabel 2400 2650 2    60   BiDi ~ 0
DUT_GPIO18
Text HLabel 2400 2750 2    60   BiDi ~ 0
DUT_GPIO19
Text HLabel 2400 2850 2    60   BiDi ~ 0
DUT_GPIO20
$Comp
L SIP32408 U32
U 1 1 5753BC0B
P 5750 2150
F 0 "U32" H 5800 2100 60  0000 C CNN
F 1 "SIP32408" H 6150 2100 60  0000 C CNN
F 2 "" H 5750 2150 60  0000 C CNN
F 3 "" H 5750 2150 60  0000 C CNN
	1    5750 2150
	1    0    0    -1  
$EndComp
$Comp
L C C173
U 1 1 5753BC12
P 5250 1750
F 0 "C173" H 5365 1796 50  0000 L CNN
F 1 "4.7 uF" H 4900 1750 50  0000 L CNN
F 2 "" H 5288 1600 30  0000 C CNN
F 3 "" H 5250 1750 60  0000 C CNN
	1    5250 1750
	1    0    0    -1  
$EndComp
Text Label 5050 1900 2    60   ~ 0
GND
$Comp
L C C174
U 1 1 5753BC1B
P 6750 1750
F 0 "C174" H 6900 1800 50  0000 L CNN
F 1 "0.47 uF" H 6900 1700 50  0000 L CNN
F 2 "" H 6788 1600 30  0000 C CNN
F 3 "" H 6750 1750 60  0000 C CNN
	1    6750 1750
	1    0    0    -1  
$EndComp
Text Label 6600 1900 2    60   ~ 0
GND
Text HLabel 5050 1600 0    60   Input ~ 0
DUT_VDD2
Text Label 7900 1600 0    60   ~ 0
DUT_GPIO14
Text HLabel 5250 2100 0    60   Input ~ 0
DUT_VDD2_EN
$Comp
L CONN_01X20 P2
U 1 1 5754CB14
P 1400 4350
F 0 "P2" H 1478 4388 50  0000 L CNN
F 1 "2x10 HEADER" H 1478 4296 50  0000 L CNN
F 2 "" H 1400 4350 60  0000 C CNN
F 3 "" H 1400 4350 60  0000 C CNN
	1    1400 4350
	-1   0    0    -1  
$EndComp
Text Label 1900 3400 0    60   ~ 0
DUT_VDD1
Text Label 1900 3600 0    60   ~ 0
DUT_GPIO3
Text Label 1900 3700 0    60   ~ 0
DUT_GPIO4
Text Label 1900 3800 0    60   ~ 0
DUT_GPIO5
Text Label 1900 3900 0    60   ~ 0
DUT_GPIO6
Text Label 1900 4000 0    60   ~ 0
DUT_GPIO7
Text Label 1900 4100 0    60   ~ 0
DUT_GPIO8
Text Label 1900 4200 0    60   ~ 0
DUT_GPIO9
Text Label 1900 4300 0    60   ~ 0
DUT_GPIO10
Text Label 1900 4400 0    60   ~ 0
GND
Text Label 1900 4500 0    60   ~ 0
DUT_GPIO12
Text Label 1900 4600 0    60   ~ 0
DUT_GPIO13
Text Label 1900 4700 0    60   ~ 0
DUT_GPIO14
Text Label 1900 4800 0    60   ~ 0
DUT_GPIO15
Text Label 1900 4900 0    60   ~ 0
DUT_GPIO16
Text Label 1900 5000 0    60   ~ 0
DUT_GPIO17
Text Label 1900 5100 0    60   ~ 0
DUT_GPIO18
Text Label 1900 5200 0    60   ~ 0
DUT_GPIO19
Text Label 1900 5300 0    60   ~ 0
DUT_GPIO20
Text HLabel 2500 3500 2    60   Input ~ 0
GPIO2_DIO
Text Notes 1350 5600 0    60   ~ 0
Note that pin 2 is connected to FPGA-side\nsignal to isolate it from Vpp
$Comp
L CONN_01X01 TP1
U 1 1 57551E08
P 20850 1250
F 0 "TP1" H 20928 1288 50  0000 L CNN
F 1 "TESTPOINT" H 20928 1196 50  0000 L CNN
F 2 "" H 20850 1250 60  0000 C CNN
F 3 "" H 20850 1250 60  0000 C CNN
	1    20850 1250
	1    0    0    -1  
$EndComp
Text Label 20400 1250 2    60   ~ 0
DUT_VDD1
$Comp
L CONN_01X01 TP2
U 1 1 5755206A
P 20850 1500
F 0 "TP2" H 20928 1538 50  0000 L CNN
F 1 "TESTPOINT" H 20928 1446 50  0000 L CNN
F 2 "" H 20850 1500 60  0000 C CNN
F 3 "" H 20850 1500 60  0000 C CNN
	1    20850 1500
	1    0    0    -1  
$EndComp
Text Label 20400 1500 2    60   ~ 0
DUT_VDD2
$Comp
L CONN_01X01 TP3
U 1 1 575520A4
P 20850 1750
F 0 "TP3" H 20928 1788 50  0000 L CNN
F 1 "TESTPOINT" H 20928 1696 50  0000 L CNN
F 2 "" H 20850 1750 60  0000 C CNN
F 3 "" H 20850 1750 60  0000 C CNN
	1    20850 1750
	1    0    0    -1  
$EndComp
Text Label 20400 1750 2    60   ~ 0
GND
$Comp
L CONN_01X01 TP4
U 1 1 5755249A
P 20850 2000
F 0 "TP4" H 20928 2038 50  0000 L CNN
F 1 "TESTPOINT" H 20928 1946 50  0000 L CNN
F 2 "" H 20850 2000 60  0000 C CNN
F 3 "" H 20850 2000 60  0000 C CNN
	1    20850 2000
	1    0    0    -1  
$EndComp
Text Label 20400 2000 2    60   ~ 0
DUT_GPIO2
$Comp
L CONN_01X01 TP5
U 1 1 5755253E
P 20850 2250
F 0 "TP5" H 20928 2288 50  0000 L CNN
F 1 "TESTPOINT" H 20928 2196 50  0000 L CNN
F 2 "" H 20850 2250 60  0000 C CNN
F 3 "" H 20850 2250 60  0000 C CNN
	1    20850 2250
	1    0    0    -1  
$EndComp
Text Label 20400 2250 2    60   ~ 0
DUT_GPIO3
$Comp
L CONN_01X01 TP6
U 1 1 5755295C
P 20850 2500
F 0 "TP6" H 20928 2538 50  0000 L CNN
F 1 "TESTPOINT" H 20928 2446 50  0000 L CNN
F 2 "" H 20850 2500 60  0000 C CNN
F 3 "" H 20850 2500 60  0000 C CNN
	1    20850 2500
	1    0    0    -1  
$EndComp
Text Label 20400 2500 2    60   ~ 0
DUT_GPIO4
$Comp
L CONN_01X01 TP7
U 1 1 57552964
P 20850 2750
F 0 "TP7" H 20928 2788 50  0000 L CNN
F 1 "TESTPOINT" H 20928 2696 50  0000 L CNN
F 2 "" H 20850 2750 60  0000 C CNN
F 3 "" H 20850 2750 60  0000 C CNN
	1    20850 2750
	1    0    0    -1  
$EndComp
Text Label 20400 2750 2    60   ~ 0
DUT_GPIO5
$Comp
L CONN_01X01 TP8
U 1 1 57552A96
P 20850 3000
F 0 "TP8" H 20928 3038 50  0000 L CNN
F 1 "TESTPOINT" H 20928 2946 50  0000 L CNN
F 2 "" H 20850 3000 60  0000 C CNN
F 3 "" H 20850 3000 60  0000 C CNN
	1    20850 3000
	1    0    0    -1  
$EndComp
Text Label 20400 3000 2    60   ~ 0
DUT_GPIO6
$Comp
L CONN_01X01 TP9
U 1 1 57552A9E
P 20850 3250
F 0 "TP9" H 20928 3288 50  0000 L CNN
F 1 "TESTPOINT" H 20928 3196 50  0000 L CNN
F 2 "" H 20850 3250 60  0000 C CNN
F 3 "" H 20850 3250 60  0000 C CNN
	1    20850 3250
	1    0    0    -1  
$EndComp
Text Label 20400 3250 2    60   ~ 0
DUT_GPIO7
$Comp
L CONN_01X01 TP10
U 1 1 57552AA6
P 20850 3500
F 0 "TP10" H 20928 3538 50  0000 L CNN
F 1 "TESTPOINT" H 20928 3446 50  0000 L CNN
F 2 "" H 20850 3500 60  0000 C CNN
F 3 "" H 20850 3500 60  0000 C CNN
	1    20850 3500
	1    0    0    -1  
$EndComp
Text Label 20400 3500 2    60   ~ 0
DUT_GPIO8
$Comp
L CONN_01X01 TP11
U 1 1 57552AAE
P 20850 3750
F 0 "TP11" H 20928 3788 50  0000 L CNN
F 1 "TESTPOINT" H 20928 3696 50  0000 L CNN
F 2 "" H 20850 3750 60  0000 C CNN
F 3 "" H 20850 3750 60  0000 C CNN
	1    20850 3750
	1    0    0    -1  
$EndComp
Text Label 20400 3750 2    60   ~ 0
DUT_GPIO9
$Comp
L CONN_01X01 TP12
U 1 1 57552BEC
P 20850 4000
F 0 "TP12" H 20928 4038 50  0000 L CNN
F 1 "TESTPOINT" H 20928 3946 50  0000 L CNN
F 2 "" H 20850 4000 60  0000 C CNN
F 3 "" H 20850 4000 60  0000 C CNN
	1    20850 4000
	1    0    0    -1  
$EndComp
Text Label 20400 4000 2    60   ~ 0
DUT_GPIO10
$Comp
L CONN_01X01 TP13
U 1 1 57552F95
P 20850 4250
F 0 "TP13" H 20928 4288 50  0000 L CNN
F 1 "TESTPOINT" H 20928 4196 50  0000 L CNN
F 2 "" H 20850 4250 60  0000 C CNN
F 3 "" H 20850 4250 60  0000 C CNN
	1    20850 4250
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 TP14
U 1 1 57552F9B
P 20850 4500
F 0 "TP14" H 20928 4538 50  0000 L CNN
F 1 "TESTPOINT" H 20928 4446 50  0000 L CNN
F 2 "" H 20850 4500 60  0000 C CNN
F 3 "" H 20850 4500 60  0000 C CNN
	1    20850 4500
	1    0    0    -1  
$EndComp
Text Label 20400 4500 2    60   ~ 0
DUT_GPIO13
$Comp
L CONN_01X01 TP15
U 1 1 57552FA3
P 20850 4750
F 0 "TP15" H 20928 4788 50  0000 L CNN
F 1 "TESTPOINT" H 20928 4696 50  0000 L CNN
F 2 "" H 20850 4750 60  0000 C CNN
F 3 "" H 20850 4750 60  0000 C CNN
	1    20850 4750
	1    0    0    -1  
$EndComp
Text Label 20400 4750 2    60   ~ 0
DUT_GPIO14
$Comp
L CONN_01X01 TP16
U 1 1 57552FAB
P 20850 5000
F 0 "TP16" H 20928 5038 50  0000 L CNN
F 1 "TESTPOINT" H 20928 4946 50  0000 L CNN
F 2 "" H 20850 5000 60  0000 C CNN
F 3 "" H 20850 5000 60  0000 C CNN
	1    20850 5000
	1    0    0    -1  
$EndComp
Text Label 20400 5000 2    60   ~ 0
DUT_GPIO15
$Comp
L CONN_01X01 TP17
U 1 1 57552FB3
P 20850 5250
F 0 "TP17" H 20928 5288 50  0000 L CNN
F 1 "TESTPOINT" H 20928 5196 50  0000 L CNN
F 2 "" H 20850 5250 60  0000 C CNN
F 3 "" H 20850 5250 60  0000 C CNN
	1    20850 5250
	1    0    0    -1  
$EndComp
Text Label 20400 5250 2    60   ~ 0
DUT_GPIO16
$Comp
L CONN_01X01 TP18
U 1 1 57552FBB
P 20850 5500
F 0 "TP18" H 20928 5538 50  0000 L CNN
F 1 "TESTPOINT" H 20928 5446 50  0000 L CNN
F 2 "" H 20850 5500 60  0000 C CNN
F 3 "" H 20850 5500 60  0000 C CNN
	1    20850 5500
	1    0    0    -1  
$EndComp
Text Label 20400 5500 2    60   ~ 0
DUT_GPIO17
$Comp
L CONN_01X01 TP19
U 1 1 57552FC3
P 20850 5750
F 0 "TP19" H 20928 5788 50  0000 L CNN
F 1 "TESTPOINT" H 20928 5696 50  0000 L CNN
F 2 "" H 20850 5750 60  0000 C CNN
F 3 "" H 20850 5750 60  0000 C CNN
	1    20850 5750
	1    0    0    -1  
$EndComp
Text Label 20400 5750 2    60   ~ 0
DUT_GPIO18
$Comp
L CONN_01X01 TP20
U 1 1 57552FCB
P 20850 6000
F 0 "TP20" H 20928 6038 50  0000 L CNN
F 1 "TESTPOINT" H 20928 5946 50  0000 L CNN
F 2 "" H 20850 6000 60  0000 C CNN
F 3 "" H 20850 6000 60  0000 C CNN
	1    20850 6000
	1    0    0    -1  
$EndComp
Text Label 20400 6000 2    60   ~ 0
DUT_GPIO19
$Comp
L CONN_01X01 TP21
U 1 1 57552FD3
P 20850 6250
F 0 "TP21" H 20928 6288 50  0000 L CNN
F 1 "TESTPOINT" H 20928 6196 50  0000 L CNN
F 2 "" H 20850 6250 60  0000 C CNN
F 3 "" H 20850 6250 60  0000 C CNN
	1    20850 6250
	1    0    0    -1  
$EndComp
Text Label 20400 6250 2    60   ~ 0
DUT_GPIO20
Text Label 20400 4250 2    60   ~ 0
DUT_GPIO12
$Comp
L CONN_01X01 TP33
U 1 1 5755D896
P 20850 6550
F 0 "TP33" H 20928 6588 50  0000 L CNN
F 1 "TESTPOINT" H 20928 6496 50  0000 L CNN
F 2 "" H 20850 6550 60  0000 C CNN
F 3 "" H 20850 6550 60  0000 C CNN
	1    20850 6550
	1    0    0    -1  
$EndComp
Text Label 20400 6550 2    60   ~ 0
DUT_VDD2_EN
$Comp
L SSM6N58NU_DUAL_NMOS Q13
U 1 1 5755DDB2
P 5500 6250
F 0 "Q13" H 5641 6303 60  0000 L CNN
F 1 "SSM6N58NU" H 5641 6197 60  0000 L CNN
F 2 "" H 5500 6250 60  0000 C CNN
F 3 "" H 5500 6250 60  0000 C CNN
	1    5500 6250
	1    0    0    -1  
$EndComp
$Comp
L R R151
U 1 1 5755DF26
P 5600 5750
F 0 "R151" H 5530 5704 50  0000 R CNN
F 1 "220" H 5530 5796 50  0000 R CNN
F 2 "" V 5530 5750 30  0000 C CNN
F 3 "" H 5600 5750 30  0000 C CNN
	1    5600 5750
	-1   0    0    1   
$EndComp
$Comp
L LED D21
U 1 1 5755E04B
P 5600 5250
F 0 "D21" V 5646 5142 50  0000 R CNN
F 1 "GREEN" V 5554 5142 50  0000 R CNN
F 2 "" H 5600 5250 60  0000 C CNN
F 3 "" H 5600 5250 60  0000 C CNN
	1    5600 5250
	0    -1   -1   0   
$EndComp
Text HLabel 4850 5050 0    60   Input ~ 0
3V3
Text Label 4850 6450 2    60   ~ 0
GND
Text Label 5300 6150 1    60   ~ 0
DUT_GPIO2
$Comp
L SSM6N58NU_DUAL_NMOS Q14
U 1 1 57561670
P 6450 6250
F 0 "Q14" H 6591 6303 60  0000 L CNN
F 1 "SSM6N58NU" H 6591 6197 60  0000 L CNN
F 2 "" H 6450 6250 60  0000 C CNN
F 3 "" H 6450 6250 60  0000 C CNN
	1    6450 6250
	1    0    0    -1  
$EndComp
$Comp
L R R153
U 1 1 57561676
P 6550 5750
F 0 "R153" H 6480 5704 50  0000 R CNN
F 1 "220" H 6480 5796 50  0000 R CNN
F 2 "" V 6480 5750 30  0000 C CNN
F 3 "" H 6550 5750 30  0000 C CNN
	1    6550 5750
	-1   0    0    1   
$EndComp
$Comp
L LED D23
U 1 1 5756167C
P 6550 5250
F 0 "D23" V 6596 5142 50  0000 R CNN
F 1 "GREEN" V 6504 5142 50  0000 R CNN
F 2 "" H 6550 5250 60  0000 C CNN
F 3 "" H 6550 5250 60  0000 C CNN
	1    6550 5250
	0    -1   -1   0   
$EndComp
Text Label 6250 6150 1    60   ~ 0
DUT_GPIO3
$Comp
L SSM6N58NU_DUAL_NMOS Q15
U 1 1 57561A98
P 7400 6250
F 0 "Q15" H 7541 6303 60  0000 L CNN
F 1 "SSM6N58NU" H 7541 6197 60  0000 L CNN
F 2 "" H 7400 6250 60  0000 C CNN
F 3 "" H 7400 6250 60  0000 C CNN
	1    7400 6250
	1    0    0    -1  
$EndComp
$Comp
L R R155
U 1 1 57561A9E
P 7500 5750
F 0 "R155" H 7430 5704 50  0000 R CNN
F 1 "220" H 7430 5796 50  0000 R CNN
F 2 "" V 7430 5750 30  0000 C CNN
F 3 "" H 7500 5750 30  0000 C CNN
	1    7500 5750
	-1   0    0    1   
$EndComp
$Comp
L LED D25
U 1 1 57561AA4
P 7500 5250
F 0 "D25" V 7546 5142 50  0000 R CNN
F 1 "GREEN" V 7454 5142 50  0000 R CNN
F 2 "" H 7500 5250 60  0000 C CNN
F 3 "" H 7500 5250 60  0000 C CNN
	1    7500 5250
	0    -1   -1   0   
$EndComp
Text Label 7200 6150 1    60   ~ 0
DUT_GPIO4
$Comp
L SSM6N58NU_DUAL_NMOS Q16
U 1 1 57561E74
P 8350 6250
F 0 "Q16" H 8491 6303 60  0000 L CNN
F 1 "SSM6N58NU" H 8491 6197 60  0000 L CNN
F 2 "" H 8350 6250 60  0000 C CNN
F 3 "" H 8350 6250 60  0000 C CNN
	1    8350 6250
	1    0    0    -1  
$EndComp
$Comp
L R R157
U 1 1 57561E7A
P 8450 5750
F 0 "R157" H 8380 5704 50  0000 R CNN
F 1 "220" H 8380 5796 50  0000 R CNN
F 2 "" V 8380 5750 30  0000 C CNN
F 3 "" H 8450 5750 30  0000 C CNN
	1    8450 5750
	-1   0    0    1   
$EndComp
$Comp
L LED D27
U 1 1 57561E80
P 8450 5250
F 0 "D27" V 8496 5142 50  0000 R CNN
F 1 "GREEN" V 8404 5142 50  0000 R CNN
F 2 "" H 8450 5250 60  0000 C CNN
F 3 "" H 8450 5250 60  0000 C CNN
	1    8450 5250
	0    -1   -1   0   
$EndComp
Text Label 8150 6150 1    60   ~ 0
DUT_GPIO5
$Comp
L SSM6N58NU_DUAL_NMOS Q17
U 1 1 57561E8A
P 9300 6250
F 0 "Q17" H 9441 6303 60  0000 L CNN
F 1 "SSM6N58NU" H 9441 6197 60  0000 L CNN
F 2 "" H 9300 6250 60  0000 C CNN
F 3 "" H 9300 6250 60  0000 C CNN
	1    9300 6250
	1    0    0    -1  
$EndComp
$Comp
L R R159
U 1 1 57561E90
P 9400 5750
F 0 "R159" H 9330 5704 50  0000 R CNN
F 1 "220" H 9330 5796 50  0000 R CNN
F 2 "" V 9330 5750 30  0000 C CNN
F 3 "" H 9400 5750 30  0000 C CNN
	1    9400 5750
	-1   0    0    1   
$EndComp
$Comp
L LED D29
U 1 1 57561E96
P 9400 5250
F 0 "D29" V 9446 5142 50  0000 R CNN
F 1 "GREEN" V 9354 5142 50  0000 R CNN
F 2 "" H 9400 5250 60  0000 C CNN
F 3 "" H 9400 5250 60  0000 C CNN
	1    9400 5250
	0    -1   -1   0   
$EndComp
Text Label 9100 6150 1    60   ~ 0
DUT_GPIO6
$Comp
L SSM6N58NU_DUAL_NMOS Q18
U 1 1 57562932
P 10250 6250
F 0 "Q18" H 10391 6303 60  0000 L CNN
F 1 "SSM6N58NU" H 10391 6197 60  0000 L CNN
F 2 "" H 10250 6250 60  0000 C CNN
F 3 "" H 10250 6250 60  0000 C CNN
	1    10250 6250
	1    0    0    -1  
$EndComp
$Comp
L R R161
U 1 1 57562938
P 10350 5750
F 0 "R161" H 10280 5704 50  0000 R CNN
F 1 "220" H 10280 5796 50  0000 R CNN
F 2 "" V 10280 5750 30  0000 C CNN
F 3 "" H 10350 5750 30  0000 C CNN
	1    10350 5750
	-1   0    0    1   
$EndComp
$Comp
L LED D31
U 1 1 5756293E
P 10350 5250
F 0 "D31" V 10396 5142 50  0000 R CNN
F 1 "GREEN" V 10304 5142 50  0000 R CNN
F 2 "" H 10350 5250 60  0000 C CNN
F 3 "" H 10350 5250 60  0000 C CNN
	1    10350 5250
	0    -1   -1   0   
$EndComp
Text Label 10050 6150 1    60   ~ 0
DUT_GPIO7
$Comp
L SSM6N58NU_DUAL_NMOS Q19
U 1 1 57562948
P 11200 6250
F 0 "Q19" H 11341 6303 60  0000 L CNN
F 1 "SSM6N58NU" H 11341 6197 60  0000 L CNN
F 2 "" H 11200 6250 60  0000 C CNN
F 3 "" H 11200 6250 60  0000 C CNN
	1    11200 6250
	1    0    0    -1  
$EndComp
$Comp
L R R163
U 1 1 5756294E
P 11300 5750
F 0 "R163" H 11230 5704 50  0000 R CNN
F 1 "220" H 11230 5796 50  0000 R CNN
F 2 "" V 11230 5750 30  0000 C CNN
F 3 "" H 11300 5750 30  0000 C CNN
	1    11300 5750
	-1   0    0    1   
$EndComp
$Comp
L LED D33
U 1 1 57562954
P 11300 5250
F 0 "D33" V 11346 5142 50  0000 R CNN
F 1 "GREEN" V 11254 5142 50  0000 R CNN
F 2 "" H 11300 5250 60  0000 C CNN
F 3 "" H 11300 5250 60  0000 C CNN
	1    11300 5250
	0    -1   -1   0   
$EndComp
Text Label 11000 6150 1    60   ~ 0
DUT_GPIO8
$Comp
L SSM6N58NU_DUAL_NMOS Q11
U 2 1 5756295E
P 12150 6250
F 0 "Q11" H 12291 6303 60  0000 L CNN
F 1 "SSM6N58NU" H 12291 6197 60  0000 L CNN
F 2 "" H 12150 6250 60  0000 C CNN
F 3 "" H 12150 6250 60  0000 C CNN
	2    12150 6250
	1    0    0    -1  
$EndComp
$Comp
L R R165
U 1 1 57562964
P 12250 5750
F 0 "R165" H 12180 5704 50  0000 R CNN
F 1 "220" H 12180 5796 50  0000 R CNN
F 2 "" V 12180 5750 30  0000 C CNN
F 3 "" H 12250 5750 30  0000 C CNN
	1    12250 5750
	-1   0    0    1   
$EndComp
$Comp
L LED D35
U 1 1 5756296A
P 12250 5250
F 0 "D35" V 12296 5142 50  0000 R CNN
F 1 "GREEN" V 12204 5142 50  0000 R CNN
F 2 "" H 12250 5250 60  0000 C CNN
F 3 "" H 12250 5250 60  0000 C CNN
	1    12250 5250
	0    -1   -1   0   
$EndComp
Text Label 11950 6150 1    60   ~ 0
DUT_GPIO9
$Comp
L SSM6N58NU_DUAL_NMOS Q20
U 2 1 57562974
P 13100 6250
F 0 "Q20" H 13241 6303 60  0000 L CNN
F 1 "SSM6N58NU" H 13241 6197 60  0000 L CNN
F 2 "" H 13100 6250 60  0000 C CNN
F 3 "" H 13100 6250 60  0000 C CNN
	2    13100 6250
	1    0    0    -1  
$EndComp
$Comp
L R R167
U 1 1 5756297A
P 13200 5750
F 0 "R167" H 13130 5704 50  0000 R CNN
F 1 "220" H 13130 5796 50  0000 R CNN
F 2 "" V 13130 5750 30  0000 C CNN
F 3 "" H 13200 5750 30  0000 C CNN
	1    13200 5750
	-1   0    0    1   
$EndComp
$Comp
L LED D37
U 1 1 57562980
P 13200 5250
F 0 "D37" V 13246 5142 50  0000 R CNN
F 1 "GREEN" V 13154 5142 50  0000 R CNN
F 2 "" H 13200 5250 60  0000 C CNN
F 3 "" H 13200 5250 60  0000 C CNN
	1    13200 5250
	0    -1   -1   0   
$EndComp
Text Label 12900 6150 1    60   ~ 0
DUT_GPIO10
$Comp
L SSM6N58NU_DUAL_NMOS Q13
U 2 1 575647A4
P 5500 7950
F 0 "Q13" H 5641 8003 60  0000 L CNN
F 1 "SSM6N58NU" H 5641 7897 60  0000 L CNN
F 2 "" H 5500 7950 60  0000 C CNN
F 3 "" H 5500 7950 60  0000 C CNN
	2    5500 7950
	1    0    0    -1  
$EndComp
$Comp
L R R152
U 1 1 575647AA
P 5600 7450
F 0 "R152" H 5530 7404 50  0000 R CNN
F 1 "220" H 5530 7496 50  0000 R CNN
F 2 "" V 5530 7450 30  0000 C CNN
F 3 "" H 5600 7450 30  0000 C CNN
	1    5600 7450
	-1   0    0    1   
$EndComp
$Comp
L LED D22
U 1 1 575647B0
P 5600 6950
F 0 "D22" V 5646 6842 50  0000 R CNN
F 1 "GREEN" V 5554 6842 50  0000 R CNN
F 2 "" H 5600 6950 60  0000 C CNN
F 3 "" H 5600 6950 60  0000 C CNN
	1    5600 6950
	0    -1   -1   0   
$EndComp
Text Label 4850 8150 2    60   ~ 0
GND
Text Label 5300 7850 1    60   ~ 0
DUT_GPIO12
$Comp
L SSM6N58NU_DUAL_NMOS Q14
U 2 1 575647BE
P 6450 7950
F 0 "Q14" H 6591 8003 60  0000 L CNN
F 1 "SSM6N58NU" H 6591 7897 60  0000 L CNN
F 2 "" H 6450 7950 60  0000 C CNN
F 3 "" H 6450 7950 60  0000 C CNN
	2    6450 7950
	1    0    0    -1  
$EndComp
$Comp
L R R154
U 1 1 575647C4
P 6550 7450
F 0 "R154" H 6480 7404 50  0000 R CNN
F 1 "220" H 6480 7496 50  0000 R CNN
F 2 "" V 6480 7450 30  0000 C CNN
F 3 "" H 6550 7450 30  0000 C CNN
	1    6550 7450
	-1   0    0    1   
$EndComp
$Comp
L LED D24
U 1 1 575647CA
P 6550 6950
F 0 "D24" V 6596 6842 50  0000 R CNN
F 1 "GREEN" V 6504 6842 50  0000 R CNN
F 2 "" H 6550 6950 60  0000 C CNN
F 3 "" H 6550 6950 60  0000 C CNN
	1    6550 6950
	0    -1   -1   0   
$EndComp
Text Label 6250 7850 1    60   ~ 0
DUT_GPIO13
$Comp
L SSM6N58NU_DUAL_NMOS Q15
U 2 1 575647D4
P 7400 7950
F 0 "Q15" H 7541 8003 60  0000 L CNN
F 1 "SSM6N58NU" H 7541 7897 60  0000 L CNN
F 2 "" H 7400 7950 60  0000 C CNN
F 3 "" H 7400 7950 60  0000 C CNN
	2    7400 7950
	1    0    0    -1  
$EndComp
$Comp
L R R156
U 1 1 575647DA
P 7500 7450
F 0 "R156" H 7430 7404 50  0000 R CNN
F 1 "220" H 7430 7496 50  0000 R CNN
F 2 "" V 7430 7450 30  0000 C CNN
F 3 "" H 7500 7450 30  0000 C CNN
	1    7500 7450
	-1   0    0    1   
$EndComp
$Comp
L LED D26
U 1 1 575647E0
P 7500 6950
F 0 "D26" V 7546 6842 50  0000 R CNN
F 1 "GREEN" V 7454 6842 50  0000 R CNN
F 2 "" H 7500 6950 60  0000 C CNN
F 3 "" H 7500 6950 60  0000 C CNN
	1    7500 6950
	0    -1   -1   0   
$EndComp
Text Label 7200 7850 1    60   ~ 0
DUT_GPIO14
$Comp
L SSM6N58NU_DUAL_NMOS Q16
U 2 1 575647EA
P 8350 7950
F 0 "Q16" H 8491 8003 60  0000 L CNN
F 1 "SSM6N58NU" H 8491 7897 60  0000 L CNN
F 2 "" H 8350 7950 60  0000 C CNN
F 3 "" H 8350 7950 60  0000 C CNN
	2    8350 7950
	1    0    0    -1  
$EndComp
$Comp
L R R158
U 1 1 575647F0
P 8450 7450
F 0 "R158" H 8380 7404 50  0000 R CNN
F 1 "220" H 8380 7496 50  0000 R CNN
F 2 "" V 8380 7450 30  0000 C CNN
F 3 "" H 8450 7450 30  0000 C CNN
	1    8450 7450
	-1   0    0    1   
$EndComp
$Comp
L LED D28
U 1 1 575647F6
P 8450 6950
F 0 "D28" V 8496 6842 50  0000 R CNN
F 1 "GREEN" V 8404 6842 50  0000 R CNN
F 2 "" H 8450 6950 60  0000 C CNN
F 3 "" H 8450 6950 60  0000 C CNN
	1    8450 6950
	0    -1   -1   0   
$EndComp
Text Label 8150 7850 1    60   ~ 0
DUT_GPIO15
$Comp
L SSM6N58NU_DUAL_NMOS Q17
U 2 1 57564800
P 9300 7950
F 0 "Q17" H 9441 8003 60  0000 L CNN
F 1 "SSM6N58NU" H 9441 7897 60  0000 L CNN
F 2 "" H 9300 7950 60  0000 C CNN
F 3 "" H 9300 7950 60  0000 C CNN
	2    9300 7950
	1    0    0    -1  
$EndComp
$Comp
L R R160
U 1 1 57564806
P 9400 7450
F 0 "R160" H 9330 7404 50  0000 R CNN
F 1 "220" H 9330 7496 50  0000 R CNN
F 2 "" V 9330 7450 30  0000 C CNN
F 3 "" H 9400 7450 30  0000 C CNN
	1    9400 7450
	-1   0    0    1   
$EndComp
$Comp
L LED D30
U 1 1 5756480C
P 9400 6950
F 0 "D30" V 9446 6842 50  0000 R CNN
F 1 "GREEN" V 9354 6842 50  0000 R CNN
F 2 "" H 9400 6950 60  0000 C CNN
F 3 "" H 9400 6950 60  0000 C CNN
	1    9400 6950
	0    -1   -1   0   
$EndComp
Text Label 9100 7850 1    60   ~ 0
DUT_GPIO16
$Comp
L SSM6N58NU_DUAL_NMOS Q18
U 2 1 57564816
P 10250 7950
F 0 "Q18" H 10391 8003 60  0000 L CNN
F 1 "SSM6N58NU" H 10391 7897 60  0000 L CNN
F 2 "" H 10250 7950 60  0000 C CNN
F 3 "" H 10250 7950 60  0000 C CNN
	2    10250 7950
	1    0    0    -1  
$EndComp
$Comp
L R R162
U 1 1 5756481C
P 10350 7450
F 0 "R162" H 10280 7404 50  0000 R CNN
F 1 "220" H 10280 7496 50  0000 R CNN
F 2 "" V 10280 7450 30  0000 C CNN
F 3 "" H 10350 7450 30  0000 C CNN
	1    10350 7450
	-1   0    0    1   
$EndComp
$Comp
L LED D32
U 1 1 57564822
P 10350 6950
F 0 "D32" V 10396 6842 50  0000 R CNN
F 1 "GREEN" V 10304 6842 50  0000 R CNN
F 2 "" H 10350 6950 60  0000 C CNN
F 3 "" H 10350 6950 60  0000 C CNN
	1    10350 6950
	0    -1   -1   0   
$EndComp
Text Label 10050 7850 1    60   ~ 0
DUT_GPIO17
$Comp
L SSM6N58NU_DUAL_NMOS Q19
U 2 1 5756482C
P 11200 7950
F 0 "Q19" H 11341 8003 60  0000 L CNN
F 1 "SSM6N58NU" H 11341 7897 60  0000 L CNN
F 2 "" H 11200 7950 60  0000 C CNN
F 3 "" H 11200 7950 60  0000 C CNN
	2    11200 7950
	1    0    0    -1  
$EndComp
$Comp
L R R164
U 1 1 57564832
P 11300 7450
F 0 "R164" H 11230 7404 50  0000 R CNN
F 1 "220" H 11230 7496 50  0000 R CNN
F 2 "" V 11230 7450 30  0000 C CNN
F 3 "" H 11300 7450 30  0000 C CNN
	1    11300 7450
	-1   0    0    1   
$EndComp
$Comp
L LED D34
U 1 1 57564838
P 11300 6950
F 0 "D34" V 11346 6842 50  0000 R CNN
F 1 "GREEN" V 11254 6842 50  0000 R CNN
F 2 "" H 11300 6950 60  0000 C CNN
F 3 "" H 11300 6950 60  0000 C CNN
	1    11300 6950
	0    -1   -1   0   
$EndComp
Text Label 11000 7850 1    60   ~ 0
DUT_GPIO18
$Comp
L SSM6N58NU_DUAL_NMOS Q20
U 1 1 57564842
P 12150 7950
F 0 "Q20" H 12291 8003 60  0000 L CNN
F 1 "SSM6N58NU" H 12291 7897 60  0000 L CNN
F 2 "" H 12150 7950 60  0000 C CNN
F 3 "" H 12150 7950 60  0000 C CNN
	1    12150 7950
	1    0    0    -1  
$EndComp
$Comp
L R R166
U 1 1 57564848
P 12250 7450
F 0 "R166" H 12180 7404 50  0000 R CNN
F 1 "220" H 12180 7496 50  0000 R CNN
F 2 "" V 12180 7450 30  0000 C CNN
F 3 "" H 12250 7450 30  0000 C CNN
	1    12250 7450
	-1   0    0    1   
$EndComp
$Comp
L LED D36
U 1 1 5756484E
P 12250 6950
F 0 "D36" V 12296 6842 50  0000 R CNN
F 1 "GREEN" V 12204 6842 50  0000 R CNN
F 2 "" H 12250 6950 60  0000 C CNN
F 3 "" H 12250 6950 60  0000 C CNN
	1    12250 6950
	0    -1   -1   0   
$EndComp
Text Label 11950 7850 1    60   ~ 0
DUT_GPIO19
$Comp
L SSM6N58NU_DUAL_NMOS Q21
U 1 1 57564858
P 13100 7950
F 0 "Q21" H 13241 8003 60  0000 L CNN
F 1 "SSM6N58NU" H 13241 7897 60  0000 L CNN
F 2 "" H 13100 7950 60  0000 C CNN
F 3 "" H 13100 7950 60  0000 C CNN
	1    13100 7950
	1    0    0    -1  
$EndComp
$Comp
L R R168
U 1 1 5756485E
P 13200 7450
F 0 "R168" H 13130 7404 50  0000 R CNN
F 1 "220" H 13130 7496 50  0000 R CNN
F 2 "" V 13130 7450 30  0000 C CNN
F 3 "" H 13200 7450 30  0000 C CNN
	1    13200 7450
	-1   0    0    1   
$EndComp
$Comp
L LED D38
U 1 1 57564864
P 13200 6950
F 0 "D38" V 13246 6842 50  0000 R CNN
F 1 "GREEN" V 13154 6842 50  0000 R CNN
F 2 "" H 13200 6950 60  0000 C CNN
F 3 "" H 13200 6950 60  0000 C CNN
	1    13200 6950
	0    -1   -1   0   
$EndComp
Text Label 12900 7850 1    60   ~ 0
DUT_GPIO20
Text Label 4850 6750 2    60   ~ 0
3V3
$Comp
L R R178
U 1 1 5769FE4E
P 3100 950
F 0 "R178" V 3000 900 50  0000 C CNN
F 1 "1" V 3100 950 50  0000 C CNN
F 2 "" V 3030 950 30  0000 C CNN
F 3 "" H 3100 950 30  0000 C CNN
	1    3100 950 
	0    1    1    0   
$EndComp
Text HLabel 3350 700  2    60   Output ~ 0
VDD1_SHUNT_HI
Wire Wire Line
	1600 950  2950 950 
Wire Wire Line
	1600 1050 2400 1050
Wire Wire Line
	1900 1950 1600 1950
Wire Wire Line
	1600 1150 2400 1150
Wire Wire Line
	2400 1250 1600 1250
Wire Wire Line
	1600 1350 2400 1350
Wire Wire Line
	2400 1450 1600 1450
Wire Wire Line
	1600 1550 2400 1550
Wire Wire Line
	2400 1650 1600 1650
Wire Wire Line
	1600 1750 2400 1750
Wire Wire Line
	2400 1850 1600 1850
Wire Wire Line
	2400 2050 1600 2050
Wire Wire Line
	1600 2150 2400 2150
Wire Wire Line
	2400 2250 1600 2250
Wire Wire Line
	1600 2350 2400 2350
Wire Wire Line
	2400 2450 1600 2450
Wire Wire Line
	1600 2550 2400 2550
Wire Wire Line
	2400 2650 1600 2650
Wire Wire Line
	2400 2750 1600 2750
Wire Wire Line
	1600 2850 2400 2850
Wire Wire Line
	5050 1600 5550 1600
Wire Wire Line
	5050 1900 5550 1900
Wire Wire Line
	5550 1800 5450 1800
Wire Wire Line
	5450 1800 5450 1900
Connection ~ 5450 1900
Connection ~ 5250 1900
Connection ~ 5250 1600
Wire Wire Line
	6550 1600 7450 1600
Wire Wire Line
	6600 1900 6750 1900
Wire Wire Line
	5250 2100 5550 2100
Connection ~ 6750 1600
Wire Wire Line
	1900 3400 1600 3400
Wire Wire Line
	1600 3500 2500 3500
Wire Wire Line
	1900 3600 1600 3600
Wire Wire Line
	1600 3700 1900 3700
Wire Wire Line
	1900 3800 1600 3800
Wire Wire Line
	1600 3900 1900 3900
Wire Wire Line
	1900 4000 1600 4000
Wire Wire Line
	1600 4100 1900 4100
Wire Wire Line
	1900 4200 1600 4200
Wire Wire Line
	1600 4300 1900 4300
Wire Wire Line
	1900 4400 1600 4400
Wire Wire Line
	1600 4500 1900 4500
Wire Wire Line
	1900 4600 1600 4600
Wire Wire Line
	1600 4700 1900 4700
Wire Wire Line
	1600 4800 1900 4800
Wire Wire Line
	1900 4900 1600 4900
Wire Wire Line
	1600 5000 1900 5000
Wire Wire Line
	1900 5100 1600 5100
Wire Wire Line
	1600 5200 1900 5200
Wire Wire Line
	1600 5300 1900 5300
Wire Wire Line
	20650 1250 20400 1250
Wire Wire Line
	20650 1500 20400 1500
Wire Wire Line
	20650 1750 20400 1750
Wire Wire Line
	20650 2000 20400 2000
Wire Wire Line
	20650 2250 20400 2250
Wire Wire Line
	20650 2500 20400 2500
Wire Wire Line
	20650 2750 20400 2750
Wire Wire Line
	20650 3000 20400 3000
Wire Wire Line
	20650 3250 20400 3250
Wire Wire Line
	20650 3500 20400 3500
Wire Wire Line
	20650 3750 20400 3750
Wire Wire Line
	20650 4000 20400 4000
Wire Wire Line
	20650 4500 20400 4500
Wire Wire Line
	20650 4750 20400 4750
Wire Wire Line
	20650 5000 20400 5000
Wire Wire Line
	20650 5250 20400 5250
Wire Wire Line
	20650 5500 20400 5500
Wire Wire Line
	20650 5750 20400 5750
Wire Wire Line
	20650 6000 20400 6000
Wire Wire Line
	20650 6250 20400 6250
Wire Wire Line
	20400 4250 20650 4250
Wire Wire Line
	20650 6550 20400 6550
Wire Wire Line
	5600 5450 5600 5600
Wire Wire Line
	5600 5900 5600 6050
Wire Wire Line
	4850 6450 13200 6450
Wire Wire Line
	4850 5050 13200 5050
Wire Wire Line
	5300 6150 5300 6250
Wire Wire Line
	6550 5450 6550 5600
Wire Wire Line
	6550 5900 6550 6050
Wire Wire Line
	6250 6150 6250 6250
Wire Wire Line
	7500 5450 7500 5600
Wire Wire Line
	7500 5900 7500 6050
Wire Wire Line
	7200 6150 7200 6250
Wire Wire Line
	8450 5450 8450 5600
Wire Wire Line
	8450 5900 8450 6050
Wire Wire Line
	8150 6150 8150 6250
Wire Wire Line
	9400 5450 9400 5600
Wire Wire Line
	9400 5900 9400 6050
Wire Wire Line
	9100 6150 9100 6250
Wire Wire Line
	10350 5450 10350 5600
Wire Wire Line
	10350 5900 10350 6050
Wire Wire Line
	10050 6150 10050 6250
Wire Wire Line
	11300 5450 11300 5600
Wire Wire Line
	11300 5900 11300 6050
Wire Wire Line
	11000 6150 11000 6250
Wire Wire Line
	12250 5450 12250 5600
Wire Wire Line
	12250 5900 12250 6050
Wire Wire Line
	11950 6150 11950 6250
Wire Wire Line
	13200 5450 13200 5600
Wire Wire Line
	13200 5900 13200 6050
Wire Wire Line
	12900 6150 12900 6250
Connection ~ 5600 5050
Connection ~ 6550 5050
Connection ~ 7500 5050
Connection ~ 8450 5050
Connection ~ 9400 5050
Connection ~ 10350 5050
Connection ~ 11300 5050
Connection ~ 12250 5050
Connection ~ 12250 6450
Connection ~ 11300 6450
Connection ~ 10350 6450
Connection ~ 9400 6450
Connection ~ 8450 6450
Connection ~ 5600 6450
Connection ~ 7500 6450
Connection ~ 6550 6450
Wire Wire Line
	5600 7150 5600 7300
Wire Wire Line
	5600 7600 5600 7750
Wire Wire Line
	4850 8150 13200 8150
Wire Wire Line
	4850 6750 13200 6750
Wire Wire Line
	5300 7850 5300 7950
Wire Wire Line
	6550 7150 6550 7300
Wire Wire Line
	6550 7600 6550 7750
Wire Wire Line
	6250 7850 6250 7950
Wire Wire Line
	7500 7150 7500 7300
Wire Wire Line
	7500 7600 7500 7750
Wire Wire Line
	7200 7850 7200 7950
Wire Wire Line
	8450 7150 8450 7300
Wire Wire Line
	8450 7600 8450 7750
Wire Wire Line
	8150 7850 8150 7950
Wire Wire Line
	9400 7150 9400 7300
Wire Wire Line
	9400 7600 9400 7750
Wire Wire Line
	9100 7850 9100 7950
Wire Wire Line
	10350 7150 10350 7300
Wire Wire Line
	10350 7600 10350 7750
Wire Wire Line
	10050 7850 10050 7950
Wire Wire Line
	11300 7150 11300 7300
Wire Wire Line
	11300 7600 11300 7750
Wire Wire Line
	11000 7850 11000 7950
Wire Wire Line
	12250 7150 12250 7300
Wire Wire Line
	12250 7600 12250 7750
Wire Wire Line
	11950 7850 11950 7950
Wire Wire Line
	13200 7150 13200 7300
Wire Wire Line
	13200 7600 13200 7750
Wire Wire Line
	12900 7850 12900 7950
Connection ~ 5600 6750
Connection ~ 6550 6750
Connection ~ 7500 6750
Connection ~ 8450 6750
Connection ~ 9400 6750
Connection ~ 10350 6750
Connection ~ 11300 6750
Connection ~ 12250 6750
Connection ~ 12250 8150
Connection ~ 11300 8150
Connection ~ 10350 8150
Connection ~ 9400 8150
Connection ~ 8450 8150
Connection ~ 5600 8150
Connection ~ 7500 8150
Connection ~ 6550 8150
Wire Wire Line
	3500 950  3250 950 
Wire Wire Line
	3350 700  3350 950 
Connection ~ 3350 950 
Text HLabel 2800 700  0    60   Output ~ 0
VDD1_SHUNT_LO
Wire Wire Line
	2800 700  2800 950 
Connection ~ 2800 950 
Text HLabel 7350 1400 0    60   Output ~ 0
VDD2_SHUNT_HI
$Comp
L R R180
U 1 1 576A379D
P 7600 1600
F 0 "R180" V 7500 1550 50  0000 C CNN
F 1 "1" V 7600 1600 50  0000 C CNN
F 2 "" V 7530 1600 30  0000 C CNN
F 3 "" H 7600 1600 30  0000 C CNN
	1    7600 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	7900 1600 7750 1600
Wire Wire Line
	7350 1400 7350 1600
Connection ~ 7350 1600
Text HLabel 7800 1400 2    60   Output ~ 0
VDD2_SHUNT_LO
Wire Wire Line
	7800 1400 7800 1600
Connection ~ 7800 1600
Text Notes 7350 1250 0    60   ~ 0
1 mA = 1000 uV\nWith gain of 100, 100 mV out per mA\n\nFull scale = 1.0V, 97.6 uV/LSB\nFull scale = 100 mA so 9.7 uA / LSB
$EndSCHEMATC
