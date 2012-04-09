////////////////////////////////////////////////////////////////////////////////
//
//  Compass support script (for Gothic I and Gothic II - Night of the Raven).
//  Copyright (c) 2009 Nico Bendlin <nicode@gmx.net>, Legal: WTFPL Version 2.
//
////////////////////////////////////////////////////////////////////////////////

//
// Returned by Compass_GetText if x and/or z are too large (>= 2.0).
//
const string Compass_Invalid = "";
//
// Returned by Compass_GetText if x and z are too small (< 0.00003).
//
const string Compass_Unknown = " ";

//
// Returns the compass character for the IEEE binary32 'x' and 'z'.
//
// You have to use/create a special font that includes all possible
// images for a rotation unit of 1.66667° (a total of 216 imgages).
// The first image for 0° (heading east) starts at '!' (33) because
// ' ' (32) is used for the image that indicates "unknown heading".
// The '\"' (34) is excluded because it cannot be used in Daedalus.
// Furthermore, the following characters are excluded to handle the
// problems with characters that are not displayable in the current
// 'Windows-1252' code page (http://support.microsoft.com/kb/197368
// http://msdn.microsoft.com/en-us/goglobal/cc305145.aspx):
// '\x7F' (127), '\x81' (129), '\x8D' (141),
// '\x8F' (143), '\x90' (144), '\x9D' (157).
//
func string Compass_GetText( var int x, var int z )
{
	var int a;
	var int e;
	var int s;
	
	// Save sign (east/west).
	e = (x < 0);
	// Convert IEEE binary32 float to int (scaled by 32768).
	a = (x >> 23) & 255;
	if (a > 127) {
		return Compass_Invalid;
	};
	if (a < 112) {
		x = 0;
	} else {
		x = ((x & 8388607) | 8388608) >> (135 - a);
	};
	
	// Save sign (south/north).
	s = (z < 0);
	// Convert IEEE binary32 float to int (scaled by 32768).
	a = (z >> 23) & 255;
	if (a > 127) {
		return Compass_Invalid;
	};
	if (a < 112) {
		z = 0;
	} else {
		z = ((z & 8388607) | 8388608) >> (135 - a);
	};
	
	// Scaled x = z / x (32768 = maxium scale without int overflow).
	if (!x) {
		if (!z) {
			return Compass_Unknown;
		};
		if (s) {
			return "Ê";  // 270.000° 162 '\xCA' [Alt+0202]
		};
		return "X";    //  90.000°  54 '\x58' [Alt+0088]
	};
	x = (z * 32768) / x;
	
	// 54-unit segment (90°) binary search for the scaled Tan(z/x).
	// Calculated with: Round(Tan((i * 2 + 1) * PI / (n * 4)) * s).
	// (where n = 54 (segment), i = [0,n-1], and s = 32768 (scale))
	// The comments contain <angle> <units> <character> <keyboard>.
	if (x <= 33735) {            //  45.833°
		if (x <= 13573) {          //  22.500°
			if (x <= 6271) {         //  10.833°
				if (x <= 3348) {       //   5.833°
					if (x <= 1431) {     //   2.500°
						if (x <= 477) {    //   0.833°
							if (e) {
								return "“";    // 180.000° 108 '\x93' [Alt+0147]
							};
							return "!";      //   0.000°   0 '\x21' [Alt+0033]
						};
						if (e) {
							if (s) {
								return "”";    // 181.667° 109 '\x94' [Alt+0148]
							};
							return "’";      // 178.333° 107 '\x92' [Alt+0146]
						};
						if (s) {
							return "ÿ";      // 358.333° 215 '\xFF' [Alt+0255]
						};
						return "#";        //   1.667°   1 '\x23' [Alt+0035]
					};
					if (x <= 2387) {     //   4.167°
						if (e) {
							if (s) {
								return "•";    // 183.333° 110 '\x95' [Alt+0149]
							};
							return "‘";      // 176.667° 106 '\x91' [Alt+0145]
						};
						if (s) {
							return "þ";      // 356.667° 214 '\xFE' [Alt+0254]
						};
						return "$";        //   3.333°   2 '\x24' [Alt+0036]
					};
					if (e) {
						if (s) {
							return "–";      // 185.000° 111 '\x96' [Alt+0150]
						};
						return "Ž";        // 175.000° 105 '\x8E' [Alt+0142]
					};
					if (s) {
						return "ý";        // 355.000° 213 '\xFD' [Alt+0253]
					};
					return "%";          //   5.000°   3 '\x25' [Alt+0037]
				};
				if (x <= 5288) {       //   9.167°
					if (x <= 4314) {     //   7.500°
						if (e) {
							if (s) {
								return "—";    // 186.667° 112 '\x97' [Alt+0151]
							};
							return "Œ";      // 173.333° 104 '\x8C' [Alt+0140]
						};
						if (s) {
							return "ü";      // 353.333° 212 '\xFC' [Alt+0252]
						};
						return "&";        //   6.667°   4 '\x26' [Alt+0038]
					};
					if (e) {
						if (s) {
							return "˜";      // 188.333° 113 '\x98' [Alt+0152]
						};
						return "‹";        // 171.667° 103 '\x8B' [Alt+0139]
					};
					if (s) {
						return "û";        // 351.667° 211 '\xFB' [Alt+0251]
					};
					return "'";          //   8.333°   5 '\x27' [Alt+0039]
				};
				if (e) {
					if (s) {
						return "™";        // 190.000° 114 '\x99' [Alt+0153]
					};
					return "Š";          // 170.000° 102 '\x8A' [Alt+0138]
				};
				if (s) {
					return "ú";          // 350.000° 210 '\xFA' [Alt+0250]
				};
				return "(";            //  10.000°   6 '\x28' [Alt+0040]
			};
			if (x <= 10332) {        //  17.500°
				if (x <= 8271) {       //  14.167°
					if (x <= 7264) {     //  12.500°
						if (e) {
							if (s) {
								return "š";    // 191.667° 115 '\x9A' [Alt+0154]
							};
							return "‰";      // 168.333° 101 '\x89' [Alt+0137]
						};
						if (s) {
							return "ù";      // 348.333° 209 '\xF9' [Alt+0249]
						};
						return ")";        //  11.667°   7 '\x29' [Alt+0041]
					};
					if (e) {
						if (s) {
							return "›";      // 193.333° 116 '\x9B' [Alt+0155]
						};
						return "ˆ";        // 166.667° 100 '\x88' [Alt+0136]
					};
					if (s) {
						return "ø";        // 346.667° 208 '\xF8' [Alt+0248]
					};
					return "*";          //  13.333°   8 '\x2A' [Alt+0042]
				};
				if (x <= 9293) {       //  15.833°
					if (e) {
						if (s) {
							return "œ";      // 195.000° 117 '\x9C' [Alt+0156]
						};
						return "‡";        // 165.000°  99 '\x87' [Alt+0135]
					};
					if (s) {
						return "÷";        // 345.000° 207 '\xF7' [Alt+0247]
					};
					return "+";          //  15.000°   9 '\x2B' [Alt+0043]
				};
				if (e) {
					if (s) {
						return "ž";        // 196.667° 118 '\x9E' [Alt+0158]
					};
					return "†";          // 163.333°  98 '\x86' [Alt+0134]
				};
				if (s) {
					return "ö";          // 343.333° 206 '\xF6' [Alt+0246]
				};
				return ",";            //  16.667°  10 '\x2C' [Alt+0044]
			};
			if (x <= 12469) {        //  20.833°
				if (x <= 11390) {      //  19.167°
					if (e) {
						if (s) {
							return "Ÿ";      // 198.333° 119 '\x9F' [Alt+0159]
						};
						return "…";        // 161.667°  97 '\x85' [Alt+0133]
					};
					if (s) {
						return "õ";        // 341.667° 205 '\xF5' [Alt+0245]
					};
					return "-";          //  18.333°  11 '\x2D' [Alt+0045]
				};
				if (e) {
					if (s) {
						return " ";        // 200.000° 120 '\xA0' [Alt+0160]
					};
					return "„";          // 160.000°  96 '\x84' [Alt+0132]
				};
				if (s) {
					return "ô";          // 340.000° 204 '\xF4' [Alt+0244]
				};
				return ".";            //  20.000°  12 '\x2E' [Alt+0046]
			};
			if (e) {
				if (s) {
					return "¡";          // 201.667° 121 '\xA1' [Alt+0161]
				};
				return "ƒ";            // 158.333°  95 '\x83' [Alt+0131]
			};
			if (s) {
				return "ó";            // 338.333° 203 '\xF3' [Alt+0243]
			};
			return "/";              //  21.667°  13 '\x2F' [Alt+0047]
		};
		if (x <= 22241) {          //  34.167°
			if (x <= 18288) {        //  29.167°
				if (x <= 15864) {      //  25.833°
					if (x <= 14704) {    //  24.167°
						if (e) {
							if (s) {
								return "¢";    // 203.333° 122 '\xA2' [Alt+0162]
							};
							return "‚";      // 156.667°  94 '\x82' [Alt+0130]
						};
						if (s) {
							return "ò";      // 336.667° 202 '\xF2' [Alt+0242]
						};
						return "0";        //  23.333°  14 '\x30' [Alt+0048]
					};
					if (e) {
						if (s) {
							return "£";      // 205.000° 123 '\xA3' [Alt+0163]
						};
						return "€";        // 155.000°  93 '\x80' [Alt+0128]
					};
					if (s) {
						return "ñ";        // 335.000° 201 '\xF1' [Alt+0241]
					};
					return "1";          //  25.000°  15 '\x31' [Alt+0049]
				};
				if (x <= 17058) {      //  27.500°
					if (e) {
						if (s) {
							return "¤";      // 206.667° 124 '\xA4' [Alt+0164]
						};
						return "~";        // 153.333°  92 '\x7E' [Alt+0126]
					};
					if (s) {
						return "ð";        // 333.333° 200 '\xF0' [Alt+0240]
					};
					return "2";          //  26.667°  16 '\x32' [Alt+0050]
				};
				if (e) {
					if (s) {
						return "¥";        // 208.333° 125 '\xA5' [Alt+0165]
					};
				return "}";          // 151.667°  91 '\x7D' [Alt+0125]
			};
			if (s) {
				return "ï";          // 331.667° 199 '\xEF' [Alt+0239]
			};
			return "3";            //  28.333°  17 '\x33' [Alt+0051]
		};
		if (x <= 20876) {        //  32.500°
			if (x <= 19559) {      //  30.833°
				if (e) {
					if (s) {
						return "¦";      // 210.000° 126 '\xA6' [Alt+0166]
					};
					return "|";        // 150.000°  90 '\x7C' [Alt+0124]
				};
				if (s) {
					return "î";        // 330.000° 198 '\xEE' [Alt+0238]
				};
				return "4";          //  30.000°  18 '\x34' [Alt+0052]
			};
			if (e) {
				if (s) {
					return "§";        // 211.667° 127 '\xA7' [Alt+0167]
				};
				return "{";          // 148.333°  89 '\x7B' [Alt+0123]
				};
				if (s) {
					return "í";          // 328.333° 197 '\xED' [Alt+0237]
				};
				return "5";            //  31.667°  19 '\x35' [Alt+0053]
			};
			if (e) {
				if (s) {
					return "¨";          // 213.333° 128 '\xA8' [Alt+0168]
				};
				return "z";            // 146.667°  88 '\x7A' [Alt+0122]
			};
			if (s) {
				return "ì";            // 326.667° 196 '\xEC' [Alt+0236]
			};
			return "6";              //  33.333°  20 '\x36' [Alt+0054]
		};
		if (x <= 28318) {          //  40.833°
			if (x <= 25144) {        //  37.500°
				if (x <= 23662) {      //  35.833°
					if (e) {
						if (s) {
							return "©";      // 215.000° 129 '\xA9' [Alt+0169]
						};
						return "y";        // 145.000°  87 '\x79' [Alt+0121]
					};
					if (s) {
						return "ë";        // 325.000° 195 '\xEB' [Alt+0235]
					};
					return "7";          //  35.000°  21 '\x37' [Alt+0055]
				};
				if (e) {
					if (s) {
						return "ª";        // 216.667° 130 '\xAA' [Alt+0170]
					};
					return "x";          // 143.333°  86 '\x78' [Alt+0120]
				};
				if (s) {
					return "ê";          // 323.333° 194 '\xEA' [Alt+0234]
				};
				return "8";            //  36.667°  22 '\x38' [Alt+0056]
			};
			if (x <= 26693) {        //  39.167°
				if (e) {
					if (s) {
						return "«";        // 218.333° 131 '\xAB' [Alt+0171]
					};
					return "w";          // 141.667°  85 '\x77' [Alt+0119]
				};
				if (s) {
					return "é";          // 321.667° 193 '\xE9' [Alt+0233]
				};
				return "9";            //  38.333°  23 '\x39' [Alt+0057]
			};
			if (e) {
				if (s) {
					return "¬";          // 220.000° 132 '\xAC' [Alt+0172]
				};
				return "v";            // 140.000°  84 '\x76' [Alt+0118]
			};
			if (s) {
				return "è";            // 320.000° 192 '\xE8' [Alt+0232]
			};
			return ":";              //  40.000°  24 '\x3A' [Alt+0058]
		};
		if (x <= 31828) {          //  44.167°
			if (x <= 30026) {        //  42.500°
				if (e) {
					if (s) {
						return "­";        // 221.667° 133 '\xAD' [Alt+0173]
					};
					return "u";          // 138.333°  83 '\x75' [Alt+0117]
				};
				if (s) {
					return "ç";          // 318.333° 191 '\xE7' [Alt+0231]
				};
				return ";";            //  41.667°  25 '\x3B' [Alt+0059]
			};
			if (e) {
				if (s) {
					return "®";          // 223.333° 134 '\xAE' [Alt+0174]
				};
				return "t";            // 136.667°  82 '\x74' [Alt+0116]
			};
			if (s) {
				return "æ";            // 316.667° 190 '\xE6' [Alt+0230]
			};
			return "<";              //  43.333°  26 '\x3C' [Alt+0060]
		};
		if (e) {
			if (s) {
				return "¯";            // 225.000° 135 '\xAF' [Alt+0175]
			};
			return "s";              // 135.000°  81 '\x73' [Alt+0115]
		};
		if (s) {
			return "å";              // 315.000° 189 '\xE5' [Alt+0229]
		};
		return "=";                //  45.000°  27 '\x3D' [Alt+0061]
	};
	if (x <= 86111) {            //  69.167°
		if (x <= 51435) {          //  57.500°
			if (x <= 42704) {        //  52.500°
				if (x <= 37917) {      //  49.167°
					if (x <= 35760) {    //  47.500°
						if (e) {
							if (s) {
								return "°";    // 226.667° 136 '\xB0' [Alt+0176]
							};
							return "r";      // 133.333°  80 '\x72' [Alt+0114]
						};
						if (s) {
							return "ä";      // 313.333° 188 '\xE4' [Alt+0228]
						};
						return ">";        //  46.667°  28 '\x3E' [Alt+0062]
					};
					if (e) {
						if (s) {
							return "±";      // 228.333° 137 '\xB1' [Alt+0177]
						};
						return "q";        // 131.667°  79 '\x71' [Alt+0113]
					};
					if (s) {
						return "ã";        // 311.667° 187 '\xE3' [Alt+0227]
					};
					return "?";          //  48.333°  29 '\x3F' [Alt+0063]
				};
				if (x <= 40225) {      //  50.833°
					if (e) {
						if (s) {
							return "²";      // 230.000° 138 '\xB2' [Alt+0178]
						};
						return "p";        // 130.000°  78 '\x70' [Alt+0112]
					};
					if (s) {
						return "â";        // 310.000° 186 '\xE2' [Alt+0226]
					};
					return "@";          //  50.000°  30 '\x40' [Alt+0064]
				};
				if (e) {
					if (s) {
						return "³";        // 231.667° 139 '\xB3' [Alt+0179]
					};
					return "o";          // 128.333°  77 '\x6F' [Alt+0111]
				};
				if (s) {
					return "á";          // 308.333° 185 '\xE1' [Alt+0225]
				};
				return "A";            //  51.667°  31 '\x41' [Alt+0065]
			};
			if (x <= 48277) {        //  55.833°
				if (x <= 45378) {      //  54.167°
					if (e) {
						if (s) {
							return "´";      // 233.333° 140 '\xB4' [Alt+0180]
						};
						return "n";        // 126.667°  76 '\x6E' [Alt+0110]
					};
					if (s) {
						return "à";        // 306.667° 184 '\xE0' [Alt+0224]
					};
					return "B";          //  53.333°  32 '\x42' [Alt+0066]
				};
				if (e) {
					if (s) {
						return "µ";        // 235.000° 141 '\xB5' [Alt+0181]
					};
					return "m";          // 125.000°  75 '\x6D' [Alt+0109]
				};
				if (s) {
					return "ß";          // 305.000° 183 '\xDF' [Alt+0223]
				};
				return "C";            //  55.000°  33 '\x43' [Alt+0067]
			};
			if (e) {
				if (s) {
					return "¶";          // 236.667° 142 '\xB6' [Alt+0182]
				};
				return "l";            // 123.333°  74 '\x6C' [Alt+0108]
			};
			if (s) {
				return "Þ";            // 303.333° 182 '\xDE' [Alt+0222]
			};
			return "D";              //  56.667°  34 '\x44' [Alt+0068]
		};
		if (x <= 67683) {          //  64.167°
			if (x <= 58712) {        //  60.833°
				if (x <= 54896) {      //  59.167°
					if (e) {
						if (s) {
							return "·";      // 238.333° 143 '\xB7' [Alt+0183]
						};
						return "k";        // 121.667°  73 '\x6B' [Alt+0107]
					};
					if (s) {
						return "Ý";        // 301.667° 181 '\xDD' [Alt+0221]
					};
					return "E";          //  58.333°  35 '\x45' [Alt+0069]
				};
				if (e) {
					if (s) {
						return "¸";        // 240.000° 144 '\xB8' [Alt+0184]
					};
					return "j";          // 120.000°  72 '\x6A' [Alt+0106]
				};
				if (s) {
					return "Ü";          // 300.000° 180 '\xDC' [Alt+0220]
				};
				return "F";            //  60.000°  36 '\x46' [Alt+0070]
			};
			if (x <= 62947) {        //  62.500°
				if (e) {
					if (s) {
						return "¹";        // 241.667° 145 '\xB9' [Alt+0185]
					};
					return "i";          // 118.333°  71 '\x69' [Alt+0105]
				};
				if (s) {
					return "Û";          // 298.333° 179 '\xDB' [Alt+0219]
				};
				return "G";            //  61.667°  37 '\x47' [Alt+0071]
			};
			if (e) {
				if (s) {
					return "º";          // 243.333° 146 '\xBA' [Alt+0186]
				};
				return "h";            // 116.667°  70 '\x68' [Alt+0104]
			};
			if (s) {
				return "Ú";            // 296.667° 178 '\xDA' [Alt+0218]
			};
			return "H";              //  63.333°  38 '\x48' [Alt+0072]
		};
		if (x <= 79109) {          //  67.500°
			if (x <= 73026) {        //  65.833°
				if (e) {
					if (s) {
						return "»";        // 245.000° 147 '\xBB' [Alt+0187]
					};
					return "g";          // 115.000°  69 '\x67' [Alt+0103]
				};
				if (s) {
					return "Ù";          // 295.000° 177 '\xD9' [Alt+0217]
				};
				return "I";            //  65.000°  39 '\x49' [Alt+0073]
			};
			if (e) {
				if (s) {
					return "¼";          // 246.667° 148 '\xBC' [Alt+0188]
				};
				return "f";            // 113.333°  68 '\x66' [Alt+0102]
			};
			if (s) {
				return "Ø";            // 293.333° 176 '\xD8' [Alt+0216]
			};
			return "J";              //  66.667°  40 '\x4A' [Alt+0074]
		};
		if (e) {
			if (s) {
				return "½";            // 248.333° 149 '\xBD' [Alt+0189]
			};
			return "e";              // 111.667°  67 '\x65' [Alt+0101]
		};
		if (s) {
			return "×";              // 291.667° 175 '\xD7' [Alt+0215]
		};
		return "K";                //  68.333°  41 '\x4B' [Alt+0075]
	};
	if (x <= 203064) {           //  80.833°
		if (x <= 129815) {         //  75.833°
			if (x <= 103927) {       //  72.500°
				if (x <= 94273) {      //  70.833°
					if (e) {
						if (s) {
							return "¾";      // 250.000° 150 '\xBE' [Alt+0190]
						};
						return "d";        // 110.000°  66 '\x64' [Alt+0100]
					};
					if (s) {
						return "Ö";        // 290.000° 174 '\xD6' [Alt+0214]
					};
					return "L";          //  70.000°  42 '\x4C' [Alt+0076]
				};
				if (e) {
					if (s) {
						return "¿";        // 251.667° 151 '\xBF' [Alt+0191]
					};
					return "c";          // 108.333°  65 '\x63' [Alt+0099]
				};
				if (s) {
					return "Õ";          // 288.333° 173 '\xD5' [Alt+0213]
				};
				return "M";            //  71.667°  43 '\x4D' [Alt+0077]
			};
			if (x <= 115543) {       //  74.167°
				if (e) {
					if (s) {
						return "À";        // 253.333° 152 '\xC0' [Alt+0192]
					};
					return "b";          // 106.667°  64 '\x62' [Alt+0098]
				};
				if (s) {
					return "Ô";          // 286.667° 172 '\xD4' [Alt+0212]
				};
				return "N";            //  73.333°  44 '\x4E' [Alt+0078]
			};
			if (e) {
				if (s) {
					return "Á";          // 255.000° 153 '\xC1' [Alt+0193]
				};
				return "a";            // 105.000°  63 '\x61' [Alt+0097]
			};
			if (s) {
				return "Ó";            // 285.000° 171 '\xD3' [Alt+0211]
			};
			return "O";              //  75.000°  45 '\x4F' [Alt+0079]
		};
		if (x <= 171235) {         //  79.167°
			if (x <= 147807) {       //  77.500°
				if (e) {
					if (s) {
						return "Â";        // 256.667° 154 '\xC2' [Alt+0194]
					};
					return "`";          // 103.333°  62 '\x60' [Alt+0096]
				};
				if (s) {
					return "Ò";          // 283.333° 170 '\xD2' [Alt+0210]
				};
				return "P";            //  76.667°  46 '\x50' [Alt+0080]
			};
			if (e) {
				if (s) {
					return "Ã";          // 258.333° 155 '\xC3' [Alt+0195]
				};
				return "_";            // 101.667°  61 '\x5F' [Alt+0095]
			};
			if (s) {
				return "Ñ";            // 281.667° 169 '\xD1' [Alt+0209]
			};
			return "Q";              //  78.333°  47 '\x51' [Alt+0081]
		};
		if (e) {
			if (s) {
				return "Ä";            // 260.000° 156 '\xC4' [Alt+0196]
			};
			return "^";              // 100.000°  60 '\x5E' [Alt+0094]
		};
		if (s) {
			return "Ð";              // 280.000° 168 '\xD0' [Alt+0208]
		};
		return "R";                //  80.000°  48 '\x52' [Alt+0082]
	};
	if (x <= 449798) {           //  85.833°
		if (x <= 320739) {         //  84.167°
			if (x <= 248898) {       //  82.500°
				if (e) {
					if (s) {
						return "Å";        // 261.667° 157 '\xC5' [Alt+0197]
					};
					return "]";          //  98.333°  59 '\x5D' [Alt+0093]
				};
				if (s) {
					return "Ï";          // 278.333° 167 '\xCF' [Alt+0207]
				};
				return "S";            //  81.667°  49 '\x53' [Alt+0083]
			};
			if (e) {
				if (s) {
					return "Æ";          // 263.333° 158 '\xC6' [Alt+0198]
				};
				return "\";            //  96.667°  58 '\x5C' [Alt+0092] "
			};
			if (s) {
				return "Î";            // 276.667° 166 '\xCE' [Alt+0206]
			};
			return "T";              //  83.333°  50 '\x54' [Alt+0084]
		};
		if (e) {
			if (s) {
				return "Ç";            // 265.000° 159 '\xC7' [Alt+0199]
			};
			return "[";              //  95.000°  57 '\x5B' [Alt+0091]
		};
		if (s) {
			return "Í";              // 275.000° 165 '\xCD' [Alt+0205]
		};
		return "U";                //  85.000°  51 '\x55' [Alt+0085]
	};
	if (x <= 2252803) {          //  89.167°
		if (x <= 750511) {         //  87.500°
			if (e) {
				if (s) {
					return "È";          // 266.667° 160 '\xC8' [Alt+0200]
				};
				return "Z";            //  93.333°  56 '\x5A' [Alt+0090]
			};
			if (s) {
				return "Ì";            // 273.333° 164 '\xCC' [Alt+0204]
			};
			return "V";              //  86.667°  52 '\x56' [Alt+0086]
		};
		if (e) {
			if (s) {
				return "É";            // 268.333° 161 '\xC9' [Alt+0201]
			};
			return "Y";              //  91.667°  55 '\x59' [Alt+0089]
		};
		if (s) {
			return "Ë";              // 271.667° 163 '\xCB' [Alt+0203]
		};
		return "W";                //  88.333°  53 '\x57' [Alt+0087]
	};
	if (s) {
		return "Ê";                // 270.000° 162 '\xCA' [Alt+0202]
	};
	return "X";                  //  90.000°  54 '\x58' [Alt+0088]
};

