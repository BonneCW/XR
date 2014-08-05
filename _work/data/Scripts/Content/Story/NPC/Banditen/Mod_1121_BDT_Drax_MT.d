instance Mod_1121_BDT_Drax_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Drax";
	Npctype =				Npctype_Main;
	guild =							GIL_OUT;      
	level =							3;
	
	voice =							30;
	id =							1121;

	//-------- abilities --------
	B_SetAttributesToChapter (self, 5);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Drax, BodyTex_N, ITAR_BDT_M_01);

	Mdl_SetModelFatness (self, 0);	
	
	EquipItem	(self, ItMw_Banditenschwert);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------                        																	
	B_SetFightSkills (self, 60); 
	
	
	//-------- inventory --------   
	                                 
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_Start_1121;

};

FUNC VOID Rtn_Start_1121 ()
{
	TA_Smalltalk (00,00,23,00,"OW_PATH_1_5_B");
	TA_Smalltalk (23,00,00,00,"OW_PATH_1_5_B");
};

FUNC VOID Rtn_Rettung_1121()
{
	TA_RunToWP	(08,00,20,00,"LOCATION_11_12_09");
	TA_RunToWP	(20,00,08,00,"LOCATION_11_12_09");
};

FUNC VOID Rtn_Fokus_1121()
{
	TA_Sit_Campfire		(08,00,20,00,"WP_DRAX_FOKUSWALD_03");
	TA_Sit_Campfire		(20,00,08,00,"WP_DRAX_FOKUSWALD_03");
};

FUNC VOID Rtn_Tot_1121()
{
	TA_RunToWP	(08,00,20,00,"TOT");
	TA_RunToWP	(20,00,08,00,"TOT");
};