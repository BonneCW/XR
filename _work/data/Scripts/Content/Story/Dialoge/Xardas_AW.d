INSTANCE Info_Mod_Xardas_AW_Hi (C_INFO)
{
	npc		= Mod_678_DMB_Xardas_AW;
	nr		= 1;
	condition	= Info_Mod_Xardas_AW_Hi_Condition;
	information	= Info_Mod_Xardas_AW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_AW_Hi_Condition()
{
	if (FokiEingesetzt == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_AW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_00"); //Ich muss dich sprechen. Ich habe einiges herausgefunden.
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Hi_15_01"); //Was gibt es?
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_02"); //Dieser Teil der Insel Khorinis heißt Jharkendar.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_03"); //Vor vielen tausend Jahren hat hier mal ein hochentwickeltes Volk gelebt, wie man unschwer erkennen kann.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_04"); //Zu dieser Zeit waren die Götter noch vereint, als Urgott Radanos.

	AI_Function_I (self, XR_Backgroundstory, 1);

	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_05"); //Mit Xeres kam dann der Untergang. Xeres war ein mächtiger Magier, so mächtig, dass er von den Bewohnern verlangte, dass sie statt den Göttern ihn verehrten.

	AI_Function_I (self, XR_Backgroundstory, 2);

	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_06"); //Als sie ihm die Gefolgschaft verweigerten, löschte er vor Wut den ganzen Landstrich aus, und nur wenige überlebten.

	AI_Function_I (self, XR_Backgroundstory, 3);

	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_07"); //Einem von ihnen gelang es, mit einem rätselhaften Schwert Xeres tödlich zu verwunden.

	AI_Function_I (self, XR_Backgroundstory, 4);

	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_08"); //Weil er vollkommen kraftlos war, konnte Radanos ihn in ein Gefängnis tief unter der Erdoberfläche sperren.

	AI_Function_I (self, XR_Backgroundstory, 5);

	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_09"); //Danach weinte der Gott der Sage nach bittere Tränen, die als Flut Jharkendar verwüsteten.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_10"); //Seine gesamte Schöpfung war dahin, und in der Trauer splitterte sein Denken allmählich in drei Teile - die drei Götter, die wir noch heute kennen.

	AI_Function_I (self, XR_Backgroundstory, 6);

	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_11"); //Aber das ist eine andere Geschichte.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_12"); //Nun beginnt der Teil meiner Erzählung, der größtenteils auf meinen eigenen Spekulationen beruht.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_13"); //Xeres muss in seinem Gefängnis überlebt haben.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_14"); //Schwer angeschlagen und seiner Kräfte beraubt, aber noch immer wild entschlossen, zurückzukehren.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_15"); //Seit ein paar Jahrzehnten scheint er seinen Ausbruch voranzutreiben.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_16"); //Was er brauchte, befand sich im Minental. Deshalb entsandte er den Schläfer dorthin.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_17"); //Dann kamen wir ihm dazwischen, indem wir die Barriere schufen. Xeres verlor den Kontakt zu seiner Kreation und konnte ihr nicht den entscheidenden Auftrag erteilen.
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Hi_15_18"); //Was hat Xeres dort gesucht?
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_19"); //Die Fokussteine. Die Seite von Radanos, die später Beliar werden sollte, schuf sich ein Hintertürchen für eine spätere Begnadigung des Magiers.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_20"); //Sollten alle Foki wieder zu den Sockeln in Jharkendar zurückfinden, würde der Bann von Xeres genommen und sein Gefängnis geöffnet.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_21"); //(gewichtig) Deshalb darfst du niemals auf die Idee kommen, die Foki aus dem Minental hier in Jharkendar einzusetzen. Niemals!
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_22"); //Stattdessen müssen wir alles daran setzen, die Foki zu zerstören oder zumindest zu verstecken!
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Hi_15_23"); //Ähm, Xardas?
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_24"); //Ja?
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Hi_15_25"); //Das erklärt, warum es so viele merkwürdige Zwischenfälle bei meiner Fokussuche gab.
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Hi_15_26"); //Xeres hatte schon wieder seine Fühler danach ausgestreckt. Aber ich habe sie alle bekommen.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_27"); //Du hast sie also schon beschafft? Wunderbar!
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Hi_15_28"); //Nicht nur das. Ich habe gerade den letzten hier in Jharkendar eingesetzt.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_29"); //(sprachlos)
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Hi_15_30"); //Schöne Bescherung, was?
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_31"); //(ruft) NEIN! Das kann nicht sein!
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Hi_15_32"); //Ich mach's auch wieder gut ...
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_33"); //Nein, warte! Wir brauchen jetzt einen Plan.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_34"); //Du musst verhindern, dass sich Xeres weitere Verbündete auf Khorinis suchen kann.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_35"); //Am meisten Gefahr geht sicherlich von den Orks aus, die er ja schon mit dem Schläfer für sich einspannen konnte.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Hi_14_36"); //Um deinen Weg abzukürzen, werde ich dich zu meinem alten Turm im Minental teleportieren. Von dort ist es nicht mehr weit.

	Log_CreateTopic	(TOPIC_MOD_XERES, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_XERES, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_XERES, "Durch das Einsetzen der Foki habe ich Xeres, einen mächtigen Magier des Alten Volkes, aus seinem Schattenreich befreit. Xardas hat mir aufgetragen, bei den Orks im Minental nach dem Rechten zu sehen, bevor Xeres sie sich untertan macht.");

	B_SetTopicStatus	(TOPIC_MOD_DIEBEDROHUNG, LOG_SUCCESS);

	B_SetLevelchange ("Minental\Minental.zen", "DT_E3_03");
};

