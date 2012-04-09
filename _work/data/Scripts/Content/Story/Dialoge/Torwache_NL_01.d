INSTANCE Info_Mod_Torwache_NL_01_GardistenInfos (C_INFO)
{
	npc		= Mod_1318_SLD_Organisator_MT;
	nr		= 1;
	condition	= Info_Mod_Torwache_NL_01_GardistenInfos_Condition;
	information	= Info_Mod_Torwache_NL_01_GardistenInfos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Torwache_NL_01_GardistenInfos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_NochEinAuftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Torgan_GardistenZettel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torwache_NL_01_GardistenInfos_Info()
{
	AI_Output(hero, self, "Info_Mod_Torwache_NL_01_GardistenInfos_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Torwache_NL_01_GardistenInfos_06_01"); //Ja?
	AI_Output(hero, self, "Info_Mod_Torwache_NL_01_GardistenInfos_15_02"); //Eine Frage: Habt ihr in den letzten Tagen Fremde hier gesehen? Vielleicht Gardisten?
	AI_Output(self, hero, "Info_Mod_Torwache_NL_01_GardistenInfos_06_03"); //Gardisten? Hier? Es wird sich wohl kaum einer hierher trauen.
	AI_Output(hero, self, "Info_Mod_Torwache_NL_01_GardistenInfos_15_04"); //Bist du dir sicher, dass hier nichts gewesen ist?
	AI_Output(self, hero, "Info_Mod_Torwache_NL_01_GardistenInfos_06_05"); //Hm, lass mich noch einmal überlegen. Doch, da fällt mir ein, dass uns vorletzte Nacht ein paar Unbekannte beschossen haben.
	AI_Output(self, hero, "Info_Mod_Torwache_NL_01_GardistenInfos_06_06"); //Ein Pfeil hat einen unserer Söldner verletzt. Lee ist beinahe ausgerastet vor Wut. Ich war aber nicht dabei, daher weiss ich nicht mehr.
	AI_Output(self, hero, "Info_Mod_Torwache_NL_01_GardistenInfos_06_07"); //Geh einfach mal in die Taverne auf der Insel, er wird da bestimmt sitzen und ein paar Krüge heben. Geh ruhig rein.
	AI_Output(hero, self, "Info_Mod_Torwache_NL_01_GardistenInfos_15_08"); //Danke, ich werd ihn dann mal suchen gehen.
	AI_Output(self, hero, "Info_Mod_Torwache_NL_01_GardistenInfos_06_09"); //Hast du vielleicht was zu trinken bei dir? Ich bin hier schon seit Stunden kurz vorm verdursten.

	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Die Torwache vom neuen Lager weiß nichts, aber ein anderer Söldner, der sich zur Zeit in der Taverne aufhält, wurde vor ein paar Nächten angeschossen. Ich sollte ihn aufsuchen, vielleicht weiß er was.");

	Info_ClearChoices	(Info_Mod_Torwache_NL_01_GardistenInfos);
	
	Info_AddChoice	(Info_Mod_Torwache_NL_01_GardistenInfos, "Tut mir leid, ich habe nichts dabei.", Info_Mod_Torwache_NL_01_GardistenInfos_B);
	if (Npc_HasItems(hero, ItFo_Wine) > 0)
	|| (Npc_HasItems(hero, ItFo_Water) > 0)
	|| (Npc_HasItems(hero, ItFo_Booze) > 0)
	|| (Npc_HasItems(hero, ItFo_Beer) > 0)
	{
		Info_AddChoice	(Info_Mod_Torwache_NL_01_GardistenInfos, "Klar, hier nimm ...", Info_Mod_Torwache_NL_01_GardistenInfos_A);
	};
};

FUNC VOID Info_Mod_Torwache_NL_01_GardistenInfos_B()
{
	AI_Output(hero, self, "Info_Mod_Torwache_NL_01_GardistenInfos_B_15_00"); //Tut mir leid, ich habe nichts dabei.
	AI_Output(self, hero, "Info_Mod_Torwache_NL_01_GardistenInfos_B_06_01"); //Ach verdammt. Na dann viel Erfolg.

	Info_ClearChoices	(Info_Mod_Torwache_NL_01_GardistenInfos);
};

FUNC VOID Info_Mod_Torwache_NL_01_GardistenInfos_G()
{
	AI_Output(self, hero, "Info_Mod_Torwache_NL_01_GardistenInfos_G_06_00"); //Danke, Mann. Er heiß tübrigens Nodrak. Wenn er ein paar Bier getrunken hat, ist er eigentlich immer ein wenig redselig.

	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Der Name des Söldners ist Nodrak. Wenn er was zu trinken bekommt, spricht er lieber.");
};

FUNC VOID Info_Mod_Torwache_NL_01_GardistenInfos_A()
{
	AI_Output(hero, self, "Info_Mod_Torwache_NL_01_GardistenInfos_A_15_00"); //Klar, hier nimm ...

	Info_ClearChoices	(Info_Mod_Torwache_NL_01_GardistenInfos);

	if (Npc_HasItems(hero, ItFo_Wine) > 0)
	{
		Info_AddChoice	(Info_Mod_Torwache_NL_01_GardistenInfos, "... einen Wein.", Info_Mod_Torwache_NL_01_GardistenInfos_F);
	};
	if (Npc_HasItems(hero, ItFo_Water) > 0)
	{
		Info_AddChoice	(Info_Mod_Torwache_NL_01_GardistenInfos, "... ein Wasser.", Info_Mod_Torwache_NL_01_GardistenInfos_E);
	};
	if (Npc_HasItems(hero, ItFo_Booze) > 0)
	{
		Info_AddChoice	(Info_Mod_Torwache_NL_01_GardistenInfos, "... einen Wacholder.", Info_Mod_Torwache_NL_01_GardistenInfos_D);
	};
	if (Npc_HasItems(hero, ItFo_Beer) > 0)
	{
		Info_AddChoice	(Info_Mod_Torwache_NL_01_GardistenInfos, "... ein Bier.", Info_Mod_Torwache_NL_01_GardistenInfos_C);
	};
};

FUNC VOID Info_Mod_Torwache_NL_01_GardistenInfos_F()
{
	AI_Output(hero, self, "Info_Mod_Torwache_NL_01_GardistenInfos_F_15_00"); //... einen Wein.

	B_GiveInvItems	(hero, self, ItFo_Wine, 1);
	B_UseItem	(self, ItFo_Wine);

	Info_ClearChoices	(Info_Mod_Torwache_NL_01_GardistenInfos);

	Info_Mod_Torwache_NL_01_GardistenInfos_G();
};

FUNC VOID Info_Mod_Torwache_NL_01_GardistenInfos_E()
{
	AI_Output(hero, self, "Info_Mod_Torwache_NL_01_GardistenInfos_E_15_00"); //... ein Wasser.

	B_GiveInvItems	(hero, self, ItFo_Water, 1);
	B_UseItem	(self, ItFo_Water);

	Info_ClearChoices	(Info_Mod_Torwache_NL_01_GardistenInfos);

	Info_Mod_Torwache_NL_01_GardistenInfos_G();
};

FUNC VOID Info_Mod_Torwache_NL_01_GardistenInfos_D()
{
	AI_Output(hero, self, "Info_Mod_Torwache_NL_01_GardistenInfos_D_15_00"); //... einen Wacholder.

	B_GiveInvItems	(hero, self, ItFo_Booze, 1);
	B_UseItem	(self, ItFo_Booze);

	Info_ClearChoices	(Info_Mod_Torwache_NL_01_GardistenInfos);

	Info_Mod_Torwache_NL_01_GardistenInfos_G();
};

FUNC VOID Info_Mod_Torwache_NL_01_GardistenInfos_C()
{
	AI_Output(hero, self, "Info_Mod_Torwache_NL_01_GardistenInfos_C_15_00"); //... ein Bier.

	B_GiveInvItems	(hero, self, ItFo_Beer, 1);
	B_UseItem	(self, ItFo_Beer);

	Info_ClearChoices	(Info_Mod_Torwache_NL_01_GardistenInfos);

	Info_Mod_Torwache_NL_01_GardistenInfos_G();
};

INSTANCE Info_Mod_Torwache_NL_01_Hi (C_INFO)
{
	npc		= Mod_1318_SLD_Organisator_MT;
	nr		= 1;
	condition	= Info_Mod_Torwache_NL_01_Hi_Condition;
	information	= Info_Mod_Torwache_NL_01_Hi_Info;
	permanent	= 1;
	important	= 0;
	description	= "Gibts was neues?";
};

FUNC INT Info_Mod_Torwache_NL_01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Torwache_NL_01_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Torwache_NL_01_Hi_15_00"); //Gibts was neues?
	AI_Output(self, hero, "Info_Mod_Torwache_NL_01_Hi_06_01"); //Nein, in letzter Zeit ist alles ruhig.
};

INSTANCE Info_Mod_Torwache_NL_01_Pickpocket (C_INFO)
{
	npc		= Mod_1318_SLD_Organisator_MT;
	nr		= 1;
	condition	= Info_Mod_Torwache_NL_01_Pickpocket_Condition;
	information	= Info_Mod_Torwache_NL_01_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Torwache_NL_01_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 250);
};

FUNC VOID Info_Mod_Torwache_NL_01_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Torwache_NL_01_Pickpocket);

	Info_AddChoice	(Info_Mod_Torwache_NL_01_Pickpocket, DIALOG_BACK, Info_Mod_Torwache_NL_01_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Torwache_NL_01_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Torwache_NL_01_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Torwache_NL_01_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Torwache_NL_01_Pickpocket);
};

FUNC VOID Info_Mod_Torwache_NL_01_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Torwache_NL_01_Pickpocket);
};

INSTANCE Info_Mod_Torwache_NL_01_EXIT (C_INFO)
{
	npc		= Mod_1318_SLD_Organisator_MT;
	nr		= 1;
	condition	= Info_Mod_Torwache_NL_01_EXIT_Condition;
	information	= Info_Mod_Torwache_NL_01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Torwache_NL_01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Torwache_NL_01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};