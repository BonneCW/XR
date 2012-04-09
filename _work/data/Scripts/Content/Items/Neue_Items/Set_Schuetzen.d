var int Schuetzenset;

FUNC VOID B_Schuetzensether()
{
	Schuetzenset += 1;

	if (Schuetzenset == 2)
	{
		hero.hitChance[NPC_TALENT_BOW] += 10;
		hero.hitChance[NPC_TALENT_CROSSBOW] += 10;
	};
};

FUNC VOID B_Schuetzensetweg()
{
	Schuetzenset -= 1;

	if (Schuetzenset == 1)
	{
		hero.hitChance[NPC_TALENT_BOW] -= 10;
		hero.hitChance[NPC_TALENT_CROSSBOW] -= 10;
	};
};		

instance ItRi_RingGewandtheit(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItRi_Prot_Fire_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_RingGewandtheit;
	on_unequip				=	UnEquip_ItRi_RingGewandtheit;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Rechter Ring des Gewandtheit";
	
	TEXT[2]					= NAME_Bonus_DEX;
	COUNT[2]				= 10;

	TEXT[4]			= "Set: Gewandtheit des Schützen";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_RingGewandtheit()
{
	hero.attribute[ATR_DEXTERITY] += 10;

	B_Schuetzensether();
};

FUNC VOID UnEquip_ItRi_RingGewandtheit()
{
	hero.attribute[ATR_DEXTERITY] -= 10;

	B_Schuetzensetweg();
};

instance ItRi_RingAusdauer(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItRi_Prot_Fire_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_RingAusdauer;
	on_unequip				=	UnEquip_ItRi_RingAusdauer;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Linker Ring des Ausdauer";
	
	TEXT[2]					= NAME_Bonus_HP;
	COUNT[2]				= 10;

	TEXT[4]			= "Set: Gewandtheit des Schützen";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_RingAusdauer()
{
	hero.attribute[ATR_HITPOINTS_MAX] 		+=  10;
	hero.attribute[ATR_HITPOINTS] 		+=  10;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	B_Schuetzensether();
};

FUNC VOID UnEquip_ItRi_RingAusdauer()
{
	hero.attribute[ATR_HITPOINTS] 		-=  10;
	hero.attribute[ATR_HITPOINTS_MAX] 		-=  10;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	B_Schuetzensetweg();
};