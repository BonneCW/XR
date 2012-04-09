INSTANCE Info_Mod_Cornelius_Hi (C_INFO)
{
	npc		= Mod_571_NONE_Cornelius_NW;
	nr		= 1;
	condition	= Info_Mod_Cornelius_Hi_Condition;
	information	= Info_Mod_Cornelius_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Cornelius_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cornelius_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Cornelius_Hi_13_01"); //Ich bin Cornelius, der stellvertretende Statthalter von Khorinis. Was kann ich für dich tun?
};

INSTANCE Info_Mod_Cornelius_Morgahard (C_INFO)
{
	npc		= Mod_571_NONE_Cornelius_NW;
	nr		= 1;
	condition	= Info_Mod_Cornelius_Morgahard_Condition;
	information	= Info_Mod_Cornelius_Morgahard_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will mit dir über Morgahard sprechen.";
};

FUNC INT Info_Mod_Cornelius_Morgahard_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_NW_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Cornelius_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cornelius_Morgahard_Info()
{
	AI_Output(hero, self, "Info_Mod_Cornelius_Morgahard_15_00"); //Ich will mit dir über Morgahard sprechen.
	AI_Output(self, hero, "Info_Mod_Cornelius_Morgahard_13_01"); //(nervös) Was ist mit ihm?
	AI_Output(hero, self, "Info_Mod_Cornelius_Morgahard_15_02"); //Ich glaube, das Verbrechen, aufgrund dessen er in die Kolonie geworfen wurde, hat er nicht begangen.
	AI_Output(self, hero, "Info_Mod_Cornelius_Morgahard_13_03"); //(verlegen) Nun, naja, das mag schon sein, allerdings ist es nun schon zu spät, er war schon in der Kolonie.
	AI_Output(hero, self, "Info_Mod_Cornelius_Morgahard_15_04"); //Das weiß ich, aber trotzdem will ich, dass er offiziell als unschuldig gilt.
	AI_Output(self, hero, "Info_Mod_Cornelius_Morgahard_13_05"); //Ich ... ich habe Beweise für seine Unschuld. Allerdings würden sie mich umbringen, wenn ich sie dir geben würde.
	AI_Output(hero, self, "Info_Mod_Cornelius_Morgahard_15_06"); //Wer würde dich umbringen?
	AI_Output(self, hero, "Info_Mod_Cornelius_Morgahard_13_07"); //Ich will mich mit dir heute Nacht auf dem leeren Marktplatz treffen. Dort können wir ungefährdet reden.

	B_LogEntry	(TOPIC_MOD_AL_MORGAHARD, "Cornelius kann nicht offen sprechen. Er will sich heute Nacht am Marktplatz mit mir treffen.");

	B_StartOtherRoutine	(self, "MARKT");
};

INSTANCE Info_Mod_Cornelius_AtMarkt (C_INFO)
{
	npc		= Mod_571_NONE_Cornelius_NW;
	nr		= 1;
	condition	= Info_Mod_Cornelius_AtMarkt_Condition;
	information	= Info_Mod_Cornelius_AtMarkt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Also, sag mir was du weißt.";
};

