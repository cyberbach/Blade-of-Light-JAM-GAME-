//Maya ASCII 2017ff04 scene
//Name: characters.ma
//Last modified: Sat, May 26, 2018 07:15:22 PM
//Codeset: 1251
requires maya "2017ff04";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2017";
fileInfo "version" "2017";
fileInfo "cutIdentifier" "201702071345-1015190";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -s -n "persp";
	rename -uid "28BD05EA-4D87-70AB-0EEF-AB9958138BBB";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.9976461299537025 4.5048498230890877 -12.534251444842127 ;
	setAttr ".r" -type "double3" -20.738352729680646 -189.00000000005181 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "D34F6A88-402E-2242-0724-D28EC19D2499";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 13.659973431963396;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -0.00078940391540527344 -0.33215951919555664 0.083373934030532837 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "71BA052A-43B3-A972-C7EA-E89F24C6EB65";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "0C317CF5-443C-57B1-5233-2A85E1FA4298";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "DB833516-4975-FBB9-54D6-D48495879D20";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "E46BF966-465C-A758-0E0C-749B9872E8F6";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "DE684C4C-477E-0752-42A4-0A8F917CF713";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 1.822777481443806 -0.15062705036271776 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "5186B6C9-4154-0A9D-7A2C-ECB04E350891";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 3.3271883628674983;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "pCube1";
	rename -uid "B4A0687F-4FAD-9569-9160-9EB798099085";
	setAttr ".t" -type "double3" -15.513489838536113 0 0 ;
	setAttr ".s" -type "double3" 1 2 1 ;
createNode mesh -n "pCubeShape1" -p "pCube1";
	rename -uid "64F775AE-464A-059F-7ED6-9A9FDB04DF82";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube6";
	rename -uid "8475FBA4-46B0-F59E-13A8-6F9189BDD6AD";
	setAttr ".rp" -type "double3" -0.00078938213218715525 -0.33215951919555664 0.083373934030532837 ;
	setAttr ".sp" -type "double3" -0.00078938213218715525 -0.33215951919555664 0.083373934030532837 ;
