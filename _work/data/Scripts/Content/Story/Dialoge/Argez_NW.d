INSTANCE Info_Mod_Argez_NW_Hi (C_INFO)
{
	npc		= PC_Friend_NW;
	nr		= 1;
	condition	= Info_Mod_Argez_NW_Hi_Condition;
	information	= Info_Mod_Argez_NW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Argez_NW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Argez_NW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Argez_NW_Hi_37_00"); //Ah, ein neues Gesicht. Mit wem habe ich die Ehre?

	Info_ClearChoices	(Info_Mod_Argez_NW_Hi);

	Info_AddChoice	(Info_Mod_Argez_NW_Hi, "Das geht dich nichts an.", Info_Mod_Argez_NW_Hi_B);
	Info_AddChoice	(Info_Mod_Argez_NW_Hi, "Mit einem ehemaligen Gefangenen des Minentals.", Info_Mod_Argez_NW_Hi_A);
};

FUNC VOID Info_Mod_Argez_NW_Hi_C()
{
	AI_Output(self, hero, "Info_Mod_Argez_NW_Hi_C_37_00"); //Gestatten, mein Name ist Argez.
	AI_Output(hero, self, "Info_Mod_Argez_NW_Hi_C_15_01"); //Du siehst nicht gerade zufrieden aus.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Hi_C_37_02"); //Oh, das ist eine längere Geschichte, aber sie endete bei den Stadttoren von Khorinis.
	AI_Output(hero, self, "Info_Mod_Argez_NW_Hi_C_15_03"); //Was ist passiert?
	AI_Output(self, hero, "Info_Mod_Argez_NW_Hi_C_37_04"); //Dort steht ein unsicherer Paladin, der sich durch Härte zu profilieren versucht. Er verwehrte mir den Zugang zur Stadt.
	AI_Output(hero, self, "Info_Mod_Argez_NW_Hi_C_15_05"); //Und wieso lässt er dich nicht rein?
	AI_Output(self, hero, "Info_Mod_Argez_NW_Hi_C_37_06"); //Er fürchtete mich, wie er auch dich fürchten würde. Ich denke, es hängt mit dem Fall der Barriere und den entflohenen Häftlingen zusammen.

	Info_ClearChoices	(Info_Mod_Argez_NW_Hi);

	Info_AddChoice	(Info_Mod_Argez_NW_Hi, "Kann ich dir helfen, in die Stadt zu kommen?", Info_Mod_Argez_NW_Hi_E);
	Info_AddChoice	(Info_Mod_Argez_NW_Hi, "Wo kommst du überhaupt her?", Info_Mod_Argez_NW_Hi_D);
};

FUNC VOID Info_Mod_Argez_NW_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Hi_B_15_00"); //Das geht dich nichts an.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Hi_B_37_01"); //Du hast Recht, ich hätte mich zuerst vorstellen sollen.

	Info_Mod_Argez_NW_Hi_C();
};

FUNC VOID Info_Mod_Argez_NW_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Hi_A_15_00"); //Mit einem ehemaligen Gefangenen des Minentals.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Hi_A_37_01"); //Sieh an, ein weiterer Ausgestoßener.

	Info_Mod_Argez_NW_Hi_C();
};

FUNC VOID Info_Mod_Argez_NW_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Hi_E_15_00"); //Kann ich dir helfen, in die Stadt zu kommen?
	AI_Output(self, hero, "Info_Mod_Argez_NW_Hi_E_37_01"); //Ich bezweifle, dass der genannte Paladin mit sich sprechen lassen wird. Garond ist sein Name.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Hi_E_37_02"); //Solltest du es aber tatsächlich schaffen, biete ich dir im Gegenzug an, mein Wissen mit dir zu teilen.
	AI_Output(hero, self, "Info_Mod_Argez_NW_Hi_E_15_03"); //Was weißt du denn so?
	AI_Output(self, hero, "Info_Mod_Argez_NW_Hi_E_37_04"); //Mehr, als ich wissen dürfte.

	if (!Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Urnol1))
	{
		Log_CreateTopic	(TOPIC_MOD_ARGEZ, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_ARGEZ, LOG_RUNNING);
	};

	B_LogEntry	(TOPIC_MOD_ARGEZ, "Vor den Toren von Khorinis bin ich mit einem Ausgestoßenen ins Gespräch gekommen. Seine Vergangenheit scheint verworren, er versprach mir allerdings Informationen für den Fall, dass Garond ihn in die Stadt lässt. Der Paladin könnte sich jedoch als schwerer Brocken erweisen.");

	Mod_Argez_Choice += 1;

	if (Mod_Argez_Choice == 2)
	{
		Info_ClearChoices	(Info_Mod_Argez_NW_Hi);
	};
};

