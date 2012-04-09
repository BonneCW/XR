INSTANCE Info_Mod_Bones_Hi (C_INFO)
{
	npc		= Mod_930_PIR_Bones_AW;
	nr		= 1;
	condition	= Info_Mod_Bones_Hi_Condition;
	information	= Info_Mod_Bones_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Bones_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bones_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Bones_Hi_01_01"); //Ich bin Bones. Noch was wichtiges?
};

INSTANCE Info_Mod_Bones_Irdorath (C_INFO)
{
	npc		= Mod_930_PIR_Bones_AW;
	nr		= 1;
	condition	= Info_Mod_Bones_Irdorath_Condition;
	information	= Info_Mod_Bones_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich plane eine Exkursion mit dem Schiff der Paladine.";
};

FUNC INT Info_Mod_Bones_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bones_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bones_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Bones_Irdorath_15_00"); //Ich plane eine Exkursion mit dem Schiff der Paladine.
	AI_Output(hero, self, "Info_Mod_Bones_Irdorath_15_01"); //Es geht zu einer Insel des Magiers Xeres ...
	AI_Output(self, hero, "Info_Mod_Bones_Irdorath_01_02"); //Und was geht mich das an?
	AI_Output(hero, self, "Info_Mod_Bones_Irdorath_15_03"); //Du könntest meiner Mannschaft beitreten.
	AI_Output(hero, self, "Info_Mod_Bones_Irdorath_15_04"); //Es gibt bestimmt was zu holen und Greg hat nichts dagegen.
	AI_Output(self, hero, "Info_Mod_Bones_Irdorath_01_05"); //Ach, ist das so ... Tja, hmm, warum eigentlich nicht ...
	AI_Output(self, hero, "Info_Mod_Bones_Irdorath_01_06"); //Ich habe da nur eine Bedingung ...
	AI_Output(hero, self, "Info_Mod_Bones_Irdorath_15_07"); //Na, das war ja klar ... Was willst du?
	AI_Output(self, hero, "Info_Mod_Bones_Irdorath_01_08"); //Frauen!
	AI_Output(hero, self, "Info_Mod_Bones_Irdorath_15_09"); //Wie?
	AI_Output(self, hero, "Info_Mod_Bones_Irdorath_01_10"); //Na, Weibsbilder an Bord.
	AI_Output(self, hero, "Info_Mod_Bones_Irdorath_01_11"); //Das Schiff der Paladine liegt doch in der Hafenstadt vor Anker.
	AI_Output(self, hero, "Info_Mod_Bones_Irdorath_01_12"); //Da kannst du mir doch bestimmt welche für die Reise heranschaffen.
	AI_Output(self, hero, "Info_Mod_Bones_Irdorath_01_13"); //(lüstern) Wäre doch sonst langweilig ... solange auf See und dann nicht mal Schiffe mit "Beute" zum Entern.
	AI_Output(self, hero, "Info_Mod_Bones_Irdorath_01_14"); //Da muss man alles notwendige schon dabei haben.
	AI_Output(hero, self, "Info_Mod_Bones_Irdorath_15_15"); //Ähhm ... ich schaue mal was sich machen lässt.
	AI_Output(self, hero, "Info_Mod_Bones_Irdorath_01_16"); //Ich geh dann schon mal zur Hafenstadt. Und wehe du hast bis zum Aufbruch keine Weiber organisiert.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Ohh man. Jetzt soll ich für Bones ernsthaft Frauen besorgen, die uns auf der Reise begleiten. Hmm, wo kann ich Frauen finden, die tough genug wären, eine Seereise samt gefährlichem Abenteuer mitzumachen, und dann noch mit Bones an Bord ...");

	Mod_CrewCount += 1;

	Mod_BonesDabei = 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Bones_Befreiung (C_INFO)
{
	npc		= Mod_930_PIR_Bones_AW;
	nr		= 1;
	condition	= Info_Mod_Bones_Befreiung_Condition;
	information	= Info_Mod_Bones_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was gibt's Neues?";
};

