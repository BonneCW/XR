INSTANCE Info_Mod_Argibast_Hi (C_INFO)
{
	npc		= GardeInnos_4050_Argibast;
	nr		= 1;
	condition	= Info_Mod_Argibast_Hi_Condition;
	information	= Info_Mod_Argibast_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Argibast_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Argibast_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Argibast_Hi_02_00"); //Sieh an, wen haben wir denn hier? Du hast diesen Beliaranhängern geholfen, unseren Belagerungsring zu zerstören. Dafür wirst du im Namen Innos' bezahlen!
	AI_Output(hero, self, "Info_Mod_Argibast_Hi_15_01"); //Schweig, du Ausgeburt der Hölle! Ihr dient nicht Innos, sondern euch selbst!
	AI_Output(self, hero, "Info_Mod_Argibast_Hi_02_02"); //Wie kannst du es wagen ...?
	AI_Output(hero, self, "Info_Mod_Argibast_Hi_15_03"); //Ich werde euch im Namen Beliars aufhalten!
	AI_Output(self, hero, "Info_Mod_Argibast_Hi_02_04"); //Tu das. Selbst wenn du mich besiegen solltest, was jedoch nie passieren wird, kannst du die anderen nicht aufhalten.
	AI_Output(self, hero, "Info_Mod_Argibast_Hi_02_05"); //Schon bald werden sie das Schwert Innos' gefunden haben!
	AI_Output(hero, self, "Info_Mod_Argibast_Hi_15_06"); //Das was?
	AI_Output(self, hero, "Info_Mod_Argibast_Hi_02_07"); //Deine Reise endet hier, kleiner Mensch!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);

	B_LogEntry	(TOPIC_MOD_BEL_GARDEINNOS, "Argibast, ein Mitglied der Garde Innos', hat erzählt, dass die anderen Gardisten nach dem Schwert Innos' suchen. Das klingt nicht gut.");
};