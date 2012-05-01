INSTANCE Info_Mod_Fernando_Hi (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_Hi_Condition;
	information	= Info_Mod_Fernando_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und wer bist du?";
};

FUNC INT Info_Mod_Fernando_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fernando_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_Hi_15_00"); //Und wer bist du?
	AI_Output(self, hero, "Info_Mod_Fernando_Hi_14_01"); //(schläfrig) Fernando. Entschuldige bitte meine Müdigkeit, ich schlafe derzeit schlecht.
};

INSTANCE Info_Mod_Fernando_BadSleep (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_BadSleep_Condition;
	information	= Info_Mod_Fernando_BadSleep_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum schläfst du schlecht?";
};

FUNC INT Info_Mod_Fernando_BadSleep_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fernando_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_BadSleep_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_15_00"); //Warum schläfst du schlecht?

	AI_PlayAni	(self, "T_SEARCH");

	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_14_01"); //In dem Haus gegenüber spukt es! Unter dem Schlafraum der Paladine.
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_15_02"); //Ach ja.
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_14_03"); //Nein, wirklich! Seit der alte Mann gestorben ist, dem das Haus gehörte, knarzt und poltert es darin in der Nacht wie in Beliars Reich!
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_14_04"); //Kaum bin ich eingenickt, geht es schon los, manchmal stundenlang.
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_15_05"); //Wieso schaust du nicht nach, was die Geräusche verursacht?
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_14_06"); //(entsetzt) Das geht nicht! Ich, äh, na ja, wenn es nun der Geist des alten Mannes ist? Oder ein anderer Teufelsspuk?
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_15_07"); //Was meinen die Stadtwachen dazu?
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_14_08"); //Sie wollen es nicht wahrhaben! Grinsen mich frech an oder lachen mich aus!
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_14_09"); //Und ich sehe nun jeden Morgen aus wie gerädert. Bitte, würdest du dich der Sache annehmen?

	Info_ClearChoices	(Info_Mod_Fernando_BadSleep);

	Info_AddChoice	(Info_Mod_Fernando_BadSleep, "Ich glaube nicht an Geister.", Info_Mod_Fernando_BadSleep_B);
	Info_AddChoice	(Info_Mod_Fernando_BadSleep, "Ich werd mal nachsehen.", Info_Mod_Fernando_BadSleep_A);
};

FUNC VOID Info_Mod_Fernando_BadSleep_B()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_B_15_00"); //Ich glaube nicht an Geister.

	Info_ClearChoices	(Info_Mod_Fernando_BadSleep);
};

FUNC VOID Info_Mod_Fernando_BadSleep_A()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_A_15_00"); //Ich werd mal nachsehen.
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_A_14_01"); //Danke, danke! Mach, dass es aufhört!

	Log_CreateTopic	(TOPIC_MOD_FERNANDO_MITTERNACHTSSPUK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FERNANDO_MITTERNACHTSSPUK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FERNANDO_MITTERNACHTSSPUK, "Fernando wird nachts von Geräuschen aus seinem leer stehenden Nachbarhaus gequält. Dabei handelt es sich um das Gebäude unter dem Schlafraum der Paladine. Ich sollte mich um Mitternacht im Haus auf die Lauer legen und nachsehen, was dort vor sich geht.");

	Mod_Fernando_Mitternachtsspuk = 1;

	B_StartOtherRoutine	(Mod_754_NONE_Valentino_NW, "SPUK");
	B_StartOtherRoutine	(Mod_1066_VLK_Buergerin_NW, "SPUK");

	Info_ClearChoices	(Info_Mod_Fernando_BadSleep);
};

INSTANCE Info_Mod_Fernando_BadSleep2 (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_BadSleep2_Condition;
	information	= Info_Mod_Fernando_BadSleep2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fernando_BadSleep2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentino_Mitternachtsspuk))
	&& (Wld_IsTime(22,05,07,59))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_BadSleep2_Info()
{
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep2_14_00"); //(schreit) Hilfe, Hilfe! Oh Innos! (besinnt sich) Ach, du bist es nur. (gähnt)
};

