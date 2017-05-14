INSTANCE Mod_7268_PSINOV_Lester_MT (Npc_Default)
{
	name 		= "Lester";
	guild 		= GIL_OUT;
	id 		= 7268;
	voice		= 0;
	flags           = 0;
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

	daily_routine 		= Rtn_PreStart_7268;
};

FUNC VOID Rtn_PreStart_7268()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"PSI_START");
	TA_Stand_ArmsCrossed	(20,00,08,00,"PSI_START");
};

FUNC VOID Rtn_Start_7268()
{	
	TA_Smalltalk	(08,00,	23,00,"PSI_GUARD_TREE_EX");    
	TA_Smalltalk	(23,00,	08,00,"PSI_GUARD_TREE_EX");
};

FUNC VOID Rtn_Tot_7268()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"TOT");
	TA_Stand_ArmsCrossed	(20,00,08,00,"TOT");
};