INSTANCE Info_Mod_RitterBeiBrian_Daemonisch (C_INFO)
{
	npc		= Mod_1248_RIT_Ritter_NW;
	nr		= 1;
	condition	= Info_Mod_RitterBeiBrian_Daemonisch_Condition;
	information	= Info_Mod_RitterBeiBrian_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_RitterBeiBrian_Daemonisch_Condition()
{
	if (Mod_HQ_BrianDaemonisch == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_RitterBeiBrian_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_RitterBeiBrian_Daemonisch_11_00"); //Sehr gut, wir haben ihn erwischt.
	AI_Output(hero, self, "Info_Mod_RitterBeiBrian_Daemonisch_15_01"); //Was habt ihr gemacht, warum habt ihr ihn getötet?
	AI_Output(self, hero, "Info_Mod_RitterBeiBrian_Daemonisch_11_02"); //Er ... war ein gesuchter Mörder. Wir haben ihn für seine Tat gerichtet.
	AI_Output(hero, self, "Info_Mod_RitterBeiBrian_Daemonisch_15_03"); //Einfach so mit der Armbrust niedergestreckt.
	AI_Output(self, hero, "Info_Mod_RitterBeiBrian_Daemonisch_11_04"); //Schweig! Worüber habt ihr denn gesprochen? Hat er vielleicht Namen genannt?
	AI_Output(self, hero, "Info_Mod_RitterBeiBrian_Daemonisch_11_05"); //Du musst uns alles erzählen, was er erwähnt hat. Vielleicht hatte er ja Komplizen ...

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Brian schien sehr verängstigt und wollte etwas von der Stadt berichten. Er wurde jedoch von dem Bolzen eines Ritters in die ewigen Jagdgründe geschickt. Sterbend erwähnte er Rupert und warnte mich vor der Finsternis.");

	Info_ClearChoices	(Info_Mod_RitterBeiBrian_Daemonisch);

	Info_AddChoice	(Info_Mod_RitterBeiBrian_Daemonisch, "Nein, ich habe ihn hier gefunden, dann seid ihr gleich aufgetaucht.", Info_Mod_RitterBeiBrian_Daemonisch_B);
	Info_AddChoice	(Info_Mod_RitterBeiBrian_Daemonisch, "Er wollte etwas von der Stadt erzählen, und sagte mir, ich solle mich vor der Finsternis hüten.", Info_Mod_RitterBeiBrian_Daemonisch_A);
};

FUNC VOID Info_Mod_RitterBeiBrian_Daemonisch_B()
{
	AI_Output(hero, self, "Info_Mod_RitterBeiBrian_Daemonisch_B_15_00"); //Nein, ich habe ihn hier gefunden, dann seid ihr gleich aufgetaucht.
	AI_Output(self, hero, "Info_Mod_RitterBeiBrian_Daemonisch_B_11_01"); //Sehr schade. Naja, sei’s drum. Innos zum Gruß.

	Info_ClearChoices	(Info_Mod_RitterBeiBrian_Daemonisch);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_1248_RIT_Ritter_NW, "START");
	B_StartOtherRoutine	(Mod_1249_RIT_Ritter_NW, "START");
	B_StartOtherRoutine	(Mod_1250_RIT_Ritter_NW, "START");
};

FUNC VOID Info_Mod_RitterBeiBrian_Daemonisch_A()
{
	AI_Output(hero, self, "Info_Mod_RitterBeiBrian_Daemonisch_A_15_00"); //Er wollte etwas von der Stadt erzählen, und sagte mir, ich solle mich vor der Finsternis hüten. Er erwähnte auch Rupert ...
	AI_Output(self, hero, "Info_Mod_RitterBeiBrian_Daemonisch_A_11_01"); //Ja, hat er das ... Nun, ist es nicht verwunderlich, dass du dich hier mit ihm getroffen hast.
	AI_Output(self, hero, "Info_Mod_RitterBeiBrian_Daemonisch_A_11_02"); //Du bist bestimmt ein Komplize des Mörders ... und Mörder müssen sofort gerichtet werden.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Die Ritter, die Brian auf dem Gewissen hatten, versuchten mich umzubringen, nachdem ich ihnen preisgab, was Brian mir mitgeteilt hatte.");

	Info_ClearChoices	(Info_Mod_RitterBeiBrian_Daemonisch);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);

	Mod_HQ_BrianDaemonisch = 2;
};