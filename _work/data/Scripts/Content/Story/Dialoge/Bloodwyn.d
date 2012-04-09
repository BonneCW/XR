INSTANCE Info_Mod_Bloodwyn_Hi (C_INFO)
{
	npc		= Mod_943_GRD_Bloodwyn_MT;
	nr		= 1;
	condition	= Info_Mod_Bloodwyn_Hi_Condition;
	information	= Info_Mod_Bloodwyn_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bloodwyn_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bloodwyn_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Bloodwyn_Hi_04_00"); //Du? Ich habe gedacht, du wärst tot. Leg dich bloß nicht mit mir an, sonst werde ich dich töten.
	AI_Output(hero, self, "Info_Mod_Bloodwyn_Hi_15_01"); //Bleib ruhig, ich bin nicht hier um Ärger zu machen.
	AI_Output(self, hero, "Info_Mod_Bloodwyn_Hi_04_02"); //Das hoff ich auch für dich.
};

INSTANCE Info_Mod_Bloodwyn_Dieb (C_INFO)
{
	npc		= Mod_943_GRD_Bloodwyn_MT;
	nr		= 1;
	condition	= Info_Mod_Bloodwyn_Dieb_Condition;
	information	= Info_Mod_Bloodwyn_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bei den Erzbaronen wird gestohlen ...";
};

FUNC INT Info_Mod_Bloodwyn_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Bloodwyn_Infos == 0)
	&& (Mod_PDV_Fisk_Infos == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bloodwyn_Dieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Bloodwyn_Dieb_15_00"); //Bei den Erzbaronen wird gestohlen und es würde mich nicht wundern, wenn du deine Finger im Spiel hättest.
	AI_Output(self, hero, "Info_Mod_Bloodwyn_Dieb_04_01"); //Ich dachte schon, du wärst gekommen, um mir wieder Geld zu spenden. Nein, ich habe nichts damit zu tun.
	AI_Output(hero, self, "Info_Mod_Bloodwyn_Dieb_15_02"); //Ich kann mir nicht helfen, aber ich glaube dir nicht.
	AI_Output(self, hero, "Info_Mod_Bloodwyn_Dieb_04_03"); //Dein Problem, Freund. Und jetzt verschwinde, bevor ich auf die Idee kommen könnte, ein Treffen mit ein paar "Freunden" für dich zu organisieren.

	Mod_PDV_Bloodwyn_Infos = 1;

	Mod_PDV_Genug_Infos += 1;

	B_LogEntry	(TOPIC_MOD_PDV, "Bloodwyn hat sich nicht anmerken lassen, dass er etwas weiß, aber ich glaube ihm nicht.");
};

INSTANCE Info_Mod_Bloodwyn_Frage (C_INFO)
{
	npc		= Mod_943_GRD_Bloodwyn_MT;
	nr		= 1;
	condition	= Info_Mod_Bloodwyn_Frage_Condition;
	information	= Info_Mod_Bloodwyn_Frage_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du eine Ahnung ...";
};