createNode mesh -n "pCube6Shape" -p "pCube6";
	rename -uid "CBDD9F67-4812-CF27-EB01-2A9021402E1D";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:125]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 1 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 144 ".uvst[0].uvsp[0:143]" -type "float2" 0.375 0 0.55441338
		 0 0.375 0.25 0.55996311 0.25 0.375 0.5 0.54214084 0.44235846 0.375 0.75 0.56124538
		 0.75 0.375 1 0.55441338 1 0.875 0 0.81552935 0.25 0.375 0.75 0.625 0.75 0.625 1 0.375
		 1 0.375 0.75 0.625 0.75 0.625 1 0.375 1 0.375 0.75 0.625 0.75 0.625 1 0.375 0.75
		 0.625 0.75 0.625 1 0.375 1 0.375 0.75 0.625 0.75 0.625 1 0.375 1 0.375 0.75 0.625
		 0.75 0.625 1 0.375 1 0.375 0.75 0.625 0.75 0.5 1 0.375 0.75 0.625 0.75 0.625 1 0.375
		 1 0.375 0.75 0.625 0.75 0.625 1 0.375 1 0.625 1 0.375 1 0.375 1 0.625 1 0.625 0.75
		 0.625 1 0.625 0.875 0.625 0.75 0.625 1 0.625 1 0.625 0.75 0.375 0.39235151 0.625
		 0.16148625 0.375 0.159005 0.625 0.089348249 0.375 0.077104546 0.625 0.6329633 0.875
		 0.11703674 0.375 0.64784801 0.49230826 0.082849696 0.48857075 0.1601322 0.49656522
		 0.64061016 0.72171712 0.20641786 0.78632373 0.10721549 0.625 0.89119875 0.73380125
		 0 0.49230826 0.082849696 0.55441338 0 0.625 0.089348249 0.49656522 0.64061016 0.54214084
		 0.44235846 0.625 0.6329633 0.375 0.75 0.625 0.75 0.625 1 0.375 1 0.625 0.16148625
		 0.72171712 0.20641786 0.81552935 0.25 0.55996311 0.25 0.56124538 0.75 0.625 0.89119875
		 0.625 0.75 0.55441338 1 0.375 1 0.375 1 0.625 1 0.375 0.75 0.625 0.75 0.375 0.75
		 0.625 1 0.375 1 0.625 0.75 0.375 0.75 0.625 1 0.625 0.75 0.375 0.75 0.625 0.75 0.625
		 1 0.625 1 0.625 0.75 0.375 1 0.625 1 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.625
		 0.75 0.375 0.75 0.625 1 0.375 1 0.625 0.75 0.375 0.75 0.5 1 0.625 0.75 0.375 0.75
		 0.625 1 0.375 1 0.625 1 0.375 1 0.375 1 0.625 1 0.625 1 0.625 0.75 0.625 0.875 0.48857075
		 0.1601322 0.375 0.077104546 0.375 0.159005 0.375 0 0.375 0.25 0.375 0.39235151 0.375
		 0.5 0.375 0.64784801 0.375 0.75 0.78632373 0.10721549 0.875 0 0.875 0.11703674 0.73380125
		 0;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 18 ".pt";
	setAttr ".pt[16]" -type "float3" -6.2875966e-010 0 0 ;
	setAttr ".pt[17]" -type "float3" 0.043574579 0 0 ;
	setAttr ".pt[19]" -type "float3" 9.3742603e-010 0 0 ;
	setAttr ".pt[20]" -type "float3" -0.064975366 0 0 ;
	setAttr ".pt[23]" -type "float3" 1.4527474e-009 0 0 ;
	setAttr ".pt[24]" -type "float3" -0.058492411 0 0 ;
	setAttr ".pt[25]" -type "float3" -0.058303874 0 0 ;
	setAttr ".pt[26]" -type "float3" -1.2371012e-009 0 0 ;
	setAttr ".pt[29]" -type "float3" -0.079057857 0 0 ;
	setAttr ".pt[30]" -type "float3" -1.2371012e-009 0 0 ;
	setAttr ".pt[74]" -type "float3" -0.043574579 0 0 ;
	setAttr ".pt[76]" -type "float3" 0.064975366 0 0 ;
	setAttr ".pt[78]" -type "float3" 0.058492415 0 0 ;
	setAttr ".pt[79]" -type "float3" 0.058303874 0 0 ;
	setAttr ".pt[81]" -type "float3" 0.079057865 0 0 ;
	setAttr -s 113 ".vt[0:112]"  -0.00078938215 1.50720584 0.21539223 0.11310665 1.5760746 0.17939663
		 -0.00078938215 1.93993306 0.21539223 0.11220485 1.92284679 0.2174854 -0.00078938215 2.0043945313 -0.14717777
		 0.16494879 1.97687697 -0.1062869 -0.00078938215 1.57166731 -0.26525259 0.11738638 1.57608604 -0.25565675
		 -0.00078938215 1.52311134 -0.15384951 0.13078308 1.52315688 -0.15384951 0.13078308 1.47895002 0.10398912
		 -0.00078938215 1.47895002 0.10398912 -0.00078938215 1.37073159 -0.087422304 0.13070467 1.37073159 -0.087422304
		 0.13070467 1.37073159 0.087422304 -0.00078938215 1.37073159 0.12237477 -0.00078938215 1.37073159 -0.15732723
		 0.55624306 1.29739356 -0.1485427 0.55624306 1.29739356 0.1485427 -0.00078938215 0.97283709 -0.26312134
		 0.55624306 0.97283709 -0.1485427 0.55624306 0.97283709 0.1485427 -0.00078938215 0.97283709 0.26312134
		 -0.00078938215 0.079954632 -0.21520421 0.32284921 0.079954632 -0.21520421 0.32284921 0.079954632 0.21520421
		 -0.00078938215 0.079954632 0.21520421 -0.00078938215 -0.22607929 -0.24039903 0.4380523 -0.22607929 -0.24039903
		 0.4380523 -0.22607929 0.24039903 -0.00078938215 -0.22607929 0.24039903 0.30249113 -1.4790082 -0.11502968
		 0.47914097 -1.4790082 -0.11502968 0.39081603 -1.4790082 0.11502968 0.30154574 -2.52304888 -0.17334393
		 0.48008633 -2.52304888 -0.17334393 0.48008633 -2.52304888 0.081775956 0.30154574 -2.52304888 0.081775956
		 0.30154574 -2.66897106 -0.17334393 0.48008633 -2.66897106 -0.17334393 0.48008633 -2.66897106 0.081775956
		 0.30154574 -2.66897106 0.081775956 0.24704209 -2.46803069 0.49141353 0.46868435 -2.46803069 0.49141353
		 0.24704209 -2.61020732 0.49141353 0.46868435 -2.61020732 0.49141353 1.43949497 1.22639298 -0.12286001
		 1.43949497 1.22639298 0.12286001 1.43949497 1.043837547 0 2.2989428 1.24048996 -0.12286001
		 2.2989428 1.24048996 0.12286001 2.2989428 1.029740572 0.12286001 2.2989428 1.029740572 -0.12286001
		 -0.00078938215 2.0046520233 0.044041701 0.21981411 1.80770802 0.22360711 -0.00078938215 1.83209431 0.30029699
		 0.1664447 1.69660711 0.23680168 -0.00078938215 1.65473294 0.33681375 0.23724353 1.77050471 -0.27070206
		 -0.00078938215 1.81495774 -0.32466567 0.083134651 1.6957432 0.29076532 0.12201578 1.84127021 0.26301119
		 0.14297193 1.82833374 -0.32466567 0.23263198 1.87301433 0.054769903 0.22279423 1.72448027 -0.063274957
		 0.17082354 1.60803211 0.0079950318 -0.11468542 1.5760746 0.17939663 -0.11378361 1.92284679 0.2174854
		 -0.16652755 1.97687697 -0.1062869 -0.11896514 1.57608604 -0.25565675 -0.13236184 1.52315688 -0.15384951
		 -0.13236184 1.47895002 0.10398912 -0.13228343 1.37073159 -0.087422304 -0.13228343 1.37073159 0.087422304
		 -0.55782181 1.29739356 -0.1485427 -0.55782181 1.29739356 0.1485427 -0.55782181 0.97283709 -0.1485427
		 -0.55782181 0.97283709 0.1485427 -0.32442799 0.079954632 -0.21520421 -0.32442799 0.079954632 0.21520421
		 -0.43963107 -0.22607929 -0.24039903 -0.43963107 -0.22607929 0.24039903 -0.30406991 -1.4790082 -0.11502968
		 -0.48071975 -1.4790082 -0.11502968 -0.39239481 -1.4790082 0.11502968 -0.30312452 -2.52304888 -0.17334393
		 -0.4816651 -2.52304888 -0.17334393 -0.4816651 -2.52304888 0.081775956 -0.30312452 -2.52304888 0.081775956
		 -0.30312452 -2.66897106 -0.17334393 -0.4816651 -2.66897106 -0.17334393 -0.4816651 -2.66897106 0.081775956
		 -0.30312452 -2.66897106 0.081775956 -0.24862085 -2.46803069 0.49141353 -0.47026312 -2.46803069 0.49141353
		 -0.24862085 -2.61020732 0.49141353 -0.47026312 -2.61020732 0.49141353 -1.44107378 1.22639298 -0.12286001
		 -1.44107378 1.22639298 0.12286001 -1.44107378 1.043837547 0 -2.30052161 1.24048996 -0.12286001
		 -2.30052161 1.24048996 0.12286001 -2.30052161 1.029740572 0.12286001 -2.30052161 1.029740572 -0.12286001
		 -0.22139287 1.80770802 0.22360711 -0.16802347 1.69660711 0.23680168 -0.2388223 1.77050471 -0.27070206
		 -0.084713414 1.6957432 0.29076532 -0.12359454 1.84127021 0.26301119 -0.1445507 1.82833374 -0.32466567
		 -0.23421074 1.87301433 0.054769903 -0.224373 1.72448027 -0.063274957 -0.17240231 1.60803211 0.0079950318;
	setAttr -s 237 ".ed";
	setAttr ".ed[0:165]"  0 1 0 2 3 0 4 5 0 6 7 0 0 57 0 1 56 0 2 53 0 3 5 0
		 4 59 0 5 58 0 7 65 0 6 8 0 7 9 0 8 9 0 1 10 0 9 10 0 0 11 0 11 10 0 8 12 0 9 13 0
		 12 13 0 10 14 0 13 14 0 11 15 0 15 14 0 12 16 0 13 17 0 16 17 0 14 18 0 17 18 0 15 18 0
		 16 19 0 17 20 0 19 20 0 18 21 0 20 21 0 15 22 0 22 21 0 19 23 0 20 24 0 23 24 0 21 25 0
		 24 25 0 22 26 0 26 25 0 23 27 0 24 28 0 27 28 0 25 29 0 28 29 0 26 30 0 30 29 0 27 30 0
		 27 31 0 28 32 0 31 32 0 29 33 0 32 33 0 30 33 0 31 33 0 31 34 0 32 35 0 34 35 0 33 36 0
		 35 36 0 33 37 0 37 36 0 34 37 0 34 38 0 35 39 0 38 39 0 36 40 0 39 40 0 37 41 0 41 40 0
		 38 41 0 37 42 0 36 43 0 42 43 0 41 44 0 42 44 0 40 45 0 44 45 0 43 45 0 17 46 0 18 47 0
		 46 47 0 21 48 0 47 48 0 20 48 0 46 48 0 46 49 0 47 50 0 49 50 0 48 51 0 50 51 0 48 52 0
		 52 51 0 49 52 0 53 4 0 54 3 0 55 2 0 54 61 0 56 54 0 57 55 0 56 60 0 58 7 0 59 6 0
		 58 62 0 60 57 0 60 1 0 61 55 0 60 61 0 3 61 0 5 53 0 62 59 0 62 5 0 7 62 0 56 64 0
		 54 63 0 63 5 0 64 58 0 63 64 0 64 7 0 65 1 0 64 65 0 65 10 0 65 9 0 0 66 0 2 67 0
		 4 68 0 6 69 0 66 105 0 67 68 0 68 106 0 69 112 0 69 70 0 8 70 0 66 71 0 70 71 0 11 71 0
		 70 72 0 12 72 0 71 73 0 72 73 0 15 73 0 72 74 0 16 74 0 73 75 0 74 75 0 15 75 0 74 76 0
		 19 76 0 75 77 0 76 77 0 22 77 0 76 78 0 23 78 0 77 79 0 78 79 0 26 79 0 78 80 0 27 80 0
		 79 81 0 80 81 0 30 81 0;
	setAttr ".ed[166:236]" 27 82 0 80 83 0 82 83 0 81 84 0 83 84 0 30 84 0 82 84 0
		 82 85 0 83 86 0 85 86 0 84 87 0 86 87 0 84 88 0 88 87 0 85 88 0 85 89 0 86 90 0 89 90 0
		 87 91 0 90 91 0 88 92 0 92 91 0 89 92 0 88 93 0 87 94 0 93 94 0 92 95 0 93 95 0 91 96 0
		 95 96 0 94 96 0 74 97 0 75 98 0 97 98 0 77 99 0 98 99 0 76 99 0 97 99 0 97 100 0
		 98 101 0 100 101 0 99 102 0 101 102 0 99 103 0 103 102 0 100 103 0 104 67 0 104 108 0
		 105 104 0 105 107 0 106 69 0 106 109 0 107 57 0 107 66 0 108 55 0 107 108 0 67 108 0
		 68 53 0 109 59 0 109 68 0 69 109 0 105 111 0 104 110 0 110 68 0 111 106 0 110 111 0
		 111 69 0 112 66 0 111 112 0 112 71 0 112 70 0;
	setAttr -s 126 -ch 474 ".fc[0:125]" -type "polyFaces" 
		f 3 110 5 105
		mu 0 3 65 1 60
		f 3 116 9 108
		mu 0 3 67 5 62
		f 4 70 72 -75 -76
		mu 0 4 42 43 44 45
		f 4 119 120 -8 -101
		mu 0 4 58 68 11 3
		f 3 10 127 -13
		mu 0 3 7 70 13
		f 4 -1 16 17 -15
		mu 0 4 9 8 15 14
		f 4 13 19 -21 -19
		mu 0 4 12 13 17 16
		f 4 15 21 -23 -20
		mu 0 4 13 14 18 17
		f 4 -18 23 24 -22
		mu 0 4 14 15 19 18
		f 4 20 26 -28 -26
		mu 0 4 16 17 21 20
		f 4 22 28 -30 -27
		mu 0 4 17 18 22 21
		f 3 -25 30 -29
		mu 0 3 18 19 22
		f 4 27 32 -34 -32
		mu 0 4 20 21 24 23
		f 4 93 95 -98 -99
		mu 0 4 53 54 55 56
		f 4 -31 36 37 -35
		mu 0 4 22 19 26 25
		f 4 33 39 -41 -39
		mu 0 4 23 24 28 27
		f 4 35 41 -43 -40
		mu 0 4 24 25 29 28
		f 4 -38 43 44 -42
		mu 0 4 25 26 30 29
		f 4 40 46 -48 -46
		mu 0 4 27 28 32 31
		f 4 42 48 -50 -47
		mu 0 4 28 29 33 32
		f 4 -45 50 51 -49
		mu 0 4 29 30 34 33
		f 4 47 54 -56 -54
		mu 0 4 31 32 36 35
		f 4 49 56 -58 -55
		mu 0 4 32 33 37 36
		f 3 -52 58 -57
		mu 0 3 33 34 37
		f 4 -53 53 59 -59
		mu 0 4 34 31 35 37
		f 4 55 61 -63 -61
		mu 0 4 35 36 39 38
		f 4 57 63 -65 -62
		mu 0 4 36 37 40 39
		f 3 65 66 -64
		mu 0 3 37 41 40
		f 4 -60 60 67 -66
		mu 0 4 37 35 38 41
		f 4 62 69 -71 -69
		mu 0 4 38 39 43 42
		f 4 64 71 -73 -70
		mu 0 4 39 40 44 43
		f 4 -79 80 82 -84
		mu 0 4 46 47 48 49
		f 4 -68 68 75 -74
		mu 0 4 41 38 42 45
		f 4 -67 76 78 -78
		mu 0 4 40 41 47 46
		f 4 73 79 -81 -77
		mu 0 4 41 45 48 47
		f 4 74 81 -83 -80
		mu 0 4 45 44 49 48
		f 4 -72 77 83 -82
		mu 0 4 44 40 46 49
		f 4 29 85 -87 -85
		mu 0 4 21 22 51 50
		f 4 34 87 -89 -86
		mu 0 4 22 25 52 51
		f 3 -36 89 -88
		mu 0 3 25 24 52
		f 4 -33 84 90 -90
		mu 0 4 24 21 50 52
		f 4 86 92 -94 -92
		mu 0 4 50 51 54 53
		f 4 88 94 -96 -93
		mu 0 4 51 52 55 54
		f 3 96 97 -95
		mu 0 3 52 56 55
		f 4 -91 91 98 -97
		mu 0 4 52 50 53 56
		f 3 113 -103 100
		mu 0 3 3 66 58
		f 4 -110 112 111 -105
		mu 0 4 61 65 66 59
		f 3 117 -109 106
		mu 0 3 7 67 62
		f 4 0 -111 109 -5
		mu 0 4 0 1 65 61
		f 4 -113 -106 103 102
		mu 0 4 66 65 60 58
		f 4 -112 -114 -2 -102
		mu 0 4 59 66 3 2
		f 4 1 7 114 -7
		mu 0 4 2 3 5 57
		f 3 -115 -3 -100
		mu 0 3 57 5 4
		f 4 2 -117 115 -9
		mu 0 4 4 5 67 64
		f 4 -116 -118 -4 -108
		mu 0 4 64 67 7 6
		f 4 3 12 -14 -12
		mu 0 4 6 7 13 12
		f 3 123 -107 -122
		mu 0 3 69 10 63
		f 4 122 121 -10 -121
		mu 0 4 68 69 63 11
		f 4 118 -123 -120 -104
		mu 0 4 60 69 68 58
		f 3 125 -11 -124
		mu 0 3 69 71 10
		f 4 -125 -126 -119 -6
		mu 0 4 1 71 69 60
		f 3 -127 124 14
		mu 0 3 14 70 9
		f 3 -128 126 -16
		mu 0 3 13 70 14
		f 3 -216 -133 -220
		mu 0 3 72 74 73
		f 3 -218 -135 -226
		mu 0 3 75 77 76
		f 4 188 187 -186 -184
		mu 0 4 78 81 80 79
		f 4 212 133 -230 -229
		mu 0 4 82 85 84 83
		f 3 136 -237 -136
		mu 0 3 86 88 87
		f 4 138 -141 -17 128
		mu 0 4 89 92 91 90
		f 4 18 142 -142 -138
		mu 0 4 93 95 94 88
		f 4 141 144 -144 -140
		mu 0 4 88 94 96 92
		f 4 143 -146 -24 140
		mu 0 4 92 96 97 91
		f 4 25 147 -147 -143
		mu 0 4 95 99 98 94
		f 4 146 149 -149 -145
		mu 0 4 94 98 100 96
		f 3 148 -151 145
		mu 0 3 96 100 97
		f 4 31 152 -152 -148
		mu 0 4 99 102 101 98
		f 4 211 210 -209 -207
		mu 0 4 103 106 105 104
		f 4 153 -156 -37 150
		mu 0 4 100 108 107 97
		f 4 38 157 -157 -153
		mu 0 4 102 110 109 101
		f 4 156 159 -159 -155
		mu 0 4 101 109 111 108
		f 4 158 -161 -44 155
		mu 0 4 108 111 112 107
		f 4 45 162 -162 -158
		mu 0 4 110 114 113 109
		f 4 161 164 -164 -160
		mu 0 4 109 113 115 111
		f 4 163 -166 -51 160
		mu 0 4 111 115 116 112
		f 4 166 168 -168 -163
		mu 0 4 114 118 117 113
		f 4 167 170 -170 -165
		mu 0 4 113 117 119 115
		f 3 169 -172 165
		mu 0 3 115 119 116
		f 4 171 -173 -167 52
		mu 0 4 116 119 118 114
		f 4 173 175 -175 -169
		mu 0 4 118 121 120 117
		f 4 174 177 -177 -171
		mu 0 4 117 120 122 119
		f 3 176 -180 -179
		mu 0 3 119 122 123
		f 4 178 -181 -174 172
		mu 0 4 119 123 121 118
		f 4 181 183 -183 -176
		mu 0 4 121 78 79 120
		f 4 182 185 -185 -178
		mu 0 4 120 79 80 122
		f 4 196 -196 -194 191
		mu 0 4 124 127 126 125
		f 4 186 -189 -182 180
		mu 0 4 123 81 78 121
		f 4 190 -192 -190 179
		mu 0 4 122 124 125 123
		f 4 189 193 -193 -187
		mu 0 4 123 125 126 81
		f 4 192 195 -195 -188
		mu 0 4 81 126 127 80
		f 4 194 -197 -191 184
		mu 0 4 80 127 124 122
		f 4 197 199 -199 -150
		mu 0 4 98 129 128 100
		f 4 198 201 -201 -154
		mu 0 4 100 128 130 108
		f 3 200 -203 154
		mu 0 3 108 130 101
		f 4 202 -204 -198 151
		mu 0 4 101 130 129 98
		f 4 204 206 -206 -200
		mu 0 4 129 103 104 128
		f 4 205 208 -208 -202
		mu 0 4 128 104 105 130
		f 3 207 -211 -210
		mu 0 3 130 105 106
		f 4 209 -212 -205 203
		mu 0 4 130 106 103 129
		f 3 -213 213 -223
		mu 0 3 85 82 131
		f 4 104 -221 -222 218
		mu 0 4 132 133 131 72
		f 3 -217 217 -227
		mu 0 3 86 77 75
		f 4 4 -219 219 -129
		mu 0 4 134 132 72 73
		f 4 -214 -215 215 221
		mu 0 4 131 82 74 72
		f 4 101 129 222 220
		mu 0 4 133 135 85 131
		f 4 6 -224 -134 -130
		mu 0 4 135 136 76 85
		f 3 99 130 223
		mu 0 3 136 137 76
		f 4 8 -225 225 -131
		mu 0 4 137 138 75 76
		f 4 107 131 226 224
		mu 0 4 138 139 86 75
		f 4 11 137 -137 -132
		mu 0 4 139 93 88 86
		f 3 230 216 -233
		mu 0 3 140 142 141
		f 4 229 134 -231 -232
		mu 0 4 83 84 142 140
		f 4 214 228 231 -228
		mu 0 4 74 82 83 140
		f 3 232 135 -235
		mu 0 3 140 141 143
		f 4 132 227 234 233
		mu 0 4 73 74 140 143
		f 3 -139 -234 235
		mu 0 3 92 89 87
		f 3 139 -236 236
		mu 0 3 88 92 87;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPipe1";
	rename -uid "9335A21C-41F7-8737-FD97-D58C3502B31A";
	setAttr ".t" -type "double3" 8.050639053606151 0 0 ;
	setAttr ".r" -type "double3" 0 0 -42.242409442102485 ;
	setAttr ".s" -type "double3" 1.0991840828701238 0.4143853053459205 1.0991840828701238 ;
