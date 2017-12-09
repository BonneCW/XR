INSTANCE Info_Mod_Naim_Hi (C_INFO)
{
	npc		= Mod_7147_ASS_Naim_NW;
	nr		= 1;
	condition	= Info_Mod_Naim_Hi_Condition;
	information	= Info_Mod_Naim_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe einen der Blutkelche besorgt.";
};

FUNC INT Info_Mod_Naim_Hi_Condition()
{
	if (Npc_HasItems(hero, ItMi_Bloodcup_Richter) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Naim_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Naim_Hi_15_00"); //Ich habe einen der Blutkelche besorgt.

	B_GiveInvItems	(hero, self, ItMi_Bloodcup_Richter, 1);

	AI_Output(self, hero, "Info_Mod_Naim_Hi_13_01"); //Saubere Arbeit, Bursche. Wir hörten, du hast bereits den ersten Kelch gebracht.
	AI_Output(hero, self, "Info_Mod_Naim_Hi_15_02"); //So ist es.
	AI_Output(self, hero, "Info_Mod_Naim_Hi_13_03"); //Du wirst es weit bringen, wenn du so weiter machst. Ich ernennen dich hiermit zum 1. Anwärter. Hier, deine Rüstung.
	AI_Output(hero, self, "Info_Mod_Naim_Hi_15_04"); //Besten Dank, hoher Rat.

	if (Mod_ASS_Krieger == 1)
	{
		CreateInvItems	(hero, ItAr_Assassine_01, 1);

		B_ShowGivenThings	("Assassinenrüstung erhalten");

		AI_Output(self, hero, "Info_Mod_Naim_Hi_13_05"); //Nun melde dich bei Azhar. Er hat wohl ein Problem.

		B_SetTopicStatus	(TOPIC_MOD_ASS_KRIEGER, LOG_SUCCESS);
	}
	else
	{
		CreateInvItems	(hero, ItAr_Assassine_02, 1);

		B_ShowGivenThings	("Assassinenrobe erhalten");

		AI_Output(self, hero, "Info_Mod_Naim_Hi_13_06"); //Nun melde dich bei Kais. Er hat wohl ein Problem.
	};

	B_SetTopicStatus	(TOPIC_MOD_ASS_BLUTKELCH, LOG_SUCCESS);

	B_GivePlayerXP	(500);
};

INSTANCE Info_Mod_Naim_Comeback (C_INFO)
{
	npc		= Mod_7147_ASS_Naim_NW;
	nr		= 1;
	condition	= Info_Mod_Naim_Comeback_Condition;
	information	= Info_Mod_Naim_Comeback_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Naim_Comeback_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Norek_Comeback))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Naim_Comeback_Info()
{
	AI_Output(self, hero, "Info_Mod_Naim_Comeback_13_00"); //Wie ich höre, hast du Erstaunliches geleistet für die Gemeinschaft.
	AI_Output(self, hero, "Info_Mod_Naim_Comeback_13_01"); //Wenn es uns gelingt, auf's Festland zurückzukehren, wirst du dann mitkommen? Ich würde dich in den Rat berufen.
	AI_Output(hero, self, "Info_Mod_Naim_Comeback_15_02"); //Ein verlockendes Angebot. Sicher werde ich irgendwann in die Heimat zurückkehren.
	AI_Output(hero, self, "Info_Mod_Naim_Comeback_15_03"); //Aber vorerst habe ich noch zu tun auf Khorinis. Danke, hoher Rat.
	AI_Output(self, hero, "Info_Mod_Naim_Comeback_13_04"); //Deine Entscheidung, Magier. Dann entlasse ich dich hiermit aus den Diensten der Assassinen. Geh deiner Wege.

	B_GivePlayerXP	(2000);

	Mod_ASS_Comeback = Wld_GetDay();
};

INSTANCE Info_Mod_Naim_GotoAzhar (C_INFO)
{
	npc		= Mod_7147_ASS_Naim_NW;
	nr		= 1;
	condition	= Info_Mod_Naim_GotoAzhar_Condition;
	information	= Info_Mod_Naim_GotoAzhar_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Naim_GotoAzhar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Azhar_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Azhar_Later))
	&& (Mod_ASS_Krieger == 1)
	&& (Kapitel >= 5)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Naim_GotoAzhar_Info()
{
	AI_Output(self, hero, "Info_Mod_Naim_GotoAzhar_13_00"); //Hatte ich dir nicht gesagt, du sollst dich bei Azhar melden?
	AI_Output(hero, self, "Info_Mod_Naim_GotoAzhar_15_01"); //Schon. Ich war auch bei ihm, aber er wollte nichts von mir.
	AI_Output(self, hero, "Info_Mod_Naim_GotoAzhar_13_02"); //Jetzt schon. Scheint wichtig zu sein.
	AI_Output(hero, self, "Info_Mod_Naim_GotoAzhar_15_03"); //Ich eile ...
};

