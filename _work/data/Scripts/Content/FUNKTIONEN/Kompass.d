////////////////////////////////////////////////////////////////////////////////
//
//  Example for the usage of the compass support script (\_intern\Compass.d).
//  Copyright (c) 2009 Nico Bendlin <nicode@gmx.net>, Legal: WTFPL Version 2.
//
////////////////////////////////////////////////////////////////////////////////

//
// You have to add an oCTriggerScript (named "COMPASS_TRIGGER") into every ZEN
// and have to call Wld_SendTrigger( "COMPASS_TRIGGER" ) from INIT_<Zen_Name>.
//
func void Kompass()
{
	var string f;
	var string t;
	
	f = "Font_Kompass.tga";  // line of sight
	
	//f = "Font_Kompass.tga";  // compass rose (not included in the package)
	
	t = Compass_ForHero();
	
	if (Hlp_StrCmp( t, Compass_Invalid ))
	{
		f = "Font_Default.tga";
		t = "<invalid>";
	};
	if (Hlp_StrCmp( t, Compass_Unknown ))
	{
		f = "Font_Default.tga";
		t = "<unknown>";
	};
	
	PrintScreen( t, 0, -1, f, 1 );
};