createNode mesh -n "pPipeShape1" -p "pPipe1";
	rename -uid "002C57C5-4907-E656-EF8D-C9A3BDF4D9E7";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 4 "f[4:5]" "f[12:13]" "f[20:21]" "f[28:29]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 4 "f[2:3]" "f[10:11]" "f[18:19]" "f[26:27]";
	setAttr ".iog[0].og[2].gcl" -type "componentList" 4 "f[0:1]" "f[8:9]" "f[16:17]" "f[24:25]";
	setAttr ".iog[0].og[3].gcl" -type "componentList" 4 "f[6:7]" "f[14:15]" "f[22:23]" "f[30:31]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.625 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 45 ".uvst[0].uvsp[0:44]" -type "float2" 0 1 0.125 1 0.25
		 1 0.375 1 0.5 1 0.625 1 0.75 1 0.875 1 1 1 0 0.75 0.125 0.75 0.25 0.75 0.375 0.75
		 0.5 0.75 0.625 0.75 0.75 0.75 0.875 0.75 1 0.75 0 0.5 0.125 0.5 0.25 0.5 0.375 0.5
		 0.5 0.5 0.625 0.5 0.75 0.5 0.875 0.5 1 0.5 0 0.25 0.125 0.25 0.25 0.25 0.375 0.25
		 0.5 0.25 0.625 0.25 0.75 0.25 0.875 0.25 1 0.25 0 0 0.125 0 0.25 0 0.375 0 0.5 0
		 0.625 0 0.75 0 0.875 0 1 0;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 19 ".pt";
	setAttr ".pt[16]" -type "float3" 0 -0.26805177 0 ;
	setAttr ".pt[17]" -type "float3" 0 -0.26805177 0 ;
	setAttr ".pt[18]" -type "float3" 0 -0.26805177 0 ;
	setAttr ".pt[19]" -type "float3" 0 -0.26805177 0 ;
	setAttr ".pt[20]" -type "float3" 0 -0.26805177 0 ;
	setAttr ".pt[21]" -type "float3" 0 -0.26805177 0 ;
	setAttr ".pt[22]" -type "float3" 0 -0.26805177 0 ;
	setAttr ".pt[23]" -type "float3" 0 -0.26805177 0 ;
	setAttr ".pt[24]" -type "float3" 0 0.26805177 0 ;
	setAttr ".pt[25]" -type "float3" 0 0.26805177 0 ;
	setAttr ".pt[26]" -type "float3" 0 0.26805177 0 ;
	setAttr ".pt[27]" -type "float3" 0 0.26805177 0 ;
	setAttr ".pt[28]" -type "float3" 0 0.26805177 0 ;
	setAttr ".pt[29]" -type "float3" 0 0.26805177 0 ;
	setAttr ".pt[30]" -type "float3" 0 0.26805177 0 ;
	setAttr ".pt[31]" -type "float3" 0 0.26805177 0 ;
	setAttr -s 32 ".vt[0:31]"  0.80000001 -0.5 -1.110223e-016 0.56568545 -0.5 -0.56568545
		 0 -0.5 -0.80000001 -0.56568545 -0.5 -0.56568545 -0.80000001 -0.5 -1.110223e-016 -0.56568545 -0.5 0.56568545
		 0 -0.5 0.80000001 0.56568545 -0.5 0.56568545 0.80000001 0.5 1.110223e-016 0.56568545 0.5 -0.56568545
		 0 0.5 -0.80000001 -0.56568545 0.5 -0.56568545 -0.80000001 0.5 1.110223e-016 -0.56568545 0.5 0.56568545
		 0 0.5 0.80000001 0.56568545 0.5 0.56568545 1 0.5 1.110223e-016 0.70710677 0.5 -0.70710677
		 0 0.5 -0.99999994 -0.70710671 0.5 -0.70710671 -0.99999988 0.5 1.110223e-016 -0.70710671 0.5 0.70710671
		 0 0.5 0.99999988 0.70710671 0.5 0.70710671 1 -0.5 -1.110223e-016 0.70710677 -0.5 -0.70710677
		 0 -0.5 -0.99999994 -0.70710671 -0.5 -0.70710671 -0.99999988 -0.5 -1.110223e-016 -0.70710671 -0.5 0.70710671
		 0 -0.5 0.99999988 0.70710671 -0.5 0.70710671;
	setAttr -s 64 ".ed[0:63]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 0 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 8 0 16 17 0 17 18 0
		 18 19 0 19 20 0 20 21 0 21 22 0 22 23 0 23 16 0 24 25 0 25 26 0 26 27 0 27 28 0 28 29 0
		 29 30 0 30 31 0 31 24 0 0 8 0 1 9 0 2 10 0 3 11 0 4 12 0 5 13 0 6 14 0 7 15 0 8 16 1
		 9 17 1 10 18 1 11 19 1 12 20 1 13 21 1 14 22 1 15 23 1 16 24 0 17 25 0 18 26 0 19 27 0
		 20 28 0 21 29 0 22 30 0 23 31 0 24 0 1 25 1 1 26 2 1 27 3 1 28 4 1 29 5 1 30 6 1
		 31 7 1;
	setAttr -s 32 -ch 128 ".fc[0:31]" -type "polyFaces" 
		f 4 -1 32 8 -34
		mu 0 4 1 0 9 10
		f 4 -2 33 9 -35
		mu 0 4 2 1 10 11
		f 4 -3 34 10 -36
		mu 0 4 3 2 11 12
		f 4 -4 35 11 -37
		mu 0 4 4 3 12 13
		f 4 -5 36 12 -38
		mu 0 4 5 4 13 14
		f 4 -6 37 13 -39
		mu 0 4 6 5 14 15
		f 4 -7 38 14 -40
		mu 0 4 7 6 15 16
		f 4 -8 39 15 -33
		mu 0 4 8 7 16 17
		f 4 -9 40 16 -42
		mu 0 4 10 9 18 19
		f 4 -10 41 17 -43
		mu 0 4 11 10 19 20
		f 4 -11 42 18 -44
		mu 0 4 12 11 20 21
		f 4 -12 43 19 -45
		mu 0 4 13 12 21 22
		f 4 -13 44 20 -46
		mu 0 4 14 13 22 23
		f 4 -14 45 21 -47
		mu 0 4 15 14 23 24
		f 4 -15 46 22 -48
		mu 0 4 16 15 24 25
		f 4 -16 47 23 -41
		mu 0 4 17 16 25 26
		f 4 -17 48 24 -50
		mu 0 4 19 18 27 28
		f 4 -18 49 25 -51
		mu 0 4 20 19 28 29
		f 4 -19 50 26 -52
		mu 0 4 21 20 29 30
		f 4 -20 51 27 -53
		mu 0 4 22 21 30 31
		f 4 -21 52 28 -54
		mu 0 4 23 22 31 32
		f 4 -22 53 29 -55
		mu 0 4 24 23 32 33
		f 4 -23 54 30 -56
		mu 0 4 25 24 33 34
		f 4 -24 55 31 -49
		mu 0 4 26 25 34 35
		f 4 -25 56 0 -58
		mu 0 4 28 27 36 37
		f 4 -26 57 1 -59
		mu 0 4 29 28 37 38
		f 4 -27 58 2 -60
		mu 0 4 30 29 38 39
		f 4 -28 59 3 -61
		mu 0 4 31 30 39 40
		f 4 -29 60 4 -62
		mu 0 4 32 31 40 41
		f 4 -30 61 5 -63
		mu 0 4 33 32 41 42
		f 4 -31 62 6 -64
		mu 0 4 34 33 42 43
		f 4 -32 63 7 -57
		mu 0 4 35 34 43 44;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube7";
	rename -uid "A7495FD9-45EC-4B3F-F766-23B07513F816";
	setAttr ".t" -type "double3" 9.7423463029447674 0 0 ;
	setAttr ".sp" -type "double3" 0 -1.0547118733938987e-015 0 ;