FUNC VOID Info_Mod_Argez_NW_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Hi_D_15_00"); //Wo kommst du überhaupt her?
	AI_Output(self, hero, "Info_Mod_Argez_NW_Hi_D_37_01"); //Das weiß ich nicht. Diese Information ist ein Teil der eben erwähnten längeren Geschichte.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Hi_D_37_02"); //Ich möchte nicht unhöflich erscheinen, aber zum jetzigen Zeitpunkt sehe ich mich nicht in der Lage, deine Frage umfassend zu beantworten.

	Mod_Argez_Choice += 1;

	if (Mod_Argez_Choice == 2)
	{
		Info_ClearChoices	(Info_Mod_Argez_NW_Hi);
	};
};

INSTANCE Info_Mod_Argez_NW_Follow (C_INFO)
{
	npc		= PC_Friend_NW;
	nr		= 1;
	condition	= Info_Mod_Argez_NW_Follow_Condition;
	information	= Info_Mod_Argez_NW_Follow_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe einen Weg gefunden, dich in die Stadt zu bringen.";
};

FUNC INT Info_Mod_Argez_NW_Follow_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Argez2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_NW_Follow_Info()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Follow_15_00"); //Ich habe einen Weg gefunden, dich in die Stadt zu bringen.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Follow_37_01"); //Ich hatte gehofft, dass du das sagen würdest.
	AI_Output(hero, self, "Info_Mod_Argez_NW_Follow_15_02"); //Wir können das nördliche Stadttor passieren. Lord Andre hat mir versichert, dass es dort keine Probleme geben wird. Ich werde dich führen.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Follow_37_03"); //Oh, ich weiß, wo das Tor ist. Aber wir sollten am besten zusammen dort auftauchen, bevor es zu Missverständnissen kommt.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Follow_37_04"); //Du darfst dabei gern voran laufen.

	self.aivar[AIV_Partymember] = TRUE;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWINCITY");

	Wld_InsertNpc	(Zombie_Argez,	"FP_ROAM_ZOMBIE_ARGEZ");
};

