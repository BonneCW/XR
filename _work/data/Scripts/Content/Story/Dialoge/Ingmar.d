INSTANCE Info_Mod_Ingmar_Hi (C_INFO)
{
	npc		= Mod_585_RIT_Ingmar_NW;
	nr		= 1;
	condition	= Info_Mod_Ingmar_Hi_Condition;
	information	= Info_Mod_Ingmar_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Ingmar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ingmar_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Ingmar_Hi_06_01"); //Ich bin Ingmar der Ritter. Ich bin ein Beschützer dieser Stadt. Außerdem sorge ich dafür, dass die anderen Ritter stark genug sind.
};

INSTANCE Info_Mod_Ingmar_Innosklinge (C_INFO)
{
	npc		= Mod_585_RIT_Ingmar_NW;
	nr		= 1;
	condition	= Info_Mod_Ingmar_Innosklinge_Condition;
	information	= Info_Mod_Ingmar_Innosklinge_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sei gegrüßt. Ich hörte du begeisterst dich für Gedichte (...)";
};

FUNC INT Info_Mod_Ingmar_Innosklinge_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Harad_AndreVermaechtnis5))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ingmar_Innosklinge_Info()
{
	AI_Output(hero, self, "Info_Mod_Ingmar_Innosklinge_15_00"); //Sei gegrüßt. Ich hörte du begeisterst dich für Gedichte und Liedtexte über den Kampf für Innos‘ gerechte Sache.
	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_01"); //Ja, das stimmt in der Tat.
	AI_Output(hero, self, "Info_Mod_Ingmar_Innosklinge_15_02"); //Sagt dir 'Dominiques Ruf' etwas?
	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_03"); //Sicher doch. Wer kennt nicht den legendären Paladin Dominique und die epischen Schriften, die von seinen Heldentaten künden.
	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_04"); //Warte einen Augenblick, ich werde es aus meinen Liedtexten heraussuchen.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_05"); //Ongars Knochenweg ... nein ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_06"); //Parzivals Blutopfer ... auch nicht ... ahh, ja, hier ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_07"); //Dominiques Ruf
	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_08"); //Wir werden seinen Ruhm ernten
	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_09"); //Innos steht bei mir und meinen Brüdern
	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_10"); //Ich werde alle auf meinem Weg wie Schafe schlachten
	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_11"); //denn er ist das Feuer in meinem Herz
	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_12"); //Meine Klinge ist nur ihm geweiht
	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_13"); //an diesem Tag wird sein Name erklingen
	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_14"); //Jeder der sich in meinen Weg stellt
	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_15"); //wird durch meine Hand sterben
	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_16"); //denn ich bin ein Krieger Innos
	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_17"); //Vollstrecker seines Willens
	AI_Output(hero, self, "Info_Mod_Ingmar_Innosklinge_15_18"); //Danke, hab’s mir aufgeschrieben.

	CreateInvItems	(hero, ItWr_DominiquesRuf, 1);

	AI_Output(self, hero, "Info_Mod_Ingmar_Innosklinge_06_19"); //Gerne. Es freut mich immer, wenn jemand die lyrischen Schriften der Streiter Innos‘ zu schätzen weiß.

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_MILIZ_INNOSKLINGE, "Ich habe den Liedtext. Den Rest wird mir Harad hoffentlich erklären können.");
};

INSTANCE Info_Mod_Ingmar_Lehrer (C_INFO)
{
	npc		= Mod_585_RIT_Ingmar_NW;
	nr		= 1;
	condition	= Info_Mod_Ingmar_Lehrer_Condition;
	information	= Info_Mod_Ingmar_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mich auch trainieren?";
};

