FUNC VOID OpferschaleDT_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_OpferschaleDT;
		Ai_ProcessInfos (her);
	};
};

INSTANCE PC_OpferschaleDT_Schutzzauber (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_OpferschaleDT_Schutzzauber_Condition;
	information	= PC_OpferschaleDT_Schutzzauber_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schutzzauber erlangen";
};

FUNC INT PC_OpferschaleDT_Schutzzauber_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_OpferschaleDT)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 2)
	&& (Npc_HasItems(hero, ItAt_Sting) >= 1)
	&& (Npc_HasItems(hero, ItPo_Speed) >= 1)
	&& (Npc_HasItems(hero, ItMi_Erzbrocken_Seltsam) >= 1)
	{
		return 1;
	};
};

FUNC VOID PC_OpferschaleDT_Schutzzauber_Info()
{
	Npc_RemoveInvItems	(hero, ItAt_SkeletonBone, 2);
	Npc_RemoveInvItems	(hero, ItAt_Sting, 1);
	Npc_RemoveInvItems	(hero, ItPo_Speed, 1);
	Npc_RemoveInvItems	(hero, ItMi_Erzbrocken_Seltsam, 1);

	B_GivePlayerXP	(150);

	Mod_7554_OUT_Khorgor_DT.attribute[ATR_HITPOINTS_MAX] -= Mod_7554_OUT_Khorgor_DT.attribute[ATR_HITPOINTS_MAX]/4;
	Mod_7554_OUT_Khorgor_DT.attribute[ATR_HITPOINTS] = Mod_7554_OUT_Khorgor_DT.attribute[ATR_HITPOINTS_MAX];

	Wld_PlayEffect	("spellFX_HealShrine", hero, hero, 0, 0, 0, FALSE);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_OpferschaleDT_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_OpferschaleDT_EXIT_Condition;
	information	= PC_OpferschaleDT_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_OpferschaleDT_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_OpferschaleDT)
	{
		return 1;
	};
};

FUNC VOID PC_OpferschaleDT_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};