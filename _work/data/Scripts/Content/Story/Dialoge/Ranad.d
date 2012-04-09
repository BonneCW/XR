INSTANCE Info_Mod_Ranad_Hi (C_INFO)
{
	npc		= Mod_10006_Orc_Ranad_MT;
	nr		= 1;
	condition	= Info_Mod_Ranad_Hi_Condition;
	information	= Info_Mod_Ranad_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ranad_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ranad_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Ranad_Hi_18_00"); //Fremder seien gegrüßt von mir.

	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Ranad_Hi_18_02"); //Ich seien Ranad.
};

INSTANCE Info_Mod_Ranad_WasHier (C_INFO)
{
	npc		= Mod_10006_Orc_Ranad_MT;
	nr		= 1;
	condition	= Info_Mod_Ranad_WasHier_Condition;
	information	= Info_Mod_Ranad_WasHier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ur Shak schickt mich.";
};

FUNC INT Info_Mod_Ranad_WasHier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ranad_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_UrShak_Foki))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ranad_WasHier_Info()
{
	AI_Output(hero, self, "Info_Mod_Ranad_WasHier_15_00"); //Ur Shak schickt mich. Du sollst mir die Infos über die Pläne der Orks in der Orkstadt geben.
	AI_Output(self, hero, "Info_Mod_Ranad_WasHier_18_01"); //Orks sammeln Fokus. Sie schon haben zwei.
	AI_Output(hero, self, "Info_Mod_Ranad_WasHier_15_02"); //Was ist mit dem Schutzzauber? Der sollte verhindern, dass die Foki einfach mitgenommen werden können.
	AI_Output(self, hero, "Info_Mod_Ranad_WasHier_18_03"); //Orks haben viele mächtige Schamanen. Sicher sie haben Möglichkeit gefunden zu knacken Zauber.
	AI_Output(hero, self, "Info_Mod_Ranad_WasHier_15_04"); //Und was können wir jetzt machen?
	AI_Output(self, hero, "Info_Mod_Ranad_WasHier_18_05"); //Ich können machen falsches Fokus. So ich haben getauscht eine Fokus von ihnen.
	AI_Output(self, hero, "Info_Mod_Ranad_WasHier_18_06"); //Ich noch haben weitere vier falsche Fokus. Doch böse Orks nur haben eine Fokus. Hosh Pak immer tragen bei sich.
	AI_Output(hero, self, "Info_Mod_Ranad_WasHier_15_07"); //Dann sollten wir versuchen den Fokus irgendwie aus der Obhut von Hosh Pak zu bekommen.
	AI_Output(self, hero, "Info_Mod_Ranad_WasHier_18_08"); //Hosh Pak nicht wird geben weg Fokus. Wir müssen machen tot. Wir können tarnen und und dringen ein in Stadt von Orks. Haben große Stadt, auch unter Erde.
	AI_Output(self, hero, "Info_Mod_Ranad_WasHier_18_09"); //Ich werden geben Hosh Pak drei falsche Fokus. Dann er werden denken er können machen Ritual für KRUSHAK.
	AI_Output(self, hero, "Info_Mod_Ranad_WasHier_18_10"); //Dann wir werden greifen an und holen uns letztes Fokus. Freund müssen kommen mit in Stadt, doch böse Orks werden nicht lassen.
	AI_Output(self, hero, "Info_Mod_Ranad_WasHier_18_11"); //Freund gehen zu Tarrok. Er können machen Ulu-Mulu für Freund. Wenn Freund seien in Stadt von Orks, er greifen an Hosh Pak. Wenn Freund greifen an Hosh Pak, wir werden helfen Freund.
	AI_Output(self, hero, "Info_Mod_Ranad_WasHier_18_12"); //Hier Freund noch haben meine Fokus.

	B_GiveInvItems	(self, hero, ItMi_Focus_Stonehenge, 1);

	B_StartOtherRoutine	(Mod_10002_Orc_HoshPak_MT, "TOT");

	B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Der Ork Ranad hat bereits einen Fokus von den Orks gestohlen und dafür einen falschen dort gelassen. Die Orks haben nur noch einen weiteren Fokusstein und den trägt Hosh Pak immer bei sich. Um an diesen Fokusstein zu kommen, müssen wir Hosh Pak töten. Ranad wird ihm die anderen falschen Foki bringen, damit Hosh Pak das Ritual machen kann und ich soll ihn dann attackieren. Um in die Orkstadt zu kommen, brauche ich allerdings ein Ulu-Mulu. Tarrok wird mir eins herstellen können.");
};

INSTANCE Info_Mod_Ranad_Tarrok (C_INFO)
{
	npc		= Mod_10006_Orc_Ranad_MT;
	nr		= 1;
	condition	= Info_Mod_Ranad_Tarrok_Condition;
	information	= Info_Mod_Ranad_Tarrok_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo finde ich Tarrok?";
};

FUNC INT Info_Mod_Ranad_Tarrok_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ranad_WasHier))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Tarrok_AtStonehenge))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ranad_Tarrok_Info()
{
	AI_Output(hero, self, "Info_Mod_Ranad_Tarrok_15_00"); //Wo finde ich Tarrok?
	AI_Output(self, hero, "Info_Mod_Ranad_Tarrok_18_01"); //Tarrok haben Spezialauftrag von Ur Shak. Sollen finden Fokus aus Stonehenge.
	AI_Output(hero, self, "Info_Mod_Ranad_Tarrok_15_02"); //Aber den hast du mir doch gegeben?
	AI_Output(self, hero, "Info_Mod_Ranad_Tarrok_18_03"); //Seien Fokus ich gestohlen von Orks in Stadt. Ich erst zurück gekommen bin, als Tarrok schon weg.

	B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Ich finde Tarrok beim Stonehenge.");
};

INSTANCE Info_Mod_Ranad_EXIT (C_INFO)
{
	npc		= Mod_10006_Orc_Ranad_MT;
	nr		= 1;
	condition	= Info_Mod_Ranad_EXIT_Condition;
	information	= Info_Mod_Ranad_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ranad_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ranad_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};