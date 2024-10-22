INSTANCE Info_Mod_Albi_Hi (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Hi_Condition;
	information	= Info_Mod_Albi_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albi_Hi_Condition()
{
	if (Mod_Echsis == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Albi_Hi_23_00"); //Schhhhhhhhhhhhhhhhhhhhhhhhhzzz.
	AI_Output(hero, self, "Info_Mod_Albi_Hi_15_01"); //Könntest du das vielleicht wiederholen?
	AI_Output(self, hero, "Info_Mod_Albi_Hi_23_02"); //Schhhhschshshshshshshshhhhhhhhhhhhh.

	Info_ClearChoices	(Info_Mod_Albi_Hi);

	Info_AddChoice	(Info_Mod_Albi_Hi, "Versuch's nochmal gaaaaaaaaaaaaaaaaaanz laaaaaaaangsam.", Info_Mod_Albi_Hi_B);
	Info_AddChoice	(Info_Mod_Albi_Hi, "Ich verstehe kein Wort.", Info_Mod_Albi_Hi_A);
};

FUNC VOID Info_Mod_Albi_Hi_C()
{
	AI_Output(self, hero, "Info_Mod_Albi_Hi_C_23_00"); //Verstehst du mich?
	AI_Output(hero, self, "Info_Mod_Albi_Hi_C_15_01"); //Du sprichst die Sprache der Erbauer?
	AI_Output(self, hero, "Info_Mod_Albi_Hi_C_23_02"); //Hast du verstanden, was ich gesagt habe?
	AI_Output(hero, self, "Info_Mod_Albi_Hi_C_15_03"); //Ja ... du hast mich gefragt ob ich dich verstehe ...?
	AI_Output(self, hero, "Info_Mod_Albi_Hi_C_23_04"); //(energisch) Ich meinte davor!

	Info_ClearChoices	(Info_Mod_Albi_Hi);

	Info_AddChoice	(Info_Mod_Albi_Hi, "Ahm ... sowas wie Schhcschsh?", Info_Mod_Albi_Hi_E);
	Info_AddChoice	(Info_Mod_Albi_Hi, "Nein, kein Wort.", Info_Mod_Albi_Hi_D);
};

FUNC VOID Info_Mod_Albi_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Albi_Hi_B_15_00"); //Versuch's nochmal gaaaaaaaaaaaaaaaaaanz laaaaaaaangsam.

	Info_Mod_Albi_Hi_C();
};

FUNC VOID Info_Mod_Albi_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Albi_Hi_A_15_00"); //Ich verstehe kein Wort.

	Info_Mod_Albi_Hi_C();
};

FUNC VOID Info_Mod_Albi_Hi_F()
{
	AI_Output(self, hero, "Info_Mod_Albi_Hi_F_23_00"); //Ich habe dir deine Freiheit angeboten, wenn du mir sagen kannst, welche Farbe meine Schuppen haben.

	Info_ClearChoices	(Info_Mod_Albi_Hi);

	Info_AddChoice	(Info_Mod_Albi_Hi, "Weiß!!!!", Info_Mod_Albi_Hi_H);
	Info_AddChoice	(Info_Mod_Albi_Hi, "Warum?", Info_Mod_Albi_Hi_G);
};

FUNC VOID Info_Mod_Albi_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Albi_Hi_E_15_00"); //Ahm ... sowas wie Schhcschsh?

	Info_Mod_Albi_Hi_F();
};

FUNC VOID Info_Mod_Albi_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Albi_Hi_D_15_00"); //Nein, kein Wort.

	Info_Mod_Albi_Hi_F();
};

FUNC VOID Info_Mod_Albi_Hi_I()
{
	AI_Output(self, hero, "Info_Mod_Albi_Hi_I_23_00"); //Ich musste herrausfinden, ob du unsere Sprache sprichst. Offensichtlich nicht.
	AI_Output(hero, self, "Info_Mod_Albi_Hi_I_15_01"); //Ich wiederhole mich, aber Warum?!
	AI_Output(self, hero, "Info_Mod_Albi_Hi_I_23_02"); //Ich brauche deine Hilfe. Und nur jemand, der unsere Sprache nicht spricht, kann mir helfen.

	Info_ClearChoices	(Info_Mod_Albi_Hi);

	Info_AddChoice	(Info_Mod_Albi_Hi, "Wie kommst du darauf, dass ich dir helfe?", Info_Mod_Albi_Hi_K);
	Info_AddChoice	(Info_Mod_Albi_Hi, "Worum geht es?", Info_Mod_Albi_Hi_J);
};

FUNC VOID Info_Mod_Albi_Hi_H()
{
	AI_Output(hero, self, "Info_Mod_Albi_Hi_H_15_00"); //Weiß!!!!
	AI_Output(self, hero, "Info_Mod_Albi_Hi_H_23_01"); //Schweig!

	Info_Mod_Albi_Hi_I();
};

FUNC VOID Info_Mod_Albi_Hi_G()
{
	AI_Output(hero, self, "Info_Mod_Albi_Hi_G_15_00"); //Warum?

	Info_Mod_Albi_Hi_I();
};

FUNC VOID Info_Mod_Albi_Hi_J()
{
	AI_Output(hero, self, "Info_Mod_Albi_Hi_J_15_00"); //Worum geht es?
	AI_Output(self, hero, "Info_Mod_Albi_Hi_J_23_01"); //Du musst zur anderen Seite des Sumpfes. Aber ich werde dir morgen genaueres sagen.
	AI_Output(self, hero, "Info_Mod_Albi_Hi_J_23_02"); //Ruh dich aus und komm morgen zum Ausgang der Stadt.
	AI_Output(self, hero, "Info_Mod_Albi_Hi_J_23_03"); //Aber such dir zum Schlafen ein Lager außerhalb der Hütten!
	AI_Output(hero, self, "Info_Mod_Albi_Hi_J_15_04"); //Na gut ...
	AI_Output(self, hero, "Info_Mod_Albi_Hi_J_23_05"); //Hier, nimm das.

	B_GiveInvItems	(self, hero, ItMi_MerkwuerdigesDing, 1);

	B_Say	(hero, self, "$WASISTDAS");

	AI_Output(self, hero, "Info_Mod_Albi_Hi_J_23_06"); //Lege es ins Feuer in der Schmiede. Nimm, was übrigbleibt. Davon kannst du beim Echsenhändler Heilkräuter kaufen. Du wirst sie brauchen. Geh jetzt.

	Mod_EchsenTag = Wld_GetDay();

	Mod_Echsis = 4;

	Info_ClearChoices	(Info_Mod_Albi_Hi);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "HUT");

	B_LogEntry	(TOPIC_MOD_ECHSEN, "Albi, scheinbar das Oberhaupt der Echsenmenschen, hat eine wichtige Aufgabe für mich. Leider haben sie auch meine komplette Ausrüstung beschlagnahmt. Er hat mir ein merkwürdiges Ding gegeben. Ich soll es ins Feuer in der Schmiede legen und das nehmen, was übrig bleibt. Davon kann ich dann beim Echsenhändler Heilkräuter kaufen. Morgen soll ich zum Ausgang der Stadt gehen, wo Albi mir näheres zu meiner Aufgabe erklären wird.");
};