INSTANCE Info_Mod_Xardas_AW_Bshydal (C_INFO)
{
	npc		= Mod_678_DMB_Xardas_AW;
	nr		= 1;
	condition	= Info_Mod_Xardas_AW_Bshydal_Condition;
	information	= Info_Mod_Xardas_AW_Bshydal_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_AW_Bshydal_Condition()
{
	if (Npc_HasItems(hero, ItMi_WaterOfLife) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_AW_Bshydal_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Bshydal_15_00"); //Was, ach hier bin ich gelandet. Xardas, du auch hier?
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_01"); //Wenn es um Ereignisse von besonderer Bedeutung geht, bin ich nie fern.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_02"); //Berichte: Wie ist deine Suche verlaufen und was ist mit der Garde Innos geschehen. Ich kann ihre Macht nicht mehr spüren.
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Bshydal_15_03"); //Die Garde ist vernichtet. Einige ihrer Jünger habe ich bezwingen können ... die anderen wurden von dem Blutkult getötet.
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Bshydal_15_04"); //Du musst wissen, dass der Blutkult die Garde nur als Werkzeug benutzte, um selbst das Schwert Innos’ zu erlangen.
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Bshydal_15_05"); //Jedoch muss etwas bei der Suche ...
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_06"); //... fehlgeschlagen sein, da sie das Schwert nicht fanden.
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Bshydal_15_07"); //Du weißt es? Aber wie ist das möglich? Und wo ist dann das Schwert Innos nun wirklich?
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_08"); //Es befand sich an einem anderen Ort in Khorinis. War gar nicht so einfach es zu finden, so tief unter Patherion.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_09"); //Leichter war es da schon die blind Fanatisierten auf eine andere Fährte zu locken ...
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Bshydal_15_10"); //Was?! Du hast die ganze Zeit gewusst, dass sie auf der falschen Spur waren und währenddessen selbst danach gesucht?!
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_11"); //Was denkst du denn? Wenn jemand nach der Vernichtung Beliars’ trachtet, werde ich wohl kaum in meinem Turm sitzen und auf den Untergang der Welt warten.
	AI_Output(hero, self, "Info_Mod_Xardas_AW_Bshydal_15_12"); //Und wo ist das Schwert im Moment?
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_13"); //Das wird mein Geheimnis bleiben ... und ganz bestimmt wirst du diese Waffe auch nicht bekommen ... ein Werkzeug, dass die Macht hat unseren Gott zu verbannen und größerem Übel zum Aufstieg zu verhelfen.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_14"); //Stattdessen erhältst du etwas Gold für deine Ausrüstung und diesen Ring unseres Herrn. Wenn du allerdings Bürger und Bauern verprügelst, solltest du ihn lieber nicht anhaben.

	CreateInvItems	(hero, ItMi_Gold, 1000);
	CreateInvItems	(hero, ItRi_BeliarBosheit, 1);

	B_ShowGivenThings	("1000 Gold und Ring erhalten");

	AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_15"); //Hmm, wie dem auch sei, wenn du das Ziel deiner Suche erreicht haben solltest, müsstest du jetzt im Besitz des Wassers des Lebens sein.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_16"); //Ein Werkzeug ausgestattet mit einer Macht, die auch nicht zu verschmähen ist. Verstorbenen soll es das Leben wiedergeben.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_17"); //Vielleicht fällt dir ja ein Verwendungszweck dafür ein.

	if (!Npc_IsDead(Mod_7316_BK_Bshydal_AW))
	{
		AI_Output(hero, self, "Info_Mod_Xardas_AW_Bshydal_15_18"); //Hmm, noch was: Ein Blutkultmagier, der die Macht der Garde Innos’ in sich aufnahm, befindet sich noch in dem Raum unter dem Tempel.
		AI_Output(hero, self, "Info_Mod_Xardas_AW_Bshydal_15_19"); //Er scheint äußerst mächtig geworden zu sein ...
		AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_20"); //Nun, ich denke nicht, dass wir uns um ihn Sorgen machen müssen.
		AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_21"); //Der Raum unter dem Tempel Adanos muss magisch versiegelt sein, sonst würde ich seine Macht spüren.
		AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_22"); //Nur durch bestimmte Mechanismen der Teleportmagie kann der Raum betreten, oder verlassen werden.
		AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_23"); //Und das Portal, das er sich erschuf, muss zusammengebrochen sein ... so etwas kann geschehen, wenn ein anderes Portal in der Umgebung erschaffen wird.
		AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_24"); //Er ist dort unten vermutlich bis in alle Ewigkeit gefangen.
	};

	if (Mod_Gilde == 13)
	{
		AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_25"); //Geh zu Myxir ins Kloster, er wird dich in den Rang des Dämonenbeschwörers aufnehmen.
	}
	else if (Mod_Gilde == 15)
	{
		AI_Output(self, hero, "Info_Mod_Xardas_AW_Bshydal_14_26"); //Geh zu Scar, er wird dich in den Rang des Dämonenritters aufnehmen.
	};

	B_LogEntry	(TOPIC_MOD_BEL_INNOSSCHWERT, "Eine falsche Fährte also, gelegt von Xardas. Und er hat das Schwert Innos längst gefunden und an einen sicheren Ort gebracht. Er meinte, das Wasser des Lebens könnte Verstorbene wieder zum Leben erwecken. Fällt mir dazu etwas ein?");
	
	B_GivePlayerXP	(800);

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "TOT");
	AI_Teleport	(self, "TOT");

	B_StartOtherRoutine	(Mod_764_PIR_Greg_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_1079_PIR_PIRAT_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_1078_PIR_PIRAT_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_1077_PIR_PIRAT_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_963_PIR_Malcom_NW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_941_PIR_Angus_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_942_PIR_Hank_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_939_PIR_Owen_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_940_PIR_Samuel_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_936_PIR_Matt_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_938_PIR_Morgan_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_1080_PIR_PIRAT_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_935_PIR_Malcom_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_933_PIR_Garett_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_934_PIR_Henry_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_932_PIR_Francis_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_930_PIR_Bones_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_931_PIR_Brandon_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_775_PIR_Skip_AW, "BEERDIGUNG");
	B_StartOtherRoutine	(Mod_929_PIR_Bill_AW, "BEERDIGUNG");

	Wld_SendTrigger	("EVT_AJ_GRABSTEIN");
};

