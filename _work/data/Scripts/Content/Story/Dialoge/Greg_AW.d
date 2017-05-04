INSTANCE Info_Mod_Greg_Hi (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Hi_Condition;
	information	= Info_Mod_Greg_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Henry_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_Hi_01_00"); //Adanos! Eine Landratte! Was willst du?
	AI_Output(hero, self, "Info_Mod_Greg_Hi_15_01"); //Ich will Pirat werden.
	AI_Output(self, hero, "Info_Mod_Greg_Hi_01_02"); //Pirat? Du? Wir veranstalten hier keine Teeparty min Jung!
	AI_Output(hero, self, "Info_Mod_Greg_Hi_15_03"); //Ich will auch keinen Tee trinken!
	AI_Output(hero, self, "Info_Mod_Greg_Hi_15_04"); //Ihr seht aber verdammt so aus als würdet ihr das!
	AI_Output(self, hero, "Info_Mod_Greg_Hi_01_05"); //Nu nimm das Maul nich so voll.
	AI_Output(self, hero, "Info_Mod_Greg_Hi_01_06"); //Wo kommst du eigentlich her? Skip hat dich sicher nicht mitgebracht.
	AI_Output(hero, self, "Info_Mod_Greg_Hi_15_07"); //Ich komme aus Khorinis. Durch die Berge gewissermassen.
	AI_Output(self, hero, "Info_Mod_Greg_Hi_01_08"); //Die Berge? Gibt's da 'nen geheimen Pfad oder sowas?
	AI_Output(hero, self, "Info_Mod_Greg_Hi_15_09"); //Nein. Magier haben eine Möglichkeit gefunden zwischen dem alten Tempel oben und einem Gegenstück in Khorinis einen Durchgang nach Jharkendar zu schaffen.
	AI_Output(self, hero, "Info_Mod_Greg_Hi_01_10"); //Jharkendar?
	AI_Output(hero, self, "Info_Mod_Greg_Hi_15_11"); //So haben die alten Erbauer diesen Landstrich genannt. Die sollen vor Jahrhunderten die Insel besiedelt haben.
	AI_Output(self, hero, "Info_Mod_Greg_Hi_01_12"); //Aha. Und du willst wirklich Pirat werden, was?
	AI_Output(self, hero, "Info_Mod_Greg_Hi_01_13"); //Na gut. Hier nimm die Hacke in die Rechte und die Karte in die Linke.

	CreateInvItems	(hero, ItWR_Addon_TreasureMap, 1);
	CreateInvItems	(hero, ItMw_2H_Axe_L_01, 1);

	B_ShowGivenThings	("Spitzhacke und Karte erhalten");

	AI_Output(self, hero, "Info_Mod_Greg_Hi_01_14"); //Wir werden ja sehen ob du das Zeug zum Pirat hast!

	Log_CreateTopic	(TOPIC_MOD_GREG_AUFNAHME, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GREG_AUFNAHME, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GREG_AUFNAHME, "Greg hat mir eine Schatzkarte und eine Spitzhacke gegeben. Ich soll ihm die Schätze besorgen.");
};

INSTANCE Info_Mod_Greg_Sweetwater (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Sweetwater_Condition;
	information	= Info_Mod_Greg_Sweetwater_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was für Probleme habt ihr?";
};

FUNC INT Info_Mod_Greg_Sweetwater_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Sweetwater))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Sweetwater_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_Sweetwater_15_00"); //Was für Probleme habt ihr?
	AI_Output(self, hero, "Info_Mod_Greg_Sweetwater_01_01"); //Wasser. Uns geht das Wasser aus. Und euch wohl auch.
	AI_Output(hero, self, "Info_Mod_Greg_Sweetwater_15_02"); //Wasser geht aus? Hier am Meer? Willst du mich verarschen?
	AI_Output(self, hero, "Info_Mod_Greg_Sweetwater_01_03"); //Ich meine Süßwasser. Der See in der Senke oben ist das einzige Süßwasser, das wir hier haben.
	AI_Output(hero, self, "Info_Mod_Greg_Sweetwater_15_04"); //Und? Da ist doch genug, möchte ich meinen.
	AI_Output(self, hero, "Info_Mod_Greg_Sweetwater_01_05"); //Schon, aber wir kommen nicht dran. Die Senke wimmelt vor Alligatoren.
	AI_Output(self, hero, "Info_Mod_Greg_Sweetwater_01_06"); //Weiß Adanos, wo die plötzlich alle herkommen.
	AI_Output(hero, self, "Info_Mod_Greg_Sweetwater_15_07"); //Aha. Und da soll ich ...
	AI_Output(self, hero, "Info_Mod_Greg_Sweetwater_01_08"); //Rede mal mit Alligator Jack. Er steht vorm Tor. Passt auf, dass die Viecher nicht hier runter kommen.
	AI_Output(hero, self, "Info_Mod_Greg_Sweetwater_15_09"); //Alligator Jack? Da habt ihr doch einen Spezialisten.
	AI_Output(self, hero, "Info_Mod_Greg_Sweetwater_01_10"); //Schon. Aber allein hat er keine Chance, sagt er.
	AI_Output(hero, self, "Info_Mod_Greg_Sweetwater_15_11"); //Na gut. Ich rede mal mit ihm.
	AI_Output(self, hero, "Info_Mod_Greg_Sweetwater_01_12"); //Dann ist gut.

	B_LogEntry	(TOPIC_MOD_JG_SWEETWATER, "Alligatorenplage im Talkessel, dem Süßwasserreservoir ... Mal sehen, was Alligator Jack erzählt.");

	B_StartOtherRoutine	(Mod_928_PIR_AlligatorJack_AW, "PRESTART");
};

INSTANCE Info_Mod_Greg_Irdorath (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Irdorath_Condition;
	information	= Info_Mod_Greg_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich beabsichtige eine Exkursion über die weite See.";
};

FUNC INT Info_Mod_Greg_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Irdorath))
	&& (Mod_Irdorath == 0)
	&& (Piraten_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_Irdorath_15_00"); //Ich beabsichtige eine Exkursion über die weite See.
	AI_Output(hero, self, "Info_Mod_Greg_Irdorath_15_01"); //Dazu brauche ich aber einen fähigen Kapitän, der das Schiff der Paladine aus dem Hafen ...
	AI_Output(self, hero, "Info_Mod_Greg_Irdorath_01_02"); //(unterbricht) Ich soll in die Hafenstadt und auf das Schiff der Paladine?
	AI_Output(self, hero, "Info_Mod_Greg_Irdorath_01_03"); //Du bist mir gut, dann kann ich mich ja gleich den königlichen Häschern ausliefern.
	AI_Output(self, hero, "Info_Mod_Greg_Irdorath_01_04"); //Ne, Junge, wenn ich mal abtreten will, dann bestimmt nicht mit einem Strick um den Hals und durch grenzenlose Dummheit ...
	AI_Output(hero, self, "Info_Mod_Greg_Irdorath_15_05"); //Schade ... Dann muss ich wohl einen anderen Kapitän finden, der mich zu dieser ominösen Insel führt ...
	AI_Output(self, hero, "Info_Mod_Greg_Irdorath_01_06"); //Was für 'ne Insel?
	AI_Output(hero, self, "Info_Mod_Greg_Irdorath_15_07"); //Die Insel, auf der die mächtigen Schergen des Magiers Xeres lauern.
	AI_Output(self, hero, "Info_Mod_Greg_Irdorath_01_08"); //(zu sich selbst) Tjo, vielleicht gibt’s da ja was abzugreifen. Arme Schlucker sind Magier bekanntlich nie ...
	AI_Output(self, hero, "Info_Mod_Greg_Irdorath_01_09"); //(wieder zum Helden) Nun, min Jung, ich selbst kann mich zwar nicht in der Stadt blicken lassen, aber vielleicht kannst du ja meinen besten Kämpfer Bones davon überzeugen, dass er mitkommt.
	AI_Output(self, hero, "Info_Mod_Greg_Irdorath_01_10"); //An mir soll es jedenfalls nicht scheitern.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Greg wird nicht in die Hafenstadt kommen, um das Schiff zu führen. Er stellte es mir jedoch frei Bones mitzunehmen, wenn ich diesen davon überzeugen kann mitzukommen.");
};

