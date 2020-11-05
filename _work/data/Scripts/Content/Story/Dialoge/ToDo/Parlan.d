INSTANCE Info_Mod_Parlan_Hi (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Hi_Condition;
	information	= Info_Mod_Parlan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Parlan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Parlan_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Parlan_Hi_05_01"); //Sei gegrüßt, Fremder. Was führt dich in unser Kloster?
};

INSTANCE Info_Mod_Parlan_Aufgabe (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Aufgabe_Condition;
	information	= Info_Mod_Parlan_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich irgendwas für dich tun?";
};

FUNC INT Info_Mod_Parlan_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Mitglied))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Aufgabe_15_00"); //Kann ich irgendwas für dich tun?
	AI_Output(self, hero, "Info_Mod_Parlan_Aufgabe_05_01"); //Ich brauche momentan keine Hilfe.
	AI_Output(hero, self, "Info_Mod_Parlan_Aufgabe_15_02"); //Ich will ein Novize werden und muss jedem Feuermagier helfen.

	Log_CreateTopic	(TOPIC_MOD_PARLAN_MANA, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_MANA, LOG_RUNNING);
	
	AI_Output(self, hero, "Info_Mod_Parlan_Aufgabe_05_03"); //Ach so ist das. Es reicht mir wenn du deine magische Kraft um 30 erhöhst.

	B_LogEntry	(TOPIC_MOD_PARLAN_MANA, "Für Parlan soll ich meine Mana um 30 erhöhen.");
};

INSTANCE Info_Mod_Parlan_Aufgabe_Fertig (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Aufgabe_Fertig_Condition;
	information	= Info_Mod_Parlan_Aufgabe_Fertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe meine MANA erhöht.";
};

FUNC INT Info_Mod_Parlan_Aufgabe_Fertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Aufgabe))
	&& (Mod_RealMana >= 40) // 30 learned mana + 10 base mana
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Aufgabe_Fertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Aufgabe_Fertig_15_00"); //Ich habe meine MANA erhöht.
	AI_Output(self, hero, "Info_Mod_Parlan_Aufgabe_Fertig_05_01"); //Gut, das reicht mir.

	B_GivePlayerXP	(100);

	B_LogEntry_More	(TOPIC_MOD_FEUERMAGIER, TOPIC_MOD_PARLAN_MANA, "Parlan habe ich überzeugt.", "Parlan ist zufrieden mit mir. Ich habe genug für ihn getan.");
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_MANA, LOG_SUCCESS);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Parlan_Lehrer (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Lehrer_Condition;
	information	= Info_Mod_Parlan_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer kann mir beibringen meine magische Kraft zu erhöhen?";
};

FUNC INT Info_Mod_Parlan_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Hi))
	&& ((Mod_Gilde == 0)
	|| (Mod_Gilde == 6)
	|| (Mod_Gilde == 7))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Lehrer_15_00"); //Wer kann mir beibringen meine magische Kraft zu erhöhen?
	AI_Output(self, hero, "Info_Mod_Parlan_Lehrer_05_01"); //Ich kann dir beibringen deine magische Kraft zu steigern.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_KLOSTER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_KLOSTER, "Parlan kann mir beibringen meine MANA zu steigern.");
};

INSTANCE Info_Mod_Parlan_Ring (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Ring_Condition;
	information	= Info_Mod_Parlan_Ring_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Parlan_Ring_Condition()
{
	if (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_VLK)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Ring_Info()
{
	AI_Output(self, hero, "Info_Mod_Parlan_Ring_05_00"); //Du musst mir helfen.
	AI_Output(hero, self, "Info_Mod_Parlan_Ring_15_01"); //Was ist denn passiert?
	AI_Output(self, hero, "Info_Mod_Parlan_Ring_05_02"); //Der Novize Pedro hat mir meinen Feuerring gestohlen und ist aus dem Kloster geflohen.
	AI_Output(self, hero, "Info_Mod_Parlan_Ring_05_03"); //Du musst mir unbedingt den Ring zurückbringen. Am besten fragst du ein paar Leute, ob sie ihn gesehen haben.

	Npc_ExchangeRoutine	(Mod_7037_NOV_Pedro_NW,	"START");

	Log_CreateTopic	(TOPIC_MOD_PARLAN_FEUERRING, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_FEUERRING, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "Der Novize Pedro hat dem Magier Parlan seinen Feuerring gestohlen und ich soll ihm den Ring wiederbeschaffen. Ich soll ein paar Leute fragen, wohin er gerannt ist.");
};

INSTANCE Info_Mod_Parlan_Ring_Zurueck (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Ring_Zurueck_Condition;
	information	= Info_Mod_Parlan_Ring_Zurueck_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab den Ring.";
};

FUNC INT Info_Mod_Parlan_Ring_Zurueck_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pedro_Niederlage))
	&& (Npc_HasItems(hero, ItRi_Feuerring_Parlan) == 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Parlan_Ring_Zurueck))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Ring_Zurueck_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Ring_Zurueck_15_00"); //Ich hab den Ring.

	B_GiveInvItems	(hero, self, ItRi_Feuerring_Parlan, 1);

	AI_Output(self, hero, "Info_Mod_Parlan_Ring_Zurueck_05_01"); //Vielen Dank. Hier ist deine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "Ich hab Parlan seinen Ring gegeben.");
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_FEUERRING, LOG_SUCCESS);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Parlan_Patherion (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Patherion_Condition;
	information	= Info_Mod_Parlan_Patherion_Info;
	permanent	= 0;
	important	= 0;
	description	= "Pyrokar sagte mir, dass ich mich für meine nächste Mission an dich wenden soll.";
};

