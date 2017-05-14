instance Mod_7021_GUR_CorKalom_OT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Cor Kalom";
	Npctype 	=		NPCTYPE_Main;
	guild 		=		GIL_DMT;
	level 		=		28;
	
	voice		= 0;
	id 			=		7021;
	flags = NPC_FLAG_GHOST|2;

	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
		
	///-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	60;
	attribute[ATR_MANA_MAX] 		=	250;
	attribute[ATR_MANA] 			=	250;
	attribute[ATR_HITPOINTS_MAX] 	=	376;
	attribute[ATR_HITPOINTS] 		=	376;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 166,  1, GUR_ARMOR_M);

	
	Mdl_SetModelFatness(self,0);

	//-------- Talente --------
	
	//-------- inventory --------
	
	EquipItem (self, Oruns_Keule);
	B_SetAttributesToChapter (self, 6);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7021;
	fight_tactic	=	FAI_HUMAN_MASTER;
};

FUNC VOID Rtn_start_7021 ()
{
	TA_Stand_ArmsCrossed 	(08,00,20,00,"TPL_386");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"TPL_386");
};