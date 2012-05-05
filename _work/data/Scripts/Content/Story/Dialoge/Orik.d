INSTANCE Info_Mod_Orik_Hi (C_INFO)
{
	npc		= Mod_1266_SLD_Orik_MT;
	nr		= 1;
	condition	= Info_Mod_Orik_Hi_Condition;
	information	= Info_Mod_Orik_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Orik_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Orik_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Orik_Hi_08_01"); //Ich bin Orik. Ich verkaufe den Söldnern Rüstungen.
};

INSTANCE Info_Mod_Orik_Florentius (C_INFO)
{
	npc		= Mod_1266_SLD_Orik_MT;
	nr		= 1;
	condition	= Info_Mod_Orik_Florentius_Condition;
	information	= Info_Mod_Orik_Florentius_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orik_Florentius_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orik_Hi))
	&& (Mod_NL_HatFlorentiusGekillt == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orik_Florentius_Info()
{
	AI_Output(self, hero, "Info_Mod_Orik_Florentius_08_00"); //Hey, du bist doch viel unterwegs im Minental. Bist du zufällig einem Händler namens Florentius begegnet?
	AI_Output(self, hero, "Info_Mod_Orik_Florentius_08_01"); //Ich erwarte etwas von ihm und er ist längst überfällig.
	AI_Output(hero, self, "Info_Mod_Orik_Florentius_15_02"); //Ich bin so vielen Leuten begegnet ... was sollte er dir denn bringen?
	AI_Output(self, hero, "Info_Mod_Orik_Florentius_08_03"); //Ähm, na ja, ein Buch hatte er mir versprochen.
	AI_Output(hero, self, "Info_Mod_Orik_Florentius_15_04"); //Und was für ein Buch soll das sein?
	AI_Output(self, hero, "Info_Mod_Orik_Florentius_08_05"); //Tja ... also, da sollten Bilder drin sein ... von Frauen.
	AI_Output(hero, self, "Info_Mod_Orik_Florentius_15_06"); //Naja, ich kenne viele bebilderte Bücher, wo auch Frauen abgebildet sind.
	AI_Output(self, hero, "Info_Mod_Orik_Florentius_08_07"); //Also, ... ok, Bilder von, ähh ...

	AI_PlayAni	(self, "T_SEARCH");

	AI_Output(self, hero, "Info_Mod_Orik_Florentius_08_08"); //(etwas leiser) ... leicht bekleideten Frauen.
	AI_Output(hero, self, "Info_Mod_Orik_Florentius_15_09"); //Ahh, du meinst "Aktbilder".
	AI_Output(self, hero, "Info_Mod_Orik_Florentius_08_10"); //Psst, nicht so laut. Muss ja nicht gleich jeder wissen.
	AI_Output(hero, self, "Info_Mod_Orik_Florentius_15_11"); //Also, ok, ich werde mal schauen, ob ich dein Buch irgendwo finde.
	AI_Output(self, hero, "Info_Mod_Orik_Florentius_08_12"); //Ja, mach das, du wirst es nicht bereuen, wenn du es mir bringst.
};

INSTANCE Info_Mod_Orik_JuanBuch (C_INFO)
{
	npc		= Mod_1266_SLD_Orik_MT;
	nr		= 1;
	condition	= Info_Mod_Orik_JuanBuch_Condition;
	information	= Info_Mod_Orik_JuanBuch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das gewünschte Buch.";
};

FUNC INT Info_Mod_Orik_JuanBuch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orik_Florentius))
	&& (Npc_HasItems(hero, ItWr_JuanBook) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orik_JuanBuch_Info()
{
	AI_Output(hero, self, "Info_Mod_Orik_JuanBuch_15_00"); //Ich habe das gewünschte Buch.
	AI_Output(self, hero, "Info_Mod_Orik_JuanBuch_08_01"); //(freudig überrascht) Was, wirklich, zeig her.

	B_GiveInvItems	(hero, self, ItWr_JuanBook, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Orik_JuanBuch_08_02"); //Ja, tatsächlich hehe.
	AI_Output(self, hero, "Info_Mod_Orik_JuanBuch_08_03"); //(wieder zum Helden) Ähhm, wie dem auch sei, du hast deine Sache wirklich gut gemacht.
	AI_Output(self, hero, "Info_Mod_Orik_JuanBuch_08_04"); //Hier, 20 Erz und 100 Gold ... ach was, 30 Erz und 200 Gold ...

	B_ShowGivenThings	("200 Gold und 30 Erz erhalten");

	CreateInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItMi_Nugget, 30);

	AI_Output(self, hero, "Info_Mod_Orik_JuanBuch_08_05"); //(wieder leiser) Aber dass das ja unter uns bleibt ...
};

INSTANCE Info_Mod_Orik_Niedergeschlagen (C_INFO)
{
	npc		= Mod_1266_SLD_Orik_MT;
	nr		= 1;
	condition	= Info_Mod_Orik_Niedergeschlagen_Condition;
	information	= Info_Mod_Orik_Niedergeschlagen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orik_Niedergeschlagen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Arto_OrikDa))
	&& (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orik_Niedergeschlagen_Info()
{
	AI_Output(self, hero, "Info_Mod_Orik_Niedergeschlagen_08_00"); //Was sollte das, ihr verdammten Dreckskerle, jetzt hat eure letzte Stunde geschlagen.
	AI_Output(hero, self, "Info_Mod_Orik_Niedergeschlagen_15_01"); //Du kommst jetzt mal mit. Ohne Waffe wirst du nicht viel ausrichten können.
	AI_Output(self, hero, "Info_Mod_Orik_Niedergeschlagen_08_02"); //Verdammte Schweine!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTOAL");

	CreateInvItems	(self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);

	B_LogEntry	(TOPIC_MOD_AL_ORIK, "Wir lauerten Orik vor der Höhle auf und haben ihn niedergeschlagen. Jetzt wird er erst mal mitkommen müssen.");
};

INSTANCE Info_Mod_Orik_Ruestung (C_INFO)
{
	npc		= Mod_1266_SLD_Orik_MT;
	nr		= 1;
	condition	= Info_Mod_Orik_Ruestung_Condition;
	information	= Info_Mod_Orik_Ruestung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kann ich bei dir eine bessere Rüstung bekommen?";
};

FUNC INT Info_Mod_Orik_Ruestung_Condition()
{
	if ((Mod_Gilde == 4)
	|| (Mod_Gilde == 19))
	&& (Npc_KnowsInfo(hero, Info_Mod_Orik_Hi))
	&& (Mod_ZweiteVerbesserung < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orik_Ruestung_Info()
{
	AI_Output(hero, self, "Info_Mod_Orik_Ruestung_15_00"); //Kann ich bei dir eine bessere Rüstung bekommen?

	if (Mod_Gilde == 4)
	&& (Mod_HasSLDH == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Orik_Ruestung_08_01"); //Ich hab hier eine Schwere Söldnerrüstung.
	};

	if (Kapitel > 1)
	&& (Mod_ErsteVerbesserung == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Orik_Ruestung_08_02"); //Ich hab gehört, dass beim Pass im Minental ein besonders großer Orkhund sein soll. Mit dessen Fell könnte ich deine schwere Söldnerrüstung sicher ein wenig verbessern.
	
		Mod_ErsteVerbesserung = TRUE;

		Wld_InsertNpc	(Orcdog_Big,	"OW_PATH_1_16_8");
	};

	if (Kapitel > 3)
	&& (Mod_ZweiteVerbesserung == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Orik_Ruestung_08_03"); //Ich hab gehört, dass beim Stonehenge ein Wyvern sein soll. Mit dessen Schuppen könnte ich deine Orkjägerrüstung sicher ein wenig verbessern.
	
		Mod_ZweiteVerbesserung = TRUE;

		Wld_InsertNpc	(Wyver,	"OW_PATH_276");
	};

	if (Mod_HasSLDH == TRUE)
	&& ((Kapitel == 1)
	|| ((Kapitel <= 3)
	&& (Mod_ErsteVerbesserung == 2))
	|| (Mod_ZweiteVerbesserung == 2))
	{
		AI_Output(self, hero, "Info_Mod_Orik_Ruestung_08_04"); //Zur Zeit nicht, komm später nochmal.
	};

	Info_ClearChoices	(Info_Mod_Orik_Ruestung);
	Info_AddChoice	(Info_Mod_Orik_Ruestung, DIALOG_BACK, Info_Mod_Orik_Ruestung_BACK);

	if (Mod_ErsteVerbesserung == TRUE)
	&& (Mod_Gilde == 4)
	&& (Npc_HasItems(hero, ItAr_SLD_S) == 0)
	{
		Info_AddChoice	(Info_Mod_Orik_Ruestung, "Schwere Söldnerrüstung verbessern", Info_Mod_Orik_Ruestung_SLD_S);
	};

	if (Mod_ZweiteVerbesserung == TRUE)
	&& (Mod_Gilde == 19)
	&& (Npc_HasItems(hero, ItAr_OJG_S) == 0)
	{
		Info_AddChoice	(Info_Mod_Orik_Ruestung, "Orkjägerrüstung verbessern", Info_Mod_Orik_Ruestung_OJG_S);
	};

	if (Mod_Gilde == 4)
	&& (Mod_HasSLDH == FALSE)
	{
		Info_AddChoice	(Info_Mod_Orik_Ruestung, "Schwere Söldnerrüstung (Kosten: 2500)", Info_Mod_Orik_Ruestung_SLD_M);
	};
};

FUNC VOID Info_Mod_Orik_Ruestung_BACK ()
{
	Info_ClearChoices	(Info_Mod_Orik_Ruestung);
};

FUNC VOID Info_Mod_Orik_Ruestung_SLD_S ()
{
	AI_Output(hero, self, "Info_Mod_Orik_Ruestung_SLD_S_15_00"); //Verbessere meine schwere Söldnerrüstung.

	if (Npc_HasItems(hero, ItAt_BigOrcDogFur) == 1)
	&& (Npc_HasItems(hero, ItAr_SLD_M) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Orik_Ruestung_SLD_S_08_01"); //Alles klar.

		Npc_RemoveInvItems	(hero, ItAt_BigOrcDogFur, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_SLD_M, 1);

		CreateInvItems	(self, ItAr_SLD_S, 1);

		B_GiveInvItems	(self, hero, ItAr_SLD_S, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_SLD_S);

		Mod_ErsteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_SLD_M) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Orik_Ruestung_SLD_S_08_02"); //Du musst schon eine schwere Söldnerrüstung haben, sonst kann ich sie dir nicht verbessern.
	}
	else if (Npc_HasItems(hero, ItAt_BigOrcDogFur) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Orik_Ruestung_SLD_S_08_03"); //Wenn du nicht das Orkhundfell hast, kann ich deine Rüstung nicht verbessern.
	};

	Info_ClearChoices	(Info_Mod_Orik_Ruestung);
};

FUNC VOID Info_Mod_Orik_Ruestung_OJG_S ()
{
	AI_Output(hero, self, "Info_Mod_Orik_Ruestung_OJG_S_15_00"); //Verbessere meine Orkjägerrüstung.

	if (Npc_HasItems(hero, ItAt_Wyverschuppen) == 5)
	&& (Npc_HasItems(hero, ItAr_SLD_H) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Orik_Ruestung_OJG_S_08_01"); //Alles klar.

		Npc_RemoveInvItems	(hero, ItAt_Wyverschuppen, 5);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_SLD_H, 1);

		CreateInvItems	(self, ItAr_OJG_S, 1);

		B_GiveInvItems	(self, hero, ItAr_OJG_S, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_OJG_S);

		Mod_ZweiteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_SLD_H) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Orik_Ruestung_OJG_S_08_02"); //Du musst schon eine Orkjägerrüstung haben, sonst kann ich sie dir nicht verbessern.
	}
	else if (Npc_HasItems(hero, ItAt_Wyverschuppen) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Orik_Ruestung_OJG_S_08_03"); //Wenn du nicht die Wyverschuppen hast, kann ich deine Rüstung nicht verbessern.
	};

	Info_ClearChoices	(Info_Mod_Orik_Ruestung);
};