INSTANCE Info_Mod_Greg_Schatzsuche (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Schatzsuche_Condition;
	information	= Info_Mod_Greg_Schatzsuche_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab die Schätze gefunden.";
};

FUNC INT Info_Mod_Greg_Schatzsuche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Hi))
	&& (Npc_HasItems(hero, ItMi_Sextant_Greg) > 0)
	&& (Npc_HasItems(hero, ItMi_JeweleryChest_Greg) > 0)
	&& (Npc_HasItems(hero, ItMi_DarkPearl_Greg) > 0)
	&& (Npc_HasItems(hero, ItMw_Piratensaebel_Greg) > 0)
	&& (Npc_HasItems(hero, ItMi_RuneBlank_Greg) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Schatzsuche_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_Schatzsuche_15_00"); //Ich hab die Schätze gefunden.
	
	Npc_RemoveInvItems	(hero, ItMi_Sextant_Greg, 1);
	Npc_RemoveInvItems	(hero, ItMi_JeweleryChest_Greg, 1);
	Npc_RemoveInvItems	(hero, ItMi_DarkPearl_Greg, 1);
	Npc_RemoveInvItems	(hero, ItMw_Piratensaebel_Greg, 1);
	Npc_RemoveInvItems	(hero, ItMi_RuneBlank_Greg, 1);

	AI_Output(self, hero, "Info_Mod_Greg_Schatzsuche_01_01"); //Tja, scheinst ja doch zu was gebrauchen zu sein!

	if (Mod_AnzahlNebengilden < MaxNebengilden)
	{
		AI_Output(self, hero, "Info_Mod_Greg_Schatzsuche_01_02"); //Wenn du willst, kannst du jetzt ein echter Seemann werden.
	}
	else 
	{
		AI_Output(self, hero, "Info_Mod_Greg_Schatzsuche_01_03"); //Leider hast du dich schon zu vielen Gemeinschaften angeschlossen.
	};

	B_Göttergefallen(2, 1);

	B_GivePlayerXP	(200);

	B_SetTopicStatus	(TOPIC_MOD_GREG_AUFNAHME, LOG_SUCCESS);
};

INSTANCE Info_Mod_Greg_Aufnahme (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Aufnahme_Condition;
	information	= Info_Mod_Greg_Aufnahme_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will Pirat werden.";
};

FUNC INT Info_Mod_Greg_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Schatzsuche))
	&& (Mod_AnzahlNebengilden < MaxNebengilden)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_Aufnahme_15_00"); //Ich will Pirat werden.
	AI_Output(self, hero, "Info_Mod_Greg_Aufnahme_01_01"); //Dann leg dir mal anständige Klamotten an und mach dich an die Arbeit.

	CreateInvItems	(self, ITAR_PIR_L_Addon, 1);
	B_GiveInvItems	(self, hero, ITAR_PIR_L_Addon, 1);

	AI_Output(hero, self, "Info_Mod_Greg_Aufnahme_15_02"); //Was soll ich tun?
	AI_Output(self, hero, "Info_Mod_Greg_Aufnahme_01_03"); //Such dir zuerst mal 'nen Entertrupp, dann sehen wir weiter.

	Mod_AnzahlNebengilden += 1;

	Piraten_Dabei = 1;
	
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_54);
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_69);

	B_GivePlayerXP	(400);

	B_Göttergefallen(2, 2);

	AI_Output(hero, self, "Info_Mod_Greg_Aufnahme_15_05"); //Aye, aye Käptn.

	Log_CreateTopic	(TOPIC_MOD_PIRATEN_ENTERTRUPP, LOG_MISSION);
	Log_CreateTopic	(TOPIC_MOD_NEBENGILDEN, LOG_NOTE);
	B_SetTopicStatus	(TOPIC_MOD_PIRATEN_ENTERTRUPP, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_NEBENGILDEN, TOPIC_MOD_PIRATEN_ENTERTRUPP, "Ich bin jetzt ein richtiger Pirat.", "Greg meint ich solle mich zuerst einem Entertrupp anschließen.");
};

INSTANCE Info_Mod_Greg_WasJetzt (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_WasJetzt_Condition;
	information	= Info_Mod_Greg_WasJetzt_Info;
	permanent	= 1;
	important	= 0;
	description	= "Was soll ich jetzt machen?";
};

