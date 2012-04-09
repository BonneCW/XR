instance ItRi_Wechsel(C_Item) //in einem von Halvors Fischen
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Wechsel;
	on_unequip				=	UnEquip_ItRi_wechsel;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Wechselring";
	
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_Wechsel()
{
	AI_Teleport	(hero, "PC_HERO");
};

FUNC VOID UnEquip_ItRi_Wechsel()
{
	AI_Teleport	(hero, "PC_HERO");
};