//Ringe//

//Schutzringe
const int Value_Ri_ProtFire 		= 250;	const int Ri_ProtFire		= 3; 
const int Value_Ri_ProtEdge 		= 250;	const int Ri_ProtEdge		= 3000;
const int Value_Ri_ProtMage 		= 250;	const int Ri_ProtMage		= 3;
const int Value_Ri_ProtPoint 		= 250;	const int Ri_ProtPoint		= 3000;

const int Value_Ri_ProtFire02 		= 500;	const int Ri_ProtFire02		= 5; 
const int Value_Ri_ProtEdge02 		= 500;	const int Ri_ProtEdge02		= 5000;
const int Value_Ri_ProtMage02 		= 500;	const int Ri_ProtMage02		= 5;
const int Value_Ri_ProtPoint02 		= 500;	const int Ri_ProtPoint02	= 5000;

const int Value_Ri_ProtTotal 		= 600;	const int Ri_TProtFire		= 2; // Schutzring Total 1
											const int Ri_TProtEdge		= 3000;
											const int Ri_TProtMage		= 2;
											const int Ri_TProtPoint		= 3000;

const int Value_Ri_ProtTotal02 		= 1000;	const int Ri_TProtFire02	= 3; // Schutzring Total 2
											const int Ri_TProtEdge02	= 5000;
											const int Ri_TProtMage02	= 3;
											const int Ri_TProtPoint02	= 5000;

// Andere Ringe

const int Value_Ri_Dex 				= 300;	const int Ri_Dex			=  3; 
const int Value_Ri_Dex02 			= 500;	const int Ri_Dex02			=  5; 

const int Value_Ri_Mana 			= 500;	const int Ri_Mana			=  5;   
const int Value_Ri_Mana02 			= 1000;	const int Ri_Mana02			=  10; 

const int Value_Ri_Strg 			= 300;	const int Ri_Strg			=  3; 
const int Value_Ri_Strg02 			= 500;	const int Ri_Strg02			=  5; 

const int Value_Ri_Hp 				= 200;	const int Ri_Hp				= 20; 
const int Value_Ri_Hp02 			= 400;	const int Ri_Hp02			= 40;
const int Value_Ri_Hp03 			= 300;	const int Ri_Hp03			= 30;

const int Value_Ri_HpMana 			= 1300;	const int Ri_HpMana_Hp		= 30;
											const int Ri_HpMana_Mana	= 10;

const int Value_Ri_DexStrg 			= 800;	const int Ri_DexStrg_Dex	=  4;
											const int Ri_DexStrg_Strg	=  4; 

/******************************************************************************************/

	instance ItRi_Prot_Fire_01(C_Item) //in einem von Halvors Fischen
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Fire_01;
	on_unequip				=	UnEquip_ItRi_Prot_Fire_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Flammenschutzring";
	
	TEXT[2]					= NAME_Prot_Fire;
	COUNT[2]				= Ri_ProtFire;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Fire_01()
	{
		self.protection [PROT_FIRE] 		+=  Ri_ProtFire;
	};

	FUNC VOID UnEquip_ItRi_Prot_Fire_01()
	{
	self.protection [PROT_FIRE] 		-=  Ri_ProtFire;
	};

instance Mod_Banditenring(C_Item) //in einem von Halvors Fischen
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Banditen";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

instance ItRi_Bandenchef(C_Item) //in einem von Halvors Fischen
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring des Bandenchefs";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};
	
instance ItRi_WaermeRing(C_Item) //in einem von Halvors Fischen
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_WaermeRing;
	on_unequip				=	UnEquip_ItRi_WaermeRing;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Wärme";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_WaermeRing()
	{
		Mod_SLD_WaermeRing = 1;
	};

	FUNC VOID UnEquip_ItRi_WaermeRing()
	{
		Mod_SLD_WaermeRing = 0;
	};
	
instance ItRi_Alchemist(C_Item) //in einem von Halvors Fischen
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Alchemist;
	on_unequip				=	UnEquip_ItRi_Alchemist;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring des Alchemisten";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Alchemist()
	{
		Mod_Ring_Alchemist = 1;
	};

	FUNC VOID UnEquip_ItRi_Alchemist()
	{
		Mod_Ring_Alchemist = 0;
	};
	