FUNC INT Info_Mod_Parlan_Patherion_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Befoerderung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Patherion_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_00"); //Pyrokar sagte mir, dass ich mich für meine nächste Mission an dich wenden soll.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_01"); //Er erwähnte etwas von einer heiligen Stätte ...
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_02"); //Ja, Bruder. Jetzt, da du einer von uns bist, ist es Zeit dir eine alte Geschichte zu erzählen.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_03"); //Ich bin ganz Ohr.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_04"); //Kennst du die Sage über die Tränen Innos'?
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_05"); //Tränen Innos'? Nein, lass hören.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_06"); //Es begann in der Zeit, als Innos seinen beiden Brüder gegenüberstand und ihm klar wurde, dass er Beliar bekämpfen musste. Als Innos dies erkannte füllte sich sein Herz mit Trauer und er begann zu weinen.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_07"); //13 Jahre lang weinte er und seine Tränen fielen herab auf die Welt. Trotz dieser langen Zeit hat Innos nur 6 Tränen vergossen.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_08"); //Und was geschah dann mit ihnen?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_09"); //Nun, ein Mensch, sein Name war Ragon, fand eine der Tränen. Er kostete von ihr und er wurde erfüllt von übernatürlicher Kraft und Weisheit.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_10"); //Er erkannte die Weisheit von Innos Schöpfung. So begann er Innos zu dienen. Als Buße für sein bisheriges leben beschloss er einen Bußgang zu machen.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_11"); //Er ging immer weiter geradeaus, weder Seen noch Berge konnten ihn aufhalten. Und irgendwann, mitten im Gebirge, fand er ein Tal. Nahezu unerreichbar. Dort begann er einen Tempel zu bauen.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_12"); //Als er ihn fertig gebaut hatte betete er 13 Tage lang zu Innos. Er hörte erst auf zu beten als ihn 4 Stimmen unterbrachen.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_13"); //Es waren vier Männer. Sie kamen aus allen Teilen der Erde, getrieben von der Suche nach Vergebung ihrer Sünden und fühlten sich zu jenem Ort berufen, an dem Innos Kraft so deutlich zu spüren war.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_14"); //Die fünf Männer sprachen jeder eine andere Sprache und doch verstanden sie einander problemlos. Sie beschlossen gemeinsam ein großes Kloster zu bauen. Sie bauten lange, doch Zeit hatte für sie die Bedeutung verloren, durch die Tränen Innos’ alterten sie nicht mehr.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_15"); //Dann sind die Tränen eine Art Zaubertrank?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_16"); //Sozusagen ja, nur noch viel mächtiger!
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_17"); //Und was geschah nachdem sie das Kloster erbaut hatten?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_18"); //Nun, sie zogen aus um die Botschaft von Innos zu verbreiten und suchten Novizen für ihr Kloster. Zumindest die meisten von ihnen. Einer jedoch fühlte sich zu anderem berufen. Es war Ragon.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_19"); //Er wusste, oder vielmehr fühlte er, dass es noch eine Träne Innos' gab. Diese wollte er finden und ins Kloster bringen.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_20"); //Und hat er sie gefunden?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_21"); //Das weiß niemand. Die restlichen 4vier trafen sich wieder im Kloster, wo sie noch heute das Oberhaupt der Innoskirche bilden, doch von Ragon hat man nie wieder was gehört.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_22"); //Und warum erzählst du mir diese Geschichte?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_23"); //Nur um dir die nötigen Hintergrundinformationen für deinen nächsten Auftrag zu geben.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_24"); //Meinen nächsten Auftrag?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_25"); //Ja. Patherion wurde vor einiger Zeit von den Schwarzmagiern und schwarzen Kriegern belagert. Zuerst verstanden wir ihr Handeln nicht, eine Belagerung war quasi sinnlos, da wir uns ja nach belieben teleportieren können, doch wir unterschätzen die Schwarzmagier. Sie haben die Foki gestohlen und eine Barriere errichtet.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_26"); //Was? Du meinst wie damals in der Minenkolonie?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_27"); //Ja und Nein. Sie haben zwar eine ähnliche Barriere errichtet, doch man kann sowohl rein als auch raus gehen.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_28"); //Was ist dann das Problem?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_29"); //Tja, man kann eben nur rein "gehen". Die Barriere verhindert, dass wir uns dorthin teleportieren können! Die Nahrungs- und Trankvorräte von Patherion gehen zur Neige, deshalb sollst du ihnen dieses Paket voller Tränke und dieses Paket voll Nahrung bringen.

	CreateInvItems	(hero, ItMi_Pat_Nahrung, 1);
	CreateInvItems	(hero, ItMi_Pat_Trank, 1);

	AI_PrintScreen	("2 Pakete erhalten", -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);

	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_30"); //Was? Ich denke man kann sich nicht dorthin teleportieren und wie du selbst gesagt hast ist es nahezu unerreichbar.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_31"); //Das stimmt so nicht ganz, man kann sich nur nicht zum Kloster teleportieren. Erinnerst du dich an die Kapelle, die Ragon eigenhändig baute? Sie liegt ausserhalb der Barriere und man kann problemlos durch Magie zu ihr reisen.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_32"); //Von dort aus wirst du dir allerdings selbst einen Weg durch die Reihen der Schwarzmagier suchen müssen.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_33"); //Klingt gefährlich!
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_34"); //Ist es auch. Aus diesem Grund wird das ganze auch dir aufgetragen und keinem der Novizen.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_35"); //Gut, ich mache mich gleich auf den Weg.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_36"); //Nimm diese Rune. Mit ihr wirst du zur Kapelle von Patherion kommen.

	B_GiveInvItems	(self, hero, ItRu_Teleport_Pat, 1);

	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_37"); //Und wie komme ich wieder zurück?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_38"); //Mit dieser Rune. Du kannst sie allerdings nur in der Kapelle benutzen.

	B_GiveInvItems	(self, hero, ItRu_TeleportPatBack, 1);

	B_LogEntry	(TOPIC_MOD_PATHERION, "Parlan hat mir von Patherion, einem großen Tempel der Feuermagier erzählt. Dieser wird momentan aber von Schwarzmagiern und Kriegern belagert und braucht deshalb Nachschub an Nahrung und Tränken. Ich soll diese nun in den Tempel bringen.");
};

