INSTANCE Mod_7594_OUT_Petunia_TUG (Npc_Default)
{
	name 		= "Petunia";
	guild 		= GIL_OUT;
	id 		= 7594;
	voice 		= 16;
	flags           = 0;
	npctype		= NPCTYPE_MAIN;

	aivar[AIV_Partymember] = TRUE;

	B_SetAttributesToChapter (self, 1);
	fight_tactic		= FAI_HUMAN_STRONG;

	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", 139, BodyTexBabe_N, ITAR_Buergerinkleid8);
	Mdl_SetModelFatness	(self,0);

	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 40);

	daily_routine 		= Rtn_Start_7594;
};

FUNC VOID Rtn_Start_7594 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"TUG_87");
	TA_Stand_ArmsCrossed	(22,00,08,00,"TUG_87");
};

FUNC VOID Rtn_Magierin_7594 ()
{	
	TA_Sit_Chair	(08,00,22,00,"TUG_46");
	TA_Sleep	(22,00,08,00,"TUG_53");
};

FUNC VOID Rtn_Gefangen_7594 ()
{	
	TA_Sleep	(08,00,22,00,"TUG_58");
	TA_Sleep	(22,00,08,00,"TUG_58");
};

FUNC VOID Rtn_Tot_7594 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"TOT");
	TA_Stand_ArmsCrossed	(22,00,08,00,"TOT");
};