//
// Helper class to directly access the AtVector of a zCVob object.
//
class Compass_VobInfo
{
	//zCObject {
		var int    _vtbl;                   // 0x0000
		var int    refCtr;                  // 0x0004 int
		var int    hashIndex;               // 0x0008 zWORD
		var int    hashNext;                // 0x000C zCObject*
		var string objectName;              // 0x0010 zSTRING
	//}
	var int    globalVobTreeNode;       // 0x0024 zCTree<zCVob>*
	var int    lastTimeDrawn;           // 0x0028 zTFrameCtr
	var int    lastTimeCollected;       // 0x002C zDWORD
	//zCArray<zCBspLeaf*> {
		var int    vobLeafList_array;       // 0x0030 zCBspLeaf**
		var int    vobLeafList_numAlloc;    // 0x0034 int
		var int    vobLeafList_numInArray;  // 0x0038 int
	//}
	var int    trafoObjToWorld[16];     // 0x003C zMATRIX4
	//zTBBox3D {
		var int    bbox3D_mins[3];          // 0x007C zPOINT3
		var int    bbox3D_maxs[3];          // 0x0088 zPOINT3
	//}
	// ...
	// The following fields differ in Gothic I and Gothic II.
	// ...
};

//
// Returns the compass character for the current player character.
//
func string Compass_ForHero()
{
	var Compass_VobInfo h;
	
	h = Hlp_GetNpc( Hlp_GetInstanceId( hero ) );
	if (!Hlp_IsValidNpc( h )) {
		return Compass_Invalid;
	};
	return Compass_GetText( h.trafoObjToWorld[2], h.trafoObjToWorld[10] );
};

