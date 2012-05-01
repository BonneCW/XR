INSTANCE Info_Mod_Dexter_Hi (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_Hi_Condition;
	information	= Info_Mod_Dexter_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_Parole))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Dexter_Hi_09_00"); //Was hast du hier verloren?
	AI_Output(hero, self, "Info_Mod_Dexter_Hi_15_01"); //Ich bin gekommen um mich euch anzuschließen.

	if (Gardist_Dabei == TRUE)
	|| (Mod_AnzahlNebengilden >= MaxNebengilden)
	{
		AI_Output(self, hero, "Info_Mod_Dexter_Hi_09_02"); //Ok, du hast unser Losungswort.

		if (Gardist_Dabei == TRUE)
		{
			AI_Output(self, hero, "Info_Mod_Dexter_Hi_09_03"); //Mir ist aber zu Ohren gekommen, dass du schon Teil des Alten Lagers bist.
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Dexter_Hi_09_04"); //Mir ist aber zu Ohren gekommen, dass du schon Teil vieler anderer Lager bist.
		};

		AI_Output(self, hero, "Info_Mod_Dexter_Hi_09_05"); //Ein echter Bandit kannst du nun nicht mehr werden. Die Gefahr, dass du Informationen von uns weitergibst ist mir zu groß.
		AI_Output(self, hero, "Info_Mod_Dexter_Hi_09_06"); //Es steht dir aber frei unser Lager zu betreten und mit den Jungs zu handeln.
		AI_Output(self, hero, "Info_Mod_Dexter_Hi_09_07"); //Mach aber keinen Ärger, ok?

		B_SetTopicStatus	(TOPIC_MOD_AUFNAHME_BANDITEN, LOG_FAILED);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Dexter_Hi_09_08"); //Wie es scheint hast du ja ein paar von uns bereits überzeugt, sonst wärst du hier gar nicht lebend reingekommen.
		AI_Output(self, hero, "Info_Mod_Dexter_Hi_09_09"); //Wenn du willst, kannst du jetzt also einer von uns werden.

		B_LogEntry	(TOPIC_MOD_AUFNAHME_BANDITEN, "Dexter wird mich jetzt aufnehmen, wenn ich möchte.");
	};

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Dexter_Aufnahme (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_Aufnahme_Condition;
	information	= Info_Mod_Dexter_Aufnahme_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will Bandit werden.";
};

FUNC INT Info_Mod_Dexter_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Hi))
	&& (Gardist_Dabei == FALSE)
	&& (Mod_AnzahlNebengilden < MaxNebengilden)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Dexter_Aufnahme_15_00"); //Ich will Bandit werden.
	AI_Output(self, hero, "Info_Mod_Dexter_Aufnahme_09_01"); //Hier ist deine Rüstung. Du kannst dich jetzt im Lager nützlich machen.

	Log_CreateTopic	(TOPIC_MOD_NEBENGILDEN, LOG_NOTE);
	B_LogEntry_More	(TOPIC_MOD_NEBENGILDEN, TOPIC_MOD_AUFNAHME_BANDITEN, "Dexter hat mich bei den Banditen aufgenommen.", "Dexter hat mich aufgenommen und mir eine Rüstung gegeben.");
	B_SetTopicStatus	(TOPIC_MOD_AUFNAHME_BANDITEN, LOG_SUCCESS);

	B_GivePlayerXP	(400);

	CreateInvItems	(self, ITAR_BDT_M_01, 1);
	B_GiveInvItems	(self, hero, ITAR_BDT_M_01, 1);

	Banditen_Dabei = TRUE;

	B_Göttergefallen(3, 2);

	Mod_AnzahlNebengilden += 1;
};

INSTANCE Info_Mod_Dexter_WhatToDo (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_WhatToDo_Condition;
	information	= Info_Mod_Dexter_WhatToDo_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was sind meine Aufgaben als Bandit?";
};

