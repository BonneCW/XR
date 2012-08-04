INSTANCE Info_Mod_Sabitsch_Hi (C_INFO)
{
	npc		= Mod_7024_OUT_Sabitsch_MT;
	nr		= 1;
	condition	= Info_Mod_Sabitsch_Hi_Condition;
	information	= Info_Mod_Sabitsch_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, ich habe gehört du kämpfst in der Arena?";
};

FUNC INT Info_Mod_Sabitsch_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sabitsch_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Sabitsch_Hi_15_00"); //Hallo, ich habe gehört du kämpfst in der Arena?
	AI_Output(self, hero, "Info_Mod_Sabitsch_Hi_04_01"); //(leicht despektierlich) Wenn der Einsatz stimmt. Ich will ja auch etwas daran verdienen, wenn schon meine Axt an den Köpfen meiner Gegner schartig wird und von ihrem Blut rosten soll.
};

INSTANCE Info_Mod_Sabitsch_Arenakampf (C_INFO)
{
	npc		= Mod_7024_OUT_Sabitsch_MT;
	nr		= 1;
	condition	= Info_Mod_Sabitsch_Arenakampf_Condition;
	information	= Info_Mod_Sabitsch_Arenakampf_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will gegen dich kämpfen.";
};

FUNC INT Info_Mod_Sabitsch_Arenakampf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sabitsch_Hi))
	&& (Mod_SabitschArenaLooser == FALSE)
	&& (Mod_SabitschKampf == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabitsch_Arenakampf_Info()
{
	AI_Output(hero, self, "Info_Mod_Sabitsch_Arenakampf_15_00"); //Ich will gegen dich kämpfen.
	AI_Output(self, hero, "Info_Mod_Sabitsch_Arenakampf_04_01"); //Wie hoch ist der Einsatz?

	Info_ClearChoices	(Info_Mod_Sabitsch_Arenakampf);

	Info_AddChoice	(Info_Mod_Sabitsch_Arenakampf, DIALOG_BACK, Info_Mod_Sabitsch_Arenakampf_BACK);

	if (Npc_KnowsInfo(hero, Info_Mod_Quentin_AmulettWeg))
	|| (Npc_KnowsInfo(hero, Info_Mod_Scatty_AboutSabitsch))
	{
		if (Mod_SabitschRingTalk == FALSE)
		{
			Info_AddChoice	(Info_Mod_Sabitsch_Arenakampf, "Kann ich auch etwas anderes als Wetteinsatz hergeben?", Info_Mod_Sabitsch_Arenakampf_E);
		}
		else
		{
			if (Npc_HasItems(hero, ItRi_SkinnersRing_Gold) == 1)
			{
				Info_AddChoice	(Info_Mod_Sabitsch_Arenakampf, "Goldglänzender Orkring.", Info_Mod_Sabitsch_Arenakampf_G);
			};
			if (Npc_HasItems(hero, ItMi_GoldRing) >= 1)
			{
				Info_AddChoice	(Info_Mod_Sabitsch_Arenakampf, "1 Goldring.", Info_Mod_Sabitsch_Arenakampf_F);
			};
			if (Npc_HasItems(hero, ItMi_SilverRing) >= 2)
			{
				Info_AddChoice	(Info_Mod_Sabitsch_Arenakampf, "2 Silberringe.", Info_Mod_Sabitsch_Arenakampf_D);
			};
		};
	};

	if (Npc_HasItems(hero, ItMi_Gold) >= 200)
	{
		Info_AddChoice	(Info_Mod_Sabitsch_Arenakampf, "200 Gold.", Info_Mod_Sabitsch_Arenakampf_C);
	};
	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		Info_AddChoice	(Info_Mod_Sabitsch_Arenakampf, "100 Gold.", Info_Mod_Sabitsch_Arenakampf_B);
	};

	Info_AddChoice	(Info_Mod_Sabitsch_Arenakampf, "50 Gold.", Info_Mod_Sabitsch_Arenakampf_A);
};

FUNC VOID Info_Mod_Sabitsch_Arenakampf_BACK()
{
	Info_ClearChoices	(Info_Mod_Sabitsch_Arenakampf);
};

