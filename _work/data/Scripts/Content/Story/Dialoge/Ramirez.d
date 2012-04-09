INSTANCE Info_Mod_Ramirez_Hi (C_INFO)
{
	npc		= Mod_746_NONE_Ramirez_NW;
	nr		= 1;
	condition	= Info_Mod_Ramirez_Hi_Condition;
	information	= Info_Mod_Ramirez_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ramirez_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_Hi_14_00"); //Was willst du hier?
};

INSTANCE Info_Mod_Ramirez_Dieb (C_INFO)
{
	npc		= Mod_746_NONE_Ramirez_NW;
	nr		= 1;
	condition	= Info_Mod_Ramirez_Dieb_Condition;
	information	= Info_Mod_Ramirez_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Diebeszeichen zeigen)";
};

FUNC INT Info_Mod_Ramirez_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_Goldmuenzen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_Dieb_Info()
{
	AI_PlayAni (hero, "T_YES");
	AI_Output(self, hero, "Info_Mod_Ramirez_Dieb_14_00"); //Du gehörst also zu uns.
	AI_Output(self, hero, "Info_Mod_Ramirez_Dieb_14_01"); //Ich kann dir beibringen, wie du Schlösser knackst.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_STADT, "Ramirez kann mir beibringen Schlösser zu knacken.");
};

INSTANCE Info_Mod_Ramirez_Cassia (C_INFO)
{
	npc		= Mod_746_NONE_Ramirez_NW;
	nr		= 1;
	condition	= Info_Mod_Ramirez_Cassia_Condition;
	information	= Info_Mod_Ramirez_Cassia_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum traust du mir nicht?";
};

FUNC INT Info_Mod_Ramirez_Cassia_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_WasNun_Ramirez))
	&& (Npc_KnowsInfo(hero, Info_Mod_Ramirez_Dieb))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_Cassia_Info()
{
	AI_Output(hero, self, "Info_Mod_Ramirez_Cassia_15_00"); //Warum traust du mir nicht?
	AI_Output(self, hero, "Info_Mod_Ramirez_Cassia_14_01"); //Da muss man dich nur ansehen und sich vorstellen, dass du die Kaserne knacken willst.
	AI_Output(hero, self, "Info_Mod_Ramirez_Cassia_15_02"); //Kann ich mich irgendwie beweisen?
	AI_Output(self, hero, "Info_Mod_Ramirez_Cassia_14_03"); //Du könntest Attilas Job übernehmen, nur für eine kurze Zeit, um den größten Unruhestifter aufzusuchen.
	AI_Output(hero, self, "Info_Mod_Ramirez_Cassia_15_04"); //Aber dann kommst du mit in die Kaserne.
	AI_Output(self, hero, "Info_Mod_Ramirez_Cassia_14_05"); //Wenn du es schaffst, eine Bande im Hafenviertel zu erledigen und mir den Ring von ihrem Anführer zu bringen, werde ich mitkommen.
	AI_Output(hero, self, "Info_Mod_Ramirez_Cassia_15_06"); //Und wo treiben die sich rum?
	AI_Output(self, hero, "Info_Mod_Ramirez_Cassia_14_07"); //Überall, du musst sie erst finden.

	Wld_InsertNpc	(Mod_1891_NONE_Bandenchef_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_1892_NONE_Bandenmitglied1_NW,	"BIGFARM");

	Log_CreateTopic	(TOPIC_MOD_RAMIREZ_BANDE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_RAMIREZ_BANDE, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_DIEB_ATTILA, TOPIC_MOD_RAMIREZ_BANDE, "Damit Ramirez mich in die Kaserne begleitet soll ich eine Bande im Hafenviertel ausrotten und ihm den Ring von ihrem Anführer bringen.", "Ramirez will, dass ich eine Bande im Hafenviertel beseitige. Als Beweis soll ich ihm den Ring von ihrem Anführer bringen.");
};

INSTANCE Info_Mod_Ramirez_Bandenchef (C_INFO)
{
	npc		= Mod_746_NONE_Ramirez_NW;
	nr		= 1;
	condition	= Info_Mod_Ramirez_Bandenchef_Condition;
	information	= Info_Mod_Ramirez_Bandenchef_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du den Ring vom Bandenchef.";
};

