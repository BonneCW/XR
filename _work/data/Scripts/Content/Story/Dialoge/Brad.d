INSTANCE Info_Mod_Brad_Hi (C_INFO)
{
	npc		= Mod_10016_MIN_Brad_MT;
	nr		= 1;
	condition	= Info_Mod_Brad_Hi_Condition;
	information	= Info_Mod_Brad_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brad_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brad_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Brad_Hi_18_00"); //Was will denn ein Menschling in meiner Höhle?

	Info_ClearChoices	(Info_Mod_Brad_Hi);

	Info_AddChoice	(Info_Mod_Brad_Hi, "Hast du zufällig in letzter Zeit einen Kopf gefunden?", Info_Mod_Brad_Hi_B);
	Info_AddChoice	(Info_Mod_Brad_Hi, "Deine Höhle?", Info_Mod_Brad_Hi_A);
};

FUNC VOID Info_Mod_Brad_Hi_C()
{
	AI_Output(self, hero, "Info_Mod_Brad_Hi_C_18_00"); //Da fällt mir ein, ich habe vor kurzem einen Kopf gefunden. Aber wie kommt mir das jetzt in den Sinn?

	Info_ClearChoices	(Info_Mod_Brad_Hi);

	Info_AddChoice	(Info_Mod_Brad_Hi, "Hey, Großkotz. Hier unten! Beuge deinen Kopf, du Mistvieh!", Info_Mod_Brad_Hi_E);
	Info_AddChoice	(Info_Mod_Brad_Hi, "Hier bin ich. Ich rede mit dir.", Info_Mod_Brad_Hi_D);
};

FUNC VOID Info_Mod_Brad_Hi_H()
{
	AI_Output(hero, self, "Info_Mod_Brad_Hi_H_15_00"); //Kann ich diesen Kopf haben?
	AI_Output(self, hero, "Info_Mod_Brad_Hi_H_18_01"); //Hmm, sollte ich diesem Männchen den Kopf geben? Ich frage mich, was er für Argumente dafür hat.
	AI_Output(hero, self, "Info_Mod_Brad_Hi_H_15_02"); //Ich könnte dir Gold geben. Willst du Gold?
	AI_Output(self, hero, "Info_Mod_Brad_Hi_H_18_03"); //(lacht) Brauche ich Gold? Nein! Meine Schatzkammern sind voll davon!
	AI_Output(hero, self, "Info_Mod_Brad_Hi_H_15_04"); //Suchst du etwas bestimmtes?
	AI_Output(self, hero, "Info_Mod_Brad_Hi_H_18_05"); //Hm, da fällt mir ein, es wird langsam kalt hier drinnen. Das Männlein könnte mir Wolfsfelle besorgen, damit mir wärmer ist. Zwanzig wären schon ganz gut.

	Info_ClearChoices	(Info_Mod_Brad_Hi);

	Info_AddChoice	(Info_Mod_Brad_Hi, "Vergiss es.", Info_Mod_Brad_Hi_O);
	Info_AddChoice	(Info_Mod_Brad_Hi, "Ich besorge dir die Felle.", Info_Mod_Brad_Hi_N);
};

FUNC VOID Info_Mod_Brad_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Brad_Hi_B_15_00"); //Hast du zufällig in letzter Zeit einen Kopf gefunden?

	Info_Mod_Brad_Hi_C();
};

FUNC VOID Info_Mod_Brad_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Brad_Hi_A_15_00"); //Deine Höhle?
	AI_Output(self, hero, "Info_Mod_Brad_Hi_A_18_01"); //Was höre ich da? Das Männlein stellt meine Besitztümer in Frage? Ich sollte ihm eine Lektion erteilen.

	Info_ClearChoices	(Info_Mod_Brad_Hi);

	Info_AddChoice	(Info_Mod_Brad_Hi, "Dass ich nicht lache.", Info_Mod_Brad_Hi_J);
	Info_AddChoice	(Info_Mod_Brad_Hi, "Kannst du auch mit dem 'Männlein' sprechen, oder sprichst du nur mit dir?", Info_Mod_Brad_Hi_I);
};

