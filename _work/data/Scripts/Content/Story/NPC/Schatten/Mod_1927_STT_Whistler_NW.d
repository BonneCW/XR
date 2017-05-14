instance Mod_1927_STT_Whistler_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Whistler";
	npctype 		=		NPCTYPE_main;
	guild 		=		GIL_out;
	level 		=		5;
	
	
	voice		= 0;
	id 			=		1927;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	20;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX]	=	100;
	attribute[ATR_HITPOINTS] 		=	100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     57,headtex,teethtex,ruestung
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", FACE_N_Whistler, BodyTex_N, STT_ARMOR_M);
	
	Mdl_SetModelFatness(self,0);
    	
    	
	fight_tactic	=	FAI_HUMAN_STRONG; 

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self, Whistlers_Schwert);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_309;

	// //MISSION[0] = Mis_1_OC_Whistler_StealAxe;
};

FUNC VOID Rtn_start_1927 ()
{
	TA_Stand_Guarding		(23,30,08,00,"NW_CITY_TO_FOREST_03");
	TA_Stand_Guarding	(08,00,13,00,"NW_CITY_TO_FOREST_03");
};

FUNC VOID Rtn_Stadt_1927()
{
	TA_Stand_WP	(08,00,20,00,"NW_CITY_MERCHANT_PATH_32");
	TA_Stand_WP	(20,00,08,00,"NW_CITY_MERCHANT_PATH_32");
};

FUNC VOID Rtn_Puff_1927()
{
	TA_Stand_WP	(05,00,10,00,"NW_CITY_HABOUR_PUFF_IN_01");
	TA_Stand_WP	(10,00,05,00,"NW_CITY_MERCHANT_PATH_32");
};

FUNC VOID Rtn_NachtImPuff_1927()
{
	TA_Stand_WP	(21,00,05,00,"NW_CITY_HABOUR_PUFF_IN_01");
	TA_Stand_WP	(05,00,21,00,"NW_CITY_MERCHANT_PATH_32");
};

FUNC VOID Rtn_AtLagerhaus_1927()
{
	TA_Stand_WP	(08,00,20,00,"NW_CITY_HABOUR_KASERN_01");
	TA_Stand_WP	(20,00,08,00,"NW_CITY_HABOUR_KASERN_01");
};

FUNC VOID Rtn_Tot_1927 ()
{
	TA_Sleep		(23,30,08,00,"TOT");
	TA_Sleep	(08,00,13,00,"TOT");
	TA_Sleep	(13,00,23,30,"TOT");
};