INSTANCE Info_Mod_Argez_NW_Zombie (C_INFO)
{
	npc		= PC_Friend_NW;
	nr		= 1;
	condition	= Info_Mod_Argez_NW_Zombie_Condition;
	information	= Info_Mod_Argez_NW_Zombie_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Argez_NW_Zombie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_NW_Follow))
	&& (Npc_IsDead(Zombie_Argez))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_NW_Zombie_Info()
{
	AI_Output(self, hero, "Info_Mod_Argez_NW_Zombie_37_00"); //(schockiert) War ich es, der diesen tödlichen Schuss abgegeben hat?
	AI_Output(hero, self, "Info_Mod_Argez_NW_Zombie_15_01"); //Ich sehe hier niemanden, der sonst dafür verantwortlich sein könnte.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Zombie_37_02"); //In mir scheint etwas zu schlummern ... Wenn ich mich doch nur erinnern könnte!
	AI_Output(self, hero, "Info_Mod_Argez_NW_Zombie_37_03"); //Und woher kam so plötzlich dieser Zombie?
	AI_Output(hero, self, "Info_Mod_Argez_NW_Zombie_15_04"); //Vielleicht hat er mit diesem schwarzen Wanderer zu tun, der vor kurzem hier vorbeigekommen sein muss?
	AI_Output(self, hero, "Info_Mod_Argez_NW_Zombie_37_05"); //Möglich, auch wenn mir kein solcher schwarzer Wanderer aufgefallen ist.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Zombie_37_06"); //Lass uns weiter zur Stadt gehen, ich brauche jetzt ein wenig Zeit zum Nachdenken.

	hero.protection[PROT_MAGIC] = Mod_Save_HeroArmor_Argez;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Argez_NW_InCity (C_INFO)
{
	npc		= PC_Friend_NW;
	nr		= 1;
	condition	= Info_Mod_Argez_NW_InCity_Condition;
	information	= Info_Mod_Argez_NW_InCity_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Argez_NW_InCity_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_NW_Zombie))
	&& (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_PATH_29_B") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_NW_InCity_Info()
{
	AI_Output(self, hero, "Info_Mod_Argez_NW_InCity_37_00"); //Endlich hinter diesen Mauern. Ich bin dir zu größtem Dank verpflichtet.
	AI_Output(hero, self, "Info_Mod_Argez_NW_InCity_15_01"); //Was wirst du nun tun?
	AI_Output(self, hero, "Info_Mod_Argez_NW_InCity_37_02"); //Ich werde nach Hinweisen auf meine Herkunft suchen. Diese Stadt ist groß - ich bin zuversichtlich, dass mich jemand hier kennt.
	AI_Output(self, hero, "Info_Mod_Argez_NW_InCity_37_03"); //Als Erstes werde ich mich allerdings ausruhen.
	AI_Output(hero, self, "Info_Mod_Argez_NW_InCity_15_04"); //Du hattest mir etwas versprochen ...
	AI_Output(self, hero, "Info_Mod_Argez_NW_InCity_37_05"); //Und das werde ich auch einhalten. Such mich morgen auf, und ich werde dir mit Rat und Tat zur Seite stehen.
	AI_Output(self, hero, "Info_Mod_Argez_NW_InCity_37_06"); //Vermutlich werde ich den größten Teil des Tages in der Nähe des Marktplatzes hier verbringen.
	AI_Output(hero, self, "Info_Mod_Argez_NW_InCity_15_07"); //Alles klar. Bis morgen.

	B_GivePlayerXP	(150);

	B_LogEntry	(TOPIC_MOD_ARGEZ, "Ich habe Argez in die Stadt geführt. Jetzt bin ich auf seine Geschichte gespannt ...");

	Mod_Argez_Day = Wld_GetDay();

	self.aivar[AIV_Partymember] = FALSE;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "RUHE");
};

INSTANCE Info_Mod_Argez_NW_Zombie2 (C_INFO)
{
	npc		= PC_Friend_NW;
	nr		= 1;
	condition	= Info_Mod_Argez_NW_Zombie2_Condition;
	information	= Info_Mod_Argez_NW_Zombie2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du weißt wirklich nicht, wie du diesen Zauber vollbracht hast?";
};

