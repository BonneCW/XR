INSTANCE Info_Mod_Brahim_Hi (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Hi_Condition;
	information	= Info_Mod_Brahim_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brahim_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Hi_07_00"); //Hey, Fremder, brauchst du eine Karte? Ich hab eine für dich im Angebot.
	AI_Output(self, hero, "Info_Mod_Brahim_Hi_07_01"); //Handgezeichnet auf Jungfernpergament. So was findest du nirgendwo anders.
	AI_Output(hero, self, "Info_Mod_Brahim_Hi_15_02"); //Du handelst also auch mit ehemaligen Sträflingen?
	AI_Output(self, hero, "Info_Mod_Brahim_Hi_07_03"); //Klar doch. Du willst gar nicht wissen, wem ich schon Karten verkauft hab.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Brahim verkauft Karten.");
};

INSTANCE Info_Mod_Brahim_ThorbenLehrling (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_ThorbenLehrling_Condition;
	information	= Info_Mod_Brahim_ThorbenLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Thorben und ich benötigen deine Hilfe.";
};

FUNC INT Info_Mod_Brahim_ThorbenLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling_15_00"); //Thorben und ich benötigen deine Hilfe.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling_07_01"); //Wo drückt der Schuh?
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling_15_02"); //Wir brauchen die Zeichnung von einem Festtisch. Thorben sagt, du schuldest ihm noch was.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling_07_03"); //Unglücklicherweise ja. (seufzt) Also gut, ich werd mich nachher darum kümmern. Morgen kannst du sie abholen.
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling_15_04"); //Dann bis morgen.

	B_LogEntry	(TOPIC_MOD_LEHRLING_THORBEN_TWO, "Brahim hat zugestimmt. Er braucht jedoch einen Tag für die Zeichnung.");

	Mod_Thorben_Brahim = Wld_GetDay();
};

INSTANCE Info_Mod_Brahim_ThorbenLehrling2 (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_ThorbenLehrling2_Condition;
	information	= Info_Mod_Brahim_ThorbenLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du fertig?";
};

FUNC INT Info_Mod_Brahim_ThorbenLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_ThorbenLehrling))
	&& (Mod_Thorben_Brahim < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling2_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling2_15_00"); //Bist du fertig?
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling2_07_01"); //Darauf kannst du dich verlassen. Nimm schon.

	B_GiveInvItems	(self, hero, ItWr_Zeichnung_Tisch, 1);

	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling2_15_02"); //Vielen Dank.
};

INSTANCE Info_Mod_Brahim_ThorbenLehrling3 (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_ThorbenLehrling3_Condition;
	information	= Info_Mod_Brahim_ThorbenLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hätte gern noch eine weitere Zeichnung.";
};

FUNC INT Info_Mod_Brahim_ThorbenLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gritta_ThorbenLehrling))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 50)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_15_00"); //Ich hätte gern noch eine weitere Zeichnung.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_07_01"); //Oh nein! Diesmal gibt's die aber nicht umsonst.
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_15_02"); //Wie viel?
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_07_03"); //50 Goldstücke.
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_15_04"); //Fertige mir die Skizze.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_07_05"); //Und was soll ich skizzieren?
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_15_06"); //Ein kleines ... äh ...

	Info_ClearChoices	(Info_Mod_Brahim_ThorbenLehrling3);

	Info_AddChoice	(Info_Mod_Brahim_ThorbenLehrling3, "Irgendwas Dekoratives. Denk dir was aus.", Info_Mod_Brahim_ThorbenLehrling3_C);
	Info_AddChoice	(Info_Mod_Brahim_ThorbenLehrling3, "Einen Bierkrug.", Info_Mod_Brahim_ThorbenLehrling3_B);
	Info_AddChoice	(Info_Mod_Brahim_ThorbenLehrling3, "Ein verziertes Schmuckkästchen.", Info_Mod_Brahim_ThorbenLehrling3_A);
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_D()
{
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_D_07_00"); //Alles klar ... Hast dich unter den Frauen umgesehen oder was?
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_D_15_01"); //Thorben liegt im Koma. Ich will ihn etwas aufmuntern, wenn er aufwacht.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_D_07_02"); //Mann, Scheiße! Thorben? Ich werd mir besonders Mühe geben.
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_D_15_03"); //Danke. Man sieht sich.

	Info_ClearChoices	(Info_Mod_Brahim_ThorbenLehrling3);

	Mod_Thorben_Present_Day = Wld_GetDay();
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_C()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_C_15_00"); //Irgendwas Dekoratives. Denk dir was aus.

	Mod_Thorben_Present = 3;

	Info_Mod_Brahim_ThorbenLehrling3_D();
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_B()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_B_15_00"); //Einen Bierkrug.

	Mod_Thorben_Present = 2;

	Info_Mod_Brahim_ThorbenLehrling3_D();
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_A()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_A_15_00"); //Ein verziertes Schmuckkästchen.

	Mod_Thorben_Present = 1;

	Info_Mod_Brahim_ThorbenLehrling3_D();
};

