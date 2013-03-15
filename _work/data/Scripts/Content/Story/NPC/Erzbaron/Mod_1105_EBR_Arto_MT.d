instance Mod_1105_EBR_Arto_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Arto";
	npctype 	= 	npctype_main;
   	guild 		=	GIL_OUT;
	level 		=	80;
	voice 		=	32;
	id 			=	1105;
	flags = 2;
	
	//-------- abilities --------
	B_SetAttributesToChapter (self, 5);	

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", FACE_N_Important_Arto, BodyTex_N, EBR_ARMOR_H2);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente --------  																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 70);
			
	//-------- inventory --------                                    
	EquipItem(self,Artos_Schwert);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1105;
};

FUNC VOID Rtn_start_1105 ()
{
	TA_Sleep			(00,50,07,35,"OCC_BARONS_UPPER_RIGHT_ROOM_BED2");
	TA_Smalltalk		(07,35,21,10,"OCC_BARONS_GREATHALL_CENTER_LEFT");
	TA_Stand_WP		(21,10,00,50,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT4");
};

FUNC VOID Rtn_WayToNL_1105 ()
{
	TA_Guide_Player		(07,35,21,10,"OW_PATH_063");
	TA_Guide_Player		(21,10,07,35,"OW_PATH_063");
};

FUNC VOID Rtn_WayToOrik_1105 ()
{
	TA_Guide_Player		(07,35,21,10,"NC_PATH62");
	TA_Guide_Player		(21,10,07,35,"NC_PATH62");
};

FUNC VOID Rtn_WaitForOrik_1105 ()
{
	TA_Stand_WP		(07,35,21,10,"NC_PATH62");
	TA_Stand_WP		(21,10,07,35,"NC_PATH62");
};

FUNC VOID Rtn_AttackOrik_1105 ()
{
	TA_Stand_WP		(07,35,21,10,"NC_ENTRANCE_WP01");
	TA_Stand_WP		(21,10,07,35,"NC_ENTRANCE_WP01");
};

FUNC VOID Rtn_WayToAL_1105 ()
{
	TA_Guide_Player		(07,35,21,10,"OCC_BARONS_DANCE2");
	TA_Guide_Player		(21,10,07,35,"OCC_BARONS_DANCE2");
};

FUNC VOID Rtn_Kastell_1105 ()
{
	TA_Stand_ArmsCrossed		(07,35,21,10,"CASTLE_02");
	TA_Stand_ArmsCrossed		(21,10,07,35,"CASTLE_02");
};

FUNC VOID Rtn_ToCavalorn_1105 ()
{
	TA_Guide_Player		(07,35,21,10,"OW_SAWHUT_GREENGOBBO_SPAWN");
	TA_Guide_Player		(21,10,07,35,"OW_SAWHUT_GREENGOBBO_SPAWN");
};

FUNC VOID Rtn_AtCavalorn_1105 ()
{
	TA_Sit_Bench		(07,35,21,10,"OW_SAWHUT_GREENGOBBO_SPAWN");
	TA_Sit_Bench		(21,10,07,35,"OW_SAWHUT_GREENGOBBO_SPAWN");
};