FUNC INT Info_Mod_Cornelius_AtMarkt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cornelius_Morgahard))
	&& (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_PATH_29_B") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cornelius_AtMarkt_Info()
{
	AI_Output(hero, self, "Info_Mod_Cornelius_AtMarkt_15_00"); //Also, sag mir, was du weißt.
	AI_Output(self, hero, "Info_Mod_Cornelius_AtMarkt_13_01"); //Nun, es gibt eine geheime Gruppe aus reichen Bürgern in der Stadt, die ziemlich viel Macht hat.
	AI_Output(self, hero, "Info_Mod_Cornelius_AtMarkt_13_02"); //Morgahard war ihnen ein Dorn im Auge, da er sich ihnen nicht anschließen wollte und gegen sie gearbeitet hat.
	AI_Output(self, hero, "Info_Mod_Cornelius_AtMarkt_13_03"); //Also haben sie ihm ein Verbrechen angedichtet und ihn in die Kolonie verbannen lassen.
	AI_Output(hero, self, "Info_Mod_Cornelius_AtMarkt_15_04"); //Wer sind die Mitglieder dieser Gruppe?
	AI_Output(self, hero, "Info_Mod_Cornelius_AtMarkt_13_05"); //Ich kenne nur einen, und das ist Gerbrandt.

	AI_StopProcessInfos	(self);

	AI_PlayAniBS (self, "T_DEAD", BS_LIE);

	B_LogEntry	(TOPIC_MOD_AL_MORGAHARD, "Cornelius konnte mir gerade noch sagen, dass Gerbrandt in der Sache mit drin hängt, danach ist er aber tot zusammengebrochen.");
};

INSTANCE Info_Mod_Cornelius_Ambient (C_INFO)
{
	npc		= Mod_571_NONE_Cornelius_NW;
	nr		= 1;
	condition	= Info_Mod_Cornelius_Ambient_Condition;
	information	= Info_Mod_Cornelius_Ambient_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gefällt dir dein Amt als stellvertretender Statthalter?";
};

FUNC INT Info_Mod_Cornelius_Ambient_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cornelius_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cornelius_Ambient_Info()
{
	AI_Output(hero, self, "Info_Mod_Cornelius_Ambient_15_00"); //Gefällt dir dein Amt als stellvertretender Statthalter?
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient_13_01"); //Dieser Titel ist doch eine einzige Verhöhnung!
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient_13_02"); //Ich warte nur darauf, dass sie mich offiziell als zweiten Aushilfsboten für Lord Hagen anstellen.
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient_13_03"); //Denn nichts anderes bin ich. Larius hat ein Wehwehchen? Ich muss es den Lords mitteilen.
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient_13_04"); //Lord Hagen hat einen Befehl? Auf zu Larius!
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient_13_05"); //Als ob die die zwei Zimmer nicht selbst laufen könnten!
};

INSTANCE Info_Mod_Cornelius_Ambient01 (C_INFO)
{
	npc		= Mod_571_NONE_Cornelius_NW;
	nr		= 1;
	condition	= Info_Mod_Cornelius_Ambient01_Condition;
	information	= Info_Mod_Cornelius_Ambient01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Dann bekommst du doch bestimmt viel mit von dem, was passiert.";
};

FUNC INT Info_Mod_Cornelius_Ambient01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cornelius_Ambient))
	&& (Mod_Cornelius_Overtalk == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cornelius_Ambient01_Info()
{
	AI_Output(hero, self, "Info_Mod_Cornelius_Ambient01_15_00"); //Dann bekommst du doch bestimmt viel mit von dem, was passiert.
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient01_13_01"); //Alles vertrauliche Informationen.

	Info_ClearChoices	(Info_Mod_Cornelius_Ambient01);

	Info_AddChoice	(Info_Mod_Cornelius_Ambient01, "Ich habe einen gut gefüllten Geldbeutel.", Info_Mod_Cornelius_Ambient01_B);
	Info_AddChoice	(Info_Mod_Cornelius_Ambient01, "Ich könnte dir helfen, deine Position zu verbessern.", Info_Mod_Cornelius_Ambient01_A);
};

FUNC VOID Info_Mod_Cornelius_Ambient01_B()
{
	AI_Output(hero, self, "Info_Mod_Cornelius_Ambient01_B_15_00"); //Ich habe einen gut gefüllten Geldbeutel.
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient01_B_13_01"); //Das wird dir leider nichts bringen, ich habe auch meine Ehre.

	Info_ClearChoices	(Info_Mod_Cornelius_Ambient01);
};

FUNC VOID Info_Mod_Cornelius_Ambient01_A()
{
	AI_Output(hero, self, "Info_Mod_Cornelius_Ambient01_A_15_00"); //Ich könnte dir helfen, deine Position zu verbessern.
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient01_A_13_01"); //(misstrauisch) Inwiefern?

	// Wenn man Lord Hagen geholfen hat

	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_Hi))
	{
		AI_Output(hero, self, "Info_Mod_Cornelius_Ambient01_A_15_02"); //Meine Beziehungen zu den Lords sind gut.
		AI_Output(self, hero, "Info_Mod_Cornelius_Ambient01_A_13_03"); //In dem Fall ... hilf du mir zuerst, dann werde ich dir bereitwillig antworten.

		Mod_Cornelius_Overtalk = 1;

		Log_CreateTopic	(TOPIC_MOD_CORNELIUS_HELP, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_mOD_CORNELIUS_HELP, LOG_RUNNING);
		B_LogEntry	(TOPIC_MOD_CORNELIUS_HELP, "Durch seine Botendienste ist Cornelius, der stellvertretende Statthalter, im Besitz wertvoller Informationen über die Lage in Khorinis. Damit er anfängt zu reden, will er allerdings vorher von seinen nervenden Aufgaben entbunden werden. Ich sollte mit Lord Hagen darüber sprechen.");
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Cornelius_Ambient01_A_15_04"); //Da fällt mir im Moment auch nichts ein.
	};

	Info_ClearChoices	(Info_Mod_Cornelius_Ambient01);
};

INSTANCE Info_Mod_Cornelius_Ambient02 (C_INFO)
{
	npc		= Mod_571_NONE_Cornelius_NW;
	nr		= 1;
	condition	= Info_Mod_Cornelius_Ambient02_Condition;
	information	= Info_Mod_Cornelius_Ambient02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cornelius_Ambient02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_Cornelius))
	&& (Mod_Cornelius_Overtalk == 2)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cornelius_Ambient02_Info()
{
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient02_13_00"); //Und, was hast du erreichen können?
	AI_Output(hero, self, "Info_Mod_Cornelius_Ambient02_15_01"); //Sieht doch so aus, als könnte ich dir nicht helfen.
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient02_13_02"); //(ironisch) Na, super! Aber glaub ja nicht, dass wir so ins Geschäft kommen.
};

