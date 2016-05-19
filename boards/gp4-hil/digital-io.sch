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
Sheet 7 7
Title "GreenPak Hardware-In-Loop Test Platform"
Date "2016-05-19"
Rev "0.1"
Comp "Andrew Zonenberg"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 7500 1500 0    60   Input ~ 0
GND
Text HLabel 1750 10950 0    60   BiDi ~ 0
DUT_GPIO2
Text HLabel 1500 800  0    60   BiDi ~ 0
DUT_GPIO3
Text HLabel 1500 1300 0    60   BiDi ~ 0
DUT_GPIO4
Text HLabel 1500 1800 0    60   BiDi ~ 0
DUT_GPIO5
Text HLabel 1500 2300 0    60   BiDi ~ 0
DUT_GPIO6
Text HLabel 1500 2800 0    60   BiDi ~ 0
DUT_GPIO7
Text HLabel 1500 3300 0    60   BiDi ~ 0
DUT_GPIO8
Text HLabel 1500 3800 0    60   BiDi ~ 0
DUT_GPIO9
Text HLabel 1500 4300 0    60   BiDi ~ 0
DUT_GPIO10
Text HLabel 1500 4800 0    60   BiDi ~ 0
DUT_GPIO12
Text HLabel 1500 5300 0    60   BiDi ~ 0
DUT_GPIO13
Text HLabel 1500 5800 0    60   BiDi ~ 0
DUT_GPIO14
Text HLabel 1500 6300 0    60   BiDi ~ 0
DUT_GPIO15
Text HLabel 1500 6800 0    60   BiDi ~ 0
DUT_GPIO16
Text HLabel 1500 7300 0    60   BiDi ~ 0
DUT_GPIO17
Text HLabel 1500 7800 0    60   BiDi ~ 0
DUT_GPIO18
Text HLabel 1500 8300 0    60   BiDi ~ 0
DUT_GPIO19
Text HLabel 1500 8800 0    60   BiDi ~ 0
DUT_GPIO20
$Comp
L XC7AxT-xFTG256x U?
U 5 1 573B2962
P 16350 7550
AR Path="/57316B0C/573B2962" Ref="U?"  Part="1" 
AR Path="/573AABB3/573B2962" Ref="U2"  Part="5" 
F 0 "U2" H 16350 7350 60  0000 L CNN
F 1 "XC7A100T-1FTG256C" H 16350 7450 60  0000 L CNN
F 2 "" H 16350 7550 60  0000 C CNN
F 3 "" H 16350 7550 60  0000 C CNN
	5    16350 7550
	1    0    0    -1  
$EndComp
$Comp
L XC7AxT-xFTG256x U?
U 6 1 573B2D61
P 19350 7550
AR Path="/57316B0C/573B2D61" Ref="U?"  Part="1" 
AR Path="/573AABB3/573B2D61" Ref="U2"  Part="6" 
F 0 "U2" H 19350 7350 60  0000 L CNN
F 1 "XC7A100T-1FTG256C" H 19350 7450 60  0000 L CNN
F 2 "" H 19350 7550 60  0000 C CNN
F 3 "" H 19350 7550 60  0000 C CNN
	6    19350 7550
	1    0    0    -1  
$EndComp
$Comp
L TS3A4751 U15
U 1 1 573B348E
P 1900 1050
F 0 "U15" H 1900 1000 60  0000 L CNN
F 1 "TS3A4751" H 2650 1100 60  0000 C CNN
F 2 "" H 1900 1050 60  0000 C CNN
F 3 "" H 1900 1050 60  0000 C CNN
	1    1900 1050
	1    0    0    -1  
$EndComp
$Comp
L TS3A4751 U15
U 2 1 573B42E7
P 1900 1550
F 0 "U15" H 1900 1500 60  0000 L CNN
F 1 "TS3A4751" H 2650 1600 60  0000 C CNN
F 2 "" H 1900 1550 60  0000 C CNN
F 3 "" H 1900 1550 60  0000 C CNN
	2    1900 1550
	1    0    0    -1  
$EndComp
Text Label 1500 1000 2    60   ~ 0
GPIO3_DEN
Text Label 2800 800  0    60   ~ 0
GPIO3_DIO
$Comp
L TS3A4751 U15
U 3 1 573B433E
P 1900 2050
F 0 "U15" H 1900 2000 60  0000 L CNN
F 1 "TS3A4751" H 2650 2100 60  0000 C CNN
F 2 "" H 1900 2050 60  0000 C CNN
F 3 "" H 1900 2050 60  0000 C CNN
	3    1900 2050
	1    0    0    -1  
$EndComp
Text Label 1500 1500 2    60   ~ 0
GPIO4_DEN
Text Label 2800 1300 0    60   ~ 0
GPIO4_DIO
$Comp
L TS3A4751 U15
U 4 1 573B4541
P 1900 2550
F 0 "U15" H 1900 2500 60  0000 L CNN
F 1 "TS3A4751" H 2650 2600 60  0000 C CNN
F 2 "" H 1900 2550 60  0000 C CNN
F 3 "" H 1900 2550 60  0000 C CNN
	4    1900 2550
	1    0    0    -1  
$EndComp
Text Label 1500 2000 2    60   ~ 0
GPIO5_DEN
Text Label 2800 1800 0    60   ~ 0
GPIO5_DIO
$Comp
L TS3A4751 U16
U 1 1 573B454C
P 1900 3050
F 0 "U16" H 1900 3000 60  0000 L CNN
F 1 "TS3A4751" H 2650 3100 60  0000 C CNN
F 2 "" H 1900 3050 60  0000 C CNN
F 3 "" H 1900 3050 60  0000 C CNN
	1    1900 3050
	1    0    0    -1  
$EndComp
Text Label 1500 2500 2    60   ~ 0
GPIO6_DEN
Text Label 2800 2300 0    60   ~ 0
GPIO6_DIO
$Comp
L TS3A4751 U16
U 2 1 573B471C
P 1900 3550
F 0 "U16" H 1900 3500 60  0000 L CNN
F 1 "TS3A4751" H 2650 3600 60  0000 C CNN
F 2 "" H 1900 3550 60  0000 C CNN
F 3 "" H 1900 3550 60  0000 C CNN
	2    1900 3550
	1    0    0    -1  
$EndComp
Text Label 1500 3000 2    60   ~ 0
GPIO7_DEN
Text Label 2800 2800 0    60   ~ 0
GPIO7_DIO
$Comp
L TS3A4751 U16
U 3 1 573B4727
P 1900 4050
F 0 "U16" H 1900 4000 60  0000 L CNN
F 1 "TS3A4751" H 2650 4100 60  0000 C CNN
F 2 "" H 1900 4050 60  0000 C CNN
F 3 "" H 1900 4050 60  0000 C CNN
	3    1900 4050
	1    0    0    -1  
$EndComp
Text Label 1500 3500 2    60   ~ 0
GPIO8_DEN
Text Label 2800 3300 0    60   ~ 0
GPIO8_DIO
$Comp
L TS3A4751 U16
U 4 1 573B4732
P 1900 4550
F 0 "U16" H 1900 4500 60  0000 L CNN
F 1 "TS3A4751" H 2650 4600 60  0000 C CNN
F 2 "" H 1900 4550 60  0000 C CNN
F 3 "" H 1900 4550 60  0000 C CNN
	4    1900 4550
	1    0    0    -1  
