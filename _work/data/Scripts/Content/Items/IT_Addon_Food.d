/******************************************************************************************/
//	RUM																	//
/******************************************************************************************/

CONST int Value_Rum = 30;
CONST int Mana_Rum  = 10;

CONST int Value_Rumtopf = 50;
CONST int Mana_Rumtopf  = 15;
CONST int HP_Rumtopf  = 20;

const int Value_Grog = 10;
const int HP_Grog	 = 1;

const int Value_SchnellerHering	= 30;	

const int Value_LousHammer = 30;
const int Mana_LousHammer = 1;

const int Value_SchlafHammer = 60;

const int Value_FireStew = 180;
const int STR_FireStew	= 1;
const int HP_FireStew	= 5;
const int STR_MeatSoup	= 1;

const int Value_Shellflesh	= 60;
const int HP_Shellflesh		= 20;
//---------------------------------------------------------------------
//	Muschelfleisch
//---------------------------------------------------------------------
INSTANCE ItFo_Addon_Shellflesh (C_Item)
{
	name 				=	"Muschelfleisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Shellflesh;

	visual 				=	"ItAt_Meatbugflesh.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Shellflesh;

	description			= 	name;
	
	if (Mod_ItFo_Addon_Shellflesh_Right == 1)
	{
		TEXT[0]			=	"Saftiges Muschelfleisch";
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Shellflesh;
		TEXT[2]			=	"Roh unbedingt genießbar";
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

	FUNC VOID Use_Shellflesh()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Shellflesh);

		self.aivar[AIV_Damage] += HP_Shellflesh;

		if (self.aivar[AIV_Damage] > self.attribute[ATR_HITPOINTS_MAX])
		{
			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
		};

		B_SetEsspunkte	(80);

		if (Mod_ItFo_Addon_Shellflesh_Right == 0)
		&& (Npc_IsPlayer(self))
		{

			Mod_ItFo_Addon_Shellflesh_Right = 1;

			Mod_ItFo_Addon_Shellflesh_Anzahl = Npc_HasItems(hero, ItFo_Addon_Shellflesh);
			Npc_RemoveInvItems (hero, ItFo_Addon_Shellflesh, Mod_ItFo_Addon_Shellflesh_Anzahl);
			CreateInvItems	(hero, ItFo_Addon_Shellflesh, Mod_ItFo_Addon_Shellflesh_Anzahl);
		};

		B_HealGift (0, HP_Shellflesh*2);
	};

//-----------------------------
INSTANCE ItFo_Addon_Rum(C_Item)
{
	name 			=	"Rum";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Rum;	

	visual 			=	"ItMi_Rum_02.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseRum;
	scemeName		=	"POTIONFAST";

	description		= 	"Weißer Rum";
	
	if (Mod_ItFo_Addon_Rum_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_Mana;	
		COUNT[1]			= 	Mana_Rum;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Rum;

};

	FUNC VOID UseRum()
	{			
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Rum);

		if (Mod_ItFo_Addon_Rum_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Addon_Rum_Right = 1;

			Mod_ItFo_Addon_Rum_Anzahl = Npc_HasItems(hero, ItFo_Addon_Rum);
			Npc_RemoveInvItems (hero, ItFo_Addon_Rum, Mod_ItFo_Addon_Rum_Anzahl);
			CreateInvItems	(hero, ItFo_Addon_Rum, Mod_ItFo_Addon_Rum_Anzahl);
		};

		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 3;

			B_Betrunken();
		};

		B_HealGift (30, 0);		
	};

INSTANCE ItFo_OnarsSchnaps(C_Item)
{
	name 			=	"Schnaps";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI|ITEM_SHOW;

	value 			=	Value_Rum;	

	visual 			=	"ItMi_Rum_02.3ds"; 
	material 		=	MAT_GLAS;

	description		= 	name;
	
	TEXT[1]			= 	"von Onar";	
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Rum;

};

INSTANCE ItFo_OnarsSchnaps2(C_Item)
{
	name 			=	"Schnaps";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI|ITEM_SHOW;

	value 			=	Value_Rum;	

	visual 			=	"ItMi_Rum_02.3ds"; 
	material 		=	MAT_GLAS;

	description		= 	name;
	
	TEXT[1]			= 	"von Onar (von Wasili präpariert)";	
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Rum;

};

