INSTANCE Info_Mod_Henry_Hi (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_Hi_Condition;
	information	= Info_Mod_Henry_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Henry_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Henry_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Henry_Hi_04_00"); //Was beim Klabautermann willst du denn hier?
	AI_Output(hero, self, "Info_Mod_Henry_Hi_15_01"); //Ich weiß nicht genau ... kommt drauf an, was es hier gibt.
	AI_Output(self, hero, "Info_Mod_Henry_Hi_04_02"); //Was es hier gibt? Ein Lager mit Typen, denen es schon in den Fingern juckt, wenn sie dich nur sehen.
	AI_Output(self, hero, "Info_Mod_Henry_Hi_04_03"); //Ich habe keine Ahnung woher du kommst und wer du bist ... interessiert mich auch nicht.
	AI_Output(self, hero, "Info_Mod_Henry_Hi_04_04"); //Aber unter uns Freibeutern schrubben wir mit Waschlappen wie dir den Kiel unseres Schiffes.
	AI_Output(self, hero, "Info_Mod_Henry_Hi_04_05"); //Tu dir also selbst einen gefallen, dreh dich wieder um und verpiss dich.
	AI_Output(self, hero, "Info_Mod_Henry_Hi_04_06"); //Hier haben nur ganze Kerle mit Salzwasser im Blut was verloren.

	Info_ClearChoices	(Info_Mod_Henry_Hi);

	Info_AddChoice	(Info_Mod_Henry_Hi, "Wenn du gleich etwas Blut verloren hast, wirst du die Sache vielleicht anders sehen!", Info_Mod_Henry_Hi_B);
	Info_AddChoice	(Info_Mod_Henry_Hi, "Ich bin kein Waschlappen!", Info_Mod_Henry_Hi_A);
};

FUNC VOID Info_Mod_Henry_Hi_C()
{
	AI_Output(self, hero, "Info_Mod_Henry_Hi_C_04_00"); //Ich sag dir was: Bevor ich nachher hier noch ne riesen Sauerei wegwischen muss, erledigst du eine kleine Sache für mich und dann reden wir nochmal über alles.
	AI_Output(self, hero, "Info_Mod_Henry_Hi_C_04_01"); //Also, links von hier befindet sich ein Canyon. Dort gehst du hin und holst mir 'n Stück Beißerfleisch. Kapiert?
	AI_Output(hero, self, "Info_Mod_Henry_Hi_C_15_02"); //Ok, sollte ich hinbekommen.

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Henry_Hi_C_04_03"); //(Leise zu sich selbst) Hmm, nachher kommt er tatsächlich wieder und nervt weiter ...

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Henry_Hi_C_04_04"); //(wieder zum Helden) .. achja, und wenn du schon im Canyon bist, kannst du mir auch gleich noch ... eine Flasche Milch von dort bringen ...
	AI_Output(hero, self, "Info_Mod_Henry_Hi_C_15_05"); //Was?! Ahh, du Spaßvogel ...
	AI_Output(self, hero, "Info_Mod_Henry_Hi_C_04_06"); //Spaßvogel?! Du hörst gleich die Vögel zwitschern, wenn ich dir eine mit der stumpfen Seite meines Schwertes verpasse.
	AI_Output(hero, self, "Info_Mod_Henry_Hi_C_15_07"); //Aber was ...
	AI_Output(self, hero, "Info_Mod_Henry_Hi_C_04_08"); //Nix, aber. Im Canyon treiben sich immer wieder Herden von Wildziegen herum. Von einer mit vollen Eutern wirst du mir eine Flasche Ziegenmlich holen.
	AI_Output(hero, self, "Info_Mod_Henry_Hi_C_15_09"); //Dann soll ich jetzt also für dich Ziegen melken?!
	AI_Output(self, hero, "Info_Mod_Henry_Hi_C_04_10"); //Wer hat denn was von melken gesagt, du Penner?! Obwohl, wenn ich dich so ansehe siehst du mir eher aus wie eine Küchenmagd, als wie ein Kerl, hähä.
	AI_Output(self, hero, "Info_Mod_Henry_Hi_C_04_11"); //Aber kannst es ja mal versuchen, eine von diesen Ziegen zu melken, solange sie noch lebt, hähähä.
	AI_Output(self, hero, "Info_Mod_Henry_Hi_C_04_12"); //Beim Barte des Käptns, dafür würde ich dir doch glatt all mein Gold geben und noch mein Schwert drauflegen, hahaha.
	AI_Output(self, hero, "Info_Mod_Henry_Hi_C_04_13"); //Aber genug von dem Blödsinn. Wenn du die Ziege umgehauen hast, durchbohrst du einfach ihren Euter und lässt die Milch in eine Flasche laufen. Kapiert?
	AI_Output(self, hero, "Info_Mod_Henry_Hi_C_04_14"); //Und jetzt verzieh dich und komm erst wieder, wenn du alles dabei hast.

	Info_ClearChoices	(Info_Mod_Henry_Hi);

	Wld_InsertNpc	(Canyon_Ziege_Euter,	"ADW_CANYON_PATH_TO_BANDITS_36");

	Log_CreateTopic	(TOPIC_MOD_HENRY_BEISSER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_HENRY_BEISSER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_HENRY_BEISSER, "Henry lässt mich erst ins Lager wenn ich ihm ein Stück Fleisch bringe. Ich soll außerdem die Milch einer Wildziege besorgen.");
};