FUNC INT Info_Mod_Greg_WasJetzt_Condition()
{
	if (Mod_InEntertrupp == 1)
	&& (Kapitel == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_WasJetzt_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_WasJetzt_15_00"); //Was soll ich jetzt machen?
	AI_Output(self, hero, "Info_Mod_Greg_WasJetzt_01_01"); //Momentan hab ich nichts für dich zu tun.
	AI_Output(self, hero, "Info_Mod_Greg_WasJetzt_01_02"); //Du hast sicher noch anderes zu erledigen.
	AI_Output(hero, self, "Info_Mod_Greg_WasJetzt_15_03"); //Das kannst du laut sagen. Also bis später.

	Npc_ExchangeRoutine	(Mod_940_PIR_Samuel_AW, "START");
};

INSTANCE Info_Mod_Greg_Karte (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Karte_Condition;
	information	= Info_Mod_Greg_Karte_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_Karte_Condition()
{
	if (Mod_InEntertrupp == 1)
	&& (Kapitel > 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Karte_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_Karte_01_00"); //Hey, gut das du kommst.
	AI_Output(self, hero, "Info_Mod_Greg_Karte_01_01"); //Diese Karte hier hat einer von Morgan's Jungs in einer angeschwemmten Flasche gefunden.
	AI_Output(self, hero, "Info_Mod_Greg_Karte_01_02"); //Dazu schreibt ein Schiffsbrüchiger, er sei auf einer Insel gestrandet, wo Zombies ihr Unwesen trieben und offenbar einen riesigen Schatz bewachten.
	AI_Output(self, hero, "Info_Mod_Greg_Karte_01_03"); //Ich denke, wir sollten der Sache nachgehen. Sitzen eh schon zu lange hier rum.
	AI_Output(self, hero, "Info_Mod_Greg_Karte_01_04"); //Du wirst den Leuten bei den Vorbereitungen helfen. Frag die Männer.
	AI_Output(hero, self, "Info_Mod_Greg_Karte_15_05"); //Aye, aye Käpt'n.

	B_StartOtherRoutine	(Mod_940_PIR_Samuel_AW, "START");

	Log_CreateTopic	(TOPIC_MOD_PIRATEN_SCHATZSUCHE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PIRATEN_SCHATZSUCHE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PIRATEN_SCHATZSUCHE, "Einer aus Morgans Entertrupp hat eine Karte gefunden. Ich soll nun im Lager helfen alles für die Schatzsuche vorzubereiten.");
};

INSTANCE Info_Mod_Greg_Aufgabe (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Aufgabe_Condition;
	information	= Info_Mod_Greg_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du was zu tun für mich?";
};

FUNC INT Info_Mod_Greg_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Karte))
	&& (Mod_VorbereitungenFertig == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_Aufgabe_15_00"); //Hast du was zu tun für mich?
	AI_Output(self, hero, "Info_Mod_Greg_Aufgabe_01_01"); //Nun, du könntest meinen alten Piratensäbel, den du mir bei deiner Aufnahmeprüfung gebracht hast, zu einem Schmied bringen und reparieren lassen.

	B_GiveInvItems	(self, hero, ItMw_Piratensaebel_Greg, 1);

	AI_Output(self, hero, "Info_Mod_Greg_Aufgabe_01_02"); //Mit dem alten, verrosteten Ding seh ich ja wohl richtig dämlich aus. Also beeil dich!
	AI_Output(hero, self, "Info_Mod_Greg_Aufgabe_15_03"); //Aye, aye Käptn.

	Log_CreateTopic	(TOPIC_MOD_GREG_ROST, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GREG_ROST, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GREG_ROST, "Ich soll Greg's alten Piratensäbel bei einem Schmied reparieren lassen.");
};

INSTANCE Info_Mod_Greg_Saebel (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Saebel_Condition;
	information	= Info_Mod_Greg_Saebel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bin zurück und hab dir was mitgebracht.";
};

FUNC INT Info_Mod_Greg_Saebel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Piraten))
	&& (Npc_HasItems(hero, ItMw_BennetGreg) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Saebel_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_Saebel_15_00"); //Bin zurück und hab dir was mitgebracht.
	AI_Output(self, hero, "Info_Mod_Greg_Saebel_01_01"); //Meinen aufgepeppten Säbel?
	AI_Output(hero, self, "Info_Mod_Greg_Saebel_15_02"); //Nein, was Besseres. Der Schmied Bennet möchte deinen Säbel behalten.
	AI_Output(self, hero, "Info_Mod_Greg_Saebel_01_03"); //Beim Klabautermann! Ein Erbstück! Von meinem Grossvater selbst!
	AI_Output(self, hero, "Info_Mod_Greg_Saebel_01_04"); //Man nannte ihn den Freibeuter der Meere ...
	AI_Output(hero, self, "Info_Mod_Greg_Saebel_15_05"); //Der Schmied hat mir dafür dieses Schwert mitgegeben.
	AI_Output(self, hero, "Info_Mod_Greg_Saebel_01_06"); //Dieser Säbel hat schon gallonenweise Blut getrunken!
	AI_Output(self, hero, "Info_Mod_Greg_Saebel_01_07"); //Mein Ahn würde sich im Gra ... im Meer umdrehen!
	AI_Output(hero, self, "Info_Mod_Greg_Saebel_15_08"); //Hier. Schau doch erst mal.
	AI_Output(self, hero, "Info_Mod_Greg_Saebel_01_09"); //Die Seelen aller gefallenen Piraten würden mir nachstellen.
	AI_Output(self, hero, "Info_Mod_Greg_Saebel_01_10"); //Hm ... Zeig mal her.

	B_GiveInvItems	(hero, self, ItMw_BennetGreg, 1);

	AI_Output(self, hero, "Info_Mod_Greg_Saebel_01_11"); //Was soll das denn sein?

	AI_UnequipWeapons	(self);

	EquipWeapon	(self, ItMw_BennetGreg);

	AI_ReadyMeleeWeapon	(self);
	AI_PlayAni	(self, "T_1HSINSPECT");
	AI_RemoveWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Greg_Saebel_01_12"); //Wieso ist das schwarz angemalt? Au! Das ist aber scharf.
	AI_Output(hero, self, "Info_Mod_Greg_Saebel_15_13"); //Drei mal schärfer als jede Klinge und doppelt so stabil. Ganz neues Material, sagt Bennet.
	AI_Output(self, hero, "Info_Mod_Greg_Saebel_01_14"); //Das muss ich selber sehen. Ich gehe mal zu Bones die Klinge testen.
	AI_Output(self, hero, "Info_Mod_Greg_Saebel_01_15"); //Du fragst Skip, ob die Vorräte verladen sind.
	AI_Output(hero, self, "Info_Mod_Greg_Saebel_15_16"); //Aye, Sir.

	B_SetTopicStatus	(TOPIC_MOD_GREG_ROST, LOG_SUCCESS);

	Mod_PiratenVorbereitungen += 1;

	B_GivePlayerXP	(200);

	B_Göttergefallen(2, 1);

	B_LogEntry	(TOPIC_MOD_PIRATEN_SCHATZSUCHE, "Jetzt soll ich mich bei Skip erkundigen, ob alles an Bord ist.");

	B_StartOtherRoutine	(self, "TRAINING");
};

INSTANCE Info_Mod_Greg_Bill (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Bill_Condition;
	information	= Info_Mod_Greg_Bill_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bill hat versucht die Schatzsuche zu sabotieren.";
};

FUNC INT Info_Mod_Greg_Bill_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bill_Rezept))
	&& (Mod_BillsVerbrechenPetzen == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Bill_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_Bill_15_00"); //Bill hat versucht die Schatzsuche zu sabotieren.
	AI_Output(self, hero, "Info_Mod_Greg_Bill_01_01"); //Wie kommst du darauf?
	AI_Output(hero, self, "Info_Mod_Greg_Bill_15_02"); //Auf diesem Zettel steht es. Ich hab den Zettel von einem Alchemisten aus Khorinis.

	B_GiveInvItems	(hero, self, Mod_BillsRumRezept, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Greg_Bill_01_03"); //Tatsächlich. Na warte, der kann was erleben. Gut gemacht, min jung!

	B_GivePlayerXP	(200);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Greg_Vorbereitungen (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Vorbereitungen_Condition;
	information	= Info_Mod_Greg_Vorbereitungen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kann's losgehen?";
};

FUNC INT Info_Mod_Greg_Vorbereitungen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Karte))
	&& (Mod_VorbereitungenFertig == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Vorbereitungen_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_Vorbereitungen_15_00"); //Kann's losgehen?

	if (Mod_PiratenVorbereitungen > 5)
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Josephina_Hi))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Greg_AJAlive4))
		{
			AI_Output(self, hero, "Info_Mod_Greg_Vorbereitungen_01_03"); //Nein, jetzt ist nicht der beste Zeitpunkt dafür.
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Greg_Vorbereitungen_01_01"); //Ja, die Vorbereitungen sind getroffen. Es kann losgehen.
	
			Mod_VorbereitungenFertig = 1;

			B_LogEntry	(TOPIC_MOD_PIRATEN_SCHATZSUCHE, "Die Vorbereitungen sind getroffen und die Schatzsuche kann losgehen.");

			B_Göttergefallen(2, 1);
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Greg_Vorbereitungen_01_02"); //Noch sind nicht genug Vorbereitungen getroffen werden, du musst noch ein wenig helfen.
	};
};