INSTANCE Info_Mod_Brahim_ThorbenLehrling4 (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_ThorbenLehrling4_Condition;
	information	= Info_Mod_Brahim_ThorbenLehrling4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich würde gern die Zeichnung abholen.";
};

FUNC INT Info_Mod_Brahim_ThorbenLehrling4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_ThorbenLehrling3))
	&& (Mod_Thorben_Present_Day < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling4_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling4_15_00"); //Ich würde gern die Zeichnung abholen.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling4_07_01"); //Kein Problem, hier ist sie.

	if (Mod_Thorben_Present == 1)
	{
		B_GiveInvItems	(self, hero, ItWr_Zeichnung_Schmuckkasten, 1);
	}
	else if (Mod_Thorben_Present == 2)
	{
		B_GiveInvItems	(self, hero, ItWr_Zeichnung_Bierkrug, 1);
	}
	else if (Mod_Thorben_Present == 3)
	{
		B_GiveInvItems	(self, hero, ItWr_Zeichnung_Karte, 1);
	};

	if (Mod_Thorben_Present == 1)
	|| (Mod_Thorben_Present == 2)
	{
		AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling4_15_02"); //Danke, sieht gut aus. Ich mach mich mal an die Arbeit.
	}
	else if (Mod_Thorben_Present == 3)
	{
		AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling4_15_03"); //Du hast eine verdammte Stadtkarte skizziert?
		AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling4_07_04"); //Na und? Das kann ich am besten, darin bin ich ausgebildet.
		AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling4_07_05"); //Und man kann sie sich wunderbar in die Wohnung hängen.
		AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling4_15_06"); //Schon gut. Bis dann.
	};
};

INSTANCE Info_Mod_Brahim_Bilder (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Bilder_Condition;
	information	= Info_Mod_Brahim_Bilder_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe gehört, du hättest Interesse an Gemälden.";
};

FUNC INT Info_Mod_Brahim_Bilder_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Moe_KnowsPort == 1)
	&& (Npc_HasItems(hero, ItMi_PortsKoffer) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Bilder_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_15_00"); //Ich habe gehört, du hättest Interesse an Gemälden.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_07_01"); //Kommt darauf an, von wem die Werke stammen.

	Info_ClearChoices	(Info_Mod_Brahim_Bilder);

	Info_AddChoice	(Info_Mod_Brahim_Bilder, "Ich weiß nicht, wer die Dinger gemalt hat.", Info_Mod_Brahim_Bilder_B);
	Info_AddChoice	(Info_Mod_Brahim_Bilder, "Die Bilder stammen von Johannes Port.", Info_Mod_Brahim_Bilder_A);
};

