INSTANCE Info_Mod_Bullco_Hi (C_INFO)
{
	npc		= Mod_779_SLD_Bullco_MT;
	nr		= 1;
	condition	= Info_Mod_Bullco_Hi_Condition;
	information	= Info_Mod_Bullco_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Bullco_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bullco_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Bullco_Hi_06_01"); //Ich bin Bullco, Drachenjäger.
	AI_Output(hero, self, "Info_Mod_Bullco_Hi_15_02"); //Wie viele Drachen hast du denn schon gejagt?
	AI_Output(self, hero, "Info_Mod_Bullco_Hi_06_03"); //(dümmlich) Hä? Siehst du hier irgendwo Drachen?
	AI_Output(hero, self, "Info_Mod_Bullco_Hi_15_04"); //Die habt ihr doch sicher schon alle ausgerottet.
	AI_Output(self, hero, "Info_Mod_Bullco_Hi_06_05"); //Willst mich wohl verarschen, Mann?
	AI_Output(hero, self, "Info_Mod_Bullco_Hi_15_06"); //Na, dann weiterhin viel Glück.
	AI_Output(self, hero, "Info_Mod_Bullco_Hi_06_07"); //Ja ...
};

INSTANCE Info_Mod_Bullco_Frauenraub (C_INFO)
{
	npc		= Mod_779_SLD_Bullco_MT;
	nr		= 1;
	condition	= Info_Mod_Bullco_Frauenraub_Condition;
	information	= Info_Mod_Bullco_Frauenraub_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bullco_Frauenraub_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sylvio_Frauenraub))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bullco_Frauenraub_Info()
{
	AI_Output(self, hero, "Info_Mod_Bullco_Frauenraub_06_00"); //Ahh, da bist du ja endlich ...
	AI_Output(hero, self, "Info_Mod_Bullco_Frauenraub_15_01"); //Worum geht es?
	AI_Output(self, hero, "Info_Mod_Bullco_Frauenraub_06_02"); //Du kennst dich ja im Alten Lager bereits gut aus, weißt vermutlich auch, wo das Haus der Erzbarone steht.
	AI_Output(hero, self, "Info_Mod_Bullco_Frauenraub_15_03"); //Denke schon.
	AI_Output(self, hero, "Info_Mod_Bullco_Frauenraub_06_04"); //Gut, und die Erzbarone haben mehr, was wir begehren, als nur Erz. (anzügliches Kichern)

	B_Say	(hero, self, "$WASMEINSTDU");

	AI_Output(self, hero, "Info_Mod_Bullco_Frauenraub_06_05"); //Die Mädels, die dort rumsitzen. Besorg uns eine davon.
	AI_Output(hero, self, "Info_Mod_Bullco_Frauenraub_15_06"); //Und wie soll ich das bitte anstellen?
	AI_Output(self, hero, "Info_Mod_Bullco_Frauenraub_06_07"); //Ist für alles schon gesorgt. Hier, nimm diesen Nebelzauber, den die Wassermagier damals zurückgelassen haben, und benutze ihn im Haus der Erzbarone.

	B_GiveInvItems	(self, hero, ItSc_Nebel, 1);

	AI_Output(self, hero, "Info_Mod_Bullco_Frauenraub_06_08"); //Dann musst du nur noch ein Mädchen dazu bringen, diesen Umhang überzuziehen und dich zu begleiten.

	B_GiveInvItems	(self, hero, ItAr_WomanCape, 1);

	AI_Output(self, hero, "Info_Mod_Bullco_Frauenraub_06_09"); //Du bringst sie dann zu Sylvio. Alles klar? Na dann los.

	B_LogEntry	(TOPIC_MOD_SLD_BULLCO, "Bullco hat mich dazu angewiesen, ins Haus der Erzbarone zu gehen, die Nebelspruchrolle, die er mir gab, anzuwenden und eine der Frauen dazu zu bringen, den Umhang anzuziehen. Ich soll sie dann zu Sylvio geleiten.");
};