INSTANCE Info_Mod_Greg_GehtsLos (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_GehtsLos_Condition;
	information	= Info_Mod_Greg_GehtsLos_Info;
	permanent	= 1;
	important	= 0;
	description	= "Können wir aufbrechen?";
};

FUNC INT Info_Mod_Greg_GehtsLos_Condition()
{
	if (Mod_VorbereitungenFertig == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_GehtsLos_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_GehtsLos_15_00"); //Können wir aufbrechen? Bis auf die Mannschaft ist alles an Bord.
	AI_Output(self, hero, "Info_Mod_Greg_GehtsLos_01_01"); //Jo, soweit ist alles erledigt. Stell sicher dass du nichts mehr von hier brauchst, sobald wir aufgebrochen sind werden wir nicht mehr so schnell zurückkommen.

	Info_ClearChoices	(Info_Mod_Greg_GehtsLos);

	Info_AddChoice	(Info_Mod_Greg_GehtsLos, "Ich muss noch was erledigen.", Info_Mod_Greg_GehtsLos_Nein);
	Info_AddChoice	(Info_Mod_Greg_GehtsLos, "Ich bin bereit.", Info_Mod_Greg_GehtsLos_Ja);
};

FUNC VOID Info_Mod_Greg_GehtsLos_Nein ()
{
	AI_Output(hero, self, "Info_Mod_Greg_GehtsLos_Nein_15_00"); //Ich muss noch was erledigen.
	AI_Output(self, hero, "Info_Mod_Greg_GehtsLos_Nein_01_01"); //Gut, komm sobald du bereit bist.

	Info_ClearChoices	(Info_Mod_Greg_GehtsLos);
};

FUNC VOID Info_Mod_Greg_GehtsLos_Ja ()
{
	AI_Output(hero, self, "Info_Mod_Greg_GehtsLos_Ja_15_00"); //Ich bin bereit.
	AI_Output(self, hero, "Info_Mod_Greg_GehtsLos_Ja_01_01"); //Also los gehts.

	Mod_VorbereitungenFertig = 2;

	Info_ClearChoices	(Info_Mod_Greg_GehtsLos);

	Info_AddChoice	(Info_Mod_Greg_GehtsLos, "Los!", Info_Mod_Greg_GehtsLos_Los);
};

FUNC VOID Info_Mod_Greg_GehtsLos_Los ()
{
	Info_ClearChoices	(Info_Mod_Greg_GehtsLos);
	
	AI_StopProcessInfos	(self);

	Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

	B_StartOtherRoutine	(self, "PLAUDERN");
};

INSTANCE Info_Mod_Greg_Kompass (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Kompass_Condition;
	information	= Info_Mod_Greg_Kompass_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier ist der Kompass.";
};

FUNC INT Info_Mod_Greg_Kompass_Condition()
{
	if (Mod_VorbereitungenFertig == 4)
	&& (Npc_HasItems(hero, ItMi_Kompass) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Kompass_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_Kompass_15_00"); //Hier ist der Kompass.

	B_GiveInvItems	(hero, self, ItMi_Kompass, 1);

	AI_Output(self, hero, "Info_Mod_Greg_Kompass_01_01"); //Gut. Aber ein Problem haben wir noch.
	AI_Output(hero, self, "Info_Mod_Greg_Kompass_15_02"); //(resignierend) Und das wäre?
	AI_Output(self, hero, "Info_Mod_Greg_Kompass_01_03"); //Spürst du auch den leisesten Windhauch?
	AI_Output(hero, self, "Info_Mod_Greg_Kompass_15_04"); //Eigentlich nicht.
	AI_Output(self, hero, "Info_Mod_Greg_Kompass_01_05"); //Und haben wir eine Galeere, wo Rudersklaven das Schiff vorwärts treiben.
	AI_Output(hero, self, "Info_Mod_Greg_Kompass_15_06"); //Eigentlich auch nicht.
	AI_Output(self, hero, "Info_Mod_Greg_Kompass_01_07"); //Was brauchen wir also noch?
	AI_Output(hero, self, "Info_Mod_Greg_Kompass_15_08"); //Die steife Brise aus Südwest?
	AI_Output(self, hero, "Info_Mod_Greg_Kompass_01_09"); //Genau! Solang die nicht weht, können wir nicht auslaufen.
	AI_Output(hero, self, "Info_Mod_Greg_Kompass_15_10"); //Das heißt?
	AI_Output(self, hero, "Info_Mod_Greg_Kompass_01_11"); //Du hast frei. Komm zurück, wenn's richtig windet.
	AI_Output(hero, self, "Info_Mod_Greg_Kompass_15_12"); //Wenn du meinst. Bis dann.

	//Mod_VorbereitungenFertig = 5;

	B_SetTopicStatus	(TOPIC_MOD_GREG_KOMPASS, LOG_SUCCESS);
	B_LogEntry	(TOPIC_MOD_PIRATEN_SCHATZSUCHE, "Leider herrscht gerade eine Flaute, so dass wir noch nicht zu unserer Schatzsuche aufbrechen können. Ich soll später wiederkommen.");
};

INSTANCE Info_Mod_Greg_Schatzaufteilung (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Schatzaufteilung_Condition;
	information	= Info_Mod_Greg_Schatzaufteilung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_Schatzaufteilung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Schatzaufteilung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Schatzaufteilung_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_Schatzaufteilung_01_00"); //Tatsächlich, du lebst noch! Ich hätte nicht gedacht dass jemand einen Schlag mit einer solchen Axt überleben kann!
	AI_Output(hero, self, "Info_Mod_Greg_Schatzaufteilung_15_01"); //Ich hatte wohl Glück. Ich kann mich nur an nichts mehr erinnern.
	AI_Output(self, hero, "Info_Mod_Greg_Schatzaufteilung_01_02"); //Jo! Während der Überfahrt wurden wir von einer orkischen Galeere überfallen. Sie haben dich heimlich ausgeschalten, als du geschlafen hast.
	AI_Output(self, hero, "Info_Mod_Greg_Schatzaufteilung_01_03"); //War ein kräftiger Schlag, denn er war so laut, dass wir dadurch bemerkt haben, dass diese Biester unser Schiff geentert haben.
	AI_Output(self, hero, "Info_Mod_Greg_Schatzaufteilung_01_04"); //Danach haben wir sie zurückgeschlagen. Du jedoch warst bis vor kurzem bewusstlos.
	AI_Output(hero, self, "Info_Mod_Greg_Schatzaufteilung_15_05"); //Was ist mit dem Schatz?
	AI_Output(self, hero, "Info_Mod_Greg_Schatzaufteilung_01_06"); //Was soll damit sein? Niemand hat ihn angerührt. Obwohl ich es erlaubt habe! Alle wollten sie auf dich warten.
	AI_Output(self, hero, "Info_Mod_Greg_Schatzaufteilung_01_07"); //Damit darfst du dir deinen Teil aussuchen!

	Info_ClearChoices	(Info_Mod_Greg_Schatzaufteilung);

	Info_AddChoice	(Info_Mod_Greg_Schatzaufteilung, "Trank der Ausgewogenheit", Info_Mod_Greg_Schatzaufteilung_Trank);
	Info_AddChoice	(Info_Mod_Greg_Schatzaufteilung, "10.000 Goldmünzen", Info_Mod_Greg_Schatzaufteilung_Gold);
};

FUNC VOID Info_Mod_Greg_Schatzaufteilung_Trank ()
{
	AI_Output(hero, self, "Info_Mod_Greg_Schatzaufteilung_Trank_15_00"); //Ich nehme den Trank.
	AI_Output(self, hero, "Info_Mod_Greg_Schatzaufteilung_Trank_01_01"); //Bestimmt eine gute Wahl. Wir wissen nicht was er bewirkt.
	AI_Output(hero, self, "Info_Mod_Greg_Schatzaufteilung_Trank_15_02"); //Wo habt ihr ihn denn überhaupt her?
	AI_Output(self, hero, "Info_Mod_Greg_Schatzaufteilung_Trank_01_03"); //Er lag im Schiffswrack. Während du die Insel erkundet hast, hat Skip das Schiffswrack untersucht.
	AI_Output(self, hero, "Info_Mod_Greg_Schatzaufteilung_Trank_01_04"); //Da ist er über den Trank gestolpert und hat ihn mitgebracht.

	B_GiveInvItems	(self, hero, ItPo_Piratentrank, 1);

	Info_ClearChoices	(Info_Mod_Greg_Schatzaufteilung);
};

FUNC VOID Info_Mod_Greg_Schatzaufteilung_Gold ()
{
	AI_Output(hero, self, "Info_Mod_Greg_Schatzaufteilung_Gold_15_00"); //Ich nehm das Gold.
	AI_Output(self, hero, "Info_Mod_Greg_Schatzaufteilung_Gold_01_01"); //Gut, hier ist dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 10000);

	Info_ClearChoices	(Info_Mod_Greg_Schatzaufteilung);
};

INSTANCE Info_Mod_Greg_Befreiung (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Befreiung_Condition;
	information	= Info_Mod_Greg_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich muss mit dir reden.";
};

FUNC INT Info_Mod_Greg_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_AW_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_Befreiung_15_00"); //Ich muss mit dir reden.
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung_01_01"); //(wütend) Was willst DU denn von mir. Siehst du nicht das ich ungestört bleiben will.
	AI_Output(hero, self, "Info_Mod_Greg_Befreiung_15_02"); //Das ist jetzt verdammt noch mal völlig unwichtig!
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung_01_03"); //(erbost) Was fällt dir ein, du Lümmel!
	AI_Output(hero, self, "Info_Mod_Greg_Befreiung_15_04"); //Wichtiger ist jetzt erstmal die Garde Innos' aufzuhalten, bevor hier alles den Bach runter geht!
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung_01_05"); //(seufzt) Na gut. Was gibt's?
	AI_Output(hero, self, "Info_Mod_Greg_Befreiung_15_06"); //Myxir erzählte mir, dass du Pläne hast, die Besagen, wie wir Jharkendar von all dem Übel befreien können.
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung_01_07"); //So, hat er das? Na dann will ich dir vorher was sagen. Bevor wir überhaupt daran denken können irgendwas zu unternehmen, müssen wir erstmal zusehen, dass alles wieder ins Lot kommt!
	AI_Output(hero, self, "Info_Mod_Greg_Befreiung_15_08"); //Was meinst du damit?
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung_01_09"); //(sauer) Na sieh dich doch mal um. Alles Mögliche ist passiert, seit wir von den Zombies angegriffen wurden. Wir müssen erstmal Vorbereitungen treffen!
};

INSTANCE Info_Mod_Greg_Befreiung2 (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Befreiung2_Condition;
	information	= Info_Mod_Greg_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was kann ich tun?";
};

FUNC INT Info_Mod_Greg_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Befreiung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_Befreiung2_15_00"); //Was kann ich tun?
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung2_01_01"); //Du sollst mal zu allen meinen Jungs gehen und zusehen, ob du ihnen bei ihren Problemen helfen kannst, da wir sonst nichts mehr zu melden haben.
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung2_01_02"); //Hilf mindestens acht von ihnen.
	AI_Output(hero, self, "Info_Mod_Greg_Befreiung2_15_03"); //Was springt für mich dabei raus?
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung2_01_04"); //(aufgebracht) Das gibt's doch nicht! Du willst Bezahlung, weil du uns hilfst?
	AI_Output(hero, self, "Info_Mod_Greg_Befreiung2_15_05"); //(seufzt) Na, dann werde ich ...
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung2_01_06"); //(hastig) Ok, ok! Du bekommst 500 Goldmünzen, wenn du das getan hast. Einverstanden?
	AI_Output(hero, self, "Info_Mod_Greg_Befreiung2_15_07"); //Ok.
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung2_01_08"); //Dann mach dich an die Arbeit!

	Log_CreateTopic	(TOPIC_MOD_BEL_PIRATENLAGER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRATENLAGER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_PIRATENLAGER, "Bevor die Befreiungsaktion der Piraten starten kann, muss das Lager wieder auf Vordermann gebracht werden. Greg will, dass ich mindestens acht von seinen Leuten helfe.");
};