FUNC VOID Info_Mod_Henry_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Henry_Hi_B_15_00"); //Wenn du gleich etwas Blut verloren hast, wirst du die Sache vielleicht anders sehen!
	AI_Output(self, hero, "Info_Mod_Henry_Hi_B_04_01"); //Sieh an, wir haben hier einen Helden ... einen ziemlich dummen Helden.
	AI_Output(self, hero, "Info_Mod_Henry_Hi_B_04_02"); //Du glaubst wohl, du kannst hier einfach einen auf dicke Hose machen und ich lasse dich rein?
	AI_Output(self, hero, "Info_Mod_Henry_Hi_B_04_03"); //Das einzige was gleich reingeht ist meine Klinge in deinen Bauch ... und die meiner Kollegen, wenn sie noch ein Stück von dir abhaben wollen.

	Info_Mod_Henry_Hi_C();
};

FUNC VOID Info_Mod_Henry_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Henry_Hi_A_15_00"); //Ich bin kein Waschlappen!
	AI_Output(self, hero, "Info_Mod_Henry_Hi_A_04_01"); //Ja, stimmt ... der ist zumindest zu was zu gebrauchen. Was aber sollen wir hier mit so einem dreckigen Landstreicher wie dir im Lager anfangen?
	AI_Output(self, hero, "Info_Mod_Henry_Hi_A_04_02"); //Den Eingang unseres Lagers mit rot streichen, falls mal feine Gesellschaft bei uns vorbeischaut?

	Info_Mod_Henry_Hi_C();
};

INSTANCE Info_Mod_Henry_Fleisch (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_Fleisch_Condition;
	information	= Info_Mod_Henry_Fleisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab alles ...";
};