FUNC INT Info_Mod_Ingmar_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ingmar_Hi))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ingmar_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Ingmar_Lehrer_15_00"); //Kannst du mich auch trainieren?
	
	if (Mod_Gilde == 1)
	{
		AI_Output(self, hero, "Info_Mod_Ingmar_Lehrer_06_01"); //Sobald zu einem Ritter geworden bist werde ich dich trainieren, vorher nicht.

		B_LogEntry	(TOPIC_MOD_LEHRER_STADT, "Ingmar wird mich in Stärke trainieren sobald ich ein Ritter bin.");
	}
	else if (Mod_Gilde == 2)
	{
		AI_Output(self, hero, "Info_Mod_Ingmar_Lehrer_06_02"); //Da du ein Ritter bist werde ich dich trainieren.

		B_LogEntry	(TOPIC_MOD_LEHRER_STADT, "Ingmar wird mich in Stärke trainieren, solange ich ein Ritter bin.");
	}
	else if (Mod_Gilde == 3)
	{
		AI_Output(self, hero, "Info_Mod_Ingmar_Lehrer_06_03"); //Du bist bereits ein Paladin. Ich kann dich nicht mehr unterweisen. Du musst dir einen neuen Lehrer suchen.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Ingmar_Lehrer_06_04"); //Ich trainiere nur Ritter.
	};
};

INSTANCE Info_Mod_Ingmar_Lernen (C_INFO)
{
	npc		= Mod_585_RIT_Ingmar_NW;
	nr		= 1;
	condition	= Info_Mod_Ingmar_Lernen_Condition;
	information	= Info_Mod_Ingmar_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Zeig mir wie ich Stärker werde.";
};

FUNC INT Info_Mod_Ingmar_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ingmar_Lehrer))
	&& (Mod_Gilde == 2)
	&& (hero.attribute[ATR_STRENGTH] < 180)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ingmar_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Ingmar_Lernen_15_00"); //Zeig mir wie ich Stärker werde.

	Info_ClearChoices	(Info_Mod_Ingmar_Lernen);

	Info_AddChoice	(Info_Mod_Ingmar_Lernen, DIALOG_BACK, Info_Mod_Ingmar_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Ingmar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Ingmar_Lernen_5);
	Info_AddChoice	(Info_Mod_Ingmar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Ingmar_Lernen_1);
};

FUNC VOID Info_Mod_Ingmar_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Ingmar_Lernen);
};

FUNC VOID Info_Mod_Ingmar_Lernen_5()
{
	B_TeachAttributePoints_New	(self, hero, ATR_STRENGTH, 5, 180);
	
	Info_ClearChoices	(Info_Mod_Ingmar_Lernen);

	Info_AddChoice	(Info_Mod_Ingmar_Lernen, DIALOG_BACK, Info_Mod_Ingmar_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Ingmar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Ingmar_Lernen_5);
	Info_AddChoice	(Info_Mod_Ingmar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Ingmar_Lernen_1);
};

FUNC VOID Info_Mod_Ingmar_Lernen_1()
{
	B_TeachAttributePoints	(self, hero, ATR_STRENGTH, 1, 180);

	Info_ClearChoices	(Info_Mod_Ingmar_Lernen);

	Info_AddChoice	(Info_Mod_Ingmar_Lernen, DIALOG_BACK, Info_Mod_Ingmar_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Ingmar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Ingmar_Lernen_5);
	Info_AddChoice	(Info_Mod_Ingmar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Ingmar_Lernen_1);
};

INSTANCE Info_Mod_Ingmar_Pickpocket (C_INFO)
{
	npc		= Mod_585_RIT_Ingmar_NW;
	nr		= 1;
	condition	= Info_Mod_Ingmar_Pickpocket_Condition;
	information	= Info_Mod_Ingmar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Ingmar_Pickpocket_Condition()
{
	C_Beklauen	(90, ItMi_Gold, 580);
};

FUNC VOID Info_Mod_Ingmar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ingmar_Pickpocket);

	Info_AddChoice	(Info_Mod_Ingmar_Pickpocket, DIALOG_BACK, Info_Mod_Ingmar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ingmar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ingmar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ingmar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ingmar_Pickpocket);
};

FUNC VOID Info_Mod_Ingmar_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Ingmar_Pickpocket);
};

INSTANCE Info_Mod_Ingmar_EXIT (C_INFO)
{
	npc		= Mod_585_RIT_Ingmar_NW;
	nr		= 1;
	condition	= Info_Mod_Ingmar_EXIT_Condition;
	information	= Info_Mod_Ingmar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ingmar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ingmar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};