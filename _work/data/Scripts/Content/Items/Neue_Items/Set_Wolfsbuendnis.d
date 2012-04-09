var int Wolfsset;

FUNC VOID B_Wolfssether()
{
	Wolfsset += 1;

	if (Wolfsset == 2)
	{
		hero.attribute[ATR_HITPOINTS_MAX] += 15;
		hero.attribute[ATR_HITPOINTS] += 15;
		hero.attribute[ATR_MANA_MAX] += 10;
		hero.attribute[ATR_MANA] += 10;

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	};

	if (Wolfsset == 3)
	{
		Wld_SpawnNpcRange	(hero,	Begleiterwolf,			1,	500);
	};
};

FUNC VOID B_Wolfssetweg()
{
	Wolfsset -= 1;

	if (Wolfsset == 2)
	{
		Npc_ChangeAttribute (Begleiterwolf, ATR_HITPOINTS, -hero.attribute[ATR_HITPOINTS_MAX]);
	};

	if (Wolfsset == 1)
	{
		hero.attribute[ATR_HITPOINTS_MAX] -= 15;
		hero.attribute[ATR_HITPOINTS] -= 15;
		hero.attribute[ATR_MANA_MAX] -= 10;
		hero.attribute[ATR_MANA] -= 10;

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	};
};		

instance ItRi_Wolfsring_Ruestung(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItRi_Prot_Fire_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Wolfsring_Ruestung;
	on_unequip				=	UnEquip_ItRi_Wolfsring_Ruestung;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Wolfsring der Rüstung";
	
	TEXT[2]					= NAME_Prot_Edge;
	COUNT[2]				= 3;
	
	TEXT[3]					= NAME_Prot_Point;
	COUNT[3]				= 3;

	TEXT[4]			= "Set: Wolfsbündnis";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_Wolfsring_Ruestung()
{
	hero.protection [PROT_EDGE] 		+=  3000;
	hero.protection [PROT_BLUNT] 		+=  3000;
	hero.protection [PROT_POINT] 		+=  3000;

	B_Wolfssether();
};

FUNC VOID UnEquip_ItRi_Wolfsring_Ruestung()
{
	hero.protection [PROT_EDGE] 		-=  3000;
	hero.protection [PROT_BLUNT] 		-=  3000;
	hero.protection [PROT_POINT] 		-=  3000;

	B_Wolfssetweg();
};

instance ItRi_Wolfsring_Leben(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItRi_Prot_Fire_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Wolfsring_Leben;
	on_unequip				=	UnEquip_ItRi_Wolfsring_Leben;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Wolfsring des Lebens";
	
	TEXT[2]					= NAME_Bonus_HP;
	COUNT[2]				= 10;

	TEXT[4]			= "Set: Wolfsbündnis";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_Wolfsring_Leben()
{
	hero.attribute[ATR_HITPOINTS_MAX] 		+=  10;
	hero.attribute[ATR_HITPOINTS] 		+=  10;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	B_Wolfssether();
};

FUNC VOID UnEquip_ItRi_Wolfsring_Leben()
{
	hero.attribute[ATR_HITPOINTS] 		-=  10;
	hero.attribute[ATR_HITPOINTS_MAX] 		-=  10;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	B_Wolfssetweg();
};

INSTANCE  ItAm_Wolfsamulett (C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	500;

	visual 			=	"ItAm_Hp_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Wolfsamulett;
	on_unequip		=	UnEquip_ItAm_Wolfsamulett;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Amulett der Lebenskraft";

	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 3;

	TEXT[3]			= NAME_Bonus_Dex;
	COUNT[3]		= 3;

	TEXT[4]			= "Set: Wolfsbündnis";
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

FUNC VOID Equip_ItAm_Wolfsamulett()
{
	hero.attribute[ATR_STRENGTH] 		+=  3;
	hero.attribute[ATR_DEXTERITY] 		+=  3;

	B_Wolfssether();
};

FUNC VOID UnEquip_ItAm_Wolfsamulett()
{
	hero.attribute[ATR_STRENGTH] 		-=  3;
	hero.attribute[ATR_DEXTERITY] 		-=  3;

	B_Wolfssetweg();
};