FUNC VOID Info_Mod_Brahim_Bilder_C()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_C_15_00"); //Er war auf dem Schiff, das vor kurzem hier gesunken ist. Seine Ausrüstung befand sich noch im Wrack.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_C_07_01"); //Du meinst, Johannes Port ist tot?
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_C_15_02"); //Er ist verschollen.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_C_07_03"); //Aha ... Na ja, die Bilder sind nicht so der große Wurf. Ich will sie nicht haben.

	B_GiveInvItems	(self, hero, ItMi_PortsKoffer, 1);

	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_C_15_04"); //Wie?! Und was soll ich jetzt damit anfangen?
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_C_07_05"); //(überlegt) Ich hätte da eine Idee: Du forschst nach, ob Port noch lebt. Wäre ja unfair, wenn du seine Sachen verkaufst, obwohl er noch unter uns weilt.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_C_07_06"); //Bring ihn her, er hätte bestimmt eine Dusche und ein Stück Fleisch nötig. Den Rest würden wir später klären, aber in der Schuld so einer Person zu stehen, könnte nicht schaden ...

	Info_ClearChoices	(Info_Mod_Brahim_Bilder);

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Leider kann Brahim mit den Gemälden nichts anfangen, aber er meint, es sei eine gute Idee, nach Port zu suchen. Also, wenn das Schiff an der gleichen Stelle gesunken ist, wo es jetzt noch liegt: Wohin hätte man sich retten können?");

	Wld_InsertNpc	(Mod_4027_NONE_Port_NW,	"BIGFARM");

	Moe_KnowsPort = 2;
};

FUNC VOID Info_Mod_Brahim_Bilder_B()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_B_15_00"); //Ich weiß nicht, wer die Dinger gemalt hat.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_B_07_01"); //Dann lass mal schauen.

	B_GiveInvItems	(hero, self, ItMi_PortsKoffer, 1);

	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_B_07_02"); //(misstrauisch) Port? Wie kommst du an seine Gemälde?

	Info_Mod_Brahim_Bilder_C();
};

FUNC VOID Info_Mod_Brahim_Bilder_A()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_A_15_00"); //Die Bilder stammen von Johannes Port.

	B_GiveInvItems	(hero, self, ItMi_PortsKoffer, 1);

	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_B_07_02"); //(misstrauisch) Port? Wie kommst du an seine Gemälde?

	Info_Mod_Brahim_Bilder_C();
};

INSTANCE Info_Mod_Brahim_PortSuchenWo (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_PortSuchenWo_Condition;
	information	= Info_Mod_Brahim_PortSuchenWo_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wo soll ich suchen?";
};

FUNC INT Info_Mod_Brahim_PortSuchenWo_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Bilder))
	&& (Moe_KnowsPort == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_PortSuchenWo_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortSuchenWo_15_00"); //Wo soll ich suchen?
	AI_Output(self, hero, "Info_Mod_Brahim_PortSuchenWo_07_01"); //Na, ich würde in der Nähe des Schiffswracks anfangen.
};

INSTANCE Info_Mod_Brahim_PortDabei (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_PortDabei_Condition;
	information	= Info_Mod_Brahim_PortDabei_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Johannes Port gefunden.";
};

FUNC INT Info_Mod_Brahim_PortDabei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Port_Hi))
	&& (Moe_KnowsPort == 3)
	&& (Npc_GetDistToWp(Mod_4027_NONE_Port_NW, "NW_CITY_HABOUR_HUT_01_FRONT") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_PortDabei_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortDabei_15_00"); //Ich habe Johannes Port gefunden.
	AI_Output(self, hero, "Info_Mod_Brahim_PortDabei_07_01"); //Sehr schön, sehr schön.
	AI_Output(hero, self, "Info_Mod_Brahim_PortDabei_15_02"); //Was passiert nun als nächstes?
	AI_Output(self, hero, "Info_Mod_Brahim_PortDabei_07_03"); //Lass ihn sich erst einmal ausruhen. Ich überlasse ihm bis morgen früh mein Haus.
	AI_Output(self, hero, "Info_Mod_Brahim_PortDabei_07_04"); //Wenn er dann ausgeschlafen und gesättigt ist, können wir uns unterhalten.
	AI_Output(hero, self, "Info_Mod_Brahim_PortDabei_15_05"); //Dann komme ich morgen wieder.
	AI_Output(self, hero, "Info_Mod_Brahim_PortDabei_07_06"); //Ja. Einen schönen Tag noch.

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Port ruht sich bei Brahim aus. Ich soll am nächsten Tag wiederkommen.");

	B_StartOtherRoutine	(Mod_4027_NONE_Port_NW,	"ATBRAHIM");
	B_StartOtherRoutine	(self, "PORTDA");

	PortAtBrahim = Wld_GetDay();

	Moe_KnowsPort = 4;
};