FUNC VOID Info_Mod_Albi_Hi_K()
{
	AI_Output(hero, self, "Info_Mod_Albi_Hi_K_15_00"); //Wie kommst du darauf, dass ich dir helfe?
	AI_Output(self, hero, "Info_Mod_Albi_Hi_K_23_01"); //Zum einen haben wir deine gesamten Besitztümer.
	AI_Output(self, hero, "Info_Mod_Albi_Hi_K_23_02"); //Zum anderen bist du ein Gefangener und wenn du uns nicht hilfst, werden wir dich zu den Haien stecken.
	AI_Output(hero, self, "Info_Mod_Albi_Hi_K_15_03"); //Überredet.

	Info_Mod_Albi_Hi_J();
};

INSTANCE Info_Mod_Albi_Wuerdebeweis (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Wuerdebeweis_Condition;
	information	= Info_Mod_Albi_Wuerdebeweis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albi_Wuerdebeweis_Condition()
{
	if (Mod_Echsis == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Wuerdebeweis_Info()
{
	AI_Output(self, hero, "Info_Mod_Albi_Wuerdebeweis_23_00"); //Du musst ein Ritual überstehen. Besiege den Hai und du bist würdig!
	AI_Output(hero, self, "Info_Mod_Albi_Wuerdebeweis_15_01"); //Und wo sind meine Rüstung und meine Waffe?
	AI_Output(self, hero, "Info_Mod_Albi_Wuerdebeweis_23_02"); //DU sollst ihn besiegen und nicht dein Schwert! Kämpfe jetzt!

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_ECHSEN, "Ich soll beweisen, dass ich würdig bin, indem ich einen Sumpfhai ohne Rüstung und Waffe töte. Na das kann ja lustig werden ...");

	Wld_InsertNpc	(Sumpfhai_11023_AW,	"BL_DOWN_01");
};

INSTANCE Info_Mod_Albi_Wuerdebewiesen (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Wuerdebewiesen_Condition;
	information	= Info_Mod_Albi_Wuerdebewiesen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albi_Wuerdebewiesen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_Wuerdebeweis))
	&& (Npc_IsDead(Sumpfhai_11023_AW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Wuerdebewiesen_Info()
{
	AI_Output(self, hero, "Info_Mod_Albi_Wuerdebewiesen_23_00"); //Du bist würdig. Hier, nimm das. Du darfst dich nun frei im Sumpf bewegen.

	B_GiveInvItems	(self, hero, ItAr_Echsi_01, 1);

	AI_EquipArmor	(hero, ItAr_Echsi_01);

	AI_Output(hero, self, "Info_Mod_Albi_Wuerdebewiesen_15_01"); //Du meinst ich darf gehen?
	AI_Output(self, hero, "Info_Mod_Albi_Wuerdebewiesen_23_02"); //Ich sagte IM Sumpf. Komm zu meiner Hütte. Dort reden wir weiter.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_ECHSEN, "Ich habe bewiesen, dass ich würdig bin. Merkwürdigerweise war der Sumpfhai aber schon sehr stark geschwächt ... Naja, jedenfalls darf ich mich jetzt frei im Sumpf bewegen. Verlassen darf ich ihn aber wohl noch nicht. Ich soll zu Albi in seine Hütte kommen, dort wird er mir wohl weiteres erklären.");

	B_GivePlayerXP	(500);

	B_StartOtherRoutine	(self, "HUT");

	Mod_12004_DRA_Wache_AW.aivar[AIV_PASSGATE] = TRUE;
	Mod_12005_DRA_Wache_AW.aivar[AIV_PASSGATE] = TRUE;
};

INSTANCE Info_Mod_Albi_AtHut (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_AtHut_Condition;
	information	= Info_Mod_Albi_AtHut_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was sollte das?";
};

FUNC INT Info_Mod_Albi_AtHut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_Wuerdebewiesen))
	&& (Npc_GetDistToWP(self, "BL_BLOODWYN_BOOK") < 1000)
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_AtHut_Info()
{
	AI_Output(hero, self, "Info_Mod_Albi_AtHut_15_00"); //Was sollte das?
	AI_Output(self, hero, "Info_Mod_Albi_AtHut_23_01"); //Der Kampf? Eine Art Initiationsritus.
	AI_Output(self, hero, "Info_Mod_Albi_AtHut_23_02"); //Unsere jungen dürfen die Stadt erst verlassen, wenn sie einen Sumpfhai im Kampf bezwingen, unbewaffnet.
	AI_Output(self, hero, "Info_Mod_Albi_AtHut_23_03"); //Auf diese Weise habe ich den Argwohn zumindest ein bisschen von dir genommen.
	AI_Output(hero, self, "Info_Mod_Albi_AtHut_15_04"); //Wozu der ganze Schwindel? Der Sumpfhai war doch schon halbtot als sie ihn hergeführt haben.
	AI_Output(self, hero, "Info_Mod_Albi_AtHut_23_05"); //Hörst du mir nicht zu oder verstehst du mich nicht?
	AI_Output(self, hero, "Info_Mod_Albi_AtHut_23_06"); //Ich BRAUCHE dich. Und zwar nicht hier in der Stadt und nicht als Sumpfhaifutter, als was du ohne deine Stahlhaut und deine Eisenkrallen geendet wärst.
	AI_Output(hero, self, "Info_Mod_Albi_AtHut_15_07"); //Warum ich? Warum schickst du keine Echse?
	AI_Output(self, hero, "Info_Mod_Albi_AtHut_23_08"); //Schweig! Du bist nicht in der Position Fragen zu stellen.
	AI_Output(self, hero, "Info_Mod_Albi_AtHut_23_09"); //Du wirst jetzt in den südlichen Teil des Sumpfes gehen, dieser Teil wird von Sumpfgolems bewohnt.
	AI_Output(self, hero, "Info_Mod_Albi_AtHut_23_10"); //Dort wirst du meinen Bruder suchen.
	AI_Output(hero, self, "Info_Mod_Albi_AtHut_15_11"); //Eine andere Echse?
	AI_Output(self, hero, "Info_Mod_Albi_AtHut_23_12"); //Eine andere weiße Echse. Du MUSST sie finden. Nicht nur dein Leben hängt davon ab.
	AI_Output(self, hero, "Info_Mod_Albi_AtHut_23_13"); //Sollte er noch am Leben sein, bring ihn unbedingt mit hierher.
	AI_Output(self, hero, "Info_Mod_Albi_AtHut_23_14"); //Sollte er tot sein, bring mir unter allen Umständen den Schlüssel mit, den er bei sich trägt.

	B_LogEntry	(TOPIC_MOD_ECHSEN, "Der ganze Schwindel mit dem Sumphaikampf diente dazu, dass mich die anderen Echsis akzeptieren und ich das Lager verlassen kann. Albi hat eine Aufgabe im Sumpf für mich, für die er scheinbar keine normale Echse abstellen kann. Ich soll im südlichen Bereich des Sumpfes, wo die Sumpfgolems leben, nach seinem Bruder suchen. Wenn er noch lebt, soll ich ihn in die Stadt bringen, andernfalls auf jedenfall den Schlüssel zu Albi bringen, der er bei sich trägt.");

	Wld_InsertNpc	(Mod_12006_DRA_Echse_AW,	"ADW_SWAMP_07");

	B_KillNpc	(Mod_12006_DRA_Echse_AW);
};

INSTANCE Info_Mod_Albi_KeyGefunden (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_KeyGefunden_Condition;
	information	= Info_Mod_Albi_KeyGefunden_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albi_KeyGefunden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_AtHut))
	&& (Npc_HasItems(hero, ItKe_EchsenKey) == 1)
	&& (Npc_HasItems(hero, ItAr_Echsi_01) == 1)
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_KeyGefunden_Info()
{
	AI_Output(self, hero, "Info_Mod_Albi_KeyGefunden_23_00"); //Da bist du ja endlich! Hast du meinen Bruder gefunden?
	AI_Output(hero, self, "Info_Mod_Albi_KeyGefunden_15_01"); //Ja, leider haben ihn die Golems wohl vor mir gefunden. Hier, der Schlüssel.

	B_GiveInvItems	(hero, self, ItKe_EchsenKey, 1);

	AI_Output(self, hero, "Info_Mod_Albi_KeyGefunden_23_02"); //Schhhhhhhhhhhhhhhhhhhhhhhhhzzz.
	AI_Output(hero, self, "Info_Mod_Albi_KeyGefunden_15_03"); //Kann ich jetzt gehen?
	AI_Output(self, hero, "Info_Mod_Albi_KeyGefunden_23_04"); //Ja, geh. Deine Sachen sind in der Truhe dort. Hier ist der Schlüssel.

	B_GiveInvItems	(self, hero, ITKE_Addon_Thorus, 1);

	AI_Output(self, hero, "Info_Mod_Albi_KeyGefunden_23_05"); //Und hier ... Trage diese Rüstung und die Wachen am Tor werden dich passieren lassen.

	AI_UnequipArmor	(hero);

	Npc_RemoveInvItems	(hero, ItAr_Echsi_01, 1);

	B_GiveInvItems	(self, hero, ItAr_Echsi_02, 1);

	AI_EquipArmor	(hero, ItAr_Echsi_02);

	B_LogEntry	(TOPIC_MOD_ECHSEN, "Albi scheint über den Tod seines Bruders nicht erfreut zu sein, doch kann ich den Sumpf nun verlassen.");
	B_SetTopicStatus	(TOPIC_MOD_ECHSEN, LOG_SUCCESS);

	Mod_12000_DRA_Wache_AW.aivar[AIV_PASSGATE] = TRUE;
	Mod_12001_DRA_Wache_AW.aivar[AIV_PASSGATE] = TRUE;

	B_GivePlayerXP	(1000);
};

