INSTANCE Info_Mod_Alissandro_Hi (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Hi_Condition;
	information	= Info_Mod_Alissandro_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Alissandro_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alissandro_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Alissandro_Hi_02_01"); //Ich bin neuer Erzbaron und Berater von Thorus.
};

INSTANCE Info_Mod_Alissandro_Dieb (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Dieb_Condition;
	information	= Info_Mod_Alissandro_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was weißt du über den Dieb?";
};

FUNC INT Info_Mod_Alissandro_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorus_Pruefung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_Dieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Alissandro_Dieb_15_00"); //Was weißt du über den Dieb?
	AI_Output(self, hero, "Info_Mod_Alissandro_Dieb_02_01"); //Also, normalerweise ist es zwischen 23 und 6 Uhr, wenn er zuschlägt. Um die Zeit halten vier Gardisten Wache, die davon eigentlich etwas mitbekommen müssten:
	AI_Output(self, hero, "Info_Mod_Alissandro_Dieb_02_02"); //Bullit, Cutter, Jackal und Bloodwyn. Dass sie bisher nichts bemerkt haben, macht sie in meinen Augen verdächtig. Zumindest einer wird seine Finger im Spiel haben.
	AI_Output(hero, self, "Info_Mod_Alissandro_Dieb_15_03"); //Verstehe, ich werde mich mal umhören.

	B_LogEntry	(TOPIC_MOD_PDV, "Bullit, Cutter, Jackal und Bloodwyn werden verdächtigt, den Diebstahl begangen zu haben. Ich glaube, ich statte ihnen mal einen Besuch ab.");
};

INSTANCE Info_Mod_Alissandro_Unbekannter (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Unbekannter_Condition;
	information	= Info_Mod_Alissandro_Unbekannter_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_Unbekannter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Verloren))
	&& (Mod_GorKarantoSchwach == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_Unbekannter_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_Unbekannter_02_00"); //Du wurdest doch von Thorus beauftragt, dem Unbekannten den Betrug nachzuweisen.
	AI_Output(hero, self, "Info_Mod_Alissandro_Unbekannter_15_01"); //Ja, und?
	AI_Output(self, hero, "Info_Mod_Alissandro_Unbekannter_02_02"); //Ich weiß, in welcher Hütte der Unbekannte schläft. Wenn du aus der Burg gehst und dann rechts Richtung Arena, dann die Hütte direkt neben Scattys Stand.
	AI_Output(hero, self, "Info_Mod_Alissandro_Unbekannter_15_03"); //Danke.

	B_LogEntry	(TOPIC_MOD_AL_ARENA, "Alissandro hat mir gesagt, wo ich die Hütte von dem Unbekannten finden kann. Es ist die Hütte direkt neben Scattys Stand. Vielleicht sollte ich mich dort mal umsehen.");

	Mod_GorKarantoSchwach = 6;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Alissandro_ThorusTot (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_ThorusTot_Condition;
	information	= Info_Mod_Alissandro_ThorusTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_ThorusTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Makanius_ThorusTot))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_ThorusTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_ThorusTot_02_00"); //(benommen) Verdammt, ich habe nichts mehr tun können.
	AI_Output(hero, self, "Info_Mod_Alissandro_ThorusTot_15_01"); //Was ist passiert?
	AI_Output(self, hero, "Info_Mod_Alissandro_ThorusTot_02_02"); //Dieses Drecksschwein Bartholo hat uns zu dieser Höhle geführt, meinte, die Buddler würden sich auflehnen.
	AI_Output(self, hero, "Info_Mod_Alissandro_ThorusTot_02_03"); //Als wir da waren, hat er uns mit einer Horde Gardisten überfallen. Thorus hat er dabei getötet, Arto und ich kämpften bis zum Umfallen, bis wir gemerkt haben, dass wir gegen die Überzahl nicht gewinnen konnten.
	AI_Output(self, hero, "Info_Mod_Alissandro_ThorusTot_02_04"); //Also hat mich Arto mit einem Schlafzauber belegt, damit es aussieht, als wäre ich tot. Er konnte fliehen. Er meinte, wir treffen uns im alten Kastell, oben am Berg.
	AI_Output(self, hero, "Info_Mod_Alissandro_ThorusTot_02_05"); //Er schlug vor, von da aus unseren Gegenschlag zu planen, denn Bartholo hat das Lager übernommen.
	AI_Output(self, hero, "Info_Mod_Alissandro_ThorusTot_02_06"); //Ich werde euch hinführen.

	B_LogEntry	(TOPIC_MOD_AL_SCHMUGGLER, "Alissandro hat erzählt, dass Bartholo nun das Lager übernommen hat. Makanius will Bartholo seine Hilfe anbieten, um ihn besser beobachten zu können, doch ich werde mich Alissandro anschließen und mit ihm den Gegenschlag planen.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;

	AI_StopProcessInfos	(self);


	if (Mod_ALTor_01 == 0)
	{
		Wld_SendTrigger	("EVT_OC_MAINGATE01_01");

		Mod_ALTor_01 = 1;
	};

	if (Mod_ALTor_03 == 0)
	{
		Wld_SendTrigger	("EVT_OC_MAINGATE02_02");

		Mod_ALTor_03 = 1;
	};

	B_StartOtherRoutine	(self, "GUIDETOKASTELLPARTONE");
};

INSTANCE Info_Mod_Alissandro_ZwischenstationA (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_ZwischenstationA_Condition;
	information	= Info_Mod_Alissandro_ZwischenstationA_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_ZwischenstationA_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_ThorusTot))
	&& (Npc_GetDistToWP(self, "OC_ROUND_18") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_ZwischenstationA_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_ZwischenstationA_02_00"); //Hm, der Weg hier ist gut bewacht, wir sollten einen anderen nehmen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETOKASTELLPARTTWO");
};

INSTANCE Info_Mod_Alissandro_ZwischenstationB (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_ZwischenstationB_Condition;
	information	= Info_Mod_Alissandro_ZwischenstationB_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_ZwischenstationB_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_ZwischenstationA))
	&& (Npc_GetDistToWP(self, "OW_PATH_001") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_ZwischenstationB_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_ZwischenstationB_02_00"); //Von hier aus sollte der Weg nicht mehr allzu schwierig sein.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETOKASTELL");
};

INSTANCE Info_Mod_Alissandro_Kastell (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Kastell_Condition;
	information	= Info_Mod_Alissandro_Kastell_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_Kastell_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_ZwischenstationB))
	&& (Npc_GetDistToWP(self, "CASTLE_01") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_Kastell_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_Kastell_02_00"); //Da wären wir. Hier werden wir uns auf den Gegenschlag vorbereiten.
	AI_Output(self, hero, "Info_Mod_Alissandro_Kastell_02_01"); //Ich werde mich mit Arto beraten. Komm morgen wieder.

	B_SetTopicStatus	(TOPIC_MOD_AL_SCHMUGGLER, LOG_SUCCESS);

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Mod_AtKastell = Wld_GetDay();

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "KASTELL");

	B_GivePlayerXP	(1000);

	B_Göttergefallen(2, 2);
};

