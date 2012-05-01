INSTANCE Info_Mod_Pilar_Hi (C_INFO)
{
	npc		= Mod_7566_OUT_Pilar_EIS;
	nr		= 1;
	condition	= Info_Mod_Pilar_Hi_Condition;
	information	= Info_Mod_Pilar_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist euch das Wetter zu schlecht oder warum hockt ihr den ganzen Tag hier in der Taverne?";
};

FUNC INT Info_Mod_Pilar_Hi_Condition()
{
	if (Wld_IsTime(07,15,00,15))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pilar_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Pilar_Hi_15_00"); //Ist euch das Wetter zu schlecht oder warum hockt ihr den ganzen Tag hier in der Taverne?
	AI_Output(self, hero, "Info_Mod_Pilar_Hi_01_01"); //Lass mich doch in Ruhe. Meine Laune ist schon schlecht genug.
	AI_Output(self, hero, "Info_Mod_Pilar_Hi_01_02"); //Wenn du Reden willst, dann geh zu Luis. Wenn ihr beide euch unterhaltet, quatscht mich wenigstens keiner von euch voll.
};

INSTANCE Info_Mod_Pilar_AtHut (C_INFO)
{
	npc		= Mod_7566_OUT_Pilar_EIS;
	nr		= 1;
	condition	= Info_Mod_Pilar_AtHut_Condition;
	information	= Info_Mod_Pilar_AtHut_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pilar_AtHut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Luis_AtFriedhof3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pilar_AtHut_Info()
{
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut_01_00"); //Ah, endlich kommt jemand. Ich dachte schon mich würden sie auch noch entführen.
	AI_Output(hero, self, "Info_Mod_Pilar_AtHut_15_01"); //Wer soll dich den Entführen wollen?
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut_01_02"); //Diese verdammten Goblins natürlich. Letzte Nacht haben sie meinen Bruder Chad entführt.
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut_01_03"); //Ich konnte gerade noch zum Schwert greifen, ansonsten hätten sie mich auch erwischt.
	AI_Output(hero, self, "Info_Mod_Pilar_AtHut_15_04"); //Hast du eine Ahnung, wo sie ihn hingebracht haben könnten?
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut_01_05"); //Nein, nicht wirklich. Allerdings hab ich einen von ihnen verletzen können. Die Blutspur könnte uns also zu ihnen führen.
	AI_Output(hero, self, "Info_Mod_Pilar_AtHut_15_06"); //Worauf wartest du dann noch, höher werden die Überlebenschancen deines Bruders nicht.
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut_01_07"); //Ich hab auf Verstärkung gewartet. Wenn wir auch gefangen genommen werden, muss doch jemand wissen, das wir hier sind.
	AI_Output(hero, self, "Info_Mod_Pilar_AtHut_15_08"); //Gut, dann geht Luis zurück zur Stadt und wir folgen den Blutspuren.
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut_01_09"); //In Ordnung, ich folge dir.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTOCHAD");
	B_StartOtherRoutine	(Mod_7567_OUT_Luis_EIS, "START");

	Mod_7567_OUT_Luis_EIS.aivar[AIV_Partymember] = FALSE;
	self.aivar[AIV_Partymember] = TRUE;

	B_LogEntry	(TOPIC_MOD_EIS_FRIEDHOF, "Pilars Bruder wurde von Goblins entführt. Wir werden der Blutspur folgen, um ihn zu finden. Luis wird währenddessen in der Stadt mitteilen, was hier vor sich geht.");

	Wld_InsertNpc	(Mod_7720_OUT_Chad_EIS, "EIS_415");

	B_KillNpc	(Mod_7720_OUT_Chad_EIS);

	Wld_InsertNpc	(Eisgoblin, "EIS_415");
	Wld_InsertNpc	(Eisgoblin, "EIS_415");
	Wld_InsertNpc	(Eisgoblin, "EIS_415");
	Wld_InsertNpc	(Eisgoblin, "EIS_415");
	Wld_InsertNpc	(Eisgoblin, "EIS_415");
	Wld_InsertNpc	(Eisgoblin, "EIS_415");
	Wld_InsertNpc	(Eisgoblin, "EIS_415");
};

INSTANCE Info_Mod_Pilar_AtHut2 (C_INFO)
{
	npc		= Mod_7566_OUT_Pilar_EIS;
	nr		= 1;
	condition	= Info_Mod_Pilar_AtHut2_Condition;
	information	= Info_Mod_Pilar_AtHut2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pilar_AtHut2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pilar_AtHut))
	&& (Npc_GetDistToWP(hero, "EIS_415") < 1500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pilar_AtHut2_Info()
{
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut2_01_00"); //Anscheinend haben sich die Goblins ein neues Lager gebaut. Irgendwie komisch.
	AI_Output(hero, self, "Info_Mod_Pilar_AtHut2_15_01"); //Warum ist das komisch?
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut2_01_02"); //Das die Goblins so etwas das letzte mal gebaut haben ist schon eine Ewigkeit her.
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut2_01_03"); //Damals lebte der Dämonenbeschwörer noch unter ihnen.
	AI_Output(hero, self, "Info_Mod_Pilar_AtHut2_15_04"); //Konnte dieser "Dämonenbeschwörer" wirklich Magie anwenden?
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut2_01_05"); //Nein, so klug war er auch wieder nicht. Er hat aber Rituale durchgeführt, die aber nie etwas bewirkt haben.
	AI_Output(hero, self, "Info_Mod_Pilar_AtHut2_15_06"); //Gut, dann dürften die paar Goblins für uns ja kein Problem sein. Lass uns angreifen.
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut2_01_07"); //Ok, geh du vor.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTOCHAD");
};