INSTANCE Info_Mod_Albi_FokusEinsetzen (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_FokusEinsetzen_Condition;
	information	= Info_Mod_Albi_FokusEinsetzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du dafür sorgen, dass ich in den oberen Bereich der Stadt kann?";
};

FUNC INT Info_Mod_Albi_FokusEinsetzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_KeyGefunden))
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_FokusEinsetzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Albi_FokusEinsetzen_15_00"); //Kannst du dafür sorgen, dass ich in den oberen Bereich der Stadt kann?
	AI_Output(self, hero, "Info_Mod_Albi_FokusEinsetzen_23_01"); //Natürlich, aber nur Echsen, die erwachsen sind dürfen in die Oberstadt.
	AI_Output(self, hero, "Info_Mod_Albi_FokusEinsetzen_23_02"); //Du bist jetzt zwar eine Echse, aber noch nicht erwachsen.
	AI_Output(hero, self, "Info_Mod_Albi_FokusEinsetzen_15_03"); //Ich hätte schwören können es war andersrum.
	AI_Output(self, hero, "Info_Mod_Albi_FokusEinsetzen_23_04"); //Schweig! Wenn du in die Oberstadt willst dann verdiene es dir und mach dich nützlich!
	AI_Output(hero, self, "Info_Mod_Albi_FokusEinsetzen_15_05"); //Es ist schwierig mich nützlich zu machen, wenn ich niemanden verstehe.
	AI_Output(self, hero, "Info_Mod_Albi_FokusEinsetzen_23_06"); //Ich werde mit den Echsen reden. Sprich morgen mit ihnen, wenn sie etwas für dich zu tun haben, dann werden sie dir einen Zettel geben.
	AI_Output(hero, self, "Info_Mod_Albi_FokusEinsetzen_15_07"); //Wäre es nicht einfacher, wenn ich eure Sprache lernen würde?
	AI_Output(self, hero, "Info_Mod_Albi_FokusEinsetzen_23_08"); //DU DARFST unsre Sprache nicht lernen, und jetzt lass mich in Ruhe, ich gehe in die Oberstadt.
	AI_Output(self, hero, "Info_Mod_Albi_FokusEinsetzen_23_09"); //Wenn du dich als würdig erwiesen hast, dann werde ich vor dem Tor auf dich warten.

	Log_CreateTopic	(TOPIC_MOD_ECHSEN_VERTRAUEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ECHSEN_VERTRAUEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ECHSEN_VERTRAUEN, "Um in die obere Stadt der Echsen zu kommen, muss ich deren Vertrauen gewinnen. Morgen werden mir die Echsen, die eine Aufgabe für mich haben, einen Zettel geben. Habe ich genug Aufträge erfüllt, wird Albi mich erwarten.");

	if (Npc_HasItems(hero, ItMi_Focus_Kloster) == 0) {
		B_LogEntry	(TOPIC_MOD_ECHSEN_VERTRAUEN, "Ich sollte nicht vergessen meine Sachen aus der Truhe zu holen. Besonders den Fokusstein brauche ich...");
	};

	Mod_Albi_VertrauensTag = Wld_GetDay();

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "MINE");
};