INSTANCE Info_Mod_Alissandro_Botschafter (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Botschafter_Condition;
	information	= Info_Mod_Alissandro_Botschafter_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_Botschafter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Kastell))
	&& (Mod_AtKastell < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_Botschafter_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_Botschafter_02_00"); //Es gibt ein Problem und ich will, dass du es löst.
	AI_Output(hero, self, "Info_Mod_Alissandro_Botschafter_15_01"); //Verstehe, was habe ich zu tun?
	AI_Output(self, hero, "Info_Mod_Alissandro_Botschafter_02_02"); //Wir haben Botschafter in alle Lager geschickt, um um Hilfe im Kampf gegen Bartholo zu bitten. Allerdings ist ein Botschafter nicht zurückgekommen.
	AI_Output(hero, self, "Info_Mod_Alissandro_Botschafter_15_03"); //Wo habt ihr ihn hingeschickt?
	AI_Output(self, hero, "Info_Mod_Alissandro_Botschafter_02_04"); //In das Lager der Banditen nahe der Trollschlucht.
	AI_Output(hero, self, "Info_Mod_Alissandro_Botschafter_15_05"); //Und da wundert ihr euch, dass er nicht zurückgekommen ist?
	AI_Output(self, hero, "Info_Mod_Alissandro_Botschafter_02_06"); //Allerdings. Die Banditen würden ihn nicht ohne Vorwarnung umbringen. Wenn sie Interesse daran hätten, ihn zu töten, hätten sie versucht, Lösegeld für ihn zu kassieren.

	Log_CreateTopic	(TOPIC_MOD_AL_BOTSCHAFTER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_BOTSCHAFTER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_BOTSCHAFTER, "Alissandro schickt mich zum Banditenlager, um aufzuklären, was aus dem Botschafter geworden ist.");

	Wld_InsertNpc	(Mod_1875_GRD_Botschafter_MT, "OC1");
	B_KillNpc	(Mod_1875_GRD_Botschafter_MT);
};

INSTANCE Info_Mod_Alissandro_BanditenDabei (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_BanditenDabei_Condition;
	information	= Info_Mod_Alissandro_BanditenDabei_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Banditen schließen sich uns an.";
};

FUNC INT Info_Mod_Alissandro_BanditenDabei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Feuerregen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_BanditenDabei_Info()
{
	AI_Output(hero, self, "Info_Mod_Alissandro_BanditenDabei_15_00"); //Die Banditen schließen sich uns an.
	AI_Output(self, hero, "Info_Mod_Alissandro_BanditenDabei_02_01"); //Gut, so haben wir einen Verbündeten mehr.
	AI_Output(self, hero, "Info_Mod_Alissandro_BanditenDabei_02_02"); //Hier, nimm deine Belohnung.

	CreateInvItems	(self, ItMi_Nugget, 5);
	B_GiveInvItems	(self, hero, ItMi_Nugget, 5);

	B_GivePlayerXP	(500);

	B_Göttergefallen(2, 1);

	Mod_AlissandroBanditen_GetDay	= Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_AL_BOTSCHAFTER, "Alissandro ist zufrieden mit mir, nun haben wir ein Lager mehr auf unserer Seite.");
	B_SetTopicStatus	(TOPIC_MOD_AL_BOTSCHAFTER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Alissandro_EigentlichBereit (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_EigentlichBereit_Condition;
	information	= Info_Mod_Alissandro_EigentlichBereit_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_EigentlichBereit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_BanditenDabei))
	&& (Wld_GetDay() > Mod_AlissandroBanditen_GetDay)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_EigentlichBereit_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_EigentlichBereit_02_00"); //Wir haben nun genug Leute, um das Alte Lager zu stürmen, allerdings gibt es noch ein Problem.
	AI_Output(self, hero, "Info_Mod_Alissandro_EigentlichBereit_02_01"); //Wir kennen die Aufstellung der Gardisten nicht. Und genau da liegt dein nächster Auftrag.
	AI_Output(hero, self, "Info_Mod_Alissandro_EigentlichBereit_15_02"); //Gut, was soll ich machen?
	AI_Output(self, hero, "Info_Mod_Alissandro_EigentlichBereit_02_03"); //Du sollst in das Lager einbrechen und die Karte mit der Aufstellung stehlen.
	AI_Output(hero, self, "Info_Mod_Alissandro_EigentlichBereit_15_04"); //Und wie soll ich in das Lager kommen?
	AI_Output(self, hero, "Info_Mod_Alissandro_EigentlichBereit_02_05"); //Ich habe von den Verwandlungsmagiern einige Spruchrollen bekommen, damit kommst du in das Lager.

	CreateInvItems	(self, ItSc_TrfRabbit, 3);
	B_GiveInvItems	(self, hero, ItSc_TrfRabbit, 3);

	AI_Output(self, hero, "Info_Mod_Alissandro_EigentlichBereit_02_06"); //Du darfst dich nicht zurückverwandeln, bis du in Bartholos Zimmer bist, der Ort, an dem früher Gomez wohnte.

	B_StartOtherRoutine	(Mod_1106_EBR_Bartholo_MT, "SMALLTALK");
	B_StartOtherRoutine	(Mod_1876_EBR_Bloodwyn_MT, "SMALLTALK");

	Log_CreateTopic	(TOPIC_MOD_AL_KARTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_KARTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_KARTE, "Alissandro hat mich angewiesen, den Plan für die Aufstellung der Gardisten zu stehlen. Dafür gab er mir einige Verwandlungsspruchrollen. Damit sollte ich zu Bartholos Zimmer kommen.");
};

INSTANCE Info_Mod_Alissandro_HierPlan (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_HierPlan_Condition;
	information	= Info_Mod_Alissandro_HierPlan_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe den Plan.";
};