INSTANCE Info_Mod_Brahim_PortTot (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_PortTot_Condition;
	information	= Info_Mod_Brahim_PortTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_PortTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_PortDabei))
	&& (Moe_KnowsPort == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_PortTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_00"); //(aufgeregt) Das kann nicht sein!
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_01"); //Was ist passiert?
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_02"); //Er wurde ermordet! In meinem Haus! Ich kann es nicht fassen!
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_03"); //Port? Port ist tot? (Pause) Was machen wir jetzt?
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_04"); //Ich weiß es nicht! Ich muss es sofort der Stadtwache melden, aber du ... du bist in Gefahr. Jemand hat Port umgebracht, und das bestimmt nicht aus Spaß.
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_05"); //Nein, er muss etwas gewollt haben. Und du hast Ports Schatz geborgen. Vielleicht hat es etwas damit zu tun.
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_06"); //Ich an deiner Stelle würde ihn schnellstmöglich loswerden wollen.
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_07"); //Und wie soll ich ihn loswerden?
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_08"); //Verkauf ihn. (hastig) Nicht an mich, das ist ja klar, ich will ihn nicht haben.
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_09"); //Aber ich kenne da einen komischen Kauz, der dir den Koffer sicher abnehmen würde. Er liebt die Einsamkeit und exotischen Kram. Kuno ist sein Name.
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_10"); //Wo finde ich diesen einsamen Händler?
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_11"); //Er hat seine Hütte auf einem Teich direkt neben Pass zum Minental errichtet. Pass auf dich auf, wenn du zu ihm gehst.
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_12"); //Mach ich doch immer.

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Port wurde in der Nacht ermordet. Verdammt! Das ganze nimmt groteske Züge an ...");
	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Brahim meint, ich sei in Gefahr und solle meinen Koffer möglichst schnell verkaufen. Ein Händler in einer Hütte auf einem See neben dem Pass zum Minental soll mir da helfen können.");

	B_StartOtherRoutine	(self, "START");

	Moe_KnowsPort = 6;

	B_KillNpc	(Mod_4026_NONE_Kuno_NW);
};

INSTANCE Info_Mod_Brahim_Flora (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Flora_Condition;
	information	= Info_Mod_Brahim_Flora_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_Flora_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Flora_Port))
	&& (Moe_KnowsPort == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Flora_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_07_00"); //(überrascht) Oha, wer kommt denn da?

	B_StartOtherRoutine	(Mod_548_NONE_Canthar_NW, "WAITFORPLAYER");

	Info_ClearChoices	(Info_Mod_Brahim_Flora);

	Info_AddChoice	(Info_Mod_Brahim_Flora, "Was hast du mit den Morden zu tun?", Info_Mod_Brahim_Flora_B);
	Info_AddChoice	(Info_Mod_Brahim_Flora, "Das Spiel ist aus, Brahim.", Info_Mod_Brahim_Flora_A);
};

FUNC VOID Info_Mod_Brahim_Flora_E()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_00"); //(eingeschüchtert) Ist ja schon gut! Wenn du mich laufen lässt, erzähle ich alles.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_01"); //Aber ich versichere, dass ich nichts mit den Morden zu tun habe. Und den Betrügereien. Ich bin nur eine arme Hilfskraft, die nach Belieben benutzt wird.
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_E_15_02"); //Schieß los.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_03"); //Es gibt in der Diebesgilde einen, der zusätzlich zu den normalen Geschäften noch Dreck am Stecken hat. Canthar ist es.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_04"); //Durch seine Geldsucht hat er sich an jeder Menge gewinnbringender Aktionen beteiligt. Er ist bereit, für seinen Profit über Leichen zu gehen.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_05"); //Es hat zwar nicht den Anschein, aber er gehört zu den mächtigsten Personen in ganz Khorinis. Ich habe keine Ahnung, wer alles zu ihm gehört.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_06"); //Ich hatte nach einem geplatzten Geschäft Schulden und habe mich an ihn gewandt... dass es ein Fehler war, merkte ich schon bald darauf.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_07"); //Immer wieder sollte ich die Drecksarbeit für ihn erledigen, und wenn ich nicht wollte, drohte er mit Schlägern.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_08"); //Ich weiß nicht, wieso Port sterben musste, aber es schien Canthar sehr dringend zu sein. Nicht nur wegen des Koffers, den du gefunden hast; ich hatte das Gefühl, dass er sich vor Port fürchtete ...
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_E_15_09"); //Sieht so aus, als müsste ich mir Canthar mal vorknöpfen.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_10"); //Es ist zwar lebensmüde, aber es wird der einzige Weg sein! Er muss etliche der Wachen auf seiner Seite haben, denen kann man also nicht trauen ... ein einzelner Kämpfer wird da größere Chancen haben!

	Info_ClearChoices	(Info_Mod_Brahim_Flora);

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Canthar scheint der Drahtzieher hinter den Morden zu sein. Allerdings muss ich ihn mir alleine zur Brust nehmen, weil er höchstwahrscheinlich viele der Wachen bestochen hat. Brahim habe ich laufen lassen; er hat mir versichert, mit dem Töten nichts zu tun und gegen seinen Willen gehandelt zu haben.");

	Moe_KnowsPort = 9;
};

