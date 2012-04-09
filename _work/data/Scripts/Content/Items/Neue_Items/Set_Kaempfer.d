var int Kaempferset;

FUNC VOID B_Kaempfersether()
{
	Kaempferset += 1;

	if (Kaempferset == 2)
	{
		hero.hitChance[NPC_TALENT_1H] += 10;
		hero.hitChance[NPC_TALENT_2H] += 10;
	};
};

FUNC VOID B_Kaempfersetweg()
{
	Kaempferset -= 1;

	if (Kaempferset == 1)
	{
		hero.hitChance[NPC_TALENT_1H] -= 10;
		hero.hitChance[NPC_TALENT_2H] -= 10;
	};
};		

instance ItRi_RingStaerke(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItRi_Prot_Fire_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_RingStaerke;
	on_unequip				=	UnEquip_ItRi_RingStaerke;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Rechter Ring des Stärke";
	
	TEXT[2]					= NAME_Bonus_Str;
	COUNT[2]				= 10;

	TEXT[4]			= "Set: Gewalt des Kämpfers";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_RingStaerke()
{
	hero.attribute[ATR_STRENGTH] += 10;

	B_Kaempfersether();
};

FUNC VOID UnEquip_ItRi_RingStaerke()
{
	hero.attribute[ATR_STRENGTH] -= 10;

	B_Kaempfersetweg();
};

instance ItRi_RingHiebe(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItRi_Prot_Fire_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_RingHiebe;
	on_unequip				=	UnEquip_ItRi_RingHiebe;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Linker Ring des Hiebe";
	
	TEXT[2]					= NAME_Bonus_HP;
	COUNT[2]				= 10;

	TEXT[4]			= "Set: Gewalt des Kämpfers";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_RingHiebe()
{
	hero.attribute[ATR_HITPOINTS_MAX] 		+=  10;
	hero.attribute[ATR_HITPOINTS] 		+=  10;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	B_Kaempfersether();
};

FUNC VOID UnEquip_ItRi_RingHiebe()
{
	hero.attribute[ATR_HITPOINTS] 		-=  10;
	hero.attribute[ATR_HITPOINTS_MAX] 		-=  10;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	B_Kaempfersetweg();
};