FUNC INT Info_Mod_Alissandro_HierPlan_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_EigentlichBereit))
	&& (Npc_HasItems(hero, AL_Aufstellung) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_HierPlan_Info()
{
	AI_Output(hero, self, "Info_Mod_Alissandro_HierPlan_15_00"); //Ich habe den Plan.
	
	B_GiveInvItems	(hero, self, AL_Aufstellung, 1);

	AI_Output(self, hero, "Info_Mod_Alissandro_HierPlan_02_01"); //Gut, dann werden wir das Lager bald angreifen können.

	B_GivePlayerXP	(500);

	B_Göttergefallen(2, 1);

	Mod_AlissandroBanditen_GetDay	= Wld_GetDay();

	B_SetTopicStatus	(TOPIC_MOD_AL_KARTE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Alissandro_GotoJackal (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_GotoJackal_Condition;
	information	= Info_Mod_Alissandro_GotoJackal_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_GotoJackal_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_HierPlan))
	&& (Wld_GetDay() > Mod_AlissandroBanditen_GetDay)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_GotoJackal_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_GotoJackal_02_00"); //Bald können wir das Lager angreifen, aber einen Schritt haben wir noch zu machen.
	AI_Output(hero, self, "Info_Mod_Alissandro_GotoJackal_15_01"); //Und der wäre?
	AI_Output(self, hero, "Info_Mod_Alissandro_GotoJackal_02_02"); //Dem Plan nach sind Bartholos Leute sehr gut geordnet, so dass das Lager kaum verwundbar ist.
	AI_Output(hero, self, "Info_Mod_Alissandro_GotoJackal_15_03"); //Und wie soll ich dieses Problem lösen?
	AI_Output(self, hero, "Info_Mod_Alissandro_GotoJackal_02_04"); //Der Mann, der dich gerettet hat, hat den Auftrag, die wichtigen Mitglieder des Lagers zu töten. Allerdings hat Bloodwyn ein Auge auf ihn geworfen, Bartholo schöpft vermutlich Verdacht.
	AI_Output(self, hero, "Info_Mod_Alissandro_GotoJackal_02_05"); //Nun musst du seinen Auftrag übernehmen.
	AI_Output(hero, self, "Info_Mod_Alissandro_GotoJackal_15_06"); //Wer war der Kerl eigentlich?
	AI_Output(self, hero, "Info_Mod_Alissandro_GotoJackal_02_07"); //Der Gardist Jackal. Wenn du mehr Fragen hast, unterhalte dich mit ihm.
	AI_Output(hero, self, "Info_Mod_Alissandro_GotoJackal_15_08"); //Wie soll ich in das Lager kommen?
	AI_Output(self, hero, "Info_Mod_Alissandro_GotoJackal_02_09"); //Ich habe eine Teleportrune von den Heilmagiern bekommen, du kommst damit in das Haus der Magier.

	CreateInvItems	(self, ItRu_TeleportOldcamp, 1);
	B_GiveInvItems	(self, hero, ItRu_TeleportOldcamp, 1);

	AI_Output(self, hero, "Info_Mod_Alissandro_GotoJackal_02_10"); //Außerdem bekommst du eine Liste mit den Leuten, die du töten sollst. 

	CreateInvItems	(self, ItWr_Alissandro_KillList, 1);
	B_GiveInvItems	(self, hero, ItWr_Alissandro_KillList, 1);

	B_StartOtherRoutine	(Mod_1874_HMG_Makanius_MT, "TREFFEN");
	B_StartOtherRoutine	(Mod_1107_GRD_Jackal_MT, "WACHE");
	B_StartOtherRoutine	(Mod_1113_GRD_Fletcher_MT, "KILLMISSION");
	B_StartOtherRoutine	(Mod_1025_KGD_Cathran_MT, "KILLMISSION");

	Log_CreateTopic	(TOPIC_MOD_AL_KillMission, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_KillMission, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_KillMission, "Alissandro hat mich ins Lager geschickt, um bestimmte Mitglieder zu töten. Er hat mir eine Liste gegeben.");
};

INSTANCE Info_Mod_Alissandro_WarnungLagerEntdeckt (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_WarnungLagerEntdeckt_Condition;
	information	= Info_Mod_Alissandro_WarnungLagerEntdeckt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Gardisten kennen unser Versteck, wir müssen fliehen.";
};

FUNC INT Info_Mod_Alissandro_WarnungLagerEntdeckt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jackal_BloodwynDead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_WarnungLagerEntdeckt_Info()
{
	AI_Output(hero, self, "Info_Mod_Alissandro_WarnungLagerEntdeckt_15_00"); //Die Gardisten kennen unser Versteck, wir müssen fliehen.
	AI_Output(self, hero, "Info_Mod_Alissandro_WarnungLagerEntdeckt_02_01"); //Verdammt, wir teilen uns auf. Geh zur Goblinhöhle auf dem Weg zum Sumpflager.
	AI_Output(self, hero, "Info_Mod_Alissandro_WarnungLagerEntdeckt_02_02"); //Benutze nicht den Bergpass, ich habe dir den Weg auf der Karte eingezeichnet.

	CreateInvItems	(self, ItWr_MapToGobboHoehle, 1);
	B_GiveInvItems	(self, hero, ItWr_MapToGobboHoehle, 1);

	B_LogEntry	(TOPIC_MOD_AL_KillMission, "Alissandro wurde gewarnt. Wir werden uns aufteilen. Ich soll zur alten Goblinhöhle gehen, in der der Almanach versteckt war. Er hat mir den Weg auf der Karte eingezeichnet.");

	B_StartOtherRoutine	(Mod_1107_GRD_Jackal_MT, "WAITATKASTELL");

	// Zufluchten füllen
	Wld_InsertNpc	(Mod_1917_GRD_Gardist_MT, "OC1");
	Wld_InsertNpc	(Mod_1918_GRD_Gardist_MT, "OC1");
	Wld_InsertNpc	(Mod_1919_GRD_Gardist_MT, "OC1");
	Wld_InsertNpc	(Mod_1920_GRD_Gardist_MT, "OC1");
	Wld_InsertNpc	(Mod_1921_GRD_Gardist_MT, "OC1");
	Wld_InsertNpc	(Mod_1922_GRD_Gardist_MT, "OC1");
	//Wld_InsertNpc	(Mod_1923_GRD_Gardist_MT, "OC1"); //Kommt später wegen Gefangennahme
};

INSTANCE Info_Mod_Alissandro_ThanksForRettung (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_ThanksForRettung_Condition;
	information	= Info_Mod_Alissandro_ThanksForRettung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_ThanksForRettung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jackal_InOC))
	&& (Mod_AL_AlissandroBefreit == 1)
	&& (Npc_GetDistToWP(self, "GOBBO_MASTERCAVE") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_ThanksForRettung_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_ThanksForRettung_02_00"); //Gut, dass ihr mir helfen konntet. Hier, du hast es verdient.
	
	CreateInvItems	(self, Grd_Armor_H, 1);
	B_GiveInvItems	(self, hero, Grd_Armor_H, 1);

	Mod_AL_AlissandroBefreit = 2;

	B_LogEntry	(TOPIC_MOD_AL_WhereAlissandro, "Wir sind in Sicherheit. Alissandro gab mir die schwere Garderüstung.");
	B_SetTopicStatus	(TOPIC_MOD_AL_WhereAlissandro, LOG_SUCCESS);

	B_GivePlayerXP	(1000);

	B_StartOtherRoutine	(Mod_1107_GRD_Jackal_MT, "ALIWACHEZUFLUCHT");
	B_StartOtherRoutine	(self, "ATZUFLUCHT");

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Alissandro_GotoZufluchten (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_GotoZufluchten_Condition;
	information	= Info_Mod_Alissandro_GotoZufluchten_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_GotoZufluchten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_ThanksForRettung))
	&& (Mod_AL_AlissandroBefreit == 2)
	&& (Npc_GetDistToWP(self, "GOBBO_MASTERCAVE9") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_GotoZufluchten_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_GotoZufluchten_02_00"); //Es ist nun Zeit, das Lager zurück zu erobern. Ich will, dass du die anderen Zufluchten unserer Leute aufsuchst und sie in das Sektenlager schickst, wo wir eine Beratung abhalten werden.
	AI_Output(self, hero, "Info_Mod_Alissandro_GotoZufluchten_02_01"); //Jackal wird in der Zeit die verbündeten Gilden aufsuchen und ihnen diese Botschaft überbringen.
	AI_Output(hero, self, "Info_Mod_Alissandro_GotoZufluchten_15_02"); //Wo sind die anderen Zufluchten?
	AI_Output(self, hero, "Info_Mod_Alissandro_GotoZufluchten_02_03"); //Du bekommst diese Karte von mir.
	
	CreateInvItems	(self, ItWrWorldmapZufluchten, 1);
	B_GiveInvItems	(self, hero, ItWrWorldmapZufluchten, 1);

	AI_Output(self, hero, "Info_Mod_Alissandro_GotoZufluchten_02_04"); //Wenn du bei allen sieben Zufluchten warst, geh ins Sektenlager zum Tempelvorplatz.

	Mod_AL_AlissandroBefreit = 3;

	Log_CreateTopic	(TOPIC_MOD_AL_EROBERUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_EROBERUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_EROBERUNG, "Alissandro hat mir den Auftrag gegeben, die Zufluchten unserer Leute aufzusuchen und sie zum Tempelvorplatz der Sekte zu schicken.");

	B_StartOtherRoutine	(Mod_1107_GRD_Jackal_MT, "INPSICAMP");
	B_StartOtherRoutine	(Mod_761_BDT_Dexter_MT, "INPSICAMP");
	B_StartOtherRoutine	(Mod_1016_KGD_Hymir_MT, "INPSICAMP");
	B_StartOtherRoutine	(Mod_2005_GUR_CorCadar_MT, "INPSICAMP");
	B_StartOtherRoutine	(Mod_106_TPL_Angar_MT, "INPSICAMP");
	B_StartOtherRoutine	(Mod_1874_HMG_Makanius_MT, "INPSICAMP");
	B_StartOtherRoutine	(self, "INPSICAMP");

	Wld_InsertNpc	(Mod_1923_GRD_Gardist_MT, "OC1");
};

