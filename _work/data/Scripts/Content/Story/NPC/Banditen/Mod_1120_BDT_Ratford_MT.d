instance Mod_1120_BDT_Ratford_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Ratford";
	Npctype =				Npctype_Main;	
	guild =					GIL_OUT;      
	level =					8;

	
	voice =					7;
	id =					1120;


	//-------- abilities --------
	B_SetAttributesToChapter (self, 5);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_L_Ratford, BodyTex_L, ITAR_BDT_M_01);	

	Mdl_SetModelFatness (self, 0);
	
	
	EquipItem	(self, ItMw_Banditenschwert);

	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------																	
	B_SetFightSkills (self, 60); 
	
	
	//-------- inventory --------   
	                                 
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_1120;
	
	//------------ //MISSIONs-------------------
};

FUNC VOID Rtn_Start_1120 ()
{
	TA_Smalltalk (00,00,23,00,"OW_PATH_1_5_A");
	TA_Smalltalk (23,00,00,00,"OW_PATH_1_5_A");
};

FUNC VOID Rtn_Rettung_1120()
{
	TA_RunToWP	(08,00,20,00,"LOCATION_11_12_09");
	TA_RunToWP	(20,00,08,00,"LOCATION_11_12_09");
};

FUNC VOID Rtn_Fokus_1120()
{
	TA_Stand_Guarding	(08,00,20,00,"WP_CIRCLE_01");
	TA_Stand_Guarding	(20,00,08,00,"WP_CIRCLE_01");
};