FUNC VOID Info_Mod_Brad_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Brad_Hi_E_15_00"); //Hey, Großkotz. Hier unten! Beuge deinen Kopf, du Mistvieh!
	AI_Output(self, hero, "Info_Mod_Brad_Hi_E_18_01"); //Dieser Winzling macht mich wütend!

	Info_ClearChoices	(Info_Mod_Brad_Hi);

	Info_AddChoice	(Info_Mod_Brad_Hi, "Tschuldigung, das wollte ich nicht.", Info_Mod_Brad_Hi_G);
	Info_AddChoice	(Info_Mod_Brad_Hi, "Hey, du Irrer. Ich rede mit dir!", Info_Mod_Brad_Hi_F);
};

FUNC VOID Info_Mod_Brad_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Brad_Hi_D_15_00"); //Hier bin ich. Ich rede mit dir.
	AI_Output(self, hero, "Info_Mod_Brad_Hi_D_18_01"); //Der Kleine denkt wohl, ich sehe ihn nicht. (Lacht leise)

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Brad_Hi_D_15_02"); //(zu sich) Oha, ein Irrer.

	AI_TurnToNpc	(hero, self);

	Info_Mod_Brad_Hi_H();
};

FUNC VOID Info_Mod_Brad_Hi_G()
{
	AI_Output(hero, self, "Info_Mod_Brad_Hi_G_15_00"); //Tschuldigung, das wollte ich nicht.
	AI_Output(self, hero, "Info_Mod_Brad_Hi_G_18_01"); //Ich denke, ich sollte mich beruhigen.

	Info_Mod_Brad_Hi_H();
};

