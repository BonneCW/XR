// ********************************************
//	B_ENDPRODUCTIONDIALOG	
//	------------------------
//	Invincible Flag muss nach jedem Dialog- Vorgang
//	wieder hart auf FALSE gestezt werden
// ********************************************
FUNC VOID  B_ENDPRODUCTIONDIALOG ()
{
	AI_StopProcessInfos(self);		
 	Wld_StopEffect("DEMENTOR_FX");

	Wld_StopEffect("SLOW_MOTION_6");

	self.aivar[AIV_INVINCIBLE]= FALSE;
	
	if (PLAYER_MOBSI_PRODUCTION == Mobsi_Fokus1)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Troll, 1);
	}
	else if (PLAYER_MOBSI_PRODUCTION == Mobsi_Fokus2)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Meer, 1);
	}
	else if (PLAYER_MOBSI_PRODUCTION == Mobsi_Fokus3)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Stonehenge, 1);
	}
	else if (PLAYER_MOBSI_PRODUCTION == Mobsi_Fokus4)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Kloster, 1);
	}
	else if (PLAYER_MOBSI_PRODUCTION == Mobsi_Fokus5)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Bergfestung, 1);
	};

	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};