INSTANCE Info_Mod_Albi_VertrauenGewonnen (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_VertrauenGewonnen_Condition;
	information	= Info_Mod_Albi_VertrauenGewonnen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albi_VertrauenGewonnen_Condition()
{
	if (Mod_EchsenQuest == 1)
	&& (Npc_HasItems(hero, ItMi_Focus_Kloster) == 1)
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_VertrauenGewonnen_Info()
{
	AI_Output(self, hero, "Info_Mod_Albi_VertrauenGewonnen_23_00"); //Du hast dich scheinbar wirklich nützlich gemacht. Es ist fast alles so weit. Du darfst gehen.
	AI_Output(hero, self, "Info_Mod_Albi_VertrauenGewonnen_15_01"); //Was?
	AI_Output(self, hero, "Info_Mod_Albi_VertrauenGewonnen_23_02"); //Du bist frei den Sumpf zu verlassen! Jetzt Geh.
	AI_Output(hero, self, "Info_Mod_Albi_VertrauenGewonnen_15_03"); //Aber ich muss in die Oberstadt!
	AI_Output(self, hero, "Info_Mod_Albi_VertrauenGewonnen_23_04"); //Die Oberstadt? Ich sagte doch, dass nur Erwachsene in die Oberstadt dürfen. Was willst du überhaupt dort?
	AI_Output(hero, self, "Info_Mod_Albi_VertrauenGewonnen_15_05"); //Ich will diesen blauen Stein auf einen Sockel vor dem Tempel legen.

	B_GiveInvItems	(hero, self, ItMi_Focus_Kloster, 1);

	AI_Output(self, hero, "Info_Mod_Albi_VertrauenGewonnen_23_06"); //Nun gut, du hast mir sehr geholfen, ich werde das für dich erledigen, aber nicht jetzt, ich habe zu tun!

	B_LogEntry	(TOPIC_MOD_ECHSEN_VERTRAUEN, "Ich habe das Vertrauen der Echsen gewonnen und Albi wird den Fokus für mich in der Oberstadt einsetzen.");
	B_SetTopicStatus	(TOPIC_MOD_ECHSEN_VERTRAUEN, LOG_SUCCESS);

	B_GivePlayerXP	(1000);

	AI_StopProcessInfos	(self);

	Mod_EchsenQuest = 2;
};

INSTANCE Info_Mod_Albi_Kap4Stab (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Kap4Stab_Condition;
	information	= Info_Mod_Albi_Kap4Stab_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albi_Kap4Stab_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_VertrauenGewonnen))
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_UrizielKaputt))
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Kap4Stab_Info()
{
	AI_Output(self, hero, "Info_Mod_Albi_Kap4Stab_23_00"); //Du bist zurück ...
	AI_Output(hero, self, "Info_Mod_Albi_Kap4Stab_15_01"); //Ich muss zum Tempel.
	AI_Output(self, hero, "Info_Mod_Albi_Kap4Stab_23_02"); //Nur vollwertige Krieger dürfen zum Tempel ... doch du bist zur richtigen Zeit gekommen, wir stehen kurz vor einer Schlacht.
	AI_Output(self, hero, "Info_Mod_Albi_Kap4Stab_23_03"); //Kämpfst du mit, werden dich die Wachen zum Tempel lassen.
	AI_Output(self, hero, "Info_Mod_Albi_Kap4Stab_23_04"); //Ich lasse die in die Schlacht ziehen, dafür erledigst du eine Aufgabe für mich.
	AI_Output(hero, self, "Info_Mod_Albi_Kap4Stab_15_05"); //Na gut. Was soll ich tun?
	AI_Output(self, hero, "Info_Mod_Albi_Kap4Stab_23_06"); //Du brauchst eine Waffe. Keine der kleinen Menschenwaffen, du brauchst einen Kriegerdolch.
	AI_Output(self, hero, "Info_Mod_Albi_Kap4Stab_23_07"); //Dazu musst du jeder Schwarzen Echse des Stammes einen Sumpfhaizahn bringen.
	AI_Output(self, hero, "Info_Mod_Albi_Kap4Stab_23_08"); //Außerdem Brauchst du die Wirbelsäule eines Sumpfcrawlers.
	AI_Output(self, hero, "Info_Mod_Albi_Kap4Stab_23_09"); //Dazu musst du in eine Höhle im nördlichen Sumpf. Dort steht eine Wache, sie wird dich einlassen.

	Log_CreateTopic	(TOPIC_MOD_ECHSEN_SCHLACHT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ECHSEN_SCHLACHT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ECHSEN_SCHLACHT, "Albi will, dass ich für mir einen Kriegerdolch besorge. Dazu soll ich jeder schwarzen Echse einen Sumpfhaizahn bringen. Zusätzlich brauche ich die Wirbelsäule eines Sumpfcrawlers. Ein solches Exemplar finde ich in einer Höhle nördlich der Sumpfhaifarm.");

	Mod_12017_DRA_Wache_AW.aivar[AIV_PASSGATE] = TRUE;

	Wld_InsertNpc	(SwampCrawler, "ADW_CANYON_PATH_TO_BANDITS_06E");
};

INSTANCE Info_Mod_Albi_Schlacht (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Schlacht_Condition;
	information	= Info_Mod_Albi_Schlacht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, die Wirbelsäule.";
};

FUNC INT Info_Mod_Albi_Schlacht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_Kap4Stab))
	&& (Npc_HasItems(hero, ItAt_Wirbelsaeule) == 1)
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Schlacht_Info()
{
	AI_Output(hero, self, "Info_Mod_Albi_Schlacht_15_00"); //Hier, die Wirbelsäule.

	B_GiveInvItems	(hero, self, ItAt_Wirbelsaeule, 1);

	AI_Output(self, hero, "Info_Mod_Albi_Schlacht_23_01"); //Gut. Komm nachts zu meiner Hütte, dann wirst du zu einem Anwärter erhoben.
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht_23_02"); //Ziehst du dann mit uns in die Schlacht, darfst du in den Tempel. Geh jetzt.

	if (Mod_ECHSI_SumpfhaiZaehne < 5)
	{
		AI_Output(self, hero, "Info_Mod_Albi_Schlacht_23_03"); //Und vergiss nicht, den schwarzen Echsen die Sumpfhaizähne zu bringen.
	};

	B_LogEntry	(TOPIC_MOD_ECHSEN_SCHLACHT, "Ich soll heute nacht wieder zu Albi kommen, dann werde ich zu einem Anwärter.");
};