INSTANCE Info_Mod_Xardas_AW_FokusWeg (C_INFO)
{
	npc		= Mod_678_DMB_Xardas_AW;
	nr		= 1;
	condition	= Info_Mod_Xardas_AW_FokusWeg_Condition;
	information	= Info_Mod_Xardas_AW_FokusWeg_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso können wir nicht einfach einen Fokus wegnehmen?";
};

FUNC INT Info_Mod_Xardas_AW_FokusWeg_Condition()
{
	if (FokiEingesetzt == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_AW_FokusWeg_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_AW_FokusWeg_15_00"); //Wieso können wir nicht einfach einen Fokus wegnehmen?
	AI_Output(hero, self, "Info_Mod_Xardas_AW_FokusWeg_15_01"); //Schließt sich dann das Gefängnis nicht wieder?
	AI_Output(self, hero, "Info_Mod_Xardas_AW_FokusWeg_14_02"); //Ich bezweifle, dass es so kommen würde.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_FokusWeg_14_03"); //Aber abgesehen davon bin ich mir sicher, dass Xeres schon Wind von seiner Freiheit bekommen hat und gar nicht mehr in seinem Gefängnis verweilt.
	AI_Output(self, hero, "Info_Mod_Xardas_AW_FokusWeg_14_04"); //Deshalb ist es wichtig, dass wir schnell handeln!
};

INSTANCE Info_Mod_Xardas_AW_DuZwischenzeit (C_INFO)
{
	npc		= Mod_678_DMB_Xardas_AW;
	nr		= 1;
	condition	= Info_Mod_Xardas_AW_DuZwischenzeit_Condition;
	information	= Info_Mod_Xardas_AW_DuZwischenzeit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was wirst du in der Zwischenzeit tun?";
};

FUNC INT Info_Mod_Xardas_AW_DuZwischenzeit_Condition()
{
	if (FokiEingesetzt == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_AW_DuZwischenzeit_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_AW_DuZwischenzeit_15_00"); //Was wirst du in der Zwischenzeit tun?
	AI_Output(self, hero, "Info_Mod_Xardas_AW_DuZwischenzeit_14_01"); //Ich werde die Gesamtsituation im Auge behalten und verhindern, dass sich Xeres' Truppen in Khorinis ausbreiten.
};

INSTANCE Info_Mod_Xardas_AW_EXIT (C_INFO)
{
	npc		= Mod_678_DMB_Xardas_AW;
	nr		= 1;
	condition	= Info_Mod_Xardas_AW_EXIT_Condition;
	information	= Info_Mod_Xardas_AW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Xardas_AW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Xardas_AW_EXIT_Info()
{
	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "TOT");
	B_StartOtherRoutine	(self, "TOT");

	if (Kapitel == 3)
	{
		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};