INSTANCE Info_Mod_Greg_Befreiung3 (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Befreiung3_Condition;
	information	= Info_Mod_Greg_Befreiung3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe den Befehl ausgeführt und das Lager wieder auf Trab gebracht.";
};

FUNC INT Info_Mod_Greg_Befreiung3_Condition()
{
	if (Mod_Piratenbefreiung == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Befreiung3_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_Befreiung3_15_00"); //Ich habe den Befehl ausgeführt und das Lager wieder auf Trab gebracht.
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung3_01_01"); //Sehr gut, Junge. Dann können wir vielleicht doch noch irgendwann einen Ausbruch wagen.
	AI_Output(hero, self, "Info_Mod_Greg_Befreiung3_15_02"); //Was ist mit meinem Gold?
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung3_01_03"); //Ohh, ja ... na gut, hier deine 500 Goldmünzen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Greg_Befreiung3_01_04"); //(zu sich selbst im Stillen, mürrisch) Ach, ich hätte ihm weniger anbieten sollen.
	AI_Output(hero, self, "Info_Mod_Greg_Befreiung3_15_05"); //Und wie gehen wir nun vor? Die geschlossenen Palisaden öffnen und den Eindringlingen ordentlich in den Hintern treten?
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung3_01_06"); //Nu, ähh, ne, mei Jung, so einfach wird das wohl kaum werden.
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung3_01_07"); //Die Kerle, mit denen wir es hier zu tun haben, sind von einem ganz üblen Schlag.
	AI_Output(hero, self, "Info_Mod_Greg_Befreiung3_15_08"); //Was meinst du damit?
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung3_01_09"); //Nu, ich meine damit die drei untoten Hohepriester vor der Palisade.
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung3_01_10"); //Die Bastarde stehen um irgend so ein magisches Ding herum, das sie schützt und ihnen unglaubliche magische Macht verleiht.
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung3_01_11"); //Der Schwarzmagier, der dich hierher brachte, versuchte mittlerweile mehrmals sich wegzuteleportieren, ist aber bei jedem Versuch gescheitert.
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung3_01_12"); //Er hat zuletzt sogar einen untoten Diener loszuschicken, um Unterstützung anzufordern.
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung3_01_13"); //Die drei Mistkerle hatten sich aber im Nu zu ihm hinteleportiert und ihn alle gemacht.
	AI_Output(hero, self, "Info_Mod_Greg_Befreiung3_15_14"); //Und was können wir dann tun?
	AI_Output(self, hero, "Info_Mod_Greg_Befreiung3_01_15"); //Ich weiß es noch nicht. Es müsste eine Möglichkeit geben die drei aus der Nähe diese magischen Dings zu bekommen. Eine Ablenkung ...

	AI_Teleport	(Mod_939_PIR_Owen_AW,	"WP_BLA_PIR_01");
	B_StartOtherRoutine	(Mod_939_PIR_Owen_AW, "GREG");

	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRATENLAGER, LOG_SUCCESS);
	B_LogEntry	(TOPIC_MOD_BEL_BEFREIUNG, "Vor dem Lager befinden sich drei untote Hohepriester um ein magisches Artefakt, das sie schützt und ihnen große Macht verleiht. Sie können jeden Flüchtenden mit Teleportation rasch einholen und  verhindern zudem die Nutzung von Teleportmagie im Lager.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "PLAUDERN");
};

