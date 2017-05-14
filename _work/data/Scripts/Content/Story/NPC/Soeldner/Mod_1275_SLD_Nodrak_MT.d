instance Mod_1275_SLD_Nodrak_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Nodrak";
	Npctype =				NPCTYPE_main;
	guild =					GIL_mil;       
	level =					16;
	
	voice		= 0;
	id =					1275;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Pony", 47, 1,ITAR_SLD_M);
	
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
			
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	

	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1275;
};

FUNC VOID Rtn_start_1275 ()
{
	TA_Sleep			(00,30,08,00,"NC_HUT07_IN");
	TA_Stand_Drinking	(08,00,22,00,"NC_TAVERN_ROOM06");
	TA_Stand_Drinking		(22,00,00,30,"NC_TAVERN_ROOM06");
};

FUNC VOID Rtn_WaitForPlayer_1275 ()
{	
	TA_RunToWP		(08,00,22,00,"OW_PATH_07_21");
    	TA_RunToWP		(22,00,08,00,"OW_PATH_07_21");
};

FUNC VOID Rtn_SmallCave_1275 ()
{	
	TA_Guide_Player		(08,00,22,00,"LOCATION_24_IN");
    	TA_Guide_Player		(22,00,08,00,"LOCATION_24_IN");
};

FUNC VOID Rtn_SmokePause_1275 ()
{	
	TA_Smoke_Joint		(08,00,22,00,"LOCATION_24_IN");
    	TA_Smoke_Joint		(22,00,08,00,"LOCATION_24_IN");
};

FUNC VOID Rtn_GreatCave_1275 ()
{	
	TA_Guide_Player		(08,00,22,00,"LOCATION_23_CAVE_1_OUT");
    	TA_Guide_Player		(22,00,08,00,"LOCATION_23_CAVE_1_OUT");
};

FUNC VOID Rtn_Waiting_1275 ()
{	
	TA_Stand_WP		(08,00,22,00,"LOCATION_23_CAVE_1_OUT");
    	TA_Stand_WP		(22,00,08,00,"LOCATION_23_CAVE_1_OUT");
};

FUNC VOID Rtn_PotionPause_1275 ()
{	
	TA_Smoke_Waterpipe		(08,00,22,00,"LOCATION_23_CAVE_1_02");
    	TA_Smoke_Waterpipe		(22,00,08,00,"LOCATION_23_CAVE_1_02");
};

FUNC VOID Rtn_FollowToCamp_1275 ()
{	
	TA_Follow_Player		(08,00,22,00,"OW_PATH_07_21");
    	TA_Follow_Player		(22,00,08,00,"OW_PATH_07_21");
};

FUNC VOID Rtn_FleeToCamp_1275 ()
{	
	TA_FleeToWP		(08,00,22,00,"OW_PATH_07_21");
    	TA_FleeToWP		(22,00,08,00,"OW_PATH_07_21");
};