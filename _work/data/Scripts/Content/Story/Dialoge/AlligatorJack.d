INSTANCE Info_Mod_AlligatorJack_Hi (C_INFO)
{
	npc		= Mod_928_PIR_AlligatorJack_AW;
	nr		= 1;
	condition	= Info_Mod_AlligatorJack_Hi_Condition;
	information	= Info_Mod_AlligatorJack_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "So allein auf weiter Flur?";
};

FUNC INT Info_Mod_AlligatorJack_Hi_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Henry_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlligatorJack_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Hi_15_00"); //So allein auf weiter Flur?
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Hi_12_01"); //Als Jäger ist man meist allein. Allerdings sind meine Kumpels nicht weit.
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Hi_15_02"); //Da hinten, wo ich die Palisaden sehe?
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Hi_12_03"); //Genau. Dort ist unser Piratenlager.
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Hi_15_04"); //Piraten ... interessant. Was meinst du, könnte man bei euch mitmachen?
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Hi_12_05"); //Möglich. Da must du Käpt'n Greg fragen. Übrigens, mich nennt man Alligator Jack.
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Hi_15_06"); //Angenehm. Ich schau dann mal.

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_AlligatorJack_Beerdigung (C_INFO)
{
	npc		= Mod_928_PIR_AlligatorJack_AW;
	nr		= 1;
	condition	= Info_Mod_AlligatorJack_Beerdigung_Condition;
	information	= Info_Mod_AlligatorJack_Beerdigung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_AlligatorJack_Beerdigung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_AJAlive))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlligatorJack_Beerdigung_Info()
{
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Beerdigung_12_00"); //(zu sich selbst) Was, wie, wo bin ich? Zuletzt die Banditen und dann alles dunkel.

	AI_PlayAni	(self, "T_SEARCH");

	AI_Output(self, hero, "Info_Mod_AlligatorJack_Beerdigung_12_01"); //Und was ist mit euch passiert? Steht hier herum und gafft, als hättet ihr einen Geist gesehen.
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Beerdigung_12_02"); //Und Bäume, Blumen, Kaninchen? Was zur Seejungfrau ist hier passiert?
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Beerdigung_12_03"); //Kaum bin ich mal ne Stunde bewusstlos scheint das Lager gleich völlig zu verkommen.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_AlligatorJack_Sweetwater (C_INFO)
{
	npc		= Mod_928_PIR_AlligatorJack_AW;
	nr		= 1;
	condition	= Info_Mod_AlligatorJack_Sweetwater_Condition;
	information	= Info_Mod_AlligatorJack_Sweetwater_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist der Alligator-Spezialist?";
};

FUNC INT Info_Mod_AlligatorJack_Sweetwater_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Sweetwater))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlligatorJack_Sweetwater_Info()
{
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Sweetwater_15_00"); //Du bist der Alligator-Spezialist?
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Sweetwater_12_01"); //Ja, das bin ich. Und Jäger bin ich. (stolz) Vor allem aber Pirat.
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Sweetwater_15_02"); //Und was ist mit den Alligatoren?
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Sweetwater_12_03"); //Es sind ganz einfach zu viele geworden. Da müssen Muttertiere dabei sein.
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Sweetwater_15_04"); //Was ist, wenn ich dich unterstütze?
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Sweetwater_12_05"); //Dann könnten wir's wagen, denke ich.
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Sweetwater_15_06"); //Dann bleibe dicht bei mir. Nicht losstürmen oder so was.
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Sweetwater_12_07"); //Wem sagst du das, Kollege?
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Sweetwater_15_08"); //Hmm.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ALLIGATOREN");

	self.aivar[AIV_PARTYMEMBER] = TRUE;

	Wld_InsertNpc	(Alligator_AJ_01, "ADW_PIRATECAMP_INSEL_01");
	Wld_InsertNpc	(Alligator_AJ_02, "ADW_PIRATECAMP_INSEL_01");
	Wld_InsertNpc	(Alligator_AJ_03, "ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc	(Alligator_AJ_04, "ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc	(Alligator_AJ_05, "ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc	(Alligator_AJ_06, "ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc	(Alligator_AJ_07, "ADW_PIRATECAMP_WATERHOLE_08");
	Wld_InsertNpc	(Alligator_AJ_08, "ADW_PIRATECAMP_WATERHOLE_08");
	Wld_InsertNpc	(Alligator_AJ_09, "ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc	(Alligator_AJ_10, "ADW_PIRATECAMP_WATERHOLE_08");

	B_LogEntry	(TOPIC_MOD_JG_SWEETWATER, "Jack erzählt von einer Horde Tiere im Tal. Möglicherweise auch Muttertiere.");
};

INSTANCE Info_Mod_AlligatorJack_Sweetwater2 (C_INFO)
{
	npc		= Mod_928_PIR_AlligatorJack_AW;
	nr		= 1;
	condition	= Info_Mod_AlligatorJack_Sweetwater2_Condition;
	information	= Info_Mod_AlligatorJack_Sweetwater2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_AlligatorJack_Sweetwater2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AlligatorJack_Sweetwater))
	&& (Npc_IsDead(Alligator_AJ_01))
	&& (Npc_IsDead(Alligator_AJ_02))
	&& (Npc_IsDead(Alligator_AJ_03))
	&& (Npc_IsDead(Alligator_AJ_04))
	&& (Npc_IsDead(Alligator_AJ_05))
	&& (Npc_IsDead(Alligator_AJ_06))
	&& (Npc_IsDead(Alligator_AJ_07))
	&& (Npc_IsDead(Alligator_AJ_08))
	&& (Npc_IsDead(Alligator_AJ_09))
	&& (Npc_IsDead(Alligator_AJ_10))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlligatorJack_Sweetwater2_Info()
{
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Sweetwater2_12_00"); //Puh, zähe Biester.
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Sweetwater2_15_01"); //Doch Muttertiere. Du hattest recht. Und ein brauchbarer Jäger bist du auch.
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Sweetwater2_12_02"); //Danke für das Lob. Man hört so was nicht oft hier.
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Sweetwater2_15_03"); //Schon gut. Sag Greg Bescheid. Und er soll dafür sorgen, dass die Magier auch frisches Wasser bekommen. Ich muss weiter.
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Sweetwater2_12_04"); //Wird gemacht. Und danke noch mal.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_LogEntry	(TOPIC_MOD_JG_SWEETWATER, "So, wieder was erledigt. Die Leute haben Süßwasser. Was Saturas wohl sagt ...");
};

INSTANCE Info_Mod_AlligatorJack_Todesangst (C_INFO)
{
	npc		= Mod_928_PIR_AlligatorJack_AW;
	nr		= 1;
	condition	= Info_Mod_AlligatorJack_Todesangst_Condition;
	information	= Info_Mod_AlligatorJack_Todesangst_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo Jack. Was macht die Jagd?";
};

FUNC INT Info_Mod_AlligatorJack_Todesangst_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Norek_Heimweh))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Henry_Todesangst))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlligatorJack_Todesangst_Info()
{
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Todesangst_15_00"); //Hallo Jack. Was macht die Jagd?
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Todesangst_12_01"); //Geht so. Du willst ins Lager?
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Todesangst_15_02"); //Genau. Warum fragst du?
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Todesangst_12_03"); //Du wirst dich wundern. Der Alte ist verrückt geworden.
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Todesangst_15_04"); //Der Kapitän?
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Todesangst_12_05"); //Ja. Wahrscheinlich lässt dich Henry gar nicht rein. Wirst schon sehen.
};