instance ItRi_Verschleierung (C_Item) //in einem von Halvors Fischen
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Verschleierung;
	on_unequip				=	UnEquip_ItRi_Verschleierung;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Verschleierung";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Verschleierung()
	{
		Mod_Verschleierung = 1;

		hero.flags = NPC_FLAG_GHOST;

		Unsichtbarkeitsperk = True;

		AI_Teleport	(hero, "PC_HERO");
	};

	FUNC VOID UnEquip_ItRi_Verschleierung()
	{
		Mod_Verschleierung = 0;

		hero.flags = 0;

		Unsichtbarkeitsperk = True;

		AI_Teleport	(hero, "PC_HERO");
	};
	
instance ItRi_Talentring (C_Item) //in einem von Halvors Fischen
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Talentring;
	on_unequip				=	UnEquip_ItRi_Talentring;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Talentring";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Talentring()
	{
		hero.attribute[ATR_STRENGTH] += 4;
		hero.attribute[ATR_DEXTERITY] += 4;
		hero.attribute[ATR_MANA_MAX] += 4;
		hero.attribute[ATR_MANA] += 4;
	};

	FUNC VOID UnEquip_ItRi_Talentring()
	{
		hero.attribute[ATR_STRENGTH] -= 4;
		hero.attribute[ATR_DEXTERITY] -= 4;
		hero.attribute[ATR_MANA_MAX] -= 4;
		hero.attribute[ATR_MANA] -= 4;
	};
	