FUNC INT Info_Mod_Argez_NW_Zombie2_Condition()
{
	if (Mod_Argez >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_NW_Zombie2_Info()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Zombie2_15_00"); //Du weißt wirklich nicht, wie du diesen Zauber vollbracht hast?
	AI_Output(self, hero, "Info_Mod_Argez_NW_Zombie2_37_01"); //Als sich der Zombie uns zuwandte, spürte ich, wie etwas in mir hochstieg.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Zombie2_37_02"); //Dieser Spruch entfesselte sich ganz automatisch, ohne mein willentliches Zutun.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Zombie2_37_03"); //Warum ich einen solchen Spruch kenne, kann ich dir nicht sagen. Es beruhigt mich auch nicht gerade, von so einer unkontrollierten Kraft in mir zu wissen.
};

INSTANCE Info_Mod_Argez_NW_ZuSaturas (C_INFO)
{
	npc		= PC_Friend_NW;
	nr		= 1;
	condition	= Info_Mod_Argez_NW_ZuSaturas_Condition;
	information	= Info_Mod_Argez_NW_ZuSaturas_Info;
	permanent	= 0;
	important	= 0;
	description	= "Saturas wünscht ein Gespräch mit dir.";
};

FUNC INT Info_Mod_Argez_NW_ZuSaturas_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Argez2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_NW_ZuSaturas_Info()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_ZuSaturas_15_00"); //Saturas wünscht ein Gespräch mit dir.
	AI_Output(self, hero, "Info_Mod_Argez_NW_ZuSaturas_37_01"); //Der oberste Wassermagier? Was will er von mir?
	AI_Output(hero, self, "Info_Mod_Argez_NW_ZuSaturas_15_02"); //Es geht um den Zauber, mit dem du den Zombie vernichtet hast.
	AI_Output(hero, self, "Info_Mod_Argez_NW_ZuSaturas_15_03"); //Vielleicht kann Saturas dir auch helfen, etwas über deine Vergangenheit herauszufinden.
	AI_Output(self, hero, "Info_Mod_Argez_NW_ZuSaturas_37_04"); //Einen Versuch ist es wert, auch wenn ich deinem Unterton entnehme, dass ihr euch vor dem fürchtet, was ihr über mich zu erfahren versucht.
	AI_Output(self, hero, "Info_Mod_Argez_NW_ZuSaturas_37_05"); //Mein Aufenthalt in der Stadt wird mit dem Gang zu Saturas sein Ende finden.
	AI_Output(self, hero, "Info_Mod_Argez_NW_ZuSaturas_37_06"); //Es scheint, als würde mich hier niemand kennen. Meine Wurzeln müssen woanders liegen.
	AI_Output(self, hero, "Info_Mod_Argez_NW_ZuSaturas_37_07"); //Lass uns also nachsehen, ob Saturas mir etwas Neues zu sagen hat.
	AI_Output(self, hero, "Info_Mod_Argez_NW_ZuSaturas_37_08"); //Kennst du vielleicht eine Abkürzung zur Ausgrabungsstätte? Einen Teleporter oder so?
};

INSTANCE Info_Mod_Argez_NW_LosZuSaturas (C_INFO)
{
	npc		= PC_Friend_NW;
	nr		= 1;
	condition	= Info_Mod_Argez_NW_LosZuSaturas_Condition;
	information	= Info_Mod_Argez_NW_LosZuSaturas_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lass uns aufbrechen.";
};

FUNC INT Info_Mod_Argez_NW_LosZuSaturas_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_NW_ZuSaturas))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_NW_LosZuSaturas_Info()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_LosZuSaturas_15_00"); //Lass uns aufbrechen.
	AI_Output(self, hero, "DEFAULT"); //

	B_LogEntry	(TOPIC_MOD_ARGEZ, "Ich muss Argez nun zu Saturas bringen.");

	AI_StopProcessInfos	(self);

	self.aivar[AIV_Partymember] = TRUE;

	B_StartOtherRoutine	(self, "FOLLOWTOSATURAS");
};

INSTANCE Info_Mod_Argez_NW_Infos (C_INFO)
{
	npc		= PC_Friend_NW;
	nr		= 1;
	condition	= Info_Mod_Argez_NW_Infos_Condition;
	information	= Info_Mod_Argez_NW_Infos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was sind das für Informationen, die du mir geben kannst?";
};

FUNC INT Info_Mod_Argez_NW_Infos_Condition()
{
	if (Mod_Argez == 1)
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_NW_Infos_Info()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Infos_15_00"); //Was sind das für Informationen, die du mir geben kannst?
	AI_Output(self, hero, "Info_Mod_Argez_NW_Infos_37_01"); //Du bist noch neu hier. Ich kenne mich mit den unterschiedlichen Gruppierungen aus.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Infos_37_02"); //Wenn du dich einer Gilde anschließen willst, kann ich dir behilflich sein.
};

INSTANCE Info_Mod_Argez_NW_Gilden (C_INFO)
{
	npc		= PC_Friend_NW;
	nr		= 1;
	condition	= Info_Mod_Argez_NW_Gilden_Condition;
	information	= Info_Mod_Argez_NW_Gilden_Info;
	permanent	= 1;
	important	= 0;
	description	= "Gib mir Informationen zu einer der Gilden.";
};