FUNC INT Info_Mod_Ramirez_Bandenchef_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_Cassia))
	&& (Npc_IsDead(Mod_1891_NONE_Bandenchef_NW))
	&& (Npc_HasItems(hero, ItRi_Bandenchef) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_Bandenchef_Info()
{
	AI_Output(hero, self, "Info_Mod_Ramirez_Bandenchef_15_00"); //Hier hast du den Ring vom Bandenchef.

	B_GiveInvItems	(hero, self, ItRi_Bandenchef, 1);

	AI_Output(self, hero, "Info_Mod_Ramirez_Bandenchef_14_01"); //Tatsächlich, hätte ich dir nicht zugetraut.
	AI_Output(self, hero, "Info_Mod_Ramirez_Bandenchef_14_02"); //Hab eben noch mit dem Gedanken gespielt, dass du schon tot bist.
	AI_Output(hero, self, "Info_Mod_Ramirez_Bandenchef_15_03"); //Also traust du mir jetzt und wirst mich in die Kaserne begleiten?
	AI_Output(self, hero, "Info_Mod_Ramirez_Bandenchef_14_04"); //Ja, ich hab dir mein Wort gegeben. Sag aber vorher noch Cassia Bescheid.

	B_GivePlayerXP	(250);

	B_StartOtherRoutine	(Mod_1892_NONE_Bandenmitglied1_NW, "TOT");

	B_SetTopicStatus	(TOPIC_MOD_RAMIREZ_BANDE, LOG_SUCCESS);
	B_LogEntry	(TOPIC_MOD_DIEB_ATTILA, "Ich habe Ramirez überzeugt. Ich soll aber noch Cassia bescheid geben, bevor wir aufbrechen.");

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Ramirez_ZuAndre (C_INFO)
{
	npc		= Mod_746_NONE_Ramirez_NW;
	nr		= 1;
	condition	= Info_Mod_Ramirez_ZuAndre_Condition;
	information	= Info_Mod_Ramirez_ZuAndre_Info;
	permanent	= 0;
	important	= 0;
	description	= "Cassia weiß Bescheid, lass uns gehen.";
};

FUNC INT Info_Mod_Ramirez_ZuAndre_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_RamirezDabei))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_ZuAndre_Info()
{
	AI_Output(hero, self, "Info_Mod_Ramirez_ZuAndre_15_00"); //Cassia weiß Bescheid, lass uns gehen.
	AI_Output(self, hero, "Info_Mod_Ramirez_ZuAndre_14_01"); //Gut, geh voraus, ich folge dir.

	B_LogEntry	(TOPIC_MOD_DIEB_ATTILA, "Ramirez folgt mir und ich werde jetzt mal in der Kaserne vorbei schauen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTOANDRE");
};

INSTANCE Info_Mod_Ramirez_Flucht (C_INFO)
{
	npc		= Mod_746_NONE_Ramirez_NW;
	nr		= 1;
	condition	= Info_Mod_Ramirez_Flucht_Condition;
	information	= Info_Mod_Ramirez_Flucht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier bin ich.";
};

FUNC INT Info_Mod_Ramirez_Flucht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Boltan_Hilfe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_Flucht_Info()
{
	AI_Output(hero, self, "Info_Mod_Ramirez_Flucht_15_00"); //Hier bin ich.
	AI_Output(self, hero, "Info_Mod_Ramirez_Flucht_14_01"); //Na endlich, ich dachte schon, du lässt uns hier für immer drinnen.
	AI_Output(hero, self, "Info_Mod_Ramirez_Flucht_15_02"); //Geht leise raus, der Weg ist frei.
	AI_Output(self, hero, "Info_Mod_Ramirez_Flucht_14_03"); //Wir treffen uns bei Cassia. Ach nochwas: Wenn du grade dabei bist, raube noch die Truhe bei Lord Andre aus.
	AI_Output(self, hero, "Info_Mod_Ramirez_Flucht_14_04"); //Ich hab mitbekommen, dass angeblich das gesamte Gold in seiner Truhe ist.
	AI_Output(hero, self, "Info_Mod_Ramirez_Flucht_15_05"); //Aber dann ist Schluss.
	AI_Output(self, hero, "Info_Mod_Ramirez_Flucht_14_06"); //Dann haben wir es ihnen richtig heimgezahlt.

	B_LogEntry	(TOPIC_MOD_DIEB_ATTILA, "Ramirez und Attila sind frei. Ich soll aber noch Lord Andres Truhe plündern.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FLUCHT");
	B_StartOtherRoutine	(Mod_760_NONE_Attila_NW, "FLUCHT");
};