$EndComp
Text Label 1500 4000 2    60   ~ 0
GPIO9_DEN
Text Label 2800 3800 0    60   ~ 0
GPIO9_DIO
$Comp
L TS3A4751 U17
U 1 1 573B473D
P 1900 5050
F 0 "U17" H 1900 5000 60  0000 L CNN
F 1 "TS3A4751" H 2650 5100 60  0000 C CNN
F 2 "" H 1900 5050 60  0000 C CNN
F 3 "" H 1900 5050 60  0000 C CNN
	1    1900 5050
	1    0    0    -1  
$EndComp
Text Label 1500 4500 2    60   ~ 0
GPIO10_DEN
Text Label 2800 4300 0    60   ~ 0
GPIO10_DIO
$Comp
L TS3A4751 U17
U 2 1 573B5282
P 1900 5550
F 0 "U17" H 1900 5500 60  0000 L CNN
F 1 "TS3A4751" H 2650 5600 60  0000 C CNN
F 2 "" H 1900 5550 60  0000 C CNN
F 3 "" H 1900 5550 60  0000 C CNN
	2    1900 5550
	1    0    0    -1  
$EndComp
Text Label 1500 5000 2    60   ~ 0
GPIO12_DEN
Text Label 2800 4800 0    60   ~ 0
GPIO12_DIO
$Comp
L TS3A4751 U17
U 3 1 573B528D
P 1900 6050
F 0 "U17" H 1900 6000 60  0000 L CNN
F 1 "TS3A4751" H 2650 6100 60  0000 C CNN
F 2 "" H 1900 6050 60  0000 C CNN
F 3 "" H 1900 6050 60  0000 C CNN
	3    1900 6050
	1    0    0    -1  
$EndComp
Text Label 1500 5500 2    60   ~ 0
GPIO13_DEN
Text Label 2800 5300 0    60   ~ 0
GPIO13_DIO
$Comp
L TS3A4751 U17
U 4 1 573B5298
P 1900 6550
F 0 "U17" H 1900 6500 60  0000 L CNN
F 1 "TS3A4751" H 2650 6600 60  0000 C CNN
F 2 "" H 1900 6550 60  0000 C CNN
F 3 "" H 1900 6550 60  0000 C CNN
	4    1900 6550
	1    0    0    -1  
$EndComp
Text Label 1500 6000 2    60   ~ 0
GPIO14_DEN
Text Label 2800 5800 0    60   ~ 0
GPIO14_DIO
$Comp
L TS3A4751 U18
U 1 1 573B52A3
P 1900 7050
F 0 "U18" H 1900 7000 60  0000 L CNN
F 1 "TS3A4751" H 2650 7100 60  0000 C CNN
F 2 "" H 1900 7050 60  0000 C CNN
F 3 "" H 1900 7050 60  0000 C CNN
	1    1900 7050
	1    0    0    -1  
$EndComp
Text Label 1500 6500 2    60   ~ 0
GPIO15_DEN
Text Label 2800 6300 0    60   ~ 0
GPIO15_DIO
$Comp
L TS3A4751 U18
U 2 1 573B52AE
P 1900 7550
F 0 "U18" H 1900 7500 60  0000 L CNN
F 1 "TS3A4751" H 2650 7600 60  0000 C CNN
F 2 "" H 1900 7550 60  0000 C CNN
F 3 "" H 1900 7550 60  0000 C CNN
	2    1900 7550
	1    0    0    -1  
$EndComp
Text Label 1500 7000 2    60   ~ 0
GPIO16_DEN
Text Label 2800 6800 0    60   ~ 0
GPIO16_DIO
$Comp
L TS3A4751 U18
U 3 1 573B52B9
P 1900 8050
F 0 "U18" H 1900 8000 60  0000 L CNN
F 1 "TS3A4751" H 2650 8100 60  0000 C CNN
F 2 "" H 1900 8050 60  0000 C CNN
F 3 "" H 1900 8050 60  0000 C CNN
	3    1900 8050
	1    0    0    -1  
$EndComp
Text Label 1500 7500 2    60   ~ 0
GPIO17_DEN
Text Label 2800 7300 0    60   ~ 0
GPIO17_DIO
$Comp
L TS3A4751 U18
U 4 1 573B52C4
P 1900 8550
F 0 "U18" H 1900 8500 60  0000 L CNN
F 1 "TS3A4751" H 2650 8600 60  0000 C CNN
F 2 "" H 1900 8550 60  0000 C CNN
F 3 "" H 1900 8550 60  0000 C CNN
	4    1900 8550
	1    0    0    -1  
$EndComp
Text Label 1500 8000 2    60   ~ 0
GPIO18_DEN
Text Label 2800 7800 0    60   ~ 0
GPIO18_DIO
$Comp
L TS3A4751 U19
U 1 1 573B52CF
P 1900 9050
F 0 "U19" H 1900 9000 60  0000 L CNN
F 1 "TS3A4751" H 2650 9100 60  0000 C CNN
F 2 "" H 1900 9050 60  0000 C CNN
F 3 "" H 1900 9050 60  0000 C CNN
	1    1900 9050
	1    0    0    -1  
$EndComp
Text Label 1500 8500 2    60   ~ 0
GPIO19_DEN
Text Label 2800 8300 0    60   ~ 0
GPIO19_DIO
Text Label 1500 9000 2    60   ~ 0
GPIO20_DEN
Text Label 2800 8800 0    60   ~ 0
GPIO20_DIO
$Comp
L TS3A4751 U15
U 5 1 573B70B8
P 7900 1550
F 0 "U15" H 7900 1500 60  0000 L CNN
F 1 "TS3A4751" H 8650 1600 60  0000 C CNN
F 2 "" H 7900 1550 60  0000 C CNN
F 3 "" H 7900 1550 60  0000 C CNN
	5    7900 1550
	1    0    0    -1  
