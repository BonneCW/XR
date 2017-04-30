INSTANCE Mod_7612_PSINOV_Lester_REL (Npc_Default)
{
	name 		= "Lester";
	guild 		= GIL_OUT;
	id 		= 7612;
	voice 		= 13;
	flags           = 2;
	npctype		= NPCTYPE_FRIEND;

	B_SetAttributesToChapter (self, 6);																

	fight_tactic		= FAI_HUMAN_MASTER;	

	B_CreateAmbientInv 	(self);
	EquipItem (self,Streitschlichter);

	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_P_Lester, BodyTex_P, ITAR_LESTER);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	B_GiveNpcTalents (self);

	B_SetFightSkills (self, 30); 

	daily_routine 		= Rtn_Start_7612;
};

FUNC VOID Rtn_Start_7612()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"REL_006");
	TA_Stand_ArmsCrossed	(20,00,08,00,"REL_006");
};

FUNC VOID Rtn_Markt_7612()
{	
	TA_Sit_Bench	(08,00,20,00,"REL_CITY_111");
	TA_Sit_Bench	(20,00,08,00,"REL_CITY_111");
};

FUNC VOID Rtn_GuideToTroll_7612()
{	
	TA_Guide_Player	(08,00,20,00,"RELWIDNIS_21");
	TA_Guide_Player	(20,00,08,00,"RELWIDNIS_21");
};

FUNC VOID Rtn_GuideToMine_7612()
{	
	TA_Guide_Player	(08,00,20,00,"REL_SURFACE_206");
	TA_Guide_Player	(20,00,08,00,"REL_SURFACE_206");
};

FUNC VOID Rtn_GuideToMelvin_7612()
{	
	TA_Guide_Player	(08,00,20,00,"REL_SURFACE_045");
	TA_Guide_Player	(20,00,08,00,"REL_SURFACE_045");
};

FUNC VOID Rtn_GuideToVincent_7612()
{	
	TA_Guide_Player	(08,00,20,00,"REL_SURFACE_026");
	TA_Guide_Player	(20,00,08,00,"REL_SURFACE_026");
};

FUNC VOID Rtn_Tot_7612()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"TOT");
	TA_Stand_ArmsCrossed	(20,00,08,00,"TOT");
};