FUNC INT Info_Mod_Henry_Fleisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Henry_Hi))
	&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 1)
	&& (Npc_HasItems(hero, ItFo_Ziegenmilch_Bloody) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henry_Fleisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Henry_Fleisch_15_00"); //Ich hab alles ...
	
	B_GiveInvItems	(hero, self, ItFo_MuttonRaw, 1);

	AI_Output(self, hero, "Info_Mod_Henry_Fleisch_04_01"); //Na, dann lass mal sehen.

	Npc_RemoveInvItems	(hero, ItFo_MuttonRaw, 1);
	Npc_RemoveInvItems	(hero, ItFo_Ziegenmilch_Bloody, 1);

	B_ShowGivenThings	("Fleisch und blutige Ziegenmilch gegeben");

	CreateInvItems	(self, ItFo_Milk, 1);

	B_UseItem	(self, ItFo_Milk);

	AI_Output(self, hero, "Info_Mod_Henry_Fleisch_04_02"); //Ahh, es geht doch nichts über einen guten Schluck blutiger Ziegenmlich.
	AI_Output(self, hero, "Info_Mod_Henry_Fleisch_04_03"); //Nichts für ungut. Du scheinst doch nicht so 'n Weichei zu sein, wie ich zuerst dachte, wenn du es mit den ganzen Viechern aufgenommen hast.
	AI_Output(hero, self, "Info_Mod_Henry_Fleisch_15_04"); //Dann kann ich jetzt also rein?
	AI_Output(self, hero, "Info_Mod_Henry_Fleisch_04_05"); //Da will ich mal nicht so sein. Ich dachte zuerst, du wärest ein mickriger Laufbursche dieser Magier, der hier nur etwas rumschnüffeln will.
	AI_Output(self, hero, "Info_Mod_Henry_Fleisch_04_06"); //Du scheinst aber vielleicht doch was draufzuhaben ... hast auch keine Angst davor, dir auch mal deine Fingerchen bei der Jagd schmutzig zu machen.
	AI_Output(self, hero, "Info_Mod_Henry_Fleisch_04_07"); //Für einen wie dich könnten wir vielleicht noch Verwendung in unserem Lager finden ... falls dich der Käptn nicht zum Frühstück verspeist, hähähä.
	AI_Output(self, hero, "Info_Mod_Henry_Fleisch_04_08"); //Na gut, dann meld dich mal bei Greg. Er wird schon was für dich zu tun haben.

	B_LogEntry	(TOPIC_MOD_HENRY_BEISSER, "Ich hab Henry das Fleisch und die Milch gebracht. Jetzt soll ich zu Greg gehen.");
	B_SetTopicStatus	(TOPIC_MOD_HENRY_BEISSER, LOG_SUCCESS);

	B_GivePlayerXP	(600);

	AI_StopProcessInfos	(self);

	B_Göttergefallen(2, 1);

	self.aivar[AIV_PASSGATE] = TRUE;
};

INSTANCE Info_Mod_Henry_Entertrupp (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_Entertrupp_Condition;
	information	= Info_Mod_Henry_Entertrupp_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, du bist doch einer der Entertruppführer!";
};

