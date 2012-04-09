instance GardeInnos_4098_Danae (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Danae";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_NONE;
	level 		=		80;
	 	
	voice 		=		2;
	id 			=		4098;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 6);
	level 		=		80;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 14, 0,"Hum_Head_FatBald", 200,  1, ItAr_GardeInnos);

	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 65);
	B_CreateAmbientInv 	(self);

	fight_tactic	=	FAI_HUMAN_MASTER;

	EquipItem	(self, ItMw_1H_Blessed_03);

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_4098;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_4098 ()
{
	TA_Stand_WP	(02,00,08,00,"NW_TROLLAREA_PORTAL_01");
	TA_Stand_WP	(08,00,02,00,"NW_TROLLAREA_PORTAL_01"); 
};