FUNC VOID Info_Mod_Sabitsch_Arenakampf_E()
{
	AI_Output(hero, self, "Info_Mod_Sabitsch_Arenakampf_E_15_00"); //Kann ich auch etwas anderes als Wetteinsatz hergeben? Wie wäre es mit einigen wertvollen Schmuckstücken?
	AI_Output(self, hero, "Info_Mod_Sabitsch_Arenakampf_E_04_01"); //Aber sicher doch, ich wollte meine Sammlung mal wieder um einige Ringe erweitern. Müssen jedoch schon ein goldener oder zwei silberne Ringe sein.

	Mod_SabitschRingTalk = TRUE;

	Info_ClearChoices	(Info_Mod_Sabitsch_Arenakampf);

	if (Npc_HasItems(hero, ItRi_SkinnersRing_Gold) == 1)
	{
		Info_AddChoice	(Info_Mod_Sabitsch_Arenakampf, "Goldglänzender Orkring.", Info_Mod_Sabitsch_Arenakampf_G);
	};
	if (Npc_HasItems(hero, ItMi_GoldRing) >= 1)
	{
		Info_AddChoice	(Info_Mod_Sabitsch_Arenakampf, "1 Goldring.", Info_Mod_Sabitsch_Arenakampf_F);
	};
	if (Npc_HasItems(hero, ItMi_SilverRing) >= 2)
	{
		Info_AddChoice	(Info_Mod_Sabitsch_Arenakampf, "2 Silberringe.", Info_Mod_Sabitsch_Arenakampf_D);
	};
};

FUNC VOID Info_Mod_Sabitsch_Arenakampf_G()
{
	AI_Output(hero, self, "Info_Mod_Sabitsch_Arenakampf_G_15_00"); //Ein goldener Ring.
	AI_Output(self, hero, "Info_Mod_Sabitsch_Arenakampf_G_04_01"); //Dieses schöne Stück werde ich mir sofort anlegen, da du es ohnehin nicht mehr in die Hände bekommen wirst.

	B_GiveInvItems	(hero, self, ItRi_SkinnersRing_Gold, 1);

	Info_ClearChoices	(Info_Mod_Sabitsch_Arenakampf);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ARENA");

	Mod_SabitschKampf = 1;
	Mod_SabitschHatteRing = 1;
};

FUNC VOID Info_Mod_Sabitsch_Arenakampf_F()
{
	AI_Output(hero, self, "Info_Mod_Sabitsch_Arenakampf_F_15_00"); //Ein Goldring.
	AI_Output(self, hero, "Info_Mod_Sabitsch_Arenakampf_C_04_01"); //Das hör ich gerne. Wir können sofort anfangen.

	B_GiveInvItems	(hero, self, ItMi_GoldRing, 1);

	Info_ClearChoices	(Info_Mod_Sabitsch_Arenakampf);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ARENA");

	Mod_SabitschKampf = 1;
};

FUNC VOID Info_Mod_Sabitsch_Arenakampf_D()
{
	AI_Output(hero, self, "Info_Mod_Sabitsch_Arenakampf_D_15_00"); //Zwei Silberringe.
	AI_Output(self, hero, "Info_Mod_Sabitsch_Arenakampf_C_04_01"); //Das hör ich gerne. Wir können sofort anfangen.

	B_GiveInvItems	(hero, self, ItMi_SilverRing, 2);

	Info_ClearChoices	(Info_Mod_Sabitsch_Arenakampf);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ARENA");

	Mod_SabitschKampf = 1;
};

FUNC VOID Info_Mod_Sabitsch_Arenakampf_C()
{
	AI_Output(hero, self, "Info_Mod_Sabitsch_Arenakampf_C_15_00"); //200 Gold.
	AI_Output(self, hero, "Info_Mod_Sabitsch_Arenakampf_C_04_01"); //Das hör ich gerne. Wir können sofort anfangen.

	B_GiveInvItems	(hero, self, ItMi_Gold, 200);

	Info_ClearChoices	(Info_Mod_Sabitsch_Arenakampf);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ARENA");

	Mod_SabitschKampf = 1;
};

FUNC VOID Info_Mod_Sabitsch_Arenakampf_B()
{
	AI_Output(hero, self, "Info_Mod_Sabitsch_Arenakampf_B_15_00"); //100 Gold.
	AI_Output(self, hero, "Info_Mod_Sabitsch_Arenakampf_B_04_01"); //Zwar etwas wenig, aber manchmal muss man eben seine Ansprüche herunterschrauben.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	Info_ClearChoices	(Info_Mod_Sabitsch_Arenakampf);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ARENA");

	Mod_SabitschKampf = 1;
};

