instance Mod_1426_BUD_Grim_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Grim";
	npctype =						npctype_main;
	guild =							GIL_out;      
	level =							5;
	
	
	voice =							6;
	id =							1426;


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

	
	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 15);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_1426;
};

FUNC VOID Rtn_Start_1426 ()
{
	TA_Stand_ArmsCrossed	(22,00,05,00,"WP_GRIM_VORWALD");
	TA_Sleep		(05,00,06,30,"OCR_HUT_2");
	TA_Wash_FP		(06,30,07,00,"OCR_LAKE_1");
	TA_Sit_Campfire		(07,00,10,00,"OCR_CAMPFIRE_A_MOVEMENT2");
	TA_Smalltalk		(10,00,12,00,"OCR_CAMPFIRE_A_MOVEMENT1"); //mit Diego
	TA_Cook_Cauldron	(12,00,12,30,"OCR_AT_HUT_2");
	TA_Smalltalk		(12,30,15,30,"OCR_CAMPFIRE_A_MOVEMENT3"); //mit Stt_322
	TA_Cook_Cauldron	(15,30,18,05,"OCR_AT_HUT_2");
	TA_Sit_Campfire		(18,05,22,00,"OCR_CAMPFIRE_A_MOVEMENT2");	
};

FUNC VOID Rtn_Tot_1426 ()
{
	TA_Cook_Cauldron		(08,00,18,00,"TOT");
	TA_Cook_Cauldron		(18,00,08,00,"TOT");
};