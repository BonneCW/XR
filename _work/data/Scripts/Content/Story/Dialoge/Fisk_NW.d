INSTANCE Info_Mod_Fisk_NW_Hi (C_INFO)
{
	npc		= Mod_7682_STT_Fisk_NW;
	nr		= 1;
	condition	= Info_Mod_Fisk_NW_Hi_Condition;
	information	= Info_Mod_Fisk_NW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fisk_NW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fisk_NW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Fisk_NW_Hi_12_00"); //(erleichtert) Du hier? Ohh, man, endlich mal wieder ein bekanntes Gesicht.
	AI_Output(hero, self, "Info_Mod_Fisk_NW_Hi_15_01"); //Du bist den Überfall durch die Orks entkommen, wie ich sehe.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_Hi_12_02"); //Ja, Mann. Hey, die letzten Tage waren die Hölle, sag ich dir.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_Hi_12_03"); //Als die Orks nachts bei uns im Lager einfielen brach das reinste Chaos aus.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_Hi_12_04"); //Alles ging so schnell ... ich stürzte im Dunkeln durch das Lager, ohne genau zu wissen, wohin eigentlich genau.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_Hi_12_05"); //Dann fand ich mich plötzlich beim Hinterausgang des Lagers.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_Hi_12_06"); //Ich sah, dass er offen stand und rannte ohne lange nachzudenken hinaus.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_Hi_12_07"); //Aber dort wimmelte es auch von den dreckigen Bastarden.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_Hi_12_08"); //Die nächsten Stunden war es ein ständiges rennen und verstecken, bis ich endlich in Sicherheit war.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_Hi_12_09"); //Auf dem Weg aus dem Tal habe ich dann noch die drei anderen Jungs getroffen ... aber ich glaube, wirklich nicht, dass es sonst noch wer geschafft hat.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_Hi_12_10"); //Aber falls du doch jemandem begegnen solltest ... gib mir auf jeden Fall Bescheid ok?

	Log_CreateTopic	(TOPIC_MOD_LEISEHOFFNUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEISEHOFFNUNG, LOG_RUNNING);

	if (hero.guild == GIL_PAL)
	{
		AI_Output(hero, self, "Info_Mod_Fisk_NW_Hi_15_11"); //Klar, mach ich. Aber was wollt ihr jetzt machen?
		AI_Output(self, hero, "Info_Mod_Fisk_NW_Hi_12_12"); //Ich weiß nicht Recht. Ich habe mir überlegt, ob ich vielleicht in die Stadt gehen sollte.
		AI_Output(self, hero, "Info_Mod_Fisk_NW_Hi_12_13"); //Ich hoffe mal darauf, dass mein Ruf als Händler bis dorthin gedrungen ist und sie mich reinlassen.
		AI_Output(hero, self, "Info_Mod_Fisk_NW_Hi_15_14"); //Ja, Stadt ist sicherlich gut für einen erfahrenen Händler.
		AI_Output(hero, self, "Info_Mod_Fisk_NW_Hi_15_15"); //Die beiden Stadtwachen hier werden dir den Weg zeigen können ...
		AI_Output(self, hero, "Info_Mod_Fisk_NW_Hi_12_16"); //Vielen Dank, man. Ich steh in deiner Schuld.

		B_LogEntry_More	(TOPIC_MOD_MILIZ_FREUNDFEIND, TOPIC_MOD_LEISEHOFFNUNG, "Die Gruppe bei Bengars Hof ist sauber und wird sich zur Stadt begeben.", "Ich habe Fisk in Khorinis getroffen. Mit nur einer Hand voll Begleiter ist es ihm gelungen den Orks zu entkommen. Er zweifelt daran, dass es sonst noch jemand aus dem Lager geschafft hat. Falls ich jedoch noch weiteren Überlebenden auf meinem Weg begegnen sollte, will er, dass ich ihm bescheid gebe.");

		AI_StopProcessInfos	(self);

		B_StartOtherRoutine	(Mod_109_MIL_Rick_NW, "START");
		B_StartOtherRoutine	(Mod_118_MIL_Rumbold_NW, "START");

		B_StartOtherRoutine	(Mod_7682_STT_Fisk_NW,	"NW_BIGMILL_FARM3_07");
		B_StartOtherRoutine	(Mod_7683_BUD_Buddler_NW,	"NW_BIGMILL_FARM3_07");
		B_StartOtherRoutine	(Mod_7684_STT_Schatten_NW,	"NW_BIGMILL_FARM3_07");
		B_StartOtherRoutine	(Mod_7685_BUD_Buddler_NW,	"NW_BIGMILL_FARM3_07");
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Fisk_NW_Hi_15_17"); //Klar, mach ich. Viel Glück noch.
		AI_Output(self, hero, "Info_Mod_Fisk_NW_Hi_12_18"); //Danke ... das kann ich echt gebrauchen.

		B_LogEntry	(TOPIC_MOD_LEISEHOFFNUNG, "Ich habe Fisk in Khorinis getroffen. Mit nur einer Hand voll Begleiter ist es ihm gelungen den Orks zu entkommen. Er zweifelt daran, dass es sonst noch jemand aus dem Lager geschafft hat. Falls ich jedoch noch weiteren Überlebenden auf meinem Weg begegnen sollte, will er, dass ich ihm bescheid gebe.");
	};
};