INSTANCE Info_Mod_Albi_Schlacht2 (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Schlacht2_Condition;
	information	= Info_Mod_Albi_Schlacht2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albi_Schlacht2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_Schlacht))
	&& (Mod_ECHSI_SumpfhaiZaehne == 5)
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Schlacht2_Info()
{
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_00"); //Du bist bereit für die Schlacht.

	B_GiveInvItems	(self, hero, ItMw_EchsenKriegerDolch, 1);

	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_01"); //Jetzt gibt es nur noch ein Problem mit den Golems.
	AI_Output(hero, self, "Info_Mod_Albi_Schlacht2_15_02"); //Golems? Ich habe keinen einzigen gesehen, als ich herkam.
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_03"); //Genau das ist das Problem.
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_04"); //Der Krieg zwischen den Echsen und den Golems ist genauso alt, wie unsere beiden Rassen.
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_05"); //Der Sumpf selbst spuckt die schleimigen Bestien aus, wir Echsen schlüpfen aus Eiern.
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_06"); //Doch dazu benötigen wir die Golems.
	AI_Output(hero, self, "Info_Mod_Albi_Schlacht2_15_07"); //Ihr benötigt eure Feinde um euch fortzupflanzen? Klingt nach Hassliebe.
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_08"); //SCHWEIG! Wir sind nicht wie ihr Menschen, wir sind ein Kriegervolk.
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_09"); //Unsere Weibchen leben außerhalb der Stadt, unter der Oberfläche des Sumpfes.
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_10"); //Wir kämpfen gegen die Golems, die Krieger, die in der Schlacht fallen, spenden den Samen.
	AI_Output(hero, self, "Info_Mod_Albi_Schlacht2_15_11"); //Also ohne Golems keine Nachkommen.
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_12"); //Ja. Und solange keine neuen Echsen schlüpfen, bleibe ich die einzige weiße Echse ...
	AI_Output(hero, self, "Info_Mod_Albi_Schlacht2_15_13"); //Fühlst du dich einsam oder was ist dein Problem? Und überhaupt, woher soll ich Sumpfgolems nehmen?
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_14"); //Hüte deine Zunge, Mensch! Meine Gründe gehen dich nichts an.
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_15"); //Du musst für mich in den Sumpf. Hier.

	B_GiveInvItems	(self, hero, ItKe_EchsenKey2, 1);

	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_16"); //Der Schlüssel öffnet eine Tür im Süden des Sumpfes.
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_17"); //Du wirst sie öffnen und dann wirst du dich umdrehen und hierher zurückrennen.
	AI_Output(hero, self, "Info_Mod_Albi_Schlacht2_15_18"); //Ist das ein Befehl?
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht2_23_19"); //Nein, das ist nur ein Rat. Die Schlacht beginnt, wenn du die Tür geöffnet hast.

	B_LogEntry	(TOPIC_MOD_ECHSEN_SCHLACHT, "Ich soll heute nacht wieder zu Albi kommen, dann werde ich zu einem Anwärter.");
};

INSTANCE Info_Mod_Albi_Schlacht3 (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Schlacht3_Condition;
	information	= Info_Mod_Albi_Schlacht3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albi_Schlacht3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_Schlacht2))
	&& (Mod_HQ_AlraunenTor == 3)
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Schlacht3_Info()
{
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht3_23_00"); //Die Schlacht ist vorbei, du hast gut gekämpft ... für einen Menschen.
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht3_23_01"); //Du darfst in den oberen Teil der Stadt.
	AI_Output(hero, self, "Info_Mod_Albi_Schlacht3_15_02"); //Was ist mit dem Tempel?
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht3_23_03"); //Der Tempel? Was soll damit sein?
	AI_Output(hero, self, "Info_Mod_Albi_Schlacht3_15_04"); //Kann ich rein?
	AI_Output(self, hero, "Info_Mod_Albi_Schlacht3_23_05"); //Du kannst es versuchen, doch die Türen sind dick. Sieh sie dir ruhig an.

	B_SetTopicStatus	(TOPIC_MOD_ECHSEN_SCHLACHT, LOG_SUCCESS);

	B_GivePlayerXP	(1000);

	Mod_12008_DRA_Wache_AW.aivar[AIV_PassGate] = TRUE;
};

INSTANCE Info_Mod_Albi_Mutantengolem (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Mutantengolem_Condition;
	information	= Info_Mod_Albi_Mutantengolem_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albi_Mutantengolem_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_Schlacht3))
	&& (Mod_Mutantengolem == 4)
	&& (Npc_IsDead(Monster_11057_Mutantengolem_AW))
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Mutantengolem_Info()
{
	AI_Output(self, hero, "Info_Mod_Albi_Mutantengolem_23_00"); //Das war knapp ... du hast gut gekämpft. Für einen Mensch.
	AI_Output(hero, self, "Info_Mod_Albi_Mutantengolem_15_01"); //Was war das für ein Ding?
	AI_Output(self, hero, "Info_Mod_Albi_Mutantengolem_23_02"); //Ein Sumpfgolem ... etwas hat ihn aber verändert. Ich muss der Sache nachgehen ...
	AI_Output(self, hero, "Info_Mod_Albi_Mutantengolem_23_03"); //Ich kann nur hoffen, dass bei dem nächsten Wurf weiße Echsen schlüpfen.

	Info_ClearChoices	(Info_Mod_Albi_Mutantengolem);

	Info_AddChoice	(Info_Mod_Albi_Mutantengolem, "Was hat es mit euch weißen Echsen und den Golems auf sich?", Info_Mod_Albi_Mutantengolem_C);
	Info_AddChoice	(Info_Mod_Albi_Mutantengolem, "Kann ich was für dich tun?", Info_Mod_Albi_Mutantengolem_B);
	Info_AddChoice	(Info_Mod_Albi_Mutantengolem, "Wie auch immer, ich geh in den Tempel.", Info_Mod_Albi_Mutantengolem_A);
};

FUNC VOID Info_Mod_Albi_Mutantengolem_C()
{
	AI_Output(hero, self, "Info_Mod_Albi_Mutantengolem_C_15_00"); //Was hat es mit euch weißen Echsen und den Golems auf sich? Da stimmt doch was nicht.
	AI_Output(self, hero, "Info_Mod_Albi_Mutantengolem_C_23_01"); //Du sollst es erfahren, aber nicht hier. Ich brauche Ruhe, komm die nächsten Tage in meine Hütte.

	Mod_Echsis_Geheimnis_Tag = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Albi_Mutantengolem);
};

FUNC VOID Info_Mod_Albi_Mutantengolem_B()
{
	AI_Output(hero, self, "Info_Mod_Albi_Mutantengolem_B_15_00"); //Kann ich was für dich tun?
	AI_Output(self, hero, "Info_Mod_Albi_Mutantengolem_B_23_01"); //Ja ... aber noch nicht. Komm morgen in meine Hütte.

	Mod_Echsis_Geheimnis_Tag = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Albi_Mutantengolem);
};

FUNC VOID Info_Mod_Albi_Mutantengolem_A()
{
	AI_Output(hero, self, "Info_Mod_Albi_Mutantengolem_A_15_00"); //Wie auch immer, ich geh in den Tempel.
	AI_Output(self, hero, "Info_Mod_Albi_Mutantengolem_A_23_01"); //Tu das. Wenn du Zeit findest, es gibt noch viel zu tun.

	Mod_Echsis_Geheimnis_Tag = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Albi_Mutantengolem);
};

