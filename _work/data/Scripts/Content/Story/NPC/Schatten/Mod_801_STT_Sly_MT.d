instance Mod_801_STT_Sly_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Sly";
	npctype 	=		NPCTYPE_FRIEND;
	guild 		=		GIL_OUT;
	level 		=		5;
	
	
	voice 		=		28;
	id 			=		801;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Sly, BodyTex_N, STT_ARMOR_H);	
	 
       	fight_tactic	=	FAI_HUMAN_STRONG;

	B_CreateAmbientInv	(self);

	//-------- Talente -------- 

	//-------- inventory --------
	B_SetFightSkills	(self, 40);
		
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_801;
};

FUNC VOID Rtn_Start_801 ()
{
	TA_Sleep		(00,00,07,00,"OCR_HUT_73");
	TA_Stand_Eating		(07,00,07,30,"OCR_OUTSIDE_HUT_73");
	TA_Smalltalk		(07,30,12,00,"OCR_OUTSIDE_HUT_73");	// mit ???
	TA_Sit_Campfire		(12,00,14,00,"OCR_OUTSIDE_HUT_77_MOVEMENT");
	TA_Watch_ArenaFight	(14,00,18,00,"OCR_AUDIENCE_01");
	TA_Sit_Campfire		(18,00,00,00,"OCR_OUTSIDE_HUT_77_MOVEMENT");
};

FUNC VOID Rtn_Training_801 ()
{
	TA_Sleep		(00,00,07,00,"OCR_HUT_73");
	TA_Stand_Drinking	(07,00,00,00,"OCR_OUTSIDE_HUT_65_MOVEMENT");
};

FUNC VOID Rtn_Training2_801 ()
{
	TA_RunToWP		(00,00,07,00,"OCR_GATE_SQUARE");
	TA_RunToWP		(07,00,00,00,"OCR_GATE_SQUARE");
};

FUNC VOID Rtn_Training3_801 ()
{
	TA_RunToWP		(00,00,07,00,"OCR_ARENABATTLE_OUTSIDE");
	TA_RunToWP		(07,00,00,00,"OCR_ARENABATTLE_OUTSIDE");
};

FUNC VOID Rtn_Training4_801 ()
{
	TA_RunToWP		(00,00,07,00,"OCR_OUTSIDE_HUT_65_MOVEMENT");
	TA_RunToWP		(07,00,00,00,"OCR_OUTSIDE_HUT_65_MOVEMENT");
};

FUNC VOID Rtn_AtArena_801 ()
{
	TA_Sleep		(00,00,07,00,"OCR_HUT_73");
	TA_Stand_Eating		(07,00,07,30,"OCR_OUTSIDE_HUT_73");
	TA_Smalltalk		(07,30,08,00,"OCR_OUTSIDE_HUT_73");	// mit ???
	TA_Sit_Campfire		(08,00,16,00,"OCR_ARENABATTLE_OUTSIDE");
	TA_Watch_ArenaFight	(16,00,18,00,"OCR_AUDIENCE_01");
	TA_Stand_Eating		(18,00,20,00,"OCR_OUTSIDE_HUT_73");
	TA_Stand_Drinking	(20,00,00,00,"OCR_ARENA_05");
};

FUNC VOID Rtn_ArenaFight_801 ()
{
	TA_Stand_WP	(20,00,08,00,"OCR_ARENABATTLE_TRAIN2");
	TA_Stand_WP	(08,00,20,00,"OCR_ARENABATTLE_TRAIN2");
};