FUNC INT Info_Mod_Henry_Entertrupp_Condition()
{
	if (Mod_InEntertrupp == 0)
	&& (Piraten_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henry_Entertrupp_Info()
{
	AI_Output(hero, self, "Info_Mod_Henry_Entertrupp_15_00"); //Hey, du bist doch einer der Entertruppführer!
	AI_Output(self, hero, "Info_Mod_Henry_Entertrupp_04_01"); //Ich bin nicht einer sondern DER Entertruppführer Jungchen!
	AI_Output(self, hero, "Info_Mod_Henry_Entertrupp_04_02"); //Was willst du?
	AI_Output(hero, self, "Info_Mod_Henry_Entertrupp_15_03"); //Ich will in deinen Entertrupp.
	AI_Output(self, hero, "Info_Mod_Henry_Entertrupp_04_04"); //Jeder will in meinen Entertrupp.
	AI_Output(self, hero, "Info_Mod_Henry_Entertrupp_04_05"); //Wenn dir das ernst ist musst du zeigen was du drauf hast!
	AI_Output(hero, self, "Info_Mod_Henry_Entertrupp_15_06"); //Was soll ich tun?
	AI_Output(self, hero, "Info_Mod_Henry_Entertrupp_04_07"); //Zuerst holst du mir mal 'ne Flasche Grog, dann reden wir weiter.
	AI_Output(hero, self, "Info_Mod_Henry_Entertrupp_15_08"); //Und wo krieg ich den her?
	AI_Output(self, hero, "Info_Mod_Henry_Entertrupp_04_09"); //Weiter hinten, in der Höhle, ist Samuels Hexenküche.

	Log_CreateTopic	(TOPIC_MOD_HENRY_ENTERTRUPP, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_HENRY_ENTERTRUPP, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_HENRY_ENTERTRUPP, "Um in Henrys Entertrupp zu kommen soll ich ihm erstmal 'ne Flasche Grog besorgen.");

	AI_Teleport	(Mod_940_PIR_Samuel_AW, "ADW_PIRATECAMP_TOWER_BED");
	B_StartOtherRoutine	(Mod_940_PIR_Samuel_AW, "ENTER");
	AI_Teleport	(Mod_940_PIR_Samuel_AW, "ADW_PIRATECAMP_TOWER_BED");
};

INSTANCE Info_Mod_Henry_SamuelWeg (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_SamuelWeg_Condition;
	information	= Info_Mod_Henry_SamuelWeg_Info;
	permanent	= 0;
	important	= 0;
	description	= "Samuel ist nicht da.";
};

FUNC INT Info_Mod_Henry_SamuelWeg_Condition()
{
	if (Mod_SamuelIstWeg == 1)
	&& (Mod_InEntertrupp == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henry_SamuelWeg_Info()
{
	AI_Output(hero, self, "Info_Mod_Henry_SamuelWeg_15_00"); //Samuel ist nicht da.
	AI_Output(self, hero, "Info_Mod_Henry_SamuelWeg_04_01"); //Genau da liegt das Problem! Ohne Samuel kein Grog.
	AI_Output(self, hero, "Info_Mod_Henry_SamuelWeg_04_02"); //Und du wirst dafür sorgen, dass ich meinen Grog bekomme.
	AI_Output(hero, self, "Info_Mod_Henry_SamuelWeg_15_03"); //Und woher soll ich Grog bekommen?
	AI_Output(self, hero, "Info_Mod_Henry_SamuelWeg_04_04"); //Am besten du siehst dich in Samuels Höhle um. Da muss irgendwo das Rezept liegen.
	AI_Output(hero, self, "Info_Mod_Henry_SamuelWeg_15_05"); //Mach ich.
	AI_Output(self, hero, "Info_Mod_Henry_SamuelWeg_04_06"); //Un wehe du bringst mir so 'nen billigen Fusel.

	B_LogEntry	(TOPIC_MOD_HENRY_ENTERTRUPP, "Wie es scheint soll ich Henrys Grog selber brennen.");

	Wld_InsertItem	(Mod_SamuelsGrogRezept, "FP_PIRATESCAMP_INSERT_NOTIZ");
};

INSTANCE Info_Mod_Henry_HierGrog (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_HierGrog_Condition;
	information	= Info_Mod_Henry_HierGrog_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich hab Grog.";
};

FUNC INT Info_Mod_Henry_HierGrog_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Henry_SamuelWeg))
	&& (Mod_QuatschGrog == 0)
	&& (Mod_InEntertrupp == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henry_HierGrog_Info()
{
	AI_Output(hero, self, "Info_Mod_Henry_HierGrog_15_00"); //Ich hab Grog.

	Info_ClearChoices	(Info_Mod_Henry_HierGrog);

	Info_AddChoice	(Info_Mod_Henry_HierGrog, "Ich hab nichts.", Info_Mod_Henry_HierGrog_BACK);

	if (Npc_HasItems(hero, Mod_RealGrog) > 0)
	{
		Info_AddChoice	(Info_Mod_Henry_HierGrog, "Selbstgebrannter Grog", Info_Mod_Henry_HierGrog_Own);
	};
	if (Npc_HasItems(hero, ItFo_Addon_Grog) > 0)
	{
		Info_AddChoice	(Info_Mod_Henry_HierGrog, "Normaler Grog", Info_Mod_Henry_HierGrog_Fusel);
	};
};

FUNC VOID Info_Mod_Henry_HierGrog_BACK()
{
	AI_Output(hero, self, "Info_Mod_Henry_HierGrog_BACK_15_00"); //Ich hab nichts.
	AI_Output(self, hero, "Info_Mod_Henry_HierGrog_BACK_04_01"); //Dann lass mich in Ruhe.

	Info_ClearChoices	(Info_Mod_Henry_HierGrog);
};

FUNC VOID Info_Mod_Henry_HierGrog_Own()
{
	B_GiveInvItems	(hero, self, Mod_RealGrog, 1);

	B_UseItem	(self, Mod_RealGrog);

	AI_Output(self, hero, "Info_Mod_Henry_HierGrog_Own_04_00"); //Das ist doch mal ein Grog!
	AI_Output(self, hero, "Info_Mod_Henry_HierGrog_Own_04_01"); //Wer so was brauen kann der kann auch den stärksten Razor umhaun.
	AI_Output(self, hero, "Info_Mod_Henry_HierGrog_Own_04_02"); //Meine Zustimmung hast du!

	if (Mod_InEntertrupp == 0)
	{
		B_LogEntry_More	(TOPIC_MOD_PIRATEN_ENTERTRUPP, TOPIC_MOD_HENRY_ENTERTRUPP, "Ich hab Henrys Zustimmung für die Aufnahme in einen Entertrupp.", "Henry war mit meinem Grog zufrieden. Ich habe seine Zustimmung.");
	}
	else
	{
		B_LogEntry	(TOPIC_MOD_HENRY_ENTERTRUPP, "Henry war mit meinem Grog zufrieden. Ich habe seine Zustimmung.");
	};

	B_SetTopicStatus	(TOPIC_MOD_HENRY_ENTERTRUPP, LOG_SUCCESS);

	Mod_QuatschGrog = 1;

	B_GivePlayerXP	(200);

	B_Göttergefallen(2, 1);

	Info_ClearChoices	(Info_Mod_Henry_HierGrog);
};

FUNC VOID Info_Mod_Henry_HierGrog_Fusel()
{
	B_GiveInvItems	(hero, self, ItFo_Addon_Grog, 1);

	B_UseItem	(self, ItFo_Addon_Grog);

	AI_Output(self, hero, "Info_Mod_Henry_HierGrog_Fusel_04_00"); //Was drehst du mir da für ne Fusel an?
	AI_Output(self, hero, "Info_Mod_Henry_HierGrog_Fusel_04_01"); //Mit sowas putz ich mir noch nichtmal die Zähne!
	AI_Output(self, hero, "Info_Mod_Henry_HierGrog_Fusel_04_02"); //Verschwinde mit deinem Zeug.

	Info_ClearChoices	(Info_Mod_Henry_HierGrog);
};

INSTANCE Info_Mod_Henry_InEntertrupp (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_InEntertrupp_Condition;
	information	= Info_Mod_Henry_InEntertrupp_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will in deinen Entertrupp.";
};

FUNC INT Info_Mod_Henry_InEntertrupp_Condition()
{
	if (Mod_QuatschGrog == 1)
	&& (Mod_InEntertrupp == 0)
	&& ((Npc_KnowsInfo(hero, Info_Mod_Francis_Skip))
	|| (Npc_KnowsInfo(hero, Info_Mod_Morgan_HierKrallen)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henry_InEntertrupp_Info()
{
	AI_Output(hero, self, "Info_Mod_Henry_InEntertrupp_15_00"); //Ich will in deinen Entertrupp.
	AI_Output(self, hero, "Info_Mod_Henry_InEntertrupp_04_01"); //Du hast bewiesen, dass du als Pirat zu gebrauchen bist.
	AI_Output(self, hero, "Info_Mod_Henry_InEntertrupp_04_02"); //Ab sofort bist du in meinem Entertrupp.

	B_GivePlayerXP	(400);

	B_LogEntry	(TOPIC_MOD_PIRATEN_ENTERTRUPP, "Ich bin jetzt Mitglied von Henry's Entertrupp.");
	B_SetTopicStatus	(TOPIC_MOD_PIRATEN_ENTERTRUPP, LOG_SUCCESS);

	Mod_InEntertrupp = 1;

	B_Göttergefallen(2, 1);
	
	if (Npc_KnowsInfo(hero, Info_Mod_Morgan_Entertrupp))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morgan_HierKrallen)) {
		B_SetTopicStatus(TOPIC_MOD_MORGAN_ENTERTRUPP, LOG_FAILED);
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Francis_Entertrupp))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Francis_Skip)) {
		B_SetTopicStatus(TOPIC_MOD_FRANCIS_ENTERTRUPP, LOG_FAILED);
	};
};

INSTANCE Info_Mod_Henry_Befreiung (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_Befreiung_Condition;
	information	= Info_Mod_Henry_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alles klar?";
};

FUNC INT Info_Mod_Henry_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henry_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Henry_Befreiung_15_00"); //Alles klar?
	AI_Output(self, hero, "Info_Mod_Henry_Befreiung_04_01"); //(schnaubt) Wie soll denn alles klar sein, wenn wir uns gerade im Krieg befinden?
	AI_Output(hero, self, "Info_Mod_Henry_Befreiung_15_02"); //Keine Ahnung. Ich komme von Greg.
	AI_Output(self, hero, "Info_Mod_Henry_Befreiung_04_03"); //Und was will er?
	AI_Output(hero, self, "Info_Mod_Henry_Befreiung_15_04"); //Ich soll euch aushelfen, damit wir zum Gegenschlag ausholen können.
	AI_Output(self, hero, "Info_Mod_Henry_Befreiung_04_05"); //Sag das doch gleich.
	AI_Output(hero, self, "Info_Mod_Henry_Befreiung_15_06"); //Was soll ich für dich tun?
	AI_Output(self, hero, "Info_Mod_Henry_Befreiung_04_07"); //Während die Schlacht tobte haben sich einige dieser untoten Typen Richtung Strand verzogen und sich in einer Höhle verschanzt.
	AI_Output(self, hero, "Info_Mod_Henry_Befreiung_04_08"); //Die sind nicht so dumm, wie es den Anschein hat, da sie eine Stachelfalle installiert haben.
	AI_Output(self, hero, "Info_Mod_Henry_Befreiung_04_09"); //Du musst diese Untoten umbringen und versuchen die Stachelfalle zu deaktivieren.
	AI_Output(hero, self, "Info_Mod_Henry_Befreiung_15_10"); //Ist so gut wie erledigt.
	AI_Output(self, hero, "Info_Mod_Henry_Befreiung_04_11"); //Das werden wir sehen.

	Wld_SendTrigger	("HENRYMAINMOVER");

	Wld_InsertNpc	(Mod_7001_HoherUntoterMagier_AW,	"ADW_PIRATECAMP_CAVE3_04");
	Wld_InsertNpc	(Mod_7002_HoherUntoterMagier_AW,	"ADW_PIRATECAMP_CAVE3_04");
	Wld_InsertNpc	(Mod_7003_HoherUntoterMagier_AW,	"ADW_PIRATECAMP_CAVE3_04");
	Wld_InsertNpc	(Mod_7004_HoherUntoterMagier_AW,	"ADW_PIRATECAMP_CAVE3_04");
	Wld_InsertNpc	(Mod_7005_HoherUntoterMagier_AW,	"ADW_PIRATECAMP_CAVE3_04");

	Log_CreateTopic	(TOPIC_MOD_BEL_PIRHENRY, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRHENRY, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_PIRHENRY, "Henry will, dass ich ein paar Untote töte, die sich in der Höhle am Strand verschanzt haben. Sie scheinen jedoch eine Stachelfalle am Eingang installiert zu haben. Ich muss sehen, ob ich sie irgendwie deaktivieren kann.");
};

