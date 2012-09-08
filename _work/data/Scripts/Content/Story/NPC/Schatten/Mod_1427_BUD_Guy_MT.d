instance Mod_1427_BUD_Guy_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Guy";
	npctype =						npctype_main;
	guild =							GIL_out;      
	level =							2;
	
	
	voice =							24;
	id =							1427;


	//-------- abilities --------              
                                                   
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Psionic", 72,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
    	
    	
	fight_tactic	=	FAI_HUMAN_COWARD; 
  
	//-------- Talents --------               
        B_SetAttributesToChapter	(self, 10);
	//-------- inventory --------             
        B_CreateAmbientInv	(self);                                          
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1427;
};

FUNC VOID Rtn_start_1427 ()
{
	TA_Sleep	(23,00,07,00,"OCR_HUT_25");
	TA_Sit_Bench	(07,00,08,00,"OCR_OUTSIDE_HUT_25");
	TA_Smalltalk	(08,00,17,00,"OCR_OUTSIDE_HUT_27"); //mit Stt 306
	TA_Sit_Bench	(17,00,19,05,"OCR_OUTSIDE_ARENA_BENCH_2");
	TA_Stand_WP	(19,05,23,00,"OCR_ARENA_07");
};

FUNC VOID Rtn_AtGravo_1427 ()
{
	TA_Stand_Eating		(11,00,07,00,"OCR_OUTSIDE_HUT_4_INSERT");
	TA_Stand_Eating		(07,00,11,00,"OCR_OUTSIDE_HUT_4_INSERT");
};

FUNC VOID Rtn_Auftritt_1427 ()
{
	TA_Concert	(05,00,20,00,"OCR_IE_THOMAS");
	TA_Concert	(20,00,05,00,"OCR_IE_THOMAS");
};