$EndComp
Text Notes 1900 9250 0    60   ~ 0
Analog isolation switching
Text Label 18950 4550 2    60   ~ 0
GPIO3_DIO
Text Label 18950 4650 2    60   ~ 0
GPIO4_DIO
Text Label 18950 4750 2    60   ~ 0
GPIO5_DIO
Text Label 18950 4850 2    60   ~ 0
GPIO6_DIO
Text Label 18950 4950 2    60   ~ 0
GPIO7_DIO
Text Label 18950 5050 2    60   ~ 0
GPIO8_DIO
Text Label 18950 5150 2    60   ~ 0
GPIO9_DIO
Text Label 18950 5250 2    60   ~ 0
GPIO10_DIO
Text Label 16000 2750 2    60   ~ 0
GPIO12_DIO
Text Label 16000 2850 2    60   ~ 0
GPIO13_DIO
Text Label 16000 2950 2    60   ~ 0
GPIO14_DIO
Text Label 16000 3050 2    60   ~ 0
GPIO15_DIO
Text Label 16000 3150 2    60   ~ 0
GPIO16_DIO
Text Label 16000 3250 2    60   ~ 0
GPIO17_DIO
Text Label 16000 3350 2    60   ~ 0
GPIO18_DIO
Text Label 16000 3450 2    60   ~ 0
GPIO19_DIO
Text Label 16000 3550 2    60   ~ 0
GPIO20_DIO
Text Label 18950 2750 2    60   ~ 0
GPIO3_DEN
Text Label 18950 2850 2    60   ~ 0
GPIO4_DEN
Text Label 18950 2950 2    60   ~ 0
GPIO5_DEN
Text Label 18950 3050 2    60   ~ 0
GPIO6_DEN
Text Label 18950 3150 2    60   ~ 0
GPIO7_DEN
Text Label 18950 3250 2    60   ~ 0
GPIO8_DEN
Text Label 18950 3350 2    60   ~ 0
GPIO9_DEN
Text Label 18950 3550 2    60   ~ 0
GPIO12_DEN
Text Label 18950 3650 2    60   ~ 0
GPIO13_DEN
Text Label 18950 3750 2    60   ~ 0
GPIO14_DEN
Text Label 18950 3850 2    60   ~ 0
GPIO15_DEN
Text Label 18950 3950 2    60   ~ 0
GPIO16_DEN
Text Label 18950 4050 2    60   ~ 0
GPIO17_DEN
Text Label 18950 4150 2    60   ~ 0
GPIO18_DEN
Text Label 18950 4250 2    60   ~ 0
GPIO19_DEN
Text Label 18950 3450 2    60   ~ 0
GPIO10_DEN
NoConn ~ 16150 2650
NoConn ~ 16150 3650
NoConn ~ 16150 3750
NoConn ~ 16150 3850
NoConn ~ 16150 3950
NoConn ~ 16150 4050
NoConn ~ 16150 4150
NoConn ~ 16150 4250
NoConn ~ 16150 4350
NoConn ~ 16150 4450
NoConn ~ 16150 4550
NoConn ~ 19150 6650
NoConn ~ 19150 6750
NoConn ~ 19150 6850
NoConn ~ 19150 6950
NoConn ~ 19150 7050
NoConn ~ 19150 7150
NoConn ~ 19150 7250
NoConn ~ 19150 7350
NoConn ~ 19150 7450
NoConn ~ 19150 7550
$Comp
L TS3A4751 U16
U 5 1 573BACC6
P 7900 2100
F 0 "U16" H 7900 2050 60  0000 L CNN
F 1 "TS3A4751" H 8650 2150 60  0000 C CNN
F 2 "" H 7900 2100 60  0000 C CNN
F 3 "" H 7900 2100 60  0000 C CNN
	5    7900 2100
	1    0    0    -1  
$EndComp
$Comp
L TS3A4751 U17
U 5 1 573BAD7C
P 7900 2650
F 0 "U17" H 7900 2600 60  0000 L CNN
F 1 "TS3A4751" H 8650 2700 60  0000 C CNN
F 2 "" H 7900 2650 60  0000 C CNN
F 3 "" H 7900 2650 60  0000 C CNN
	5    7900 2650
	1    0    0    -1  
$EndComp
$Comp
L TS3A4751 U18
U 5 1 573BAE36
P 7900 3200
F 0 "U18" H 7900 3150 60  0000 L CNN
F 1 "TS3A4751" H 8650 3250 60  0000 C CNN
F 2 "" H 7900 3200 60  0000 C CNN
F 3 "" H 7900 3200 60  0000 C CNN
	5    7900 3200
	1    0    0    -1  
$EndComp
$Comp
L TS3A4751 U19
U 5 1 573BAF10
P 7900 3750
F 0 "U19" H 7900 3700 60  0000 L CNN
F 1 "TS3A4751" H 8650 3800 60  0000 C CNN
F 2 "" H 7900 3750 60  0000 C CNN
F 3 "" H 7900 3750 60  0000 C CNN
	5    7900 3750
	1    0    0    -1  
$EndComp
Text HLabel 7500 1300 0    60   Input ~ 0
DUT_VDD1
Text Notes 16350 2600 0    60   ~ 0
VCCO=DUT_VDD2
Text Notes 19350 2600 0    60   ~ 0
VCCO=DUT_VDD1
Text Label 7500 4150 2    60   ~ 0
DUT_VDD1
Text Label 7500 4450 2    60   ~ 0
GND
Text Label 7500 2400 2    60   ~ 0
DUT_VDD1
Text Label 7500 2600 2    60   ~ 0
GND
Text Label 7500 2950 2    60   ~ 0
DUT_VDD1
Text Label 7500 3150 2    60   ~ 0
GND
Text Label 7500 3500 2    60   ~ 0
DUT_VDD1
Text Label 7500 3700 2    60   ~ 0
GND
$Comp
L C C57
U 1 1 573BC944
P 7600 4300
F 0 "C57" H 7715 4346 50  0000 L CNN
F 1 "0.47 uF" H 7715 4254 50  0000 L CNN
F 2 "" H 7638 4150 30  0000 C CNN
F 3 "" H 7600 4300 60  0000 C CNN
	1    7600 4300
	1    0    0    -1  
$EndComp
Text Label 7500 1850 2    60   ~ 0
DUT_VDD1
Text Label 7500 2050 2    60   ~ 0
GND
$Comp
L C C58
U 1 1 573BCBEE
P 8150 4300
F 0 "C58" H 8265 4346 50  0000 L CNN
F 1 "0.47 uF" H 8265 4254 50  0000 L CNN
F 2 "" H 8188 4150 30  0000 C CNN
F 3 "" H 8150 4300 60  0000 C CNN
	1    8150 4300
	1    0    0    -1  
$EndComp
$Comp
L C C59
U 1 1 573BCC65
P 8700 4300
F 0 "C59" H 8815 4346 50  0000 L CNN
F 1 "0.47 uF" H 8815 4254 50  0000 L CNN
F 2 "" H 8738 4150 30  0000 C CNN
F 3 "" H 8700 4300 60  0000 C CNN
	1    8700 4300
	1    0    0    -1  
$EndComp
$Comp
L C C60
U 1 1 573BCCDF
P 9250 4300
F 0 "C60" H 9365 4346 50  0000 L CNN
F 1 "0.47 uF" H 9365 4254 50  0000 L CNN
F 2 "" H 9288 4150 30  0000 C CNN
F 3 "" H 9250 4300 60  0000 C CNN
	1    9250 4300
	1    0    0    -1  
$EndComp
$Comp
L C C61
U 1 1 573BCD6E
P 9800 4300
F 0 "C61" H 9915 4346 50  0000 L CNN
F 1 "0.47 uF" H 9915 4254 50  0000 L CNN
F 2 "" H 9838 4150 30  0000 C CNN
F 3 "" H 9800 4300 60  0000 C CNN
	1    9800 4300
	1    0    0    -1  
$EndComp
$Comp
L C C62
U 1 1 573BCE06
P 10350 4300
F 0 "C62" H 10465 4346 50  0000 L CNN
F 1 "4.7 uF" H 10465 4254 50  0000 L CNN
F 2 "" H 10388 4150 30  0000 C CNN
F 3 "" H 10350 4300 60  0000 C CNN
	1    10350 4300
	1    0    0    -1  