INSTANCE ItFo_Rumtopf(C_Item)
{
	name 			=	"Rumtopf";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Rum;	

	visual 			=	"ItMi_Rum_02.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseRumtopf;
	scemeName		=	"POTIONFAST";

	description		= 	name;
	
	if (Mod_ItFo_Addon_Rum_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_Mana;	
		COUNT[1]			= 	Mana_Rumtopf;

		TEXT[2]				= 	NAME_Bonus_HP;	
		COUNT[2]			= 	HP_Rumtopf;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Rumtopf;

};

	FUNC VOID UseRumtopf()
	{			
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Rumtopf);
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Rumtopf);

		self.aivar[AIV_Damage] += HP_Rumtopf;

		if (self.aivar[AIV_Damage] > self.attribute[ATR_HITPOINTS_MAX])
		{
			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
		};

		if (Mod_ItFo_Rumtopf_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Rumtopf_Right = 1;

			Mod_ItFo_Rumtopf_Anzahl = Npc_HasItems(hero, ItFo_Rumtopf);
			Npc_RemoveInvItems (hero, ItFo_Rumtopf, Mod_ItFo_Rumtopf_Anzahl);
			CreateInvItems	(hero, ItFo_Rumtopf, Mod_ItFo_Rumtopf_Anzahl);
		};

		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 3;

			B_Betrunken();
		};

		B_HealGift (10, HP_Rumtopf*2);		
	};

//#############################################
//			Grog
//#############################################
	
INSTANCE ItFo_Addon_Grog(C_Item)
{
	name 			=	"Grog";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Grog;	

	visual 			=	"ItMi_Rum_02.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseGrog;
	scemeName		=	"POTIONFAST";

	description		= 	"Echter Seemanns Grog";
	
	if (Mod_ItFo_Addon_Grog_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Grog;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Grog;

};

	FUNC VOID UseGrog()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Grog);

		self.aivar[AIV_Damage] += HP_Grog;

		if (self.aivar[AIV_Damage] > self.attribute[ATR_HITPOINTS_MAX])
		{
			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
		};

		if (Mod_ItFo_Addon_Grog_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Addon_Grog_Right = 1;

			Mod_ItFo_Addon_Grog_Anzahl = Npc_HasItems(hero, ItFo_Addon_Grog);
			Npc_RemoveInvItems (hero, ItFo_Addon_Grog, Mod_ItFo_Addon_Grog_Anzahl);
			CreateInvItems	(hero, ItFo_Addon_Grog, Mod_ItFo_Addon_Grog_Anzahl);
		};

		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 4;

			B_Betrunken();
		};

		B_HealGift (30, HP_Grog*2);		
	};

INSTANCE Mod_RealGrog(C_Item)
{
	name 			=	"Grog";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	20;	

	visual 			=	"ItMi_Rum_02.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseRealGrog;
	scemeName		=	"POTIONFAST";

	description		= 	"Diesen Grog habe ich selbst gebraut";
	
	if (Mod_Mod_RealGrog_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	2;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	20;

};

	FUNC VOID UseRealGrog()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	2);

		self.aivar[AIV_Damage] += 2;

		if (self.aivar[AIV_Damage] > self.attribute[ATR_HITPOINTS_MAX])
		{
			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
		};

		if (Mod_Mod_RealGrog_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_Mod_RealGrog_Right = 1;

			Mod_Mod_RealGrog_Anzahl = Npc_HasItems(hero, Mod_RealGrog);
			Npc_RemoveInvItems (hero, Mod_RealGrog, Mod_Mod_RealGrog_Anzahl);
			CreateInvItems	(hero, Mod_RealGrog, Mod_Mod_RealGrog_Anzahl);
		};

		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 4;

			B_Betrunken();
		};

		B_HealGift (30, 4);
	};

		
//-----------------------------
//	Lou's Hammer (mit Manaessenz)
//-----------------------------

var int Hammer_Once;	//damit der Magier sich nicht für 30 Gold superviel MANA kauft!!

INSTANCE ItFo_Addon_LousHammer (C_Item)
{
	name 			=	"Lou's Hammer";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_LousHammer;	

	visual 			=	"ItMi_Rum_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLouHammer;
	scemeName		=	"POTIONFAST";

	description		= 	"Lou's Hammer";
	
	TEXT[1]			= 	"Wirkung          ???";				
	
	
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_LousHammer;

};

	FUNC VOID UseLouHammer()
	{
		if Hammer_Once == FALSE
		{
			B_RaiseAttribute_Rest (self,	ATR_MANA_MAX, Mana_LousHammer);
			Hammer_Once = TRUE;
		};	

		Mod_Getrunken += 8;

		B_HealGift (30, 0);		
	};
//-------------------------------------------------------
//	Lou's doppelter Hammer (Schlafhammer)
//--------------------------------------------------------
INSTANCE ItFo_Addon_SchlafHammer (C_Item)
{
	name 			=	"Doppelter Hammer";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_SchlafHammer;	

	visual 			=	"ItMi_Rum_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseSchlafHammer;
	scemeName		=	"POTIONFAST";

	description		= 	"Doppelter Hammer";
	
	TEXT[1]			= 	"Macht den härtesten Trinker müde...";				

	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_SchlafHammer;

};

	FUNC VOID UseSchlafHammer()
	{
		if (self.attribute[ATR_HITPOINTS] > 2)
		{
			self.attribute[ATR_HITPOINTS] = (self.attribute[ATR_HITPOINTS]/2);

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS]/2;
		};

		Mod_Getrunken += 7;

		B_HealGift (30, 0);		
	};
	
	
