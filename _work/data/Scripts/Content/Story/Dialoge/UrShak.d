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

	AI_Output(self, hero, "Info_Mod_UrShak_WasHier_18_01"); //Nachdem Freund hat vernichtet Krushak, Ur Shak haben getroffen Tarrok. Zusammen haben beschlossen zu gründen neuen Klan.
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
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_02"); //Als Fokus verschwunden war, Ur Shak sein gegangen zu Freund Xardas. Er haben erklärt, dass es fünf Fokus geben.
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_03"); //Er Ur Shak geben Karte, wo eingezeichnet alle Standorte von Fokusse. Daraufhin Ur Shak haben geschickt Tarrok zu suchen Fokus bei Steine.
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_04"); //Doch auch diese Fokusse bereits sein weg. Xardas vermuten, dass Orks haben gestohlen Fokus, um Krushak wieder zu erwecken.
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_05"); //Doch das nicht dürfen passieren. Freund müssen finden restliche Fokusse und holen die von Orks.
	AI_Output(hero, self, "Info_Mod_UrShak_Foki_15_06"); //Ich suche die Foki ja sowieso.
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_07"); //Freund suchen auch nach Fokus? Dann Ur Shak werden helfen Freund so gut er können.
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_08"); //Ranad viel wissen darüber. Er noch immer manchmal beobachten Lager von Orks.
	AI_Output(self, hero, "Info_Mod_UrShak_Foki_18_09"); //Zur Zeit er befinden sich oben in Festung. Gehen zu ihm und sprechen mit ihm. Er sicher haben viele Informationen für Freund.

	B_LogEntry	(TOPIC_MOD_FOKUSSUCHE,	"Es scheint, als wären die Orks in der Orkstadt ebenfalls hinter den Foki her. Ich soll mit einem gewissen Ranad in der Festung sprechen. Er ist der Spion der Orks und hat sicher einige interessante Informationen für mich.");
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
	AI_Output(self, hero, "Info_Mod_UrShak_Mitmachen_18_01"); //Das heißen Krushak nicht sein zurück?
	AI_Output(hero, self, "Info_Mod_UrShak_Mitmachen_15_02"); //Nein. Dank Ranad, der mich zu Hosh Pak geführt hat, konnte ich ihn töten und den Fokus in meinen Besitz bringen.
	AI_Output(self, hero, "Info_Mod_UrShak_Mitmachen_18_03"); //Sein gut.
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
	AI_Output(self, hero, "Info_Mod_UrShak_Oschust_18_00"); //Hallo, Freund. Ranad Ur Shak berichten, dass Orks gefangen genommen Menschen aus Lager in Bergen.
	AI_Output(self, hero, "Info_Mod_UrShak_Oschust_18_01"); //Außerdem wollen starten Angriff auf Lager und auf Magier zu bekommen Amulett.
	AI_Output(hero, self, "Info_Mod_UrShak_Oschust_15_02"); //Genau deshalb suche ich auch deinen Rat. Die Gefangenen sind meine Freunde aus dem Banditenlager. Ich will einen Versuch starten, sie zu befreien.
	AI_Output(self, hero, "Info_Mod_UrShak_Oschust_18_03"); //Werden sein schwere Aufgabe. Gut bewacht von Orks sie sind in Orkstadt in unterirdischer Höhle.
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
	AI_Output(self, hero, "Info_Mod_UrShak_Xeres_18_00"); //Gut, dass Freund kommen. Ur Shak schlechte Nachrichten haben. Orks aus Stadt haben neues Führer. Sehen aus wie Mensch, sein aber nicht ganz lebendig.
	AI_Output(self, hero, "Info_Mod_UrShak_Xeres_18_01"); //Er Orks wollen machen zu seine Armee. Freund müssen verhindern.

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
	AI_Output(self, hero, "Info_Mod_UrShak_Karte_18_00"); //Ur Shak sehen, Freund haben schlechte Karte. Ur Shak werden machen ganz.

	Npc_RemoveInvItems	(hero, ItWrWorldmap, 1);
	CreateInvItems	(hero, ItWrWorldmap_Orc, 1);

	AI_Output(self, hero, "Info_Mod_UrShak_Karte_18_01"); //Jetzt Karte sein ganz.
};

INSTANCE Info_Mod_UrShak_Biftek (C_INFO)
{
	npc		= Mod_10001_Orc_UrShak_MT;
	nr		= 1;
	condition	= Info_Mod_UrShak_Biftek_Condition;
	information	= Info_Mod_UrShak_Biftek_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du weißt von Bifteks Problem?";
};