INSTANCE Info_Mod_Fisk_NW_Markt (C_INFO)
{
	npc		= Mod_7682_STT_Fisk_NW;
	nr		= 1;
	condition	= Info_Mod_Fisk_NW_Markt_Condition;
	information	= Info_Mod_Fisk_NW_Markt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fisk_NW_Markt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_AndreVermaechtnis10))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_NW_Markt_Info()
{
	AI_Output(self, hero, "Info_Mod_Fisk_NW_Markt_12_00"); //Ahh, da bist du ja. Vielen Dank für deine Hilfe.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_Markt_12_01"); //Sonst wäre es wohl um einiges schwieriger geworden in die Stadt zu kommen.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_Markt_12_02"); //Aber was sind schon Worte ... hier, paar von den Sachen die ich noch bei mir hatte, als ich aus dem Lager entkam.

	B_ShowGivenThings	("50 Gold, 3 Erzbrocken, 1 Traumruf und 2 Manaessenzen erhalten");

	CreateInvItems	(hero, ItMi_Gold, 50);
	CreateInvItems	(hero, ItMi_Nugget, 3);
	CreateInvItems	(hero, ItMi_Traumruf, 1);
	CreateInvItems	(hero, ItPo_Mana_01, 2);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Fisk_NW_LeiseHoffnung (C_INFO)
{
	npc		= Mod_7682_STT_Fisk_NW;
	nr		= 1;
	condition	= Info_Mod_Fisk_NW_LeiseHoffnung_Condition;
	information	= Info_Mod_Fisk_NW_LeiseHoffnung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich war ein bisschen unterwegs ... und bin tatsächlich jemandem aus dem Alten Lager begegnet.";
};

FUNC INT Info_Mod_Fisk_NW_LeiseHoffnung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_NW_Hi))
	&& (Mod_Fisk_LeiseHoffnung < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_NW_LeiseHoffnung_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_NW_LeiseHoffnung_15_00"); //Ich war ein bisschen unterwegs ... und bin tatsächlich jemandem aus dem Alten Lager begegnet.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_LeiseHoffnung_12_01"); //(aufgeregt) Was?! Wem?

	Info_ClearChoices	(Info_Mod_Fisk_NW_LeiseHoffnung);

	if (Mod_Fisk_LH_Mud == 0)
	{
		Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, "Mud hütet Schafe in Relendel.", Info_Mod_Fisk_NW_LeiseHoffnung_C);
	};
	if (Mod_Fisk_LH_Fingers == 0)
	{
		Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, "Fingers ist bei den Banditen. Er scheint ganz gut zurecht zu kommen.", Info_Mod_Fisk_NW_LeiseHoffnung_B);
	};
	if (Mod_Fisk_LH_Scatty == 0)
	{
		Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, "Ich bin Scatty im Sumpflager begegnet.", Info_Mod_Fisk_NW_LeiseHoffnung_A);
	};
};