INSTANCE Info_Mod_Henry_Befreiung2 (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_Befreiung2_Condition;
	information	= Info_Mod_Henry_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Untoten wurden besiegt.";
};

FUNC INT Info_Mod_Henry_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Henry_Befreiung))
	&& (Npc_IsDead(Mod_7001_HoherUntoterMagier_AW))
	&& (Npc_IsDead(Mod_7002_HoherUntoterMagier_AW))
	&& (Npc_IsDead(Mod_7003_HoherUntoterMagier_AW))
	&& (Npc_IsDead(Mod_7004_HoherUntoterMagier_AW))
	&& (Npc_IsDead(Mod_7005_HoherUntoterMagier_AW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henry_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Henry_Befreiung2_15_00"); //Die Untoten wurden besiegt.
	AI_Output(self, hero, "Info_Mod_Henry_Befreiung2_04_01"); //(erfreut) Sehr gute Arbeit. Nun werden uns diese Untote nicht mehr bedrohen.
	AI_Output(hero, self, "Info_Mod_Henry_Befreiung2_15_02"); //Wie steht's mit einer Belohnung?
	AI_Output(self, hero, "Info_Mod_Henry_Befreiung2_04_03"); //Hier, nimm dieses Gold und vier Flaschen Grog.

	CreateInvItems	(hero, ItMi_Gold, 250);
	CreateInvItems	(hero, ItFo_Addon_Grog, 4);

	B_ShowGivenThings	("250 Gold und 4 Grog erhalten");

	AI_Output(hero, self, "Info_Mod_Henry_Befreiung2_15_04"); //Danke.

	Mod_Piratenbefreiung += 1;

	B_GivePlayerXP	(450);

	B_LogEntry_More	(TOPIC_MOD_BEL_PIRHENRY, TOPIC_MOD_BEL_PIRATENLAGER, "Ich hab Henry von meinem Sieg über die Untoten in der Höhle berichtet.", "Ich habe Henry bei seinem Problem mit den Untoten geholfen.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRHENRY, LOG_SUCCESS);
};

INSTANCE Info_Mod_Henry_Todesangst (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_Todesangst_Condition;
	information	= Info_Mod_Henry_Todesangst_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Henry_Todesangst_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Norek_Heimweh))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henry_Todesangst_Info()
{
	AI_Output(self, hero, "Info_Mod_Henry_Todesangst_04_00"); //(laut) Halt! Ich darf dich nicht einlassen.
	AI_Output(hero, self, "Info_Mod_Henry_Todesangst_15_01"); //Was ist los? Du kennst mich doch.
	AI_Output(self, hero, "Info_Mod_Henry_Todesangst_04_02"); //Egal. Der Käptn will's so.
	AI_Output(hero, self, "Info_Mod_Henry_Todesangst_15_03"); //Ich muss aber mit Greg sprechen. Es ist wichtig.
	AI_Output(self, hero, "Info_Mod_Henry_Todesangst_04_04"); //Hmm. Also gut. Du lässt dich von Jack ins Lager begleiten.
	AI_Output(hero, self, "Info_Mod_Henry_Todesangst_15_05"); //Wenn du es sagst ...

	self.aivar[AIV_PASSGATE] = FALSE;
};

INSTANCE Info_Mod_Henry_Todesangst2 (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_Todesangst2_Condition;
	information	= Info_Mod_Henry_Todesangst2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Henry_Todesangst2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AlligatorJack_Todesangst2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henry_Todesangst2_Info()
{
	AI_Output(self, hero, "Info_Mod_Henry_Todesangst2_04_00"); //Durchgehen!

	self.aivar[AIV_PASSGATE] = TRUE;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Henry_Malcom (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_Malcom_Condition;
	information	= Info_Mod_Henry_Malcom_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll bei einem Skip für Malcom da hinten Essen bestellen.";
};

FUNC INT Info_Mod_Henry_Malcom_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malcom_AW_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Henry_Fleisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henry_Malcom_Info()
{
	AI_Output(hero, self, "Info_Mod_Henry_Malcom_15_00"); //Ich soll bei einem Skip für Malcom da hinten Essen bestellen.
	AI_Output(self, hero, "Info_Mod_Henry_Malcom_04_01"); //Erst mein Beißerfleisch. Dann kannst du reden, mit wem du willst.
};

INSTANCE Info_Mod_Henry_Lehrer (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_Lehrer_Condition;
	information	= Info_Mod_Henry_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Henry_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Henry_Hi))
	&& (Piraten_Dabei == TRUE)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henry_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Henry_Lehrer_04_00"); //Ich kann dir den Umgang mit Zweihändern beibringen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_PIRATEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_PIRATEN, "Henry kann mir den Umgang mit Zweihändern beibringen.");
};

INSTANCE Info_Mod_Henry_Lernen (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_Lernen_Condition;
	information	= Info_Mod_Henry_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Henry_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Henry_Lehrer))
	&& (Piraten_Dabei == TRUE)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henry_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Henry_Lernen_15_00"); //Ich will lernen.

	Info_ClearChoices	(Info_Mod_Henry_Lernen);

	Info_AddChoice	(Info_Mod_Henry_Lernen, DIALOG_BACK, Info_Mod_Henry_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Henry_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Henry_Lernen_2H_5);
	Info_AddChoice	(Info_Mod_Henry_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Henry_Lernen_2H_1);
};

