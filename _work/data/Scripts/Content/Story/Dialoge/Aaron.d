INSTANCE Info_Mod_Aaron_Hi (C_INFO)
{
	npc		= Mod_1771_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_Hi_Condition;
	information	= Info_Mod_Aaron_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na, felißig am Beten?";
};

FUNC INT Info_Mod_Aaron_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nagon_HabFoki))
	&& (Wld_IsTime(22,00,05,00))
	&& (Npc_HasItems(hero, ItWr_PatherionNachricht1) == 1)
	&& (Npc_HasItems(hero, ItWr_PatherionNachricht2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aaron_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Aaron_Hi_15_00"); //Na, fleißig am Beten?
	AI_Output(self, hero, "Info_Mod_Aaron_Hi_11_01"); //Verfluchter Beliar-Anhänger! Lange habe ich versucht dich zu töten, und jetzt kommst du zu mir in die Kirche?
	AI_Output(self, hero, "Info_Mod_Aaron_Hi_11_02"); //Ich werde diesen heiligen Ort nicht mit deinem Blut entweihen!
	AI_Output(hero, self, "Info_Mod_Aaron_Hi_15_03"); //Du nennst mich Beliar-Anhänger? Wie kommst du darauf, dass ich Beliar angehöre?
	AI_Output(self, hero, "Info_Mod_Aaron_Hi_11_04"); //(überraschtes schweigen) ...
	AI_Output(hero, self, "Info_Mod_Aaron_Hi_15_05"); //Kann es sein, dass Tojan dir das gesagt hat?
	AI_Output(self, hero, "Info_Mod_Aaron_Hi_11_06"); //Woher weißt du das?
	AI_Output(hero, self, "Info_Mod_Aaron_Hi_15_07"); //Nun, sagen wir es so: Auch ich sollte jemanden töten. Und zwar in Tojans Auftrag.
	AI_Output(hero, self, "Info_Mod_Aaron_Hi_15_08"); //Und das bist du.
	AI_Output(self, hero, "Info_Mod_Aaron_Hi_11_09"); //(überrascht) Was?
	AI_Output(hero, self, "Info_Mod_Aaron_Hi_15_10"); //Tojan treibt ein falsches Spiel mit uns.
	AI_Output(self, hero, "Info_Mod_Aaron_Hi_11_11"); //Du versuchst nur mich durcheinander zu bringen, um mir dann dein Messer durch den Rücken rammen zu können!
	AI_Output(hero, self, "Info_Mod_Aaron_Hi_15_12"); //Glaubst du wirklich, ein Schwarzmagier würde den heiligsten aller Orte der Innoskirche betreten?
	AI_Output(self, hero, "Info_Mod_Aaron_Hi_11_13"); //HA! Ich wusste es. Du musst ein Schwarzmagier sein. Jeder unserer Brüder weiß, dass nicht das hier der heiligste Ort der Innoskriche ist. Es ist ...
	AI_Output(hero, self, "Info_Mod_Aaron_Hi_15_14"); //Die Kapelle auf der Anhöhe. Ich bin durch diese Kapelle gekommen.
	AI_Output(self, hero, "Info_Mod_Aaron_Hi_11_15"); //Du lügst doch!
	AI_Output(hero, self, "Info_Mod_Aaron_Hi_15_16"); //Hier. Ist das Beweis genug?

	Npc_RemoveInvItems	(hero, ItWr_PatherionNachricht1, 1);
	Npc_RemoveInvItems	(hero, ItWr_PatherionNachricht2, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Aaron_Hi_11_17"); //... mein Tagebuch? Du warst tatsächlich dort. Dann kannst du kein Beliar-Anhänger sein. Dann ... wurde das Kloster nicht infiltriert?
	AI_Output(hero, self, "Info_Mod_Aaron_Hi_15_18"); //Doch, ich fürchte schon. Aber von jemandem, den ich nicht verdächtigt hätte.
	AI_Output(self, hero, "Info_Mod_Aaron_Hi_11_19"); //Du meinst ...
	AI_Output(hero, self, "Info_Mod_Aaron_Hi_15_20"); //... Tojan.
	AI_Output(self, hero, "Info_Mod_Aaron_Hi_11_21"); //Du hast Recht. Es passt alles.

	B_Say	(hero, self, "$WASMACHENWIRJETZT");

	AI_Output(self, hero, "Info_Mod_Aaron_Hi_11_22"); //Wir werden ihm eine Falle stellen. Komm morgen Nacht auf den Marktplatz.
	AI_Output(self, hero, "Info_Mod_Aaron_Hi_11_23"); //Vorher solltest du allerdings noch zu Tojan gehen und ihn auf mich hinweisen.

	B_LogEntry	(TOPIC_MOD_FM_VERRAT, "Aaron ist unschuldig. Er wurde von Tojan beauftragt, mich zu töten. Es scheint ganz so, als wäre Tojan der eigentliche Verräter. Morgen Nacht treffe ich mich mit Aaron auf dem Marktplatz. Vorher soll ich noch zu Tojan und ihn auf Aaron aufmerksam machen.");

	AI_StopProcessInfos	(self);

	Mod_FM_AaronDay = Wld_GetDay();
};

INSTANCe Info_Mod_Aaron_Falle (C_INFO)
{
	npc		= Mod_1771_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_Falle_Condition;
	information	= Info_Mod_Aaron_Falle_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aaron_Falle_Condition()
{
	if (Wld_IsTime(22,00,05,00))
	&& (Mod_FM_Foki == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aaron_Falle_Info()
{
	AI_Output(self, hero, "Info_Mod_Aaron_Falle_11_00"); //Da bist du ja!

	B_Say	(hero, self, "$WASMACHENWIRJETZT");

	AI_Output(self, hero, "Info_Mod_Aaron_Falle_11_01"); //Wir werden aus Tojan herauskriegen, weswegen er hier im Kloster ist.
	AI_Output(hero, self, "Info_Mod_Aaron_Falle_15_02"); //Und wie willst du das anstellen?
	AI_Output(self, hero, "Info_Mod_Aaron_Falle_11_03"); //Mit einem Trick. Wir spielen ihm vor, dass du mich getötet hast.
	AI_Output(hero, self, "Info_Mod_Aaron_Falle_15_04"); //Und dann rufe ich ihn mit dem Amulett, das er mir gegeben hat. Könnte funktionieren.

	AI_StopProcessInfos	(self);

	Mod_FM_Foki = 5;

	B_LogEntry	(TOPIC_MOD_FM_VERRAT, "Ich muss nun das Amulett anlegen, um Tojan herbeizurufen.");
};

INSTANCe Info_Mod_Aaron_KillTojan (C_INFO)
{
	npc		= Mod_1771_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_KillTojan_Condition;
	information	= Info_Mod_Aaron_KillTojan_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aaron_KillTojan_Condition()
{
	if (Mod_FM_Foki == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aaron_KillTojan_Info()
{
	AI_Output(self, hero, "Info_Mod_Aaron_KillTojan_11_00"); //Geh zur Seite, ich werde ihn jetzt töten!

	AI_StopProcessInfos	(self);

	Mod_1746_KDF_Tojan_PAT.protection[PROT_FIRE] = 0;
	Mod_1746_KDF_Tojan_PAT.protection[PROT_MAGIC] = 0;
	Mod_1746_KDF_Tojan_PAT.attribute[ATR_HITPOINTS_MAX] = 50;
	Mod_1746_KDF_Tojan_PAT.attribute[ATR_HITPOINTS] = 50;

	B_Attack	(self, Mod_1746_KDF_Tojan_PAT, AR_GuildEnemy, 0);

	Mod_FM_Foki = 10;
};

INSTANCe Info_Mod_Aaron_TojanDead (C_INFO)
{
	npc		= Mod_1771_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_TojanDead_Condition;
	information	= Info_Mod_Aaron_TojanDead_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aaron_TojanDead_Condition()
{
	if (Mod_FM_Foki == 10)
	&& (Npc_IsDead(Mod_1746_KDF_Tojan_PAT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aaron_TojanDead_Info()
{
	AI_Output(self, hero, "Info_Mod_Aaron_TojanDead_11_00"); //Es stimmt ... Er war mein Sohn.
	AI_Output(hero, self, "Info_Mod_Aaron_TojanDead_15_01"); //Dann bist du Ragons Sohn?
	AI_Output(self, hero, "Info_Mod_Aaron_TojanDead_11_02"); //Ja ... Und mein Name ist nicht Aaron, sondern Garan.
	AI_Output(hero, self, "Info_Mod_Aaron_TojanDead_15_03"); //Und die Hexenkönigin?
	AI_Output(self, hero, "Info_Mod_Aaron_TojanDead_11_04"); //Ich kann mich nicht genau an sie erinnern ... Irgendetwas fehlt noch in meinem Gedächtnis ... Doch das ist jetzt unwichtig.
	AI_Output(self, hero, "Info_Mod_Aaron_TojanDead_11_05"); //Nun muss ich an meinen Platz in der Innoskirche zurückkehren. Ich werde mit meinen vier Brüdern die Barriere zerstören.
	AI_Output(self, hero, "Info_Mod_Aaron_TojanDead_11_06"); //Ich weiß nicht, wie ich dir jemals danken kann!

	AI_StopProcessInfos	(self);

	self.name = "Garan";

	B_StartOtherRoutine	(self, "BOSS");

	Mod_FM_Foki = 11;

	B_LogEntry	(TOPIC_MOD_FM_VERRAT, "Garan ... Er wird sich erst Mal zurückziehen. Ich sollte ihn später aufsuchen.");
};

INSTANCE Info_Mod_Aaron_Barriere (C_INFO)
{
	npc		= Mod_1771_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_Barriere_Condition;
	information	= Info_Mod_Aaron_Barriere_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aaron_Barriere_Condition()
{
	if (Wld_IsTime(05,00,22,00))
	&& (Mod_FM_Foki == 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aaron_Barriere_Info()
{
	AI_Output(self, hero, "Info_Mod_Aaron_Barriere_11_00"); //Ah, hallo, Bruder. Wie du siehst habe ich den Platz meines Vaters eingenommen.
	AI_Output(hero, self, "Info_Mod_Aaron_Barriere_15_01"); //Freut mich, das zu sehen.
	AI_Output(self, hero, "Info_Mod_Aaron_Barriere_11_02"); //Wir überlegen gerade einen Zauber, mit dem wir die Barriere zerstören können.
	AI_Output(self, hero, "Info_Mod_Aaron_Barriere_11_03"); //Wir sollten nicht länger als einen Tag dafür brauchen. Komm morgen um diese Zeit wieder.

	Mod_FM_Barriere = Wld_GetDay();

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_FM_VERRAT, "Garan und die anderen Magier überlegen nun, wie sie die Barriere vernichten können. Ich soll morgen wieder kommen.");
};

INSTANCE Info_Mod_Aaron_BarriereWeg (C_INFO)
{
	npc		= Mod_1771_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_BarriereWeg_Condition;
	information	= Info_Mod_Aaron_BarriereWeg_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aaron_BarriereWeg_Condition()
{
	if (Mod_FM_Barriere < Wld_GetDay())
	&& (Npc_KnowsInfo(hero, Info_Mod_Aaron_Barriere))
	&& (Wld_IsTime(05,00,22,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aaron_BarriereWeg_Info()
{
	AI_Output(self, hero, "Info_Mod_Aaron_BarriereWeg_11_00"); //Es ist vollbracht, die Barriere ist zerstört!
	AI_Output(hero, self, "Info_Mod_Aaron_BarriereWeg_15_01"); //Das sind gute Nachrichten.
	AI_Output(self, hero, "Info_Mod_Aaron_BarriereWeg_11_02"); //In der Tat, Bruder. Du kannst nun nach Khorinis zurückkehren. Nimm diese zwei Runen.

	CreateInvItems	(hero, ItRu_Teleport_Pat_01, 1);
	CreateInvItems	(hero, ItRu_Teleport_Pat_02, 1);

	AI_PrintScreen	("2 Runen erhalten", -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);

	AI_Output(self, hero, "Info_Mod_Aaron_BarriereWeg_11_03"); //Mit ihnen kannst du dich zur Kapelle und hier in die Kirche teleportieren.

	Wld_SendTrigger	("EVT_PAT_BARRIERE");

	B_StartOtherRoutine	(self, "ARBEIT");

	B_LogEntry	(TOPIC_MOD_FM_VERRAT, "Es ist vollbracht und die Barriere ist zerstört. Ich kann nun nach Khorinis zurückkehren.");
	B_SetTopicStatus	(TOPIC_MOD_FM_VERRAT, LOG_SUCCESS);
};

INSTANCE Info_Mod_Aaron_Back (C_INFO)
{
	npc		= Mod_1771_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_Back_Condition;
	information	= Info_Mod_Aaron_Back_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist denn hier los?";
};

FUNC INT Info_Mod_Aaron_Back_Condition()
{
	if (Mod_Enter_PAT_Second == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aaron_Back_Info()
{
	B_Say	(hero, self, "$WASISTDENNHIERLOS");

	AI_Output(self, hero, "Info_Mod_Aaron_Back_11_00"); //Nun, wie du vielleicht weißt, wurde der Rat der Götter einberufen. Das bedeutet, dass die Schwarzmagier uns nicht weiter belagern dürfen.
	AI_Output(hero, self, "Info_Mod_Aaron_Back_15_01"); //Und wieso sind sie hier im Kloster?
	AI_Output(self, hero, "Info_Mod_Aaron_Back_11_02"); //Nun, leider werden wir immer noch belagert, nur nicht mehr von den Schwarzmagiern.
	AI_Output(hero, self, "Info_Mod_Aaron_Back_15_03"); //Von wem dann?
	AI_Output(self, hero, "Info_Mod_Aaron_Back_11_04"); //Von den Hexen.
	AI_Output(hero, self, "Info_Mod_Aaron_Back_15_05"); //Was? Von Hexen? Du meinst also von der Mutter Tojans?
	AI_Output(self, hero, "Info_Mod_Aaron_Back_11_06"); //Es sieht so aus, ja.
	AI_Output(hero, self, "Info_Mod_Aaron_Back_15_07"); //Ja, aber das kann den Schwarzmagiern doch eigentlich egal sein, oder?
	AI_Output(self, hero, "Info_Mod_Aaron_Back_11_08"); //Nicht direkt. Die Hexen sind seit langer Zeit Verbündete der Schwarzmagier.
	AI_Output(self, hero, "Info_Mod_Aaron_Back_11_09"); //Das heißt, wenn uns die Hexen angreifen, wäre es nicht anders, als wenn uns die Schwarzmagier selbst angreifen würden.
	AI_Output(hero, self, "Info_Mod_Aaron_Back_15_10"); //Und das zwingt sie sozusagen uns zu helfen.
	AI_Output(self, hero, "Info_Mod_Aaron_Back_11_11"); //Genau. Eigentlich würden wir diese Hilfe nicht annehmen, aber die Hexen sind in einer Überzahl, die wir alleine nicht schaffen würden.
	AI_Output(hero, self, "Info_Mod_Aaron_Back_15_12"); //Ich verstehe. Also was hast du jetzt vor?
	AI_Output(self, hero, "Info_Mod_Aaron_Back_11_13"); //Nun, es trifft sich gut, dass du gerade kommst. Die Hexen haben die insgesamt fünf Lager der Schwarzmagier übernommen.
	AI_Output(self, hero, "Info_Mod_Aaron_Back_11_14"); //Und du wirst die Hexen dort angreifen.
	AI_Output(hero, self, "Info_Mod_Aaron_Back_15_15"); //Was? Die Hexen sind in einer so großen Überzahl, dass ihr die Hilfe von den Schwarzmagiern annehmen müsst, und ich soll alleine gegen sie ziehen?
	AI_Output(self, hero, "Info_Mod_Aaron_Back_11_16"); //Natürlich nicht alleine. Im Klosterhof wartet bereits eine Gruppe auf deine Befehle!
	AI_Output(self, hero, "Info_Mod_Aaron_Back_11_17"); //Und jetzt beeil dich. Je schneller du die Lager vernichtest, desto besser!

	Mod_FM_Hexencounter += 60;

	Wld_InsertNpc	(Mod_1855_PAL_Paladin_PAT, "WP_PAT_WEG_178");
	Wld_InsertNpc	(Mod_1856_PAL_Paladin_PAT, "WP_PAT_WEG_178");
	Wld_InsertNpc	(Mod_1857_KDF_Magier_PAT, "WP_PAT_WEG_178");
	Wld_InsertNpc	(Mod_7333_KDS_SchwarzerMagier_PAT, "WP_PAT_WEG_178");
	Wld_InsertNpc	(Mod_7332_SMK_SchwarzerKrieger_PAT, "WP_PAT_WEG_178");

	Log_CreateTopic	(TOPIC_MOD_FM_HEXEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FM_HEXEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FM_HEXEN, "Garan will, dass ich die Hexen töte, die sich in den Lagern der Schwarzmagier niedergelassen haben. Im Klosterhof wartet ein Trupp auf mich.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Aaron_Hexen (C_INFO)
{
	npc		= Mod_1771_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_Hexen_Condition;
	information	= Info_Mod_Aaron_Hexen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Lager sind erobert.";
};

FUNC INT Info_Mod_Aaron_Hexen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aaron_Back))
	&& (Mod_FM_Hexencounter == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aaron_Hexen_Info()
{
	AI_Output(hero, self, "Info_Mod_Aaron_Hexen_15_00"); //Die Lager sind erobert.
	AI_Output(self, hero, "Info_Mod_Aaron_Hexen_11_01"); //Das dürfte fürs Erste reichen. Doch jetzt müssen wir schnell handeln!

	B_Say	(hero, self, "$WASMEINSTDU");

	AI_Output(self, hero, "Info_Mod_Aaron_Hexen_11_03"); //Wir schlagen der Schlange den Kopf ab! Wir müssen die Hexenkönigin vernichten.
	AI_Output(hero, self, "Info_Mod_Aaron_Hexen_15_04"); //Du meinst also die ...
	AI_Output(self, hero, "Info_Mod_Aaron_Hexen_11_05"); //Ja, die Mutter von Tojan. Sie wird jetzt für alles büßen!
	AI_Output(self, hero, "Info_Mod_Aaron_Hexen_11_06"); //Ich beauftrage dich mit der Aufgabe dies zu tun, Bruder. Sei stark!
	AI_Output(self, hero, "Info_Mod_Aaron_Hexen_11_07"); //Und jetzt geh, vernichte die Hexenkönigin. Sie hat sich im alten Turm niedergelassen. Aber pass auf, sie wird streng bewacht.

	B_SetTopicStatus	(TOPIC_MOD_FM_HEXEN, LOG_SUCCESS);

	B_Göttergefallen(1, 2);

	B_StartOtherRoutine	(Mod_1855_PAL_Paladin_PAT, "START");
	B_StartOtherRoutine	(Mod_1856_PAL_Paladin_PAT, "START");
	B_StartOtherRoutine	(Mod_1857_KDF_Magier_PAT, "START");
	
	Log_CreateTopic	(TOPIC_MOD_FM_HEXENQUEEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FM_HEXENQUEEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FM_HEXENQUEEN, "Aaron hat mich damit beauftragt, die Hexenkönigin zu töten. Sie hält sich im alten Turm auf.");
};

INSTANCE Info_Mod_Aaron_Door (C_INFO)
{
	npc		= Mod_1771_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_Door_Condition;
	information	= Info_Mod_Aaron_Door_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aaron_Door_Condition()
{
	if (CHECKOPENDOORPATHERION_OPENED == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aaron_Door_Info()
{
	AI_Output(self, hero, "Info_Mod_Aaron_Door_11_00"); //Du bist schon wieder zurück? Hast du die Hexenkönigin vernichtet?
	AI_Output(hero, self, "Info_Mod_Aaron_Door_15_01"); //Nein. Ich komme nicht durch die Tür.
	AI_Output(self, hero, "Info_Mod_Aaron_Door_11_02"); //Hast du versucht sie zu brechen?
	AI_Output(hero, self, "Info_Mod_Aaron_Door_15_03"); //Ja, aber es ging nicht.
	AI_Output(self, hero, "Info_Mod_Aaron_Door_11_04"); //Nun, dann werde ich mit dir kommen und die Tür öffnen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "DOOR");
};

INSTANCE Info_Mod_Aaron_DoorIn (C_INFO)
{
	npc		= Mod_1771_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_DoorIn_Condition;
	information	= Info_Mod_Aaron_DoorIn_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aaron_DoorIn_Condition()
{
	if (Npc_GetDistToWP(self, "WP_PAT_TURM_03") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aaron_DoorIn_Info()
{
	AI_Output(self, hero, "Info_Mod_Aaron_DoorIn_11_00"); //Seltsam ...
	AI_Output(hero, self, "Info_Mod_Aaron_DoorIn_15_01"); //Das sah jetzt aber nicht sehr schwierig aus.
	AI_Output(self, hero, "Info_Mod_Aaron_DoorIn_11_02"); //War es auch nicht. Egal. Wir müssen weiter. AH!

	B_Say	(hero, self, "$WASISTDENN");

	AI_Output(self, hero, "Info_Mod_Aaron_DoorIn_11_03"); //Ich habe meine Rune verloren. Sie muss noch unten an der Treppe liegen. Ich werde sie schnell holen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TREPPE");

	Wld_InsertNpc	(Mod_1858_KDF_Aaron_PAT, "WP_PAT_TURMWEG_01");
};

INSTANCE Info_Mod_Aaron_Blut (C_INFO)
{
	npc		= Mod_1771_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_Blut_Condition;
	information	= Info_Mod_Aaron_Blut_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aaron_Blut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hexenqueen_Blut))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aaron_Blut_Info()
{
	AI_Output(self, hero, "Info_Mod_Aaron_Blut_11_00"); //Braucht man nicht unser beider Blut, um unsere Mutter wieder zu erwecken?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Aaron_Kill (C_INFO)
{
	npc		= Mod_1771_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_Kill_Condition;
	information	= Info_Mod_Aaron_Kill_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aaron_Kill_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hexenqueen_Falsch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aaron_Kill_Info()
{
	AI_Output(self, hero, "Info_Mod_Aaron_Kill_11_00"); //Los, lass sie uns töten!

	AI_StopProcessInfos	(self);

	B_Attack	(self, Mod_1859_HEX_Hexenqueen_PAT, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Aaron_Party (C_INFO)
{
	npc		= Mod_1771_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_Party_Condition;
	information	= Info_Mod_Aaron_Party_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aaron_Party_Condition()
{
	if (Mod_FM_AtHexe == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aaron_Party_Info()
{
	AI_Output(self, hero, "Info_Mod_Aaron_Party_11_00"); //Danke, mein Freund. Ohne dich hätte ich nie herausgefunden, wer ich wirklich bin.
	AI_Output(self, hero, "Info_Mod_Aaron_Party_11_01"); //Ich würde dich gerne reich belohnen.
	AI_Output(self, hero, "Info_Mod_Aaron_Party_11_02"); //Doch kann ich dir nicht viel geben, du musst mit diesem Geschenk zufrieden sein.

	B_ShowGivenThings	("Geschenk erhalten");

	CreateInvItems	(hero, ItPo_PotionOfDeath_01_Mis, 1);

	B_Say	(hero, self, "$WASISTDAS");

	AI_Output(self, hero, "Info_Mod_Aaron_Party_11_03"); //Das, mein Freund, ist das Vermächtnis meines Vaters. Das, wonach er sein ganzes Leben gesucht hat. Die sechste Träne Innos'.
	AI_Output(hero, self, "Info_Mod_Aaron_Party_15_04"); //Er hat sie tatsächlich gefunden?
	AI_Output(self, hero, "Info_Mod_Aaron_Party_11_05"); //Ja. Und er versteckte sie hier in diesem Kloster, bevor er sich mit meiner Mutter einließ. Du sollst sie haben.
	AI_Output(self, hero, "Info_Mod_Aaron_Party_11_06"); //Und jetzt lass uns feiern!

	B_SetTopicStatus	(TOPIC_MOD_FM_HEXENQUEEN, LOG_SUCCESS);
	B_SetTopicStatus	(TOPIC_MOD_PATHERION, LOG_SUCCESS);

	B_Göttergefallen(1, 2);

	B_GivePlayerXP	(1000);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Aaron_EXIT (C_INFO)
{
	npc		= Mod_1771_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_EXIT_Condition;
	information	= Info_Mod_Aaron_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Aaron_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aaron_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
