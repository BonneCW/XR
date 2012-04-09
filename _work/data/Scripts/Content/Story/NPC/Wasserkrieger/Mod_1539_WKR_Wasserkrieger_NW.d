instance Mod_1539_WKR_Wasserkrieger_NW (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Wasserkrieger;
	npctype =						npctype_nw_wasserkrieger;
	guild =							GIL_nov;
	level =							2;
	
	
	voice =							2;
	id =							1539;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_AdanosSchwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_FatBald", 0,  2, ITAR_WKR_H);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_strong; 

	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1539;
};

FUNC VOID Rtn_start_1539 ()
{
	TA_Stand_Eating			(22,00,07,00,"NW_TROLLAREA_PORTAL_05");
	TA_Stand_Eating			(07,00,11,00,"NW_TROLLAREA_PORTAL_05");
};

FUNC VOID Rtn_Sammeln_1539 ()
{
	TA_Stand_WP	(08,00,23,00,"TAVERNE");
    TA_Stand_WP	(23,00,08,00,"TAVERNE");
};

FUNC VOID Rtn_Balrog_1539 ()
{
	TA_RunToWP	(08,00,23,00,"WP_ADANOS_BALROG");
    TA_RunToWP	(23,00,08,00,"WP_ADANOS_BALROG");
};

FUNC VOID Rtn_Gigant_1539 ()
{
	TA_RunToWP	(08,00,23,00,"NW_TO_PASS_01");
    TA_RunToWP	(23,00,08,00,"NW_TO_PASS_01");
};