FUNC VOID Info_Mod_Fisk_NW_LeiseHoffnung_D()
{
	AI_Output(self, hero, "Info_Mod_Fisk_NW_LeiseHoffnung_D_12_00"); //Wie dem auch sei, tausend Dank für diese Auskunft.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_LeiseHoffnung_D_12_01"); //Das zu wissen ist eine echte Erleichterung.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_LeiseHoffnung_D_12_02"); //Dafür verrat ich dir auch einige Tricks, die du beim Handeln unbedingt beachten musst.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_LeiseHoffnung_D_12_03"); //Wenn du es auf einen Gegenstand wirklich abgesehen hast, darfst du es auf keinem Fall durchblicken lassen.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_LeiseHoffnung_D_12_04"); //Täusche erst einmal nur verhaltenes Interesse vor, biete kleine Beträge und zögere dabei, auf höhere Gebote einzugehen.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_LeiseHoffnung_D_12_05"); //Dann erregst du keine Aufmerksamkeit, niemand wird mitbieten, und der Händler wird es dir zu einem viel geringeren Preis überlassen, weil er sich sicher ist, dass du nicht bereit bist mehr dafür herzugeben.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_LeiseHoffnung_D_12_06"); //Bluffen ist eben das halbe Geschäft.

	B_GivePlayerXP	(600);

	B_RaiseHandelsgeschick (10);

	B_SetTopicStatus	(TOPIC_MOD_LEISEHOFFNUNG, LOG_SUCCESS);

	CurrentNQ += 1;

	Info_ClearChoices	(Info_Mod_Fisk_NW_LeiseHoffnung);

	Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, DIALOG_BACK, Info_Mod_Fisk_NW_LeiseHoffnung_BACK);

	if (Mod_Fisk_LH_Mud == 0)
	{
		Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, "Mud hütet Schafe in Relendel.", Info_Mod_Fisk_NW_LeiseHoffnung_C);
	};
	if (Mod_Fisk_LH_Fingers == 0)
	{
		Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, "Fingers ist bei den Banditen. Er scheint ganz gut zurecht zu kommen.", Info_Mod_Fisk_NW_LeiseHoffnung_B);
	};
	if (Mod_Fisk_LH_Scatty == 0)
	{
		Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, "Ich bin Scatty im Sumpflager begegnet.", Info_Mod_Fisk_NW_LeiseHoffnung_A);
	};
};

FUNC VOID Info_Mod_Fisk_NW_LeiseHoffnung_BACK()
{
	Info_ClearChoices	(Info_Mod_Fisk_NW_LeiseHoffnung);
};

FUNC VOID Info_Mod_Fisk_NW_LeiseHoffnung_C()
{
	AI_Output(hero, self, "Info_Mod_Fisk_NW_LeiseHoffnung_C_15_00"); //Mud hütet Schafe in Relendel.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_LeiseHoffnung_C_12_01"); //Was?! Mud? Wenn ich es von jemandem sicherlich nicht erwartet hätte, dann von ihm.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_LeiseHoffnung_C_12_02"); //Aber immerhin. Wenn er es sogar geschafft hat, stehen die Chancen gut, dass auch noch einige andere mit ihrem Leben davongekommen sind.

	Mod_Fisk_LeiseHoffnung += 1;

	if (Mod_Fisk_LeiseHoffnung == 1)
	{
		Info_Mod_Fisk_NW_LeiseHoffnung_D();
	}
	else
	{
		B_GiveInvItems	(self, hero, ItMi_Gold, 50);

		B_GivePlayerXP	(200);
	};

	Mod_Fisk_LH_Mud = 1;

	Info_ClearChoices	(Info_Mod_Fisk_NW_LeiseHoffnung);

	Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, DIALOG_BACK, Info_Mod_Fisk_NW_LeiseHoffnung_BACK);

	if (Mod_Fisk_LH_Fingers == 0)
	{
		Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, "Fingers ist bei den Banditen. Er scheint ganz gut zurecht zu kommen.", Info_Mod_Fisk_NW_LeiseHoffnung_B);
	};
	if (Mod_Fisk_LH_Scatty == 0)
	{
		Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, "Ich bin Scatty im Sumpflager begegnet.", Info_Mod_Fisk_NW_LeiseHoffnung_A);
	};
};

