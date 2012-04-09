instance Mod_7298_DJG_Butch_NW (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Butch";
	Npctype =						Npctype_Main;
	guild =							GIL_mil;      
	level =							15;
	
	voice =							13;
	id =							7298;


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
	daily_routine = Rtn_start_7298;
	};

FUNC VOID Rtn_start_7298 ()
{
	TA_Sit_Campfire	(00,00,08,00,"NW_BIGFARM_KITCHEN_OUT_02");	
	TA_Sit_Campfire	(08,00,00,00,"NW_BIGFARM_KITCHEN_OUT_02");
};

FUNC VOID Rtn_Tot_7298 ()
{
	TA_Stand_WP	(01,00,07,30,"TOT");
	TA_Stand_WP	(07,30,01,00,"TOT");
};

FUNC VOID Rtn_Hexen_7298()
{
	TA_Stand_WP		(08,00,20,00,"NW_BIGFARM_CROSS");
	TA_Stand_WP		(20,00,08,00,"NW_BIGFARM_CROSS");
};

FUNC VOID Rtn_Knucker_7298()
{
	TA_RunToWP		(08,00,20,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
	TA_RunToWP		(20,00,08,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
};
