//****************************************************************************
//				Erzfisch  (Halvor)
//			---------------------------------------------
//****************************************************************************
INSTANCE ItSe_ErzFisch (C_Item)
{	
	name 				=	"Kugeliger Fisch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	25;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_ErzFisch;

	description			= 	name;
	TEXT[2]				= 	"Irgendwas ist in diesem Fisch versteckt";		
	
};

	FUNC VOID Use_ErzFisch()
	{
		B_PlayerFindItem (ItMi_Nugget,1);
	};
//****************************************************************************
//				Goldfisch  (Halvor)
//			---------------------------------------------
//****************************************************************************
INSTANCE ItSe_GoldFisch (C_Item)
{	
	name 				=	"Schwerer Fisch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	25;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_GoldFisch;

	description			= 	name;
	TEXT[2]				= 	"Irgendwas ist in diesem Fisch versteckt";		
	
};

	FUNC VOID Use_GoldFisch()
	{
		B_PlayerFindItem (ItMI_Gold,50);
	};	
//****************************************************************************
//				Ringfisch  (Halvor) (Protcetion Fire Ring)
//			---------------------------------------------
//****************************************************************************
INSTANCE ItSe_Ringfisch (C_Item)
{	
	name 				=	"Kleiner Fisch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	25;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_Ringfisch;

	description			= 	name;
	TEXT[2]				= 	"Irgendwas ist in diesem Fisch versteckt";		
	
};

	FUNC VOID Use_Ringfisch()
	{
		B_PlayerFindItem (ItRi_Prot_Fire_01,1);
	};	
//****************************************************************************
//				Lockpickfisch  (Halvor)
//			---------------------------------------------
//****************************************************************************
INSTANCE ItSe_LockpickFisch (C_Item)
{	
	name 				=	"Leichter Fisch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	25;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_LockpickFisch;

	description			= 	name;
	TEXT[2]				= 	"Irgendwas ist in diesem Fisch versteckt";		
	
};

	FUNC VOID Use_LockpickFisch()
	{
		B_PlayerFindItem (ITKE_Lockpick,3);
	};


//****************************************************************************
//			Allgemeine Goldbeutel (25, 50, 100)
//			---------------------------------------------
//****************************************************************************		