createNode mesh -n "pCubeShape2" -p "pCube7";
	rename -uid "1ADFF880-4FC9-2B5E-33B3-0983E706B5EE";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 28 ".uvst[0].uvsp[0:27]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0.25 0.625 0.25 0.625 0.5 0.375 0.5 0.375 0.25
		 0.625 0.25 0.625 0.5 0.375 0.5 0.5 0.25 0.625 0.5 0.375 0.5 0.5 0.25 0.625 0.5 0.375
		 0.5;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 22 ".pt[0:21]" -type "float3"  0.44773889 1.7814497 -0.44773889 
		-0.44773889 1.7814497 -0.44773889 0.43515772 -0.16883609 -0.4346633 -0.43515772 -0.16883609 
		-0.4346633 0.43515772 -0.16883609 0.43565214 -0.43515772 -0.16883609 0.43565214 0.44773889 
		1.7814497 0.44773889 -0.44773889 1.7814497 0.44773889 1.4671832 -0.29543549 -1.4666902 
		-1.4671832 -0.29543549 -1.4666902 -1.4671832 -0.29543549 1.467679 1.4671832 -0.29543549 
		1.467679 1.4671832 -0.41534108 -1.4666902 -1.4671832 -0.41534108 -1.4666902 -1.4671832 
		-0.41534108 1.467679 1.4671832 -0.41534108 1.467679 -1.659995e-006 -0.41534108 -1.208678 
		-0.19989489 -0.41534108 1.2096668 0.19989161 -0.41534108 1.2096668 0.051284641 -11.583558 
		-3.0015974 -0.25147459 -13.536654 2.6922321 0.14889872 -13.536654 2.702425;
	setAttr -s 22 ".vt[0:21]"  -0.5 -2.06585598 0.5 0.5 -2.06585598 0.5
		 -0.5 0.5 0.5 0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -2.06585598 -0.5 0.5 -2.06585598 -0.5
		 -1.68580627 0.68883276 1.68580782 1.68580627 0.68883276 1.68580782 1.68580627 0.68883276 -1.68580782
		 -1.68580627 0.68883276 -1.68580782 -1.68580627 0.86768138 1.68580782 1.68580627 0.86768138 1.68580782
		 1.68580627 0.86768138 -1.68580782 -1.68580627 0.86768138 -1.68580782 1.9073486e-006 0.86768138 1.3893497
		 0.24430466 0.86768138 -1.3893497 -0.24430084 0.86768138 -1.3893497 1.9073486e-006 17.52594376 3.44603705
		 0.24430466 20.43913651 -3.44603705 -0.24430084 20.43913651 -3.44603705;
	setAttr -s 41 ".ed[0:40]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0 2 8 0 3 9 0 8 9 0 5 10 0 9 10 0 4 11 0 11 10 0 8 11 0
		 8 12 0 9 13 0 12 13 0 10 14 0 13 14 0 11 15 0 15 14 0 12 15 0 12 16 0 13 16 0 14 17 0
		 16 17 0 15 18 0 18 17 0 16 18 0 16 19 0 17 20 0 19 20 0 18 21 0 21 20 0 19 21 0;
	setAttr -s 21 -ch 82 ".fc[0:20]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 3 37 -40 -41
		mu 0 3 25 26 27
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 1 13 -15 -13
		mu 0 4 2 3 15 14
		f 4 7 15 -17 -14
		mu 0 4 3 5 16 15
		f 4 -3 17 18 -16
		mu 0 4 5 4 17 16
		f 4 -7 12 19 -18
		mu 0 4 4 2 14 17
		f 4 14 21 -23 -21
		mu 0 4 14 15 19 18
		f 4 16 23 -25 -22
		mu 0 4 15 16 20 19
		f 4 -19 25 26 -24
		mu 0 4 16 17 21 20
		f 4 -20 20 27 -26
		mu 0 4 17 14 18 21
		f 3 22 29 -29
		mu 0 3 18 19 22
		f 4 24 30 -32 -30
		mu 0 4 19 20 23 22
		f 4 -27 32 33 -31
		mu 0 4 20 21 24 23
		f 4 -28 28 34 -33
		mu 0 4 21 18 22 24
		f 4 31 36 -38 -36
		mu 0 4 22 23 26 25
		f 4 -34 38 39 -37
		mu 0 4 23 24 27 26
		f 4 -35 35 40 -39
		mu 0 4 24 22 25 27;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "A06247A5-4CCA-895E-A903-64AA8B243687";
	setAttr -s 6 ".lnk";
	setAttr -s 6 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "121FBA52-46EC-C9D3-9482-98990C695977";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "633ECA94-445D-4CDC-360C-478B398D4993";
