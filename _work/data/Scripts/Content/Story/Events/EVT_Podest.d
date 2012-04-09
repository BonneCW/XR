var int PODESTSCHALTER1;
var int PODESTSCHALTER2;
var int PODESTSCHALTER3;
var int PODESTSCHALTERSUCSES;

// 
//  Der erste Schalter, ganz rechts
// 

FUNC VOID PODESTSCHALTERTEST ()
{
	if (PODESTSCHALTER1 == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play 	("Ravens_Earthquake4" );
		Wld_SendTrigger( "DUNKLERRITTER2" );

		PODESTSCHALTER2 = FALSE;
		PODESTSCHALTER1 = TRUE;
	};	
};

// 
// Der zweite Schalter, ganz links
// 

FUNC VOID PODESTSCHALTERTEST2 ()
{
	if (PODESTSCHALTER2 == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play 	("Ravens_Earthquake4" );
		Wld_SendTrigger( "DUNKLERRITTER" );

		PODESTSCHALTER3 = FALSE;
		PODESTSCHALTER2 = TRUE;
	};	
};


// 
//  Der dritte Schalter, na in der mitte. wo den sonst.
// 

FUNC VOID PODESTSCHALTERTEST3 ()
{
	if (PODESTSCHALTER3 == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play 	("Ravens_Earthquake4" );
		Wld_SendTrigger( "DREIPODESTTRIGGERMOVER" );
		Wld_SendTrigger( "HELDENPODEST" );

		PODESTSCHALTER3 = TRUE;
	};	
};

//  Der weg raus und den Test bestanden. War ja nicht scher. Schaltet den zweiten Raum gegnüber frei.
// 

FUNC VOID PODESTSCHALTERSUCSESFUNK ()
{
	if (PODESTSCHALTER3 == TRUE)
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play 	("Ravens_Earthquake4" );
		Wld_SendTrigger( "HELDENPODESTRUNEPFX" );
		Wld_InsertItem	(ItMi_OrnamentEffekt_BIGFARM_Addon, "HELDENPODESTRUNE"); 

		PODESTSCHALTER3 = FALSE;
	};	
};