FUNC INT Info_Mod_Dexter_WhatToDo_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Hi))
	&& (Banditen_Dabei == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_WhatToDo_Info()
{
	AI_Output(hero, self, "Info_Mod_Dexter_WhatToDo_15_00"); //Was sind meine Aufgaben als Bandit?
	AI_Output(self, hero, "Info_Mod_Dexter_WhatToDo_09_01"); //Die sind sehr vielfältig und abwechslungsreich.
	AI_Output(self, hero, "Info_Mod_Dexter_WhatToDo_09_02"); //Natürlich planen und führen wir in erster Linie Überfälle aus und schauen sonst, wo es etwas zu holen gibt mit etwas Geschick.
	AI_Output(self, hero, "Info_Mod_Dexter_WhatToDo_09_03"); //Erst vor wenigen Tagen haben wir einem kleinen Trupp feindlicher Orks aufgelauert, die auf dem Weg in die Orkstadt im Südwesten waren.
	AI_Output(self, hero, "Info_Mod_Dexter_WhatToDo_09_04"); //Dabei fiel uns ein recht wertvolles Artefakt in die Hände. Aber darauf gehe ich ein andermal näher ein.
	AI_Output(self, hero, "Info_Mod_Dexter_WhatToDo_09_05"); //Jedenfalls würde uns ohne Abnehmer und Hehler, an welche wir unsere erbeuteten Güter weiterverkaufen könnten, eine zentrale Einnahmequelle fehlen.
	AI_Output(self, hero, "Info_Mod_Dexter_WhatToDo_09_06"); //Wir haben Kontakte und Abnehmer in ganz Khorinis. Wir fungieren daher auch als Händler, Boten, und nehmen hin und wieder sogar Aufträge an, die anderen zu heiß sind.
	AI_Output(self, hero, "Info_Mod_Dexter_WhatToDo_09_07"); //Wenn du dich erst mal im Lager bewährt hast, wird für dich auch manch guter Fisch abfallen. Das Leben als Bandit wird dir gefallen.
};

INSTANCE Info_Mod_Dexter_Job (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_Job_Condition;
	information	= Info_Mod_Dexter_Job_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du was zu tun für mich?";
};

FUNC INT Info_Mod_Dexter_Job_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_WhatToDo))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_Job_Info()
{
	AI_Output(hero, self, "Info_Mod_Dexter_Job_15_00"); //Hast du was zu tun für mich?
	AI_Output(self, hero, "Info_Mod_Dexter_Job_09_01"); //Vorerst nicht. Komm vielleicht in paar Tagen wieder.

	Mod_DextersJob = Wld_GetDay();

	Log_CreateTopic	(TOPIC_MOD_BDT_ORKS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BDT_ORKS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Dexter hat vorerst nichts zu tun für mich. Ich sollte noch mal in paar Tagen bei ihm vorbeischauen.");
};

INSTANCE Info_Mod_Dexter_TimeOver (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_TimeOver_Condition;
	information	= Info_Mod_Dexter_TimeOver_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_TimeOver_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Job))
	&& ((Mod_DextersJob + 2) <= Wld_GetDay())
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_TimeOver_Info()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche2))
	|| (Mod_Banditenüberfall_Esteban == 11)
	|| (Mod_Orks_Morgahard == 4)
	{
		AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_00"); //Du hast unserem Lager schon gute Dienste erwiesen und dich als geschickter und würdiger Bandit gezeigt.
		AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_01"); //Daher habe ich eine äußerst wichtige Aufgabe für dich.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_02"); //Bislang hast du noch nichts wirklich Großes für unser Lager geleistet.
		AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_03"); //Da du aber das alte Lager von früher gut kennst und keiner von deiner Zugehörigkeit zu uns weiß, kannst du endlich mal etwas Wichtiges für uns tun.
	};

	AI_Output(hero, self, "Info_Mod_Dexter_TimeOver_15_04"); //Worum geht es?
	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_05"); //Ich hatte dir ja bereits vor einigen Tagen in unserem Gespräch davon erzählt, dass wir ein bedeutendes Artefakt von den Orks erbeutet hatten.
	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_06"); //Nun, bei diesem Gegenstand handelte es sich um ein magisches Amulett.
	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_07"); //Aus einem Buch über verschollene Schätze aus den alten Tagen erfuhren wir, dass dieses Schmuckstück einer Reihe mächtiger Gegenstände angehörte, die einst auf göttliche Weisung in den Schmelzöfen Nordmars geschaffen worden sein sollen, lange vor der Gründung der Clans.
	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_08"); //Wir traten darüber in Verhandlung mit den Verwandlungsmagiern, die großes Interesse an dem Amulett zeigten.
	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_09"); //Sie gaben uns sogar vor Ort bereits einige wertvolle Spruchrollen, um den Handel zu besiegeln.
	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_10"); //Nun sollte Quentin gestern das Amulett zu ihnen bringen, nachdem Oschust ihm noch frischen Glanz verliehen hatte. Er ist eigentlich ein fähiger Mann und einer unser besten Kämpfer.
	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_11"); //Unterwegs machte er aber noch halt im Alten Lager, um bei einigen Arenakämpfen zuzusehen. Dabei Trank er den einen oder anderen Schluck und geriet mit einem fremden Kämpfer in Streit.
	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_12"); //Na ja, um auf den Punkt zu kommen, sie überboten sich mit ihren Wetteinsätzen, den anderen auf den Arenaboden schicken zu können und dieser Idiot Quentin bot zuletzt das Amulett an.
	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_13"); //Der Kampf dauerte nicht lange, Quentin sank nach wenigen Hieben seines Gegners in den Staub und war das Amulett los.
	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_14"); //Das ist ein schwerer Schlag für unser gesamtes Lager, denn einige der Spruchrollen, die uns die Magier gaben, haben wir bei einer Aufklärungsmission verbraucht.
	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_15"); //So lässt sich das Geschäft nicht einfach rückgängig machen und der Ruf unserer Zuverlässigkeit steht auf dem Spiel.

	if (Kapitel >= 4)
	{
		AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_16"); //Und dass das alte Lager nun in den Händen der Orks ist, macht es eben auch nicht gerade einfacher.
	};

	AI_Output(hero, self, "Info_Mod_Dexter_TimeOver_15_17"); //Und ich soll das Amulett wiederbeschaffen?
	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_18"); //Genau, du verstehst schon, worum es geht.

	B_Say	(hero, self, "$WIESOLLICHVORGEHEN");

	if (Kapitel >= 4)
	{
		AI_Output(hero, self, "Info_Mod_Dexter_TimeOver_15_19"); //Nett anklopfen und fragen, ob jemand zufällig das Amulett gesehen hat?
	};

	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_20"); //Wir haben in Erfahrung gebracht, dass der Kämpfer den Namen Sabitsch trägt und ein alter Bekannter von Thorus ist, aus den Tagen vor der Kolonie.
	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_21"); //Er war viel unterwegs und soll schon in zahlreichen Arenen der bekannten Welt Siege errungen haben.
	AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_22"); //Nachdem er von dem Fall der Barriere erfuhr und von der Herrschaft seines alten Freundes Thorus über das Lager, kam er wohl als Glücksritter hierher, um sich einen Teil der Schätze dieses Tales zu holen.

	if (Kapitel < 4)
	{
		AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_23"); //Es ist also viel Fingerspitzenfertigkeit gefordert bei deiner Aufgabe, da er nicht nur ein berüchtigter Kämpfer, sondern auch ein guter Bekannter von Thorus ist und wir wollen es uns nicht mit dem Alten Lager verscherzen.
		AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_24"); //Versuch am besten so viel über ihn zu erfahren, wie möglich, sprich mit den Leuten, die oft mit ihm zu tun haben – natürlich nicht gerade mit Thorus.
		AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_25"); //Und dann tue alles, um wieder in den Besitz des Amulettes zu kommen ... vorallem hinterlasse möglichst wenig spuren, wenn es auf eine Art geschehen müsste, die zu Konflikten führen könnte mit dem Alten Lager.

		B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Dexter hat mir die Aufgabe gegeben das Amulett zurückzuholen, welches Quentin an Sabitsch verlor. Dabei muss ich sehr geschickt vorgehen, da Sabitsch, welchen ich im Alten Lager finden werde, ein formidabler Kämpfer und ein guter Freund von Thorus ist.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_26"); //Tja, ist wohl nicht so gut gelaufen für ihn, wie er gehofft hat.
		AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_27"); //Obwohl er ein exzellenter Kämpfer war, dürfte er wohl kaum eine Chance gegen die 200 Orks gehabt haben, die dort jetzt rumsitzen.
		AI_Output(hero, self, "Info_Mod_Dexter_TimeOver_15_28"); //Acha, und was soll ich da jetzt ausrichten?
		AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_29"); //Reingehen, die Arena finden, die Leiche durchwühlen, das Amulett bergen und zu uns bringen.
		AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_30"); //Jedoch vielleicht lieber in einer weniger auffälligen Gestalt.

		B_Say	(hero, self, "$WASMEINSTDU");

		AI_Output(self, hero, "Info_Mod_Dexter_TimeOver_09_31"); //Sprich mit Quentin. Er hat etwas für dich.

		B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Dexter hat mir die Aufgabe gegeben das Amulett zurückzuholen, welches Quentin an Sabitsch verlor. Diese könnte im Orkversuchten Lager immer noch bei der Arena in bei seiner Leiche zu finden sein. Dexter meinte, dass Quentin etwas bei sich hätte, damit ich im Lager nicht so Auffalle.");
	};

	Wld_InsertNpc	(Mod_7024_OUT_Sabitsch_MT,	"OC1");

	if (Kapitel >= 4)
	{
		B_KillNpc	(Mod_7024_OUT_Sabitsch_MT);
	};
};

INSTANCE Info_Mod_Dexter_AmulettBack (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_AmulettBack_Condition;
	information	= Info_Mod_Dexter_AmulettBack_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Amulett.";
};

