INSTANCE Info_Mod_UrShak_Hi (C_INFO)
{
	npc		= Mod_10001_Orc_UrShak_MT;
	nr		= 1;
	condition	= Info_Mod_UrShak_Hi_Condition;
	information	= Info_Mod_UrShak_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_UrShak_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_UrShak_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_UrShak_Hi_18_00"); //Fremder seien gegrüßt von mir.
	AI_Output(hero, self, "Info_Mod_UrShak_Hi_15_01"); //Ur-Shak, ich bins.
	AI_Output(self, hero, "Info_Mod_UrShak_Hi_18_02"); //Du seien Freund. Du mich haben gerettet vor Krieger aus Orkstadt. Ich dir noch immer seien sehr dankbar.
};

INSTANCE Info_Mod_UrShak_WasHier (C_INFO)
{
	npc		= Mod_10001_Orc_UrShak_MT;
	nr		= 1;
	condition	= Info_Mod_UrShak_WasHier_Condition;
	information	= Info_Mod_UrShak_WasHier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_UrShak_WasHier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_UrShak_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_UrShak_WasHier_Info()
{
	B_Say	(hero, self, "$WASMACHSTDUHIER");

	AI_Output(self, hero, "Info_Mod_UrShak_WasHier_18_01"); //Nachdem Freund hat vernichtet KRUSHAK, ich haben getroffen Tarrok. Zusammen wir haben beschlossen zu gründen neuen Klan.
	AI_Output(self, hero, "Info_Mod_UrShak_WasHier_18_02"); //Als Lager wir haben genommen alte Festung in Felsen. Hier wir seien geschützt vor böse Orks.
};

INSTANCE Info_Mod_UrShak_Foki (C_INFO)
{
	npc		= Mod_10001_Orc_UrShak_MT;
	nr		= 1;
	condition	= Info_Mod_UrShak_Foki_Condition;
	information	= Info_Mod_UrShak_Foki_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was weißt du über die Foki?";
};

FUNC INT Info_Mod_UrShak_Foki_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_UrShak_WasHier))
	&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Fokusplatz))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_UrShak_Foki_Info()
{
	AI_Output(hero, self, "Info_Mod_UrShak_Foki_15_00"); //Was weißt du über die Foki?
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_01"); //Hier auf Podest ein Fokus haben gestanden, doch eines Nachts es weg war.
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_02"); //Als Fokus verschwunden war ich bin gegangen zu Freund Xardas. Er mir haben erklärt das es fünf Fokus geben.
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_03"); //Er mir geben Karte wo eingezeichnet alle Standorte von Fokus. Daraufhin ich haben geschickt Tarrok zu suchen Fokus bei Steine.
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_04"); //Doch auch diese Fokus bereits seien weg. Xardas vermuten das Orks haben gestohlen Fokus um KRUSHAK wieder zu erwecken.
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_05"); //Doch das nicht dürfen passieren. Freund müssen finden restliche Fokus und holen die von Orks.
	AI_Output(hero, self, "Info_Mod_UrShak_Foki_15_06"); //Ich suche die Foki ja sowieso.
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_07"); //Freund suchen auch nach Fokus? Dann ich werden helfen Freund so gut ich können.
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_08"); //Wir haben eine Bruder von uns in Orkstadt. Er bringen uns Informationen über Plan von böse Orks. Sein Name seien Ranad.
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_09"); //Zur Zeit befindet er sich oben in Festung. Geh zu ihm und sprechen mit ihm. Er sicher haben viele Informationen für Freund.

	B_LogEntry	(TOPIC_MOD_FOKUSSUCHE,	"Es scheint als wären die Orks in der Orkstadt ebenfalls hinter den Foki her. Ich soll mit einem gewissen Ranad in der Festung sprechen. Er ist der Spion der Orks und hat sicher einige interessante Informationen für mich.");
};

INSTANCE Info_Mod_UrShak_Mitmachen (C_INFO)
{
	npc		= Mod_10001_Orc_UrShak_MT;
	nr		= 1;
	condition	= Info_Mod_UrShak_Mitmachen_Condition;
	information	= Info_Mod_UrShak_Mitmachen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das Ritual der Orks in der Stadt hat nicht geklappt.";
};

FUNC INT Info_Mod_UrShak_Mitmachen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ranad_OC_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_UrShak_Mitmachen_Info()
{
	AI_Output(hero, self, "Info_Mod_UrShak_Mitmachen_15_00"); //Das Ritual der Orks in der Stadt hat nicht geklappt.
	AI_Output(self, hero, "Info_Mod_UrShak_Mitmachen_18_01"); //Das heißen KRUSHAK nicht seien zurück?
	AI_Output(hero, self, "Info_Mod_UrShak_Mitmachen_15_02"); //Nein. Dank Ranad, der mich zu Hosh Pak geführt hat, konnte ich ihn töten und den Fokus in meinen Besitz bringen.
	AI_Output(self, hero, "Info_Mod_UrShak_Mitmachen_18_03"); //Seien gut.
};

