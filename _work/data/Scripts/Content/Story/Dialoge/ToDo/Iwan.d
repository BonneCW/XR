INSTANCE Info_Mod_Iwan_Hi (C_INFO)
{
	npc		= Mod_7206_NONE_Iwan_NW;
	nr		= 1;
	condition	= Info_Mod_Iwan_Hi_Condition;
	information	= Info_Mod_Iwan_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Iwan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Iwan_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Iwan_Hi_11_00"); //Was, was ist vorgefallen?
	AI_Output(self, hero, "Info_Mod_Iwan_Hi_11_01"); //Die Klinge im Nacken und mein kopfloser Körper sind das letzte woran ich mich erinnere, dann nur noch Fetzen von Wahrnehmungen, Körper und Kopf, wie gefangen, dass allmähliche Schwinden meiner körperlichen und magischen Kräfte.
	AI_Output(self, hero, "Info_Mod_Iwan_Hi_11_02"); //Und jetzt stehe ich wieder lebend hier.
	AI_Output(self, hero, "Info_Mod_Iwan_Hi_11_03"); //(zum Held) Es war dein Verdienst, das spüre ich.
	AI_Output(hero, self, "Info_Mod_Iwan_Hi_15_04"); //Ja, ich habe durchaus meinen Teil dazu beigetragen.
	AI_Output(self, hero, "Info_Mod_Iwan_Hi_11_05"); //Ein begabter Kämpfer und Magier für das Gute musst du sein und meine Unterstützung sollst du bekommen, ehe ich weiter fortfahre, Dämonen und Untote zu jagen und zu vernichten.
	AI_Output(self, hero, "Info_Mod_Iwan_Hi_11_06"); //Hier, nimm dieses Rezept und diese Behälter.

	CreateInvItems	(hero, ItWr_Rezept_Iwan, 1);
	CreateInvItems	(hero, ItMi_Salpeter, 5);

	B_ShowGivenThings	("5 Fläschchen und Rezept erhalten");

	AI_Output(self, hero, "Info_Mod_Iwan_Hi_11_07"); //Sie werden dir hoffentlich eine Hilfe sein, dein Bestreben nach Rechtschaffenheit und Gutem umzusetzen.
	AI_Output(self, hero, "Info_Mod_Iwan_Hi_11_08"); //Wer weiß, vielleicht kreuzen sich eines Tages wieder unsere Wege. Die Götter mögen dich behüten.

	B_GivePlayerXP	(2000);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	AI_Teleport	(self, "TOT");
};