INSTANCE Info_Mod_Albi_Geheimnis (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Geheimnis_Condition;
	information	= Info_Mod_Albi_Geheimnis_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hast du für mich zu tun?";
};

FUNC INT Info_Mod_Albi_Geheimnis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_Mutantengolem))
	&& (Wld_GetDay() > Mod_Echsis_Geheimnis_Tag)
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Geheimnis_Info()
{
	AI_Output(hero, self, "Info_Mod_Albi_Geheimnis_15_00"); //Was hast du für mich zu tun?
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis_23_01"); //Das wichtigste jetzt sind die Eier. Sie sollten mittlerweile im Sumpf schwimmen.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis_23_02"); //Sammel sie ein. Es sollten mindestens zehn Stück sein!
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis_23_03"); //Bring sie der Wache am Brutloch im oberen Stadtteil.

	Log_CreateTopic	(TOPIC_MOD_ECHSIS_EIERSUCHE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ECHSIS_EIERSUCHE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ECHSIS_EIERSUCHE, "Ich soll im Sumpf Echseneier einsammeln gehen. Sie schwimmen dort scheinbar im Wasser. Wenn ich mindestens zehn Stück habe, soll ich sie der Wache am Brutloch im oberen Stadtteil geben.");

	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_01");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_02");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_03");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_04");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_05");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_06");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_07");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_08");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_09");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_10");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_11");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_12");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_13");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_14");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_15");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_16");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_17");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_18");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_19");
	Wld_InsertItem	(ItMi_EchsenEgg,	"FP_ITEM_ECHSENEGG_20");
};

INSTANCE Info_Mod_Albi_Geheimnis2 (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Geheimnis2_Condition;
	information	= Info_Mod_Albi_Geheimnis2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Eier sind in der Bruthöhle.";
};

FUNC INT Info_Mod_Albi_Geheimnis2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_EchseWache_05_Eier))
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Geheimnis2_Info()
{
	AI_Output(hero, self, "Info_Mod_Albi_Geheimnis2_15_00"); //Die Eier sind in der Bruthöhle. Aber es sind außergewöhnlich viele Golems im Sumpf.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis2_23_01"); //Das habe ich befürchtet ... Aber ich kann nichts machen solange keine weiteren weißen Echsen geschlüpft sind.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis2_23_02"); //Aber wenn wir das Problem mit den Golems nicht kontrollieren, werden sie uns überrennen. Ich werde die Krieger ins Grenzgebiet schicken.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis2_23_03"); //Bis die Eier ausgeschlüpft sind, dauert es noch. Wenn du dich nützlich machen willst, töte Golems.

	B_LogEntry	(TOPIC_MOD_ECHSIS_EIERSUCHE, "Es dauert noch ein wenig, bis die neuen Echsen schlüpfen. Solange soll ich im Sumpf Golems töten.");

	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_BF_NEST_08");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_BF_NEST_02");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_SHARKSTREET_09");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_SHARKSTREET_08");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_SHARKSTREET_07");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_SHARKSTREET_05");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_SHARKSTREET_04");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_WAND_03");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_SHARKSTREET_02");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_06");
	Wld_InsertNpc	(Swampgolem,	"ADW_BANDIT_VP1_07");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_02");
	Wld_InsertNpc	(Swampgolem,	"ADW_LITTLE_HILL_03");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_HOHLWEG_05");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_HOHLWEG_02");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_HOHLWEG_01");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_13");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_12");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_09");
	Wld_InsertNpc	(Swampgolem,	"ADW_SOUTHEAST_TELEPORTSTATION");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_HILLS_DOWN_06");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_10");
	Wld_InsertNpc	(Swampgolem,	"ADW_SENAT_04");
	Wld_InsertNpc	(Swampgolem,	"ADW_SENAT_MONSTER_01");
	Wld_InsertNpc	(Swampgolem,	"ADW_SENAT_01");
	Wld_InsertNpc	(Swampgolem,	"ADW_SENAT_SIDE_01");
	Wld_InsertNpc	(Swampgolem,	"ADW_SENAT_SIDE_02");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_HILLS_DOWN_01");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_HILLS_DOWN_03");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_LOCH_03");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_LOCH_05");
	Wld_InsertNpc	(Swampgolem,	"ADW_PFUETZE_02");
	Wld_InsertNpc	(Swampgolem,	"ADW_PATH_TO_GOLEM_08");
	Wld_InsertNpc	(Swampgolem,	"ADW_BANDIT_VP2_01");

	Mod_Echsis_Golemkiller = 0;
};