FUNC VOID Info_Mod_Sabitsch_Arenakampf_A()
{
	AI_Output(hero, self, "Info_Mod_Sabitsch_Arenakampf_A_15_00"); //50 Gold.
	AI_Output(self, hero, "Info_Mod_Sabitsch_Arenakampf_A_04_01"); //Was?! Dafür hole ich doch nicht mal meine Axt hervor.

	Info_ClearChoices	(Info_Mod_Sabitsch_Arenakampf);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Sabitsch_Arenakampf2 (C_INFO)
{
	npc		= Mod_7024_OUT_Sabitsch_MT;
	nr		= 1;
	condition	= Info_Mod_Sabitsch_Arenakampf2_Condition;
	information	= Info_Mod_Sabitsch_Arenakampf2_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Sabitsch_Arenakampf2_Condition()
{
	if (Mod_SabitschKampf == TRUE)
	&& (Npc_GetDistToWP(self, "OCR_ARENABATTLE_TRAIN") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabitsch_Arenakampf2_Info()
{
	AI_Output(self, hero, "Info_Mod_Sabitsch_Arenakampf2_04_00"); //Dann komm mal her!

	if (Mod_SabitschHatteRing == TRUE)
	{
		self.attribute[ATR_STRENGTH] = 150;
	};

	AI_UnequipWeapons	(self);
	
	AI_EquipBestMeleeWeapon	(self);

	B_StartOtherRoutine	(self, "START");

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);

	Mod_SabitschKampf = FALSE;

	Mod_ArenaKampfStarted = 1;
};

INSTANCE Info_Mod_Sabitsch_Umgehauen (C_INFO)
{
	npc		= Mod_7024_OUT_Sabitsch_MT;
	nr		= 1;
	condition	= Info_Mod_Sabitsch_Umgehauen_Condition;
	information	= Info_Mod_Sabitsch_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sabitsch_Umgehauen_Condition()
{
	if (Mod_SabitschKampf == FALSE)
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	&& (Mod_ArenaKampfStarted == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabitsch_Umgehauen_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
		{
			if (Mod_SabitschHatteRing == TRUE)
			{
				AI_Output(self, hero, "Info_Mod_Sabitsch_Umgehauen_04_00"); //(wütend) Das ist nicht möglich, ich konnte meine Waffe nicht ziehen. Dahinter steckt doch bestimmt üble Zauberei.
				AI_Output(hero, self, "Info_Mod_Sabitsch_Umgehauen_15_01"); //Man soll den Mund besser nicht zu voll nehmen.
			};

			AI_Output(self, hero, "Info_Mod_Sabitsch_Umgehauen_04_02"); //Ach, lass mich in Ruhe.

			B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Sabitsch hat in der Arena ordentlich Federn lassen müssen. Ich habe das Amulett und sollte es jetzt Dexter bringen.");

			Mod_SabitschArenaLooser = TRUE;
		}
		else if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Sabitsch_Umgehauen_04_03"); //Bist wohl doch nur ein Großmaul.
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};

	AI_UnequipWeapons	(self);
};

INSTANCE Info_Mod_Sabitsch_Diebstahl (C_INFO)
{
	npc		= Mod_7024_OUT_Sabitsch_MT;
	nr		= 1;
	condition	= Info_Mod_Sabitsch_Diebstahl_Condition;
	information	= Info_Mod_Sabitsch_Diebstahl_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sabitsch_Diebstahl_Condition()
{
	if (Mod_SabitschAmulettGeklaut == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabitsch_Diebstahl_Info()
{
	AI_Output(self, hero, "Info_Mod_Sabitsch_Diebstahl_04_00"); //Mein Amulett, wo ist es? Na warte, dreckiger Dieb.

	Mod_SabitschAmulettGeklaut = 2;

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Theft, 0);
};

INSTANCE Info_Mod_Sabitsch_HabDeinAmulett (C_INFO)
{
	npc		= Mod_7024_OUT_Sabitsch_MT;
	nr		= 1;
	condition	= Info_Mod_Sabitsch_HabDeinAmulett_Condition;
	information	= Info_Mod_Sabitsch_HabDeinAmulett_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, möchtest du dein Amulett wiederhaben?";
};

FUNC INT Info_Mod_Sabitsch_HabDeinAmulett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_FakeAmulett))
	&& (Npc_HasItems(hero, ItAm_MegaAmulett) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabitsch_HabDeinAmulett_Info()
{
	AI_Output(hero, self, "Info_Mod_Sabitsch_HabDeinAmulett_15_00"); //Hey, möchtest du dein Amulett wiederhaben?

	AI_ReadyMeleeWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Sabitsch_HabDeinAmulett_04_01"); //Was, du hast mein Amulett?! Du willst mich wohl verspotten. Her damit!

	Info_ClearChoices	(Info_Mod_Sabitsch_HabDeinAmulett);

	Info_AddChoice	(Info_Mod_Sabitsch_HabDeinAmulett, "Klar, hier hast du es.", Info_Mod_Sabitsch_HabDeinAmulett_B);
	Info_AddChoice	(Info_Mod_Sabitsch_HabDeinAmulett, "Hol es dir doch.", Info_Mod_Sabitsch_HabDeinAmulett_A);
};

FUNC VOID Info_Mod_Sabitsch_HabDeinAmulett_B()
{
	AI_Output(hero, self, "Info_Mod_Sabitsch_HabDeinAmulett_B_15_00"); //Klar, hier hast du es.

	B_GiveInvItems	(hero, self, ItAm_MegaAmulett, 1);

	AI_Output(self, hero, "Info_Mod_Sabitsch_HabDeinAmulett_B_04_01"); //(überrascht) Ähh, was? Du gibst es mir einfach so, ohne Kampf? Das geht doch nicht.
	AI_Output(self, hero, "Info_Mod_Sabitsch_HabDeinAmulett_B_04_02"); //Wäre nicht gut für meinen Ruf und gegen meine Prinzipien.
	AI_Output(self, hero, "Info_Mod_Sabitsch_HabDeinAmulett_B_04_03"); //Aber warte, ich werde dich zumindest noch ein paar Sachen über den Nahkampf lehren.
	AI_Output(self, hero, "Info_Mod_Sabitsch_HabDeinAmulett_B_04_04"); //Also, je nachdem, ob du die Waffe auf der rechten, oder linken Seiten schwingst, musst du die Ferse auf der selben Seite anheben und mit dem Körper nach vorne gehen.
	AI_Output(self, hero, "Info_Mod_Sabitsch_HabDeinAmulett_B_04_05"); //Das bringt mehr Wucht in den Schlag. Verstanden? Ok. Damit wäre die Sache im Reinen.

	B_GivePlayerXP	(200);

	B_RaiseFightTalent	(hero, NPC_TALENT_1H, 2);
	B_RaiseFightTalent	(hero, NPC_TALENT_2H, 2);

	PrintScreen	("+2% Einhand und Zweihand", -1, -1, FONT_SCREEN, 2);

	Info_ClearChoices	(Info_Mod_Sabitsch_HabDeinAmulett);
};

FUNC VOID Info_Mod_Sabitsch_HabDeinAmulett_A()
{
	AI_Output(hero, self, "Info_Mod_Sabitsch_HabDeinAmulett_A_15_00"); //Hol es dir doch. 
	AI_Output(self, hero, "Info_Mod_Sabitsch_HabDeinAmulett_A_04_01"); //Na warte.

	Info_ClearChoices	(Info_Mod_Sabitsch_HabDeinAmulett);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Theft, 0);
};

INSTANCE Info_Mod_Sabitsch_Pickpocket (C_INFO)
{
	npc		= Mod_7024_OUT_Sabitsch_MT;
	nr		= 1;
	condition	= Info_Mod_Sabitsch_Pickpocket_Condition;
	information	= Info_Mod_Sabitsch_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Sabitsch_Pickpocket_Condition()
{
	if (Npc_HasItems(hero, ItAm_MegaAmulett) > 0)
	{
		return FALSE;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_AmulettBack))
	{
		return FALSE;
	};

	C_Beklauen	(120, ItAm_MegaAmulett, 1);
};

FUNC VOID Info_Mod_Sabitsch_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sabitsch_Pickpocket);

	Info_AddChoice	(Info_Mod_Sabitsch_Pickpocket, DIALOG_BACK, Info_Mod_Sabitsch_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sabitsch_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sabitsch_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sabitsch_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sabitsch_Pickpocket);
};

FUNC VOID Info_Mod_Sabitsch_Pickpocket_DoIt()
{
	B_Beklauen();

	if (Npc_HasItems(hero, ItAm_MegaAmulett) == 1)
	{
		Mod_SabitschAmulettGeklaut = TRUE;
	};

	Info_ClearChoices	(Info_Mod_Sabitsch_Pickpocket);
};

INSTANCE Info_Mod_Sabitsch_EXIT (C_INFO)
{
	npc		= Mod_7024_OUT_Sabitsch_MT;
	nr		= 1;
	condition	= Info_Mod_Sabitsch_EXIT_Condition;
	information	= Info_Mod_Sabitsch_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sabitsch_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sabitsch_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};