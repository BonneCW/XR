instance Mod_1933_BUD_Buddler_NW (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_main;
	guild =							GIL_out;      
	level =							4;
	
	
	voice		= 0;
	id =							1933;


	//-------- abilities --------

	B_SetAttributesToChapter	(self, 2);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 67,  1, vlk_armor_l);
        
        Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
  	//-------- Talents --------                                    

	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1933;
};

FUNC VOID Rtn_start_1933 ()
{
	TA_Stand_WP		(23,00,08,00,"NW_CITY_HABOUR_KASERN_01");
	TA_Stand_WP	(08,00,23,00,"NW_CITY_HABOUR_KASERN_01");
};

FUNC VOID Rtn_Arbeit_1933 ()
{
	TA_Sweep_FP		(23,00,08,00,"NW_CITY_HABOUR_HUT_03_IN_02");
	TA_Sweep_FP	(08,00,23,00,"NW_CITY_HABOUR_HUT_03_IN_02");
};