FUNC INT Info_Mod_Bones_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bones_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bones_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Bones_Befreiung_15_00"); //Was gibt's Neues?
	AI_Output(self, hero, "Info_Mod_Bones_Befreiung_01_01"); //(verärgert) Meine Axt ist weg, das ist los!
	AI_Output(hero, self, "Info_Mod_Bones_Befreiung_15_02"); //Wie konnte das passieren?
	AI_Output(self, hero, "Info_Mod_Bones_Befreiung_01_03"); //Beim Angriff wimmelte es hier nur so von untoten Kriegern. Dabei wurde ich niedergeschlagen und diese Meute hat meine Axt mitgehen lassen.
	AI_Output(hero, self, "Info_Mod_Bones_Befreiung_15_04"); //Wohin sind die Kerle gegangen?
	AI_Output(self, hero, "Info_Mod_Bones_Befreiung_01_05"); //Keine Ahnung. Aber ein paar von denen sind bei Gregs Hütte rauf, als sie kapierten, dass sie uns Unterlegen waren. Den Berg dort sind sie hoch.
	AI_Output(hero, self, "Info_Mod_Bones_Befreiung_15_06"); //Ich werde mich dort mal umsehen.
	AI_Output(self, hero, "Info_Mod_Bones_Befreiung_01_07"); //(überrascht) Du willst mir helfen?
	AI_Output(hero, self, "Info_Mod_Bones_Befreiung_15_08"); //Ja.
	AI_Output(self, hero, "Info_Mod_Bones_Befreiung_01_09"); //Danke mann, aber bitte beeil dich.

	Log_CreateTopic	(TOPIC_MOD_BEL_PIRBONES, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRBONES, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_PIRBONES, "Der Pirat Bones hat im Kampf mit den Untoten seine Axt verloren. Ein paar der Diebe sind bei Gregs Hütte den Berg hinauf. Dort sollte ich mich mal umsehen.");

	Wld_InsertNpc	(Mod_7006_UntoterEliteNovize_AW, "WP_UNDEAD_05");
	Wld_InsertNpc	(Mod_7007_UntoterEliteNovize_AW, "WP_UNDEAD_05");
	Wld_InsertNpc	(Mod_7008_UntoterEliteNovize_AW, "WP_UNDEAD_05");
	Wld_InsertNpc	(Mod_7009_UntoterEliteNovize_AW, "WP_UNDEAD_05");
};

INSTANCE Info_Mod_Bones_Befreiung2 (C_INFO)
{
	npc		= Mod_930_PIR_Bones_AW;
	nr		= 1;
	condition	= Info_Mod_Bones_Befreiung2_Condition;
	information	= Info_Mod_Bones_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du deine Axt zurück.";
};

FUNC INT Info_Mod_Bones_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bones_Befreiung))
	&& (Npc_HasItems(hero, ItMw_BonesAxt) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bones_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Bones_Befreiung2_15_00"); //Hier hast du deine Axt zurück.

	B_GiveInvItems	(hero, self, ItMw_BonesAxt, 1);

	AI_EquipBestMeleeWeapon	(self);

	AI_ReadyMeleeWeapon	(self);

	AI_PlayAni	(self, "T_1HSINSPECT");

	AI_DrawWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Bones_Befreiung2_01_01"); //(zufrieden) Danke. Du kannst nun Greg ausrichten, dass ich wieder kampfbereit bin.
	AI_Output(hero, self, "Info_Mod_Bones_Befreiung2_15_02"); //Alles klar.
	AI_Output(self, hero, "Info_Mod_Bones_Befreiung2_01_03"); //Hier, nimm noch diese zwei Flaschen Grog und diesen Schnellen Hering.

	B_ShowGivenThings	("2 Grog und Schneller Hering erhalten");

	CreateInvItems	(hero, ItFo_Addon_Grog, 2);
	CreateInvItems	(hero, ItFo_Addon_SchnellerHering, 1);

	Mod_Piratenbefreiung += 1;

	B_GivePlayerXP	(200);

	AI_Output(hero, self, "Info_Mod_Bones_Befreiung2_15_04"); //Danke für den Schnaps.

	B_LogEntry_More	(TOPIC_MOD_BEL_PIRBONES, TOPIC_MOD_BEL_PIRATENLAGER, "Bones hat seine Axt nun wieder uns ist wieder kampfbereit.", "Bones ist wieder kampfbereit.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRBONES, LOG_SUCCESS);
};

INSTANCE Info_Mod_Bones_Beerdigung (C_INFO)
{
	npc		= Mod_930_PIR_Bones_AW;
	nr		= 1;
	condition	= Info_Mod_Bones_Beerdigung_Condition;
	information	= Info_Mod_Bones_Beerdigung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bones_Beerdigung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_AJAlive2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bones_Beerdigung_Info()
{
	AI_Output(self, hero, "Info_Mod_Bones_Beerdigung_01_00"); //Und was gibt es zu essen?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Bones_Pickpocket (C_INFO)
{
	npc		= Mod_930_PIR_Bones_AW;
	nr		= 1;
	condition	= Info_Mod_Bones_Pickpocket_Condition;
	information	= Info_Mod_Bones_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Bones_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Bones_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bones_Pickpocket);

	Info_AddChoice	(Info_Mod_Bones_Pickpocket, DIALOG_BACK, Info_Mod_Bones_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bones_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bones_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bones_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bones_Pickpocket);
};

FUNC VOID Info_Mod_Bones_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Bones_Pickpocket);
};

INSTANCE Info_Mod_Bones_EXIT (C_INFO)
{
	npc		= Mod_930_PIR_Bones_AW;
	nr		= 1;
	condition	= Info_Mod_Bones_EXIT_Condition;
	information	= Info_Mod_Bones_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bones_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bones_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};