instance Mod_7770_PSINOV_Nyras_OGY (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Nyras";
	Npctype 		=		Npctype_Main;
	guild 		=		GIL_DMT;
	level 		=		3;
	 	
	voice		= 0;
	id 			=		7770;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 28,  1, NOV_ARMOR_L);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------	
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);

	EquipItem	(self, ItMw_Matronenkeule);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7770;
};

FUNC VOID Rtn_start_7770()
{
	TA_Stand_Guarding	(08,00,20,00,"GRYD_017");
	TA_Stand_Guarding	(20,00,08,00,"GRYD_017");
};