INSTANCE Info_Mod_Pilar_AtHut3 (C_INFO)
{
	npc		= Mod_7566_OUT_Pilar_EIS;
	nr		= 1;
	condition	= Info_Mod_Pilar_AtHut3_Condition;
	information	= Info_Mod_Pilar_AtHut3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pilar_AtHut3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pilar_AtHut2))
	&& (Npc_GetDistToWP(hero, "EIS_415") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pilar_AtHut3_Info()
{
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut3_01_00"); //Nein ... diese verfluchten Monster haben meinen Bruder getötet. Warum konnten wir ihn nicht retten?!
	AI_Output(hero, self, "Info_Mod_Pilar_AtHut3_15_01"); //Das sieht mir hier aber nicht so aus, als hätten die ihn zum Spaß getötet.
	AI_Output(hero, self, "Info_Mod_Pilar_AtHut3_15_02"); //Das sieht mir eher nach einem Opfer aus!
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut3_01_03"); //Was haben diese Monster vor? Warum brauchen sie ein Opfer?
	AI_Output(hero, self, "Info_Mod_Pilar_AtHut3_15_04"); //Vielleicht haben sie ihn geopfert, um jemanden anderen wieder zu erwecken.
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut3_01_05"); //Ich hab da so eine Befürchtung. Ich habe mich immer schon gewundert, warum diese Monster einen Friedhof haben.
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut3_01_06"); //Was, wenn sie meinen Bruder geopfert haben, um ihre Freunde wieder zu erwecken?!
	AI_Output(hero, self, "Info_Mod_Pilar_AtHut3_15_07"); //Wenn das wirklich passiert ist, muss jemand die Stadt darüber informieren.
	AI_Output(hero, self, "Info_Mod_Pilar_AtHut3_15_08"); //Ich werde mich zum Friedhof begeben und du gibst in der Stadt Bescheid. Wir treffen uns dann später wieder.
	AI_Output(self, hero, "Info_Mod_Pilar_AtHut3_01_09"); //Gut, viel Glück!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOCITY");

	self.aivar[AIV_Partymember] = FALSE;

	B_LogEntry	(TOPIC_MOD_EIS_FRIEDHOF, "Pilar wird in die Stadt gehen und Verstärkung holen. Währenddessen werde ich auf dem Friedhof nach dem Rechten sehen.");

	Wld_InsertNpc	(Gobbo_Skeleton, "NORTDGEBIET_92");
	Wld_InsertNpc	(Gobbo_Skeleton, "NORTDGEBIET_92");
	Wld_InsertNpc	(Gobbo_Skeleton, "NORTDGEBIET_92");
	Wld_InsertNpc	(Gobbo_Skeleton, "NORTDGEBIET_92");
	Wld_InsertNpc	(Gobbo_Skeleton, "NORTDGEBIET_92");
	Wld_InsertNpc	(Gobbo_Skeleton, "NORTDGEBIET_92");
	Wld_InsertNpc	(Gobbo_Skeleton, "NORTDGEBIET_92");
	Wld_InsertNpc	(Gobbo_Skeleton, "NORTDGEBIET_92");
	Wld_InsertNpc	(Gobbo_Skeleton, "NORTDGEBIET_92");
	Wld_InsertNpc	(Gobbo_Skeleton_Eis, "NORTDGEBIET_92");
};

INSTANCE Info_Mod_Pilar_Pickpocket (C_INFO)
{
	npc		= Mod_7566_OUT_Pilar_EIS;
	nr		= 1;
	condition	= Info_Mod_Pilar_Pickpocket_Condition;
	information	= Info_Mod_Pilar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Pilar_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 250);
};

FUNC VOID Info_Mod_Pilar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Pilar_Pickpocket);

	Info_AddChoice	(Info_Mod_Pilar_Pickpocket, DIALOG_BACK, Info_Mod_Pilar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Pilar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Pilar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Pilar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Pilar_Pickpocket);
};

FUNC VOID Info_Mod_Pilar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Pilar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Pilar_Pickpocket);

		Info_AddChoice	(Info_Mod_Pilar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Pilar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Pilar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Pilar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Pilar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Pilar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Pilar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Pilar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Pilar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Pilar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Pilar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Pilar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Pilar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Pilar_EXIT (C_INFO)
{
	npc		= Mod_7566_OUT_Pilar_EIS;
	nr		= 1;
	condition	= Info_Mod_Pilar_EXIT_Condition;
	information	= Info_Mod_Pilar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Pilar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Pilar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};