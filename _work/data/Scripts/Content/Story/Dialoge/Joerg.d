INSTANCE Info_Mod_Joerg_Hi (C_INFO)
{
	npc		= Mod_1047_VLK_Joerg_NW;
	nr		= 1;
	condition	= Info_Mod_Joerg_Hi_Condition;
	information	= Info_Mod_Joerg_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Joerg_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Joerg_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Joerg_Hi_01_01"); //Ich bin Joerg, der Helfer von Carl.
};

INSTANCE Info_Mod_Joerg_Wilfried (C_INFO)
{
	npc		= Mod_1047_VLK_Joerg_NW;
	nr		= 1;
	condition	= Info_Mod_Joerg_Wilfried_Condition;
	information	= Info_Mod_Joerg_Wilfried_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Joerg_Wilfried_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thilo_Wilfried))
	&& (Mod_WilfriedsQuest == 2)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joerg_Wilfried_Info()
{
	AI_Output(self, hero, "Info_Mod_Joerg_Wilfried_01_00"); //Was willst du?
	AI_Output(hero, self, "Info_Mod_Joerg_Wilfried_15_01"); //Kannst du dich daran erinnern, jemals schlechte Erfahrungen mit Wilfried gemacht zu haben?
	AI_Output(self, hero, "Info_Mod_Joerg_Wilfried_01_02"); //Vielleicht... Aber kann ich dir vertrauen?

	if (Npc_HasItems(hero, ItMi_Gold) >= 10)
	{
		AI_Output(hero, self, "Info_Mod_Joerg_Wilfried_15_03"); //Sicher doch.

		B_GiveInvItems	(hero, self, ItMi_Gold, 10);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Joerg_Wilfried_15_04"); //Es gibt Gerüchte, dass er ein Verbrecher ist.
	};

	AI_Output(self, hero, "Info_Mod_Joerg_Wilfried_01_05"); //Oh, ja, das ist ein echter Vertrauensbeweis. Aber nun zu deiner Ausgangsfrage: Ja, ich meide Wilfried, weil mir seine Geschäfte etwas dubios erscheinen.
	AI_Output(self, hero, "Info_Mod_Joerg_Wilfried_01_06"); //Allerdings kann ich das nicht an einzelnen Ereignissen festlegen, es ist eher der Gesamteindruck, der bei ihm nicht stimmt.
	AI_Output(hero, self, "Info_Mod_Joerg_Wilfried_15_07"); //Mehr kannst du mir nicht sagen?
	AI_Output(self, hero, "Info_Mod_Joerg_Wilfried_01_08"); //Es hat mit seinen Waren zu tun, glaube ich. Ich war nie zufrieden mit den Produkten, jedenfalls nicht im Verhältnis zum Preis. Mehr kann ich dir nicht sagen.
	AI_Output(self, hero, "Info_Mod_Joerg_Wilfried_01_09"); //Aber ich würde zu gerne sehen, was passieren würde, wenn man Wilfried und seinen Laden mal genauer untersuchte...
	AI_Output(hero, self, "Info_Mod_Joerg_Wilfried_15_10"); //Wir werden sehen ...

	if (Npc_KnowsInfo(hero, Info_Mod_Nimius_Wilfried))
	{
		Mod_WilfriedsQuest = 3;

		B_LogEntry	(TOPIC_MOD_WILFRIED_GOLD, "Ich habe noch zwei weitere Personen gefunden, die überzeugt sind, dass Wilfried unfairen Handel treibt. Allerdings fehlen noch immer die handfesten Beweise...");

		B_StartOtherRoutine	(Mod_544_NONE_Wilfried_NW, "HOEHLE");
		AI_Teleport	(Mod_544_NONE_Wilfried_NW, "TAVERNE");
	};
};

INSTANCE Info_Mod_Joerg_WilfriedTot (C_INFO)
{
	npc		= Mod_1047_VLK_Joerg_NW;
	nr		= 1;
	condition	= Info_Mod_Joerg_WilfriedTot_Condition;
	information	= Info_Mod_Joerg_WilfriedTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Joerg_WilfriedTot_Condition()
{
	if (Mod_WilfriedsQuest == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joerg_WilfriedTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Joerg_WilfriedTot_01_00"); //War es nötig, Wilfried umzubringen?
	AI_Output(hero, self, "Info_Mod_Joerg_WilfriedTot_15_01"); //Er hat mich angegriffen.
	AI_Output(self, hero, "Info_Mod_Joerg_WilfriedTot_01_02"); //(seufzt) Dann soll es wohl so sein.
};

INSTANCE Info_Mod_Joerg_Flugblätter (C_INFO)
{
	npc		= Mod_1047_VLK_Joerg_NW;
	nr		= 1;
	condition	= Info_Mod_Joerg_Flugblätter_Condition;
	information	= Info_Mod_Joerg_Flugblätter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Joerg_Flugblätter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblätter) >= 1)
	&& (Mod_Flugblätter	<	20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblätter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Joerg_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joerg_Flugblätter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblätter, 1);

	AI_Output(self, hero, "Info_Mod_Joerg_Flugblätter_01_01"); //Oh, danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Joerg_Flugblätter_01_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblätter	=	Mod_Flugblätter + 1;
};

INSTANCE Info_Mod_Joerg_Pickpocket (C_INFO)
{
	npc		= Mod_1047_VLK_Joerg_NW;
	nr		= 1;
	condition	= Info_Mod_Joerg_Pickpocket_Condition;
	information	= Info_Mod_Joerg_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Joerg_Pickpocket_Condition()
{
	C_Beklauen	(10, ItMi_Gold, 34);
};

FUNC VOID Info_Mod_Joerg_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Joerg_Pickpocket);

	Info_AddChoice	(Info_Mod_Joerg_Pickpocket, DIALOG_BACK, Info_Mod_Joerg_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Joerg_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Joerg_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Joerg_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Joerg_Pickpocket);
};

FUNC VOID Info_Mod_Joerg_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Joerg_Pickpocket);
};

INSTANCE Info_Mod_Joerg_EXIT (C_INFO)
{
	npc		= Mod_1047_VLK_Joerg_NW;
	nr		= 1;
	condition	= Info_Mod_Joerg_EXIT_Condition;
	information	= Info_Mod_Joerg_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Joerg_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Joerg_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};