FUNC INT Info_Mod_Argez_NW_Gilden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_NW_Infos))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_NW_Gilden_Info()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Gilden_15_00"); //Gib mir Informationen zu einer der Gilden.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_37_01"); //Welche weckt dein Interesse?

	Info_ClearChoices	(Info_Mod_Argez_NW_Gilden);

	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, DIALOG_BACK, Info_Mod_Argez_NW_Gilden_BACK);

	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Feuernovizen.", Info_Mod_Argez_NW_Gilden_E);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Miliz.", Info_Mod_Argez_NW_Gilden_D);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Schwarzen Novizen.", Info_Mod_Argez_NW_Gilden_C);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Söldner.", Info_Mod_Argez_NW_Gilden_B);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Wassernovizen.", Info_Mod_Argez_NW_Gilden_A);
};

FUNC VOID Info_Mod_Argez_NW_Gilden_BACK()
{
	Info_ClearChoices	(Info_Mod_Argez_NW_Gilden);
};

FUNC VOID Info_Mod_Argez_NW_Gilden_E()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Gilden_E_15_00"); //Erzähl mir was über die Feuernovizen.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_E_37_01"); //Die Anhänger Innos' haben ihr eigenes Kloster auf der Insel.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_E_37_02"); //Das Leben eines Feuernovizen soll nicht einfach sein; die Magier fordern ein asketisches Leben und völlige Hingabe zu Innos.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_E_37_03"); //Ihre Führung besteht aus einem Triumvirat, aus dem Pyrokar noch einmal als oberster Kopf heraussticht.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_E_37_04"); //Diese drei werden dich eingehend prüfen, wenn du dich entscheidest, dass ein Leben in Innos' Diensten das Richtige für dich ist.

	Info_ClearChoices	(Info_Mod_Argez_NW_Gilden);

	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, DIALOG_BACK, Info_Mod_Argez_NW_Gilden_BACK);

	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Feuernovizen.", Info_Mod_Argez_NW_Gilden_E);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Miliz.", Info_Mod_Argez_NW_Gilden_D);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Schwarzen Novizen.", Info_Mod_Argez_NW_Gilden_C);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Söldner.", Info_Mod_Argez_NW_Gilden_B);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Wassernovizen.", Info_Mod_Argez_NW_Gilden_A);
};

FUNC VOID Info_Mod_Argez_NW_Gilden_D()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Gilden_D_15_00"); //Erzähl mir was über die Miliz.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_D_37_01"); //Die Miliz übernimmt in Khorinis die Funktion der Stadtwache.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_D_37_02"); //Sie sorgt mehr oder weniger dafür, dass hier alles mit rechten Dingen zugeht.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_D_37_03"); //Ihren Anführer Lord Andre durftest du ja schon kennen lernen. Er achtet sehr auf die Disziplin und Kampfkraft seiner Truppe.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_D_37_04"); //Zu diesem Zweck veranstaltet er regelmäßig Turniere mit den neuen Anwärtern.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_D_37_05"); //Wenn du dort bestehen willst, solltest du schon ein einigermaßen erfahrener Kämpfer sein.

	Info_ClearChoices	(Info_Mod_Argez_NW_Gilden);

	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, DIALOG_BACK, Info_Mod_Argez_NW_Gilden_BACK);

	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Feuernovizen.", Info_Mod_Argez_NW_Gilden_E);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Miliz.", Info_Mod_Argez_NW_Gilden_D);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Schwarzen Novizen.", Info_Mod_Argez_NW_Gilden_C);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Söldner.", Info_Mod_Argez_NW_Gilden_B);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Wassernovizen.", Info_Mod_Argez_NW_Gilden_A);
};

