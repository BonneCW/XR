instance Mod_803_STT_Mud_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Mud";
	npctype =						npctype_main;
	guild =							GIL_OUT;      
	level =							0;
	
	
	voice		= 0;
	id =							803;
	flags = 2;


	//-------- abilities --------

	B_SetAttributesToChapter	(self, 2);
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				69hairmesh,	face-tex,	hair-tex,	skin	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Mud, BodyTex_N, VLK_ARMOR_L);	
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Senses --------                                    
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;// für DIREKTES ansprechen

	B_SetFightSkills	(self, 20);
	
	//-------- inventory --------                                    

	
	daily_routine = Rtn_start_803;
};

FUNC VOID Rtn_Start_803 ()
{
	TA_Sleep	(23,00,06,00,"OCR_HUT_13");
	TA_Sit_Bench	(06,00,23,00,"OCR_OUTSIDE_HUT_13");
};

func void Rtn_Follow_803 ()
{
	TA_Follow_Player	(23,00,16,00,"OCR_HUT_13");
	TA_Follow_Player	(16,00,23,00,"OCR_HUT_13");
};

func void Rtn_OrkHoehle_803 ()
{
	TA_RunToWP	(23,00,16,00,"SPAWN_OW_SNAPPER_WOOD05_05");
	TA_RunToWP	(16,00,23,00,"SPAWN_OW_SNAPPER_WOOD05_05");
};

func void Rtn_OrkAlarm_803 ()
{
	TA_FleeToWP	(23,00,16,00,"OCR_HUT_13");
	TA_FleeToWP	(16,00,23,00,"OCR_HUT_13");
};

FUNC VOID Rtn_AtVMG_803 ()
{
	TA_Stand_ArmsCrossed		(23,00,06,00,"OW_PATH_175");
	TA_Stand_ArmsCrossed		(23,00,06,00,"OW_PATH_175");
};

FUNC VOID Rtn_Shadow_803 ()
{
	TA_RunToWP		(23,00,06,00,"SPAWN_OW_WOLF_04_PSI5");
	TA_RunToWP		(23,00,06,00,"SPAWN_OW_WOLF_04_PSI5");
};

FUNC VOID Rtn_Scav_803 ()
{
	TA_RunToWP		(23,00,06,00,"OC_ROUND_5");
	TA_RunToWP		(23,00,06,00,"OC_ROUND_5");
};

FUNC VOID Rtn_Trade_803 ()
{
	TA_RunToWP		(23,00,06,00,"WP_INTRO_WI06");
	TA_RunToWP		(23,00,06,00,"WP_INTRO_WI06");
};

FUNC VOID Rtn_Safety_803 ()
{
	TA_Sit_Bench		(23,00,06,00,"TOT");
	TA_Sit_Bench		(23,00,06,00,"TOT");
};

FUNC VOID Rtn_AtGravo_803 ()
{
	TA_Stand_Eating		(11,00,07,00,"OCR_OUTSIDE_HUT_4_INSERT");
	TA_Stand_Eating		(07,00,11,00,"OCR_OUTSIDE_HUT_4_INSERT");
};

FUNC VOID Rtn_Auftritt_803 ()
{
	TA_Concert	(05,00,20,00,"OCR_IE_UNICORN");
	TA_Concert	(20,00,05,00,"OCR_IE_UNICORN");
};