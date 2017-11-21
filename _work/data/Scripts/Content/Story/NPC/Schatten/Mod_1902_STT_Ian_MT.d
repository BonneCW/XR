instance Mod_1902_STT_Ian_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Ian";
	npctype 	=	  	NPCTYPE_MAIN;
	guild 		=		GIL_OUT;
	level 		=		13;
	flags 		=		0;
	
	voice		= 0;
	id 			=		1902;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 4);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 2,"Hum_Head_Pony",  14,  1, STT_ARMOR_H);

    	
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	B_SetFightSkills	(self, 60);		
	
	//-------- inventory --------
	EquipItem	(self, ItMw_1H_Sword_03);

	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1902;

	
};

FUNC VOID Rtn_start_1902 ()
{
	TA_Sleep		(23,00,03,00,"OCR_HUT_1");
	TA_Sit_Bench		(03,00,05,30,"OCR_HUT_Z5_SIT3");
	TA_Sleep		(05,30,07,00,"OCR_CAULDRON_1");
	TA_Sit_Bench		(07,00,10,00,"OCR_CAULDRON_1");
	TA_Smalltalk		(10,00,12,00,"OCR_CAMPFIRE_A_MOVEMENT1"); //mit Grim
	TA_Stand_Drinking	(12,00,23,00,"OCR_CAMPFIRE_A_MOVEMENT1");	
};

FUNC VOID Rtn_KillMission_1902 ()
{
	TA_Sleep		(23,00,03,00,"OCR_HUT_1");
	TA_Sit_Bench		(03,00,05,30,"OCR_HUT_Z5_SIT3");
	TA_Sleep		(05,30,07,00,"OCR_CAULDRON_1");
	TA_Sit_Bench		(07,00,10,00,"OCR_CAULDRON_1");
	TA_Smalltalk		(10,00,12,00,"OCR_CAMPFIRE_A_MOVEMENT1"); //mit Grim
	TA_Stand_Drinking	(12,00,23,00,"OCR_SMALLTALK_A_OC_ARENA");	
};

FUNC VOID Rtn_TalkWith_1902 ()
{
	TA_Smalltalk		(20,00,08,30,"OCR_OUTSIDE_HUT_2");
	TA_Smalltalk		(08,30,20,00,"OCR_OUTSIDE_HUT_2");	
};