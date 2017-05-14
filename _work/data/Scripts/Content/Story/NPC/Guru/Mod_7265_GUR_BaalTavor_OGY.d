instance Mod_7265_GUR_BaalTavor_OGY (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Tavor";
	Npctype 	=		NPCTYPE_Main;
	guild 		=		GIL_OUT;
	level 		=		28;
	voice		= 0;
	id 			=		7265;
		
	///-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	60;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	376;
	attribute[ATR_HITPOINTS] 		=	20;

	protection[PROT_MAGIC] = -1;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 166,  1, GUR_ARMOR_M);

	
	Mdl_SetModelFatness(self,0);

	//-------- Talente --------
	
	//-------- inventory --------
	
	B_SetAttributesToChapter (self, 6);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7265;
	fight_tactic	=	FAI_HUMAN_MAGE;
};

FUNC VOID Rtn_start_7265 ()
{
	TA_Sit_Campfire		(00,00,08,00,"GRYD_054");
	TA_Sit_Campfire		(08,00,24,00,"GRYD_054");	
};