INSTANCE Info_Mod_Cornelius_Ambient03 (C_INFO)
{
	npc		= Mod_571_NONE_Cornelius_NW;
	nr		= 1;
	condition	= Info_Mod_Cornelius_Ambient03_Condition;
	information	= Info_Mod_Cornelius_Ambient03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cornelius_Ambient03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_Cornelius))
	&& (Mod_Cornelius_Overtalk == 4)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cornelius_Ambient03_Info()
{
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient03_13_00"); //Und, was hast du erreichen können?
	AI_Output(hero, self, "Info_Mod_Cornelius_Ambient03_15_01"); //Du bist ab jetzt Wirtschaftsminister. Zufrieden?
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient03_13_02"); //Aber hallo! Keine schlechte Aufgabe, und endlich entkomme ich den skeptischen Blicken Lord Hagens.
	AI_Output(hero, self, "Info_Mod_Cornelius_Ambient03_15_03"); //Stell bloß keine Dummheiten an, ich müsste dafür gerade stehen.
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient03_13_04"); //(heuchlerisch) Würde mir nie im Traum einfallen.
	AI_Output(hero, self, "Info_Mod_Cornelius_Ambient03_15_05"); //Was ist mit der Gegenleistung?
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient03_13_06"); //Den pikanten Neuigkeiten?
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient03_13_07"); //Von meinen Quellen weiß ich, dass Lord Hagen nicht mehr das volle Vertrauen des Königs genießt.
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient03_13_08"); //Er soll schon eine Delegation entsandt haben, die im richtigen Moment zuschlagen und Lord Hagen entmachten soll.
	AI_Output(hero, self, "Info_Mod_Cornelius_Ambient03_15_09"); //Dann wird's hier jedenfalls nicht langweilig.
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient03_13_10"); //Worauf du einen lassen kannst.

	B_GivePlayerXP	(50);

	Mod_Cornelius_Overtalk_Day = Wld_GetDay();

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_CORNELIUS_HELP, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "WIRTSCHAFT");
};

INSTANCE Info_Mod_Cornelius_Ambient04 (C_INFO)
{
	npc		= Mod_571_NONE_Cornelius_NW;
	nr		= 1;
	condition	= Info_Mod_Cornelius_Ambient04_Condition;
	information	= Info_Mod_Cornelius_Ambient04_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cornelius_Ambient04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cornelius_Ambient03))
	&& (Mod_Cornelius_Overtalk == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cornelius_Ambient04_Info()
{
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient04_13_00"); //Stehen geblieben! Hier kommt gerade keiner rein!
	AI_Output(hero, self, "Info_Mod_Cornelius_Ambient04_15_01"); //Was ist denn hier passiert?
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient04_13_02"); //Lord Hagen steht unter Arrest! Ich werde seine Herrschaft nicht länger dulden.
	AI_Output(hero, self, "Info_Mod_Cornelius_Ambient04_15_03"); //Und was hast du jetzt vor?
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient04_13_04"); //Der gute Herr verschanzt sich dort drin mit einer letzten Schar Getreuer. Die Bande wird jetzt ausgehungert, bis sie sich ergibt.
	AI_Output(hero, self, "Info_Mod_Cornelius_Ambient04_15_05"); //Hast du mich also doch enttäuscht.
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient04_13_06"); //Sonst wäre ich wohl kaum an mein Ziel gekommen. Und jetzt verschwinde, ich brauche dich nicht mehr.
	AI_Output(hero, self, "Info_Mod_Cornelius_Ambient04_15_07"); //So einfach wirst du mich jetzt aber nicht los ...
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient04_13_08"); //Du willst also lieber starrköpfig untergehen? Meinetwegen.
	AI_Output(self, hero, "Info_Mod_Cornelius_Ambient04_13_09"); //(ruft) Zieht die Waffen, Männer, hier wird Blut vergossen!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Cornelius_Pickpocket (C_INFO)
{
	npc		= Mod_571_NONE_Cornelius_NW;
	nr		= 1;
	condition	= Info_Mod_Cornelius_Pickpocket_Condition;
	information	= Info_Mod_Cornelius_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Cornelius_Pickpocket_Condition()
{
	C_Beklauen	(60, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Cornelius_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Cornelius_Pickpocket);

	Info_AddChoice	(Info_Mod_Cornelius_Pickpocket, DIALOG_BACK, Info_Mod_Cornelius_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Cornelius_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Cornelius_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Cornelius_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Cornelius_Pickpocket);
};

FUNC VOID Info_Mod_Cornelius_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Cornelius_Pickpocket);
};

INSTANCE Info_Mod_Cornelius_EXIT (C_INFO)
{
	npc		= Mod_571_NONE_Cornelius_NW;
	nr		= 1;
	condition	= Info_Mod_Cornelius_EXIT_Condition;
	information	= Info_Mod_Cornelius_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Cornelius_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cornelius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};