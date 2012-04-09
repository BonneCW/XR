instance Mod_1290_SLD_Roscoe_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Roscoe";
	Npctype =				Npctype_Main;
	guild =					GIL_mil;   	
	voice =					10;
	id =					1290;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Pony", 9, 2, ITAR_SLD_M);
	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	

	//-------- inventory --------
	                                    
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1290;
};

FUNC VOID Rtn_start_1290 () //vor Lares Hütte
{
	TA_Sleep	(23,00,07,00,"NC_HUT22_IN");
	TA_Sit_Chair	(07,00,12,00,"NC_HUT22_IN_MOVEMENT");	
	TA_Stand_Eating	(12,00,19,00,"NC_HUT22_IN_MOVEMENT2");	
	TA_Sit_Chair	(19,00,23,00,"NC_HUT22_IN_MOVEMENT");	
};

FUNC VOID Rtn_Ueberfall_1290 ()
{
	TA_Smalltalk_Plaudern 	(08,00,22,00,"OW_PATH_07_15_CAVE2");
	TA_Smalltalk_Plaudern	(22,00,08,00,"OW_PATH_07_15_CAVE2");		
};