FUNC VOID Info_Mod_Brahim_Flora_B()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_B_15_00"); //Was hast du mit den Morden zu tun?
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_B_07_01"); //Ich? Gar nichts, ehrlich!

	Info_ClearChoices	(Info_Mod_Brahim_Flora);

	Info_AddChoice	(Info_Mod_Brahim_Flora, "Vielleicht hilft ja eine Tracht Prügel deinem Gedächtnis (...)", Info_Mod_Brahim_Flora_D);
	Info_AddChoice	(Info_Mod_Brahim_Flora, "Muss ich erst anfangen zu drohen?", Info_Mod_Brahim_Flora_C);
};

FUNC VOID Info_Mod_Brahim_Flora_A()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_A_15_00"); //Das Spiel ist aus, Brahim.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_B_07_02"); //Welches Spiel denn? Ich spiele nie.

	Info_ClearChoices	(Info_Mod_Brahim_Flora);

	Info_AddChoice	(Info_Mod_Brahim_Flora, "Was hast du mit den Morden zu tun?", Info_Mod_Brahim_Flora_B);
};

FUNC VOID Info_Mod_Brahim_Flora_D()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_D_15_00"); //Vielleicht hilft ja eine Tracht Prügel deinem Gedächtnis auf die Sprünge...

	Info_Mod_Brahim_Flora_E();
};

FUNC VOID Info_Mod_Brahim_Flora_C()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_C_15_00"); //Muss ich erst anfangen zu drohen?

	Info_Mod_Brahim_Flora_E();
};

INSTANCE Info_Mod_Brahim_Canthar (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Canthar_Condition;
	information	= Info_Mod_Brahim_Canthar_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_Canthar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Canthar_Port))
	&& (Moe_KnowsPort == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Canthar_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Canthar_07_00"); //Du lebst! Und diesmal bin ich froh darüber.
	AI_Output(hero, self, "Info_Mod_Brahim_Canthar_15_01"); //Einen Sieg habe ich nicht davongetragen. Nur einen Waffenstillstand.
	AI_Output(self, hero, "Info_Mod_Brahim_Canthar_07_02"); //Du hast Schlimmeres verhindert. Mann, hatte ich Angst um mein Leben. Hier, das soll dir gehören.

	CreateInvItems	(hero, ItMi_Gold, 100);
	CreateInvItems	(hero, ItWr_Map_Newworld, 1);

	B_ShowGivenThings	("100 Gold und Karte erhalten");

	AI_Output(self, hero, "Info_Mod_Brahim_Canthar_07_03"); //Sei trotzdem vorsichtig. Es ist noch nicht vorbei.
	AI_Output(hero, self, "Info_Mod_Brahim_Canthar_15_04"); //Ja, das werde ich sein. Man sieht sich.
};

INSTANCE Info_Mod_Brahim_PortGekillt (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_PortGekillt_Condition;
	information	= Info_Mod_Brahim_PortGekillt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Johannes Port gefunden. Er ist tot.";
};