createNode displayLayerManager -n "layerManager";
	rename -uid "6A570EF5-443D-3E73-FE7D-8FB1D8570B11";
createNode displayLayer -n "defaultLayer";
	rename -uid "4DE12C1E-4B84-0034-C1F5-9DB78D509451";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "C1467E10-48C5-404E-38FB-9BBED03ED416";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "0E679FA1-4CB8-B9D5-8581-D78DFC7EF59E";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "F64EE48F-4717-FA28-42E0-E087001B3C4A";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n"
		+ "            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n"
		+ "            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n"
		+ "            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 783\n            -height 356\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n"
		+ "            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 782\n            -height 356\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n"
		+ "\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 783\n            -height 356\n            -sceneRenderFilter 0\n"
		+ "            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n"
		+ "            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n"
		+ "            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1572\n            -height 756\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n"
		+ "            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n"
		+ "            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n"
		+ "            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n"
		+ "                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 1\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -showCurveNames 0\n                -showActiveCurveNames 0\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n"
		+ "                -constrainDrag 0\n                -classicMode 1\n                -valueLinesToggle 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n"
		+ "                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n"
		+ "                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n"
		+ "                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n"
		+ "                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n"
		+ "                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab -1\n                -editorMode \"default\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"\"\n"
		+ "\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1572\\n    -height 756\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1572\\n    -height 756\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "00E12F8C-4005-092B-2F21-CBAE41AABFA8";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 1 -ast 0 -aet 1 ";
	setAttr ".st" 6;
