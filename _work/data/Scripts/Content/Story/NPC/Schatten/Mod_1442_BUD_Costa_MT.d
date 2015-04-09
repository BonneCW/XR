instance Mod_1442_BUD_Costa_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Costa";
	npctype =						npctype_MAIN;
	guild =							GIL_out;      
	level =							2;

	
	voice =							34;
	id =							1442;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 2);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 72,  1, VLK_ARMOR_M);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    
	B_SetFightSkills	(self, 20);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1442;
};

FUNC VOID Rtn_start_1442 () //Arenaplatz
{
	TA_Sleep		(23,00,08,00,"OCR_HUT_24");
	TA_Smalltalk		(08,00,17,00,"OCR_OUTSIDE_HUT_24");	//mit Vlk 515
	TA_Sit_Bench		(17,00,19,00,"OCR_OUTSIDE_ARENA_BENCH1");
	TA_Stand_Drinking	(19,00,23,00,"OCR_ARENA_05");
};

FUNC VOID Rtn_Treffen_1442 ()
{
	TA_Smalltalk		(23,00,06,45,"FMC_HUT11_IN");
	TA_Pick_Ore 		(06,45,23,00,"FMC_ORE_09");
};

FUNC VOID Rtn_Mine_1442()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"OW_PATH_1_17");
	TA_Stand_ArmsCrossed	(23,00,08,00,"OW_PATH_1_17");	
};

FUNC VOID Rtn_Abgemurkst_1442()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"WP_MT_ALISSANDRO_GALGEN");
	TA_Stand_ArmsCrossed	(23,00,08,00,"WP_MT_ALISSANDRO_GALGEN");	
};

FUNC VOID Rtn_Tot_1442()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"TOT");
	TA_Stand_ArmsCrossed	(23,00,08,00,"TOT");	
};