instance Mod_7508_BUD_Sterling_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Sterling";
	npctype =						npctype_MAIN;
	guild =							GIL_out;      
	level =							2;
	
	
	voice =							2;
	id =							7508;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 2);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_FatBald", 0,  2, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 15);

	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7508;
};

FUNC VOID Rtn_start_7508 ()
{
	TA_Stand_ArmsCrossed	(08,00,23,00,"OW_PATH_1_17");
	TA_Stand_ArmsCrossed	(23,00,08,00,"OW_PATH_1_17");
};

FUNC VOID Rtn_Tot_7508 ()
{
	TA_Sit_Bench		(22,00,07,00,"TOT");
	TA_Sit_Bench		(07,00,22,00,"TOT");
};