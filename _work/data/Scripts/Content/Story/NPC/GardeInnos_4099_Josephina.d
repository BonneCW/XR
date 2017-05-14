instance GardeInnos_4099_Josephina (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Josephina";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_NONE;
	level 		=		80;

	flags	= 2;
	 	
	voice		= 0;
	id 			=		4099;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 6);
	level 		=		80;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_BabeHair", FaceBabe_N_HairAndCloth, BodyTex_N, ItAr_GardeInnos);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 


	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 100);
	B_CreateAmbientInv 	(self);

	fight_tactic	=	FAI_HUMAN_MASTER;

	EquipItem	(self, ItMw_1H_Blessed_03);

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_4099;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_4099 ()
{
	TA_Stand_WP	(02,00,08,00,"ADW_PORTALTEMPEL_03");
	TA_Stand_WP	(08,00,02,00,"ADW_PORTALTEMPEL_03"); 
};

FUNC VOID Rtn_Bib_4099 ()
{
	TA_Stand_WP	(02,00,08,00,"ADW_CANYON_LIBRARY_RIGHT_04");
	TA_Stand_WP	(08,00,02,00,"ADW_CANYON_LIBRARY_RIGHT_04"); 
};

FUNC VOID Rtn_Tempel_4099 ()
{
	TA_Stand_WP	(02,00,08,00,"WP_AW_BEL_08");
	TA_Stand_WP	(08,00,02,00,"WP_AW_BEL_08"); 
};