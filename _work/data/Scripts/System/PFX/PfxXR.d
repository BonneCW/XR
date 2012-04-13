INSTANCE MFX_Moorblase (C_PARTICLEFX)
{
     ppsvalue = 90;
     ppsislooping = 0;
     ppsScaleKeys_S="0 0 0 0 0 0 0 0 1";
     ppsIsSmooth=0;
     ppsFPS=4;
     /*shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RANDOM";
     shpdim_s = "7";
     shpmesh_s = "SKULL.3DS";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;*/
     shpOffsetVec_S="0 19 0";
     
     shptype_s = "CIRCLE";
     shpfor_s = "WORLD";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2;
     shpdim_s = "5";
     shpscalekeys_s = "1 ";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
	 dirmode_s = "NONE";
	 dirmodetargetpos_s ="0 0 0";
     dirmodetargetfor_s = "WORLD";
     dirAngleHead=30;
     dirAngleHeadVar=0;
     dirAngleElev=180;
     dirAngleElevVar=0;
     velavg = 0.04000001;
     lsppartavg = 400;
     flygravity_s = "0 -0.00035 0";
     visname_s = "SWAMPBUBBLEFX.TGA";
     visorientation_s = "VELO";
     vistexanifps = 3;
     visTexIsQuadPoly=1;
     vistexcolorstart_s = "100 80 50";
     vistexcolorend_s = "100 80 50";
     vissizestart_s = "5 5";
     vissizeendscale = 1.200000006;
     visalphafunc_s = "BLEND";
     visAlphaStart= 255;
     visalphaend = 255;
};
INSTANCE MFX_Moorblase_kugel (C_PARTICLEFX)
{
    
     /*shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RANDOM";
     shpdim_s = "7";
     shpmesh_s = "SKULL.3DS";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;*/
     
     
     ppsvalue = 2;
     ppsislooping = 0;
     ppsScaleKeys_S="1 1 1";
     ppsIsSmooth=1;
     ppsCreateEm_S="MFX_MOORBLASE";
     ppsFPS=5;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpIsVolume=0;
     shpdistribtype_s = "RAND";     
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
	 dirmode_s = "DIR";
	 dirmodetargetpos_s ="0 0 0";
     dirmodetargetfor_s = "WORLD";
     dirAngleHead=90;
     dirAngleHeadVar=0;
     dirAngleElev=180;
     dirAngleElevVar=0;
     velavg = 0.00000000001;
     lsppartavg = 1500;
     flygravity_s = "0 0 0";
     visname_s = "SWAMPBUBBLE.TGA";
     visorientation_s = "VELO";     
     visTexIsQuadPoly=1;
     visAlphaStart= 255;
     vistexcolorstart_s = "100 80 50";
     vistexcolorend_s = "100 80 50";
     vissizestart_s = "20 20";
     vissizeendscale = 1.800000006;
     visalphafunc_s = "BLEND";
     visalphaend = 255;
};

INSTANCE MFX_STAUB (C_PARTICLEFX)
{
     ppsvalue = 5000.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 0;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "500";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.020000000;
     velvar = 0.008000000;
     lsppartavg = 15000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 -0.0003 0";
     flyCollDet_B = 3;
     visname_s = "XR_STAUB.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "1 1";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};

Prototype Pfx_Shield(C_PARTICLEFX)
{
     ppsvalue = 1;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
     ppsislooping = 1;
     ppsfps = 0;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "200";
     shpmesh_s = "schild_01.3DS";
     shpmeshrender_b = 1;	//rendert die shpmesh_s
     shpscalekeys_s = "1";
     shpscaleislooping = 0;
     shpscaleissmooth = 1;
     shpscalefps = 1;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     diranglehead = 180;
     dirangleheadvar = 0;
     dirangleelev = 90;
     velavg = 0.0;
     velvar = 0.0;
     lsppartavg = 0;
     flygravity_s = "0 0 0";
     visname_s = "";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 1;
     vistexaniislooping = 0;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 5;
     visalphafunc_s = "NONE";
     visalphastart = 255;
};





instance PFX_Schild_01(PFX_SHIELD) {
	shpmesh_s = "schild_01.3ds";	// Schild visual das an den Rücken geheftet wird.	
	shpdim_s  = "200";
};

instance PFX_Schild_01_A(PFX_SHIELD) {
	shpmesh_s = "schild_01_A.3ds";	// Schild visual das in der linken Hand gehalten wird
	shpdim_s  = "200";
}; 

INSTANCE Moorgift (C_PARTICLEFX)
{
     ppsvalue = 30;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "Point";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "400";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50;
     dirangleelev = 90;
     dirangleelevvar = 20;
     velavg = 0.0399999991;
     lsppartavg = 10000;
     lsppartvar = 400;
     flygravity_s = "0 -0.00005 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 50;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     flockmode = "none";
     flockstrength = 0.0500000007;
     m_bisambientpfx = 1;
};


/*INSTANCE GIFTFOG (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.020000000;
     velvar = 0.008000000;
     lsppartavg = 8000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 -0.000005 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 0";
     vistexcolorend_s = "0 255 0";
     vissizestart_s = "20 20";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
  flockmode = "WIND";
     flockstrength = 0.0500000007;
     m_bisambientpfx = 1;
};*/

INSTANCE GIFTFOG (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.020000000;
     velvar = 0.008000000;
     lsppartavg = 15000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 -0.000005 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 0";
     vistexcolorend_s = "0 255 0";
     vissizestart_s = "20 20";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};