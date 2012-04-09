INSTANCE Info_Mod_UndeadOrkShamane_OGY_Hi (C_INFO)
{
	npc		= Mod_10033_ORC_UndeadShamane_OGY;
	nr		= 1;
	condition	= Info_Mod_UndeadOrkShamane_OGY_Hi_Condition;
	information	= Info_Mod_UndeadOrkShamane_OGY_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_UndeadOrkShamane_OGY_Hi_Condition()
{
	if (Mod_NL_UOS == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_UndeadOrkShamane_OGY_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_UndeadOrkShamane_OGY_Hi_15_00"); //Wurmzerfressener Unhold. Lange genug hast du dich durch feige Flucht meinem Zugriff entzogen. Nun mache ich dir ein für alle mal den Garaus.
	AI_Output(self, hero, "Info_Mod_UndeadOrkShamane_OGY_Hi_18_01"); //In die Ecke getrieben magst du mich haben, doch wirst du nicht meine Barriere überschreiten können.
	AI_Output(self, hero, "Info_Mod_UndeadOrkShamane_OGY_Hi_18_02"); //Und hüten solltest du dich zu versuchen mir oder meinen Dienern Schaden zuzufügen, da ich die Geiseln hier sonst alle hinschlachten lassen werde.

	B_LogEntry	(TOPIC_MOD_SLD_FRIEDHOF, "Na toll. Jetzt habe ich den verwesenden Schamanen endlich gestellt und nun verhindern seine Barriere und die Geiseln, dass ich ihn endlich erledigen kann und das Buch bekomme. Bei so viel schwarzer Magie sollte ich entweder einen kundigen Magier um Rat fragen, oder gleich kompromisslos mit allen mir zur Verfügung stehenden Mitteln durchgreifen. Man kann ja nie wissen ...");

	AI_StopProcessInfos	(self);

	Mod_NL_UOS = 6;

	self.flags = 0;
};