createNode groupId -n "groupId1";
	rename -uid "545166E9-4049-4CE2-1E73-A99285ED3F48";
	setAttr ".ihi" 0;
createNode lambert -n "mat1";
	rename -uid "104BD0F7-4B0A-B203-4649-6A8296C27A8F";
	setAttr ".c" -type "float3" 0.109 0.46991906 0.5 ;
createNode shadingEngine -n "lambert2SG";
	rename -uid "75C300A4-4764-11E4-8F3F-CDBA901B3687";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "BE6863C6-4750-169C-3A85-3F9FD021239F";
createNode groupId -n "groupId2";
	rename -uid "D91A2A01-4CFD-98FA-440D-5FB360999079";
	setAttr ".ihi" 0;
createNode groupId -n "groupId3";
	rename -uid "6F3C7319-47B9-F260-E1C9-CFACF2BFDF0C";
	setAttr ".ihi" 0;
createNode groupId -n "groupId4";
	rename -uid "EE954013-4508-0254-A334-3D8D62C4DF91";
	setAttr ".ihi" 0;
createNode lambert -n "mat2";
	rename -uid "1332DFE4-491E-DAD8-AC0D-BF9602E8562B";
	setAttr ".c" -type "float3" 0.12181399 0.79100001 0.19902694 ;
