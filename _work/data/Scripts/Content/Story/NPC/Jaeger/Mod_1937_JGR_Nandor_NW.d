instance Mod_1937_JGR_Nandor_NW (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Nandor";
	npctype =						npctype_main;
	guild =							GIL_out;      
	level =							2;
	
	
	voice =							3;
	id =							1937;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_naked0",3,1,"Hum_Head_Thief", 70, 1, ITAR_Waldlaeufer_01);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents --------    																
	B_SetAttributesToChapter (self, 4);  
													
	EquipItem	(self, ItMw_1H_quantarie_Fantasyschwert_01);   
	EquipItem	(self, ItRw_Sld_Bow);                            

	
	//-------- inventory --------   																	
	B_SetFightSkills (self, 60);                                  

	


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1937;
	};

FUNC VOID Rtn_start_1937 ()
{
	TA_Stand_ArmsCrossed (00,00,12,00,"WP_NANDOR_TENT_01");
	TA_Stand_ArmsCrossed (12,00,24,00,"WP_NANDOR_TENT_01");
};

FUNC VOID Rtn_Woelfe_1937 ()
{
	TA_Guide_Player (08,00,22,00,"NW_FOREST_PATH_83");
	TA_Guide_Player (22,00,08,00,"NW_FOREST_PATH_83");
};

FUNC VOID Rtn_KO_1937 ()
{
	TA_Sleep (00,00,12,00,"WP_NANDOR_TENT_02");
	TA_Sleep (12,00,24,00,"WP_NANDOR_TENT_02");
};

FUNC VOID Rtn_Brennerei_1937 ()
{
	TA_Stand_ArmsCrossed (00,00,12,00,"NW_FOREST_PATH_84");
	TA_Stand_ArmsCrossed (12,00,24,00,"NW_FOREST_PATH_84");
};