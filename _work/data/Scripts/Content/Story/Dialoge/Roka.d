INSTANCE Info_Mod_Roka_Hi (C_INFO)
{
	npc		= Mod_1536_WKR_Roka_NW;
	nr		= 1;
	condition	= Info_Mod_Roka_Hi_Condition;
	information	= Info_Mod_Roka_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Roka_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Roka_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Roka_Hi_11_01"); //Ich bin Roka. Ich verkaufe den Wasserkriegern Rüstungen.
};

INSTANCE Info_Mod_Roka_Ruestung (C_INFO)
{
	npc		= Mod_1536_WKR_Roka_NW;
	nr		= 1;
	condition	= Info_Mod_Roka_Ruestung_Condition;
	information	= Info_Mod_Roka_Ruestung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kann ich bei dir eine bessere Rüstung bekommen?";
};

FUNC INT Info_Mod_Roka_Ruestung_Condition()
{
	if (Mod_Gilde == 17)
	&& (Npc_KnowsInfo(hero, Info_Mod_Roka_Hi))
	&& (Mod_ZweiteVerbesserung < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Roka_Ruestung_Info()
{
	AI_Output(hero, self, "Info_Mod_Roka_Ruestung_15_00"); //Kann ich bei dir eine bessere Rüstung bekommen?

	if (Kapitel > 3)
	&& (Mod_ZweiteVerbesserung == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Roka_Ruestung_11_03"); //Ich hab gehört, dass beim Weg zur Stadt von hier aus ein Wasserläufer sein soll. Mit dessen Fell könnte ich deine Wasserkriegerrüstung sicher ein wenig verbessern.
	
		Mod_ZweiteVerbesserung = TRUE;
	
		Wld_InsertNpc	(Wasserläufer,	"FP_MAGICGOLEM");
	};

	Info_ClearChoices	(Info_Mod_Roka_Ruestung);
	Info_AddChoice	(Info_Mod_Roka_Ruestung, DIALOG_BACK, Info_Mod_Roka_Ruestung_BACK);

	if (Mod_ZweiteVerbesserung == TRUE)
	&& (Mod_Gilde == 17)
	{
		Info_AddChoice	(Info_Mod_Roka_Ruestung, "Wasserkriegerrüstung verbessern", Info_Mod_Roka_Ruestung_WKR_S);
	};
};

FUNC VOID Info_Mod_Roka_Ruestung_BACK ()
{
	Info_ClearChoices	(Info_Mod_Roka_Ruestung);
};

FUNC VOID Info_Mod_Roka_Ruestung_WKR_S ()
{
	AI_Output(hero, self, "Info_Mod_Roka_Ruestung_WKR_S_15_00"); //Verbessere meine Wasserkriegerrüstung.

	if (Npc_HasItems(hero, ItAt_WaterShadowFur) == 1)
	&& (Npc_HasItems(hero, ItAr_WKR_H) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Roka_Ruestung_WKR_S_11_01"); //Alles klar.

		Npc_RemoveInvItems	(hero, ItAt_WaterShadowFur, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_WKR_H, 1);

		CreateInvItems	(self, ItAr_WKR_S, 1);

		B_GiveInvItems	(self, hero, ItAr_WKR_S, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_WKR_S);

		Mod_ZweiteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_WKR_H) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Roka_Ruestung_WKR_S_11_02"); //Du musst schon eine Wasserkriegerrüstung haben, sonst kann ich sie dir nicht verbessern.
	}
	else if (Npc_HasItems(hero, ItAt_WaterShadowFur) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Roka_Ruestung_WKR_S_11_03"); //Wenn du nicht das Wasserläuferfell hast, kann ich deine Rüstung nicht verbessern.
	};

	Info_ClearChoices	(Info_Mod_Roka_Ruestung);
};

INSTANCE Info_Mod_Roka_Pickpocket (C_INFO)
{
	npc		= Mod_1536_WKR_Roka_NW;
	nr		= 1;
	condition	= Info_Mod_Roka_Pickpocket_Condition;
	information	= Info_Mod_Roka_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Roka_Pickpocket_Condition()
{
	C_Beklauen	(75, ItMi_Gold, 460);
};

FUNC VOID Info_Mod_Roka_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Roka_Pickpocket);

	Info_AddChoice	(Info_Mod_Roka_Pickpocket, DIALOG_BACK, Info_Mod_Roka_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Roka_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Roka_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Roka_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Roka_Pickpocket);
};

FUNC VOID Info_Mod_Roka_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Roka_Pickpocket);
};

INSTANCE Info_Mod_Roka_EXIT (C_INFO)
{
	npc		= Mod_1536_WKR_Roka_NW;
	nr		= 1;
	condition	= Info_Mod_Roka_EXIT_Condition;
	information	= Info_Mod_Roka_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Roka_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Roka_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};