INSTANCE Info_Mod_Amorite_Hi (C_INFO)
{
	npc		= Mod_7768_OUT_Amorite_EIS;
	nr		= 1;
	condition	= Info_Mod_Amorite_Hi_Condition;
	information	= Info_Mod_Amorite_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Amorite_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Amorite_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Amorite_Hi_17_00"); //(aufhorchend) Wer kommt mich da besuchen?
	AI_Output(hero, self, "Info_Mod_Amorite_Hi_15_01"); //Ich ...
	AI_Output(self, hero, "Info_Mod_Amorite_Hi_17_02"); //Nur nicht so schüchtern. Setzt dich ruhig und trink etwas mit mir.
	AI_Output(self, hero, "Info_Mod_Amorite_Hi_17_03"); //In letzter Zeit hatte ich so wenig Gesellschaft.
	AI_Output(hero, self, "Info_Mod_Amorite_Hi_15_04"); //Na gut, ein Getränk zum Aufwärmen wird nicht schaden.
	AI_Output(self, hero, "Info_Mod_Amorite_Hi_17_05"); //Dich habe ich hier noch nie gesehen. Kommst du von weit her?
	AI_Output(hero, self, "Info_Mod_Amorite_Hi_15_06"); //Wo ich herkommen, kann man dem Gras beim Wachsen zusehen.
	AI_Output(self, hero, "Info_Mod_Amorite_Hi_17_07"); //Du bist ein Mann mit Humor ... das gefällt mir. Besonders da ich in letzter Zeit so allein bin ist etwas Unterhaltung Balsam für meine einsame Seele.
	AI_Output(hero, self, "Info_Mod_Amorite_Hi_15_08"); //Weshalb bist du einsam?
	AI_Output(self, hero, "Info_Mod_Amorite_Hi_17_09"); //Ach, mein Mann ist Jäger. Oft ist er Wochenlang in der Wildnis Jagen ... während ich ganz alleine zu Hause bin.
	AI_Output(self, hero, "Info_Mod_Amorite_Hi_17_10"); //Es ist jetzt schon drei Wochen her, dass er bei mir war ... Aber hier, nimm doch noch einen Schluck Met.
	AI_Output(hero, self, "Info_Mod_Amorite_Hi_15_11"); //Danke.
	AI_Output(self, hero, "Info_Mod_Amorite_Hi_17_12"); //Bei einem solch guten Tropfen wird es einem ganz warm, oder? Aber es gibt noch mehr Dinge, die Wärme geben können.
	AI_Output(self, hero, "Info_Mod_Amorite_Hi_17_13"); //Komm, gib mir deine Hand ... ich werde es dir zeigen.

	Info_ClearChoices	(Info_Mod_Amorite_Hi);

	Info_AddChoice	(Info_Mod_Amorite_Hi, "Nein, besser nicht.", Info_Mod_Amorite_Hi_B);
	Info_AddChoice	(Info_Mod_Amorite_Hi, "Ok ...", Info_Mod_Amorite_Hi_A);
};

FUNC VOID Info_Mod_Amorite_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Amorite_Hi_B_15_00"); //Nein, besser nicht.
	AI_Output(self, hero, "Info_Mod_Amorite_Hi_B_17_01"); //(erbost) Was?! Du wagst es mich zurückzuweisen?

	Info_ClearChoices	(Info_Mod_Amorite_Hi);

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Mod_7769_OUT_Wuetar_EIS, "EIS_DORF_002");

	Mod_EIS_Amorite = 2;
};

FUNC VOID Info_Mod_Amorite_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Amorite_Hi_A_15_01"); //Ok ...
	AI_Output(self, hero, "DEFAULT"); //

	AI_UnequipArmor	(hero);
	AI_UnequipArmor	(self);

	Info_ClearChoices	(Info_Mod_Amorite_Hi);

	PlayVideo ("LOVESCENE.BIK");

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Mod_7769_OUT_Wuetar_EIS, "EIS_DORF_002");

	Mod_EIS_Amorite = 1;
};

INSTANCE Info_Mod_Amorite_LassMich (C_INFO)
{
	npc		= Mod_7768_OUT_Amorite_EIS;
	nr		= 1;
	condition	= Info_Mod_Amorite_LassMich_Condition;
	information	= Info_Mod_Amorite_LassMich_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Amorite_LassMich_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Amorite_Hi))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Amorite_LassMich_Info()
{
	AI_Output(self, hero, "Info_Mod_Amorite_LassMich_17_00"); //Lass mich in Ruhe!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Amorite_Pickpocket (C_INFO)
{
	npc		= Mod_7768_OUT_Amorite_EIS;
	nr		= 1;
	condition	= Info_Mod_Amorite_Pickpocket_Condition;
	information	= Info_Mod_Amorite_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Amorite_Pickpocket_Condition()
{
	C_Beklauen	(59, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Amorite_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Amorite_Pickpocket);

	Info_AddChoice	(Info_Mod_Amorite_Pickpocket, DIALOG_BACK, Info_Mod_Amorite_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Amorite_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Amorite_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Amorite_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Amorite_Pickpocket);
};

FUNC VOID Info_Mod_Amorite_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Amorite_Pickpocket);
};

INSTANCE Info_Mod_Amorite_EXIT (C_INFO)
{
	npc		= Mod_7768_OUT_Amorite_EIS;
	nr		= 1;
	condition	= Info_Mod_Amorite_EXIT_Condition;
	information	= Info_Mod_Amorite_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Amorite_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Amorite_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};