INSTANCE Info_Mod_Alissandro_Eroberung_01 (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Eroberung_01_Condition;
	information	= Info_Mod_Alissandro_Eroberung_01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_Eroberung_01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jackal_AtPC))
	&& (Npc_GetDistToWP(hero, "PSI_TEMPLE_IN_05") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_Eroberung_01_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_Eroberung_01_02_00"); //Wir haben einen Plan ausgearbeitet, wie wir das Lager einnehmen.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Alissandro_Eroberung_08 (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Eroberung_08_Condition;
	information	= Info_Mod_Alissandro_Eroberung_08_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_Eroberung_08_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Eroberung_07))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_Eroberung_08_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_Eroberung_08_02_00"); //Wir kümmern uns in der Zeit nicht um die Schlacht draußen, sondern suchen Bartholo.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Alissandro_Eroberung_10 (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Eroberung_10_Condition;
	information	= Info_Mod_Alissandro_Eroberung_10_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_Eroberung_10_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Makanius_Eroberung_09))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_Eroberung_10_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_Eroberung_10_02_00"); //Also, ich fasse es noch mal zusammen:
	AI_Output(self, hero, "Info_Mod_Alissandro_Eroberung_10_02_01"); //1. Schritt: Wir dringen als Sumpfkrauthändler verkleidet in das Lager ein. Als Geleitschutz dienen uns zwei Templer.
	AI_Output(self, hero, "Info_Mod_Alissandro_Eroberung_10_02_02"); //2. Schritt: Makanius gibt für unsere Leute im Lager das Zeichen, die Tore zu öffnen.
	AI_Output(self, hero, "Info_Mod_Alissandro_Eroberung_10_02_03"); //3. Schritt: Die Banditen vom einen und die Garde vom anderen Tor stoßen zu uns und bekämpfen die Gardisten.
	AI_Output(self, hero, "Info_Mod_Alissandro_Eroberung_10_02_04"); //4. Schritt: Unser Auftrag liegt darin, Bartholo zu töten, dabei helfen uns die Heilmagier.
	AI_Output(self, hero, "Info_Mod_Alissandro_Eroberung_10_02_05"); //Gut, dann brechen wir nun auf. Folge mir.

	B_LogEntry	(TOPIC_MOD_AL_EROBERUNG, "Er hat mir den Plan erklärt, er lautet:");
	B_LogEntry	(TOPIC_MOD_AL_EROBERUNG, "1. Schritt: Wir dringen als Sumpfkrauthändler verkleidet in das Lager ein. Als Geleitschutz dienen uns zwei Templer.");
	B_LogEntry	(TOPIC_MOD_AL_EROBERUNG, "2. Schritt: Makanius gibt für unsere Leute im Lager das Zeichen, die Tore zu öffnen.");
	B_LogEntry	(TOPIC_MOD_AL_EROBERUNG, "3. Schritt: Die Banditen vom einen und die Garde vom anderen Tor stoßen zu uns und bekämpfen die Gardisten.");
	B_LogEntry	(TOPIC_MOD_AL_EROBERUNG, "4. Schritt: Unser Auftrag liegt darin, Bartholo zu töten, dabei helfen uns die Heilmagier.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GOTOTEMPELVORPLATZ");
};