FUNC VOID Info_Mod_Orik_Ruestung_SLD_M ()
{
	AI_Output(hero, self, "Info_Mod_Orik_Ruestung_SLD_M_15_00"); //Ich nehme die schwere Söldnerrüstung.

	if (Npc_HasItems(hero, ItMi_Gold) >= 2500)
	{
		AI_Output(self, hero, "Info_Mod_Orik_Ruestung_SLD_M_08_01"); //Alles klar.

		B_GiveInvItems	(hero, self, ItMi_Gold, 2500);

		CreateInvItems	(self, ItAr_SLD_M, 1);

		B_GiveInvItems	(self, hero, ItAr_SLD_M, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_SLD_M);

		Mod_HasSLDH = TRUE;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Orik_Ruestung_SLD_M_08_02"); //Ohne Gold keine Rüstung.
	};

	Info_ClearChoices	(Info_Mod_Orik_Ruestung);
};

INSTANCE Info_Mod_Orik_Pickpocket (C_INFO)
{
	npc		= Mod_1266_SLD_Orik_MT;
	nr		= 1;
	condition	= Info_Mod_Orik_Pickpocket_Condition;
	information	= Info_Mod_Orik_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Orik_Pickpocket_Condition()
{
	C_Beklauen	(112, ItMi_Gold, 460);
};

FUNC VOID Info_Mod_Orik_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Orik_Pickpocket);

	Info_AddChoice	(Info_Mod_Orik_Pickpocket, DIALOG_BACK, Info_Mod_Orik_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Orik_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Orik_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Orik_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Orik_Pickpocket);
};

FUNC VOID Info_Mod_Orik_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Orik_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Orik_Pickpocket);

		Info_AddChoice	(Info_Mod_Orik_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Orik_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Orik_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Orik_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Orik_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Orik_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Orik_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Orik_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Orik_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Orik_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Orik_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Orik_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Orik_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Orik_EXIT (C_INFO)
{
	npc		= Mod_1266_SLD_Orik_MT;
	nr		= 1;
	condition	= Info_Mod_Orik_EXIT_Condition;
	information	= Info_Mod_Orik_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Orik_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Orik_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};