$EndComp
Text Notes 850  11750 0    60   ~ 0
HV-tolerant inverting buffer for driving GPIO2/Vpp of the DUT\nDUT pin 2 is input only, so we only need a driver
$Comp
L SSM6N58NU_DUAL_NMOS Q1
U 1 1 573D1681
P 2250 11150
F 0 "Q1" H 2390 11203 60  0000 L CNN
F 1 "SSM6N58NU" H 2390 11097 60  0000 L CNN
F 2 "" H 2250 11150 60  0000 C CNN
F 3 "" H 2250 11150 60  0000 C CNN
	1    2250 11150
	-1   0    0    -1  
$EndComp
Text Label 2550 11150 0    60   ~ 0
GPIO2_DIO
Text Label 1750 11350 2    60   ~ 0
GND
$Comp
L R R81
U 1 1 573D3BE8
P 2150 10800
F 0 "R81" H 2220 10846 50  0000 L CNN
F 1 "1K" V 2150 10750 50  0000 L CNN
F 2 "" V 2080 10800 30  0000 C CNN
F 3 "" H 2150 10800 30  0000 C CNN
	1    2150 10800
	1    0    0    -1  
$EndComp
Text Label 2150 10350 2    60   ~ 0
DUT_VDD1
$Comp
L D D1
U 1 1 573D407F
P 2150 10500
F 0 "D1" V 2196 10422 50  0000 R CNN
F 1 "CDBQR0130L" V 2104 10422 50  0000 R CNN
F 2 "" H 2150 10500 60  0000 C CNN
F 3 "" H 2150 10500 60  0000 C CNN
	1    2150 10500
	0    -1   -1   0   
$EndComp
Text Notes 7600 4600 0    60   ~ 0
Power and decoupling for analog switching
Text Notes 6900 11900 0    60   ~ 0
LEDs on GPIO pins (always active, not switchable)
$Comp
L SSM6N58NU_DUAL_NMOS Q1
U 2 1 573D5817
P 7000 10250
F 0 "Q1" H 7140 10303 60  0000 L CNN
F 1 "SSM6N58NU" H 7140 10197 60  0000 L CNN
F 2 "" H 7000 10250 60  0000 C CNN
F 3 "" H 7000 10250 60  0000 C CNN
	2    7000 10250
	-1   0    0    -1  
$EndComp
$Comp
L R R82
U 1 1 573D5AED
P 6900 9900
F 0 "R82" H 6970 9946 50  0000 L CNN
F 1 "220" V 6900 9850 50  0000 L CNN
F 2 "" V 6830 9900 30  0000 C CNN
F 3 "" H 6900 9900 30  0000 C CNN
	1    6900 9900
	1    0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 573D5C49
P 6900 9550
F 0 "D2" V 6946 9442 50  0000 R CNN
F 1 "GREEN" V 6854 9442 50  0000 R CNN
F 2 "" H 6900 9550 60  0000 C CNN
F 3 "" H 6900 9550 60  0000 C CNN
	1    6900 9550
	0    -1   -1   0   
$EndComp
Text HLabel 6600 9350 0    60   Input ~ 0
3V3
Text Label 6600 10450 2    60   ~ 0
GND
Text Label 7200 10150 1    60   ~ 0
DUT_GPIO2
Wire Wire Line
	1500 800  1700 800 
Wire Wire Line
	1500 1000 1700 1000
Wire Wire Line
	2800 800  2600 800 
Wire Wire Line
	1500 1300 1700 1300
Wire Wire Line
	1500 1500 1700 1500
Wire Wire Line
	2800 1300 2600 1300
Wire Wire Line
	1500 1800 1700 1800
Wire Wire Line
	1500 2000 1700 2000
Wire Wire Line
	2800 1800 2600 1800
Wire Wire Line
	1500 2300 1700 2300
Wire Wire Line
	1500 2500 1700 2500
Wire Wire Line
	2800 2300 2600 2300
Wire Wire Line
	1500 2800 1700 2800
Wire Wire Line
	1500 3000 1700 3000
Wire Wire Line
	2800 2800 2600 2800
Wire Wire Line
	1500 3300 1700 3300
Wire Wire Line
	1500 3500 1700 3500
Wire Wire Line
	2800 3300 2600 3300
Wire Wire Line
	1500 3800 1700 3800
Wire Wire Line
	1500 4000 1700 4000
Wire Wire Line
	2800 3800 2600 3800
Wire Wire Line
	1500 4300 1700 4300
Wire Wire Line
	1500 4500 1700 4500
Wire Wire Line
	2800 4300 2600 4300
Wire Wire Line
	1500 4800 1700 4800
Wire Wire Line
	1500 5000 1700 5000
Wire Wire Line
	2800 4800 2600 4800
Wire Wire Line
	1500 5300 1700 5300
Wire Wire Line
	1500 5500 1700 5500
Wire Wire Line
	2800 5300 2600 5300
Wire Wire Line
	1500 5800 1700 5800
Wire Wire Line
	1500 6000 1700 6000
Wire Wire Line
	2800 5800 2600 5800
Wire Wire Line
	1500 6300 1700 6300
Wire Wire Line
	1500 6500 1700 6500
Wire Wire Line
	2800 6300 2600 6300
Wire Wire Line
	1500 6800 1700 6800
Wire Wire Line
	1500 7000 1700 7000
Wire Wire Line
	2800 6800 2600 6800
Wire Wire Line
	1500 7300 1700 7300
Wire Wire Line
	1500 7500 1700 7500
Wire Wire Line
	2800 7300 2600 7300
Wire Wire Line
	1500 7800 1700 7800
Wire Wire Line
	1500 8000 1700 8000
Wire Wire Line
	2800 7800 2600 7800
Wire Wire Line
	1500 8300 1700 8300
Wire Wire Line
	1500 8500 1700 8500
Wire Wire Line
	2800 8300 2600 8300
Wire Wire Line
	1500 8800 1700 8800
Wire Wire Line
	1500 9000 1700 9000
Wire Wire Line
	2800 8800 2600 8800
Wire Wire Line
	16000 2750 16150 2750
Wire Wire Line
	16150 2850 16000 2850
Wire Wire Line
	16150 2950 16000 2950
Wire Wire Line
	16000 3050 16150 3050
Wire Wire Line
	16150 3150 16000 3150
Wire Wire Line
	16000 3250 16150 3250
Wire Wire Line
	16150 3350 16000 3350
Wire Wire Line
	16000 3450 16150 3450
Wire Wire Line
	16150 3550 16000 3550
Wire Wire Line
	19150 2750 18950 2750
Wire Wire Line
	18950 2850 19150 2850
Wire Wire Line
	19150 2950 18950 2950
Wire Wire Line
	18950 3050 19150 3050
Wire Wire Line
	19150 3150 18950 3150
Wire Wire Line
	18950 3250 19150 3250
Wire Wire Line
	19150 3350 18950 3350
Wire Wire Line
	18950 3450 19150 3450
Wire Wire Line
	19150 3550 18950 3550
Wire Wire Line
	18950 3650 19150 3650
Wire Wire Line
	19150 3750 18950 3750
Wire Wire Line
	18950 3850 19150 3850
