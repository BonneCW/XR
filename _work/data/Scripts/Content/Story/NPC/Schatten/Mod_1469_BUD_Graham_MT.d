instance Mod_1469_BUD_Graham_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Graham";
	npctype =						npctype_main;
	guild =							GIL_out;      
	level =							4;
	
	
	voice =							36;
	id =							1469;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 2);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Fighter", 67,  1, VLK_ARMOR_M);

	Mdl_SetModelFatness (self, 0);
    	
    	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    
	B_SetFightSkills	(self, 20);

	//-------- inventory --------                                    
	CreateInvItems	(self, ItWrWorldmap, 1);
	CreateInvItems	(self, ItWrOCmap, 1);
	CreateInvItems	(self, ItWrNCmap, 1);
	CreateInvItems	(self, ItWrPSImap, 1);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1469;
};

FUNC VOID Rtn_start_1469 ()
{
	TA_Sleep		(22,30,06,00,"OCR_HUT_76");
	TA_Sit_Bench		(06,00,07,00,"OCR_OUTSIDE_HUT_76");	
	TA_Stand_Eating		(07,00,11,00,"OCR_OUSIDE_HUT_77_INSERT");
	TA_Wash_FP		(11,00,11,30,"OCR_LAKE_4");
	TA_Stand_Drinking	(11,30,12,00,"OCR_OUTSIDE_HUT_76");
	TA_Stand_ArmsCrossed	(12,00,18,00,"OCR_HUT_76");
	TA_Sit_Campfire		(18,00,22,30,"OCR_OUSIDE_HUT_77_INSERT");
};

FUNC VOID Rtn_AtGravo_1469 ()
{
	TA_Stand_Eating		(11,00,07,00,"OCR_OUTSIDE_HUT_4_INSERT");
	TA_Stand_Eating		(07,00,11,00,"OCR_OUTSIDE_HUT_4_INSERT");
};

FUNC VOID Rtn_Auftritt_1469 ()
{
	TA_Concert	(05,00,20,00,"OCR_IE_PYMONTE");
	TA_Concert	(20,00,05,00,"OCR_IE_PYMONTE");
};