instance ItRi_Licht(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Licht;
	on_unequip				=	UnEquip_ItRi_Licht;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring des Lichtes";
	
	TEXT[3]					= "Spendet Licht";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Licht()
	{
		Wld_PlayEffect	("spellFX_Light_ACTIVE", hero, hero, 0, 0, 0, FALSE);
	};

	FUNC VOID UnEquip_ItRi_Licht()
	{
		Wld_StopEffect	("spellFX_Light_ACTIVE");
	};
	
instance ItRi_Versengung (C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Versengung;
	on_unequip				=	UnEquip_ItRi_Versengung;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring des Versengung";
	
	TEXT[3]					= "Verursacht zusätzlichen Feuerschaden";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Versengung()
	{
		Mod_VersengungRing = 1;
	};

	FUNC VOID UnEquip_ItRi_Versengung()
	{
		Mod_VersengungRing = 0;
	};
	
instance ItRi_SchwarzesErz(C_Item) //in einem von Halvors Fischen
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_SchwarzesErz;
	on_unequip				=	UnEquip_ItRi_SchwarzesErz;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring aus schwarzem Erz";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_SchwarzesErz()
	{
		Mod_KG_SchwarzerRing = 1;
	};

	FUNC VOID UnEquip_ItRi_SchwarzesErz()
	{
		Mod_KG_SchwarzerRing = 0;
	};
	
instance ItRi_Verhandlungsring (C_Item) //in einem von Halvors Fischen
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Verhandlungsring;
	on_unequip				=	UnEquip_ItRi_Verhandlungsring;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Verhandlung";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Verhandlungsring()
	{
		Mod_Verhandlungsgeschick += 10;
	};

	FUNC VOID UnEquip_ItRi_Verhandlungsring()
	{
		Mod_Verhandlungsgeschick -= 10;
	};
	
instance ItRi_Seering (C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Seering;
	on_unequip				=	UnEquip_ItRi_Seering;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring aus dem See";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Seering()
	{
		AI_Teleport	(hero, "EIS_TEMPELCHEN_001");
	};

	FUNC VOID UnEquip_ItRi_Seering()
	{
	};
/******************************************************************************************/
	instance ItRi_Prot_Fire_02(C_Item) //MayaTurm2 (Truhe)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire02;

	visual 					=	"ItRi_Prot_Fire_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Fire_02;
	on_unequip				=	UnEquip_ItRi_Prot_Fire_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Feuerring";
	
	TEXT[2]					= NAME_Prot_Fire;
	COUNT[2]				= Ri_ProtFire02;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Fire_02()
	{
		self.protection [PROT_FIRE] 		+=  Ri_ProtFire02;
	};

	FUNC VOID UnEquip_ItRi_Prot_Fire_02()
	{
	self.protection [PROT_FIRE] 		-=  Ri_ProtFire02;
	};

/******************************************************************************************/
	INSTANCE ItRi_Prot_Point_01(C_Item) //Constantinos Schutzring
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtPoint ;

	visual 					=	"ItRi_Prot_Point_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Point_01;
	on_unequip				=	UnEquip_ItRi_Prot_Point_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Holzhaut";
	
	TEXT[2]					= NAME_Prot_Point;
	COUNT[2]				= Ri_ProtPoint / 1000;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Point_01()
	{
	self.protection [PROT_POINT] 		+=  Ri_ProtPoint;
	};

	FUNC VOID UnEquip_ItRi_Prot_Point_01()
	{
	self.protection [PROT_POINT] 		-=  Ri_ProtPoint;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Prot_Point_02(C_Item)	//  Beim Schwarzen Troll      / Auf Dacheninsel -> NONE_101_MARIO_DI in der Tasche
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtPoint02 ;

	visual 					=	"ItRi_Prot_Point_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Point_02;
	on_unequip				=	UnEquip_ItRi_Prot_Point_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Steinhaut";
	
	TEXT[2]					= NAME_Prot_Point;
	COUNT[2]				= Ri_ProtPoint02 / 1000;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Point_02()
	{
	self.protection [PROT_POINT] 		+=  Ri_ProtPoint02;
	};

	FUNC VOID UnEquip_ItRi_Prot_Point_02()
	{
	self.protection [PROT_POINT] 		-=  Ri_ProtPoint02;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Prot_Edge_01(C_Item) //bei Cassia als Belohnung //Höhle OW//PassNW bei den Orks
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtEdge;

	visual 					=	"ItRi_Prot_Edge_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Edge_01;
	on_unequip				=	UnEquip_ItRi_Prot_Edge_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Eisenhaut";

	TEXT[2]					= NAME_Prot_Edge;
	COUNT[2]				= Ri_ProtEdge / 1000;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Edge_01()
	{
	self.protection [PROT_EDGE] 		+=  Ri_ProtEdge;
	self.protection [PROT_BLUNT]		+=  Ri_ProtEdge;
	};

	FUNC VOID UnEquip_ItRi_Prot_Edge_01()
	{
	self.protection [PROT_EDGE] 		-=  Ri_ProtEdge;
	self.protection [PROT_BLUNT]		-=  Ri_ProtEdge;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Prot_Edge_02(C_Item) //Im Alten Lager
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtEdge02;

	visual 					=	"ItRi_Prot_Edge_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Edge_02;
	on_unequip				=	UnEquip_ItRi_Prot_Edge_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Erzhaut";
	
	TEXT[2]					= NAME_Prot_Edge;
	COUNT[2]				= Ri_ProtEdge02 / 1000;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Edge_02()
	{
	self.protection [PROT_EDGE] 		+=  Ri_ProtEdge02;
	self.protection [PROT_BLUNT]		+=  Ri_ProtEdge02;
	};

	FUNC VOID UnEquip_ItRi_Prot_Edge_02()
	{
	self.protection [PROT_EDGE] 		-=  Ri_ProtEdge02;
	self.protection [PROT_BLUNT]		-=  Ri_ProtEdge02;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Prot_Mage_01(C_ITEM) //XARDAS RING 
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtMage;

	visual 					=	"ItRi_Prot_Mage_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Mage_01;
	on_unequip				=	UnEquip_ItRi_Prot_Mage_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Geisteskraft";
	
	TEXT[2]					= NAME_Prot_Magic;
	COUNT[2]				= Ri_ProtMage;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Mage_01()
	{
	self.protection [PROT_MAGIC] 		+= Ri_ProtMage;
	};


	FUNC VOID UnEquip_ItRi_Prot_Mage_01()
	{
	self.protection [PROT_MAGIC] 		-=  Ri_ProtMage;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Prot_Mage_02(C_ITEM)	//Joly: von Neoras, wenn SC ihm Drachenei bringt. (Nur PAL oder KDF) ab Kapitel 4	//ricelordhütte OW
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtMage02;

	visual 					=	"ItRi_Prot_Mage_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Mage_02;
	on_unequip				=	UnEquip_ItRi_Prot_Mage_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Verteidigung";
	
	TEXT[2]					= NAME_Prot_Magic;
	COUNT[2]				= Ri_ProtMage02;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Mage_02()
	{
	self.protection [PROT_MAGIC] 		+= Ri_ProtMage02;
	};


	FUNC VOID UnEquip_ItRi_Prot_Mage_02()
	{
	self.protection [PROT_MAGIC] 		-=  Ri_ProtMage02;
	};
	
/******************************************************************************************/

	INSTANCE ItRi_Prot_Total_01(C_ITEM) //Bei Lutero
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtTotal;

	visual 					=	"ItRi_Prot_Total_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_ItRi_Prot_Total_01;
	on_unequip				= 	UnEquip_ItRi_Prot_Total_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Ring der Unbezwingbarkeit";
	
	TEXT[1]			= NAME_Prot_Magic;
	COUNT[1]		= Ri_TProtMage;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= Ri_TProtFire;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= Ri_TProtPoint / 1000;
	TEXT[4]			= NAME_Prot_Edge;
	COUNT[4]		= Ri_TProtEdge / 1000;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Total_01()
	{
	self.protection [PROT_EDGE] 	+=   Ri_TProtEdge;
	self.protection [PROT_BLUNT]	+=   Ri_TProtEdge;
	self.protection [PROT_POINT]	+=   Ri_TProtPoint;
 	self.protection [PROT_FIRE]     +=   Ri_TProtFire;
	self.protection [PROT_MAGIC]    +=   Ri_TProtMage;
	};

	FUNC VOID UnEquip_ItRi_Prot_Total_01()
	{
	self.protection [PROT_EDGE] 	-=   Ri_TProtEdge;
	self.protection [PROT_BLUNT]	-=   Ri_TProtEdge;
	self.protection [PROT_POINT]	-=   Ri_TProtPoint;
 	self.protection [PROT_FIRE]     -=   Ri_TProtFire;
	self.protection [PROT_MAGIC]    -=   Ri_TProtMage;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Prot_Total_02(C_ITEM) //bei Lutero ab Kapitel 4 zu kaufen
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtTotal02;

	visual 					=	"ItRi_Prot_Total_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_ItRi_Prot_Total_02;
	on_unequip				= 	UnEquip_ItRi_Prot_Total_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Ring der Unbesiegbarkeit";
	
	TEXT[1]			= NAME_Prot_Magic;
	COUNT[1]		= Ri_TProtMage02;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= Ri_TProtFire02;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= Ri_TProtPoint02;
	TEXT[4]			= NAME_Prot_Edge;
	COUNT[4]		= Ri_TProtEdge02;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Total_02()
	{
	self.protection [PROT_EDGE] 	+=   Ri_TProtEdge02;
	self.protection [PROT_BLUNT]	+=   Ri_TProtEdge02;
	self.protection [PROT_POINT]	+=   Ri_TProtPoint02;
 	self.protection [PROT_FIRE]     +=   Ri_TProtFire02;
	self.protection [PROT_MAGIC]    +=   Ri_TProtMage02;
	};

	FUNC VOID UnEquip_ItRi_Prot_Total_02()
	{
	self.protection [PROT_EDGE] 	-=   Ri_TProtEdge02;
	self.protection [PROT_BLUNT]	-=   Ri_TProtEdge02;
	self.protection [PROT_POINT]	-=   Ri_TProtPoint02;
 	self.protection [PROT_FIRE]     -=   Ri_TProtFire02;
	self.protection [PROT_MAGIC]    -=   Ri_TProtMage02;
	};
	
/******************************************************************************************/
		INSTANCE ItRi_Dex_01(C_Item) //bei Vatras Kap2. 
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Dex;

	visual 					=	"ItRi_Dex_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Dex_01;
	on_unequip				=	UnEquip_ItRi_Dex_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Ring der Gewandtheit";
	
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= Ri_Dex;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Dex_01()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,+ Ri_Dex );
	};


	FUNC VOID UnEquip_ItRi_Dex_01()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,- Ri_Dex );
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Dex_02(C_Item)//Joly:in OW Nähe Alter DT
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Dex02;

	visual 					=	"ItRi_Dex_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Dex_02;
	on_unequip				=	UnEquip_ItRi_Dex_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Geschicklichkeit";

	TEXT[2]					= 	NAME_Bonus_Dex;
	COUNT[2]				= 	Ri_Dex02;
	
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Dex_02()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,+ Ri_Dex02 );
	};


	FUNC VOID UnEquip_ItRi_Dex_02()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,- Ri_Dex02 );
	};


/******************************************************************************************/
		INSTANCE ItRi_Hp_01(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Hp;

	visual 					=	"ItRi_Hp_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Hp_01;
	on_unequip				=	UnEquip_ItRi_Hp_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Lebenskraft";
	
	TEXT[2]					= NAME_Bonus_HP;
	COUNT[2]				= Ri_Hp;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Hp_01()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp; 
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp;

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	};

	FUNC VOID UnEquip_ItRi_Hp_01()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] -Ri_Hp;
		if self.attribute [ATR_HITPOINTS]> Ri_Hp+1
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = 2;
		};

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Hp_02(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Hp02;

	visual 					=	"ItRi_Hp_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Hp_02;
	on_unequip				=	UnEquip_ItRi_Hp_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Lebendigkeit";
	
	TEXT[2]					= NAME_Bonus_HP;
	COUNT[2]				= Ri_Hp02;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Hp_02()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp02; 
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp02;

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	};

	FUNC VOID UnEquip_ItRi_Hp_02()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX]- Ri_Hp02;
		if self.attribute [ATR_HITPOINTS]> Ri_Hp02+1
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp02;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = 2;
		};

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Hp_03(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Hp03;

	visual 					=	"ItRi_Hp_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Hp_03;
	on_unequip				=	UnEquip_ItRi_Hp_03;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Lebendsenergie";
	
	TEXT[2]					= NAME_Bonus_HP;
	COUNT[2]				= Ri_Hp03;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Hp_03()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp03; 
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp03;

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	};

	FUNC VOID UnEquip_ItRi_Hp_03()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX]- Ri_Hp03;
		if self.attribute [ATR_HITPOINTS]> Ri_Hp03+1
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp03;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = 2;
		};

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Str_01(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Strg;

	visual 					=	"ItRi_Str_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Str_01;
	on_unequip				=	UnEquip_ItRi_Str_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Kraft";
	
	TEXT[2]					= NAME_Bonus_Str;
	COUNT[2]				= Ri_Strg;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Str_01()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,+ Ri_Strg );
	};

	FUNC VOID UnEquip_ItRi_Str_01()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,- Ri_Strg );
	};