Wire Wire Line
	19150 3950 18950 3950
Wire Wire Line
	18950 4050 19150 4050
Wire Wire Line
	19150 4150 18950 4150
Wire Wire Line
	18950 4250 19150 4250
Wire Wire Line
	19150 4350 18950 4350
Wire Wire Line
	18400 4450 19150 4450
Wire Wire Line
	19150 4550 18950 4550
Wire Wire Line
	18950 4650 19150 4650
Wire Wire Line
	19150 4750 18950 4750
Wire Wire Line
	18950 4850 19150 4850
Wire Wire Line
	19150 4950 18950 4950
Wire Wire Line
	18950 5050 19150 5050
Wire Wire Line
	19150 5150 18950 5150
Wire Wire Line
	18950 5250 19150 5250
Wire Wire Line
	7500 1300 7700 1300
Wire Wire Line
	7700 1500 7500 1500
Wire Wire Line
	7500 1850 7700 1850
Wire Wire Line
	7500 2050 7700 2050
Wire Wire Line
	7500 2400 7700 2400
Wire Wire Line
	7500 2600 7700 2600
Wire Wire Line
	7500 2950 7700 2950
Wire Wire Line
	7500 3150 7700 3150
Wire Wire Line
	7500 3500 7700 3500
Wire Wire Line
	7500 3700 7700 3700
Wire Wire Line
	7500 4150 10350 4150
Connection ~ 9800 4150
Connection ~ 9250 4150
Connection ~ 8700 4150
Connection ~ 8150 4150
Connection ~ 7600 4150
Wire Wire Line
	7500 4450 10350 4450
Connection ~ 7600 4450
Connection ~ 8150 4450
Connection ~ 8700 4450
Connection ~ 9250 4450
Connection ~ 9800 4450
Wire Wire Line
	2550 11150 2450 11150
Wire Wire Line
	1750 10950 2150 10950
Wire Wire Line
	1750 11350 2150 11350
Wire Wire Line
	6600 9350 13300 9350
Wire Wire Line
	6600 10450 13300 10450
Wire Wire Line
	7200 10150 7200 10250
$Comp
L SSM6N58NU_DUAL_NMOS Q2
U 2 1 573D7371
P 7800 10250
F 0 "Q2" H 7940 10303 60  0000 L CNN
F 1 "SSM6N58NU" H 7940 10197 60  0000 L CNN
F 2 "" H 7800 10250 60  0000 C CNN
F 3 "" H 7800 10250 60  0000 C CNN
	2    7800 10250
	-1   0    0    -1  
$EndComp
$Comp
L R R84
U 1 1 573D7377
P 7700 9900
F 0 "R84" H 7770 9946 50  0000 L CNN
F 1 "220" V 7700 9850 50  0000 L CNN
F 2 "" V 7630 9900 30  0000 C CNN
F 3 "" H 7700 9900 30  0000 C CNN
	1    7700 9900
	1    0    0    -1  
$EndComp
$Comp
L LED D4
U 1 1 573D737D
P 7700 9550
F 0 "D4" V 7746 9442 50  0000 R CNN
F 1 "GREEN" V 7654 9442 50  0000 R CNN
F 2 "" H 7700 9550 60  0000 C CNN
F 3 "" H 7700 9550 60  0000 C CNN
	1    7700 9550
	0    -1   -1   0   
$EndComp
Text Label 8000 10150 1    60   ~ 0
DUT_GPIO3
Wire Wire Line
	8000 10150 8000 10250
$Comp
L SSM6N58NU_DUAL_NMOS Q3
U 2 1 573D76C7
P 8600 10250
F 0 "Q3" H 8740 10303 60  0000 L CNN
F 1 "SSM6N58NU" H 8740 10197 60  0000 L CNN
F 2 "" H 8600 10250 60  0000 C CNN
F 3 "" H 8600 10250 60  0000 C CNN
	2    8600 10250
	-1   0    0    -1  
$EndComp
$Comp
L R R86
U 1 1 573D76CD
P 8500 9900
F 0 "R86" H 8570 9946 50  0000 L CNN
F 1 "220" V 8500 9850 50  0000 L CNN
F 2 "" V 8430 9900 30  0000 C CNN
F 3 "" H 8500 9900 30  0000 C CNN
	1    8500 9900
	1    0    0    -1  
$EndComp
$Comp
L LED D6
U 1 1 573D76D3
P 8500 9550
F 0 "D6" V 8546 9442 50  0000 R CNN
F 1 "GREEN" V 8454 9442 50  0000 R CNN
F 2 "" H 8500 9550 60  0000 C CNN
F 3 "" H 8500 9550 60  0000 C CNN
	1    8500 9550
	0    -1   -1   0   
$EndComp
Text Label 8800 10150 1    60   ~ 0
DUT_GPIO4
Wire Wire Line
	8800 10150 8800 10250
$Comp
L SSM6N58NU_DUAL_NMOS Q4
U 2 1 573D7995
P 9400 10250
F 0 "Q4" H 9540 10303 60  0000 L CNN
F 1 "SSM6N58NU" H 9540 10197 60  0000 L CNN
F 2 "" H 9400 10250 60  0000 C CNN
F 3 "" H 9400 10250 60  0000 C CNN
	2    9400 10250
	-1   0    0    -1  
$EndComp
$Comp
L R R88
U 1 1 573D799B
P 9300 9900
F 0 "R88" H 9370 9946 50  0000 L CNN
F 1 "220" V 9300 9850 50  0000 L CNN
F 2 "" V 9230 9900 30  0000 C CNN
F 3 "" H 9300 9900 30  0000 C CNN
	1    9300 9900
	1    0    0    -1  
$EndComp
$Comp
L LED D8
U 1 1 573D79A1
P 9300 9550
F 0 "D8" V 9346 9442 50  0000 R CNN
F 1 "GREEN" V 9254 9442 50  0000 R CNN
F 2 "" H 9300 9550 60  0000 C CNN
F 3 "" H 9300 9550 60  0000 C CNN
	1    9300 9550
	0    -1   -1   0   
$EndComp
Text Label 9600 10150 1    60   ~ 0
DUT_GPIO5
Wire Wire Line
	9600 10150 9600 10250
$Comp
L SSM6N58NU_DUAL_NMOS Q5
U 2 1 573D79AB
P 10200 10250
F 0 "Q5" H 10340 10303 60  0000 L CNN
F 1 "SSM6N58NU" H 10340 10197 60  0000 L CNN
F 2 "" H 10200 10250 60  0000 C CNN
F 3 "" H 10200 10250 60  0000 C CNN
	2    10200 10250
	-1   0    0    -1  
$EndComp
$Comp
L R R90
U 1 1 573D79B1
P 10100 9900
F 0 "R90" H 10170 9946 50  0000 L CNN
F 1 "220" V 10100 9850 50  0000 L CNN
F 2 "" V 10030 9900 30  0000 C CNN
F 3 "" H 10100 9900 30  0000 C CNN
	1    10100 9900
	1    0    0    -1  