INSTANCE Info_Mod_UrShak_Oschust (C_INFO)
{
	npc		= Mod_10001_Orc_UrShak_MT;
	nr		= 1;
	condition	= Info_Mod_UrShak_Oschust_Condition;
	information	= Info_Mod_UrShak_Oschust_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_UrShak_Oschust_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_BanditenKidnapped))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Oschust_BadOne_Gnade))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Oschust_BadOne_Plan))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_UrShak_Oschust_Info()
{
	AI_Output(self, hero, "Info_Mod_UrShak_Oschust_18_00"); //Hallo Freund. Ranad mir berichten, dass Orks gefangen genommen Menschen, aus Lager in Bergen.
	AI_Output(self, hero, "Info_Mod_UrShak_Oschust_18_01"); //Außerdem wollen starten Angriff auf Lager und auf Magier, um zu bekommen Amulett.
	AI_Output(hero, self, "Info_Mod_UrShak_Oschust_15_02"); //Genau deshalb suche ich auch deinen Rat. Die Gefangenen sind meine Freunde aus dem Banditenlager. Ich will einen Versuch starten, sie zu befreien.
	AI_Output(self, hero, "Info_Mod_UrShak_Oschust_18_03"); //Werden sein schwere Aufgabe. Gut bewacht von Orks sie sind in Orkstadt in unterirdischen Höhle.
	AI_Output(self, hero, "Info_Mod_UrShak_Oschust_18_04"); //Ur Shak wissen, dass du sein starker Krieger. Aber das nicht allein reichen, um können deine Freunde zu befreien.
	AI_Output(hero, self, "Info_Mod_UrShak_Oschust_15_05"); //Da werde ich mich wohl die Unterstützung der Verwandlungsmagier bemühen müssen. Danke für die Auskünfte.
	AI_Output(self, hero, "Info_Mod_UrShak_Oschust_18_06"); //Ur Shak gerne helfen Freund und wünschen Erfolg bei schwerer Aufgabe.

	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Ich sollte mich an den Verwandlungsmagier Albert wenden, um ihm von der Gefahr zu berichten, die auch seinem Lager droht. Vielleicht kriege ich auf diesem Wege Unterstützung ...");
};

INSTANCE Info_Mod_UrShak_Xeres (C_INFO)
{
	npc		= Mod_10001_Orc_UrShak_MT;
	nr		= 1;
	condition	= Info_Mod_UrShak_Xeres_Condition;
	information	= Info_Mod_UrShak_Xeres_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_UrShak_Xeres_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_AW_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_UrShak_Xeres_Info()
{
	AI_Output(self, hero, "Info_Mod_UrShak_Xeres_18_00"); //Gut, dass Freund kommen. Wir schlechtere Nachrichten haben.
	AI_Output(self, hero, "Info_Mod_UrShak_Xeres_18_01"); //Orks aus Stadt haben gewählt neuen Führer. Sehen aus wie Mensch, sein aber nicht mehr lebendig.
	AI_Output(hero, self, "Info_Mod_UrShak_Xeres_15_02"); //Genau den Knaben suche ich.
	AI_Output(self, hero, "Info_Mod_UrShak_Xeres_18_03"); //Ur-Shak hoffen, dass Freund können ihn vertreiben. Sonst er machen Orks zu bösen Dienern.

	B_LogEntry	(TOPIC_MOD_XERES, "Xeres scheint alle Orks zu seinen Dienern machen zu wollen. Ur Shak will, dass ich das verhindere.");
};

INSTANCE Info_Mod_UrShak_Karte (C_INFO)
{
	npc		= Mod_10001_Orc_UrShak_MT;
	nr		= 1;
	condition	= Info_Mod_UrShak_Karte_Condition;
	information	= Info_Mod_UrShak_Karte_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_UrShak_Karte_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_UrShak_Hi))
	&& (Npc_HasItems(hero, ItWrWorldmap) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_UrShak_Karte_Info()
{
	AI_Output(self, hero, "Info_Mod_UrShak_Karte_18_00"); //Ur Shak sehen Freund haben schlechte Karte. Ur Shak werden machen ganz.

	Npc_RemoveInvItems	(hero, ItWrWorldmap, 1);
	CreateInvItems	(hero, ItWrWorldmap_Orc, 1);

	AI_Output(self, hero, "Info_Mod_UrShak_Karte_18_01"); //Jetzt Karte seien ganz.
};

INSTANCE Info_Mod_UrShak_EXIT (C_INFO)
{
	npc		= Mod_10001_Orc_UrShak_MT;
	nr		= 1;
	condition	= Info_Mod_UrShak_EXIT_Condition;
	information	= Info_Mod_UrShak_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_UrShak_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_UrShak_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};