INSTANCE Info_Mod_Greg_ArtefaktAttacke (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_ArtefaktAttacke_Condition;
	information	= Info_Mod_Greg_ArtefaktAttacke_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_ArtefaktAttacke_Condition()
{
	if (Mod_BEL_GregOwen == 2)
	&& (Npc_GetDistToWP(self, "ADW_PIRATECAMP_WAY_02") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_ArtefaktAttacke_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_ArtefaktAttacke_01_00"); //Los Männer, das ist der richtige Augenblick.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_1079_PIR_PIRAT_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_1078_PIR_PIRAT_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_1077_PIR_PIRAT_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_963_PIR_Malcom_NW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_941_PIR_Angus_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_942_PIR_Hank_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_939_PIR_Owen_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_940_PIR_Samuel_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_936_PIR_Matt_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_938_PIR_Morgan_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_1080_PIR_PIRAT_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_935_PIR_Malcom_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_933_PIR_Garett_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_934_PIR_Henry_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_932_PIR_Francis_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_930_PIR_Bones_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_931_PIR_Brandon_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_775_PIR_Skip_AW, "ARTEFAKT");
	B_StartOtherRoutine	(Mod_929_PIR_Bill_AW, "ARTEFAKT");
};

INSTANCE Info_Mod_Greg_ArtefaktTot (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_ArtefaktTot_Condition;
	information	= Info_Mod_Greg_ArtefaktTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_ArtefaktTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_ArtefaktAttacke))
	&& (Npc_GetDistToWP(self, "ADW_PIRATECAMP_WAY_06") < 1000)
	&& (Npc_IsDead(Mod_7300_Artefakt_AW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_ArtefaktTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_ArtefaktTot_01_00"); //So, das wäre erledigt. Den untoten Bastarden hätten wir damit einen empfindlichen Schlag versetzt.
	AI_Output(hero, self, "Info_Mod_Greg_ArtefaktTot_15_01"); //Ja, aber noch ist die Bedrohung nicht gebannt. Wir müssen unbedingt die Orks im Canyon erledigen, um ...
	AI_Output(self, hero, "Info_Mod_Greg_ArtefaktTot_01_02"); //... und während dessen das Lager unbeschützt zurücklassen? Ne, wir halten hier erst mal hübsch die Stellung und warten ab, was sich weiter entwickelt.
	AI_Output(self, hero, "Info_Mod_Greg_ArtefaktTot_01_03"); //Außerdem müssen wir so, oder so abwarten, ob nicht Owen zurückkommt. Einen guten Mann haben wir bereits verloren.
	AI_Output(self, hero, "Info_Mod_Greg_ArtefaktTot_01_04"); //Solange die Möglichkeit besteht, dass er noch munter ist, werden wir hier auf ihn warten.
	AI_Output(hero, self, "Info_Mod_Greg_ArtefaktTot_15_05"); //Aber ...
	AI_Output(self, hero, "Info_Mod_Greg_ArtefaktTot_01_06"); //Ne, min Jung, wenn du Lust auf weitere Sperenzchen hast, musst du das schon alleine durchziehen. Man sieht sich.

	B_SetTopicStatus	(TOPIC_MOD_BEL_BEFREIUNG, LOG_SUCCESS);

	B_LogEntry	(TOPIC_MOD_BEL_INNOSSCHWERT, "Die Belagerer sind vernichtet. Nun kann ich zu der Bibliothek im Canyon, um nach Hinweisen auf das Schwert zu suchen.");
	B_LogEntry	(TOPIC_MOD_BEL_INNOSSCHWERT, "Die Piraten lassen sich leider nicht dazu motivieren, mitzukommen. Muss ich mir mal wieder den Weg alleine durchschlagen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_1079_PIR_PIRAT_AW, "START");
	B_StartOtherRoutine	(Mod_1078_PIR_PIRAT_AW, "START");
	B_StartOtherRoutine	(Mod_1077_PIR_PIRAT_AW, "START");
	B_StartOtherRoutine	(Mod_963_PIR_Malcom_NW, "START");
	B_StartOtherRoutine	(Mod_941_PIR_Angus_AW, "START");
	B_StartOtherRoutine	(Mod_942_PIR_Hank_AW, "START");
	B_StartOtherRoutine	(Mod_939_PIR_Owen_AW, "START");
	B_StartOtherRoutine	(Mod_940_PIR_Samuel_AW, "START");
	B_StartOtherRoutine	(Mod_936_PIR_Matt_AW, "START");
	B_StartOtherRoutine	(Mod_938_PIR_Morgan_AW, "START");
	B_StartOtherRoutine	(Mod_1080_PIR_PIRAT_AW, "START");
	B_StartOtherRoutine	(Mod_935_PIR_Malcom_AW, "START");
	B_StartOtherRoutine	(Mod_933_PIR_Garett_AW, "START");
	B_StartOtherRoutine	(Mod_934_PIR_Henry_AW, "START");
	B_StartOtherRoutine	(Mod_932_PIR_Francis_AW, "START");
	B_StartOtherRoutine	(Mod_930_PIR_Bones_AW, "START");
	B_StartOtherRoutine	(Mod_931_PIR_Brandon_AW, "START");
	B_StartOtherRoutine	(Mod_775_PIR_Skip_AW, "START");
	B_StartOtherRoutine	(Mod_929_PIR_Bill_AW, "START");

	B_StartOtherRoutine	(GardeInnos_4099_Josephina, "BIB");

	CreateInvItems	(hero, ITKE_CANYONLIBRARY_HIERARCHY_BOOKS_ADDON, 1);
};

INSTANCE Info_Mod_Greg_Beerdigung (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Beerdigung_Condition;
	information	= Info_Mod_Greg_Beerdigung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_Beerdigung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Owen_Beerdigung))
	&& (Npc_HasItems(hero, ItMi_WaterOfLife) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Beerdigung_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_Beerdigung_01_00"); //(betrübt) Ahh, Junge, du bist auch wieder zurück. Kommst gerade richtig.
	AI_Output(self, hero, "Info_Mod_Greg_Beerdigung_01_01"); //Wir haben Alligator Jack mit einigen seiner Sachen beigesetzt und sprechen ein Seemannsgebet für ihn ... ach, tragisch, nach allem, was wir Jungs zusammen durch gestanden haben.
	AI_Output(self, hero, "Info_Mod_Greg_Beerdigung_01_02"); //Nun ja, Verluste an Mann und Material wird man als Pirat häufiger erfahren müssen ...
	AI_Output(self, hero, "Info_Mod_Greg_Beerdigung_01_03"); //Ich frage mich nur, was mit den Bastarden geschehen ist, die das alles verschuldet haben.
	AI_Output(hero, self, "Info_Mod_Greg_Beerdigung_15_04"); //Sie haben ihre gerechte Strafe erhalten und werden nie wieder Unfrieden stiften.
	AI_Output(self, hero, "Info_Mod_Greg_Beerdigung_01_05"); //(überrascht) Ja?! Sag bloß ... Und du hast bestimmt deinen Anteil daran. Das ist mir doch satte 1000 Goldmünzen wert, hier.

	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	AI_Output(self, hero, "Info_Mod_Greg_Beerdigung_01_06"); //Tjo, so erfährt sein Tod wenigestens Vergeltung ... auch, wenn er nicht rückgängig gemacht werden kann ...
	AI_Output(hero, self, "Info_Mod_Greg_Beerdigung_15_07"); //Hmm, da wäre ich mir gar nicht so sicher ...
	AI_Output(self, hero, "Info_Mod_Greg_Beerdigung_01_08"); //Wie?! Ich glaube wirklich nicht, dass das der richtige Zeitpunkt für Scherze ist.
	AI_Output(self, hero, "Info_Mod_Greg_Beerdigung_01_09"); //Und Untote können wir auch nicht im Lager brauchen, falls du das gemeint hast.
	AI_Output(hero, self, "Info_Mod_Greg_Beerdigung_15_10"); //Nein, schau doch ...

	B_SetTopicStatus	(TOPIC_MOD_BEL_INNOSSCHWERT, LOG_SUCCESS);

	Npc_RemoveInvItems	(hero, ItMi_WaterOfLife, 1);

	AI_GotoWP	(hero, "ADW_PIRATECAMP_TRAIN_01");
	AI_PlayAni	(hero, "T_PLUNDER");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Greg_AJAlive (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_AJAlive_Condition;
	information	= Info_Mod_Greg_AJAlive_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_AJAlive_Condition()
{
	if (Mod_BEL_AJ == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_AJAlive_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_AJAlive_01_00"); //Jo, potz tausend, da stich mich doch der Rochen ...

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Greg_AJAlive2 (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_AJAlive2_Condition;
	information	= Info_Mod_Greg_AJAlive2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_AJAlive2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AlligatorJack_Beerdigung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_AJAlive2_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_AJAlive2_01_00"); //Nu, nimm erst mal n ordentlichen Schluck Seemannsgrog. Heute Abend wird gezecht und gefeiert.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Greg_AJAlive3 (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_AJAlive3_Condition;
	information	= Info_Mod_Greg_AJAlive3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_AJAlive3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bones_Beerdigung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_AJAlive3_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_AJAlive3_01_00"); //Nu, ...

	AI_TurnToNpc	(self, Rabbit);

	B_GivePlayerXP	(2000);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Greg_AJAlive4 (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_AJAlive4_Condition;
	information	= Info_Mod_Greg_AJAlive4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_AJAlive4_Condition()
{
	if (Mod_BEL_AJ == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_AJAlive4_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_AJAlive4_01_00"); //Junge, du hast ungeheuer viel getan für unser Lager. Mir Gold kann ich das kaum aufwiegen.
	AI_Output(self, hero, "Info_Mod_Greg_AJAlive4_01_01"); //Daher sollst du mein bestes Stück bekommen: Blackbarts Piratenhut. Trage ihn mit stolz.

	B_ShowGivenThings	("Blackbarts Piratenhut erhalten");

	CreateInvItems	(hero, ItAr_Piratenhut, 1);

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Greg_AJAlive4_15_02"); //(zu sich selbst) Na toll, ein alter, zerlumpter Hut.

	B_GivePlayerXP	(2000);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Greg_Todesangst (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Todesangst_Condition;
	information	= Info_Mod_Greg_Todesangst_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_Todesangst_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Henry_Todesangst2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Todesangst_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_Todesangst_01_00"); //(brüllt) Was soll das? Kein Fremder ins Lager, hab ich gesagt.
	AI_Output(hero, self, "Info_Mod_Greg_Todesangst_15_01"); //Beruhig dich! Du kennst mich doch. Außerdem bewacht mich Jack.
	AI_Output(self, hero, "Info_Mod_Greg_Todesangst_01_02"); //Also gut. Du hast uns schon geholfen. Warum bist du hier?
	AI_Output(hero, self, "Info_Mod_Greg_Todesangst_15_03"); //Zuerst wüsste ich gern, was mir dir los ist.
	AI_Output(self, hero, "Info_Mod_Greg_Todesangst_01_04"); //Was mit mir los ist? Ich schwebe in Lebensgefahr! Das ist los!
	AI_Output(hero, self, "Info_Mod_Greg_Todesangst_15_05"); //Hast du dich vergiftet? Ich wüsste einen guten Heiler ...
	AI_Output(self, hero, "Info_Mod_Greg_Todesangst_01_06"); //Neulich kam ein seltsamer alter Mann hier vorbei.
	AI_Output(self, hero, "Info_Mod_Greg_Todesangst_01_07"); //Er kann in die Zukunft sehen, sagt er, und hat mir prozeitet, dass ich in Kürze meuchlings ermordet werde.
	AI_Output(hero, self, "Info_Mod_Greg_Todesangst_15_08"); //Ha ha ha. Man sagt ja, dass Seeleute abergläubisch sind. Klabautermann und so. Aber so was ... Übrigens heißt das prophezeit.
	AI_Output(self, hero, "Info_Mod_Greg_Todesangst_01_09"); //Ist mir grad egal. Jedenfalls glaub ich ihm. Traue schon meinen eigenen Leuten nicht mehr.
	AI_Output(hero, self, "Info_Mod_Greg_Todesangst_15_10"); //Das ist schlimm. Vielleicht solltest du in ein Kloster gehen, bis die Gefahr vorüber ist.
	AI_Output(self, hero, "Info_Mod_Greg_Todesangst_01_11"); //Hör bloß auf! Da hocken doch die größten Heuchler und Meuchler.
	AI_Output(hero, self, "Info_Mod_Greg_Todesangst_15_12"); //Schade. Ich wollte dir eigentlich das Geschäft deines Lebens vorschlagen.
	AI_Output(self, hero, "Info_Mod_Greg_Todesangst_01_13"); //(neugierig) Das da wäre? Nur interessehalber ...
	AI_Output(hero, self, "Info_Mod_Greg_Todesangst_15_14"); //Ich kenne eine Gruppe Leute, so 20 Mann, die wollen aufs Festland ...
	AI_Output(self, hero, "Info_Mod_Greg_Todesangst_01_15"); //Bist du von Sinnen? 20 Fremde in meiner Nähe! Da kann ich mich ja gleich ersäufen.
	AI_Output(hero, self, "Info_Mod_Greg_Todesangst_15_16"); //... wobei der Preis der Überfahrt keine Rolle spielt. Du könntest verlangen, was du willst.
	AI_Output(self, hero, "Info_Mod_Greg_Todesangst_01_17"); //Hört sich ja gut an. Aber nein, selbst wenn ich die Fahrt überlebe, da sind da noch die Schiffe der Königstreuen, die vor der Küste kreuzen und womöglich noch Orkschiffe. Nein. Völlig ausgeschlossen.
	AI_Output(hero, self, "Info_Mod_Greg_Todesangst_15_18"); //Schade. Dann geh ich mal Bericht erstatten. Pass auf deinen Rücken auf!
	AI_Output(self, hero, "Info_Mod_Greg_Todesangst_01_19"); //Wie meinst du das?
	AI_Output(hero, self, "Info_Mod_Greg_Todesangst_15_20"); //Nur so.

	B_GivePlayerXP	(300);

	B_StartOtherRoutine	(Mod_928_PIR_AlligatorJack_AW,	"START");

	B_SetTopicStatus	(TOPIC_MOD_ASS_TODESANGST, LOG_SUCCESS);

	B_LogEntry	(TOPIC_MOD_ASS_HEIMWEH, "Unglaublich! Der Kapitän glaubt doch tatsächlich den Sprüchen eines dahergelaufenen Lumpen. Wahrsager, dass ich nicht lache! Das kann eigentlich nur der Eremit vom Tal sein. Was der wohl bezweckt hat? Jedenfalls muss ich Bericht erstatten. Den Rat wird's nicht erfreuen ...");
};

INSTANCE Info_Mod_Greg_Sumpfmensch (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Sumpfmensch_Condition;
	information	= Info_Mod_Greg_Sumpfmensch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich wollte dich etwas wegen eines ehemaligen Piraten fragen.";
};

FUNC INT Info_Mod_Greg_Sumpfmensch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fortuno_Sumpfmensch2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Sumpfmensch_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_Sumpfmensch_15_00"); //Ich wollte dich etwas wegen eines ehemaligen Piraten fragen.
	AI_Output(self, hero, "Info_Mod_Greg_Sumpfmensch_01_01"); //Ehemaliger Pirat? Sowas gibt's doch garnicht! Einmal Pirat, immer Pirat, das ist die Devise!
	AI_Output(hero, self, "Info_Mod_Greg_Sumpfmensch_15_02"); //Es handelt sich dabei um Darrion.
	AI_Output(self, hero, "Info_Mod_Greg_Sumpfmensch_01_03"); //WAS?! Dieser Sohn einer räudigen Hündin? Sag bloß der alte Dreckskerl lebt noch?!
	AI_Output(hero, self, "Info_Mod_Greg_Sumpfmensch_15_04"); //Er ist mittlerweile einer Sumpfgemeinschaft beigetreten und hat dort bis vor kurzem ein ruhiges Leben geführt.
	AI_Output(self, hero, "Info_Mod_Greg_Sumpfmensch_01_05"); //Zur Ruhe gesetzt hat er sich also? Dass ich das noch erleben darf.
	AI_Output(hero, self, "Info_Mod_Greg_Sumpfmensch_15_06"); //So ruhig hatte er es in letzter Zeit nicht. Er hat sich vor kurzem mit einem Sumpfmonster angelegt und das ist nicht so gut für ihn ausgegangen. So schnell wird er wohl nicht wieder aufwachen.
	AI_Output(self, hero, "Info_Mod_Greg_Sumpfmensch_01_07"); //Was sagst du da? Ein Monster, das es mit dem alten Darrion aufnehmen kann? Geht da ein verdammter Drache in dem Sumpf um oder was?
	AI_Output(hero, self, "Info_Mod_Greg_Sumpfmensch_15_08"); //Was auch immer es ist, es ist gefährlich. Und ich glaube, Darrion weiß mehr über das Monster, als er sagen wollte. Kannst du dir einen Reim darauf machen?
	AI_Output(self, hero, "Info_Mod_Greg_Sumpfmensch_01_09"); //Tut mir Leid, min Jung, aber aus seinen Angelegenheiten hab' ich mich immer schön rausgehalten.
	AI_Output(self, hero, "Info_Mod_Greg_Sumpfmensch_01_10"); //Darrion und ich waren die beiden Entertruppführer unter unsrem vorherigen Captain. Als er mich zu seinem Nachfolger ernannte, hat Darrion uns nur noch sporadisch aufgesucht.
	AI_Output(self, hero, "Info_Mod_Greg_Sumpfmensch_01_11"); //Der hat die meiste Zeit beim alten Turm in der Nähe des Lagers verbracht. Ist nur hin und wieder Mal vorbeigekommen, um etwas zu handeln und hin und wieder die Frischlinge untern Tisch zu saufen!
	AI_Output(self, hero, "Info_Mod_Greg_Sumpfmensch_01_12"); //Sprich doch mal mit Skip, vielleicht hat der 'ne Info für dich.
	AI_Output(hero, self, "Info_Mod_Greg_Sumpfmensch_15_13"); //Mach ich. Danke.
	AI_Output(self, hero, "Info_Mod_Greg_Sumpfmensch_01_14"); //Kein Ding, min Jung!

	B_LogEntry	(TOPIC_MOD_SL_SUMPFMENSCH, "Greg hat erzählt, dass Darrion sich viel beim alten Turm in der Nähe des Piratenlagers aufgehalten hat. Skip hat vielleicht noch weitere Informationen für mich.");
};

INSTANCE Info_Mod_Greg_Steg (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Steg_Condition;
	information	= Info_Mod_Greg_Steg_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo führt denn der Steg da drüben hin?";
};

FUNC INT Info_Mod_Greg_Steg_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Aufnahme))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_Steg_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_Steg_15_00"); //Wo führt denn der Steg da drüben hin?
	AI_Output(self, hero, "Info_Mod_Greg_Steg_01_01"); //In eines unserer Ausweichlager. Falls ein übermächtiger Feind von See her angreift.
};

INSTANCE Info_Mod_Greg_Pickpocket (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_Pickpocket_Condition;
	information	= Info_Mod_Greg_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Greg_Pickpocket_Condition()
{
	C_Beklauen	(150, ItFo_Addon_Rum, 7);
};

FUNC VOID Info_Mod_Greg_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Greg_Pickpocket);

	Info_AddChoice	(Info_Mod_Greg_Pickpocket, DIALOG_BACK, Info_Mod_Greg_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Greg_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Greg_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Greg_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Greg_Pickpocket);
};

FUNC VOID Info_Mod_Greg_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Greg_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Greg_Pickpocket);

		Info_AddChoice	(Info_Mod_Greg_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Greg_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Greg_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Greg_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Greg_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Greg_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Greg_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Greg_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Greg_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Greg_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Greg_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Greg_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Greg_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Greg_EXIT (C_INFO)
{
	npc		= Mod_764_PIR_Greg_AW;
	nr		= 1;
	condition	= Info_Mod_Greg_EXIT_Condition;
	information	= Info_Mod_Greg_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Greg_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Greg_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};