INSTANCE Info_Mod_Alissandro_BeiBartholo (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_BeiBartholo_Condition;
	information	= Info_Mod_Alissandro_BeiBartholo_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_BeiBartholo_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GardistFuerEroberung_Hi_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_BeiBartholo_Info()
{
	AI_UnequipArmor	(self);

	AI_EquipArmor	(self, EBR_ARMOR_H2);

	AI_Output(self, hero, "Info_Mod_Alissandro_BeiBartholo_02_00"); //Angriff!
	
	B_LogEntry	(TOPIC_MOD_AL_EROBERUNG, "Wir sind nun bei Bartholo und Makanius hat das Signal für die Banditen und königlichen Gardisten gegeben, allerdings ist Bartholo geflohen und hat uns einen Gardisten auf den Hals gehetzt.");
	
	B_StartOtherRoutine	(Mod_1106_EBR_Bartholo_MT, "FLUCHTINKERKER");

	Wld_SendTrigger	("EVT_KERKERGATE_01");

	B_Attack	(self, Mod_1156_GRD_Gardist_MT, AR_GuildEnemy, 0);
	B_Attack	(Mod_1924_TPL_GorNaMon_MT, Mod_1156_GRD_Gardist_MT, AR_GuildEnemy, 0);
	B_Attack	(Mod_1925_TPL_GorNaKar_MT, Mod_1156_GRD_Gardist_MT, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Alissandro_WacheTotWoBartholo (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_WacheTotWoBartholo_Condition;
	information	= Info_Mod_Alissandro_WacheTotWoBartholo_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_WacheTotWoBartholo_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_BeiBartholo))
	&& (Npc_IsDead(Mod_1156_GRD_Gardist_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_WacheTotWoBartholo_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_WacheTotWoBartholo_02_00"); //Jetzt müssen wir Bartholo suchen. Er kann das Lager nicht verlassen haben.
	
	B_StartOtherRoutine	(self, "GOTOMAKANIUS");
	B_StartOtherRoutine	(Mod_1924_TPL_GorNaMon_MT, "STAYATOC");
	B_StartOtherRoutine	(Mod_1925_TPL_GorNaKar_MT, "STAYATOC");
	B_StartOtherRoutine	(Mod_1874_HMG_Makanius_MT, "WAITFORPLAYER");
};

INSTANCE Info_Mod_Alissandro_BartholoTot (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_BartholoTot_Condition;
	information	= Info_Mod_Alissandro_BartholoTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das Lager ist nun wieder in unserer Hand.";
};

FUNC INT Info_Mod_Alissandro_BartholoTot_Condition()
{
	if (Npc_IsDead(Mod_1106_EBR_Bartholo_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_BartholoTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Alissandro_BartholoTot_15_00"); //Das Lager ist nun wieder in unserer Hand.
	AI_Output(self, hero, "Info_Mod_Alissandro_BartholoTot_02_01"); //Gut, nun ist der Kampf vorbei. In diesem Fall hast du es verdient, belohnt zu werden.
	AI_Output(self, hero, "Info_Mod_Alissandro_BartholoTot_02_02"); //Komm morgen in den Thronsaal.

	AI_StopProcessInfos	(self);
	
	B_LogEntry	(TOPIC_MOD_AL_EROBERUNG, "Ich habe Bartholo in den Kerkern gefunden und getötet. Nun soll ich am nächsten Tag in den Thronsaal kommen.");

	B_StartOtherRoutine	(Mod_1874_HMG_Makanius_MT, "ALTESLAGER");
	B_StartOtherRoutine	(self, "BOSS");

	Mod_AL_BelohnungFuerEroberung = Wld_GetDay();
};

INSTANCE Info_Mod_Alissandro_BelohnungFuerEroberung (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_BelohnungFuerEroberung_Condition;
	information	= Info_Mod_Alissandro_BelohnungFuerEroberung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_BelohnungFuerEroberung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_BartholoTot))
	&& (Wld_GetDay() > Mod_AL_BelohnungFuerEroberung)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_BelohnungFuerEroberung_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_BelohnungFuerEroberung_02_00"); //Gut, du wurdest nun hierher berufen, um den höchsten Rang im Lager einzunehmen.
	AI_Output(self, hero, "Info_Mod_Alissandro_BelohnungFuerEroberung_02_01"); //Nimm diese Rüstung in Empfang und sprich mir nach:

	CreateInvItems	(hero, Ebr_Armor_H2, 1);

	B_ShowGivenThings	("Schwere Erzbaronrüstung erhalten");

	AI_Output(self, hero, "Info_Mod_Alissandro_BelohnungFuerEroberung_02_02"); //Ich schwöre im Namen jedes Mitgliedes des Lagers, ...
	AI_Output(hero, self, "Info_Mod_Alissandro_BelohnungFuerEroberung_15_03"); //Ich schwöre im Namen jedes Mitgliedes des Lagers, ...
	AI_Output(self, hero, "Info_Mod_Alissandro_BelohnungFuerEroberung_02_04"); //... ob Buddler, Schatten oder Erzbaron, ...
	AI_Output(hero, self, "Info_Mod_Alissandro_BelohnungFuerEroberung_15_05"); //... ob Buddler, Schatten oder Erzbaron, ...
	AI_Output(self, hero, "Info_Mod_Alissandro_BelohnungFuerEroberung_02_06"); //... dass ich das Lager gerecht leite und schütze.
	AI_Output(hero, self, "Info_Mod_Alissandro_BelohnungFuerEroberung_15_07"); //... dass ich das Lager gerecht leite und schütze.
	AI_Output(self, hero, "Info_Mod_Alissandro_BelohnungFuerEroberung_02_08"); //Nun gut, nun bist du Erzbaron des Alten Lagers.

	B_LogEntry	(TOPIC_MOD_AL_EROBERUNG, "Ich wurde von Alissandro zum Erzbaron ernannt.");
	B_SetTopicStatus	(TOPIC_MOD_AL_EROBERUNG, LOG_SUCCESS);

	B_GivePlayerXP	(2500);

	B_Göttergefallen(2, 3);
};

INSTANCE Info_Mod_Alissandro_WasTunAlsErzbaron (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_WasTunAlsErzbaron_Condition;
	information	= Info_Mod_Alissandro_WasTunAlsErzbaron_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist meine Aufgabe als Erzbaron?";
};

FUNC INT Info_Mod_Alissandro_WasTunAlsErzbaron_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_BelohnungFuerEroberung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_WasTunAlsErzbaron_Info()
{
	AI_Output(hero, self, "Info_Mod_Alissandro_WasTunAlsErzbaron_15_00"); //Was ist meine Aufgabe als Erzbaron?
	AI_Output(self, hero, "Info_Mod_Alissandro_WasTunAlsErzbaron_02_01"); //Nun, wir kümmern uns um die Probleme des Lagers und versuchen es einflussreicher zu machen.
	AI_Output(hero, self, "Info_Mod_Alissandro_WasTunAlsErzbaron_15_02"); //Und wie soll ich dazu beitragen?
	AI_Output(self, hero, "Info_Mod_Alissandro_WasTunAlsErzbaron_02_03"); //Unser momentanes Ziel ist es, unseren Einfluss auf Khorinis auszuweiten.
	AI_Output(hero, self, "Info_Mod_Alissandro_WasTunAlsErzbaron_15_04"); //Und was kann ich dabei tun?
	AI_Output(self, hero, "Info_Mod_Alissandro_WasTunAlsErzbaron_02_05"); //Geh in die Stadt und rede mit Larius, dem Statthalter.
	AI_Output(hero, self, "Info_Mod_Alissandro_WasTunAlsErzbaron_15_06"); //Larius' Posten haben doch die Paladine übernommen.
	AI_Output(self, hero, "Info_Mod_Alissandro_WasTunAlsErzbaron_02_07"); //Verdammt, das wusste ich nicht.
	AI_Output(hero, self, "Info_Mod_Alissandro_WasTunAlsErzbaron_15_08"); //Und was soll ich jetzt machen?
	AI_Output(self, hero, "Info_Mod_Alissandro_WasTunAlsErzbaron_02_09"); //Der Schatten Whistler ist bereits auf dem Weg in die Stadt. Unterhalte dich mit ihm.

	Log_CreateTopic	(TOPIC_MOD_AL_AUSBREITUNGK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_AUSBREITUNGK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_AUSBREITUNGK, "Alissandro will, dass wir den Einfluss des Lagers in die Stadt Khorinis ausweiten. Dafür soll ich Whistler vor dem Stadttor treffen.");

	B_StartOtherRoutine	(Mod_1161_STT_Whistler_MT, "TOT");
	AI_Teleport	(Mod_1161_STT_Whistler_MT, "TOT");

	B_StartOtherRoutine	(Mod_948_BDT_Esteban_MT, "TOT");
	B_StartOtherRoutine	(Mod_790_BDT_Morgahard_MT, "TOT");
};

INSTANCE Info_Mod_Alissandro_Daemonenritter (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Daemonenritter_Condition;
	information	= Info_Mod_Alissandro_Daemonenritter_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_Daemonenritter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Whistler_NW_Daemonen))
	&& (Npc_IsDead(Mod_1935_DMR_Daemonenritter_MT))
	&& (Npc_IsDead(Mod_1936_DMR_Daemonenritter_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_Daemonenritter_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_Daemonenritter_02_00"); //Wer sind diese Leute? Was wollen sie von uns?
	AI_Output(hero, self, "Info_Mod_Alissandro_Daemonenritter_15_01"); //Das ist eine lange Geschichte, für die wir aber nun keine Zeit haben. Es kommt sicher bald Verstärkung. Wir sollten abhauen, bevor noch mehr von den Kerlen hier sind.
	AI_Output(self, hero, "Info_Mod_Alissandro_Daemonenritter_02_02"); //Gut, folgt mir!

	B_LogEntry	(TOPIC_MOD_AL_MINE, "Es ist zu spät, die Dämonenritter sind schon bei Alissandro. Wir konnten sie schlagen, allerdings wird bald Verstärkung kommen. Wir sollten fliehen.");

	B_StartOtherRoutine	(self, "TOCAVALORN");
	B_StartOtherRoutine	(Mod_1105_EBR_Arto_MT, "TOCAVALORN");
};

INSTANCE Info_Mod_Alissandro_AtCavalorn (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_AtCavalorn_Condition;
	information	= Info_Mod_Alissandro_AtCavalorn_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_AtCavalorn_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Daemonenritter))
	&& (Npc_GetDistToWP(self, "OW_SAWHUT_GREENGOBBO_SPAWN") < 200)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_AtCavalorn_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_AtCavalorn_02_00"); //Hier dürften wir in Sicherheit sein. Und nun erklär mir, was die Leute in den schwarzen Rüstungen von uns wollen.
	AI_Output(hero, self, "Info_Mod_Alissandro_AtCavalorn_15_01"); //Diese Kerle arbeiten für Gomez, der das Lager zurück will. Ich ging wie angefordert zu den Dämonenrittern, um ihnen ein Angebot wegen der Alten Mine zu machen.
	AI_Output(hero, self, "Info_Mod_Alissandro_AtCavalorn_15_02"); //Es gab bei den Verhandlungen ein paar kleine Probleme, die dazu geführt haben, dass die Dämonenritter jetzt das Alte Lager erobern wollen, damit Gomez, Raven und Scar ihren Platz hier wieder einnehmen können.
	AI_Output(self, hero, "Info_Mod_Alissandro_AtCavalorn_02_03"); //Nun gut, jetzt sollten wir den nächsten Schritt planen.
	AI_Output(self, hero, "Info_Mod_Alissandro_AtCavalorn_02_04"); //Ich werde etwas darüber nachdenken, wir unterhalten uns morgen darüber.

	Mod_AL_AtCavalorn = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_AL_MINE, "Ich floh mit Alissandro zu Cavalorns alter Hütte. Hier können wir den nächsten Schritt ausarbeiten.");
	B_SetTopicStatus	(TOPIC_MOD_AL_MINE, LOG_SUCCESS);

	B_GivePlayerXP	(1000);

	B_StartOtherRoutine	(self, "ATCAVALORN");
	B_StartOtherRoutine	(Mod_1105_EBR_Arto_MT, "ATCAVALORN");

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Alissandro_Flucht (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Flucht_Condition;
	information	= Info_Mod_Alissandro_Flucht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was jetzt?";
};

FUNC INT Info_Mod_Alissandro_Flucht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_AtCavalorn))
	&& (Wld_GetDay() > Mod_AL_AtCavalorn)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_Flucht_Info()
{
	AI_Output(hero, self, "Info_Mod_Alissandro_Flucht_15_00"); //Was jetzt?
	AI_Output(self, hero, "Info_Mod_Alissandro_Flucht_02_01"); //Wir sind hier nicht lange sicher, vermutlich sucht man schon nach uns.
	AI_Output(hero, self, "Info_Mod_Alissandro_Flucht_15_02"); //Dann treten wir denen, die uns suchen, in den Arsch.
	AI_Output(self, hero, "Info_Mod_Alissandro_Flucht_02_03"); //Dafür sind es zu viele und wir können keine Verstärkung anfordern. Wir müssen erst einmal fliehen und Unterstützung anfordern und da hätte ich einen Plan ...
	AI_Output(hero, self, "Info_Mod_Alissandro_Flucht_15_04"); //Wie sieht der aus?
	AI_Output(self, hero, "Info_Mod_Alissandro_Flucht_02_05"); //Die Paladine sind mit Gomez' Leuten verfeindet und sie sind eine starke Gilde, also können wir vielleicht auf ihre Unterstützung hoffen.
	AI_Output(hero, self, "Info_Mod_Alissandro_Flucht_15_06"); //Warum sollten die Paladine ausgerechnet uns helfen?
	AI_Output(self, hero, "Info_Mod_Alissandro_Flucht_02_07"); //(belustigt) Oh, ich habe einen bemerkenswert guten Draht zu ihnen ...
	AI_Output(hero, self, "Info_Mod_Alissandro_Flucht_15_08"); //Wie das?
	AI_Output(self, hero, "Info_Mod_Alissandro_Flucht_02_09"); //Na gut, ich denke, ich sollte es dir erzählen ... Bevor ich mich auf Khorinis als Händler niederließ, war ich Paladin in Myrtana und mit Hagen befreundet.
	AI_Output(self, hero, "Info_Mod_Alissandro_Flucht_02_10"); //Wir schlugen zusammen die Schlacht von Ishtar, als es von uns besetzt war und der Assassinenführer Zuben die Stadt zurückerobern wollte ... Nun, wir haben den Angriff damals abgewehrt, heute haben die Assassinen allerdings wieder die Macht in Varant...
	AI_Output(self, hero, "Info_Mod_Alissandro_Flucht_02_11"); //Das tut allerdings nichts zur Sache. Ich bin jedenfalls mit Lord Hagen befreundet und ich denke, er wird uns helfen.
	AI_Output(hero, self, "Info_Mod_Alissandro_Flucht_15_12"); //Gut, wie soll ich aber aus dem Minental herauskommen? Gomez' Leute bewachen alle Ausgänge.
	AI_Output(self, hero, "Info_Mod_Alissandro_Flucht_02_13"); //Das ist wahr und macht es schwieriger. Nur haben die Wachen beim Austauschplatz dieses Zeug für sich entdeckt, das sie in Khorata verkaufen ... Wie hieß es noch mal? Frustspender?
	AI_Output(hero, self, "Info_Mod_Alissandro_Flucht_15_14"); //Freudenspender ... Ich verstehe. Ich werde versuchen, Lord Hagen zu erreichen.
	AI_Output(self, hero, "Info_Mod_Alissandro_Flucht_02_15"); //Gut, viel Glück!

	Wld_InsertNpc	(DemonKnight_01,	"START");
	Wld_InsertNpc	(DemonKnight_02,	"START");
	Wld_InsertNpc	(Mod_7065_DMR_Daemonenritter_MT,	"START");
	Wld_InsertNpc	(Mod_7066_DMR_Daemonenritter_MT,	"START");

	Log_CreateTopic	(TOPIC_MOD_AL_FLUCHT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_FLUCHT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_FLUCHT, "Alissandro hat mich zu den Paladinen geschickt. Um das Minental zu verlassen, sollte ich den weg beim Austauschplatz nehmen.");
};

