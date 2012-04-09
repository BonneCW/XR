instance Mod_1219_TPL_Templer_MT (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NPCTYPE_mt_templer;
	guild =							GIL_out;
	level =							12;
	
	
	voice =							13;
	id =							1219;
		
	//-------- abilities --------
	B_SetAttributesToChapter(self, 4);


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 62 , 1, TPL_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	B_SetFightSkills (self, 70);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_01);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1219;
};

FUNC VOID Rtn_start_1219 ()
{
	TA_Sleep			(00,05,06,05,"PSI_15_HUT_IN");
	TA_Practice_Sword	(16,05,00,05,"PSI_TRAINING_1");	
};

FUNC VOID Rtn_Leichengase_1219 ()
{
	TA_Smalltalk	(00,05,06,05,"WP_MT_GORNAKOSH_WAIT");
	TA_Smalltalk	(16,05,00,05,"WP_MT_GORNAKOSH_WAIT");	
};

FUNC VOID Rtn_Leichengase2_1219 ()
{
	TA_Smalltalk_Plaudern	(00,00,06,00,"PSI_TRAINING_1");
	TA_Smalltalk_Plaudern	(06,00,00,00,"PSI_TRAINING_1");	
};

FUNC VOID Rtn_Posten_1219 ()
{
	TA_Stand_WP	(01,00,05,00,"WP_MT_SUMPF_TEMPLER_01");
    TA_Stand_WP	(05,00,01,00,"WP_MT_SUMPF_TEMPLER_01");
};

FUNC VOID Rtn_Flucht_1219 ()
{
	TA_FleeToWP	(01,00,05,00,"PSI_TEMPLE_NOVIZE_PR3");
    TA_FleeToWP	(05,00,01,00,"PSI_TEMPLE_NOVIZE_PR3");
};

FUNC VOID Rtn_Follow_1219 ()
{
	TA_Follow_Player	(01,00,05,00,"PSI_TEMPLE_NOVIZE_PR3");
    TA_Follow_Player	(05,00,01,00,"PSI_TEMPLE_NOVIZE_PR3");
};

FUNC VOID Rtn_Tot_1219 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};