INSTANCE Info_Mod_Fernando_BadSleep3 (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_BadSleep3_Condition;
	information	= Info_Mod_Fernando_BadSleep3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Rätsel um den Spuk im Nachbarhaus gelöst.";
};

FUNC INT Info_Mod_Fernando_BadSleep3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentino_Mitternachtsspuk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_BadSleep3_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep3_15_00"); //Ich habe das Rätsel um den Spuk im Nachbarhaus gelöst.
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_14_01"); //Ja?
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep3_15_02"); //Ein, äh, verliebtes Pärchen hat seine Stelldicheins dorthin verlegt.
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_14_03"); //Stelldich ...? (tonlos) Oh.
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep3_15_04"); //Kannst du mit dem Wissen besser schlafen?
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_14_05"); //(beschämt) Natürlich. (murmelt) Stelldicheins ...
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_14_06"); //Äh, du hast dir natürlich eine Belohnung verdient. Nimm das.

	B_GiveInvItems	(self, hero, ItMi_Gold, 150);

	if (Wld_IsTime(22,05,07,59))
	{
		AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_14_07"); //Und jetzt brauche ich dringend eine Mütze Schlaf.
	};

	Mod_FernandoBlubber = Wld_GetDay();

	B_SetTopicStatus	(TOPIC_MOD_FERNANDO_MITTERNACHTSSPUK, LOG_SUCCESS);

	B_GivePlayerXP	(100);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Fernando_SonjaFreier (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_SonjaFreier_Condition;
	information	= Info_Mod_Fernando_SonjaFreier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du einer von Sonjas Freiern?";
};

FUNC INT Info_Mod_Fernando_SonjaFreier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fernando_Hi))
	&& (Mod_Sonja_Freier == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_SonjaFreier_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_SonjaFreier_15_00"); //Bist du einer von Sonjas Freiern?
	AI_Output(self, hero, "Info_Mod_Fernando_SonjaFreier_14_01"); //(erschrocken) Psst! Nicht so laut!
	AI_Output(hero, self, "Info_Mod_Fernando_SonjaFreier_15_02"); //Also ja?
	AI_Output(self, hero, "Info_Mod_Fernando_SonjaFreier_14_03"); //(leise) Die Zeiten sind vorbei. Meine Frau ... sie hat etwas gemerkt. (wehmütig) Nein, nein, die Zeiten sind vorbei.

	Mod_Sonja_Freier = 2;

	B_LogEntry	(TOPIC_MOD_SONJA_FREIER, "Fernando ist Sonjas ehemaliger Stammkunde. Allerdings hat seine Frau von seiner Umtriebigkeit erfahren, sodass er sich nicht mehr ins Bordell wagt.");
};

INSTANCE Info_Mod_Fernando_BadSleep4 (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_BadSleep4_Condition;
	information	= Info_Mod_Fernando_BadSleep4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schläfst du jetzt gut?";
};

FUNC INT Info_Mod_Fernando_BadSleep4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fernando_BadSleep3))
	&& (Wld_GetDay() > Mod_FernandoBlubber)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_BadSleep4_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep4_15_00"); //Schläfst du jetzt gut?
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep4_14_01"); //Meistens. Nur nicht, wenn sie es nebenan zu wild treiben.
};

INSTANCE Info_Mod_Fernando_Pickpocket (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_Pickpocket_Condition;
	information	= Info_Mod_Fernando_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Fernando_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Fernando_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

	Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_BACK, Info_Mod_Fernando_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fernando_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fernando_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);
};

FUNC VOID Info_Mod_Fernando_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

		Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fernando_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fernando_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fernando_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fernando_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fernando_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fernando_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fernando_EXIT (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_EXIT_Condition;
	information	= Info_Mod_Fernando_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fernando_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fernando_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};