createNode shadingEngine -n "lambert3SG";
	rename -uid "DE70A618-4AF4-AD48-F445-AB8C5F18B470";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
	rename -uid "4F95C000-49F9-443E-FB2E-919C3443FA0C";
createNode groupId -n "groupId5";
	rename -uid "C55D9644-429E-ADF6-ADEB-28BF85524907";
	setAttr ".ihi" 0;
createNode lambert -n "mat3";
	rename -uid "F8E7A10B-4066-A246-861E-2EA1F7222D5A";
	setAttr ".c" -type "float3" 0.5 0.1665 0.35890174 ;
createNode shadingEngine -n "lambert4SG";
	rename -uid "734539A7-4A16-9945-FF5E-B89AB291E239";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
	rename -uid "497D3039-49A7-92AC-81C6-08A8F5E585F2";
createNode groupId -n "groupId6";
	rename -uid "655B64C1-4D5B-9264-8467-CB930ED73864";
	setAttr ".ihi" 0;
createNode lambert -n "mat4";
	rename -uid "007D4F50-44BF-85A1-58F0-D3921C5AF124";
	setAttr ".c" -type "float3" 0.07068602 0.68987471 0.91799998 ;
createNode shadingEngine -n "lambert5SG";
	rename -uid "4FE134E6-46B4-F21A-4047-A99384D7E14F";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
	rename -uid "2480F2B4-46CC-356D-4FD5-18A17E0BE346";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