INSTANCE Info_Mod_Bullco_KesselProblem (C_INFO)
{
	npc		= Mod_779_SLD_Bullco_MT;
	nr		= 1;
	condition	= Info_Mod_Bullco_KesselProblem_Condition;
	information	= Info_Mod_Bullco_KesselProblem_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bullco_KesselProblem_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_KesselProblem2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bullco_KesselProblem_Info()
{
	AI_Output(self, hero, "Info_Mod_Bullco_KesselProblem_06_00"); //Du dreckiges Schwein. Wegen dir bin ich meinen Job beim Talkessel los.
	AI_Output(self, hero, "Info_Mod_Bullco_KesselProblem_06_01"); //Das wirst du mir büßen.
};

INSTANCE Info_Mod_Bullco_Belagerung (C_INFO)
{
	npc		= Mod_779_SLD_Bullco_MT;
	nr		= 1;
	condition	= Info_Mod_Bullco_Belagerung_Condition;
	information	= Info_Mod_Bullco_Belagerung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wir brauchen euch Söldner.";
};

FUNC INT Info_Mod_Bullco_Belagerung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_BelagerungHilfe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bullco_Belagerung_Info()
{
	AI_Output(hero, self, "Info_Mod_Bullco_Belagerung_15_00"); //Wir brauchen euch Söldner.
	AI_Output(hero, self, "Info_Mod_Bullco_Belagerung_15_01"); //Die Dämonenritter wollen einigen Untoten endgültig den Gar ausmachen. Jedoch haben wir nicht genug Männer, um diese alleine anzugreifen.
	AI_Output(hero, self, "Info_Mod_Bullco_Belagerung_15_02"); //Ich wollte dich bitten, uns einige Söldner zur Verfügung zu stellen.
	AI_Output(self, hero, "Info_Mod_Bullco_Belagerung_06_03"); //Das ist schwierig, denn die meisten Söldner trauen den Beliaranhängern nicht. Du müsstest sie schon überzeugen da mitzumachen.
	AI_Output(hero, self, "Info_Mod_Bullco_Belagerung_15_04"); //Wie soll ich das anstellen?
	AI_Output(self, hero, "Info_Mod_Bullco_Belagerung_06_05"); //Natürlich mit Gold. Ich denke 10.000 Goldmünzen sollten reichen.
	AI_Output(hero, self, "Info_Mod_Bullco_Belagerung_15_06"); //(zynisch) Ja, das zaubere ich einfach so herbei.
	AI_Output(self, hero, "Info_Mod_Bullco_Belagerung_06_07"); //Ich weiß, es ist viel, aber sonst werden dir unsere Leute nicht helfen wollen.
	AI_Output(hero, self, "Info_Mod_Bullco_Belagerung_15_08"); //Ich wende mich an Raven, er wird schon wissen, woher ich das Gold bekomme.
	AI_Output(self, hero, "Info_Mod_Bullco_Belagerung_06_09"); //Gut, mach das, ich warte so lange hier!
	AI_Output(hero, self, "Info_Mod_Bullco_Belagerung_15_10"); //Wir sehen uns!

	Mod_GornsSold = 1;
	
	B_LogEntry	(TOPIC_MOD_BEL_SOELDNER, "Bullco hat gesagt, dass die Söldner einen Sold von 10.000 Goldmünzen erwarten. Mal sehen, was Raven dazu sagt.");
};

INSTANCE Info_Mod_Bullco_Sold (C_INFO)
{
	npc		= Mod_779_SLD_Bullco_MT;
	nr		= 1;
	condition	= Info_Mod_Bullco_Sold_Condition;
	information	= Info_Mod_Bullco_Sold_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du das Gold.";
};

FUNC INT Info_Mod_Bullco_Sold_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_SoeldnerSold))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 10000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bullco_Sold_Info()
{
	AI_Output(hero, self, "Info_Mod_Bullco_Sold_15_00"); //Hier hast du das Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 10000);

	AI_Output(self, hero, "Info_Mod_Bullco_Sold_06_01"); //Sehr gut damit wären unsere Leute wohl hochzufrieden. Heute nacht werden wir angreifen!
	AI_Output(hero, self, "Info_Mod_Bullco_Sold_15_02"); //Gut, ich werde Raven Bescheid sagen.

	B_GivePlayerXP	(250);
	
	B_LogEntry	(TOPIC_MOD_BEL_SOELDNER, "Die Söldner sind bereit und werden heute nacht angreifen. Ich sollte Raven noch darüber informieren.");
};

INSTANCE Info_Mod_Bullco_SchlachtFertig (C_INFO)
{
	npc		= Mod_779_SLD_Bullco_MT;
	nr		= 1;
	condition	= Info_Mod_Bullco_SchlachtFertig_Condition;
	information	= Info_Mod_Bullco_SchlachtFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und alles klar?";
};

FUNC INT Info_Mod_Bullco_SchlachtFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_ArgibastDead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bullco_SchlachtFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Bullco_SchlachtFertig_15_00"); //Und alles klar?
	AI_Output(self, hero, "Info_Mod_Bullco_SchlachtFertig_06_01"); //Das war ein harter Kampf. Ich hätte nicht gedacht, dass diese Untoten so einen Widerstand leisten und Ärger machen.
	AI_Output(hero, self, "Info_Mod_Bullco_SchlachtFertig_15_02"); //Ist aber am Ende doch alles gut gelaufen, oder?
	AI_Output(self, hero, "Info_Mod_Bullco_SchlachtFertig_06_03"); //Da hast du Recht. Was hast du jetzt vor?
	AI_Output(hero, self, "Info_Mod_Bullco_SchlachtFertig_15_04"); //Ich muss mal wieder verhindern, dass Khorinis den Bach runter geht.
	AI_Output(self, hero, "Info_Mod_Bullco_SchlachtFertig_06_05"); //(lacht) So kenne ich dich. Viel Glück!

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Bullco_Pickpocket (C_INFO)
{
	npc		= Mod_779_SLD_Bullco_MT;
	nr		= 1;
	condition	= Info_Mod_Bullco_Pickpocket_Condition;
	information	= Info_Mod_Bullco_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Bullco_Pickpocket_Condition()
{
	C_Beklauen	(79, ItMi_Gold, 700);
};

FUNC VOID Info_Mod_Bullco_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bullco_Pickpocket);

	Info_AddChoice	(Info_Mod_Bullco_Pickpocket, DIALOG_BACK, Info_Mod_Bullco_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bullco_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bullco_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bullco_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bullco_Pickpocket);
};

FUNC VOID Info_Mod_Bullco_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bullco_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bullco_Pickpocket);

		Info_AddChoice	(Info_Mod_Bullco_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bullco_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bullco_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bullco_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bullco_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bullco_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bullco_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bullco_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bullco_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bullco_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bullco_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bullco_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bullco_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bullco_EXIT (C_INFO)
{
	npc		= Mod_779_SLD_Bullco_MT;
	nr		= 1;
	condition	= Info_Mod_Bullco_EXIT_Condition;
	information	= Info_Mod_Bullco_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bullco_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bullco_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};