INSTANCE Info_Mod_Naim_NachSchlacht (C_INFO)
{
	npc		= Mod_7147_ASS_Naim_NW;
	nr		= 1;
	condition	= Info_Mod_Naim_NachSchlacht_Condition;
	information	= Info_Mod_Naim_NachSchlacht_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Naim_NachSchlacht_Condition()
{
	if (Mod_ASS_Schlacht == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Naim_NachSchlacht_Info()
{
	AI_Output(self, hero, "Info_Mod_Naim_NachSchlacht_13_00"); //(keucht) Schnell, ich brauche die Kelche. Sonst überleb ich das nicht.
	AI_Output(hero, self, "Info_Mod_Naim_NachSchlacht_15_01"); //Halte durch. Ich beeile mich.

	Mod_7146_ASS_Mustafa_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7147_ASS_Naim_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7145_ASS_Aadel_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7142_ASS_Elite_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7141_ASS_Elite_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7140_ASS_Elite_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7134_ASS_Anwaerter_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7138_ASS_Azhar_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7125_ASS_Karim_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7124_ASS_Anwaerter_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7133_ASS_Sinbad_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7131_ASS_Krieger_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7122_ASS_Maysara_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7123_ASS_Malik_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7126_ASS_Krieger_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7127_ASS_Krieger_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7118_ASS_Anwaerter_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7119_ASS_Masut_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7117_ASS_Krieger_NW.aivar[AIV_Partymember] = FALSE;
	Mod_7116_ASS_Krieger_NW.aivar[AIV_Partymember] = FALSE;

	B_StartOtherRoutine	(Mod_7134_ASS_Anwaerter_NW,	"START");
	B_StartOtherRoutine	(Mod_7138_ASS_Azhar_NW,	"START");
	B_StartOtherRoutine	(Mod_7125_ASS_Karim_NW,	"START");
	B_StartOtherRoutine	(Mod_7124_ASS_Anwaerter_NW,	"START");
	B_StartOtherRoutine	(Mod_7133_ASS_Sinbad_NW,	"START");
	B_StartOtherRoutine	(Mod_7131_ASS_Krieger_NW,	"START");
	B_StartOtherRoutine	(Mod_7122_ASS_Maysara_NW,	"START");
	B_StartOtherRoutine	(Mod_7123_ASS_Malik_NW,	"START");
	B_StartOtherRoutine	(Mod_7126_ASS_Krieger_NW,	"START");
	B_StartOtherRoutine	(Mod_7127_ASS_Krieger_NW,	"START");
	B_StartOtherRoutine	(Mod_7118_ASS_Anwaerter_NW,	"START");
	B_StartOtherRoutine	(Mod_7119_ASS_Masut_NW,	"START");
	B_StartOtherRoutine	(Mod_7117_ASS_Krieger_NW,	"START");
	B_StartOtherRoutine	(Mod_7116_ASS_Krieger_NW,	"START");
	B_StartOtherRoutine	(Mod_7142_ASS_Elite_NW,	"START");
	B_StartOtherRoutine	(Mod_7141_ASS_Elite_NW,	"START");
	B_StartOtherRoutine	(Mod_7140_ASS_Elite_NW,	"START");
	B_StartOtherRoutine	(Mod_7163_ASS_Kamal_NW,	"START");
};

INSTANCE Info_Mod_Naim_NachSchlacht2 (C_INFO)
{
	npc		= Mod_7147_ASS_Naim_NW;
	nr		= 1;
	condition	= Info_Mod_Naim_NachSchlacht2_Condition;
	information	= Info_Mod_Naim_NachSchlacht2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin zurück.";
};

FUNC INT Info_Mod_Naim_NachSchlacht2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Naim_NachSchlacht))
	&& (Npc_HasItems(hero, ItMi_Bloodcup_Richter) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Naim_NachSchlacht2_Info()
{
	AI_Output(hero, self, "Info_Mod_Naim_NachSchlacht2_15_00"); //Ich bin zurück.
	AI_Output(self, hero, "Info_Mod_Naim_NachSchlacht2_13_01"); //Endlich. Gib mir einen Kelch. Schnell.

	B_GiveInvItems	(hero, self, ItMi_Bloodcup_Richter, 1);

	AI_Output(self, hero, "Info_Mod_Naim_NachSchlacht2_13_02"); //Und einen für Mustafa. Beeil dich.

	B_GivePlayerXP	(2000);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Naim_NachSchlacht3 (C_INFO)
{
	npc		= Mod_7147_ASS_Naim_NW;
	nr		= 1;
	condition	= Info_Mod_Naim_NachSchlacht3_Condition;
	information	= Info_Mod_Naim_NachSchlacht3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dir geht es gut?";
};

FUNC INT Info_Mod_Naim_NachSchlacht3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_NachSchlacht))
	&& (Npc_HasItems(hero, ItMi_Bloodcup_MIS) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Naim_NachSchlacht3_Info()
{
	AI_Output(hero, self, "Info_Mod_Naim_NachSchlacht3_15_00"); //Dir geht es gut?
	AI_Output(self, hero, "Info_Mod_Naim_NachSchlacht3_13_01"); //Wie du siehst. Die Blutkelche sind unsere Rettung. Sie enthalten das Leben des getöteten vorherigen Besitzers.
	AI_Output(self, hero, "Info_Mod_Naim_NachSchlacht3_13_02"); //Wie ich sehe, ist Mustafa auch wieder auf den Beinen.
	AI_Output(self, hero, "Info_Mod_Naim_NachSchlacht3_13_03"); //Gib mir den 3. Kelch. Ich muss mir überlegen, wen ich noch ins Leben zurückhole.

	B_GiveInvItems	(hero, self, ItMi_Bloodcup_MIS, 1);

	AI_Output(hero, self, "Info_Mod_Naim_NachSchlacht3_15_04"); //Und was kann ich machen?
	AI_Output(self, hero, "Info_Mod_Naim_NachSchlacht3_13_05"); //Was ist eigentlich mit unseren Gaunern?
	AI_Output(hero, self, "Info_Mod_Naim_NachSchlacht3_15_06"); //Die stehen alle vor dem Lager und wissen nicht, was sie tun sollen.
	AI_Output(self, hero, "Info_Mod_Naim_NachSchlacht3_13_07"); //Dann schick den Anführer zu mir.
	AI_Output(self, hero, "Info_Mod_Naim_NachSchlacht3_13_08"); //Noch was. Du bist in der Tat ein sehr guter Krieger. Einer der Besten, die ich kenne.
	AI_Output(self, hero, "Info_Mod_Naim_NachSchlacht3_13_09"); //Aber ich hab den Eindruck, dass du nicht so recht zu uns passt.
	AI_Output(hero, self, "Info_Mod_Naim_NachSchlacht3_15_10"); //Wenn du meinst ...
	AI_Output(self, hero, "Info_Mod_Naim_NachSchlacht3_13_11"); //Dann stelle ich dir frei, unsere Gilde zu verlassen. Wobei ich davon ausgehe, dass du uns nicht auch noch verrätst.
	AI_Output(hero, self, "Info_Mod_Naim_NachSchlacht3_15_12"); //Verstehte. Ich schicke Shakir zu dir. Und ich hab noch andere Aufgaben.
	AI_Output(self, hero, "Info_Mod_Naim_NachSchlacht3_13_13"); //Moment. Hier, eine Belohnung für deine Hilfen.
	AI_Output(hero, self, "Info_Mod_Naim_NachSchlacht3_15_14"); //Danke, hoher Rat.

	B_GiveInvItems	(self, hero, ItMi_Gold, 2000);

	B_SetTopicStatus	(TOPIC_MOD_ASS_VERSCHWOERUNG, LOG_SUCCESS);
};

INSTANCE Info_Mod_Naim_Pickpocket (C_INFO)
{
	npc		= Mod_7147_ASS_Naim_NW;
	nr		= 1;
	condition	= Info_Mod_Naim_Pickpocket_Condition;
	information	= Info_Mod_Naim_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Naim_Pickpocket_Condition()
{
	C_Beklauen	(168, ItMi_Gold, 90);
};

FUNC VOID Info_Mod_Naim_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Naim_Pickpocket);

	Info_AddChoice	(Info_Mod_Naim_Pickpocket, DIALOG_BACK, Info_Mod_Naim_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Naim_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Naim_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Naim_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Naim_Pickpocket);
};

FUNC VOID Info_Mod_Naim_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Naim_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Naim_Pickpocket);

		Info_AddChoice	(Info_Mod_Naim_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Naim_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Naim_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Naim_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Naim_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Naim_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Naim_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Naim_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Naim_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Naim_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Naim_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Naim_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Naim_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Naim_EXIT (C_INFO)
{
	npc		= Mod_7147_ASS_Naim_NW;
	nr		= 1;
	condition	= Info_Mod_Naim_EXIT_Condition;
	information	= Info_Mod_Naim_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Naim_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Naim_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};