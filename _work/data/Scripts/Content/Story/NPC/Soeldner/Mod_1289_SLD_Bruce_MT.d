instance Mod_1289_SLD_Bruce_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Bruce";
	Npctype =						NPCTYPE_main;
	guild =							GIL_mil;      
	level =							11;
	
	voice =							6;
	id =							1289;


	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Fighter", 35,  1, SLD_ARMOR_L);
	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
	
	//-------- inventory --------
	                                    
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1289;
};

FUNC VOID Rtn_start_1289 ()
{
	TA_Stand_Drinking	(08,00,22,00,"FMC_ENTRANCE");
	TA_Stand_Drinking	(22,00,08,00,"FMC_ENTRANCE");
};

FUNC VOID Rtn_Uebergabe_1289 ()
{
	TA_Stand_Drinking	(08,00,20,00,"FMC_ENTRANCE");
	TA_Smoke_Joint		(20,00,24,00,"OW_PATH_3001_02");
	TA_Stand_Drinking	(24,00,08,00,"FMC_ENTRANCE");
};