FUNC VOID Info_Mod_Argez_NW_Gilden_C()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Gilden_C_15_00"); //Erzähl mir was über die Schwarzen Novizen.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_C_37_01"); //Von denen hört man hier nicht allzu viel.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_C_37_02"); //Zu den Schwarzen Novizen fühlen sich eher die Nonkonformisten der Gesellschaft hingezogen - Beliar verspricht zwar keine Popularität, dafür aber mächtige Zauber.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_C_37_03"); //Außerdem haben sie eines der strengsten Aufnahmeverfahren. Nur wer sich in unzähligen Prüfungen beweist, wird als Novize zugelassen.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_C_37_04"); //Allerdings haben sie auch ein äußerst praktisches Fortbewegungsmittel installiert - die Beliarschreine sind gleichzeitig Teleportationsplattformen.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_C_37_05"); //Du musst sie einzeln anschließen, um sie nutzen zu können.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_C_37_06"); //Gerüchten zufolge soll in der abgesperrten Kanalisation der Stadt ein solcher Schrein stehen.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_C_37_07"); //Er stammt noch aus früheren Zeiten, als Beliaranhänger dort unten dunkle Rituale abhielten.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_C_37_08"); //Wobei ... von dem, was man so hört, scheint die Kanalisation noch nicht ganz verlassen zu sein.

	Info_ClearChoices	(Info_Mod_Argez_NW_Gilden);

	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, DIALOG_BACK, Info_Mod_Argez_NW_Gilden_BACK);

	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Feuernovizen.", Info_Mod_Argez_NW_Gilden_E);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Miliz.", Info_Mod_Argez_NW_Gilden_D);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Schwarzen Novizen.", Info_Mod_Argez_NW_Gilden_C);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Söldner.", Info_Mod_Argez_NW_Gilden_B);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Wassernovizen.", Info_Mod_Argez_NW_Gilden_A);
};

FUNC VOID Info_Mod_Argez_NW_Gilden_B()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Gilden_B_15_00"); //Erzähl mir was über die Söldner.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_B_37_01"); //Einige von ihnen halten sich derzeit auf dem Hof des Großbauern Onar auf. Dort wollen sie neue Mitglieder anwerben.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_B_37_02"); //Die meisten befinden sich jedoch im Minental, in ihrem Lager von der Koloniezeit, das sie das Neue Lager nennen.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_B_37_03"); //Es soll aber auch hier in der Nähe von Khorinis noch Söldnerlager geben.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_B_37_04"); //Du solltest immer die Augen offen halten, dann wirst du ihnen früher oder später über den Weg laufen.

	Info_ClearChoices	(Info_Mod_Argez_NW_Gilden);

	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, DIALOG_BACK, Info_Mod_Argez_NW_Gilden_BACK);

	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Feuernovizen.", Info_Mod_Argez_NW_Gilden_E);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Miliz.", Info_Mod_Argez_NW_Gilden_D);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Schwarzen Novizen.", Info_Mod_Argez_NW_Gilden_C);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Söldner.", Info_Mod_Argez_NW_Gilden_B);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Wassernovizen.", Info_Mod_Argez_NW_Gilden_A);
};

FUNC VOID Info_Mod_Argez_NW_Gilden_A()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Gilden_A_15_00"); //Erzähl mir was über die Wassernovizen.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_A_37_01"); //Die Wassernovizen dienen im Kreis des Wassers.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_A_37_02"); //Soweit ich es mitbekomme, ist die Hauptaufgabe des Kreises des Wassers die Informationsbeschaffung.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_A_37_03"); //Während die Wassermagier über ihren uralten Rätseln hocken, um in Adanos' Sinn das Gleichgewicht der Welt zu bewahren, halten die Novizen Augen und Ohren offen.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_A_37_04"); //Die meisten ihrer Anhänger findest du deshalb auch in Khorinis.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_A_37_05"); //Momentan beschäftigen sie sich mit einer Reihe von Vermisstenmeldungen.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Gilden_A_37_06"); //Wenn dich das Thema interessiert, dürfte Vatras am Tempelplatz der richtige Ansprechpartner für dich sein.

	Info_ClearChoices	(Info_Mod_Argez_NW_Gilden);

	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, DIALOG_BACK, Info_Mod_Argez_NW_Gilden_BACK);

	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Feuernovizen.", Info_Mod_Argez_NW_Gilden_E);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Miliz.", Info_Mod_Argez_NW_Gilden_D);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Schwarzen Novizen.", Info_Mod_Argez_NW_Gilden_C);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Söldner.", Info_Mod_Argez_NW_Gilden_B);
	Info_AddChoice	(Info_Mod_Argez_NW_Gilden, "Erzähl mir was über die Wassernovizen.", Info_Mod_Argez_NW_Gilden_A);
};

