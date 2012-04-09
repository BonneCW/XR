// ******************************************************************************************************
//  			B_NPC_IsAliveCheck			(für NPCs die eine Levelchange vollziehen)
// ******************************************************************************************************
var int SLD_Bullco_is_alive;	//Check, ob die SLD noch leben und zum Drachenjäger gemacht werden können.
var int SLD_Rod_is_alive;
var int SLD_Cipher_is_alive;
var int SLD_Gorn_is_alive;
var int SLD_Sylvio_is_alive;
var int GornDJG_is_alive;
var int DJG_Angar_is_alive;

var int DiegoOW_is_alive;	//wird bei ready for Chapter 3 im Garond-Dialog gesetzt
var int GornOw_is_alive;	//wird bei ready for Chapter 3 im Garond-Dialog gesetzt

//---innerhalb der Zens bei kapitelwechsel, ohne B_NPC_IsAliveCheck ----
var int Vino_isAlive_Kap3;
var int Malak_isAlive_Kap3;

FUNC VOID B_NPC_IsAliveCheck (var int Zen)
{
// ***********************************************************
// ***********************************************************
// 						NEWWORLD
// ***********************************************************
// ***********************************************************
	if (Zen == NEWWORLD_ZEN )
	{
		if (Kapitel >= 2)
		{
		};
		
		if (Kapitel >= 3)
		{
		};
		
		if (MIS_ReadyforChapter4 == TRUE)	//Joly: letzter Pyrokar Dialog im 3. Kapitel
		{
			// 	Drachenjäger	(Check, ob die SLD noch leben und zum Drachenjäger gemacht werden können.)
			// ***********************************************************
		};
		
		if (Kapitel >= 5)
		{
		};
		
		if (Kapitel >= 6)
		{
		};
	};
// ***********************************************************
// ***********************************************************
// 						OLDWORLD
// ***********************************************************
// ***********************************************************

	if (Zen == OLDWORLD_ZEN )
	{
		if (Kapitel >= 2)
		{
		};
		
		if (Kapitel >= 3)
		{
		};
		
		if (Kapitel >= 4)
		{
		};
		
		if (Kapitel >= 5)
		{
		};
		
		if (Kapitel >= 6)
		{
		};
	};
};