$EndComp
$Comp
L LED D10
U 1 1 573D79B7
P 10100 9550
F 0 "D10" V 10146 9442 50  0000 R CNN
F 1 "GREEN" V 10054 9442 50  0000 R CNN
F 2 "" H 10100 9550 60  0000 C CNN
F 3 "" H 10100 9550 60  0000 C CNN
	1    10100 9550
	0    -1   -1   0   
$EndComp
Text Label 10400 10150 1    60   ~ 0
DUT_GPIO6
Wire Wire Line
	10400 10150 10400 10250
$Comp
L SSM6N58NU_DUAL_NMOS Q6
U 2 1 573D8075
P 11000 10250
F 0 "Q6" H 11140 10303 60  0000 L CNN
F 1 "SSM6N58NU" H 11140 10197 60  0000 L CNN
F 2 "" H 11000 10250 60  0000 C CNN
F 3 "" H 11000 10250 60  0000 C CNN
	2    11000 10250
	-1   0    0    -1  
$EndComp
$Comp
L R R92
U 1 1 573D807B
P 10900 9900
F 0 "R92" H 10970 9946 50  0000 L CNN
F 1 "220" V 10900 9850 50  0000 L CNN
F 2 "" V 10830 9900 30  0000 C CNN
F 3 "" H 10900 9900 30  0000 C CNN
	1    10900 9900
	1    0    0    -1  
$EndComp
$Comp
L LED D12
U 1 1 573D8081
P 10900 9550
F 0 "D12" V 10946 9442 50  0000 R CNN
F 1 "GREEN" V 10854 9442 50  0000 R CNN
F 2 "" H 10900 9550 60  0000 C CNN
F 3 "" H 10900 9550 60  0000 C CNN
	1    10900 9550
	0    -1   -1   0   
$EndComp
Text Label 11200 10150 1    60   ~ 0
DUT_GPIO7
Wire Wire Line
	11200 10150 11200 10250
$Comp
L SSM6N58NU_DUAL_NMOS Q7
U 2 1 573D808B
P 11800 10250
F 0 "Q7" H 11940 10303 60  0000 L CNN
F 1 "SSM6N58NU" H 11940 10197 60  0000 L CNN
F 2 "" H 11800 10250 60  0000 C CNN
F 3 "" H 11800 10250 60  0000 C CNN
	2    11800 10250
	-1   0    0    -1  
$EndComp
$Comp
L R R94
U 1 1 573D8091
P 11700 9900
F 0 "R94" H 11770 9946 50  0000 L CNN
F 1 "220" V 11700 9850 50  0000 L CNN
F 2 "" V 11630 9900 30  0000 C CNN
F 3 "" H 11700 9900 30  0000 C CNN
	1    11700 9900
	1    0    0    -1  
$EndComp
$Comp
L LED D14
U 1 1 573D8097
P 11700 9550
F 0 "D14" V 11746 9442 50  0000 R CNN
F 1 "GREEN" V 11654 9442 50  0000 R CNN
F 2 "" H 11700 9550 60  0000 C CNN
F 3 "" H 11700 9550 60  0000 C CNN
	1    11700 9550
	0    -1   -1   0   
$EndComp
Text Label 12000 10150 1    60   ~ 0
DUT_GPIO8
Wire Wire Line
	12000 10150 12000 10250
$Comp
L SSM6N58NU_DUAL_NMOS Q8
U 2 1 573D80A1
P 12600 10250
F 0 "Q8" H 12740 10303 60  0000 L CNN
F 1 "SSM6N58NU" H 12740 10197 60  0000 L CNN
F 2 "" H 12600 10250 60  0000 C CNN
F 3 "" H 12600 10250 60  0000 C CNN
	2    12600 10250
	-1   0    0    -1  
$EndComp
$Comp
L R R96
U 1 1 573D80A7
P 12500 9900
F 0 "R96" H 12570 9946 50  0000 L CNN
F 1 "220" V 12500 9850 50  0000 L CNN
F 2 "" V 12430 9900 30  0000 C CNN
F 3 "" H 12500 9900 30  0000 C CNN
	1    12500 9900
	1    0    0    -1  
$EndComp
$Comp
L LED D16
U 1 1 573D80AD
P 12500 9550
F 0 "D16" V 12546 9442 50  0000 R CNN
F 1 "GREEN" V 12454 9442 50  0000 R CNN
F 2 "" H 12500 9550 60  0000 C CNN
F 3 "" H 12500 9550 60  0000 C CNN
	1    12500 9550
	0    -1   -1   0   
$EndComp
Text Label 12800 10150 1    60   ~ 0
DUT_GPIO9
Wire Wire Line
	12800 10150 12800 10250
$Comp
L SSM6N58NU_DUAL_NMOS Q9
U 2 1 573D80B7
P 13400 10250
F 0 "Q9" H 13540 10303 60  0000 L CNN
F 1 "SSM6N58NU" H 13540 10197 60  0000 L CNN
F 2 "" H 13400 10250 60  0000 C CNN
F 3 "" H 13400 10250 60  0000 C CNN
	2    13400 10250
	-1   0    0    -1  
$EndComp
$Comp
L R R98
U 1 1 573D80BD
P 13300 9900
F 0 "R98" H 13370 9946 50  0000 L CNN
F 1 "220" V 13300 9850 50  0000 L CNN
F 2 "" V 13230 9900 30  0000 C CNN
F 3 "" H 13300 9900 30  0000 C CNN
	1    13300 9900
	1    0    0    -1  
$EndComp
$Comp
L LED D18
U 1 1 573D80C3
P 13300 9550
F 0 "D18" V 13346 9442 50  0000 R CNN
F 1 "GREEN" V 13254 9442 50  0000 R CNN
F 2 "" H 13300 9550 60  0000 C CNN
F 3 "" H 13300 9550 60  0000 C CNN
	1    13300 9550
	0    -1   -1   0   
$EndComp
Text Label 13600 10150 1    60   ~ 0
DUT_GPIO10
Wire Wire Line
	13600 10150 13600 10250
Connection ~ 6900 9350
Connection ~ 7700 9350
Connection ~ 8500 9350
Connection ~ 9300 9350
Connection ~ 10100 9350
Connection ~ 10900 9350
Connection ~ 11700 9350
Connection ~ 12500 9350
Connection ~ 12500 10450
Connection ~ 11700 10450
Connection ~ 10900 10450
Connection ~ 10100 10450
Connection ~ 9300 10450
Connection ~ 8500 10450
Connection ~ 7700 10450
Connection ~ 6900 10450
$Comp
L SSM6N58NU_DUAL_NMOS Q2
U 1 1 573DA6A5
P 7000 11550
F 0 "Q2" H 7140 11603 60  0000 L CNN
F 1 "SSM6N58NU" H 7140 11497 60  0000 L CNN
F 2 "" H 7000 11550 60  0000 C CNN
F 3 "" H 7000 11550 60  0000 C CNN
	1    7000 11550
	-1   0    0    -1  
$EndComp
$Comp
L R R83
U 1 1 573DA6AB
P 6900 11200
F 0 "R83" H 6970 11246 50  0000 L CNN
F 1 "220" V 6900 11150 50  0000 L CNN
F 2 "" V 6830 11200 30  0000 C CNN
F 3 "" H 6900 11200 30  0000 C CNN
	1    6900 11200
	1    0    0    -1  