INSTANCE ItRi_Ruprecht (C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Strg;

	visual 					=	"ItRi_Str_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Ruprecht;
	on_unequip				=	UnEquip_ItRi_Ruprecht;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ruprecht's Ring";
	
	TEXT[2]					= NAME_Bonus_Str;
	COUNT[2]				= 5;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Ruprecht()
	{
		Npc_ChangeAttribute(self, ATR_STRENGTH, +5);
	};

	FUNC VOID UnEquip_ItRi_Ruprecht()
	{
		Npc_ChangeAttribute(self, ATR_STRENGTH, -5);
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Str_02(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Strg02;

	visual 					=	"ItRi_Str_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Str_02;
	on_unequip				=	UnEquip_ItRi_Str_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Stärke";
	
	TEXT[2]					= NAME_Bonus_Str;
	COUNT[2]				= Ri_Strg02;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Str_02()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,+Ri_Strg02 );
	};

	FUNC VOID UnEquip_ItRi_Str_02()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_Strg02 );
	};

/******************************************************************************************/
	INSTANCE ItRi_Mana_01(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Mana;

	visual 					=	"ItRi_Mana_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Mana_01;
	on_unequip				=	UnEquip_ItRi_Mana_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Magie";
	
	TEXT[2]					= NAME_Bonus_Mana;
	COUNT[2]				= Ri_Mana;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Mana_01()
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_Mana;
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_Mana;
	};


	FUNC VOID UnEquip_ItRi_Mana_01()
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_Mana;
		
		if self.attribute [ATR_MANA]	>= Ri_Mana
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_Mana;
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
		
		
	};
