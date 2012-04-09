INSTANCE Info_Mod_WirtEisgebiet_Rattenquest (C_INFO)
{
	npc		= Mod_7407_OUT_Wirt_EIS;
	nr		= 1;
	condition	= Info_Mod_WirtEisgebiet_Rattenquest_Condition;
	information	= Info_Mod_WirtEisgebiet_Rattenquest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Habt ihr in letzter Zeit vielleicht zufällig ein Rattenproblem?";
};

FUNC INT Info_Mod_WirtEisgebiet_Rattenquest_Condition()
{
	if (Mod_RattenQuest == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_WirtEisgebiet_Rattenquest_Info()
{
	AI_Output(hero, self, "Info_Mod_WirtEisgebiet_Rattenquest_15_00"); //Habt ihr in letzter Zeit vielleicht zufällig ein Rattenproblem?
	AI_Output(self, hero, "Info_Mod_WirtEisgebiet_Rattenquest_14_01"); //Wir haben doch kein Problem mit Ratten. Einmal fest Draufgeschlagen und schon ist das Viech tot.
	AI_Output(hero, self, "Info_Mod_WirtEisgebiet_Rattenquest_15_02"); //Nein, so meinte ich das nicht. Ich meinte, ob sie in letzter Ziet vermehrt auftauchen.
	AI_Output(self, hero, "Info_Mod_WirtEisgebiet_Rattenquest_14_03"); //Na ja, bei uns hier in der Stadt nicht, aber einer der Jäger, ich glaube Burl war sein Name, hat mal was von Ratten erzählt.
	AI_Output(hero, self, "Info_Mod_WirtEisgebiet_Rattenquest_15_04"); //Und wo ist dieser Burl?
	AI_Output(self, hero, "Info_Mod_WirtEisgebiet_Rattenquest_14_05"); //Ich glaube der ist im Hotel, der hat gestern Abend ganz schön gesoffen.
	AI_Output(self, hero, "Info_Mod_WirtEisgebiet_Rattenquest_14_06"); //Du kannst ja mal schauen, ob er jetzt wieder fit ist.
	AI_Output(hero, self, "Info_Mod_WirtEisgebiet_Rattenquest_15_07"); //Danke, dann geh ich mal gleich zu ihm.

	B_LogEntry	(TOPIC_MOD_RATTENQUEST, "In der Stadt hier ist nichts vorgefallen, jedoch hat ein Jäger namens Burl von Ratten gesprochen. Er soll sich zur Zeit im Hotel aufhalten, wo er seinen Rausch ausschläft.");

	Mod_RattenQuest = 5;
};

INSTANCE Info_Mod_WirtEisgebiet_EXIT (C_INFO)
{
	npc		= Mod_7407_OUT_Wirt_EIS;
	nr		= 1;
	condition	= Info_Mod_WirtEisgebiet_EXIT_Condition;
	information	= Info_Mod_WirtEisgebiet_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_WirtEisgebiet_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_WirtEisgebiet_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};