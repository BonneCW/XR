INSTANCE Info_Mod_Biftek_Hi (C_INFO)
{
	npc		= Mod_10047_Orc_Biftek_MT;
	nr		= 1;
	condition	= Info_Mod_Biftek_Hi_Condition;
	information	= Info_Mod_Biftek_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist ein Neuer?";
};

FUNC INT Info_Mod_Biftek_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Biftek_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Biftek_Hi_15_00"); //Du bist ein Neuer?
	AI_Output(self, hero, "Info_Mod_Biftek_Hi_18_01"); //(feindselig) Wieso Mensch wollen wissen? Nehmen sich in Acht vor gewaltigem Biftek und seiner Axt!
	AI_Output(self, hero, "Info_Mod_Biftek_Hi_18_02"); //Biftek werden Mensch häuten und roh essen!
	AI_Output(hero, self, "Info_Mod_Biftek_Hi_15_03"); //Nicht so eilig! Ich bin ein guter Freund von Ur Shak.
	AI_Output(self, hero, "Info_Mod_Biftek_Hi_18_04"); //Upps! Biftek nicht wissen. Dürfen nicht mal an Mensch knabbern?
	AI_Output(hero, self, "Info_Mod_Biftek_Hi_15_05"); //Jetzt gerade nicht, nein.
};

INSTANCE Info_Mod_Biftek_Mager (C_INFO)
{
	npc		= Mod_10047_Orc_Biftek_MT;
	nr		= 1;
	condition	= Info_Mod_Biftek_Mager_Condition;
	information	= Info_Mod_Biftek_Mager_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du siehst ziemlich mager aus für einen Ork.";
};

FUNC INT Info_Mod_Biftek_Mager_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Biftek_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Biftek_Mager_Info()
{
	AI_Output(hero, self, "Info_Mod_Biftek_Mager_15_00"); //Du siehst ziemlich mager aus für einen Ork.
	AI_Output(self, hero, "Info_Mod_Biftek_Mager_18_01"); //Vor ein paar Wochen Biftek sein ein starker Ork, aber seitdem kein Fleisch mehr gegessen.
	AI_Output(self, hero, "Info_Mod_Biftek_Mager_18_02"); //In Lager von Orks gar kein Essen mehr, und hier nur Gemüse und Kräuter, wovon Biftek kriegen Bauchschmerzen.
	AI_Output(self, hero, "Info_Mod_Biftek_Mager_18_03"); //Also Biftek jetzt schon ganz schwach und müssen sicher bald sterben.
	AI_Output(self, hero, "Info_Mod_Biftek_Mager_18_04"); //(lauernd) Mensch ganz sicher, dass er noch brauchen alle seine Arme und Beine?
	AI_Output(hero, self, "Info_Mod_Biftek_Mager_15_05"); //(eilig) Wieso bekommst du hier kein Fleisch?
	AI_Output(self, hero, "Info_Mod_Biftek_Mager_18_06"); //Ur Shak sagen, Orks auch können leben von Pflanzen und Pilzen, und sein viel einfacher zu finden und zu sammeln.
	AI_Output(self, hero, "Info_Mod_Biftek_Mager_18_07"); //Aber Biftek sagen: Pfui! Pflanzen und Pilze nicht schmecken und nicht machen satt. Aber er zu schwach, um selbst jagen zu gehen.
	
	AI_TurnAway(hero, self);
	
	AI_Output(hero, self, "Info_Mod_Biftek_Mager_15_08"); //(zu sich selbst) Ich könnte natürlich anbieten, ihm Fleisch zu bringen. Aber davon hätte er nicht lange was. Ich sollte mit Ur Shak bereden, was zu tun ist.
	
	AI_TurnToNpc(hero, self);
	
	AI_Output(hero, self, "Info_Mod_Biftek_Mager_15_09"); //(zu Biftek) Hör mal, ich kann dir zwar momentan nicht helfen. Aber wenn ich eine Möglichkeit finde, komme ich wieder.
	AI_Output(self, hero, "Info_Mod_Biftek_Mager_18_10"); //(sehnsüchtig) Du dich vielleicht könntest einsalzen, damit besser schmecken?

	Log_CreateTopic	(TOPIC_MOD_BIFTEK_FLEISCHERSATZ, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BIFTEK_FLEISCHERSATZ, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BIFTEK_FLEISCHERSATZ, "Der Ork Biftek in der Bergfestung hat seit Wochen kein Fleisch mehr gehabt und fühlt sich kurz vor dem Verhungern. Da Fleisch rar ist, braucht er einen adäquaten Ersatz. Vielleicht weiß Ur Shak Rat.");
};

var int Mod_Biftek_Day;

INSTANCE Info_Mod_Biftek_Mager2 (C_INFO)
{
	npc		= Mod_10047_Orc_Biftek_MT;
	nr		= 1;
	condition	= Info_Mod_Biftek_Mager2_Condition;
	information	= Info_Mod_Biftek_Mager2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Schau mal, ich hab dir ein Stück Fleisch mitgebracht.";
};