FUNC INT Info_Mod_UrShak_Biftek_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_UrShak_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Biftek_Mager))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_UrShak_Biftek_Info()
{
	AI_Output(hero, self, "Info_Mod_UrShak_Biftek_15_00"); //Du weißt von Bifteks Problem?
	AI_Output(self, hero, "Info_Mod_UrShak_Biftek_18_01"); //Ja. Aber jeder Ork können sich gewöhnen an Kräuter und Pilze, er nur nicht wollen.
	AI_Output(hero, self, "Info_Mod_UrShak_Biftek_15_02"); //Gibt es keinen Weg, ihm Pflanzen schmackhaft zu machen? Esst ihr Orks sonst auch nur Fleisch?
	AI_Output(self, hero, "Info_Mod_UrShak_Biftek_18_03"); //(überlegt) Ur Shak da fallen ein altes Rezept herzustellen einen Ersatz für Fleisch. Orks nennen es To-Fu.
	AI_Output(hero, self, "Info_Mod_UrShak_Biftek_15_04"); //Was heißt das?
	AI_Output(self, hero, "Info_Mod_UrShak_Biftek_18_05"); //Heißen nichts, ist Name.
	AI_Output(hero, self, "Info_Mod_UrShak_Biftek_15_06"); //Und wie bereitet man dieses To-Fu zu?
	AI_Output(self, hero, "Info_Mod_UrShak_Biftek_18_07"); //Ur Shak müssen schauen in seinen Zetteln. (sucht)
	
	AI_PlayAni(self, "r_Roam1");
	
	AI_Output(self, hero, "Info_Mod_UrShak_Biftek_18_08"); //Da, er haben sogar Rezept Mensch können verstehen.
	
	B_GiveInvItems(self, hero, ItWr_TofuRezept, 1);
	
	AI_Output(self, hero, "Info_Mod_UrShak_Biftek_18_09"); //Mensch müssen suchen So-Ja-Pflanze und ernten ihre Schoten. In den Schoten er finden kleine Bohnen. Ur Shak nicht wissen, ob auch hier So-Ja-Pflanzen wachsen, aber in Gebiet von Orks auf jeden Fall.
	AI_Output(self, hero, "Info_Mod_UrShak_Biftek_18_10"); //In Rezept stehen, man müssen nehmen So-Ja-Presse herzustellen To-Fu. Aber Mensch können auch nutzen Alchemietisch.
	AI_Output(self, hero, "Info_Mod_UrShak_Biftek_18_11"); //Wenn fertig, sagen Biftek, dass Fleisch für ihn haben, und er keinen Unterschied wird merken.
	AI_Output(hero, self, "Info_Mod_UrShak_Biftek_15_12"); //Danke, das klingt doch nach einem Plan.
	
	B_LogEntry	(TOPIC_MOD_BIFTEK_FLEISCHERSATZ, "Ur Shak schlägt vor, Biftek ein gewisses To-Fu zuzubereiten. Gewonnen wird es aus der So-Ja-Pflanze, die eigentlich überall im Minental wachsen sollte, besonders aber im Orkgebiet. Alle Angaben zur Zubereitung finde ich in dem Rezept, das mir Ur Shak anvertraut hat. Herstellen kann ich das To-Fu anscheinend an jedem Alchemietisch.");
	
	Mod_Soja_01 = 0;
	Mod_Soja_02 = 0;
	Mod_Soja_03 = 0;
	Mod_Soja_04 = 0;
	Mod_Soja_05 = 0;
	Mod_Soja_06 = 0;
	Mod_Soja_07 = 0;
	Mod_Soja_08 = 0;
	Mod_Soja_09 = 0;
	Mod_Soja_010 = 0;
	Mod_Soja_011 = 0;
	Mod_Soja_012 = 0;
	Mod_Soja_013 = 0;
	Mod_Soja_014 = 0;
	Mod_Soja_015 = 0;
	Mod_Soja_016 = 0;
	Mod_Soja_017 = 0;
	Mod_Soja_018 = 0;
	Mod_Soja_019 = 0;
	Mod_Soja_020 = 0;
	Mod_Soja_021 = 0;
	Mod_Soja_022 = 0;
	Mod_Soja_023 = 0;
	Mod_Soja_024 = 0;
	Mod_Soja_025 = 0;
	Mod_Soja_026 = 0;
	Mod_Soja_027 = 0;
	Mod_Soja_028 = 0;
	Mod_Soja_029 = 0;
	Mod_Soja_030 = 0;
};

INSTANCE Info_Mod_UrShak_Biftek2 (C_INFO)
{
	npc		= Mod_10001_Orc_UrShak_MT;
	nr		= 1;
	condition	= Info_Mod_UrShak_Biftek2_Condition;
	information	= Info_Mod_UrShak_Biftek2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Biftek ist auch mit To-Fu zufrieden.";
};

FUNC INT Info_Mod_UrShak_Biftek2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Biftek_Mager2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_UrShak_Biftek2_Info()
{
	AI_Output(hero, self, "Info_Mod_UrShak_Biftek2_15_00"); //Biftek ist auch mit To-Fu zufrieden.
	AI_Output(self, hero, "Info_Mod_UrShak_Biftek2_18_01"); //Ur Shak sein überrascht. Er erwarten größere Probleme.
	AI_Output(hero, self, "Info_Mod_UrShak_Biftek2_15_02"); //Nichts, was nicht zu lösen war. Bald sollte er wieder gestärkt sein und mit anpacken können.
	AI_Output(self, hero, "Info_Mod_UrShak_Biftek2_18_03"); //Sein dankbar für Hilfe von Mensch!
	AI_Output(hero, self, "Info_Mod_UrShak_Biftek2_15_04"); //Kein Ding.
};

INSTANCE Info_Mod_UrShak_PolochTretor (C_INFO)
{
	npc		= Mod_10001_Orc_UrShak_MT;
	nr		= 1;
	condition	= Info_Mod_UrShak_PolochTretor_Condition;
	information	= Info_Mod_UrShak_PolochTretor_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_UrShak_PolochTretor_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Poloch_Won))
	|| (Npc_KnowsInfo(hero, Info_Mod_Poloch_Lost))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_UrShak_PolochTretor_Info()
{
	AI_Output(self, hero, "Info_Mod_UrShak_PolochTretor_18_00"); //Ur Shak hören, Tretor und Poloch jetzt beste Freunde, und Mensch haben seine Finger im Spiel.
	AI_Output(hero, self, "Info_Mod_UrShak_PolochTretor_15_01"); //Ja, auf Kosten ein paar blauer Flecke.
	AI_Output(self, hero, "Info_Mod_UrShak_PolochTretor_18_02"); //Mensch nehmen, was Ur Shak finden in Bergfestung. Orks nicht können gebrauchen.
	
	B_GiveInvItems(self, hero, ItMi_Gold, 150);
	
	AI_Output(hero, self, "Info_Mod_UrShak_PolochTretor_15_03"); //Danke.
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