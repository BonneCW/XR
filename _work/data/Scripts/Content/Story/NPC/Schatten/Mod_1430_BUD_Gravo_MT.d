instance Mod_1430_BUD_Gravo_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Gravo";
	npctype =						npctype_main;
	guild =							GIL_out;      
	level =							4;
	
	
	voice		= 0;
	id =							1430;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Psionic", 0,  1, VLK_ARMOR_M);

	Mdl_SetModelFatness (self, 0);
    	
    	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    
	B_SetFightSkills	(self, 14);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_1430;
};

FUNC VOID Rtn_PreStart_1430 ()
{
	TA_Schatzsuche		(11,00,15,00,"OCR_OUTSIDE_HUT_4_INSERT");
	TA_Schatzsuche		(15,00,11,00,"OCR_OUTSIDE_HUT_4_INSERT");
};

FUNC VOID Rtn_start_1430 ()
{
	TA_Sleep		(22,30,06,00,"OCR_HUT_4");
	TA_Sit_Campfire		(06,00,11,00,"OCR_AUDIENCE_01");
	TA_Cook_Pan		(11,00,15,00,"OCR_OUTSIDE_HUT_4_INSERT");
	TA_Sit_Campfire		(15,00,17,00,"OCR_OUTSIDE_HUT_4_INSERT");
	TA_Sit_Bench		(17,00,22,30,"OCR_AUDIENCE_01");
};

FUNC VOID Rtn_Auftritt_1430 ()
{
	TA_Concert	(05,00,20,00,"OCR_IE_FLAIL");
	TA_Concert	(20,00,05,00,"OCR_IE_FLAIL");
};