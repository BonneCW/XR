instance Mod_1319_SLD_Organisator_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Torwache;
	Npctype =				NPCTYPE_MAIN;
	guild =							GIL_mil;       
	level =							4;

	
	voice =							13;
	id =							1319;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_FatBald", 12 , 0, ITAR_SLD_M);
	
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
	
	Npc_SetTalentSkill (self, NPC_TALENT_SNEAK,	1);	
	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1319;
};

FUNC VOID Rtn_start_1319 ()
{
	TA_Smoke_Joint	(08,00,20,00,"OW_PATH_07_21_GUARD_LEFT");
	TA_Smoke_Joint	(20,00,08,00,"OW_PATH_07_21_GUARD_LEFT");
};

FUNC VOID Rtn_Arto_1319 ()
{
	TA_Smoke_Joint	(08,00,20,00,"OW_PATH_068");
	TA_Smoke_Joint	(20,00,08,00,"OW_PATH_068");
};




