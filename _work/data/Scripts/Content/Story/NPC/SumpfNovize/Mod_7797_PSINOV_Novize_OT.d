instance Mod_7797_PSINOV_Novize_OT (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_mt_sumpfnovize;
	guild 		=		GIL_out;
	level 		=		3;

	voice 		=		2;
	id 			=		7797;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_FatBald", 31 ,  1, NOV_ARMOR_L);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
		
	//-------- inventory --------
	CreateInvItems	(self, ItWr_OTGeheimkammer01, 1);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7797;
	
	//------------- //MISSIONs------------------

};

FUNC VOID Rtn_start_7797 ()
{
	TA_Stand_WP 	(08,00,20,00,"TPL_386");
	TA_Stand_WP 	(20,00,08,00,"TPL_386");
};