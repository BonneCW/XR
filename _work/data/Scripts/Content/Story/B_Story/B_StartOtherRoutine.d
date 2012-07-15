//**************************************************************************
//	B_StartOtherRoutine
//**************************************************************************

FUNC VOID B_StartOtherRoutine (var C_npc slf, var string newRoutine)
{
	if (!Hlp_IsValidNpc(slf))
	{
		return;
	};

	AI_StandUp (slf);

	if (!Npc_IsInState(slf, ZS_Talk))
	&& (Npc_IsInState(slf, ZS_Follow_Player))
	{
		Npc_ClearAIQueue	(slf);
	};

	if (Hlp_GetInstanceID(self)	!=	Hlp_GetInstanceID(slf)	)
	{
		if ((Hlp_IsValidNpc (slf))
		&& (!Npc_IsDead (slf)))
		{
			Npc_ExchangeRoutine  (slf, newRoutine);
			AI_ContinueRoutine (slf);
		};	
	}
	else
	{
		Npc_ExchangeRoutine  (slf, newRoutine);	//Joly: zur Sicherheit!
	};

	Npc_ExchangeRoutine  (slf, newRoutine);
};
