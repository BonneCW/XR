// ***************************************************
//  			B_ENTER_NEWWORLD			
// ***************************************************

// B_ENTER_NEWWORLD_Kapitel_1
//****************************************************
FUNC VOID B_ENTER_NEWWORLD_Kapitel_1 ()
{

		
};
// B_ENTER_NEWWORLD_Kapitel_2
//****************************************************
	var int EnterNW_Kapitel2;
FUNC VOID B_ENTER_NEWWORLD_Kapitel_2 ()
{
	
	//Addon patch m.f. greg muss weg
	
	
	
	if (EnterNW_Kapitel2 == FALSE)
	{
		

 		EnterNW_Kapitel2 = TRUE;
	};
};

// B_ENTER_NEWWORLD_Kapitel_3
//****************************************************
	var int EnterNW_Kapitel3;
FUNC VOID B_ENTER_NEWWORLD_Kapitel_3 ()
{
	if (EnterNW_Kapitel3 == FALSE)
	{
		
		EnterNW_Kapitel3 = TRUE;
	};
};

// B_ENTER_NEWWORLD_Kapitel_4
//****************************************************
	var int EnterNW_Kapitel4;
FUNC VOID B_ENTER_NEWWORLD_Kapitel_4 ()
{
	if (EnterNW_Kapitel4 == FALSE)
	{
	
		EnterNW_Kapitel4 = TRUE;
	};

		
};

// B_ENTER_NEWWORLD_Kapitel_5
//****************************************************
	var int EnterNW_Kapitel5;
	var int Pal_Schiffswache_Exchange_onetime;
	var int Rosi_FleeFromSekob_Kap5;
FUNC VOID B_ENTER_NEWWORLD_Kapitel_5 ()
{
	if (EnterNW_Kapitel5 == FALSE)
	{
		

	EnterNW_Kapitel5 = TRUE;
	};
	
	
};

//****************************************************
// B_ENTER_NEWWORLD_Kapitel_6
//****************************************************
	var int EnterNW_Kapitel6;
FUNC VOID B_ENTER_NEWWORLD_Kapitel_6 ()
{
	if (EnterNW_Kapitel6 == FALSE)
	{
		
		EnterNW_Kapitel6 = TRUE;
	};
};

// ******************************************************************************************************************************************************************
// B_ENTER_NEWWORLD			 (wird über INIT_NEWWORLD in der NW beim Betreten aufgerufen (Beispiel: für DJG, die erst nach dem 1.Betreten der OW eingesetzt werden))
// ******************************************************************************************************************************************************************

FUNC VOID B_ENTER_NEWWORLD ()	
{
	B_InitNpcGlobals (); 
	if (Kapitel >= 1)	{B_ENTER_NEWWORLD_Kapitel_1 ();	};
	if (Kapitel >= 2)	{B_ENTER_NEWWORLD_Kapitel_2 ();	};
	if (Kapitel >= 3)	{B_ENTER_NEWWORLD_Kapitel_3 ();	};
	if (Kapitel >= 4)	{B_ENTER_NEWWORLD_Kapitel_4 ();	};
	if (Kapitel >= 5)	{B_ENTER_NEWWORLD_Kapitel_5 ();	};
	if (Kapitel >= 6)	{B_ENTER_NEWWORLD_Kapitel_6 ();	};
	CurrentLevel = NEWWORLD_ZEN; 
	B_InitNpcGlobals ();
};
