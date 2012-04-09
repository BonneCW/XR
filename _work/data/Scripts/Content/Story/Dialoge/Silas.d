INSTANCE Info_Mod_Silas_Hi (C_INFO)
{
	npc		= Mod_1291_SLD_Silas_MT;
	nr		= 1;
	condition	= Info_Mod_Silas_Hi_Condition;
	information	= Info_Mod_Silas_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bekommst doch bestimmt einiges mit in der Kneipe.";
};

FUNC INT Info_Mod_Silas_Hi_Condition()
{
	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	|| (Npc_HasItems(hero, ItMi_Joint) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Silas_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_15_00"); //Du bekommst doch bestimmt einiges mit in der Kneipe.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_06_01"); //Wenn ich dir was über das Lager erzählen soll, musst du schon 100 Goldmünzen springen lassen oder ...

	AI_PlayAni	(self, "T_SEARCH");

	AI_Output(self, hero, "Info_Mod_Silas_Hi_06_02"); //(in leiserem Ton) ... hast du vielleicht drei Stängel Sumpfkraut?

	Info_ClearChoices	(Info_Mod_Silas_Hi);

	Info_AddChoice	(Info_Mod_Silas_Hi, "Leider nicht ...", Info_Mod_Silas_Hi_D);

	if (Npc_HasItems(hero, ItMi_Joint) >= 3)
	{
		Info_AddChoice	(Info_Mod_Silas_Hi, "Hier hast du drei Stängel.", Info_Mod_Silas_Hi_B);
	};
	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		Info_AddChoice	(Info_Mod_Silas_Hi, "Hier hast du 100 Goldmünzen.", Info_Mod_Silas_Hi_A);
	};
};

FUNC VOID Info_Mod_Silas_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_C_15_00"); //Also, wie sieht’s im Lager aus?
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_01"); //Tja, seit dem Fall der Barriere hat sich so manches verändert im Lager, was auch nicht so verwundern sollte, da ja genau das das ursprüngliche Ziel war, auf welchem der Zusammenhalt des Lagers gründete.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_02"); //Und als auch die Wassermagier weggingen, die viel Autorität, im Lager verkörpert hatten, drohte das Lager auseinander zufallen.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_03"); //Lee, wohl nach wie vor besessen von dem Wunsch Rache an dem König zu üben, wollte das mit allen Mitteln verhindern.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_04"); //Er will  die Kontrolle über so viele kampferprobte Männer nicht so einfach abgeben, da er es als Werkzeug seiner Rache an dem geschwächten König betrachten dürfte.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_05"); //Er überzeugte die Söldner mit davon, dass sie niemals Freiheit erfahren könnten, ehe der König nicht tot sei – na ja, das viele Erz, das die freie Mine nach wie vor abwirft, dürfte einige wohl auch zum Bleiben bewogen haben.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_06"); //Jetzt, da keine Barriere mehr in die Luft gejagt werden muss, dient es als Sold und der Anschaffung neuer Ausrüstung, um eine kampfstarke Truppe aufzubauen.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_07"); //Dazu führte er auch strenge Regeln ein – wie die Einschränkung des Sumpfkrautkonsums – neue Hierarchien und einen harten Drill für die Kämpfer.
	AI_Output(hero, self, "Info_Mod_Silas_Hi_C_15_08"); //Was ist mit diesem Sylvio?
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_09"); //Lee hatte ihm den Posten des 2. Offiziers und den Oberbefehl über die Orkjäger gegeben, da Sylvio ein zäher Kämpfer ist und es versteht mit einer Atmosphäre der Angst die Söldner zu noch mehr Disziplin zu bewegen.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_10"); //Sylvio selbst ist jedoch ein korruptes Drecksschwein und hat von allen mit Abstand den meisten Drecken am Stecken.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_11"); //Er unterschlägt Erz und Nahrungsmittel, welche zum Beispiel für die Bauern gedacht waren und lässt seine Jungs Geschäfte mit dem Alten Lager machen.
	AI_Output(hero, self, "Info_Mod_Silas_Hi_C_15_12"); //Und warum lässt Lee so etwas zu?
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_13"); //Lee hat vor allem seine Rache im Kopf. Vor anderen Dingen scheint er die Augen zu verschließen, solange sie nur irgendwie funktionieren.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_14"); //Außerdem kann man Sylvio auch schwer etwas nachweisen, da er bei allen Missetaten eben seine Jungs vorschickt und sich selbst die Hände nicht schmutzig macht.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_15"); //Nun, das waren wohl die wichtigsten Dinge, die du über das Lager wissen solltest.

	Info_ClearChoices	(Info_Mod_Silas_Hi);
};

FUNC VOID Info_Mod_Silas_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_D_15_00"); //Leider nicht ...
	AI_Output(self, hero, "Info_Mod_Silas_Hi_D_06_01"); //Dann habe ich auch leider keine Informationen für dich.

	Info_ClearChoices	(Info_Mod_Silas_Hi);
};

FUNC VOID Info_Mod_Silas_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_B_15_00"); //Hier hast du drei Stängel.

	B_GiveInvItems	(hero, self, ItMi_Joint, 3);

	AI_Output(self, hero, "Info_Mod_Silas_Hi_B_06_01"); //Ahh, fabelhaft.

	Info_Mod_Silas_Hi_C();
};

FUNC VOID Info_Mod_Silas_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_A_15_00"); //Hier hast du 100 Goldmünzen.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Silas_Hi_A_06_01"); //Ok, gut.

	Info_Mod_Silas_Hi_C();
};

INSTANCE Info_Mod_Silas_Trade (C_INFO)
{
	npc		= Mod_1291_SLD_Silas_MT;
	nr		= 1;
	condition	= Info_Mod_Silas_Trade_Condition;
	information	= Info_Mod_Silas_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Silas_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Silas_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Silas_Trade_Info()
{
	if (Mod_SilasTrader == 0)
	{
		Mod_SilasTrader = 1;

		Log_CreateTopic	(TOPIC_MOD_HÄNDLER_SOELDNER, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HÄNDLER_SOELDNER, "Bei Silas kann ich allerlei Lebensmittel kaufen.");
	};

	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Silas_Pickpocket (C_INFO)
{
	npc		= Mod_1291_SLD_Silas_MT;
	nr		= 1;
	condition	= Info_Mod_Silas_Pickpocket_Condition;
	information	= Info_Mod_Silas_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Silas_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Silas_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Silas_Pickpocket);

	Info_AddChoice	(Info_Mod_Silas_Pickpocket, DIALOG_BACK, Info_Mod_Silas_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Silas_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Silas_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Silas_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Silas_Pickpocket);
};

FUNC VOID Info_Mod_Silas_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Silas_Pickpocket);
};

INSTANCE Info_Mod_Silas_EXIT (C_INFO)
{
	npc		= Mod_1291_SLD_Silas_MT;
	nr		= 1;
	condition	= Info_Mod_Silas_EXIT_Condition;
	information	= Info_Mod_Silas_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Silas_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Silas_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};