INSTANCE Info_Mod_Alissandro_Hagen (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Hagen_Condition;
	information	= Info_Mod_Alissandro_Hagen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lord Hagen hat uns die Hilfe der Paladine zugesichert.";
};

FUNC INT Info_Mod_Alissandro_Hagen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_Alissandro))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_Hagen_Info()
{
	AI_Output(hero, self, "Info_Mod_Alissandro_Hagen_15_00"); //Lord Hagen hat uns die Hilfe der Paladine zugesichert.
	AI_Output(self, hero, "Info_Mod_Alissandro_Hagen_02_01"); //Sehr gut. Nun warten wir, bis seine Leute kommen.

	B_GivePlayerXP	(500);

	Mod_AL_Alissandro_WaitForOric = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_AL_FLUCHT, "Ich habe Alissandro von Lord Hagens Hilfe berichtet.");
	B_SetTopicStatus	(TOPIC_MOD_AL_FLUCHT, LOG_SUCCESS);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Alissandro_OricDa (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_OricDa_Condition;
	information	= Info_Mod_Alissandro_OricDa_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hätte etwas mehr Paladine erwartet.";
};

FUNC INT Info_Mod_Alissandro_OricDa_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Hagen))
	&& (Mod_AL_Alissandro_WaitForOric < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_OricDa_Info()
{
	AI_Output(hero, self, "Info_Mod_Alissandro_OricDa_15_00"); //Ich hätte etwas mehr Paladine erwartet.
	AI_Output(self, hero, "Info_Mod_Alissandro_OricDa_02_01"); //Das ist nur die Truppe, mit der wir die ersten Schritte ausführen werden. Für die Befreiung der Mine werden mehr zu uns stoßen und für die Belagerung ebenfalls.
	AI_Output(self, hero, "Info_Mod_Alissandro_OricDa_02_02"); //Mit Orics Truppe nehmen wir die Wege aus dem Minental ein. Wir werden nun gleich losgehen und die Alte Mine wie auch den Austauschplatz erobern.
	AI_Output(hero, self, "Info_Mod_Alissandro_OricDa_15_03"); //Was machen wir mit den Beliarschreinen?
	AI_Output(self, hero, "Info_Mod_Alissandro_OricDa_02_04"); //Die Orks in der Orkstadt sind mit allen Menschen verfeindet. Die in der Festung unterhalten Beziehungen mit dem Schwarzmagier, der die Dämonenritter und die Beschwörer anführt ...
	AI_Output(self, hero, "Info_Mod_Alissandro_OricDa_02_05"); //... dieser unterstützt Gomez' Pläne allerdings nicht und hat die Altäre für die Ritter, die mit Gomez zusammenarbeiten, gesperrt.
	AI_Output(hero, self, "Info_Mod_Alissandro_OricDa_15_06"); //Das macht die Sache etwas einfacher.
	AI_Output(self, hero, "Info_Mod_Alissandro_OricDa_02_07"); //Gut. Wir ziehen's jetzt durch. Folgen wir Oric.

	Log_CreateTopic	(TOPIC_MOD_AL_ERSTERSCHRITT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_ERSTERSCHRITT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_ERSTERSCHRITT, "Wir sollen als Erstes die Zugänge in das Minental einnehmen. Dabei stehen uns einige Paladine unter Oric zur Seite.");

	B_StartOtherRoutine	(self, "TOVM");
	B_StartOtherRoutine	(Mod_7039_PAL_Oric_MT, "TOVM");
	B_StartOtherRoutine	(Mod_7040_RIT_Ritter_MT, "TOVM");
	B_StartOtherRoutine	(Mod_7041_RIT_Ritter_MT, "TOVM");
	B_StartOtherRoutine	(Mod_7042_RIT_Ritter_MT, "TOVM");
	B_StartOtherRoutine	(Mod_7043_RIT_Ritter_MT, "TOVM");
	B_StartOtherRoutine	(Mod_7044_RIT_Ritter_MT, "TOVM");
	B_StartOtherRoutine	(Mod_7045_RIT_Ritter_MT, "TOVM");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_7039_PAL_Oric_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_7040_RIT_Ritter_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_7041_RIT_Ritter_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_7042_RIT_Ritter_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_7043_RIT_Ritter_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_7044_RIT_Ritter_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_7045_RIT_Ritter_MT.aivar[AIV_PARTYMEMBER] = TRUE;

	Wld_InsertNpc	(Mod_7051_DMR_Daemonenritter_MT, "OC1");
	Wld_InsertNpc	(Mod_7052_DMR_Daemonenritter_MT, "OC1");
	Wld_InsertNpc	(Mod_7053_DMR_Daemonenritter_MT, "OC1");
	Wld_InsertNpc	(Mod_7054_DMR_Daemonenritter_MT, "OC1");
	Wld_InsertNpc	(Mod_7055_DMR_Daemonenritter_MT, "OC1");
	Wld_InsertNpc	(Mod_7056_DMR_Daemonenritter_MT, "OC1");
	Wld_InsertNpc	(Mod_7057_DMR_Daemonenritter_MT, "OC1");
	Wld_InsertNpc	(Mod_7058_DMR_Daemonenritter_MT, "OC1");
	Wld_InsertNpc	(Mod_7059_DMR_Daemonenritter_MT, "OC1");
	Wld_InsertNpc	(Mod_7060_DMR_Daemonenritter_MT, "OC1");
	Wld_InsertNpc	(Mod_7061_DMR_Daemonenritter_MT, "OC1");
	Wld_InsertNpc	(Mod_7062_DMR_Daemonenritter_MT, "OC1");
	Wld_InsertNpc	(Mod_7063_DMR_Daemonenritter_MT, "OC1");
	Wld_InsertNpc	(Mod_7064_DMR_Daemonenritter_MT, "OC1");

	Wld_SendTrigger	("EVT_AM_LOB_GATE_BIG");
};

INSTANCE Info_Mod_Alissandro_Lockvogel (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Lockvogel_Condition;
	information	= Info_Mod_Alissandro_Lockvogel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht es jetzt weiter?";
};

FUNC INT Info_Mod_Alissandro_Lockvogel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oric_MineUns))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_Lockvogel_Info()
{
	AI_Output(hero, self, "Info_Mod_Alissandro_Lockvogel_15_00"); //Wie geht es jetzt weiter?

	if (Npc_HasItems(hero, ITRU_TELEPORTOLDCAMP) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Alissandro_Lockvogel_02_01"); //Du hast noch die Teleportrune in das Lager ...
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Alissandro_Lockvogel_02_02"); //Hier hast du eine Teleportrune ins Lager ...

		B_GiveInvItems	(self, hero, ITRU_TELEPORTOLDCAMP, 1);

		Wld_RemoveItem	(ITRU_TELEPORTOLDCAMP);
	};

	AI_Output(self, hero, "Info_Mod_Alissandro_Lockvogel_02_03"); //Sie bringt dich in das Haus der Heilmagier. Sie sind im Haus gefangen, es wird bewacht.
	AI_Output(self, hero, "Info_Mod_Alissandro_Lockvogel_02_04"); //Allerdings stehen sie auf unserer Seite. Sie werden dich also nicht verraten, wenn du dich in ihr Gebäude teleportierst.
	AI_Output(self, hero, "Info_Mod_Alissandro_Lockvogel_02_05"); //Zusammen mit den Heilmagiern tötest du die Wache des Hauses und nimmst ihre Rüstung.
	AI_Output(self, hero, "Info_Mod_Alissandro_Lockvogel_02_06"); //Gehe mit dieser zu Gomez und versuche ihn und seine Leute aus dem Lager in den Wald in der Nähe der Hütte zu locken.
	AI_Output(self, hero, "Info_Mod_Alissandro_Lockvogel_02_07"); //Dort werden wir einen Hinterhalt vorbereiten.
	AI_Output(hero, self, "Info_Mod_Alissandro_Lockvogel_15_08"); //Klingt riskant. Woher soll ich wissen, dass die anderen Dämonenritter nicht alarmiert werden, wenn ich die Wache bei den Heilmagiern umbringe?
	AI_Output(self, hero, "Info_Mod_Alissandro_Lockvogel_02_09"); //Überlass das Makanius. Er scheint einen Plan zu haben. Nun geh und erfülle deine Aufgabe ... viel Glück.

	Log_CreateTopic	(TOPIC_MOD_AL_LOCKVOGEL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_LOCKVOGEL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_LOCKVOGEL, "Alissandro hat einen Plan Gomez auszuschalten, dazu muss ich mich zuerst in das Haus der Heilmagier teleportieren. Makanius wird mir das Übrige erklären.");
};