INSTANCE Info_Mod_AlligatorJack_Todesangst2 (C_INFO)
{
	npc		= Mod_928_PIR_AlligatorJack_AW;
	nr		= 1;
	condition	= Info_Mod_AlligatorJack_Todesangst2_Condition;
	information	= Info_Mod_AlligatorJack_Todesangst2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du sollst mich ins Lager begleiten. Wohl als Aufpasser.";
};

FUNC INT Info_Mod_AlligatorJack_Todesangst2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Henry_Todesangst))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlligatorJack_Todesangst2_Info()
{
	AI_Output(hero, self, "Info_Mod_AlligatorJack_Todesangst2_15_00"); //Du sollst mich ins Lager begleiten. Wohl als Aufpasser.
	AI_Output(self, hero, "Info_Mod_AlligatorJack_Todesangst2_12_01"); //Hab ich's nicht gesagt? Der Chef spinnt. Gehen wir.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_AlligatorJack_Pickpocket (C_INFO)
{
	npc		= Mod_928_PIR_AlligatorJack_AW;
	nr		= 1;
	condition	= Info_Mod_AlligatorJack_Pickpocket_Condition;
	information	= Info_Mod_AlligatorJack_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_AlligatorJack_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_AlligatorJack_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_AlligatorJack_Pickpocket);

	Info_AddChoice	(Info_Mod_AlligatorJack_Pickpocket, DIALOG_BACK, Info_Mod_AlligatorJack_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_AlligatorJack_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_AlligatorJack_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_AlligatorJack_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_AlligatorJack_Pickpocket);
};

FUNC VOID Info_Mod_AlligatorJack_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_AlligatorJack_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_AlligatorJack_Pickpocket);

		Info_AddChoice	(Info_Mod_AlligatorJack_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_AlligatorJack_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_AlligatorJack_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_AlligatorJack_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_AlligatorJack_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_AlligatorJack_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_AlligatorJack_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_AlligatorJack_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_AlligatorJack_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_AlligatorJack_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_AlligatorJack_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_AlligatorJack_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_AlligatorJack_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_AlligatorJack_EXIT (C_INFO)
{
	npc		= Mod_928_PIR_AlligatorJack_AW;
	nr		= 1;
	condition	= Info_Mod_AlligatorJack_EXIT_Condition;
	information	= Info_Mod_AlligatorJack_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_AlligatorJack_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_AlligatorJack_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};