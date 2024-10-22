INSTANCE Info_Mod_Hyglas_EIS_Feuersbrunst (C_INFO)
{
	npc		= Mod_7793_KDF_Hyglas_EIS;
	nr		= 1;
	condition	= Info_Mod_Hyglas_EIS_Feuersbrunst_Condition;
	information	= Info_Mod_Hyglas_EIS_Feuersbrunst_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hyglas_EIS_Feuersbrunst_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hyglas_EIS_Feuersbrunst_Info()
{
	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst_14_00"); //Was in Innos Namen?! Täuschen mich meine Sinne? Du hier?! Ich war mir sicher, du seiest durch das Portal entkommen ... 
	AI_Output(hero, self, "Info_Mod_Hyglas_EIS_Feuersbrunst_15_01"); //Meister Hyglas?! Wie ist das möglich? Wir dachten alle, du seiest tot.
	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst_14_02"); //Was, aber ... dann wurdest du von den Magiern geschickt, um mich hier rauszuholen?
	AI_Output(hero, self, "Info_Mod_Hyglas_EIS_Feuersbrunst_15_03"); //Ähhm, nicht direkt. Andere Ereignisse führten mich über die Steinkreise in diese Gegend ...
	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst_14_04"); //Die Steinkreise ... ich verstehe, ihr habt gelernt euch dieser Portale zu bedienen.
	AI_Output(hero, self, "Info_Mod_Hyglas_EIS_Feuersbrunst_15_05"); //Ja, gewissermaßen. Aber wie kommt es, dass du jetzt in dieser Höhle weilst?
	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst_14_06"); //Nachdem ich alle meine Magie konzentriert hatte, und die Höhle mit einer Feuerbrunst zum Einsturz brachte, fand ich mich plötzlich im Freien wieder.
	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst_14_07"); //Die Decke der Höhle über mir war nur wenig massiv gewesen und die Hitze schmolz den Schnee augenblicklich.
	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst_14_08"); //Ich irrte nur kurz durch die Gegend, als ich schon auf wilde Tiere stieß, und erneut von meiner Magie Gebrauch machen musste, wie noch oft, seit damals ... zum Glück wurde ich vor meiner Mission mit vielen Manatränken eingedeckt.
	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst_14_09"); //Jedenfalls war ich in dieser unwirklichen Gegend recht desorientiert und da ein starker Schneesturm aufzuziehen begann, suchte ich mir die nächste Höhle, und ließ mich in ihr nieder.
	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst_14_10"); //Und diese ist seitdem mein Zuhause ...
	AI_Output(hero, self, "Info_Mod_Hyglas_EIS_Feuersbrunst_15_11"); //Verstehe. Und da diese Gegend nicht so dicht besiedelt ist, bist du auch noch keinem Einheimischen begegnet.
	AI_Output(hero, self, "Info_Mod_Hyglas_EIS_Feuersbrunst_15_12"); //Wie dem auch sei, auf alle Fälle bin ich froh, dich hier lebend anzutreffen.
	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst_14_13"); //Glaub mir, meine Freude darüber ist nicht minder gering. Und du sagtest, diese trostlose Einöde sei besiedelt?
	AI_Output(hero, self, "Info_Mod_Hyglas_EIS_Feuersbrunst_15_14"); //Ja, nicht weit von hier im Nordwesten liegt ein Dorf. Gleich dahinter ist auch der Steinkreis, über welchen ich hierher gelangt bin und über welchen auch die Rückreise nach Khorinis möglich ist.
	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst_14_15"); //Es freut mich ungemein, dass zu hören. Die letzten Tage und Wochen standen ausschließlich gebratene Wildtiere auf meinem Speiseplan und der Komfort in der Höhle war auch nicht gerade groß.
	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst_14_16"); //Wenn es dir nichts ausmacht, würde ich gerne ohne Verzug zum Dorf aufbrechen.
	AI_Output(hero, self, "Info_Mod_Hyglas_EIS_Feuersbrunst_15_17"); //Natürlich. Folge mir!
	AI_Output(self, hero, "DEFAULT"); //

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");

	B_LogEntry	(TOPIC_MOD_FM_FEUERSBRUNST, "Der vermeintliche Dämon hat sich als Meister Hyglas entpuppt, der nach dem Einsturz der Eishöhle in dieser Gegend festsaß. Ich werde ihn zum Dorf bringen.");
};

INSTANCE Info_Mod_Hyglas_EIS_Feuersbrunst2 (C_INFO)
{
	npc		= Mod_7793_KDF_Hyglas_EIS;
	nr		= 1;
	condition	= Info_Mod_Hyglas_EIS_Feuersbrunst2_Condition;
	information	= Info_Mod_Hyglas_EIS_Feuersbrunst2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hyglas_EIS_Feuersbrunst2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_EIS_Feuersbrunst))
	&& (Npc_GetDistToWP(hero, "EIS_76") < 1000)
	&& (Mod_FM_Hyglas_Eisgebiet == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hyglas_EIS_Feuersbrunst2_Info()
{
	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst2_14_00"); //Das ist also das Dorf ...
	AI_Output(hero, self, "Info_Mod_Hyglas_EIS_Feuersbrunst2_15_01"); //Ja. Weiter hinten findest du in einem Haus den Dorfältesten Thys. Er wird dir bei allem weiteren helfen können.
	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst2_14_02"); //Ich weiß nicht, wie ich dir danken soll.
	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst2_14_03"); //Ein kleiner Anfang sind vielleicht einige meiner letzten Manatränke, die ich nun nicht mehr benötige ... an Snapperfleisch wirst du wohl weniger Interesse haben.

	CreateInvItems	(hero, ItPo_Mana_03, 5);
	CreateInvItems	(hero, ItPo_Mana_Addon_04, 1);

	B_ShowGivenThings	("5 Manaelixiere und 1 Reines Mana erhalten");

	AI_Output(self, hero, "Info_Mod_Hyglas_EIS_Feuersbrunst2_14_04"); //Wie dem auch sei, ich werde mich direkt an Thys wenden und alles weitere mit ihm besprechen. Innos sei mit dir.

	B_GivePlayerXP	(300);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATTHYS");
	B_StartOtherRoutine	(Mod_1954_EIS_Thys_EIS, "ATTHYS");

	Mod_FM_Hyglas_Eisgebiet = 1;
	Mod_FM_Hyglas_Eisgebiet_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Hyglas_EIS_EXIT (C_INFO)
{
	npc		= Mod_7793_KDF_Hyglas_EIS;
	nr		= 1;
	condition	= Info_Mod_Hyglas_EIS_EXIT_Condition;
	information	= Info_Mod_Hyglas_EIS_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hyglas_EIS_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hyglas_EIS_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};