/******************************************************************************************/
INSTANCE ItRi_Mana_02(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Mana02;

	visual 					=	"ItRi_Mana_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Mana_02;
	on_unequip				=	UnEquip_ItRi_Mana_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der astralen Kraft";
	
	TEXT[2]					= NAME_Bonus_Mana;
	COUNT[2]				= Ri_Mana02;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Mana_02()
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_Mana02;
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_Mana02;
		
	};


	FUNC VOID UnEquip_ItRi_Mana_02()
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_Mana02;
		
		if self.attribute [ATR_MANA]	>= Ri_Mana02
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_Mana02;
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
		
	};	
/******************************************************************************************/
		INSTANCE ItRi_Hp_Mana_01(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_HpMana;

	visual 					=	"ItRi_Hp_Mana_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Hp_Mana_01;
	on_unequip				=	UnEquip_ItRi_Hp_Mana_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Erleuchtung";
	
	TEXT[2]					= NAME_Bonus_Mana;
	COUNT[2]				= Ri_HpMana_Mana;
	TEXT[3] 				= NAME_Bonus_HP;
	COUNT[3]				= Ri_HpMana_HP;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Hp_Mana_01()
	{
		
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_HpMana_Mana;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_HpMana_Mana;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_HpMana_Hp;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_HpMana_Hp;

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		
	};


	FUNC VOID UnEquip_ItRi_Hp_Mana_01()
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_HpMana_Mana;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_HpMana_Hp;
		
		if (self.attribute [ATR_HITPOINTS] > Ri_HpMana_Hp+1)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_HpMana_Hp;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
		if self.attribute [ATR_MANA]	>= Ri_HpMana_Hp
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_HpMana_Hp;
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	};
		