FUNC INT Info_Mod_Dexter_AmulettBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_TimeOver))
	&& (Npc_HasItems(hero, ItAm_MegaAmulett) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_AmulettBack_Info()
{
	AI_Output(hero, self, "Info_Mod_Dexter_AmulettBack_15_00"); //Ich habe das Amulett.

	B_GiveInvItems	(hero, self, ItAm_MegaAmulett, 1);

	if (Kapitel < 4)
	{
		if (Mod_SabitschArenaLooser < 2)
		{
			AI_Output(self, hero, "Info_Mod_Dexter_AmulettBack_09_01"); //Sehr gut. Damit hast du unserem Lager einen großen Dienst erwiesen.
			AI_Output(self, hero, "Info_Mod_Dexter_AmulettBack_09_02"); //Nimm das als Belohnung.

			CreateInvItems	(hero, ItMi_Gold, 500);
			CreateInvItems	(hero, ItMi_Nugget, 20);

			B_ShowGivenThings	("500 Gold und 20 Erzbrocken erhalten");

			B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Dexter war sehr zufrieden mit meinem Erfolg und hat mich großzügig entlohnt.");

			B_GivePlayerXP	(600);
		}
		else if (Mod_SabitschAmulettGeklaut == 2)
		{
			AI_Output(self, hero, "Info_Mod_Dexter_AmulettBack_09_03"); //Nun, du wurdest zwar bei dem Diebstahl erwischt, aber das regelt sich schon irgendwann von selbst und Hauptsache, wir haben das Amulett.
			AI_Output(self, hero, "Info_Mod_Dexter_AmulettBack_09_04"); //Du hast dir eine Belohnung verdient.

			CreateInvItems	(hero, ItMi_Gold, 300);
			CreateInvItems	(hero, ItMi_Nugget, 14);

			B_ShowGivenThings	("300 Gold und 14 Erzbrocken erhalten");

			B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Dexter war trotz des entdeckten Diebstahles zufrieden mit mir und hat mich angemessen entlohnt.");

			B_GivePlayerXP	(200);
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Dexter_AmulettBack_09_05"); //Erstaunlich! Dir ist es wirklich gelungen. Damit hast du unserem Lager einen großen Dienst erwiesen. Nimm das als Belohnung.

		CreateInvItems	(hero, ItMi_Gold, 500);
		CreateInvItems	(hero, ItMi_Nugget, 20);
		CreateInvItems	(hero, ItSc_TrfRabbit, 2);

		B_GivePlayerXP	(400);

		B_ShowGivenThings	("500 Gold, 20 Erzbrocken und 2 Spruchrollen erhalten");
	};

	AI_Output(self, hero, "Info_Mod_Dexter_AmulettBack_09_06"); //Jedenfalls werde ich Quentin eine zweite Chance geben. Er wird das Amulett zu den Magiern bringen und den Handel abschließen.

	Mod_DextersJob = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Dexter hat Quentin erneut das Amulett übergeben, damit dieser es den Magiern überbringt. Diesmal läuft hoffentlich alles glatt.");
};

INSTANCE Info_Mod_Dexter_QuentinsBack (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_QuentinsBack_Condition;
	information	= Info_Mod_Dexter_QuentinsBack_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_QuentinsBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_AmulettBack))
	&& (Wld_GetDay() > Mod_DextersJob)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_QuentinsBack_Info()
{
	AI_Output(self, hero, "Info_Mod_Dexter_QuentinsBack_09_00"); //Verdammter Mist.
	AI_Output(hero, self, "Info_Mod_Dexter_QuentinsBack_15_01"); //Was ist geschehen.
	AI_Output(self, hero, "Info_Mod_Dexter_QuentinsBack_09_02"); //Als Quentin das Amulett dem Magier Albert übergab, begutachtete dieser das Stück einige Minuten.
	AI_Output(self, hero, "Info_Mod_Dexter_QuentinsBack_09_03"); //Dann warf er des Quentin plötzlich vor die Füße, war außer sich, sprach von Täuschung und Betrug.
	AI_Output(self, hero, "Info_Mod_Dexter_QuentinsBack_09_04"); //Er könne zwar noch den Rest magischer Aura des echten Amulettes spüren, das sei aber eindeutig eine Fälschung.
	AI_Output(hero, self, "Info_Mod_Dexter_QuentinsBack_15_05"); //Wie ist das möglich?
	AI_Output(self, hero, "Info_Mod_Dexter_QuentinsBack_09_06"); //Nun, völlig dämlich bin ich auch nicht. Ich bin alles noch mal durchgegangen und zu dem einzigen Schluss gekommen, dass dieser dreckige Oschust dahinter stecken muss.
	AI_Output(self, hero, "Info_Mod_Dexter_QuentinsBack_09_07"); //Als wir ihm das Amulett zum Aufpolieren gaben, muss er noch in selber Nacht eine exakte Kopie erstellt haben, welche er uns dann am nächsten Tag übergab.
	AI_Output(self, hero, "Info_Mod_Dexter_QuentinsBack_09_08"); //Das Original muss er irgendwo versteckt haben. Ich kann jetzt aber nicht einfach zu ihm gehen und ihn in stücke hauen. Wir brauchen ihn noch.
	AI_Output(hero, self, "Info_Mod_Dexter_QuentinsBack_15_09"); //Was bleibt zu tun?
	AI_Output(self, hero, "Info_Mod_Dexter_QuentinsBack_09_10"); //Das überlasse ich dir. Kümmere du dich um Oschust. Bringe ihn mit etwas ,,Diplomatie’’ dazu, dir Auskunft über den Standort des Amulettes zu geben.
	AI_Output(self, hero, "Info_Mod_Dexter_QuentinsBack_09_11"); //Aber er soll danach noch weiterhin dazu in der Lage sein, seinem Fälscherhandwerk nachzugehen. Du verstehst?
	AI_Output(self, hero, "Info_Mod_Dexter_QuentinsBack_09_12"); //Gut. Erstatte mir danach wieder Bericht.

	Wld_InsertNpc	(Mod_10012_ORC_Scout_MT,	"OC1");
	Wld_InsertNpc	(Mod_10013_ORC_Scout_MT,	"OC1");
	Wld_InsertNpc	(Mod_10014_ORC_Elite_MT,	"OC1");
	Wld_InsertNpc	(Mod_10015_ORC_Elite_MT,	"OC1");
	Wld_InsertNpc	(Orcdog,	"WP_ORKBEIAMULETT");

	Wld_SendTrigger	("EVT_MT_ORKHOEHLEAMULETT");
};

INSTANCE Info_Mod_Dexter_FakeAmulett (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_FakeAmulett_Condition;
	information	= Info_Mod_Dexter_FakeAmulett_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo ist das gefälschte Amulett jetzt?";
};

FUNC INT Info_Mod_Dexter_FakeAmulett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_QuentinsBack))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_FakeAmulett_Info()
{
	AI_Output(hero, self, "Info_Mod_Dexter_FakeAmulett_15_00"); //Wo ist das gefälschte Amulett jetzt?
	AI_Output(self, hero, "Info_Mod_Dexter_FakeAmulett_09_01"); //Ich trage es bei mir. Hier, du kannst es haben, da du es auch dem Alten Lager entrissen hast.

	B_GiveInvItems	(self, hero, ItAm_MegaAmulett, 1);

	AI_Output(self, hero, "Info_Mod_Dexter_FakeAmulett_09_02"); //Für uns hat es keinen Wert mehr.
};

INSTANCE Info_Mod_Dexter_OschustAmulett (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_OschustAmulett_Condition;
	information	= Info_Mod_Dexter_OschustAmulett_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe von Oschust erfahren, wo sich das Amulett befindet.";
};

FUNC INT Info_Mod_Dexter_OschustAmulett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oschust_Umgehauen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_OschustAmulett_Info()
{
	AI_Output(hero, self, "Info_Mod_Dexter_OschustAmulett_15_00"); //Ich habe von Oschust erfahren, wo sich das Amulett befindet. Nicht weit von hier in einer Höhle.
	AI_Output(self, hero, "Info_Mod_Dexter_OschustAmulett_09_01"); //Sehr gut. Wie kooperativ war Oschust?
	AI_Output(hero, self, "Info_Mod_Dexter_OschustAmulett_15_02"); //Nun, ich musste meiner Position etwas Nachdruck verleihen. Ähhm, da gibt es aber noch ein Problem.
	AI_Output(self, hero, "Info_Mod_Dexter_OschustAmulett_09_03"); //Ja?
	AI_Output(hero, self, "Info_Mod_Dexter_OschustAmulett_15_04"); //In der Höhle wimmelt es jetzt von Orks und Warg.
	AI_Output(self, hero, "Info_Mod_Dexter_OschustAmulett_09_05"); //Was, schon wieder die Orks?! So nah am Lager ... das ist nicht gut.
	AI_Output(hero, self, "Info_Mod_Dexter_OschustAmulett_15_06"); //Und was unternehmen wir wegen des Amulettes?
	AI_Output(self, hero, "Info_Mod_Dexter_OschustAmulett_09_07"); //(nachdenklich) Für einen frontalen Angriff haben wir nicht genügend Schlagkraft ... und ein nächtlicher Überfall würde an den wachsamen Orkhunden scheitern.
	AI_Output(self, hero, "Info_Mod_Dexter_OschustAmulett_09_08"); //Außerdem brauche ich meine Männer hier zum Schutz des Lagers, so häufig, wie sich zurzeit hier Orks herumtreiben ...
	AI_Output(hero, self, "Info_Mod_Dexter_OschustAmulett_15_09"); //Heißt das, ich wäre mal wieder auf mich allein gestellt?
	AI_Output(self, hero, "Info_Mod_Dexter_OschustAmulett_09_10"); //(nachdenlich) Nun… nicht zwangsläufig. Du könntest zum einen versuchen einige Orkjäger im Neuen Lager anzuheuern.
	AI_Output(self, hero, "Info_Mod_Dexter_OschustAmulett_09_11"); //Wird aber nicht billig. Hier hast du etwas Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Dexter_OschustAmulett_09_12"); //Vielleicht gelingt es dir aber auch einen Bekloppten zu finden, der Lockvogel spielt und die Orks aus der Höhle herauslockt.
	AI_Output(self, hero, "Info_Mod_Dexter_OschustAmulett_09_13"); //Naja, ich bin mir sicher du findest einen Weg. Viel Glück!

	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Dexter kann keine Leute im Lager entbehren zur Bergung des Amulettes und gab mir den Ratschlag eventuell einige Orksöldner anzuheuern, um gewaltsam das Schmuckstück zu erbeuten. Er meinte auch, dass ich alternativ einen Leichsinnigen finden könnte, der die Orks aus der Höhle herauslocken würde. Ob mir da jemand einfällt?");

	B_StartOtherRoutine	(Mod_7022_BDT_Oschust_MT, "TOT");
	AI_Teleport	(Mod_7022_BDT_Oschust_MT, "TOT");
};