INSTANCE Info_Mod_Alissandro_Ende (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Ende_Condition;
	information	= Info_Mod_Alissandro_Ende_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alissandro_Ende_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_Raven))
	&& (!Npc_IsInState(Mod_680_DMB_Xardas_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_Ende_Info()
{
	AI_Output(self, hero, "Info_Mod_Alissandro_Ende_02_00"); //Das wäre geschafft. Nun steht dem Lager nichts mehr im Wege. wir werden es in eine strahlende Zukunft führen!
	
	B_LogEntry	(TOPIC_MOD_AL_LOCKVOGEL, "Das Lager ist unser und bleibt es!");
	B_SetTopicStatus	(TOPIC_MOD_AL_LOCKVOGEL, LOG_SUCCESS);

	B_GivePlayerXP	(1000);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_7039_PAL_Oric_MT, "TOT");
	B_StartOtherRoutine	(Mod_1874_HMG_Makanius_MT, "ALTESLAGER");

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Alissandro_Erzbaron (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Erzbaron_Condition;
	information	= Info_Mod_Alissandro_Erzbaron_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie bist du Erzbaron geworden?";
};

FUNC INT Info_Mod_Alissandro_Erzbaron_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alissandro_Erzbaron_Info()
{
	AI_Output(hero, self, "Info_Mod_Alissandro_Erzbaron_15_00"); //Wie bist du Erzbaron geworden?
	AI_Output(self, hero, "Info_Mod_Alissandro_Erzbaron_02_01"); //Ich war vorher Kaufmann in Khorinis und habe Erz an- und verkauft. Also bin ich nach dem Fall der Barriere in das Minental gekommen, um zu sehen, wie es um das Erz steht.
	AI_Output(self, hero, "Info_Mod_Alissandro_Erzbaron_02_02"); //Mein Erkundigungen führten mich ins Alte Lager.
	AI_Output(self, hero, "Info_Mod_Alissandro_Erzbaron_02_03"); //Als ich mich ein Weilchen mit Thorus unterhalten hatte, fragte er mich, ob ich ihm nicht mit meinem Handelsgeschick unter die Arme greifen könnte.
	AI_Output(self, hero, "Info_Mod_Alissandro_Erzbaron_02_04"); //Nun ja, da ich ja auch das Erz in Aussicht hatte, habe ich natürlich zugestimmt.
	AI_Output(self, hero, "Info_Mod_Alissandro_Erzbaron_02_05"); //Und so arbeiten wir hier nun zusammen und ich bin sein oberster Berater.
};

INSTANCE Info_Mod_Alissandro_Pickpocket (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_Pickpocket_Condition;
	information	= Info_Mod_Alissandro_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Alissandro_Pickpocket_Condition()
{
	C_Beklauen	(169, ItMi_Gold, 900);
};

FUNC VOID Info_Mod_Alissandro_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Alissandro_Pickpocket);

	Info_AddChoice	(Info_Mod_Alissandro_Pickpocket, DIALOG_BACK, Info_Mod_Alissandro_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Alissandro_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Alissandro_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Alissandro_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Alissandro_Pickpocket);
};

FUNC VOID Info_Mod_Alissandro_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Alissandro_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Alissandro_Pickpocket);

		Info_AddChoice	(Info_Mod_Alissandro_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Alissandro_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Alissandro_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Alissandro_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Alissandro_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Alissandro_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Alissandro_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Alissandro_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Alissandro_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Alissandro_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Alissandro_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Alissandro_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Alissandro_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Alissandro_EXIT (C_INFO)
{
	npc		= Mod_1870_EBR_Alissandro_MT;
	nr		= 1;
	condition	= Info_Mod_Alissandro_EXIT_Condition;
	information	= Info_Mod_Alissandro_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alissandro_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alissandro_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};