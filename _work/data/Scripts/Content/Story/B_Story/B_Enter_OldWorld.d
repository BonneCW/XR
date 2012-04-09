// ***************************************************
//  			B_ENTER_OLDWORLD			
// ***************************************************


// B_ENTER_OLDWORLD_Kapitel_1
//****************************************************
	var int EnterOW_Kapitel1;
FUNC VOID B_ENTER_OLDWORLD_Kapitel_1 ()
{
	if (EnterOW_Kapitel1 == FALSE)
	{
		// ------ Gilden-Attitüden ändern ------
		
		// ------ Immortal-Flags löschen ------

		// ------ TAs ändern ------

		// ------ Respawn ------

		EnterOW_Kapitel1 = TRUE;
	};
};

// B_ENTER_OLDWORLD_Kapitel_2
//****************************************************
	var int EnterOW_Kapitel2;
FUNC VOID B_ENTER_OLDWORLD_Kapitel_2 ()
{
	if (EnterOW_Kapitel2 == FALSE)
	{
		// ------ Gilden-Attitüden ändern ------
		
		// ------ Immortal-Flags löschen ------

		// ------ TAs ändern ------
		//------------- Steht unten am Weg 1. Charakter in Oldworld---------------------------------------------------------
	// ------ Respawn ------
	
	EnterOW_Kapitel2 = TRUE;
	};
};

// B_ENTER_OLDWORLD_Kapitel_3
//****************************************************
	var int EnterOW_Kapitel3;
FUNC VOID B_ENTER_OLDWORLD_Kapitel_3 ()
{
	if (EnterOW_Kapitel3 == FALSE)
	{
		
		// ------ Respawn ------
		EnterOW_Kapitel3 = TRUE;
	};
};
// B_ENTER_OLDWORLD_Kapitel_4
//****************************************************
	var int EnterOW_Kapitel4;
FUNC VOID B_ENTER_OLDWORLD_Kapitel_4 ()
{
	if (EnterOW_Kapitel4 == FALSE)	// Inserten der Drachenjäger wenn Drachenjagd eröffnet
		{
		// ------ Gilden-Attitüden ändern ------
		
		EnterOW_Kapitel4 = TRUE;
		};
	
		
};

//****************************************************
// B_ENTER_OLDWORLD_Kapitel_5
//****************************************************
	var int EnterOW_Kapitel5;
FUNC VOID B_ENTER_OLDWORLD_Kapitel_5 ()
{
	if  (EnterOW_Kapitel5 == FALSE)
	 	{
		
		EnterOW_Kapitel5 = TRUE;
		};

	
};

//****************************************************
// B_ENTER_OLDWORLD_Kapitel_6
//****************************************************
	var int EnterOW_Kapitel6;
FUNC VOID B_ENTER_OLDWORLD_Kapitel_6 ()
{
	if (EnterOW_Kapitel6 == FALSE)
	{
		// ------ Gilden-Attitüden ändern ------
		
		// ------ Immortal-Flags löschen ------

		// ------ TAs ändern ------

		// ------ Respawn ------

		EnterOW_Kapitel6 = TRUE;
	};
};
// ******************************************************************************************************************************************************************
// B_ENTER_OLDWORLD			 (wird über INIT_OLDWORLD in der OW beim Betreten aufgerufen (Beispiel: für DJG, die erst nach dem 1.Betreten der OW eingesetzt werden))
// ******************************************************************************************************************************************************************

FUNC VOID B_ENTER_OLDWORLD ()	
{
	B_InitNpcGlobals (); 
	if (Kapitel >= 1)	{B_ENTER_OLDWORLD_Kapitel_1 ();	};
	if (Kapitel >= 2)	{B_ENTER_OLDWORLD_Kapitel_2 ();	};
	if (Kapitel >= 3)	{B_ENTER_OLDWORLD_Kapitel_3 ();	};
	if (Kapitel >= 4)	{B_ENTER_OLDWORLD_Kapitel_4 ();	};
	if (Kapitel >= 5)	{B_ENTER_OLDWORLD_Kapitel_5 ();	};
	if (Kapitel >= 6)	{B_ENTER_OLDWORLD_Kapitel_6 ();	};
	CurrentLevel = OLDWORLD_ZEN;
	B_InitNpcGlobals (); 
	
	
};

