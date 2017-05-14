instance GardeInnos_4050_Argibast (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Argibast";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_NONE;
	level 		=		80;
	 	
	voice		= 0;
	id 			=		4050;
		
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
	daily_routine = Rtn_start_4050;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_4050 ()
{
	TA_Stand_WP	(02,00,08,00,"OW_PATH_086");
	TA_Stand_WP	(08,00,02,00,"OW_PATH_086"); 
};