INSTANCE Info_Mod_Parlan_Lernen (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Lernen_Condition;
	information	= Info_Mod_Parlan_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir was bei.";
};

FUNC INT Info_Mod_Parlan_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Lehrer))
	&& (Mod_RealMana < 100)
	&& ((Mod_Gilde == 0)
	|| (Mod_Gilde == 6)
	|| (Mod_Gilde == 7))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Lernen_15_00"); //Bring mir was bei.

	Info_ClearChoices	(Info_Mod_Parlan_Lernen);

	Info_AddChoice		(Info_Mod_Parlan_Lernen, DIALOG_BACK, INFO_MOD_Parlan_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Parlan_Lernen_5);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Parlan_Lernen_1);
};

FUNC VOID Info_Mod_Parlan_Lernen_BACK()
{
	if (Mod_RealMana	>=	100)
	{
		AI_Output(self, hero, "Info_Mod_Parlan_Lernen_BACK_05_01"); //Deine magischen Kenntnisse sind jetzt so gut, dass ich dir nichts mehr beibringen kann.
	};
	Info_ClearChoices	(Info_Mod_Parlan_Lernen);
};

FUNC VOID Info_Mod_Parlan_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 100);

	Info_ClearChoices	(Info_Mod_Parlan_Lernen);

	Info_AddChoice		(Info_Mod_Parlan_Lernen, DIALOG_BACK, INFO_MOD_Parlan_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Parlan_Lernen_5);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Parlan_Lernen_1);
};

FUNC VOID Info_Mod_Parlan_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 100);

	Info_ClearChoices	(Info_Mod_Parlan_Lernen);

	Info_AddChoice		(Info_Mod_Parlan_Lernen, DIALOG_BACK, INFO_MOD_Parlan_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Parlan_Lernen_5);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Parlan_Lernen_1);
};

INSTANCE Info_Mod_Parlan_Pickpocket (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Pickpocket_Condition;
	information	= Info_Mod_Parlan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Parlan_Pickpocket_Condition()
{
	C_Beklauen	(96, ItMi_Gold, 45);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

	Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_BACK, Info_Mod_Parlan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Parlan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

		Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Parlan_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Parlan_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Parlan_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Parlan_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Parlan_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Parlan_EXIT (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_EXIT_Condition;
	information	= Info_Mod_Parlan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Parlan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Parlan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};