INSTANCE Info_Mod_Albi_Geheimnis3 (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Geheimnis3_Condition;
	information	= Info_Mod_Albi_Geheimnis3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albi_Geheimnis3_Condition()
{
	if (Mod_Echsis_Geheimnis == 1)
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Geheimnis3_Info()
{
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_00"); //Da bist du ja. Wir hatten Glück, wir haben zwei neue weiße Echsen.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_01"); //Du bist würdig, eingeweiht zu werden. Ich habe ihnen unsere Geschichte schon erzählt.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_02"); //Wenn du sie wissen willst setzt dich nieder und höre zu.

	AI_PlayAniBS (hero, "T_STAND_2_SIT", BS_SIT);

	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_03"); //Der Krieg zwischen den Echsen und den Golems dauert schon viele Schlachten lang, doch er ist für uns unabdingbar, da wir uns sonst nicht fortpflanzen könnten.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_04"); //Außerdem werden nur Echsen erwachsen, die im Krieg erfahren haben, was es heißt, zu leben und dem Tod ins Auge zu blicken.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_05"); //Zu Beginn der Geschichte war ungewiss, wer den Krieg für sich entscheiden würde, doch bereits vor Äonen haben unsere Ahnen ihn gewonnen.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_06"); //Die Folge war Zwietracht, Stammeskriege, Neid ... der Fluch, mit dem wir den Sieg bezahlten war mannigfaltig.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_07"); //Also entschlossen sich die Stammesführer dazu, neue Golems zu züchten.
	AI_Output(hero, self, "Info_Mod_Albi_Geheimnis3_15_08"); //Zu züchten?
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_09"); //Ja. Sie hatten herausgefunden, dass die Sumpfgolems aus Knospen bestimmter Pflanzen heranreifen.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_10"); //Im Weißen Garten züchteten sie Golems heran, dass der Krieg gegen sie uns wieder vereine.
	AI_Output(hero, self, "Info_Mod_Albi_Geheimnis3_15_11"); //Und warum spielen die weißen Echsen eine so große Rolle?
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_12"); //Die Golems sehen unsere Schuppen im Zwielicht nicht. Wir können uns frei unter ihnen bewegen. Das heißt wir konnten uns frei unter ihnen bewegen.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_13"); //Kurz, bevor du ankamst, kehrten meine Brüder nicht mehr wieder, die Golems erschlugen sie.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_14"); //Da der weiße Garten verschlossen war, konnten keine Golems mehr hinaus, doch durfte ich als letzter Weißer die Stadt nicht verlassen.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_15"); //Jetzt wuchern die Golems jedoch ungehindert, keiner von uns kann sie stutzen. Wenn wir nichts unternehmen, werden sie uns auslöschen.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_16"); //Weiße Echsen sind keine Krieger, und da unsere Tarnung nicht mehr funktioniert können wir nicht ohne Hilfe in den Garten. Du musst uns helfen.
	AI_Output(hero, self, "Info_Mod_Albi_Geheimnis3_15_17"); //Warum lässt du deine Krieger nicht hinziehen?
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_18"); //Narr! Glaubst du sie wissen, dass der Kampf schon lange vorbei ist?
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_19"); //Der Glaube an unseren Feind hält uns zusammen. Würden sie die Wahrheit kennen, wäre unsre Rasse verdammt.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_20"); //Hilfst du uns?
	AI_Output(hero, self, "Info_Mod_Albi_Geheimnis3_15_21"); //Na gut.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_22"); //Wir sind dir zu großem Dank verpflichtet. Ich werde eine Schlacht organisieren. Das wird den Großteil der Golems ablenken.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_23"); //Nimm die beiden hier mit. Mindesten einer von ihnen muss sicher am Garten ankommen, um die Falle zu deaktivieren.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_24"); //Tötet die Golems und findet heraus, was sie so verändert hat!
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis3_23_25"); //Wir werden vor dem Tor warten, wenn du bereit bist, triff uns dort.

	B_LogEntry	(TOPIC_MOD_ECHSIS_EIERSUCHE, "Ich soll zusammen mit den zwei neuen weißen Echsen zum weißen Garten, dem Ursprungsort der Sumpfgolems, aufbrechen und den Grund für ihre Mutation finden. Mindestens eine der weißen Echsen muss den Weg lebendig überstehen, um die Falle am Eingang zu deaktivieren. Albi und die weißen Echsen bereiten nun eine Schlacht vor und erwarten mich dann beim Eingang der Stadt.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ABLENKUNG");
	B_StartOtherRoutine	(Mod_12021_DRA_Albino_AW, "TOR");
	B_StartOtherRoutine	(Mod_12022_DRA_Albino_AW, "TOR");

	B_StartOtherRoutine	(Mod_12002_DRA_Patroullie_AW, "SCHLACHT");
	B_StartOtherRoutine	(Mod_12004_DRA_Wache_AW, "SCHLACHT");
	B_StartOtherRoutine	(Mod_12005_DRA_Wache_AW, "SCHLACHT");
	B_StartOtherRoutine	(Mod_12006_DRA_Echse_AW, "SCHLACHT");
	B_StartOtherRoutine	(Mod_12009_DRA_Echse_AW, "SCHLACHT");
	B_StartOtherRoutine	(Mod_12010_DRA_Echse_AW, "SCHLACHT");
	B_StartOtherRoutine	(Mod_12011_DRA_Echse_AW, "SCHLACHT");
	B_StartOtherRoutine	(Mod_12012_DRA_Echse_AW, "SCHLACHT");
	B_StartOtherRoutine	(Mod_12013_DRA_Echse_AW, "SCHLACHT");
	B_StartOtherRoutine	(Mod_12014_DRA_Echse_AW, "SCHLACHT");
	B_StartOtherRoutine	(Mod_12015_DRA_Echse_AW, "SCHLACHT");
	B_StartOtherRoutine	(Mod_12018_DRA_Echse_AW, "SCHLACHT");
	B_StartOtherRoutine	(Mod_12019_DRA_Echse_AW, "SCHLACHT");

	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_BF_NEST_08");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_BF_NEST_02");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_SHARKSTREET_09");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_SHARKSTREET_08");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_SHARKSTREET_04");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_WAND_03");
	Wld_InsertNpc	(Swampgolem,	"ADW_LITTLE_HILL_03");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_HOHLWEG_05");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_HOHLWEG_02");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_HOHLWEG_01");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_13");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_12");
	Wld_InsertNpc	(Swampgolem,	"ADW_SWAMP_10");
	Wld_InsertNpc	(Swampgolem,	"ADW_SENAT_04");
	Wld_InsertNpc	(Swampgolem,	"ADW_SENAT_MONSTER_01");
	Wld_InsertNpc	(Swampgolem,	"ADW_SENAT_01");
	Wld_InsertNpc	(Swampgolem,	"ADW_PATH_TO_GOLEM_08");
	Wld_InsertNpc	(Swampgolem,	"ADW_BANDIT_VP2_01");

	Wld_InsertNpc	(Alraune_Echsis,	"FP_ROAM_HEILER");
};

INSTANCE Info_Mod_Albi_Geheimnis4 (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Geheimnis4_Condition;
	information	= Info_Mod_Albi_Geheimnis4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin bereit.";
};

FUNC INT Info_Mod_Albi_Geheimnis4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_Geheimnis3))
	&& (Npc_GetDistToWP(self, "BL_ENTRANCE_04_B") < 500)
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Geheimnis4_Info()
{
	AI_Output(hero, self, "Info_Mod_Albi_Geheimnis4_15_00"); //Ich bin bereit.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis4_23_01"); //Sehr gut. Die Schlacht kann beginnen.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis4_23_02"); //Die zwei werden dir folgen, pass gut auf sie auf.

	B_LogEntry	(TOPIC_MOD_ECHSIS_EIERSUCHE, "Ich soll zusammen mit den zwei neuen weißen Echsen zum weißen Garten, dem Ursprungsort der Sumpfgolems, aufbrechen und den Grund für ihre Mutation finden. Mindestens eine der weißen Echsen muss den Weg lebendig überstehen, um die Falle am Eingang zu deaktivieren. Albi und die weißen Echsen bereiten nun eine Schlacht vor und erwarten mich dann beim Eingang der Stadt.");

	B_StartOtherRoutine	(self, "HUT");
	B_StartOtherRoutine	(Mod_12021_DRA_Albino_AW, "FOLLOW");
	B_StartOtherRoutine	(Mod_12022_DRA_Albino_AW, "FOLLOW");

	Mod_12021_DRA_Albino_AW.aivar[AIV_Partymember] = TRUE;
	Mod_12022_DRA_Albino_AW.aivar[AIV_Partymember] = TRUE;

	Wld_InsertNpc	(SwampGolem, "ADW_SWAMP_SIT_BENCH_03");
	Wld_InsertNpc	(SwampGolem, "ADW_SWAMP_SIT_BENCH_03");
	Wld_InsertNpc	(SwampGolem, "ADW_SWAMP_SIT_BENCH_03");
	Wld_InsertNpc	(SwampGolem, "ADW_SWAMP_SIT_BENCH_03");

	Wld_InsertNpc	(SwampGolem, "ADW_PATH_TO_BL_03");
	Wld_InsertNpc	(SwampGolem, "ADW_PATH_TO_BL_03");
	Wld_InsertNpc	(SwampGolem, "ADW_PATH_TO_BL_03");
	Wld_InsertNpc	(SwampGolem, "ADW_PATH_TO_BL_03");

	Wld_InsertNpc	(SwampGolem, "ADW_BANDIT_VP1_04_B");
	Wld_InsertNpc	(SwampGolem, "ADW_BANDIT_VP1_04_B");
	Wld_InsertNpc	(SwampGolem, "ADW_BANDIT_VP1_04_B");
	Wld_InsertNpc	(SwampGolem, "ADW_BANDIT_VP1_04_B");
	Wld_InsertNpc	(SwampGolem, "ADW_BANDIT_VP1_04_B");
};