INSTANCE Info_Mod_Dexter_OschustTot (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_OschustTot_Condition;
	information	= Info_Mod_Dexter_OschustTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ähh, ich habe versucht Oschust zu befragen. Leider ist er dabei verstorben und ...";
};

FUNC INT Info_Mod_Dexter_OschustTot_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Oschust_Amulett_A))
	|| (Npc_KnowsInfo(hero, Info_Mod_Oschust_Amulett_B)))
	&& (Npc_IsDead(Mod_7022_BDT_Oschust_MT))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Dexter_OschustAmulett))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_OschustTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Dexter_OschustTot_15_00"); //Ähh, ich habe versucht Oschust zu befragen. Leider ist er dabei verstorben und ...
	AI_Output(self, hero, "Info_Mod_Dexter_OschustTot_09_01"); //(außer sich) Was ...?! Das hast du ja toll hinbekommen. Nun ... da du so schlau warst: viel Spaß beim Suchen!

	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Dexter war wenig erfreut über Oschusts Ableben. Das Amulett jetzt zu finden wird ein schweres Unterfangen. Ich werde mich wohl alleine auf die Suche machen müssen ...");

	B_StartOtherRoutine	(Mod_7022_BDT_Oschust_MT, "TOT");
	AI_Teleport	(Mod_7022_BDT_Oschust_MT, "TOT");
};

INSTANCE Info_Mod_Dexter_Amulett2Gefunden (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_Amulett2Gefunden_Condition;
	information	= Info_Mod_Dexter_Amulett2Gefunden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Amulett geborgen.";
};

FUNC INT Info_Mod_Dexter_Amulett2Gefunden_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Dexter_OschustAmulett))
	|| (Npc_KnowsInfo(hero, Info_Mod_Dexter_OschustTot)))
	&& (Npc_HasItems(hero, ItAm_MegaAmulett2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_Amulett2Gefunden_Info()
{
	AI_Output(hero, self, "Info_Mod_Dexter_Amulett2Gefunden_15_00"); //Ich habe das Amulett geborgen.
	AI_Output(self, hero, "Info_Mod_Dexter_Amulett2Gefunden_09_01"); //Ausgezeichnet. Gehe nun auf direktem Wege zu dem Verwandlungsmagier Albert und übergib es ihm.

	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Ich soll das Amulett der Extension jetzt dem Verwandlungsmagier Albert überbringen.");
};

INSTANCE Info_Mod_Dexter_AmulettAbgegeben (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_AmulettAbgegeben_Condition;
	information	= Info_Mod_Dexter_AmulettAbgegeben_Info;
	permanent	= 0;
	important	= 0;
	description	= "Albert hat das Amulett erhalten.";
};

FUNC INT Info_Mod_Dexter_AmulettAbgegeben_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Amulett))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_AmulettAbgegeben_Info()
{
	AI_Output(hero, self, "Info_Mod_Dexter_AmulettAbgegeben_15_00"); //Albert hat das Amulett erhalten.
	AI_Output(self, hero, "Info_Mod_Dexter_AmulettAbgegeben_09_01"); //Sehr gut. Hat er dir den Rest des vereinbarten Preises gegeben?

	Info_ClearChoices	(Info_Mod_Dexter_AmulettAbgegeben);

	Info_AddChoice	(Info_Mod_Dexter_AmulettAbgegeben, "Nein, er war noch wütend wegen des gefälschten Schmuckstückes.", Info_Mod_Dexter_AmulettAbgegeben_B);
	if (Npc_HasItems(hero, ItMi_Gold) >= 300)
	&& (Npc_HasItems(hero, ItSc_TrfSheep) >= 1)
	&& (Npc_HasItems(hero, ItSc_TrfKeiler) >= 1)
	{
		Info_AddChoice	(Info_Mod_Dexter_AmulettAbgegeben, "Ja, hier hast du alles.", Info_Mod_Dexter_AmulettAbgegeben_A);
	};
};

FUNC VOID Info_Mod_Dexter_AmulettAbgegeben_C()
{
	AI_Output(self, hero, "Info_Mod_Dexter_AmulettAbgegeben_C_09_00"); //Wie dem auch sei, nachdem ganzen Ärger die letzten Tage muss erst mal ein Ausgleich her. Hier, trink einen Schluck.

	CreateInvItems	(hero, ItFo_Addon_Grog, 1);

	B_UseItem	(hero, ItFo_Addon_Grog);

	AI_Output(self, hero, "Info_Mod_Dexter_AmulettAbgegeben_C_09_01"); //Echter guter Seemannsgrog, den unsere Jungs mal einem Händler auf Khorinis abgenommen haben.
	AI_Output(self, hero, "Info_Mod_Dexter_AmulettAbgegeben_C_09_02"); //Dazu gibt’s noch exquisiten Schinken und knusprig gebratenes Fleisch. Heute Nacht wird durchgezecht ohne Pardon. (lacht)

	CreateInvItems	(self, ItFo_Addon_Grog, 1);

	B_UseItem	(self, ItFo_Addon_Grog);

	Info_ClearChoices	(Info_Mod_Dexter_AmulettAbgegeben);

	AI_StopProcessInfos	(self);

	Mod_Dexter_AmulettParty = 1;
};

FUNC VOID Info_Mod_Dexter_AmulettAbgegeben_B()
{
	AI_Output(hero, self, "Info_Mod_Dexter_AmulettAbgegeben_B_15_00"); //Nein, er war noch wütend wegen des gefälschten Schmuckstückes.
	AI_Output(self, hero, "Info_Mod_Dexter_AmulettAbgegeben_B_09_01"); //Verdammt, das hatte ich fast befürchtet. Naja, trotzdem danke für deine Bemühungen.

	Info_Mod_Dexter_AmulettAbgegeben_C();
};

FUNC VOID Info_Mod_Dexter_AmulettAbgegeben_A()
{
	AI_Output(hero, self, "Info_Mod_Dexter_AmulettAbgegeben_A_15_00"); //Ja, hier hast du alles.

	B_ShowGivenThings	("300 Gold und 2 Spruchrollen gegeben");

	AI_Output(self, hero, "Info_Mod_Dexter_AmulettAbgegeben_A_09_01"); //Ausgezeichnet. Zur Belohnung für deine Dienste um das Lager darfst du die Keilerspruchrolle und 200 Gold behalten.

	B_ShowGivenThings	("200 Gold und 1 Spruchrollen erhalten");

	Npc_RemoveInvItems	(hero, ItMi_Gold, 100);
	Npc_RemoveInvItems	(hero, ItSc_TrfSheep, 1);

	B_GivePlayerXP	(300);

	Info_Mod_Dexter_AmulettAbgegeben_C();
};

