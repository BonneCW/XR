var int Adanosset;

FUNC VOID B_Adanossether()
{
	Adanosset += 1;

	if (Adanosset == 2)
	{
		hero.attribute[ATR_HITPOINTS_MAX] += 20;
		hero.attribute[ATR_HITPOINTS] += 20;
		hero.attribute[ATR_MANA_MAX] += 20;
		hero.attribute[ATR_MANA] += 20;

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	};

	if (Adanosset == 3)
	{
		hero.protection[PROT_FIRE] += 10;
		hero.protection[PROT_MAGIC] += 10;
	};
};

FUNC VOID B_Adanossetweg()
{
	Adanosset -= 1;

	if (Adanosset == 2)
	{
		hero.protection[PROT_FIRE] -= 10;
		hero.protection[PROT_MAGIC] -= 10;
	};

	if (Adanosset == 1)
	{
		hero.attribute[ATR_HITPOINTS_MAX] -= 20;
		hero.attribute[ATR_HITPOINTS] -= 20;
		hero.attribute[ATR_MANA_MAX] -= 20;
		hero.attribute[ATR_MANA] -= 20;

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	};
};

instance ItRi_AdanosRing(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItRi_Prot_Fire_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_AdanosRing;
	on_unequip				=	UnEquip_ItRi_AdanosRing;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Adanos' Ring des Wassers";
	
	TEXT[1]					= NAME_Bonus_Mana;
	COUNT[1]				= 10;

	TEXT[4]			= "Set: Adanos' Gleichgewicht";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_AdanosRing()
{
	self.attribute[ATR_MANA_MAX] += 20;
	self.attribute[ATR_MANA] += 20;

	B_Adanossether();
};

FUNC VOID UnEquip_ItRi_AdanosRing()
{
	self.attribute[ATR_MANA] -= 20;
	self.attribute[ATR_MANA_MAX] -= 20;

	B_Adanossetweg();
};

INSTANCE  ItBE_AdanosBelt (C_Item)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	500;

	visual 			=	"ItMI_Belt_06.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBE_AdanosBelt;
	on_unequip		=	UnEquip_ItBE_AdanosBelt;

	description		=  "Adanos' Gürtel des Frostes";

	TEXT[1]			=	NAME_Prot_Fire;			
	COUNT[1]		= 	5;
	TEXT[2]			=	NAME_Prot_Magic;		
	COUNT[2]		= 	5;

	TEXT[4]			= "Set: Adanos' Gleichgewicht";

	TEXT[5]			=   NAME_Value;
	COUNT[5]		=   value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx		= INVCAM_ENTF_MISC2_STANDARD;
	
};
FUNC VOID Equip_ItBe_AdanosBelt()
{
	self.protection[PROT_FIRE]  += 5;
	self.protection[PROT_MAGIC] += 5;

	B_Adanossether();
};
FUNC VOID UnEquip_ItBe_AdanosBelt()
{
	self.protection[PROT_FIRE] -= 5;
	self.protection[PROT_MAGIC] -= 5;

	B_Adanossetweg();
};

INSTANCE  ItAm_AdanosAmulett (C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	500;

	visual 			=	"ItAm_Hp_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_AdanosAmulett;
	on_unequip		=	UnEquip_ItAm_AdanosAmulett;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Adanos' Amulett des Nebels";

	TEXT[1]			= NAME_Bonus_Mana;
	COUNT[1]		= 20;

	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= 10;

	TEXT[4]			= "Set: Adanos' Gleichgewicht";
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

FUNC VOID Equip_ItAm_AdanosAmulett()
{
	self.attribute[ATR_MANA_MAX] 		+=  20;
	self.attribute[ATR_MANA] 		+=  20;
	self.attribute[ATR_HITPOINTS_MAX] 	+=  10;
	self.attribute[ATR_HITPOINTS] 	+=  10;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	B_Adanossether();
};

FUNC VOID UnEquip_ItAm_AdanosAmulett()
{
	self.attribute[ATR_MANA] 	-=  20;
	self.attribute[ATR_MANA_MAX] 	-=  20;
	self.attribute[ATR_HITPOINTS] 	-=  10;
	self.attribute[ATR_HITPOINTS_MAX] 	-=  10;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	B_Adanossetweg();
};