INSTANCE Info_Mod_Albi_Geheimnis5 (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Geheimnis5_Condition;
	information	= Info_Mod_Albi_Geheimnis5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wir waren erfolgreich.";
};

FUNC INT Info_Mod_Albi_Geheimnis5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_Geheimnis4))
	&& (Mod_AlraunenFalle == 2)
	&& (Npc_IsDead(Alraune_Echsis))
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Geheimnis5_Info()
{
	AI_Output(hero, self, "Info_Mod_Albi_Geheimnis5_15_00"); //Wir waren erfolgreich. Im Garten war eine Alraune.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis5_23_01"); //Das erklärt die Mutationen der Golems. Du hast unsere Rasse vor dem Untergang bewahrt. Du bist unsrer Stadt jederzeit willkommen.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis5_23_02"); //Außerdem hast du dir das Recht des Kriegführers verdient.
	AI_Output(self, hero, "Info_Mod_Albi_Geheimnis5_23_03"); //Wenn du in die Schlacht ziehen willst, sag mir bescheid. Ich werde die Krieger bereitstellen und die Golems reifen lassen.

	B_LogEntry	(TOPIC_MOD_ECHSIS_EIERSUCHE, "Das Problem mit den Golems ist beseitigt und ich bin jetzt ein Kriegsführer der Echsen. Ich kann jetzt jederzeit auf die Jagd nach Golems gehen, wenn mir danach ist.");
	B_SetTopicStatus	(TOPIC_MOD_ECHSIS_EIERSUCHE, LOG_SUCCESS);

	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_18);

	B_GivePlayerXP	(2500);

	Mod_12021_DRA_Albino_AW.aivar[AIV_Partymember] = FALSE;
	Mod_12022_DRA_Albino_AW.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Albi_Unbewaffnet (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Unbewaffnet_Condition;
	information	= Info_Mod_Albi_Unbewaffnet_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll unbewaffnet zu den Golems gehen?";
};

FUNC INT Info_Mod_Albi_Unbewaffnet_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_AtHut))
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Unbewaffnet_Info()
{
	AI_Output(hero, self, "Info_Mod_Albi_Unbewaffnet_15_00"); //Ich soll unbewaffnet zu den Golems gehen? Da hättest du mich gleich vom Sumpfhai zerreissen lassen können.
	AI_Output(self, hero, "Info_Mod_Albi_Unbewaffnet_23_01"); //Hier, Golemherzen.

	B_GiveInvItems	(self, hero, ItAt_SwampGolemHeart, 2);

	AI_Output(hero, self, "Info_Mod_Albi_Unbewaffnet_15_02"); //Was soll ich mit Golemherzen?
	AI_Output(self, hero, "Info_Mod_Albi_Unbewaffnet_23_03"); //Das gleiche wie mit dem letzten, das ich dir gab.
	AI_Output(self, hero, "Info_Mod_Albi_Unbewaffnet_23_04"); //Lege es ins Feuer, nimm die Herzfragmente und kauf dir eine Waffe und Heilkräuter!
};

INSTANCE Info_Mod_Albi_EigeneSachen (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_EigeneSachen_Condition;
	information	= Info_Mod_Albi_EigeneSachen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich vielleicht MEINE Sachen zurückbekommen?";
};

FUNC INT Info_Mod_Albi_EigeneSachen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_AtHut))
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_EigeneSachen_Info()
{
	AI_Output(hero, self, "Info_Mod_Albi_EigeneSachen_15_00"); //Kann ich vielleicht MEINE Sachen zurückbekommen?
	AI_Output(self, hero, "Info_Mod_Albi_EigeneSachen_23_01"); //Nein.
};

INSTANCE Info_Mod_Albi_Schluessel (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_Schluessel_Condition;
	information	= Info_Mod_Albi_Schluessel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wozu ist der Schlüssel?";
};

FUNC INT Info_Mod_Albi_Schluessel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_AtHut))
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_Schluessel_Info()
{
	AI_Output(hero, self, "Info_Mod_Albi_Schluessel_15_00"); //Wozu ist der Schlüssel?
	AI_Output(self, hero, "Info_Mod_Albi_Schluessel_23_01"); //Zu einem Tor im Sumpf, mehr musst du nicht wissen.
	AI_Output(self, hero, "Info_Mod_Albi_Schluessel_23_02"); //Suche es nicht, du würdest nur den Tod finden. Und jetzt geh!
};

INSTANCE Info_Mod_Albi_WarumNichtSelbst (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_WarumNichtSelbst_Condition;
	information	= Info_Mod_Albi_WarumNichtSelbst_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum gehst du nicht selbst?";
};

FUNC INT Info_Mod_Albi_WarumNichtSelbst_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_Schlacht2))
	&& (Mod_Echsis > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albi_WarumNichtSelbst_Info()
{
	AI_Output(hero, self, "Info_Mod_Albi_WarumNichtSelbst_15_00"); //Warum gehst du nicht selbst?
	AI_Output(self, hero, "Info_Mod_Albi_WarumNichtSelbst_23_01"); //Ich bin die letzte weiße Echse, ich darf die Stadt nicht verlassen.
	AI_Output(hero, self, "Info_Mod_Albi_WarumNichtSelbst_15_02"); //Und warum schickst du keinen der Krieger oder Späher.
	AI_Output(self, hero, "Info_Mod_Albi_WarumNichtSelbst_23_03"); //Weil du unsere Sprache nicht sprichst, und dir sowieso niemand glauben würde.
	AI_Output(self, hero, "Info_Mod_Albi_WarumNichtSelbst_23_04"); //Jetzt geh mir aus den Augen.
};

INSTANCE Info_Mod_Albi_EXIT (C_INFO)
{
	npc		= Mod_12003_DRA_Albi_AW;
	nr		= 1;
	condition	= Info_Mod_Albi_EXIT_Condition;
	information	= Info_Mod_Albi_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Albi_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Albi_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};