INSTANCE Info_Mod_Dexter_BanditenKidnapped (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_BanditenKidnapped_Condition;
	information	= Info_Mod_Dexter_BanditenKidnapped_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_BanditenKidnapped_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oschust_BadOne_You))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_BanditenKidnapped_Info()
{
	AI_Output(self, hero, "Info_Mod_Dexter_BanditenKidnapped_09_00"); //Was ist geschehen, wo sind die anderen Banditen?
	AI_Output(hero, self, "Info_Mod_Dexter_BanditenKidnapped_15_01"); //Es war alles ein Hinterhalt. Oschust hat uns an die Orks verraten.

	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_OschustTot))
	{
		AI_Output(self, hero, "Info_Mod_Dexter_BanditenKidnapped_09_02"); //Was wie ist das möglich? Ich dachte er sei tot ...
		AI_Output(hero, self, "Info_Mod_Dexter_BanditenKidnapped_15_03"); //Nein, die Orks hatten ihn mit magischen Artefakten ausgestattet, die ihn davor bewahrten, endgültig in Beliar’s Reich hinab zu fahren.
	};

	AI_Output(hero, self, "Info_Mod_Dexter_BanditenKidnapped_15_04"); //Die anderen Banditen wurden gefangen genommen, ich konnte mich gerade noch meiner Haut erwehren.
	AI_Output(self, hero, "Info_Mod_Dexter_BanditenKidnapped_09_05"); //Verdammt, das ist eine Katastrophe. Ich muss nachdenken ... Also, es gibt keine Zeit zu verlieren, da unser stark geschwächtes Lager jeder Zeit angegriffen werden kann.
	AI_Output(self, hero, "Info_Mod_Dexter_BanditenKidnapped_09_06"); //Begib dich schnell zur alten Bergfestung. Dort findest du Orks, mit welchen wir in Handlesbeziehungen stehen.
	AI_Output(self, hero, "Info_Mod_Dexter_BanditenKidnapped_09_07"); //Wende dich an Ur Shak. Vielleicht können wir mehr von ihm erfahren.

	if (Npc_KnowsInfo(hero, Info_Mod_Oschust_BadOne_Gnade))
	|| (Npc_KnowsInfo(hero, Info_Mod_Oschust_BadOne_Plan))
	{
		AI_Output(hero, self, "Info_Mod_Dexter_BanditenKidnapped_15_08"); //Ich konnte bereits einiges von Oschust erfahren. Er hat tatsächlich vor bald unser Lager anzugreifen und will sich im Anschluss das Amulett von den Magiern zurückholen.
		AI_Output(hero, self, "Info_Mod_Dexter_BanditenKidnapped_15_09"); //Und den gefangenen Banditen wird es schlecht ergehen ...
		AI_Output(self, hero, "Info_Mod_Dexter_BanditenKidnapped_09_10"); //Hmm, in diesem Fall kannst du dich auch sofort an die Verwandlungsmagier wenden. Sprich mit Albert, aber beeil dich.

		B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Ich sollte mich an den Verwandlungsmagier Albert wenden, um ihm von der Gefahr zu berichten, die auch seinem Lager droht. Vielleicht kriege ich auf diesem Wege Unterstützung ...");
	}
	else
	{
		B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Dexter riet mir, mich an Ur Shak in der alten Bergfestung zu wenden um mehr über die weiteren Pläne zu erfahren.");
	};
};