FUNC INT Info_Mod_Brahim_PortGekillt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Port_Hi))
	&& (Moe_KnowsPort == 3)
	&& (Npc_IsDead(Mod_4027_NONE_Port_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_PortGekillt_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_15_00"); //Ich habe Johannes Port gefunden. Er ist tot.
	AI_Output(self, hero, "Info_Mod_Brahim_PortGekillt_07_01"); //Das ist bedauerlich, aber damit steigt auch der Wert an seinen Werken. Ich bin geneigt, dir seinen Koffer abzukaufen.
	AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_15_02"); //Wie viel würdest du mir für den Koffer geben?
	AI_Output(self, hero, "Info_Mod_Brahim_PortGekillt_07_04"); //Hmm, 200 Goldstücke und weitere 100 dafür, dass du dir die Mühe gemacht hast, nach ihm zu suchen. Einverstanden?

	CreateInvItems	(self, ItMi_Gold, 400);

	B_SetTopicStatus	(TOPIC_MOD_MOE_PORT, LOG_SUCCESS);

	CurrentNQ += 1;

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_ClearChoices	(Info_Mod_Brahim_PortGekillt);

		B_RaiseHandelsgeschick (2);

		Info_AddChoice	(Info_Mod_Brahim_PortGekillt, "Akzeptieren.", Info_Mod_Brahim_PortGekillt_Ok_300);
		Info_AddChoice	(Info_Mod_Brahim_PortGekillt, "Feilschen.", Info_Mod_Brahim_PortGekillt_Feilschen_300);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_15_05"); //Ja.
	
		B_GiveInvItems	(self, hero, ItMi_Gold, 300);
	};
};

FUNC VOID Info_Mod_Brahim_PortGekillt_Ok_300()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_Ok_300_15_00"); //Gib mir das Gold.
	
	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	Info_ClearChoices	(Info_Mod_Brahim_PortGekillt);
};

FUNC VOID Info_Mod_Brahim_PortGekillt_Feilschen_300()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_Feilschen_300_15_00"); //Das ist zu wenig.
	
	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Brahim_PortGekillt_Feilschen_300_13_01"); //Na gut, hier hast du 350 Goldmünzen.

		B_GiveInvItems	(self, hero, ItMi_Gold, 350);

		Info_ClearChoices	(Info_Mod_Brahim_PortGekillt);
	
		B_GivePlayerXP	(10);

		B_RaiseHandelsgeschick (2);
	}
	else
	{
		AI_Output(self, hero, "Inf_Mod_Brahim_PortGekillt_Feilschen_300_13_02"); //Ich geb dir aber nur 300 Goldmünzen.

		Info_ClearChoices	(Info_Mod_Brahim_PortGekillt);
		
		Info_AddChoice	(Info_Mod_Brahim_PortGekillt, "Akzeptieren.", Info_Mod_Brahim_PortGekillt_Ok_300);
	};
};

INSTANCE Info_Mod_Brahim_WoMoe (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_WoMoe_Condition;
	information	= Info_Mod_Brahim_WoMoe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Moe in letzter Zeit gesehen?";
};

FUNC INT Info_Mod_Brahim_WoMoe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Mod_CantharQuest_Last == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_WoMoe_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_WoMoe_15_00"); //Hast du Moe in letzter Zeit gesehen?
	AI_Output(self, hero, "Info_Mod_Brahim_WoMoe_07_01"); //Moe? Mhh ... Nein, ich kann mich nicht erinnern. Ist er nicht da, wo er sein sollte?
	AI_Output(hero, self, "Info_Mod_Brahim_WoMoe_15_02"); //Dann hätte ich wohl kaum gefragt.
	AI_Output(self, hero, "Info_Mod_Brahim_WoMoe_07_03"); //Stimmt. Machst du dir Sorgen?
	AI_Output(hero, self, "Info_Mod_Brahim_WoMoe_15_04"); //Das weiß ich noch nicht.
	AI_Output(self, hero, "Info_Mod_Brahim_WoMoe_07_05"); //Das klingt ja erfreulich ... Sag mir Bescheid, wenn du ihn gefunden hast.
};

