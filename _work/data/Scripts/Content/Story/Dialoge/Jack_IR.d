INSTANCE Info_Mod_Jack_IR_Hi (C_INFO)
{
	npc		= Mod_7458_NONE_Jack_IR;
	nr		= 1;
	condition	= Info_Mod_Jack_IR_Hi_Condition;
	information	= Info_Mod_Jack_IR_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jack_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jack_IR_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Jack_IR_Hi_14_00"); //Was für ein finsteres Loch, ist mir gar nicht geheuer.
	AI_Output(self, hero, "Info_Mod_Jack_IR_Hi_14_01"); //Hol dir so schnell wie möglich das, was du auf dieser Insel brauchst und dann nichts wie weg hier.
	AI_Output(hero, self, "Info_Mod_Jack_IR_Hi_15_02"); //Ja, mal schauen, wer mitkommt.
	AI_Output(hero, self, "Info_Mod_Jack_IR_Hi_15_03"); //Ich glaube nicht, dass ein paar kampferprobte Gefährten zur Begleitung verfehlt wären.
	AI_Output(self, hero, "Info_Mod_Jack_IR_Hi_14_04"); //Lass aber noch ein paar zum Schutz des Schiffes zurück.
	AI_Output(self, hero, "Info_Mod_Jack_IR_Hi_14_05"); //Ich will keine ungeladenen Monster und Untote auf meinem Schiff begrüßen müssen, während du mit den anderen die Insel absuchst.
	AI_Output(self, hero, "Info_Mod_Jack_IR_Hi_14_06"); //Die Hälfte kannst du mitnehmen, der Rest bleibt hier. Und mach schnell.
	AI_Output(self, hero, "Info_Mod_Jack_IR_Hi_14_07"); //Ich schau mich während dessen mal im Lagerraum um, ob ich einige Fackeln finde und etwas Grog, gegen die Finsternis und Kälte ...

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "LAGERRAUM");
};

INSTANCE Info_Mod_Jack_IR_Argez (C_INFO)
{
	npc		= Mod_7458_NONE_Jack_IR;
	nr		= 1;
	condition	= Info_Mod_Jack_IR_Argez_Condition;
	information	= Info_Mod_Jack_IR_Argez_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jack_IR_Argez_Condition()
{
	if (Mod_IR_Argez == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jack_IR_Argez_Info()
{
	AI_Output(self, hero, "Info_Mod_Jack_IR_Argez_14_00"); //Nun friss mich doch der Blaubarsch, wir haben einen blinden Passagier an Bord.
	AI_Output(hero, self, "Info_Mod_Jack_IR_Argez_15_01"); //Was, wo?

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ARGEZ");

	Wld_InsertNpc	(PC_Friend_IR, "SHIP_CREW_CAPTAIN");
};

INSTANCE Info_Mod_Jack_IR_Argez2 (C_INFO)
{
	npc		= Mod_7458_NONE_Jack_IR;
	nr		= 1;
	condition	= Info_Mod_Jack_IR_Argez2_Condition;
	information	= Info_Mod_Jack_IR_Argez2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jack_IR_Argez2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_IR_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jack_IR_Argez2_Info()
{
	AI_Output(self, hero, "Info_Mod_Jack_IR_Argez2_14_00"); //Jo, der scheint nicht mehr so schnell wieder auf die Beine zu kommen.
	AI_Output(hero, self, "Info_Mod_Jack_IR_Argez2_15_01"); //Dann werde ich wohl ohne ihn die Insel beschreiten müssen.
	AI_Output(self, hero, "Info_Mod_Jack_IR_Argez2_14_02"); //Ja, mach mal und beeil dich, dass wir hier schnell wieder wegkommen.
	AI_Output(self, hero, "Info_Mod_Jack_IR_Argez2_14_03"); //Ich schaue in der Zwischenzeit, ob ich nicht im Lagerraum etwas finde, das ihm hilft.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "LAGERRAUM");
};

INSTANCE Info_Mod_Jack_IR_Fertig (C_INFO)
{
	npc		= Mod_7458_NONE_Jack_IR;
	nr		= 1;
	condition	= Info_Mod_Jack_IR_Fertig_Condition;
	information	= Info_Mod_Jack_IR_Fertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jack_IR_Fertig_Condition()
{
	if (Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jack_IR_Fertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Jack_IR_Fertig_14_00"); //Hey, ich habe gehört, dass du alles erledigt hast.
	AI_Output(self, hero, "Info_Mod_Jack_IR_Fertig_14_01"); //Für Glückwünsche gibt es ja während der Fahrt noch genug Zeit.
	AI_Output(self, hero, "Info_Mod_Jack_IR_Fertig_14_02"); //Können wir dann endlich wieder in See stechen?
	AI_Output(hero, self, "Info_Mod_Jack_IR_Fertig_15_03"); //Ja, ich wüsste keinen Grund warum nicht.
	AI_Output(self, hero, "Info_Mod_Jack_IR_Fertig_14_04"); //Gut, hier ist der Schlüssel für die Kajüte, hau dich ein wenig aufs Ohr, während ich die Segel setze.

	B_GiveInvItems	(self, hero, ItKe_Irdorath, 1);
};

INSTANCE Info_Mod_Jack_IR_EXIT (C_INFO)
{
	npc		= Mod_7458_NONE_Jack_IR;
	nr		= 1;
	condition	= Info_Mod_Jack_IR_EXIT_Condition;
	information	= Info_Mod_Jack_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jack_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jack_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};