INSTANCE Info_Mod_AttraktiveFrau_Hi (C_INFO)
{
	npc		= Mod_7198_HEX_AttraktiveFrau_NW;
	nr		= 1;
	condition	= Info_Mod_AttraktiveFrau_Hi_Condition;
	information	= Info_Mod_AttraktiveFrau_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_AttraktiveFrau_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_AttraktiveFrau_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_AttraktiveFrau_Hi_17_00"); //(verführerisch) Hallo, mein Schöner. Was macht ein prächtiger Kerl wie du ohne weibliche Begleitung in dieser Spelunke?
	AI_Output(self, hero, "Info_Mod_AttraktiveFrau_Hi_17_01"); //Willst du mir nicht etwas Gesellschaft leisten?

	Info_ClearChoices	(Info_Mod_AttraktiveFrau_Hi);

	Info_AddChoice	(Info_Mod_AttraktiveFrau_Hi, "Nein, ich habe zu tun und muss weiter.", Info_Mod_AttraktiveFrau_Hi_B);
	Info_AddChoice	(Info_Mod_AttraktiveFrau_Hi, "Ja, aber immer doch.", Info_Mod_AttraktiveFrau_Hi_A);
};

FUNC VOID Info_Mod_AttraktiveFrau_Hi_C()
{
	AI_Output(self, hero, "Info_Mod_AttraktiveFrau_Hi_C_17_00"); //(verführerisch) Ich spüre, dass dich eine ganz besondere Aura umgibt.
	AI_Output(self, hero, "Info_Mod_AttraktiveFrau_Hi_C_17_01"); //(nachdenklich, sachlicher) Du bist kein gewöhnlicher Mann ... (hält kurz inne, wieder verführerisch) Wollen wir nicht aufs Zimmer gehen und uns etwas näher kennen lernen?
	
	Info_ClearChoices	(Info_Mod_AttraktiveFrau_Hi);

	Info_AddChoice	(Info_Mod_AttraktiveFrau_Hi, "Nein, ich muss jetzt wirklich weiter.", Info_Mod_AttraktiveFrau_Hi_E);
	Info_AddChoice	(Info_Mod_AttraktiveFrau_Hi, "Warum nicht, gehen wir.", Info_Mod_AttraktiveFrau_Hi_D);
};

FUNC VOID Info_Mod_AttraktiveFrau_Hi_F()
{
	Info_ClearChoices	(Info_Mod_AttraktiveFrau_Hi);

	B_StartOtherRoutine	(self, "ZIMMER");

	AI_SetWalkMode	(self, NPC_RUN);

	AI_GotoWP	(self, "WP_TAVERNE_ZIMMER_07");
	AI_GotoWP	(hero, "WP_TAVERNE_ZIMMER_07");

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_AttraktiveFrau_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_AttraktiveFrau_Hi_B_15_00"); //Nein, ich habe zu tun und muss weiter.
	AI_Output(self, hero, "Info_Mod_AttraktiveFrau_Hi_B_17_01"); //Aber, aber, es gehört sich nicht, einer Frau so einen Gefallen abzuschlagen.
	
	Info_Mod_AttraktiveFrau_Hi_C();
};

FUNC VOID Info_Mod_AttraktiveFrau_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_AttraktiveFrau_Hi_A_15_00"); //Ja, aber immer doch.
	
	Info_Mod_AttraktiveFrau_Hi_C();
};

FUNC VOID Info_Mod_AttraktiveFrau_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_AttraktiveFrau_Hi_E_15_00"); //Nein, ich muss jetzt wirklich weiter.
	AI_Output(self, hero, "Info_Mod_AttraktiveFrau_Hi_E_17_01"); //Ach, ich weiß doch viel besser, was du wirklich willst.

	Mod_AttraktiveFrau = 1;
	
	Info_Mod_AttraktiveFrau_Hi_F();
};

FUNC VOID Info_Mod_AttraktiveFrau_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_AttraktiveFrau_Hi_D_15_00"); //Warum nicht, gehen wir.
	AI_Output(self, hero, "Info_Mod_AttraktiveFrau_Hi_D_17_01"); //Dann folge mir einfach.

	Mod_AttraktiveFrau = 2;
	
	Info_Mod_AttraktiveFrau_Hi_F();
};

INSTANCE Info_Mod_AttraktiveFrau_Sex (C_INFO)
{
	npc		= Mod_7198_HEX_AttraktiveFrau_NW;
	nr		= 1;
	condition	= Info_Mod_AttraktiveFrau_Sex_Condition;
	information	= Info_Mod_AttraktiveFrau_Sex_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_AttraktiveFrau_Sex_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AttraktiveFrau_Hi))
	&& (Npc_GetDistToWP(self, "WP_TAVERNE_ZIMMER_07") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AttraktiveFrau_Sex_Info()
{
	AI_Output(self, hero, "Info_Mod_AttraktiveFrau_Sex_17_00"); //So, und nun entkleide dich. Es wird eine unvergessliche Nacht für dich werden.

	Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	AI_Teleport	(self, "TOT");

	B_GivePlayerXP	(250);

	hero.attribute[ATR_STRENGTH] -= 10;
	hero.attribute[ATR_DEXTERITY] -= 10;
	hero.attribute[ATR_MANA] -= 10;
	hero.attribute[ATR_MANA_MAX] -= 10;

	if (Mod_AttraktiveFrau == 1)
	{
		B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Verdammt, ich fühle mich alles andere als wohl. Aber ich war einfach nicht in der Lage dazu, mich ihrem Willen zu widersetzen.");
	}
	else
	{
		B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Verdammt, ich fühle mich alles andere als wohl. Worauf habe ich mich da nur eingelassen ...");
	};

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Ich sollte auf jeden Fall einen heilkundigen Magier aufsuchen und danach Saturas davon berichten.");
};