INSTANCE Info_Mod_Brahim_MoeTot (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_MoeTot_Condition;
	information	= Info_Mod_Brahim_MoeTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Moe ist ermordet worden.";
};

FUNC INT Info_Mod_Brahim_MoeTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Mod_CantharQuest_Last >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_MoeTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_MoeTot_15_00"); //Moe ist ermordet worden.
	AI_Output(self, hero, "Info_Mod_Brahim_MoeTot_07_01"); //WAS?! Scheiße, Mann! Hast du's schon gemeldet?
	AI_Output(hero, self, "Info_Mod_Brahim_MoeTot_15_02"); //Das werde ich auf meine Weise klären.
	AI_Output(self, hero, "Info_Mod_Brahim_MoeTot_07_03"); //(stöhnt) Also wieder Blut und Gemetzel ...
	AI_Output(hero, self, "Info_Mod_Brahim_MoeTot_15_04"); //Kommt drauf an, wie sehr Canthar sich wehrt.
	AI_Output(self, hero, "Info_Mod_Brahim_MoeTot_07_05"); //Canthar war's? Bei Innos, ich hoffe, du kommst da lebend wieder raus.
	AI_Output(hero, self, "Info_Mod_Brahim_MoeTot_15_06"); //Notfalls muss ich halt laden. Nachladen. Die Armbrust.
	AI_Output(self, hero, "Info_Mod_Brahim_MoeTot_07_07"); //Hä? Ach, egal. Viel Glück jedenfalls bei deiner Unternehmung.
};

INSTANCE Info_Mod_Brahim_HartImNehmen (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_HartImNehmen_Condition;
	information	= Info_Mod_Brahim_HartImNehmen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist wohl hart im Nehmen?";
};

FUNC INT Info_Mod_Brahim_HartImNehmen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_HartImNehmen_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_HartImNehmen_15_00"); //Du bist wohl hart im Nehmen?
	AI_Output(self, hero, "Info_Mod_Brahim_HartImNehmen_07_01"); //Die üppigen Zeiten sind vorbei. Da muss man schon sehen, wo man bleibt.
	AI_Output(hero, self, "Info_Mod_Brahim_HartImNehmen_15_02"); //Auch mit einem Monopol auf Jungfernpergamentzeichnungen?
	AI_Output(self, hero, "Info_Mod_Brahim_HartImNehmen_07_03"); //Mach dich nur lustig.
	AI_Output(self, hero, "Info_Mod_Brahim_HartImNehmen_07_04"); //Seitdem die ersten Papiermühlen aufgetaucht sind, kann ich mein teures Pergament kaum noch an den Mann bringen.
	AI_Output(self, hero, "Info_Mod_Brahim_HartImNehmen_07_05"); //Na, wer lieber auf Lumpen als auf Tierhaut liest, dem ist auch nicht mehr zu helfen.
};

INSTANCE Info_Mod_Brahim_Rasend (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Rasend_Condition;
	information	= Info_Mod_Brahim_Rasend_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_Rasend_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Mod_WM_Rasend == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Rasend_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Rasend_07_00"); //Bei Beliars stinkenden Socken, war das etwa ein Dämon?!
	AI_Output(hero, self, "Info_Mod_Brahim_Rasend_15_01"); //Kann man so sagen.
	AI_Output(self, hero, "Info_Mod_Brahim_Rasend_07_02"); //Da hab ich ja noch mal Glück gehabt!
};

INSTANCE Info_Mod_Brahim_Trade (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Trade_Condition;
	information	= Info_Mod_Brahim_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Brahim_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output(hero, self, "Info_Mod_Brahim_Trade_15_00"); //Dann zeig mal her ...
};

INSTANCE Info_Mod_Brahim_Pickpocket (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Pickpocket_Condition;
	information	= Info_Mod_Brahim_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Brahim_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 16);
};

FUNC VOID Info_Mod_Brahim_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

	Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_BACK, Info_Mod_Brahim_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brahim_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brahim_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);
};

FUNC VOID Info_Mod_Brahim_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

		Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Brahim_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Brahim_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Brahim_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Brahim_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Brahim_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Brahim_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Brahim_EXIT (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_EXIT_Condition;
	information	= Info_Mod_Brahim_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brahim_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brahim_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};