FUNC VOID Info_Mod_Henry_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Henry_Lernen);
};

FUNC VOID Info_Mod_Henry_Lernen_2H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 60)
	{
		Info_ClearChoices	(Info_Mod_Henry_Lernen);

		Info_AddChoice	(Info_Mod_Henry_Lernen, DIALOG_BACK, Info_Mod_Henry_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Henry_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Henry_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Henry_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Henry_Lernen_2H_1);
	};
};

FUNC VOID Info_Mod_Henry_Lernen_2H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_2H, 1, 60)
	{
		Info_ClearChoices	(Info_Mod_Henry_Lernen);

		Info_AddChoice	(Info_Mod_Henry_Lernen, DIALOG_BACK, Info_Mod_Henry_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Henry_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Henry_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Henry_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Henry_Lernen_2H_1);
	};
};

const string Henry_Checkpoint	= "ADW_PIRATECAMP_WAY_01";	//WP hinter City-Tor vom Spielstart aus!

instance Info_Mod_Henry_FirstWarn (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_FirstWarn_Condition;
	information	= Info_Mod_Henry_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_Henry_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(hero, Henry_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void Info_Mod_Henry_FirstWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_Henry_FirstWarn_04_00"); //HALT! Ich hab gesagt du kommst hier nicht rein.
	
	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, Henry_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_Henry_SecondWarn (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_SecondWarn_Condition;
	information	= Info_Mod_Henry_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Henry_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_GetDistToWP(hero, Henry_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50))) 
	{
		return TRUE;
	};
};