INSTANCE Info_Mod_Dexter_AngriffVorbei (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_AngriffVorbei_Condition;
	information	= Info_Mod_Dexter_AngriffVorbei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_AngriffVorbei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_FluchtHappy))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_AngriffVorbei_Info()
{
	AI_Output(self, hero, "Info_Mod_Dexter_AngriffVorbei_09_00"); //(außer Atem) Das war im allerletzten Augenblick, aber ihr habt es geschafft.
	
	var int Mod_Survivors;
	Mod_Survivors = 8 - Mod_OC_Esteban - Mod_OC_Miguel - Mod_OC_Logan - Mod_OC_Juan - Mod_OC_Skinner - Mod_OC_Morgahard - Mod_OC_Bandit_01 - Mod_OC_Bandit_02;

	if (Mod_Survivors >= 6)
	{
		AI_Output(self, hero, "Info_Mod_Dexter_AngriffVorbei_09_01"); //Ausgezeichnet, wie ich sehe konntest du auch die meisten retten.
		AI_Output(hero, self, "Info_Mod_Dexter_AngriffVorbei_15_02"); //Ja, es war nicht einfach, aber mit viel Geschick und der Unterstützung der Verwandlungsmagier ist es geglückt.
		AI_Output(self, hero, "Info_Mod_Dexter_AngriffVorbei_09_03"); //Großartige Leistung. Hier hast du 500 Goldmünzen.

		B_GiveInvItems	(self, hero, ItMi_Gold, 500);

		AI_Output(self, hero, "Info_Mod_Dexter_AngriffVorbei_09_04"); //Das muss gefeiert werden. Aber nicht heute.
		AI_Output(self, hero, "Info_Mod_Dexter_AngriffVorbei_09_05"); //So ein Gefecht wie heute reibt sogar den stärksten Banditen auf.

		Mod_AlbertTransforms = 8;

		Mod_Dexter_BanditenParty = Wld_GetDay();
	}
	else if (Mod_Survivors >= 1)
	{
		AI_Output(self, hero, "Info_Mod_Dexter_AngriffVorbei_09_06"); //Ohh, wie ich sehe haben es leider einige nicht geschafft.
		AI_Output(hero, self, "Info_Mod_Dexter_AngriffVorbei_15_07"); //Die Orks haben uns sehr zugesetzt und einige fanden den Tod.
		AI_Output(self, hero, "Info_Mod_Dexter_AngriffVorbei_09_08"); //Sehr bedauerlich, viele gute Männer. Aber im Kampf gegen Horden von Orks ist natürlich mit Verlusten zu rechnen.

		Mod_AlbertTransforms = 9;

		Mod_Dexter_BanditenParty = Wld_GetDay();
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Dexter_AngriffVorbei_09_09"); //Aber wo sind die anderen Banditen. Konntest du den gar keinen von ihnen retten?
		AI_Output(hero, self, "Info_Mod_Dexter_AngriffVorbei_15_10"); //Es waren einfach zu viele Orks, die uns angriffen.
		AI_Output(self, hero, "Info_Mod_Dexter_AngriffVorbei_09_11"); //Das ist eine Katastrophe! Verfluchte Orks! Wie soll es jetzt nur weiter mit unserem Lager gehen ...

		Mod_AlbertTransforms = 7;

		Mod_Dexter_BanditenParty = Wld_GetDay();
	};

	CreateInvItems	(hero, ItAr_BDT_H_01, 1);

	B_ShowGivenThings	("Schwere Banditenrüstung erhalten");

	if (Mod_OC_Miguel == 0)
	{
		B_StartOtherRoutine	(Mod_958_BDT_Miguel_MT, "START");
		Mod_958_BDT_Miguel_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	if (Mod_OC_Juan == 0)
	{
		B_StartOtherRoutine	(Mod_955_BDT_Juan_MT, "START");
		Mod_955_BDT_Juan_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	if (Mod_OC_Logan == 0)
	{
		B_StartOtherRoutine	(Mod_957_BDT_Logan_MT, "START");
		Mod_957_BDT_Logan_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	if (Mod_OC_Skinner == 0)
	{
		B_StartOtherRoutine	(Mod_964_BDT_Skinner_MT, "START");
		Mod_964_BDT_Skinner_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	if (Mod_OC_Morgahard == 0)
	{
		B_StartOtherRoutine	(Mod_790_BDT_Morgahard_MT, "START");
		Mod_790_BDT_Morgahard_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	if (Mod_OC_Bandit_01 == 0)
	{
		B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "START");
		Mod_4074_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	if (Mod_OC_Bandit_02 == 0)
	{
		B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "START");
		Mod_4075_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	if (Mod_OC_Esteban == 0)
	{
		B_StartOtherRoutine	(Mod_948_BDT_Esteban_MT, "START");
		Mod_948_BDT_Esteban_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	};

	B_StartOtherRoutine	(Mod_1120_BDT_Ratford_MT, "START");
	Mod_1120_BDT_Ratford_MT.aivar[AIV_PARTYMEMBER] = FALSE;

	B_StartOtherRoutine	(Mod_961_BDT_Sancho_MT, "START");
	Mod_961_BDT_Sancho_MT.aivar[AIV_PARTYMEMBER] = FALSE;

	B_StartOtherRoutine	(Mod_1121_BDT_Drax_MT, "START");
	Mod_1121_BDT_Drax_MT.aivar[AIV_PARTYMEMBER] = FALSE;

	B_StartOtherRoutine	(Mod_4072_BDT_Bandit_MT, "START");
	Mod_4072_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = FALSE;

	B_StartOtherRoutine	(Mod_4073_BDT_Bandit_MT, "START");
	Mod_4073_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = FALSE;

	B_GivePlayerXP(100+(300*Mod_Survivors));

	B_SetTopicStatus	(TOPIC_MOD_BDT_ORKS, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

FUNC VOID B_Dexter_SayNewArmor()
{
	AI_Output(self, hero, "B_Dexter_SayNewArmor_09_00"); //Diese alte Banditenrüstung mag äußerlich sicherlich nicht den besten Eindruck machen, ist aber wie geschaffen für längere Raubzüge auch in schwierigem Terrain ... und du bist ja viel unterwegs.
	AI_Output(self, hero, "B_Dexter_SayNewArmor_09_01"); //Sie ist aus widerstandsfähigem Material und dicht gewebt, sodass sie allen Einflüssen von Außen gleichermaßen standhält.
	AI_Output(self, hero, "B_Dexter_SayNewArmor_09_02"); //Viel Spaß damit!

	B_GiveInvItems	(self, hero, ItAr_BDT_XL, 1);
};

INSTANCE Info_Mod_Dexter_PartyNachRettung (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_PartyNachRettung_Condition;
	information	= Info_Mod_Dexter_PartyNachRettung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_PartyNachRettung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_AngriffVorbei))
	&& (Mod_AlbertTransforms == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_PartyNachRettung_Info()
{
	AI_Output(self, hero, "Info_Mod_Dexter_PartyNachRettung_09_00"); //(leicht ironisch) Ahh, unser Erretter. Komm her und trink einen Schluck.

	if (Mod_Import_Dexter == LOG_SUCCESS)
	|| (Mod_Import_Dexter == -1)
	{
		AI_Output(self, hero, "Info_Mod_Dexter_PartyNachRettung_09_01"); //Ach übrigens: Es hat etwas gedauert, aber ich habe dich doch erkannt.
		AI_Output(hero, self, "Info_Mod_Dexter_PartyNachRettung_15_02"); //Dann weißt du, dass ich damals den Schl ...
		AI_Output(self, hero, "Info_Mod_Dexter_PartyNachRettung_09_03"); //Ja, wie du mir damals das Rezept für den Trank  vom verrückten Kalom besorgt hast. Ich habe hier etwas davon. Nimm einen Schluck ...

		B_GiveInvItems	(self, hero, ItPo_KalomsTrank, 1);

		B_UseItem	(hero, ItPo_KalomsTrank);
	}
	else
	{
		B_GiveInvItems	(self, hero, ItFo_Booze, 1);

		B_UseItem	(hero, ItFo_Booze);

		AI_Output(self, hero, "Info_Mod_Dexter_PartyNachRettung_09_04"); //Ich habe da etwas Nettes für dich herausgestöbert.

		B_Dexter_SayNewArmor();
	};

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Dexter_Wolkenwelt (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_Wolkenwelt_Condition;
	information	= Info_Mod_Dexter_Wolkenwelt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_Wolkenwelt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_PartyNachRettung))
	&& (Mod_CrazyRabbit >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_Wolkenwelt_Info()
{
	AI_Output(self, hero, "Info_Mod_Dexter_Wolkenwelt_09_00"); //Da bist du ja wieder. Während du im Land der Träume unterwegs warst, habe ich etwas Nettes für dich herausgestöbert.

	B_Dexter_SayNewArmor();

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Dexter_Alissandro (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_Alissandro_Condition;
	information	= Info_Mod_Dexter_Alissandro_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_Alissandro_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_Alissandro))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_Alissandro_Info()
{
	AI_Output(self, hero, "Info_Mod_Dexter_Alissandro_09_00"); //Was geht hier vor?
	AI_Output(hero, self, "Info_Mod_Dexter_Alissandro_15_01"); //Die Wache will mich nicht reinlassen ohne Passwort.
	AI_Output(self, hero, "Info_Mod_Dexter_Alissandro_09_02"); //Ich kenne dich, du kannst reinkommen. Lass uns ins Lager gehen, dort können wir besser reden.

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Dexter_Botschaft (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_Botschaft_Condition;
	information	= Info_Mod_Dexter_Botschaft_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe eine Botschaft von Alissandro.";
};

FUNC INT Info_Mod_Dexter_Botschaft_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Alissandro))
	&& (Npc_HasItems(hero, ItWr_AliBotschaft) == 1)
	&& (Npc_GetDistToWP(self, "LOCATION_11_12_09") < 2000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_Botschaft_Info()
{
	AI_Output(hero, self, "Info_Mod_Dexter_Botschaft_15_00"); //Ich habe eine Botschaft von Alissandro.

	B_GiveInvItems	(hero, self, ItWr_AliBotschaft, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Dexter_Botschaft_09_01"); //Gut, was ist mit dem eigentlichen Botschafter passiert?
	AI_Output(hero, self, "Info_Mod_Dexter_Botschaft_15_02"); //Er lag tot vor dem Lager. Das ist der Grund warum ich hier bin. Habt ihr etwas bemerkt?
	AI_Output(self, hero, "Info_Mod_Dexter_Botschaft_09_03"); //Bartholos Leute wollten uns auch schon auf ihre Seite ziehen und waren vor wenigen Tagen hier.

	B_RemoveNpc	(Mod_943_GRD_Bloodwyn_MT);

	Wld_InsertNpc	(Mod_1876_EBR_Bloodwyn_MT, "LOCATION_11_05");
	Wld_InsertNpc	(Mod_1877_GRD_Gardist_MT, "LOCATION_11_05");
	Wld_InsertNpc	(Mod_1878_GRD_Gardist_MT, "LOCATION_11_05");
};

INSTANCE Info_Mod_Dexter_Plan (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_Plan_Condition;
	information	= Info_Mod_Dexter_Plan_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du einen Plan?";
};

FUNC INT Info_Mod_Dexter_Plan_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bloodwyn_EBR_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_Plan_Info()
{
	AI_Output(hero, self, "Info_Mod_Dexter_Plan_15_00"); //Hast du einen Plan?
	AI_Output(self, hero, "Info_Mod_Dexter_Plan_09_01"); //Unter Umständen, ist allerdings ziemlich riskant.
	AI_Output(hero, self, "Info_Mod_Dexter_Plan_15_02"); //Und wie lautet er?
	AI_Output(self, hero, "Info_Mod_Dexter_Plan_09_03"); //Gegen alle Gardisten zusammen haben wir keine Chance, wir müssen sie alle auf einen Streich töten.
	AI_Output(hero, self, "Info_Mod_Dexter_Plan_15_04"); //Und wie sollen wir das schaffen?
	AI_Output(self, hero, "Info_Mod_Dexter_Plan_09_05"); //Mach einfach das, was ich sage. Als erstes lockst du einen Gardisten zu mir. Ich belege ihn mit einer "Schlaf" Spruchrolle.
	AI_Output(hero, self, "Info_Mod_Dexter_Plan_15_06"); //Wie soll ich ihn anlocken?
	AI_Output(self, hero, "Info_Mod_Dexter_Plan_09_07"); //Alle Gardisten bewachen den Eingang, deshalb ist es schwer, einen wegzulocken. Allerdings ist einer etwas innerhalb des Lagers und sieht nach dem Rechten. Greif ihn an und locke ihn zu mir.

	B_LogEntry	(TOPIC_MOD_AL_BOTSCHAFTER, "Dexter hat einen Plan: Ich soll erstmal den Gardisten, der Wache hält, angreifen und zu Dexter locken.");
};

INSTANCE Info_Mod_Dexter_Gardist (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_Gardist_Condition;
	information	= Info_Mod_Dexter_Gardist_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_Gardist_Condition()
{
	if (Mod_LocktGardistZuDexter == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_Gardist_Info()
{
	AI_Output(self, hero, "Info_Mod_Dexter_Gardist_09_00"); //So, nun müssen wir warten, bis seine Kollegen nachschauen, was mit ihm passiert ist. In der Zeit brauchen wir eine "Feuerregen" Spruchrolle. Ich habe für Notfälle eine in meiner Truhe.
	AI_Output(self, hero, "Info_Mod_Dexter_Gardist_09_01"); //Meine Truhe steht in der Höhle. Ich bleibe in der Zeit hier und warte auf die Gardisten. Wenn ich das Signal gebe, zündest du die Spruchrolle.

	Mob_CreateItems	("DEXTERSTRUHE", ItSc_FireRain, 1);

	B_StartOtherRoutine	(Mod_964_BDT_Skinner_MT, "HOEHLE");
	B_StartOtherRoutine	(Mod_948_BDT_Esteban_MT, "HOEHLE");
	B_StartOtherRoutine	(Mod_790_BDT_Morgahard_MT, "HOEHLE");
	B_StartOtherRoutine	(Mod_957_BDT_Logan_MT, "HOEHLE");
	B_StartOtherRoutine	(Mod_958_BDT_Miguel_MT, "HOEHLE");
	B_StartOtherRoutine	(Mod_955_BDT_Juan_MT, "HOEHLE");
	B_StartOtherRoutine	(Mod_7023_BDT_Quentin_MT, "HOEHLE");

	B_StartOtherRoutine	(Mod_1877_GRD_Gardist_MT, "FEUERREGEN");
	B_StartOtherRoutine	(Mod_1878_GRD_Gardist_MT, "FEUERREGEN");
	B_StartOtherRoutine	(Mod_1879_GRD_Gardist_MT, "FEUERREGEN");
	B_StartOtherRoutine	(Mod_1880_GRD_Gardist_MT, "FEUERREGEN");
	B_StartOtherRoutine	(Mod_1881_GRD_Gardist_MT, "FEUERREGEN");
	B_StartOtherRoutine	(Mod_1882_GRD_Gardist_MT, "FEUERREGEN");
	B_StartOtherRoutine	(Mod_1883_GRD_Gardist_MT, "FEUERREGEN");
	B_StartOtherRoutine	(Mod_1884_GRD_Gardist_MT, "FEUERREGEN");
	B_StartOtherRoutine	(Mod_1885_GRD_Gardist_MT, "FEUERREGEN");
	B_StartOtherRoutine	(Mod_1886_GRD_Gardist_MT, "FEUERREGEN");
	B_StartOtherRoutine	(Mod_1887_GRD_Gardist_MT, "FEUERREGEN");
	B_StartOtherRoutine	(Mod_1888_GRD_Gardist_MT, "FEUERREGEN");
	B_StartOtherRoutine	(Mod_1889_GRD_Gardist_MT, "FEUERREGEN");
	B_StartOtherRoutine	(Mod_1890_GRD_Gardist_MT, "FEUERREGEN");
	B_StartOtherRoutine	(Mod_1108_GRD_Bullit_MT, "FEUERREGEN");
};

INSTANCE Info_Mod_Dexter_Jetzt (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_Jetzt_Condition;
	information	= Info_Mod_Dexter_Jetzt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_Jetzt_Condition()
{
	if (Mob_HasItems("DEXTERSTRUHE", ItSc_FireRain) == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Dexter_Gardist))
	&& (Npc_GetDistToWP(Mod_1108_GRD_Bullit_MT, "LOCATION_11_08") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_Jetzt_Info()
{
	AI_Output(self, hero, "Info_Mod_Dexter_Jetzt_09_00"); //Jetzt, ich versteck mich solange in der Höhle.
	
	B_StartOtherRoutine	(self, "HOEHLE");
};

INSTANCE Info_Mod_Dexter_Feuerregen (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_Feuerregen_Condition;
	information	= Info_Mod_Dexter_Feuerregen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_Feuerregen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Jetzt))
	&& (Npc_IsDead(Mod_1108_GRD_Bullit_MT))
	&& (Npc_IsDead(Mod_1877_GRD_Gardist_MT))
	&& (Npc_IsDead(Mod_1878_GRD_Gardist_MT))
	&& (Npc_IsDead(Mod_1879_GRD_Gardist_MT))
	&& (Npc_IsDead(Mod_1880_GRD_Gardist_MT))
	&& (Npc_IsDead(Mod_1881_GRD_Gardist_MT))
	&& (Npc_IsDead(Mod_1882_GRD_Gardist_MT))
	&& (Npc_IsDead(Mod_1883_GRD_Gardist_MT))
	&& (Npc_IsDead(Mod_1884_GRD_Gardist_MT))
	&& (Npc_IsDead(Mod_1885_GRD_Gardist_MT))
	&& (Npc_IsDead(Mod_1886_GRD_Gardist_MT))
	&& (Npc_IsDead(Mod_1887_GRD_Gardist_MT))
	&& (Npc_IsDead(Mod_1888_GRD_Gardist_MT))
	&& (Npc_IsDead(Mod_1889_GRD_Gardist_MT))
	&& (Npc_IsDead(Mod_1890_GRD_Gardist_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_Feuerregen_Info()
{
	AI_Output(self, hero, "Info_Mod_Dexter_Feuerregen_09_00"); //Wir haben gewonnen! Wir werden uns Alissandro anschliessen. Gehe zu ihm und berichte ihm das.
	
	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_964_BDT_Skinner_MT, "START");
	B_StartOtherRoutine	(Mod_948_BDT_Esteban_MT, "START");
	B_StartOtherRoutine	(Mod_790_BDT_Morgahard_MT, "START");
	B_StartOtherRoutine	(Mod_957_BDT_Logan_MT, "START");
	B_StartOtherRoutine	(Mod_958_BDT_Miguel_MT, "START");
	B_StartOtherRoutine	(Mod_955_BDT_Juan_MT, "START");
	B_StartOtherRoutine	(Mod_7023_BDT_Quentin_MT, "START");

	B_LogEntry	(TOPIC_MOD_AL_BOTSCHAFTER, "Ich habe den Feuerregen gezündet, alle Gardisten sind tot. Dexter und seine Leute schliessen sich uns an. Ich werde das Alissandro berichten.");
};

INSTANCE Info_Mod_Dexter_Eroberung_05 (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_Eroberung_05_Condition;
	information	= Info_Mod_Dexter_Eroberung_05_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_Eroberung_05_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Makanius_Eroberung_04))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_Eroberung_05_Info()
{
	AI_Output(self, hero, "Info_Mod_Dexter_Eroberung_05_09_00"); //Dann dringen wir ...

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Dexter_Eroberung_07 (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_Eroberung_07_Condition;
	information	= Info_Mod_Dexter_Eroberung_07_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_Eroberung_07_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Hymir_Eroberung_06))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_Eroberung_07_Info()
{
	AI_Output(self, hero, "Info_Mod_Dexter_Eroberung_07_09_00"); //... und treten Bartholo und seinen Leuten in den Arsch.
};

var int Dexter_LastPetzCounter;
var int Dexter_LastPetzCrime;

INSTANCE Info_Mod_Dexter_PMSchulden (C_INFO)
{
	npc         	= Mod_761_BDT_Dexter_MT;
	nr          	= 1;
	condition   	= Info_Mod_Dexter_PMSchulden_Condition;
	information 	= Info_Mod_Dexter_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Dexter_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Dexter_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Dexter_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Dexter_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_00"); //Bist du gekommen, um deine Strafe zu zahlen?

	if (B_GetTotalPetzCounter(self) > Dexter_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_01"); //Ich hatte mich schon gefragt, ob du es überhaupt noch wagst, hierher zu kommen!
		AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_02"); //Anscheinend ist es nicht bei den letzten Anschuldigungen geblieben!

		if (Dexter_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_03"); //Ich hatte dich gewarnt! Die Strafe, die du jetzt zahlen musst, ist höher!
			AI_Output (hero, self, "Info_Mod_Dexter_PMAdd_15_00"); //Wieviel?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Dexter_LastPetzCounter);
		
			if (diff > 0)
			{
				Dexter_Schulden = Dexter_Schulden + (diff * 50);
			};
		
			if (Dexter_Schulden > 1000)	{	Dexter_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Dexter_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_04"); //Du hast mich schwer enttäuscht!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Dexter_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_05"); //Es haben sich einige neue Dinge ergeben.
		
		if (Dexter_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_06"); //Plötzlich gibt es niemanden mehr, der dich des Mordes bezichtigt.
		};
		
		if (Dexter_LastPetzCrime == CRIME_THEFT)
		|| ( (Dexter_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_07"); //Niemand erinnert sich mehr, dich bei einem Diebstahl gesehen zu haben.
		};
		
		if (Dexter_LastPetzCrime == CRIME_ATTACK)
		|| ( (Dexter_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_08"); //Es gibt keine Zeugen mehr dafür, dass du jemals in eine Schlägerei verwickelt warst.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_09"); //Anscheinend haben sich alle Anklagen gegen dich in Wohlgefallen aufgelöst.
		};
		
		AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_10"); //Ich weiß nicht, was da gelaufen ist, aber ich warne dich: Spiel keine Spielchen mit mir.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_11"); //Ich habe mich jedenfalls entschieden, dir deine Schulden zu erlassen.
			AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_12"); //Sieh zu, dass du nicht wieder in Schwierigkeiten kommst.
	
			Dexter_Schulden			= 0;
			Dexter_LastPetzCounter 	= 0;
			Dexter_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_13"); //Damit eins klar ist: Deine Strafe musst du trotzdem in voller Höhe zahlen.
			B_Say_Gold (self, hero, Dexter_Schulden);
			AI_Output (self, hero, "Info_Mod_Dexter_PMSchulden_09_14"); //Also, was ist?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Dexter_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Dexter_PETZMASTER);
		Info_AddChoice		(Info_Mod_Dexter_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Dexter_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Dexter_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Dexter_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Dexter_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Dexter_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Dexter_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Dexter_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Dexter_PMSchulden_HowMuchAgain_15_00"); //Wie viel war es noch mal?
	B_Say_Gold (self, hero, Dexter_Schulden);

	Info_ClearChoices  	(Info_Mod_Dexter_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Dexter_PETZMASTER);
	Info_AddChoice		(Info_Mod_Dexter_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Dexter_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Dexter_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Dexter_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Dexter_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Dexter_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Dexter_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Dexter_PETZMASTER   (C_INFO)
{
	npc         	= Mod_761_BDT_Dexter_MT;
	nr          	= 1;
	condition   	= Info_Mod_Dexter_PETZMASTER_Condition;
	information 	= Info_Mod_Dexter_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Dexter_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Dexter_PETZMASTER_Info()
{
	Dexter_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_01"); //Gut, dass du zu mir kommst, bevor alles noch schlimmer für dich wird.
		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_02"); //Mord ist ein schweres Vergehen!

		Dexter_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Dexter_Schulden = Dexter_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_03"); //Ganz zu schweigen von den anderen Sachen, die du angerichtet hast.
		};

		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_06"); //Ich habe kein Interesse daran, dich an den Galgen zu bringen.
		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_07"); //Aber es wird nicht leicht sein, die Leute wieder gnädig zu stimmen.
		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_08"); //Du könntest deine Reue zeigen, indem du eine Strafe zahlst - natürlich muss die Strafe angemessen hoch sein.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_09"); //Gut, dass du kommst! Du wirst des Diebstahls bezichtigt! Es gibt Zeugen!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_10"); //Von den anderen Dingen, die mir zu Ohren gekommen sind, will ich gar nicht erst reden.
		};

		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_11"); //Ich werde so ein Verhalten hier nicht dulden!
		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_12"); //Du wirst eine Strafe zahlen müssen, um dein Verbrechen wieder gutzumachen!
		
		Dexter_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_13"); //Wenn du dich mit der Miliz oder sonstwem herumprügelst, ist das eine Sache ...
		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_14"); //Aber wenn du unsere Leute angreifst, muss ich dich zur Rechenschaft ziehen.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_15"); //Und die Sache mit den Schafen musste wohl auch nicht sein.
		};

		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_16"); //Wenn ich dir das durchgehen lasse, macht hier bald jeder, was er will.
		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_17"); //Also wirst du eine angemessene Strafe zahlen - und die Sache ist vergessen.
		
		Dexter_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_18"); //Mir ist zu Ohren gekommen, du hättest dich an unseren Schafen vergriffen.
		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_19"); //Dir ist klar, dass ich das nicht durchgehen lassen kann.
		AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_09_20"); //Du wirst eine Entschädigung zahlen müssen!
		
		Dexter_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Dexter_PETZMASTER_15_21"); //Wie viel?
	
	if (Dexter_Schulden > 1000)	{	Dexter_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Dexter_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Dexter_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Dexter_PETZMASTER);
	Info_AddChoice		(Info_Mod_Dexter_PETZMASTER,"Ich habe nicht genug Gold!",Info_Mod_Dexter_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Dexter_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Dexter_PETZMASTER,"Ich will die Strafe zahlen.",Info_Mod_Dexter_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Dexter_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Dexter_PETZMASTER_PayNow_15_00"); //Ich will die Strafe zahlen!
	B_GiveInvItems (hero, self, itmi_gold, Dexter_Schulden);
	AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_PayNow_09_01"); //Gut! Ich werde dafür sorgen, dass es jeder von uns erfährt - damit wäre dein Ruf einigermaßen wiederhergestellt.

	B_GrantAbsolution (LOC_BANDIT);
	
	Dexter_Schulden			= 0;
	Dexter_LastPetzCounter 	= 0;
	Dexter_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Dexter_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Dexter_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Dexter_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Dexter_PETZMASTER_PayLater_15_00"); //Ich habe nicht genug Gold!
	AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_PayLater_09_01"); //Dann sieh zu, dass du das Gold so schnell wie möglich beschaffst.
	AI_Output (self, hero, "Info_Mod_Dexter_PETZMASTER_PayLater_09_02"); //Und ich warne dich: Wenn du dir noch was zu schulden kommen lässt, wird die Sache noch schlimmer für dich!
	
	Dexter_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Dexter_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Dexter_Pickpocket (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_Pickpocket_Condition;
	information	= Info_Mod_Dexter_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Dexter_Pickpocket_Condition()
{
	C_Beklauen	(85, ItMi_Gold, 630);
};

FUNC VOID Info_Mod_Dexter_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Dexter_Pickpocket);

	Info_AddChoice	(Info_Mod_Dexter_Pickpocket, DIALOG_BACK, Info_Mod_Dexter_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Dexter_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Dexter_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Dexter_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Dexter_Pickpocket);
};

FUNC VOID Info_Mod_Dexter_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Dexter_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Dexter_Pickpocket);

		Info_AddChoice	(Info_Mod_Dexter_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Dexter_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Dexter_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Dexter_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Dexter_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Dexter_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Dexter_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Dexter_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Dexter_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Dexter_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Dexter_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Dexter_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Dexter_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Dexter_EXIT (C_INFO)
{
	npc		= Mod_761_BDT_Dexter_MT;
	nr		= 1;
	condition	= Info_Mod_Dexter_EXIT_Condition;
	information	= Info_Mod_Dexter_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Dexter_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dexter_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};