FUNC INT Info_Mod_Bloodwyn_Frage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Bloodwyn_Infos == 0)
	&& (Mod_PDV_Fisk_Infos == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bloodwyn_Frage_Info()
{
	AI_Output(hero, self, "Info_Mod_Bloodwyn_Frage_15_00"); //Hast du eine Ahnung, wer für die Diebstähle bei den Erzbaronen verantwortlich ist?
	AI_Output(self, hero, "Info_Mod_Bloodwyn_Frage_04_01"); //Ich dachte schon, du wärst gekommen, um mir wieder Geld zu spenden. Nein, und ich will es auch nicht wissen.
	AI_Output(hero, self, "Info_Mod_Bloodwyn_Frage_15_02"); //Ich kann mir nicht helfen, aber ich glaube dir nicht.
	AI_Output(self, hero, "Info_Mod_Bloodwyn_Frage_04_03"); //Dein Problem, Freund. Und jetzt verschwinde, bevor ich auf die Idee kommen könnte, ein Treffen mit ein paar "Freunden" für dich zu organisieren.

	Mod_PDV_Bloodwyn_Infos = 1;

	Mod_PDV_Genug_Infos += 1;

	B_LogEntry	(TOPIC_MOD_PDV, "Bloodwyn hat sich nicht anmerken lassen, dass er etwas weiß, aber ich glaube ihm nicht.");
};

INSTANCE Info_Mod_Bloodwyn_Dealer (C_INFO)
{
	npc		= Mod_943_GRD_Bloodwyn_MT;
	nr		= 1;
	condition	= Info_Mod_Bloodwyn_Dealer_Condition;
	information	= Info_Mod_Bloodwyn_Dealer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wüsstest du ...";
};

FUNC INT Info_Mod_Bloodwyn_Dealer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Bloodwyn_Infos == 0)
	&& (Mod_PDV_Fisk_Infos == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bloodwyn_Dealer_Info()
{
	AI_Output(hero, self, "Info_Mod_Bloodwyn_Dealer_15_00"); //Wüsstest du, woher ich heiße Ware bekomme?
	AI_Output(self, hero, "Info_Mod_Bloodwyn_Dealer_04_01"); //Ich dachte schon, du wärst gekommen, um mir wieder Geld zu spenden. Nein, das weiß ich nicht.
	AI_Output(hero, self, "Info_Mod_Bloodwyn_Dealer_15_02"); //Ich kann mir nicht helfen, aber ich glaube dir nicht.
	AI_Output(self, hero, "Info_Mod_Bloodwyn_Dealer_04_03"); //Dein Problem, Freund. Und jetzt verschwinde, bevor ich auf die Idee kommen könnte, ein Treffen mit ein paar "Freunden" für dich zu organisieren.

	Mod_PDV_Bloodwyn_Infos = 1;

	Mod_PDV_Genug_Infos += 1;

	B_LogEntry	(TOPIC_MOD_PDV, "Bloodwyn hat sich nicht anmerken lassen, dass er etwas weiß, aber ich glaube ihm nicht.");
};

INSTANCE Info_Mod_Bloodwyn_WieGehts (C_INFO)
{
	npc		= Mod_943_GRD_Bloodwyn_MT;
	nr		= 1;
	condition	= Info_Mod_Bloodwyn_WieGehts_Condition;
	information	= Info_Mod_Bloodwyn_WieGehts_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie ist es dir ergangen?";
};

FUNC INT Info_Mod_Bloodwyn_WieGehts_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bloodwyn_WieGehts_Info()
{
	AI_Output(hero, self, "Info_Mod_Bloodwyn_WieGehts_15_00"); //Wie ist es dir ergangen?
	AI_Output(self, hero, "Info_Mod_Bloodwyn_WieGehts_04_01"); //Verpiss dich.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Bloodwyn_AL (C_INFO)
{
	npc		= Mod_943_GRD_Bloodwyn_MT;
	nr		= 1;
	condition	= Info_Mod_Bloodwyn_AL_Condition;
	information	= Info_Mod_Bloodwyn_AL_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was macht das Alte Lager?";
};

FUNC INT Info_Mod_Bloodwyn_AL_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bloodwyn_AL_Info()
{
	AI_Output(hero, self, "Info_Mod_Bloodwyn_AL_15_00"); //Was macht das Alte Lager?
	AI_Output(self, hero, "Info_Mod_Bloodwyn_AL_04_01"); //Hau bloß ab.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Bloodwyn_Pickpocket (C_INFO)
{
	npc		= Mod_943_GRD_Bloodwyn_MT;
	nr		= 1;
	condition	= Info_Mod_Bloodwyn_Pickpocket_Condition;
	information	= Info_Mod_Bloodwyn_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Bloodwyn_Pickpocket_Condition()
{
	C_Beklauen	(78, ItMi_Gold, 450);
};

FUNC VOID Info_Mod_Bloodwyn_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bloodwyn_Pickpocket);

	Info_AddChoice	(Info_Mod_Bloodwyn_Pickpocket, DIALOG_BACK, Info_Mod_Bloodwyn_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bloodwyn_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bloodwyn_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bloodwyn_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bloodwyn_Pickpocket);
};

FUNC VOID Info_Mod_Bloodwyn_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Bloodwyn_Pickpocket);
};

INSTANCE Info_Mod_Bloodwyn_EXIT (C_INFO)
{
	npc		= Mod_943_GRD_Bloodwyn_MT;
	nr		= 1;
	condition	= Info_Mod_Bloodwyn_EXIT_Condition;
	information	= Info_Mod_Bloodwyn_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bloodwyn_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bloodwyn_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};