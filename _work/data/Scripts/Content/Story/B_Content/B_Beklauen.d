FUNC INT C_Beklauen (var int TheftDex, var int TheftItem, var int TheftGold)
{
	var int bonusdex;
	bonusdex = 0;

	if (Mod_BlickfangAmulett)
	{
		bonusdex = 25;
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == TRUE) 
	&& (B_GetAivar(self, AIV_PlayerHasPickedMyPocket) == FALSE)
	&& (other.attribute[ATR_DEXTERITY] + bonusdex >= (TheftDex - Theftdiff))
	{
		if (Npc_IsInState (self, ZS_Talk))
		{
			TheftDexGlob = TheftDex;
		
			TheftItemGlob = TheftItem;

			TheftGoldGlob = TheftGold;
		};

		return TRUE;
	};

	return FALSE;
};	
	
FUNC INT B_Beklauen ()
{	
	var int bonusdex;
	bonusdex = 0;

	if (Mod_BlickfangAmulett)
	{
		bonusdex = 25;
	};

	bonusdex += 10 - r_max(20);

	if (other.attribute[ATR_DEXTERITY] + bonusdex >= TheftDexGlob) // Diebstahl gelingt
	{
		B_GiveInvItems (self, other, TheftItemGlob, TheftGoldGlob);

		B_SetAivar(self, AIV_PlayerHasPickedMyPocket, TRUE);

		B_GiveThiefXP();//B_GivePlayerXP (XP_Ambient);

		Snd_Play ("Geldbeutel");

		B_Göttergefallen(3, 1);

		Mod_CountTaschendiebstahl += 1;

		return TRUE;
	}
	else
	{
		B_ResetThiefLevel();

		var oCInfo inf;
		//inf = MEM_InformationMan.Info;
		inf = MEM_PtrToInst(MEM_InformationMan.Info);
		inf.told = FALSE;

		return FALSE;
	};
};	
