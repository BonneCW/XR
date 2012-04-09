FUNC VOID TELEPORTTOUNDERGROUND ()
{
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue (hero);

	if (Npc_HasItems(hero, ItMi_TeleportStein) == 0)
	{
		AI_PrintScreen	("Teleportstein erhalten!", -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);

		CreateInvItems	(hero, ItMi_TeleportStein, 1);
	};

	AI_Teleport	(hero, "WP_PAT_UNTERGRUND_01");
};