select -ne :renderPartition;
	setAttr -s 6 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 8 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :initialShadingGroup;
	setAttr -s 4 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 3 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cme" no;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "groupId1.id" "pCube6Shape.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "pCube6Shape.iog.og[0].gco";
connectAttr "groupId2.id" "pPipeShape1.iog.og[0].gid";
connectAttr "lambert5SG.mwc" "pPipeShape1.iog.og[0].gco";
connectAttr "groupId4.id" "pPipeShape1.iog.og[1].gid";
connectAttr "lambert2SG.mwc" "pPipeShape1.iog.og[1].gco";
connectAttr "groupId5.id" "pPipeShape1.iog.og[2].gid";
connectAttr "lambert3SG.mwc" "pPipeShape1.iog.og[2].gco";
connectAttr "groupId6.id" "pPipeShape1.iog.og[3].gid";
connectAttr "lambert4SG.mwc" "pPipeShape1.iog.og[3].gco";
connectAttr "groupId3.id" "pPipeShape1.ciog.cog[0].cgid";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert5SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert5SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "mat1.oc" "lambert2SG.ss";
connectAttr "groupId4.msg" "lambert2SG.gn" -na;
connectAttr "pPipeShape1.iog.og[1]" "lambert2SG.dsm" -na;
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "mat1.msg" "materialInfo1.m";
connectAttr "mat2.oc" "lambert3SG.ss";
connectAttr "groupId5.msg" "lambert3SG.gn" -na;
connectAttr "pPipeShape1.iog.og[2]" "lambert3SG.dsm" -na;
connectAttr "lambert3SG.msg" "materialInfo2.sg";
connectAttr "mat2.msg" "materialInfo2.m";
connectAttr "mat3.oc" "lambert4SG.ss";
connectAttr "groupId6.msg" "lambert4SG.gn" -na;
connectAttr "pPipeShape1.iog.og[3]" "lambert4SG.dsm" -na;
connectAttr "lambert4SG.msg" "materialInfo3.sg";
connectAttr "mat3.msg" "materialInfo3.m";
connectAttr "mat4.oc" "lambert5SG.ss";
connectAttr "pPipeShape1.iog.og[0]" "lambert5SG.dsm" -na;
connectAttr "lambert5SG.msg" "materialInfo4.sg";
connectAttr "mat4.msg" "materialInfo4.m";
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "lambert4SG.pa" ":renderPartition.st" -na;
connectAttr "lambert5SG.pa" ":renderPartition.st" -na;
connectAttr "mat1.msg" ":defaultShaderList1.s" -na;
connectAttr "mat2.msg" ":defaultShaderList1.s" -na;
connectAttr "mat3.msg" ":defaultShaderList1.s" -na;
connectAttr "mat4.msg" ":defaultShaderList1.s" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "pCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCube6Shape.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "pPipeShape1.ciog.cog[0]" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "groupId1.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId2.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId3.msg" ":initialShadingGroup.gn" -na;
// End of characters.ma