$EndComp
$Comp
L LED D3
U 1 1 573DA6B1
P 6900 10850
F 0 "D3" V 6946 10742 50  0000 R CNN
F 1 "GREEN" V 6854 10742 50  0000 R CNN
F 2 "" H 6900 10850 60  0000 C CNN
F 3 "" H 6900 10850 60  0000 C CNN
	1    6900 10850
	0    -1   -1   0   
$EndComp
Text HLabel 6600 10650 0    60   Input ~ 0
3V3
Text Label 6600 11750 2    60   ~ 0
GND
Text Label 7200 11450 1    60   ~ 0
DUT_GPIO12
Wire Wire Line
	6600 10650 13300 10650
Wire Wire Line
	6600 11750 13300 11750
Wire Wire Line
	7200 11450 7200 11550
$Comp
L SSM6N58NU_DUAL_NMOS Q3
U 1 1 573DA6BD
P 7800 11550
F 0 "Q3" H 7940 11603 60  0000 L CNN
F 1 "SSM6N58NU" H 7940 11497 60  0000 L CNN
F 2 "" H 7800 11550 60  0000 C CNN
F 3 "" H 7800 11550 60  0000 C CNN
	1    7800 11550
	-1   0    0    -1  
$EndComp
$Comp
L R R85
U 1 1 573DA6C3
P 7700 11200
F 0 "R85" H 7770 11246 50  0000 L CNN
F 1 "220" V 7700 11150 50  0000 L CNN
F 2 "" V 7630 11200 30  0000 C CNN
F 3 "" H 7700 11200 30  0000 C CNN
	1    7700 11200
	1    0    0    -1  
$EndComp
$Comp
L LED D5
U 1 1 573DA6C9
P 7700 10850
F 0 "D5" V 7746 10742 50  0000 R CNN
F 1 "GREEN" V 7654 10742 50  0000 R CNN
F 2 "" H 7700 10850 60  0000 C CNN
F 3 "" H 7700 10850 60  0000 C CNN
	1    7700 10850
	0    -1   -1   0   
$EndComp
Text Label 8000 11450 1    60   ~ 0
DUT_GPIO13
Wire Wire Line
	8000 11450 8000 11550
$Comp
L SSM6N58NU_DUAL_NMOS Q4
U 1 1 573DA6D1
P 8600 11550
F 0 "Q4" H 8740 11603 60  0000 L CNN
F 1 "SSM6N58NU" H 8740 11497 60  0000 L CNN
F 2 "" H 8600 11550 60  0000 C CNN
F 3 "" H 8600 11550 60  0000 C CNN
	1    8600 11550
	-1   0    0    -1  
$EndComp
$Comp
L R R87
U 1 1 573DA6D7
P 8500 11200
F 0 "R87" H 8570 11246 50  0000 L CNN
F 1 "220" V 8500 11150 50  0000 L CNN
F 2 "" V 8430 11200 30  0000 C CNN
F 3 "" H 8500 11200 30  0000 C CNN
	1    8500 11200
	1    0    0    -1  
$EndComp
$Comp
L LED D7
U 1 1 573DA6DD
P 8500 10850
F 0 "D7" V 8546 10742 50  0000 R CNN
F 1 "GREEN" V 8454 10742 50  0000 R CNN
F 2 "" H 8500 10850 60  0000 C CNN
F 3 "" H 8500 10850 60  0000 C CNN
	1    8500 10850
	0    -1   -1   0   
$EndComp
Text Label 8800 11450 1    60   ~ 0
DUT_GPIO14
Wire Wire Line
	8800 11450 8800 11550
$Comp
L SSM6N58NU_DUAL_NMOS Q5
U 1 1 573DA6E5
P 9400 11550
F 0 "Q5" H 9540 11603 60  0000 L CNN
F 1 "SSM6N58NU" H 9540 11497 60  0000 L CNN
F 2 "" H 9400 11550 60  0000 C CNN
F 3 "" H 9400 11550 60  0000 C CNN
	1    9400 11550
	-1   0    0    -1  
$EndComp
$Comp
L R R89
U 1 1 573DA6EB
P 9300 11200
F 0 "R89" H 9370 11246 50  0000 L CNN
F 1 "220" V 9300 11150 50  0000 L CNN
F 2 "" V 9230 11200 30  0000 C CNN
F 3 "" H 9300 11200 30  0000 C CNN
	1    9300 11200
	1    0    0    -1  
$EndComp
$Comp
L LED D9
U 1 1 573DA6F1
P 9300 10850
F 0 "D9" V 9346 10742 50  0000 R CNN
F 1 "GREEN" V 9254 10742 50  0000 R CNN
F 2 "" H 9300 10850 60  0000 C CNN
F 3 "" H 9300 10850 60  0000 C CNN
	1    9300 10850
	0    -1   -1   0   
$EndComp
Text Label 9600 11450 1    60   ~ 0
DUT_GPIO15
Wire Wire Line
	9600 11450 9600 11550
$Comp
L SSM6N58NU_DUAL_NMOS Q6
U 1 1 573DA6F9
P 10200 11550
F 0 "Q6" H 10340 11603 60  0000 L CNN
F 1 "SSM6N58NU" H 10340 11497 60  0000 L CNN
F 2 "" H 10200 11550 60  0000 C CNN
F 3 "" H 10200 11550 60  0000 C CNN
	1    10200 11550
	-1   0    0    -1  
$EndComp
$Comp
L R R91
U 1 1 573DA6FF
P 10100 11200
F 0 "R91" H 10170 11246 50  0000 L CNN
F 1 "220" V 10100 11150 50  0000 L CNN
F 2 "" V 10030 11200 30  0000 C CNN
F 3 "" H 10100 11200 30  0000 C CNN
	1    10100 11200
	1    0    0    -1  
$EndComp
$Comp
L LED D11
U 1 1 573DA705
P 10100 10850
F 0 "D11" V 10146 10742 50  0000 R CNN
F 1 "GREEN" V 10054 10742 50  0000 R CNN
F 2 "" H 10100 10850 60  0000 C CNN
F 3 "" H 10100 10850 60  0000 C CNN
	1    10100 10850
	0    -1   -1   0   
$EndComp
Text Label 10400 11450 1    60   ~ 0
DUT_GPIO16
Wire Wire Line
	10400 11450 10400 11550
$Comp
L SSM6N58NU_DUAL_NMOS Q7
U 1 1 573DA70D
P 11000 11550
F 0 "Q7" H 11140 11603 60  0000 L CNN
F 1 "SSM6N58NU" H 11140 11497 60  0000 L CNN
F 2 "" H 11000 11550 60  0000 C CNN
F 3 "" H 11000 11550 60  0000 C CNN
	1    11000 11550
	-1   0    0    -1  
$EndComp
$Comp
L R R93
U 1 1 573DA713
P 10900 11200
F 0 "R93" H 10970 11246 50  0000 L CNN
F 1 "220" V 10900 11150 50  0000 L CNN
F 2 "" V 10830 11200 30  0000 C CNN
F 3 "" H 10900 11200 30  0000 C CNN
	1    10900 11200
	1    0    0    -1  
