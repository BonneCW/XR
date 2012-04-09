INSTANCE ItAm_Xardas_SchutzVorXeres(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	500;

	visual 			=	"ItAm_Prot_Fire_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Xardas_SchutzVorXeres;
	on_unequip		=	UnEquip_ItAm_Xardas_SchutzVorXeres;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Schutzamulett von Xardas";
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Xardas_SchutzVorXeres()
	{
	 	Mod_TeleportZuFestung = 1;
	};


	FUNC VOID UnEquip_ItAm_Xardas_SchutzVorXeres()
	{
		Mod_TeleportZuFestung = 0;
	};

INSTANCE ItAm_Anomalie (C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	0;

	visual 			=	"ItAm_Prot_Fire_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Anomalie;
	on_unequip		=	UnEquip_ItAm_Anomalie;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Amulett des Unsichtbaren";
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Anomalie()
	{
	 	Mod_AnomalieAmulett = 1;
	};


	FUNC VOID UnEquip_ItAm_Anomalie()
	{
		Mod_AnomalieAmulett = 0;
	};