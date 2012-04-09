// ************
// B_AssessWarn
// ************

func void B_AssessWarn ()
{
	// EXIT IF...

	B_Vergiftet (self);

	if (Wld_IsTime(21,00,05,00))
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero))
	{
		if (!HeroAtLight)
		{
			HeroAtLight = 1 + C_HeroAtLight(); // sekündlich checken, ob Held in der Nähe einer Lampe ist
		};

		if (HeroAtLight == 1)
		{
			if (Npc_GetWalkMode(hero) == NPC_SNEAK)
			{
				if (Npc_GetDistToNpc(self, hero) > 200)
				{
					return;
				};
			}
			else if (Npc_GetWalkMode(hero) == NPC_WALK)
			{
				if (Npc_GetDistToNpc(self, hero) > 300)
				{
					return;
				};
			}
			else
			{
				if (Npc_GetDistToNpc(self, hero) > 400)
				{
					return;
				};
			};
		};
	};
	
	// ------ wenn ich selber das Opfer bin -----
	if (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(self))
	{
		return;
	};
	
	if (Npc_IsInState(self, ZS_ReactToWeapon))
	|| (Npc_IsInState(self, ZS_ObservePlayer))
	{
		return;
	};
	
	// ------ warns von Monstern oder Orks werden ignoriert ------
	if (other.guild > GIL_SEPERATOR_HUM)
	{
		return;
	};
	
	// ------ Torwachen bleiben stehen ------
	if (C_NpcIsGateGuard(self))
	{
		return;
	};
	

	// FUNC

	Npc_ClearAIQueue 	(self);
	B_ClearPerceptions	(self);
	AI_StartState 		(self, ZS_ObservePlayer, 0, "");
	return;
};
