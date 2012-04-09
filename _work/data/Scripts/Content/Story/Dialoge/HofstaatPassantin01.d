INSTANCE Info_Mod_HofstaatPassantin01_Fluffy (C_INFO)
{
	npc		= Mod_7336_HS_Passantin_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatPassantin01_Fluffy_Condition;
	information	= Info_Mod_HofstaatPassantin01_Fluffy_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatPassantin01_Fluffy_Condition()
{
	if (Mod_SL_PartFluffy == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatPassantin01_Fluffy_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatPassantin01_Fluffy_16_00"); //Also der König hat seinen Hund aber schlecht unter Kontrolle ...

	Mod_SL_PartFluffy = 4;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_HofstaatPassantin01_Lochgraeber (C_INFO)
{
	npc		= Mod_7336_HS_Passantin_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatPassantin01_Lochgraeber_Condition;
	information	= Info_Mod_HofstaatPassantin01_Lochgraeber_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatPassantin01_Lochgraeber_Condition()
{
	if (Mod_SL_PartLochgraeber == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatPassantin01_Lochgraeber_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatPassantin01_Lochgraeber_16_00"); //Hast du gehört? Irgend so ein Grünschnabel hat in nur einer Nacht ein Loch gegraben, das hundertmal tiefer war, als das, unseres Gräbers!

	Mod_SL_PartLochgraeber = 3;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_HofstaatPassantin01_Geliebte (C_INFO)
{
	npc		= Mod_7336_HS_Passantin_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatPassantin01_Geliebte_Condition;
	information	= Info_Mod_HofstaatPassantin01_Geliebte_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatPassantin01_Geliebte_Condition()
{
	if (Mod_SL_PartGeliebte == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatPassantin01_Geliebte_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatPassantin01_Geliebte_16_00"); //Hast du gehört? Anscheinend hat irgend so ein junger Spund es geschafft, die königliche Geliebte zu verführen!

	Mod_SL_PartGeliebte = 7;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_HofstaatPassantin01_Blind (C_INFO)
{
	npc		= Mod_7336_HS_Passantin_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatPassantin01_Blind_Condition;
	information	= Info_Mod_HofstaatPassantin01_Blind_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatPassantin01_Blind_Condition()
{
	if (Mod_SL_PartBlind == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatPassantin01_Blind_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatPassantin01_Blind_16_00"); //Hast du's schon gehört?! In Khorata können wir kein Freudenspender mehr verkaufen! Die glauben, dass es Blind macht!

	Mod_SL_PartBlind = 4;

	B_RemoveNpc	(Mod_7351_OUT_Ranck_REL);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_HofstaatPassantin01_Brunnen (C_INFO)
{
	npc		= Mod_7336_HS_Passantin_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatPassantin01_Brunnen_Condition;
	information	= Info_Mod_HofstaatPassantin01_Brunnen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatPassantin01_Brunnen_Condition()
{
	if (Mod_SL_PartBrunnen == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatPassantin01_Brunnen_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatPassantin01_Brunnen_16_00"); //Sag mal, hast du dir das Schloss mal genauer angesehen? Das ist doch irgendwie schäbig und gar nicht Prunkvoll.

	Mod_SL_PartBrunnen = 2;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_HofstaatPassantin01_Geschwaecht (C_INFO)
{
	npc		= Mod_7336_HS_Passantin_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatPassantin01_Geschwaecht_Condition;
	information	= Info_Mod_HofstaatPassantin01_Geschwaecht_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatPassantin01_Geschwaecht_Condition()
{
	if (Mod_SL_Schwaechen == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatPassantin01_Geschwaecht_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatPassantin01_Geschwaecht_16_00"); //Also ... in letzter Zeit läuft ziemlich viel falsch!

	Mod_SL_Schwaechen = 3;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_HofstaatPassantin01_Pickpocket (C_INFO)
{
	npc		= Mod_7336_HS_Passantin_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatPassantin01_Pickpocket_Condition;
	information	= Info_Mod_HofstaatPassantin01_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_HofstaatPassantin01_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_HofstaatPassantin01_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatPassantin01_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatPassantin01_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatPassantin01_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatPassantin01_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatPassantin01_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatPassantin01_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatPassantin01_Pickpocket);
};

FUNC VOID Info_Mod_HofstaatPassantin01_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_HofstaatPassantin01_Pickpocket);
};

INSTANCE Info_Mod_HofstaatPassantin01_EXIT (C_INFO)
{
	npc		= Mod_7336_HS_Passantin_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatPassantin01_EXIT_Condition;
	information	= Info_Mod_HofstaatPassantin01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatPassantin01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatPassantin01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};