INSTANCE Info_Mod_Argez_NW_Geschichte (C_INFO)
{
	npc		= PC_Friend_NW;
	nr		= 1;
	condition	= Info_Mod_Argez_NW_Geschichte_Condition;
	information	= Info_Mod_Argez_NW_Geschichte_Info;
	permanent	= 0;
	important	= 0;
	description	= "Erzähl mir deine Geschichte!";
};

FUNC INT Info_Mod_Argez_NW_Geschichte_Condition()
{
	if (Mod_Argez >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_NW_Geschichte_Info()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Geschichte_15_00"); //Erzähl mir deine Geschichte!
	AI_Output(self, hero, "Info_Mod_Argez_NW_Geschichte_37_01"); //Ich kann mich nicht an meine Vergangenheit erinnern.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Geschichte_37_02"); //Es gibt ... Erinnerungsfetzen, die durch bestimmte Ereignisse ausgelöst werden, aber sie sind nie eindeutig genug.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Geschichte_37_03"); //Vor ein paar Monaten wachte ich in zerlumpter Kleidung in einer Höhle in den Bergen auf.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Geschichte_37_04"); //Vermutlich war ich überfallen, bewusstlos geschlagen und zum Sterben liegen gelassen worden.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Geschichte_37_05"); //Zuerst irrte ich orientierungslos umher. Nach einigen Tagen stieß ich auf einen der umliegenden Bauernhöfe und verdingte mich fortan als Knecht.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Geschichte_37_06"); //Ich beobachtete viel und fragte die Händler aus, die am Hof rasteten.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Geschichte_37_07"); //So erfuhr ich vom aktuellen Geschehen, und auch mein Wissen um die Gilden stammt aus diesen Monaten.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Geschichte_37_08"); //Die Suche nach meiner Vergangenheit ließ mir jedoch keine Ruhe, und so verließ ich den Hof irgendwann und schlug mich zur Stadt durch.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Geschichte_37_09"); //Den Rest der Geschichte kennst du.
};

INSTANCE Info_Mod_Argez_NW_Tattoo (C_INFO)
{
	npc		= PC_Friend_NW;
	nr		= 1;
	condition	= Info_Mod_Argez_NW_Tattoo_Condition;
	information	= Info_Mod_Argez_NW_Tattoo_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist das für eine Tätowierung in deinem Gesicht?";
};

FUNC INT Info_Mod_Argez_NW_Tattoo_Condition()
{
	if (Mod_Argez >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_NW_Tattoo_Info()
{
	AI_Output(hero, self, "Info_Mod_Argez_NW_Tattoo_15_00"); //Was ist das für eine Tätowierung in deinem Gesicht?
	AI_Output(self, hero, "Info_Mod_Argez_NW_Tattoo_37_01"); //Ich konnte sie bisher nicht genau betrachten, da ich sie nur in Wasserspiegelungen gesehen habe.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Tattoo_37_02"); //Den einzigen Anhaltspunkt, den sie mir gibt, ist das Sumpflager im Minental. Dort sind Tätowierungen sehr verbreitet.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Tattoo_37_03"); //Allerdings gab es wohl keine Möglichkeit, der Barriere zu entrinnen, und ich bin außerhalb von ihr aufgewacht.
	AI_Output(self, hero, "Info_Mod_Argez_NW_Tattoo_37_04"); //Folglich kann ich kaum mit dem Sumpflager in Kontakt gestanden haben.
};

INSTANCE Info_Mod_Argez_NW_EXIT (C_INFO)
{
	npc		= PC_Friend_NW;
	nr		= 1;
	condition	= Info_Mod_Argez_NW_EXIT_Condition;
	information	= Info_Mod_Argez_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Argez_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Argez_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};