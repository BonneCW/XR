// ***********
// C_NpcIsDown
// ***********

func int C_NpcIsDown(var C_NPC slf)
{
	if (!Hlp_IsValidNpc(slf))
	{
		return TRUE;
	};

	if (Npc_IsInState	(slf, ZS_Unconscious)
	||	Npc_IsInState	(slf, ZS_MagicSleep)
	||	Npc_IsInState	(slf, ZS_Knockout)
	||	Npc_IsInState	(slf, ZS_Drained)
	||	Npc_IsDead   	(slf)					)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};
