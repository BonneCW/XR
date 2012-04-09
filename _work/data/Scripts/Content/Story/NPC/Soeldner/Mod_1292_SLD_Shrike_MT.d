instance Mod_1292_SLD_Shrike_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Shrike";
	Npctype =				Npctype_Main;
	guild =					GIL_mil;      
	level =					6;
	
	voice =					7;
	id =					1292;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Thief", 9,  2, SLD_ARMOR_L);
	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	
	//-------- inventory --------   
	                                 
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_1292;
};

FUNC VOID Rtn_Start_1292()
{
	TA_Sleep			(23,30,08,00,"NC_HUT18_IN");
	TA_Smoke_Joint			(08,00,23,30,"NC_PATH09");  //auf Stand-FP
};

FUNC VOID Rtn_Training_1292 ()
{	
	TA_Practice_Sword (06,00,20,00,"NC_WATERFALL_TOP05");
	TA_Practice_Sword (20,00,06,00,"NC_WATERFALL_TOP05");
};

FUNC VOID Rtn_Smoking_1292()
{
	TA_Sleep			(23,30,08,00,"NC_HUT18_IN");
	TA_Smoke_Joint			(08,00,23,30,"OW_PATH_07_21_GUARD_RIGHT");  //auf Stand-FP
};

FUNC VOID Rtn_Patrick_1292 ()
{	
	TA_FleeToWP (06,00,20,00,"NC_WATERFALL_TOP05");
	TA_FleeToWP (20,00,06,00,"NC_WATERFALL_TOP05");
};

