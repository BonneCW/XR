instance Mod_1117_PSINOV_BaalKagan_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Kagan";
	Npctype	 	=		Npctype_Main;
	guild 		=		GIL_OUT;
	level 		=		9;
	
	voice 		=		13;
	id 			=		1117;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	15;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	148;
	attribute[ATR_HITPOINTS] 		=	148;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 29,  1, NOV_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1117;
};

FUNC VOID Rtn_start_1117 ()
{
	TA_Stand_WP	(00,00,07,30,"NC_PATH_PEASANT_OUTSIDE11");
	TA_Smalltalk	(07,30,00,00,"NC_PLACE06");
};

FUNC VOID Rtn_Isidro_1117 ()
{
	TA_Stand_WP (08,00,20,00,"NC_TAVERN_OUT"); 
	TA_Stand_WP (20,00,08,00,"NC_TAVERN_OUT");
};

FUNC VOID Rtn_Lager_1117 ()
{
	TA_Sit_Campfire (08,00,20,00,"PSI_PATH_2_14"); 
	TA_Sit_Campfire (20,00,08,00,"PSI_PATH_2_14");
};