FUNC INT Info_Mod_Biftek_Mager2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_UrShak_Biftek))
	&& (Npc_HasItems(hero, ItWr_TofuRezept))
	&& (Npc_HasItems(hero, ItFo_Tofu))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Biftek_Mager2_Info()
{
	AI_Output(hero, self, "Info_Mod_Biftek_Mager2_15_00"); //Schau mal, ich hab dir ein Stück Fleisch mitgebracht.
	
	B_GiveInvItems(hero, self, ItFo_Tofu, 1);
	
	B_UseItem(self, ItFo_Tofu);
	
	AI_Output(self, hero, "Info_Mod_Biftek_Mager2_18_01"); //(kaut genüsslich) Hmmjommjomm. Ah, diesen Geschmack Biftek haben schon so lange vermisst. Biftek jetzt froh. Mensch haben noch mehr?
	AI_Output(hero, self, "Info_Mod_Biftek_Mager2_15_02"); //Nein, aber du kannst dir ganz einfach selbst was zubereiten. Hier.
	
	B_GiveInvItems(hero, self, ItWr_TofuRezept, 1);
	
	AI_Output(self, hero, "Info_Mod_Biftek_Mager2_18_03"); //(würgt) Mensch wollen Biftek vergiften! Und Biftek vertrauen Mensch!
	AI_Output(hero, self, "Info_Mod_Biftek_Mager2_15_04"); //Jetzt komm mal runter. Du hast gar keinen Unterschied geschmeckt.
	AI_Output(self, hero, "Info_Mod_Biftek_Mager2_18_05"); //Doch. Biftek nur wollen sein nett und nicht zugeben.
	AI_Output(hero, self, "Info_Mod_Biftek_Mager2_15_06"); //Stimmt gar nicht.
	AI_Output(self, hero, "Info_Mod_Biftek_Mager2_18_07"); //Stimmen wohl.
	AI_Output(hero, self, "Info_Mod_Biftek_Mager2_15_08"); //Jetzt hör mir mal zu: Du hast keinen Unterschied gemerkt, basta. Alles andere kannst du deiner Mutter erzählen.
	AI_Output(hero, self, "Info_Mod_Biftek_Mager2_15_09"); //Und wenn du jetzt zu faul bist, Ur Shak zu bitten, dass er So-Ja-Pflanzen sammeln lässt und du dir daraus To-Fu herstellst, bist du selbst Schuld.
	AI_Output(hero, self, "Info_Mod_Biftek_Mager2_15_10"); //Sobald du wieder bei Kräften bist, kannst du dir dein Fleisch selbst besorgen.
	AI_Output(self, hero, "Info_Mod_Biftek_Mager2_18_11"); //Na gut, vielleicht haben Recht. Biftek danken Mensch, aber er Biftek in Zukunft nicht mehr beschwindeln.
	AI_Output(hero, self, "Info_Mod_Biftek_Mager2_15_12"); //Abgemacht.
	
	B_GivePlayerXP(350);

	B_SetTopicStatus	(TOPIC_MOD_BIFTEK_FLEISCHERSATZ, LOG_SUCCESS);

	CurrentNQ += 1;
	
	Mod_Biftek_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Biftek_Mager3 (C_INFO)
{
	npc		= Mod_10047_Orc_Biftek_MT;
	nr		= 1;
	condition	= Info_Mod_Biftek_Mager3_Condition;
	information	= Info_Mod_Biftek_Mager3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du siehst schon wieder kräftiger aus.";
};

FUNC INT Info_Mod_Biftek_Mager3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Biftek_Mager2))
	&& (Wld_GetDay() - 3 >= Mod_Biftek_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Biftek_Mager3_Info()
{
	AI_Output(hero, self, "Info_Mod_Biftek_Mager3_15_00"); //Du siehst schon wieder kräftiger aus.
	AI_Output(self, hero, "Info_Mod_Biftek_Mager3_18_01"); //Oh ja, Biftek essen To-Fu den ganzen Tag, können kaum aufhören. Ur Shak müssen Biftek verbieten zu essen weiter, weil nicht genügend So-Ja-Bohnen da.
	AI_Output(self, hero, "Info_Mod_Biftek_Mager3_18_02"); //Aber Biftek gehen und suchen sich seine Bohnen selbst!
	AI_Output(hero, self, "Info_Mod_Biftek_Mager3_15_03"); //(seufzt) Hauptsache, es geht dir wieder gut.
	AI_Output(self, hero, "Info_Mod_Biftek_Mager3_18_04"); //Biftek haben jetzt auch keine Lust mehr an Mensch zu knabbern!
	AI_Output(hero, self, "Info_Mod_Biftek_Mager3_15_05"); //Das freut mich.
};

INSTANCE Info_Mod_Biftek_WarumDabei (C_INFO)
{
	npc		= Mod_10047_Orc_Biftek_MT;
	nr		= 1;
	condition	= Info_Mod_Biftek_WarumDabei_Condition;
	information	= Info_Mod_Biftek_WarumDabei_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum hast du dich Ur Shak, Tarrok und Ranad angeschlossen?";
};

FUNC INT Info_Mod_Biftek_WarumDabei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Biftek_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Biftek_WarumDabei_Info()
{
	AI_Output(hero, self, "Info_Mod_Biftek_WarumDabei_15_00"); //Warum hast du dich Ur Shak, Tarrok und Ranad angeschlossen?
	AI_Output(self, hero, "Info_Mod_Biftek_WarumDabei_18_01"); //Ganz einfach, in Lager von Orks kein Essen mehr da, viel verschüttet in Tempel von Krushak, und nicht genügend Orks zu jagen frisches Fleisch.
	AI_Output(self, hero, "Info_Mod_Biftek_WarumDabei_18_02"); //Aber Ranad sagen, er kennen Ort, wo Biftek können essen, so viel er wollen. Also Biftek kommen mit. Aber Ranad nicht sagen, dass nur Gemüse haben!
};

INSTANCE Info_Mod_Biftek_EXIT (C_INFO)
{
	npc		= Mod_10047_Orc_Biftek_MT;
	nr		= 1;
	condition	= Info_Mod_Biftek_EXIT_Condition;
	information	= Info_Mod_Biftek_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Biftek_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Biftek_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};