func void Info_Mod_Henry_SecondWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_Henry_SecondWarn_04_00"); //Ich sag's dir zum letzten Mal. Einen Schritt weiter und du begibst dich in die Welt des Schmerzes!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP (hero,Henry_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_Henry_Attack (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_Attack_Condition;
	information	= Info_Mod_Henry_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Henry_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
	&& (Npc_GetDistToWP(hero,Henry_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50)))
	{
		return TRUE;
	};
};

func void Info_Mod_Henry_Attack_Info()
{
	hero.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, hero,"Info_Mod_Henry_Attack_04_00"); //Du hast es so gewollt ...

	AI_StopProcessInfos	(self);	

	B_Attack (self, hero, AR_GuardStopsIntruder, 0); 
};

INSTANCE Info_Mod_Henry_Pickpocket (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_Pickpocket_Condition;
	information	= Info_Mod_Henry_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Henry_Pickpocket_Condition()
{
	C_Beklauen	(91, ItFo_Addon_Grog, 5);
};

FUNC VOID Info_Mod_Henry_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Henry_Pickpocket);

	Info_AddChoice	(Info_Mod_Henry_Pickpocket, DIALOG_BACK, Info_Mod_Henry_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Henry_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Henry_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Henry_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Henry_Pickpocket);
};

FUNC VOID Info_Mod_Henry_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Henry_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Henry_Pickpocket);

		Info_AddChoice	(Info_Mod_Henry_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Henry_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Henry_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Henry_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Henry_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Henry_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Henry_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Henry_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Henry_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Henry_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Henry_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Henry_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Henry_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Henry_EXIT (C_INFO)
{
	npc		= Mod_934_PIR_Henry_AW;
	nr		= 1;
	condition	= Info_Mod_Henry_EXIT_Condition;
	information	= Info_Mod_Henry_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Henry_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Henry_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};