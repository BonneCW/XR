// ***************
// B_AssessBody
// ***************

func void B_AssessBody()
{
	// EXIT IF...

	B_Vergiftet (self);
	
	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_7106_ASS_Ramsi_NW))
		{
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7106_ASS_Ramsi_NW))
		&& (Npc_HasItems(other, ItFo_MuttonRaw) == 0)
		{
			return;
		};
	};

	if (Npc_IsInState(other, ZS_Unconscious))
	{
		return;
	};
	
	// ------- Monster sollen sich zu Tode stürzen, etc. ------
	if (Npc_GetHeightToNpc(self, other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	
	// ------ Wurde schon geplündert ------
	if (B_GetAivar(other, AIV_RANSACKED) == TRUE)
	{
		return;
	};
	
	// ------ Ich will nicht plündern ------
	if (!C_NpcRansacksAlways(self))
	{
		return;
	};
	
	// ------ ich bin im ZS_Attack ------
	if (Npc_IsInState (self, ZS_Attack))
	{
		var C_NPC stoerenfried; stoerenfried = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
		
		if (Npc_GetDistToNpc(stoerenfried, other) <= (FIGHT_DIST_MONSTER_ATTACKRANGE)) //other ist hier = BODY
		{
			return; 		//erst FUNC ausführen (zum Body gehen) wenn Gegner weit genug von Body weg
		};
	};
	
	// FUNC
	
	Npc_ClearAIQueue	(self);
	B_ClearPerceptions	(self);
	AI_StartState 		(self, ZS_GetMeat, 0, "");
	return;
};
