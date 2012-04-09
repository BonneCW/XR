INSTANCE Info_Mod_HofstaatKoenig_MT_AtStrand (C_INFO)
{
	npc		= Mod_7331_HS_Koenig_MT;
	nr		= 1;
	condition	= Info_Mod_HofstaatKoenig_MT_AtStrand_Condition;
	information	= Info_Mod_HofstaatKoenig_MT_AtStrand_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatKoenig_MT_AtStrand_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatKoenig_MT_AtStrand_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_MT_AtStrand_06_00"); //Es ist ... Unbeschreiblich schön. Ich würde alles tun um ein Bündnis mit diesem stolzen Land zu erzielen.
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_MT_AtStrand_15_01"); //Dazu müsst ihr lediglich dem stolzen Volk des Sumpfes absolute finanzielle Sicherheit gewähren.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_MT_AtStrand_06_02"); //So sei es! Kehrwisch, ihr habt mich nicht enttäuscht. Ihr habt eurem König wieder glücklich gemacht!
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_MT_AtStrand_06_03"); //Kommt nachts wieder, da werden wir ein Fest feiern, wie noch nie zuvor ein Fest gefeiert wurde!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FEST");
};

INSTANCE Info_Mod_HofstaatKoenig_MT_Fest (C_INFO)
{
	npc		= Mod_7331_HS_Koenig_MT;
	nr		= 1;
	condition	= Info_Mod_HofstaatKoenig_MT_Fest_Condition;
	information	= Info_Mod_HofstaatKoenig_MT_Fest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatKoenig_MT_Fest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatKoenig_MT_AtStrand))
	&& (Wld_IsTime(21,00,07,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatKoenig_MT_Fest_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_MT_Fest_06_00"); //Kehrwisch! Da seid ihr ja! Seht ihr das? Alles zu euren Ehren!
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_MT_Fest_06_01"); //Wir feiern hier jetzt nicht nur das Bündnis der Bruderschaft des Sumpfes und de, Hofstaat.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_MT_Fest_06_02"); //Wir feiern auch eure Beförderung! Der Höchste Titel des Reiches soll euch nun zieren.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_MT_Fest_06_03"); //Von diesem Tag an und bis in alle Ewigkeit sollt ihr bekannt sein als der königliche Bademeister!
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_MT_Fest_06_04"); //Und nun lasst uns feiern als ob es kein morgen gäbe, hier an diesem Strand ... dem Freistrand!

	B_SetTopicStatus	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, LOG_SUCCESS);
	B_GivePlayerXP	(1500);
};

INSTANCE Info_Mod_HofstaatKoenig_MT_EXIT (C_INFO)
{
	npc		= Mod_7331_HS_Koenig_MT;
	nr		= 1;
	condition	= Info_Mod_HofstaatKoenig_MT_EXIT_Condition;
	information	= Info_Mod_HofstaatKoenig_MT_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatKoenig_MT_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatKoenig_MT_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};