FUNC VOID Info_Mod_Brad_Hi_M()
{
	AI_Output(self, hero, "Info_Mod_Brad_Hi_M_18_00"); //Ich werde ihm den Kopf abreißen!

	Info_ClearChoices	(Info_Mod_Brad_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

FUNC VOID Info_Mod_Brad_Hi_F()
{
	AI_Output(hero, self, "Info_Mod_Brad_Hi_F_15_00"); //Hey, du Irrer. Ich rede mit dir!

	Info_Mod_Brad_Hi_M();
};

FUNC VOID Info_Mod_Brad_Hi_J()
{
	AI_Output(hero, self, "Info_Mod_Brad_Hi_J_15_00"); //Dass ich nicht lache.
	AI_Output(self, hero, "Info_Mod_Brad_Hi_J_18_01"); //Dieser Winzling macht mich wütend! Sowas stellt man nicht in Frage. Nein. Niemals. Vielleicht sollte ich ihm den Kopf abreißen. Dann hätte ich schon zwei. (Lacht leise)

	Info_ClearChoices	(Info_Mod_Brad_Hi);

	Info_AddChoice	(Info_Mod_Brad_Hi, "Das hier ist bestimmt nicht deine Höhle.", Info_Mod_Brad_Hi_L);
	Info_AddChoice	(Info_Mod_Brad_Hi, "Wie bitte? Einen Kopf? Du hast einen Kopf gefunden?", Info_Mod_Brad_Hi_K);
};

FUNC VOID Info_Mod_Brad_Hi_I()
{
	AI_Output(hero, self, "Info_Mod_Brad_Hi_I_15_00"); //Kannst du auch mit dem 'Männlein' sprechen, oder sprichst du nur mit dir?
	AI_Output(self, hero, "Info_Mod_Brad_Hi_I_18_01"); //Ich spreche mit niemandem, außer mit mir selbst, nicht wahr, Brad? Nie.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Brad_Hi_D_15_02"); //(zu sich) Oha, ein Irrer.

	AI_TurnToNpc	(hero, self);

	Info_Mod_Brad_Hi_B();
};

FUNC VOID Info_Mod_Brad_Hi_L()
{
	AI_Output(hero, self, "Info_Mod_Brad_Hi_L_15_00"); //Das hier ist bestimmt nicht deine Höhle.

	Info_Mod_Brad_Hi_M();
};

FUNC VOID Info_Mod_Brad_Hi_K()
{
	AI_Output(hero, self, "Info_Mod_Brad_Hi_K_15_00"); //Wie bitte? Einen Kopf? Du hast einen Kopf gefunden?

	Info_Mod_Brad_Hi_C();
};

FUNC VOID Info_Mod_Brad_Hi_N()
{
	AI_Output(hero, self, "Info_Mod_Brad_Hi_N_15_00"); //Ich besorge dir die Felle.
	AI_Output(self, hero, "Info_Mod_Brad_Hi_N_18_01"); //Ich habe fast das Gefühl, als wird mir bald wärmer.

	B_LogEntry	(TOPIC_MOD_ANOR_NICK, "Ich soll dem Minotauren Brad 20 Wolfsfelle bringen, damit ihm nicht so kalt in seiner Höhle ist.");

	Mod_Brad_Quest = 1;

	Info_ClearChoices	(Info_Mod_Brad_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Brad_Hi_O()
{
	AI_Output(hero, self, "Info_Mod_Brad_Hi_O_15_00"); //Vergiss es.
	AI_Output(self, hero, "Info_Mod_Brad_Hi_O_18_01"); //Ich denke, ich behalte den Kopf.
	AI_Output(hero, self, "Info_Mod_Brad_Hi_O_15_02"); //Du gibst ihn besser sofort her, oder ich muss dich töten!
	AI_Output(self, hero, "Info_Mod_Brad_Hi_O_18_03"); //(lacht) Das Männlein sieht lustig aus, wenn es wütend ist. Soll es doch herkommen!

	Info_ClearChoices	(Info_Mod_Brad_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

INSTANCE Info_Mod_Brad_Wolfsfelle (C_INFO)
{
	npc		= Mod_10016_MIN_Brad_MT;
	nr		= 1;
	condition	= Info_Mod_Brad_Wolfsfelle_Condition;
	information	= Info_Mod_Brad_Wolfsfelle_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brad_Wolfsfelle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brad_Hi))
	&& (Mod_Brad_Quest == 1)
	&& (Npc_HasItems(hero, ItAt_WolfFur) + Npc_HasItems(hero, ItAt_WolfFur_Rein) >= 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brad_Wolfsfelle_Info()
{
	AI_Output(self, hero, "Info_Mod_Brad_Wolfsfelle_18_00"); //Da betritt schon wieder jemand meine Höhle.
	AI_Output(hero, self, "Info_Mod_Brad_Wolfsfelle_15_01"); //Ich habe die Felle.
	AI_Output(self, hero, "Info_Mod_Brad_Wolfsfelle_18_02"); //Würde das Männchen mir die Felle überlassen, wenn es sie wirklich hat?

	Info_ClearChoices	(Info_Mod_Brad_Wolfsfelle);

	Info_AddChoice	(Info_Mod_Brad_Wolfsfelle, "Hier.", Info_Mod_Brad_Wolfsfelle_B);
	Info_AddChoice	(Info_Mod_Brad_Wolfsfelle, "Erst den Kopf.", Info_Mod_Brad_Wolfsfelle_A);
};

FUNC VOID Info_Mod_Brad_Wolfsfelle_C()
{
	AI_Output(self, hero, "Info_Mod_Brad_Wolfsfelle_C_18_00"); //Ah, das ist schön. Ich denke, ich werde ihm dafür den Kopf geben.

	B_GiveInvItems	(self, hero, ItMi_NicksKopf, 1);

	Mod_Brad_Quest = 2;

	B_LogEntry	(TOPIC_MOD_ANOR_NICK, "Ich habe dem Minotauren Brad die 20 Wolfsfelle gebracht. Ich sollte jetzt zu Nick zurückkehren und ihm seinen Kopf wiedergeben.");

	Info_ClearChoices	(Info_Mod_Brad_Wolfsfelle);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Brad_Wolfsfelle_B()
{
	AI_Output(hero, self, "Info_Mod_Brad_Wolfsfelle_B_15_00"); //Hier.

	var int hlp;
	hlp = Npc_HasItems(hero, ItAt_WolfFur);

	Npc_RemoveInvItems	(hero, ItAt_WolfFur, hlp);
	Npc_RemoveInvItems	(hero, ItAt_WolfFur_Rein, 20 - hlp);

	B_ShowGivenThings	("20 Wolfsfelle gegeben");

	Info_Mod_Brad_Wolfsfelle_C();
};

FUNC VOID Info_Mod_Brad_Wolfsfelle_A()
{
	AI_Output(hero, self, "Info_Mod_Brad_Wolfsfelle_A_15_00"); //Erst den Kopf.
	AI_Output(self, hero, "Info_Mod_Brad_Wolfsfelle_A_18_01"); //Jetzt stellt es auch noch Forderungen! Mir soll endlich warm werden!

	Info_ClearChoices	(Info_Mod_Brad_Wolfsfelle);

	Info_AddChoice	(Info_Mod_Brad_Wolfsfelle, "Erst der Kopf.", Info_Mod_Brad_Wolfsfelle_E);
	Info_AddChoice	(Info_Mod_Brad_Wolfsfelle, "Okay, hier hast du die Felle.", Info_Mod_Brad_Wolfsfelle_D);
};

FUNC VOID Info_Mod_Brad_Wolfsfelle_E()
{
	AI_Output(hero, self, "Info_Mod_Brad_Wolfsfelle_E_15_00"); //Erst der Kopf.
	AI_Output(self, hero, "Info_Mod_Brad_Wolfsfelle_E_18_01"); //Wenn nicht sofort die Felle vor mir liegen bringe ich diesen Wicht um!

	Info_ClearChoices	(Info_Mod_Brad_Wolfsfelle);

	Info_AddChoice	(Info_Mod_Brad_Wolfsfelle, "Okay, hier hast du die Felle.", Info_Mod_Brad_Wolfsfelle_D);
	Info_AddChoice	(Info_Mod_Brad_Wolfsfelle, "Dann komm doch her!", Info_Mod_Brad_Wolfsfelle_F);
};

FUNC VOID Info_Mod_Brad_Wolfsfelle_F()
{
	AI_Output(hero, self, "Info_Mod_Brad_Wolfsfelle_F_15_00"); //Dann komm doch her!
	AI_Output(self, hero, "Info_Mod_Brad_Wolfsfelle_F_18_01"); //Ich mache es platt!

	Info_ClearChoices	(Info_Mod_Brad_Wolfsfelle);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

FUNC VOID Info_Mod_Brad_Wolfsfelle_D()
{
	AI_Output(hero, self, "Info_Mod_Brad_Wolfsfelle_D_15_00"); //Okay, hier hast du die Felle.

	var int hlp;
	hlp = Npc_HasItems(hero, ItAt_WolfFur);

	Npc_RemoveInvItems	(hero, ItAt_WolfFur, hlp);
	Npc_RemoveInvItems	(hero, ItAt_WolfFur_Rein, 20 - hlp);

	B_ShowGivenThings	("20 Wolfsfelle gegeben");

	Info_Mod_Brad_Wolfsfelle_C();
};

INSTANCE Info_Mod_Brad_EXIT (C_INFO)
{
	npc		= Mod_10016_MIN_Brad_MT;
	nr		= 1;
	condition	= Info_Mod_Brad_EXIT_Condition;
	information	= Info_Mod_Brad_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brad_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brad_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};