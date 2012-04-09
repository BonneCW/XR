// ***************************************************
//  			B_ENTER_ADDONWORLD			
// ***************************************************

// B_ENTER_ADDONWORLD_Kapitel_1
//****************************************************
var int EnterADW_Kapitel1;

FUNC VOID B_ENTER_ADDONWORLD_Kapitel_1 ()
{
	if (EnterADW_Kapitel1 == FALSE)
	{
//		B_Kapitelwechsel (2, ADDONWORLD_ZEN);

		EnterADW_Kapitel1 = TRUE;
	};		
};

// B_ENTER_ADDONWORLD_Kapitel_2
//****************************************************
	var int EnterADW_Kapitel2;
FUNC VOID B_ENTER_ADDONWORLD_Kapitel_2 ()
{
	if (EnterADW_Kapitel2 == FALSE)
	{
	
		// ------ Gilden-Attitüden ändern ------

		// ------ Immortal-Flags löschen ------

		// ------ TAs ändern ------

		// ------ Respawn ------

		EnterADW_Kapitel2 = TRUE;
	};
};

// B_ENTER_ADDONWORLD_Kapitel_3
//****************************************************
	var int EnterADW_Kapitel3;
FUNC VOID B_ENTER_ADDONWORLD_Kapitel_3 ()
{
	if (EnterADW_Kapitel3 == FALSE)
	{
	
		// ------ Gilden-Attitüden ändern ------

		// ------ Immortal-Flags löschen ------

		// ------ TAs ändern ------

		// ------ Respawn ------
 
		EnterADW_Kapitel3 = TRUE;
	};
};

// B_ENTER_ADDONWORLD_Kapitel_4
//****************************************************
	var int EnterADW_Kapitel4;
FUNC VOID B_ENTER_ADDONWORLD_Kapitel_4 ()
{
	if (EnterADW_Kapitel4 == FALSE)
	{
	
		
 	EnterADW_Kapitel4 = TRUE;
	};
};

// B_ENTER_ADDONWORLD_Kapitel_5
//****************************************************
var int EnterADW_Kapitel5;

FUNC VOID B_ENTER_ADDONWORLD_Kapitel_5 ()
{
	if (EnterADW_Kapitel5 == FALSE)
	{
	
		// ------ Gilden-Attitüden ändern ------

		// ------ Immortal-Flags löschen ------

		// ------ TAs ändern ------

		// ------ Respawn ------


	EnterADW_Kapitel5 = TRUE;
	};
};

//****************************************************
// B_ENTER_ADDONWORLD_Kapitel_6
//****************************************************
	var int EnterADW_Kapitel6;
FUNC VOID B_ENTER_ADDONWORLD_Kapitel_6 ()
{
	if (EnterADW_Kapitel6 == FALSE)
	{
		// ------ Gilden-Attitüden ändern ------
		
		// ------ Immortal-Flags löschen ------

		// ------ TAs ändern ------

		// ------ Respawn ------

		EnterADW_Kapitel6 = TRUE;
	};
};

// ******************************************************************************************************************************************************************
// B_ENTER_ADDONWORLD			 (wird über INIT_ADDONWORLD)
// ******************************************************************************************************************************************************************

FUNC VOID B_ENTER_ADDONWORLD ()	
{
	B_InitNpcGlobals (); 
	if (Kapitel >= 1)	{B_ENTER_ADDONWORLD_Kapitel_1 ();	};
	if (Kapitel >= 2)	{B_ENTER_ADDONWORLD_Kapitel_2 ();	};
	if (Kapitel >= 3)	{B_ENTER_ADDONWORLD_Kapitel_3 ();	};
	if (Kapitel >= 4)	{B_ENTER_ADDONWORLD_Kapitel_4 ();	};
	if (Kapitel >= 5)	{B_ENTER_ADDONWORLD_Kapitel_5 ();	};
	if (Kapitel >= 6)	{B_ENTER_ADDONWORLD_Kapitel_6 ();	};
	
	CurrentLevel = ADDONWORLD_ZEN; 
	B_InitNpcGlobals ();
};
