instance Mod_1288_SLD_Butch_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Butch";
	Npctype =						Npctype_Main;
	guild =							GIL_mil;      
	level =							15;
	
	voice =							13;
	id =							1288;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_Drachenaxt);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald", 36, 1, ITAR_DJG_M);

	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);

	//------- Inventory ---------

	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1288;
	};

FUNC VOID Rtn_start_1288 ()
{
	TA_Sleep		(01,00,07,30,"NC_HUT15_IN");
	TA_Stand_WP		(07,30,01,00,"NC_HUT16_OUT");
};

FUNC VOID Rtn_Boss_1288 ()
{
	TA_Sleep		(23,00,07,30,"NC_HUT15_IN");
	TA_Stand_Eating		(07,30,10,00,"NC_PATH05");
	TA_Stand_Guarding	(10,00,17,00,"FMC_PATH09");
	TA_Stand_Drinking	(17,00,20,00,"NC_PATH05");
	TA_Sit_Campfire		(20,00,23,00,"NC_HUT16_OUT");
};

FUNC VOID Rtn_Ueberfall_1288 ()
{
	TA_Smalltalk_Plaudern 	(08,00,22,00,"OW_PATH_07_15_CAVE2");
	TA_Smalltalk_Plaudern	(22,00,08,00,"OW_PATH_07_15_CAVE2");		
};

FUNC VOID Rtn_Tot_1288 ()
{
	TA_Stand_WP	(01,00,07,30,"TOT");
	TA_Stand_WP	(07,30,01,00,"TOT");
};