INSTANCE Info_Mod_Ramirez_WelcomeBack (C_INFO)
{
	npc		= Mod_746_NONE_Ramirez_NW;
	nr		= 1;
	condition	= Info_Mod_Ramirez_WelcomeBack_Condition;
	information	= Info_Mod_Ramirez_WelcomeBack_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_WelcomeBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_Flucht))
	&& (Mob_HasItems("ANDRETRUHE", ItMi_Gold) == 0)
	&& (Npc_GetDistToWP(self, "NW_CITY_KANAL_ROOM_05_03") < 300)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 5000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_WelcomeBack_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_WelcomeBack_14_00"); //Da ist unser Befreier. Am besten du gehst nochmal zu Lord Andre und erzählst ihm irgendein Märchen über unsere Flucht und gibst die Sache als Miliz auf.
	AI_Output(hero, self, "Info_Mod_Ramirez_WelcomeBack_15_01"); //Und was soll ich ihm erzählen?
	AI_Output(self, hero, "Info_Mod_Ramirez_WelcomeBack_14_02"); //Denk dir was aus.

	Npc_RemoveInvItems	(hero, ItMi_Gold, 5000);

	B_LogEntry	(TOPIC_MOD_DIEB_ATTILA, "Ramirez und Attila sind frei. Ich soll aber noch Lord Andre's Truhe plündern.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_760_NONE_Attila_NW, "FREE");

	Mod_Diebe_Andre_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Ramirez_AndreFertig (C_INFO)
{
	npc		= Mod_746_NONE_Ramirez_NW;
	nr		= 1;
	condition	= Info_Mod_Ramirez_AndreFertig_Condition;
	information	= Info_Mod_Ramirez_AndreFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe mit Lord Andre ...";
};

FUNC INT Info_Mod_Ramirez_AndreFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_MortisBadGuy))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_AndreFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Ramirez_AndreFertig_15_00"); //Ich habe mit Lord Andre gesprochen und er hat mir meine Geschichte abgekauft.
	AI_Output(self, hero, "Info_Mod_Ramirez_AndreFertig_14_01"); //Sehr gut, alles nimmt ein gutes Ende. Attila ist wieder frei, Meldor wird nicht mehr gestört und die Miliz wurde um einiges ärmer.
	AI_Output(self, hero, "Info_Mod_Ramirez_AndreFertig_14_02"); //Dann hast du noch bei vielen anderen Kleinigkeiten geholfen. Ich glaube wir wären ohne dich nie so weit gekommen.
	AI_Output(hero, self, "Info_Mod_Ramirez_AndreFertig_15_03"); //Jetzt übertreibst du es aber.
	AI_Output(self, hero, "Info_Mod_Ramirez_AndreFertig_14_04"); //Du hast mir bewiesen, dass du einer der besten Diebe in unseren Reihen bist!
	AI_Output(hero, self, "Info_Mod_Ramirez_AndreFertig_15_05"); //Ich geh am besten jetzt und schau mir mal an, was die Anderen so treiben.
	AI_Output(self, hero, "Info_Mod_Ramirez_AndreFertig_14_06"); //Gut, schau aber ab und zu mal hier unten vorbei.

	B_SetTopicStatus	(TOPIC_MOD_DIEB_ATTILA, LOG_SUCCESS);

	B_GivePlayerXP	(500);

	AI_StopProcessInfos	(self);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Ramirez_Lernen (C_INFO)
{
	npc		= Mod_746_NONE_Ramirez_NW;
	nr		= 1;
	condition	= Info_Mod_Ramirez_Lernen_Condition;
	information	= Info_Mod_Ramirez_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schlösser knacken lernen (10 LP)";
};

FUNC INT Info_Mod_Ramirez_Lernen_Condition()
{
	Info_Mod_Ramirez_Lernen.description = B_BuildLearnString("Schlösser knacken lernen", B_GetLearnCostTalent(hero, NPC_TALENT_PICKLOCK, 1));

	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_Dieb))
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Ramirez_Lernen_15_00"); //Bring mir bei wie man Schlösser knackt.

	if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, hero, "Info_Mod_Ramirez_Lernen_14_01"); //Wenn du ein Schloss knacken willst solltest du auf jedenfall genug Dietriche dabei haben. Außerdem solltest du ziemlich geschickt sein.
	};
};

INSTANCE Info_Mod_Ramirez_Pickpocket (C_INFO)
{
	npc		= Mod_746_NONE_Ramirez_NW;
	nr		= 1;
	condition	= Info_Mod_Ramirez_Pickpocket_Condition;
	information	= Info_Mod_Ramirez_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Ramirez_Pickpocket_Condition()
{
	C_Beklauen	(120, ItMi_Gold, 2500);
};

FUNC VOID Info_Mod_Ramirez_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ramirez_Pickpocket);

	Info_AddChoice	(Info_Mod_Ramirez_Pickpocket, DIALOG_BACK, Info_Mod_Ramirez_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ramirez_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ramirez_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ramirez_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ramirez_Pickpocket);
};

FUNC VOID Info_Mod_Ramirez_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Ramirez_Pickpocket);
};

INSTANCE Info_Mod_Ramirez_EXIT (C_INFO)
{
	npc		= Mod_746_NONE_Ramirez_NW;
	nr		= 1;
	condition	= Info_Mod_Ramirez_EXIT_Condition;
	information	= Info_Mod_Ramirez_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ramirez_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ramirez_EXIT_Info()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_Dieb))
	{
		AI_Output(self, hero, "Info_Mod_Ramirez_EXIT_14_00"); //Komm uns nicht mit leeren Händen nach Hause!
	};

	AI_StopProcessInfos	(self);
};