//------------- 25 Gold -----------------------
INSTANCE ItSe_GoldPocket25	(C_Item)
{
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   GoldPocket25;
	
	description			= 	"Ein Lederbeutel";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Ein paar Münzen klimpern darin";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID GoldPocket25 ()
{
		B_PlayerFindItem (ItMI_Gold,25);	
};
//------------- 50 Gold -----------------------
INSTANCE ItSe_GoldPocket50	(C_Item)
{
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   GoldPocket50;
	
	description			= 	"Ein Lederbeutel";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Der Beutel ist voller Münzen";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID GoldPocket50 ()
{
		B_PlayerFindItem (ItMI_Gold,50);
};
//------------- 100 Gold -----------------------
INSTANCE ItSe_GoldPocket100	(C_Item)
{
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   GoldPocket100;
	
	description			= 	"Ein Lederbeutel";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Ein schwerer Beutel";
	TEXT[3]				= 	"gefüllt mit goldenen Münzen";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID GoldPocket100 ()
{
		B_PlayerFindItem (ItMI_Gold,100);
};
//------------- 100 Gold -----------------------
INSTANCE ItSe_HeroPocket	(C_Item)
{
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   HeroPocket;
	
	description			= 	"Ein Lederbeutel";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Enthält alles Eigentum";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID HeroPocket ()
{
	B_TransferInventory_All (PC_Itemholder, hero);
};	

INSTANCE ItMi_KoboldGold	(C_Item)
{
	name 				=	"Praller Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   KoboldGold;
	
	description			= 	"Ein Lederbeutel";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Ein schwerer Beutel";
	TEXT[3]				= 	"gefüllt mit goldenen Münzen";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID KoboldGold ()
{
	B_PlayerFindItem (ItMi_Gold, HeroKoboldGold);
};

INSTANCE ItMi_Magierbeutel_IR	(C_Item)
{
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Magierbeutel_IR;
	
	description			= 	"Ein Lederbeutel";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Enthält ein paar Spruchrollen";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Magierbeutel_IR ()
{
	if (Mod_MiltenDabei > 1)
	{
		CreateInvItems	(hero, ItSc_FireRain, 2);
		CreateInvItems	(hero, ItSc_Pyrokinesis, 1);
		CreateInvItems	(hero, ItSc_FullHeal, 1);
	};
	if (Mod_NamibDabei > 1)
	{
		CreateInvItems	(hero, ItSc_Windfist, 3);
		CreateInvItems	(hero, ItSc_MediumHeal, 2);
	};
	if (Mod_MyxirDabei > 1)
	{
		CreateInvItems	(hero, ItSc_BreathOfDeath, 1);
		CreateInvItems	(hero, ItSc_SumDemon, 2);
		CreateInvItems	(hero, ItSc_ArmyOfDarkness, 1);
	};
	if (Mod_VatrasDabei > 1)
	{
		CreateInvItems	(hero, ItSc_Thunderstorm, 2);
		CreateInvItems	(hero, ItSc_IceWave, 1);
		CreateInvItems	(hero, ItSc_FullHeal, 1);
	};

	B_ShowGivenThings	("Spruchrollen gefunden");
};
//------------- Hannas Beutel -----------------------
INSTANCE ItSe_HannasBeutel	(C_Item)
{
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   HannasBeutel;
	
	description			= 	"Ein Lederbeutel";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Hanna hat ihn mir gegeben";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID HannasBeutel ()
{
		CreateInvItems (hero,ITKE_Lockpick,10);
		CreateInvItems (hero,ItKe_ThiefTreasure,1);
		Print (PRINT_HannasBeutel);
};	

INSTANCE ItSe_WilfriedsBeutel	(C_Item)
{
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	
	description			= 	"Ein aufgeschlitzter Lederbeutel";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Der Lederbeutel gehört Wilfried";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//------------- 25 Gold -----------------------
INSTANCE ItMi_HerekBeutel	(C_Item)
{
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   HerekBeutel;
	
	description			= 	"Ein Lederbeutel";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"von Herek";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID HerekBeutel ()
{
	Snd_Play ("Geldbeutel");

	B_PlayerFindItem (ItMi_Gold, 136);
	B_PlayerFindItem (ItMi_SilverRing, 2);
	B_PlayerFindItem (ItMi_GoldPlate, 1);
};
//------------- 100 Gold -----------------------
INSTANCE ItMi_GorNaKoshsBeutel	(C_Item)
{
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   GorNaKoshsBeutel;
	
	description			= 	"Gor Na Koshs Lederbeutel";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Ein schwerer Beutel";
	TEXT[3]				= 	"gefüllt mit goldenen Münzen und anderen Sachen";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID GorNaKoshsBeutel ()
{
	//B_PlayerFindItem (ItKe_GorNaKosh, 1);
	B_PlayerFindItem (ItMi_SilverRing, 1);
	B_PlayerFindItem (ItMi_Gold, 50);
};
//------------- 100 Gold -----------------------
INSTANCE ItMi_GorNaKoshsBeutel2	(C_Item)
{
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   GorNaKoshsBeutel2;
	
	description			= 	"Gor Na Koshs Lederbeutel";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Ein schwerer Beutel";
	TEXT[3]				= 	"gefüllt mit goldenen Münzen und anderen Sachen";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID GorNaKoshsBeutel2 ()
{
	if (Mod_TPL_Hueterklinge_Art == 2)
	{
		B_PlayerFindItem (ItPl_Health_Herb_01_Reisfresser, 6);
		B_PlayerFindItem (ItMw_1H_VLK_Dagger_Blut, 1);
		B_PlayerFindItem (ItFo_MuttonRaw_Scav, 1);
	}
	else
	{
		B_PlayerFindItem (ItMi_Orkstatuette_Stonehenge, 1);
		B_PlayerFindItem (ItAt_SkeletonBone_Herrscher, 1);
		B_PlayerFindItem (ItAt_Teeth_Wolf, 1);
	};
};