//#############################################
//			Schneller Hering
//#############################################
	
INSTANCE ItFo_Addon_SchnellerHering(C_Item)
{
	name 			=	"Schneller Hering";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Schnellerhering;	

	visual 			=	"ItMi_Rum_01.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseSchnellerHering;
	scemeName		=	"POTIONFAST";

	description		= 	"Sieht gefährlich aus!";
	
	TEXT[1]			= 	"Wirkung unbekannt";				
	TEXT[2]			=	"Nebenwirkungen wahrscheinlich";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_SchnellerHering;

};

	FUNC VOID UseSchnellerHering()
	{
		var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
		if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
		{
			//AI_PlayAni (self, "T_MAGRUN_2_HEASHOOT");
			//AI_Wait (self ,2);
			//AI_PlayAni (self, "T_HEASHOOT_2_STAND");
			//Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",  self, self, 0, 0, 0, FALSE );
			Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", 120000);		//2min
		};	
		Player_KnowsSchnellerHering = TRUE;


		Mod_Getrunken += 6;

		B_HealGift (20, 0);		
	};	
//-------------------------------------------------------
//------------- Pfeffer  -----------------------
//-------------------------------------------------------
INSTANCE ItFo_Addon_Pfeffer_01	(C_Item)
{
	name 				=	"Pfefferbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3ds";

	material 			=	MAT_LEATHER;
		
	description			= 	"Roter Tränen- Pfeffer";
	
	TEXT[0]				= 	"Von den südlichen Inseln";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"VORSICHT SCHARF!";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItFo_Addon_Zucker	(C_Item)
{
	name 				=	"Zuckerbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3ds";

	material 			=	MAT_LEATHER;
		
	description			= 	"";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItFo_Addon_VitaminC	(C_Item)
{
	name 				=	"Vitamin C Konzentrat";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3ds";

	material 			=	MAT_LEATHER;
		
	description			= 	"";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-------------------------------------------------------
// Feuergeschnetzeltes mit hammer schnaps
//-------------------------------------------------------
INSTANCE ItFo_Addon_FireStew (C_Item)
{	
	name 				=	"Feuergeschnetzeltes";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_FireStew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_FireStew;

	description			= 	name;
	
	if (Mod_ItFo_Addon_FireStew_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_Str;	
		COUNT[1]			= 	STR_FireStew;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;			COUNT[5]	= Value_FireStew;

};

	FUNC VOID Use_FireStew()
	{			
		B_RaiseAttribute_Rest	(self,	ATR_STRENGTH,	STR_FireStew);

		B_SetEsspunkte	(100);

		if (Mod_ItFo_Addon_FireStew_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Addon_FireStew_Right = 1;

			Mod_ItFo_Addon_FireStew_Anzahl = Npc_HasItems(hero, ItFo_Addon_FireStew);
			Npc_RemoveInvItems (hero, ItFo_Addon_FireStew, Mod_ItFo_Addon_FireStew_Anzahl);
			CreateInvItems	(hero, ItFo_Addon_FireStew, Mod_ItFo_Addon_FireStew_Anzahl);
		};
	};
//-------------------------------------------------------
// Fleischsuppe
//-------------------------------------------------------
INSTANCE ItFo_Addon_Meatsoup (C_Item)
{	
	name 				=	"Fleischsuppe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_FishSoup;
	
	visual 				=	"ItFo_FishSoup.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_MeatSoup;

	description			= 	"Dampfende Fleischsuppe";
	
	if (Mod_ItFo_Addon_MeatSoup_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_STR;	
		COUNT[1]			= 	STR_MeatSoup;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;			COUNT[5]	= Value_FishSoup;

};

	FUNC VOID Use_MeatSoup()
	{			
		B_RaiseAttribute_Rest	(self,	ATR_STRENGTH,	STR_MeatSoup);

		B_SetEsspunkte	(90);

		if (Mod_ItFo_Addon_MeatSoup_Right == 0)
		&& (Npc_IsPlayer(self))
		{

			Mod_ItFo_Addon_MeatSoup_Right = 1;

			Mod_ItFo_Addon_MeatSoup_Anzahl = Npc_HasItems(hero, ItFo_Addon_MeatSoup);
			Npc_RemoveInvItems (hero, ItFo_Addon_MeatSoup, Mod_ItFo_Addon_MeatSoup_Anzahl);
			CreateInvItems	(hero, ItFo_Addon_MeatSoup, Mod_ItFo_Addon_MeatSoup_Anzahl);
		};

		B_HealGift (10, 0);
	};
	
	
	
	