/******************************************************************************************/
	INSTANCE ItRi_Dex_Strg_01(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_DexStrg;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Dex_Strg_01;
	on_unequip				=	UnEquip_ItRi_Dex_Strg_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Macht";
	
	TEXT[2]					= NAME_Bonus_Str;
	COUNT[2]				= 4;
	TEXT[3] 				= NAME_Bonus_Dex;
	COUNT[3]				= 4;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Dex_Strg_01()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH, Ri_DexStrg_Strg);
		Npc_ChangeAttribute(self,ATR_DEXTERITY, Ri_DexStrg_Dex);
	};

	FUNC VOID UnEquip_ItRi_Dex_Strg_01()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,- Ri_DexStrg_Strg);
		Npc_ChangeAttribute(self,ATR_DEXTERITY, - Ri_DexStrg_Dex);
	};
		

INSTANCE ItRi_Spheric(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_DexStrg;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Spheric;
	on_unequip				=	UnEquip_ItRi_Spheric;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der sphärischen Manifestation";
	
	TEXT[2]					= "Dieser Ring scheint beschworene Wesen länger zu erhalten";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_Spheric()
{
	Mod_SphericRing = TRUE;
};

FUNC VOID UnEquip_ItRi_Spheric()
{
	Mod_SphericRing = FALSE;
};

INSTANCE ItRi_Wiederkehr(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_DexStrg;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Wiederkehr;
	on_unequip				=	UnEquip_ItRi_Wiederkehr;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der sphärischen Manifestation";
	
	TEXT[2]					= "Dieser Ring scheint beschworene Wesen länger zu erhalten";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_Wiederkehr()
{
	Mod_WiederkehrRing = TRUE;
};

FUNC VOID UnEquip_ItRi_Wiederkehr()
{
	Mod_WiederkehrRing = FALSE;
};

INSTANCE ItRi_Buecherwurm(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_DexStrg;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Buecherwurm;
	on_unequip				=	UnEquip_ItRi_Buecherwurm;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring des Bücherwurms";
	
	TEXT[1]					= "Theorie und Praxis sind eben nicht das Selbe";

	TEXT[2]		= NAME_Bonus_Str;
	COUNT[2]	= -20;

	TEXT[3]		= NAME_Bonus_Dex;
	COUNT[3]	= -10;

	TEXT[4]		= "Erfahrungsbonus in %";
	COUNT[4]	= 10;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_Buecherwurm()
{
	self.attribute[ATR_STRENGTH] -= 20;
	self.attribute[ATR_DEXTERITY] -= 10;

	Mod_BuecherwurmRing = TRUE;
};

FUNC VOID UnEquip_ItRi_Buecherwurm()
{
	self.attribute[ATR_STRENGTH] += 20;
	self.attribute[ATR_DEXTERITY] += 10;

	Mod_BuecherwurmRing = FALSE;
};

INSTANCE ItRi_Eber(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_DexStrg;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Eber;
	on_unequip				=	UnEquip_ItRi_Eber;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring des Ebers";
	
	TEXT[0]					= "Beseelt mit roher Körperkraft";

	TEXT[1]		= NAME_Bonus_Str;
	COUNT[1]	= 20;

	TEXT[2]		= NAME_Bonus_Dex;
	COUNT[2]	= -10;

	TEXT[3]		= NAME_Bonus_Mana;
	COUNT[3]	= -20;

	TEXT[4]		= NAME_Bonus_HP;
	COUNT[4]	= 20;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_Eber()
{
	self.attribute[ATR_STRENGTH] += 20;
	self.attribute[ATR_DEXTERITY] -= 10;
	self.attribute[ATR_HITPOINTS_MAX] += 20;
	self.attribute[ATR_HITPOINTS] += 20;
	self.attribute[ATR_MANA] -= 20;
	self.attribute[ATR_MANA_MAX] -= 20;

	Mod_EberRing = TRUE;
};

FUNC VOID UnEquip_ItRi_Eber()
{
	self.attribute[ATR_STRENGTH] -= 20;
	self.attribute[ATR_DEXTERITY] += 10;
	self.attribute[ATR_HITPOINTS_MAX] -= 20;
	self.attribute[ATR_HITPOINTS] -= 20;
	self.attribute[ATR_MANA] += 20;
	self.attribute[ATR_MANA_MAX] += 20;

	Mod_EberRing = FALSE;
};

INSTANCE ItRi_Kuenstler(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_DexStrg;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Kuenstler;
	on_unequip				=	UnEquip_ItRi_Kuenstler;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring des Künstlers";
	
	TEXT[0]					= "Wer Leier spielt und den Bogen spannt nimmt ungern ein Stück Metall in die Hand";

	TEXT[1]		= NAME_Bonus_Str;
	COUNT[1]	= -17;

	TEXT[2]		= NAME_Bonus_Dex;
	COUNT[2]	= -10;

	TEXT[3]		= NAME_Bonus_Mana;
	COUNT[3]	= -20;

	TEXT[4]		= NAME_Bonus_HP;
	COUNT[4]	= 20;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_Kuenstler()
{
	self.attribute[ATR_STRENGTH] -= 17;
	self.attribute[ATR_DEXTERITY] += 15;
	self.attribute[ATR_MANA] += 4;
	self.attribute[ATR_MANA_MAX] += 4;

	Mod_KuenstlerRing = TRUE;
};

FUNC VOID UnEquip_ItRi_Kuenstler()
{
	self.attribute[ATR_STRENGTH] += 17;
	self.attribute[ATR_DEXTERITY] -= 15;
	self.attribute[ATR_MANA] -= 20;
	self.attribute[ATR_MANA_MAX] -= 20;

	Mod_KuenstlerRing = FALSE;
};

INSTANCE ItRi_Troll(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_DexStrg;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Troll;
	on_unequip				=	UnEquip_ItRi_Troll;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Trollfaust-Schlagring";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_Troll()
{
	Mod_TrollRing = TRUE;
};

FUNC VOID UnEquip_ItRi_Troll()
{
	Mod_TrollRing = FALSE;
};

INSTANCE ItRi_Heilung(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_DexStrg;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Heilung;
	on_unequip				=	UnEquip_ItRi_Heilung;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Heilung";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_Heilung()
{
	Mod_HeilungRing = TRUE;
};

FUNC VOID UnEquip_ItRi_Heilung()
{
	Mod_HeilungRing = FALSE;
};

INSTANCE ItRi_Willenskraft(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_DexStrg;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Willenskraft;
	on_unequip				=	UnEquip_ItRi_Willenskraft;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Willenskraft";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_Willenskraft()
{
	Mod_WillenskraftRing = TRUE;
};

FUNC VOID UnEquip_ItRi_Willenskraft()
{
	Mod_WillenskraftRing = FALSE;
};

INSTANCE ItRi_KritischerTreffer(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_DexStrg;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_KritischerTreffer;
	on_unequip				=	UnEquip_ItRi_KritischerTreffer;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring des kritischen Treffers";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_KritischerTreffer()
{
	Mod_KritischerTrefferRing = TRUE;
};

FUNC VOID UnEquip_ItRi_KritischerTreffer()
{
	Mod_KritischerTrefferRing = FALSE;
};

INSTANCE ItRi_Garunh(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING|ITEM_SHOW;

	value 					=	Value_Ri_DexStrg;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Garunh;
	on_unequip				=	UnEquip_ItRi_Garunh;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Garunhs Ring";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_Garunh()
{
};

FUNC VOID UnEquip_ItRi_Garunh()
{
};

INSTANCE ItRi_Siegelring(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING|ITEM_SHOW;

	value 					=	Value_Ri_DexStrg;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Siegelring;
	on_unequip				=	UnEquip_ItRi_Siegelring;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "geraubter Siegelring";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_Siegelring()
{
};

FUNC VOID UnEquip_ItRi_Siegelring()
{
};