FUNC VOID Info_Mod_Fisk_NW_LeiseHoffnung_B()
{
	AI_Output(hero, self, "Info_Mod_Fisk_NW_LeiseHoffnung_B_15_00"); //Fingers ist bei den Banditen. Er scheint ganz gut zurecht zu kommen.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_LeiseHoffnung_B_12_01"); //Fingers also. Der Meister der Diebestalente hat seine Kunst mal wieder unter Beweis gestellt.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_LeiseHoffnung_B_12_02"); //Ich ziehe meinen Hut vor ihm.

	Mod_Fisk_LeiseHoffnung += 1;

	if (Mod_Fisk_LeiseHoffnung == 1)
	{
		Info_Mod_Fisk_NW_LeiseHoffnung_D();
	}
	else
	{
		B_GiveInvItems	(self, hero, ItMi_Gold, 50);

		B_GivePlayerXP	(200);
	};

	Mod_Fisk_LH_Fingers = 1;

	Info_ClearChoices	(Info_Mod_Fisk_NW_LeiseHoffnung);

	Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, DIALOG_BACK, Info_Mod_Fisk_NW_LeiseHoffnung_BACK);

	if (Mod_Fisk_LH_Mud == 0)
	{
		Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, "Mud hütet Schafe in Relendel.", Info_Mod_Fisk_NW_LeiseHoffnung_C);
	};
	if (Mod_Fisk_LH_Scatty == 0)
	{
		Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, "Ich bin Scatty im Sumpflager begegnet.", Info_Mod_Fisk_NW_LeiseHoffnung_A);
	};
};

FUNC VOID Info_Mod_Fisk_NW_LeiseHoffnung_A()
{
	AI_Output(hero, self, "Info_Mod_Fisk_NW_LeiseHoffnung_A_15_00"); //Ich bin Scatty im Sumpflager begegnet.
	AI_Output(hero, self, "Info_Mod_Fisk_NW_LeiseHoffnung_A_15_01"); //Er darf dort jetzt Novizen bei der Sumpfkrauternte beschützen.
	AI_Output(self, hero, "Info_Mod_Fisk_NW_LeiseHoffnung_A_12_02"); //Scatty, dieser alte Haudegen. Ja, wenn sich einer durchgeschlagen hat, dann sicherlich er.

	Mod_Fisk_LeiseHoffnung += 1;

	if (Mod_Fisk_LeiseHoffnung == 1)
	{
		Info_Mod_Fisk_NW_LeiseHoffnung_D();
	}
	else
	{
		B_GiveInvItems	(self, hero, ItMi_Gold, 50);

		B_GivePlayerXP	(200);
	};

	Mod_Fisk_LH_Scatty = 1;

	Info_ClearChoices	(Info_Mod_Fisk_NW_LeiseHoffnung);

	Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, DIALOG_BACK, Info_Mod_Fisk_NW_LeiseHoffnung_BACK);

	if (Mod_Fisk_LH_Mud == 0)
	{
		Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, "Mud hütet Schafe in Relendel.", Info_Mod_Fisk_NW_LeiseHoffnung_C);
	};
	if (Mod_Fisk_LH_Fingers == 0)
	{
		Info_AddChoice	(Info_Mod_Fisk_NW_LeiseHoffnung, "Fingers ist bei den Banditen. Er scheint ganz gut zurecht zu kommen.", Info_Mod_Fisk_NW_LeiseHoffnung_B);
	};
};

INSTANCE Info_Mod_Fisk_NW_EXIT (C_INFO)
{
	npc		= Mod_7682_STT_Fisk_NW;
	nr		= 1;
	condition	= Info_Mod_Fisk_NW_EXIT_Condition;
	information	= Info_Mod_Fisk_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fisk_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fisk_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};