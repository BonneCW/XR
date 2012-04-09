instance Mod_7456_GUR_BaalNamib_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Baal Namib";
	Npctype 	=	NPCTYPE_Main;
	guild 		=	GIL_OUT;
	level 		=	29;
	flags		= 	NPC_FLAG_IMMORTAL;
	voice 		=	2;
	id 			=	7456;
			
	///-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	55;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	388;
	attribute[ATR_HITPOINTS] 		=	388;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 166,  1, GUR_ARMOR_M);

		Mdl_SetModelFatness(self,0);

	//-------- Talente --------
	//-------- inventory --------
	
	EquipItem (self, Namibs_Keule);
	
	B_SetAttributesToChapter (self, 6);
	fight_tactic		= FAI_HUMAN_STRONG;
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_7456;
};

FUNC VOID Rtn_Start_7456 ()
{
	TA_Stand_ArmsCrossed 	(08,00,20,00,"SHIP_DECK_20");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"SHIP_DECK_20");
};

FUNC VOID Rtn_Tot_7456 ()
{
	TA_Stand_ArmsCrossed 	(08,00,20,00,"TOT");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"TOT");
};
