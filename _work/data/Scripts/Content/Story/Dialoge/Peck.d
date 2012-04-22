INSTANCE Info_Mod_Peck_Hi (C_INFO)
{
	npc		= Mod_745_MIL_Peck_NW;
	nr		= 1;
	condition	= Info_Mod_Peck_Hi_Condition;
	information	= Info_Mod_Peck_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Peck_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Peck_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Peck_Hi_12_01"); //Ich bin Peck. Ich verkaufe den Milizen Rüstungen.
};

INSTANCE Info_Mod_Peck_Ruestung (C_INFO)
{
	npc		= Mod_745_MIL_Peck_NW;
	nr		= 1;
	condition	= Info_Mod_Peck_Ruestung_Condition;
	information	= Info_Mod_Peck_Ruestung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kann ich bei dir eine bessere Rüstung bekommen?";
};

FUNC INT Info_Mod_Peck_Ruestung_Condition()
{
	if ((Mod_Gilde == 1)
	|| (Mod_Gilde == 2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Peck_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Peck_Ruestung_Info()
{
	AI_Output(hero, self, "Info_Mod_Peck_Ruestung_15_00"); //Kann ich bei dir eine bessere Rüstung bekommen?

	if (Mod_HasMILH == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Peck_Ruestung_12_01"); //Ich hab hier eine Schwere Milizrüstung.
	};

	if (Kapitel > 1)
	&& (Mod_ErsteVerbesserung == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Peck_Ruestung_12_02"); //Ich hab gehört, dass beim Pass zum Minental ein Feuersnapper sein soll. Mit dessen Haut könnte ich deine Schwere Milizrüstung sicher ein wenig verbessern.
	
		Mod_ErsteVerbesserung = TRUE;
	
		Wld_InsertNpc	(Feuersnapper,	"NW_PASS_06");
	};

	if (Kapitel > 3)
	&& (Mod_ZweiteVerbesserung == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Peck_Ruestung_12_03"); //Ich hab gehört, dass beim Weg zur Ausgrabungsstätte der Wassermagier ein Feuerläufer sein soll. Mit dessen Fell könnte ich deine Ritterrüstung sicher ein wenig verbessern.
	
		Mod_ZweiteVerbesserung = TRUE;
	
		Wld_InsertNpc	(Feuerläufer,	"FP_MAGICGOLEM");
	};

	Info_ClearChoices	(Info_Mod_Peck_Ruestung);
	Info_AddChoice	(Info_Mod_Peck_Ruestung, DIALOG_BACK, Info_Mod_Peck_Ruestung_BACK);

	if (Mod_ErsteVerbesserung == TRUE)
	&& (Mod_Gilde == 1)
	{
		Info_AddChoice	(Info_Mod_Peck_Ruestung, "Schwere Milizrüstung verbessern", Info_Mod_Peck_Ruestung_MIL_S);
	};

	if (Mod_ZweiteVerbesserung == TRUE)
	&& (Mod_Gilde == 2)
	{
		Info_AddChoice	(Info_Mod_Peck_Ruestung, "Ritterrüstung verbessern", Info_Mod_Peck_Ruestung_RIT_S);
	};

	if (Mod_Gilde == 1)
	&& (Mod_HasMILH == FALSE)
	{
		Info_AddChoice	(Info_Mod_Peck_Ruestung, "Schwere Milizrüstung (Kosten: 2500)", Info_Mod_Peck_Ruestung_MIL_M);
	};
};

FUNC VOID Info_Mod_Peck_Ruestung_BACK ()
{
	Info_ClearChoices	(Info_Mod_Peck_Ruestung);
};

FUNC VOID Info_Mod_Peck_Ruestung_MIL_S ()
{
	AI_Output(hero, self, "Info_Mod_Peck_Ruestung_MIL_S_15_00"); //Verbessere meine schwere Milizrüstung.

	if (Npc_HasItems(hero, ItAt_FeuersnapperHaut) == 1)
	&& (Npc_HasItems(hero, ItAr_MIL_M) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Peck_Ruestung_MIL_S_12_01"); //Alles klar.

		Npc_RemoveInvItems	(hero, ItAt_FeuersnapperHaut, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_MIL_M, 1);

		CreateInvItems	(self, ItAr_MIL_S2, 1);

		B_GiveInvItems	(self, hero, ItAr_Mil_S2, 1);

		Mod_ErsteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_Mil_M) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Peck_Ruestung_MIL_S_12_02"); //Du musst schon eine schwere Milizrüstung haben, sonst kann ich sie dir nicht verbessern.
	}
	else if (Npc_HasItems(hero, ItAt_Feuersnapperhaut) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Peck_Ruestung_MIL_S_12_03"); //Wenn du nicht die Snapperhaut hast, kann ich deine Rüstung nicht verbessern.
	};

	Info_ClearChoices	(Info_Mod_Peck_Ruestung);
};

FUNC VOID Info_Mod_Peck_Ruestung_RIT_S ()
{
	AI_Output(hero, self, "Info_Mod_Peck_Ruestung_RIT_S_15_00"); //Verbessere meine Ritterrüstung.

	if (Npc_HasItems(hero, ItAt_FireShadowFur) == 1)
	&& (Npc_HasItems(hero, ItAr_PAL_M) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Peck_Ruestung_RIT_S_12_01"); //Alles klar.

		Npc_RemoveInvItems	(hero, ItAt_FireShadowFur, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_PAL_M, 1);

		CreateInvItems	(self, ItAr_RIT_S, 1);

		B_GiveInvItems	(self, hero, ItAr_RIT_S, 1);

		Mod_ZweiteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_PAL_M) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Peck_Ruestung_RIT_S_12_02"); //Du musst schon eine Ritterrüstung haben, sonst kann ich sie dir nicht verbessern.
	}
	else if (Npc_HasItems(hero, ItAt_FireShadowFur) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Peck_Ruestung_RIT_S_12_03"); //Wenn du nicht das Feuerläuferfell hast, kann ich deine Rüstung nicht verbessern.
	};

	Info_ClearChoices	(Info_Mod_Peck_Ruestung);
};

FUNC VOID Info_Mod_Peck_Ruestung_MIL_M ()
{
	AI_Output(hero, self, "Info_Mod_Peck_Ruestung_MIL_M_15_00"); //Ich nehme die schwere Milizrüstung.

	if (Npc_HasItems(hero, ItMi_Gold) >= 2500)
	{
		AI_Output(self, hero, "Info_Mod_Peck_Ruestung_MIL_M_12_01"); //Alles klar.

		B_GiveInvItems	(hero, self, ItMi_Gold, 2500);

		CreateInvItems	(self, ItAr_MIL_M, 1);

		B_GiveInvItems	(self, hero, ItAr_Mil_M, 1);

		Mod_HasMILH = TRUE;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Peck_Ruestung_MIL_M_12_02"); //Ohne Gold keine Rüstung.
	};

	Info_ClearChoices	(Info_Mod_Peck_Ruestung);
};

INSTANCE Info_Mod_Peck_Pickpocket (C_INFO)
{
	npc		= Mod_745_MIL_Peck_NW;
	nr		= 1;
	condition	= Info_Mod_Peck_Pickpocket_Condition;
	information	= Info_Mod_Peck_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Peck_Pickpocket_Condition()
{
	C_Beklauen	(60, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Peck_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Peck_Pickpocket);

	Info_AddChoice	(Info_Mod_Peck_Pickpocket, DIALOG_BACK, Info_Mod_Peck_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Peck_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Peck_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Peck_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Peck_Pickpocket);
};

FUNC VOID Info_Mod_Peck_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Peck_Pickpocket);
};

INSTANCE Info_Mod_Peck_EXIT (C_INFO)
{
	npc		= Mod_745_MIL_Peck_NW;
	nr		= 1;
	condition	= Info_Mod_Peck_EXIT_Condition;
	information	= Info_Mod_Peck_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Peck_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Peck_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};