$EndComp
$Comp
L LED D13
U 1 1 573DA719
P 10900 10850
F 0 "D13" V 10946 10742 50  0000 R CNN
F 1 "GREEN" V 10854 10742 50  0000 R CNN
F 2 "" H 10900 10850 60  0000 C CNN
F 3 "" H 10900 10850 60  0000 C CNN
	1    10900 10850
	0    -1   -1   0   
$EndComp
Text Label 11200 11450 1    60   ~ 0
DUT_GPIO17
Wire Wire Line
	11200 11450 11200 11550
$Comp
L SSM6N58NU_DUAL_NMOS Q8
U 1 1 573DA721
P 11800 11550
F 0 "Q8" H 11940 11603 60  0000 L CNN
F 1 "SSM6N58NU" H 11940 11497 60  0000 L CNN
F 2 "" H 11800 11550 60  0000 C CNN
F 3 "" H 11800 11550 60  0000 C CNN
	1    11800 11550
	-1   0    0    -1  
$EndComp
$Comp
L R R95
U 1 1 573DA727
P 11700 11200
F 0 "R95" H 11770 11246 50  0000 L CNN
F 1 "220" V 11700 11150 50  0000 L CNN
F 2 "" V 11630 11200 30  0000 C CNN
F 3 "" H 11700 11200 30  0000 C CNN
	1    11700 11200
	1    0    0    -1  
$EndComp
$Comp
L LED D15
U 1 1 573DA72D
P 11700 10850
F 0 "D15" V 11746 10742 50  0000 R CNN
F 1 "GREEN" V 11654 10742 50  0000 R CNN
F 2 "" H 11700 10850 60  0000 C CNN
F 3 "" H 11700 10850 60  0000 C CNN
	1    11700 10850
	0    -1   -1   0   
$EndComp
Text Label 12000 11450 1    60   ~ 0
DUT_GPIO18
Wire Wire Line
	12000 11450 12000 11550
$Comp
L SSM6N58NU_DUAL_NMOS Q9
U 1 1 573DA735
P 12600 11550
F 0 "Q9" H 12740 11603 60  0000 L CNN
F 1 "SSM6N58NU" H 12740 11497 60  0000 L CNN
F 2 "" H 12600 11550 60  0000 C CNN
F 3 "" H 12600 11550 60  0000 C CNN
	1    12600 11550
	-1   0    0    -1  
$EndComp
$Comp
L R R97
U 1 1 573DA73B
P 12500 11200
F 0 "R97" H 12570 11246 50  0000 L CNN
F 1 "220" V 12500 11150 50  0000 L CNN
F 2 "" V 12430 11200 30  0000 C CNN
F 3 "" H 12500 11200 30  0000 C CNN
	1    12500 11200
	1    0    0    -1  
$EndComp
$Comp
L LED D17
U 1 1 573DA741
P 12500 10850
F 0 "D17" V 12546 10742 50  0000 R CNN
F 1 "GREEN" V 12454 10742 50  0000 R CNN
F 2 "" H 12500 10850 60  0000 C CNN
F 3 "" H 12500 10850 60  0000 C CNN
	1    12500 10850
	0    -1   -1   0   
$EndComp
Text Label 12800 11450 1    60   ~ 0
DUT_GPIO19
Wire Wire Line
	12800 11450 12800 11550
$Comp
L SSM6N58NU_DUAL_NMOS Q10
U 1 1 573DA749
P 13400 11550
F 0 "Q10" H 13540 11603 60  0000 L CNN
F 1 "SSM6N58NU" H 13540 11497 60  0000 L CNN
F 2 "" H 13400 11550 60  0000 C CNN
F 3 "" H 13400 11550 60  0000 C CNN
	1    13400 11550
	-1   0    0    -1  
$EndComp
$Comp
L R R99
U 1 1 573DA74F
P 13300 11200
F 0 "R99" H 13370 11246 50  0000 L CNN
F 1 "220" V 13300 11150 50  0000 L CNN
F 2 "" V 13230 11200 30  0000 C CNN
F 3 "" H 13300 11200 30  0000 C CNN
	1    13300 11200
	1    0    0    -1  
$EndComp
$Comp
L LED D19
U 1 1 573DA755
P 13300 10850
F 0 "D19" V 13346 10742 50  0000 R CNN
F 1 "GREEN" V 13254 10742 50  0000 R CNN
F 2 "" H 13300 10850 60  0000 C CNN
F 3 "" H 13300 10850 60  0000 C CNN
	1    13300 10850
	0    -1   -1   0   
$EndComp
Text Label 13600 11450 1    60   ~ 0
DUT_GPIO20
Wire Wire Line
	13600 11450 13600 11550
Connection ~ 6900 10650
Connection ~ 7700 10650
Connection ~ 8500 10650
Connection ~ 9300 10650
Connection ~ 10100 10650
Connection ~ 10900 10650
Connection ~ 11700 10650
Connection ~ 12500 10650
Connection ~ 12500 11750
Connection ~ 11700 11750
Connection ~ 10900 11750
Connection ~ 10100 11750
Connection ~ 9300 11750
Connection ~ 8500 11750
Connection ~ 7700 11750
Connection ~ 6900 11750
NoConn ~ 19150 2650
Text HLabel 18950 5350 0    60   Output ~ 0
GPIO3_AEN
Text HLabel 18950 5450 0    60   Output ~ 0
GPIO4_AEN
Text HLabel 18950 5550 0    60   Output ~ 0
GPIO5_AEN
Text HLabel 18950 5650 0    60   Output ~ 0
GPIO6_AEN
Text HLabel 18950 5750 0    60   Output ~ 0
GPIO7_AEN
Text HLabel 18950 5850 0    60   Output ~ 0
GPIO8_AEN
Text HLabel 18950 5950 0    60   Output ~ 0
GPIO9_AEN
Text HLabel 18950 6050 0    60   Output ~ 0
GPIO10_AEN
Wire Wire Line
	18950 5350 19150 5350
Wire Wire Line
	19150 5450 18950 5450
Wire Wire Line
	18950 5550 19150 5550
Wire Wire Line
	19150 5650 18950 5650
Wire Wire Line
	18950 5750 19150 5750
Wire Wire Line
	19150 5850 18950 5850
Wire Wire Line
	18950 5950 19150 5950
Wire Wire Line
	19150 6050 18950 6050
Text HLabel 18950 6150 0    60   Output ~ 0
GPIO12_AEN
Text HLabel 18950 6250 0    60   Output ~ 0
GPIO13_AEN
Text HLabel 18950 6350 0    60   Output ~ 0
GPIO14_AEN
Text HLabel 18950 6450 0    60   Output ~ 0
GPIO15_AEN
Text HLabel 18950 6550 0    60   Output ~ 0
GPIO17_AEN
Wire Wire Line
	19150 6150 18950 6150
Wire Wire Line
	18950 6250 19150 6250
Wire Wire Line
	19150 6350 18950 6350
Wire Wire Line
	18950 6450 19150 6450
Wire Wire Line
	18950 6550 19150 6550
Text Label 18950 4350 2    60   ~ 0
GPIO20_DEN
Text HLabel 18400 4450 0    60   Output ~ 0
GPIO2_DIO
$EndSCHEMATC
