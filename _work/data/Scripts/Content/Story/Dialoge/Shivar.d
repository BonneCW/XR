INSTANCE Info_Mod_Shivar_Hi (C_INFO)
{
	npc		= Monster_11038_Shivar_REL;
	nr		= 1;
	condition	= Info_Mod_Shivar_Hi_Condition;
	information	= Info_Mod_Shivar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Shivar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Shivar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_20_00"); //Ein einsames dämonisches Wesen? Was treibst du hier? Sprich!

	Info_ClearChoices	(Info_Mod_Shivar_Hi);

	Info_AddChoice	(Info_Mod_Shivar_Hi, "Ich wurde von einem Diener Beliar’s entsandt.", Info_Mod_Shivar_Hi_C);
	Info_AddChoice	(Info_Mod_Shivar_Hi, "Ich bin ein Diener des Gleichgewichtes (...)", Info_Mod_Shivar_Hi_B);
	Info_AddChoice	(Info_Mod_Shivar_Hi, "Ich will dich davor warnen deinen wahnwitzigen Feldzug fortzuführen.", Info_Mod_Shivar_Hi_A);
};

FUNC VOID Info_Mod_Shivar_Hi_D()
{
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_D_20_00"); //(unterbricht) Acha, noch ein Verräter. Stirb!

	Info_ClearChoices	(Info_Mod_Shivar_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

FUNC VOID Info_Mod_Shivar_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Shivar_Hi_C_15_00"); //Ich wurde von einem Diener Beliar’s entsandt. Ich versuche zu erfahren, wieso du die Verwüstungen auf Khorinis bewirkt hast.
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_C_20_01"); //Was maßt du dir an mein Handeln in Frage zu stellen?
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_C_20_02"); //Ich muss mich wohl kaum vor einem niederen Dämon wie dir verantworten, warum ich die Feinde meines Meisters Beliar zerschmettere.
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_C_20_03"); //Oder bist du gar auch einer von ihnen?
	AI_Output(hero, self, "Info_Mod_Shivar_Hi_C_15_04"); //Nein, auf keinen Fall. Aber der Fokus sollte sich doch auf einen viel gefährlicheren Feind richten, Xeres.
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_C_20_05"); //Xeres?! Es ist mir, als hätte ich den Namen schon gehört ... Das tut aber auch nichts zur Sache.
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_C_20_06"); //Meine Kreaturen sind von Beliar abgefallen und dienen nun anderen ... ich bin mir sicher, dass die Lakaien Innos und Adanos dafür verantwortlich sind.
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_C_20_07"); //Und dafür werden sie büßen.
	AI_Output(hero, self, "Info_Mod_Shivar_Hi_C_15_08"); //Ich versichere dir, dass nicht sie, sondern der trügerische Magier Xeres samt seiner Lakaien dahinter stecken.
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_C_20_09"); //Was soll dieser Unsinn? Du versuchst mich doch auf eine falsche Fährte zu locken.
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_C_20_10"); //Womöglich gehörst du gar zu den Verrätern.
	AI_Output(hero, self, "Info_Mod_Shivar_Hi_C_15_11"); //Nein, das kann ich dir auf den Namen jeder Gottheit beschwören, wenn du es verlangst.
	AI_Output(hero, self, "Info_Mod_Shivar_Hi_C_15_12"); //Was kann ich nur tun, um dich von dem Wahrheitsgehalt meiner Worte zu überzeugen?
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_C_20_13"); //Mich von diesem Unsinn überzeugen? Du scheinst dir ja deiner Sache sehr sicher zu sein.
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_C_20_14"); //Wir werden sehen, denn es ist mir eine Möglichkeit eingefallen, wie du dich beweisen kannst.
	AI_Output(hero, self, "Info_Mod_Shivar_Hi_C_15_15"); //Ja?
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_C_20_16"); //Ich habe  eine Gruppe abgefallener Dämonen ausgemacht und bin hier, um sie zu strafen.
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_C_20_17"); //Leider halten sie sich in dieser Höhle vor meinem Zugriff verborgen.
	AI_Output(self, hero, "Info_Mod_Shivar_Hi_C_20_18"); //Wenn du es schaffst sie herauszulocken, sodass ich sie ihrer gerechten Strafe zuführen kann, werde ich über deine Worte nachdenken.

	B_LogEntry	(TOPIC_MOD_ADANOS_RASEND, "Shivar scheint Beliar weiterhin ergeben zu sein. Unser Glück. Er gibt jedoch den Anhängern der beiden anderen Gottheiten die Schuld an dem Verrat seiner einstigen Diener. Um ihn davon zu überzeugen, dass Xeres hinter allem steckt, soll ich nun einige abgefallene Kreaturen aus der Höhle in der Nähe hervorlocken, damit Shivar sie vernichten kann.");

	Mod_ShivarLieb = 1;

	Info_ClearChoices	(Info_Mod_Shivar_Hi);

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Demon_Shivar_01,	"REL_SURFACE_100");
	Wld_InsertNpc	(Demon_Shivar_02,	"REL_SURFACE_100");
	Wld_InsertNpc	(Demon_Shivar_03,	"REL_SURFACE_100");
	Wld_InsertNpc	(Demon_Shivar_04,	"REL_SURFACE_100");
	Wld_InsertNpc	(Demon_Shivar_05,	"REL_SURFACE_100");
};

FUNC VOID Info_Mod_Shivar_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Shivar_Hi_B_15_00"); //Ich bin ein Diener des Gleichgewichtes und versuche weiteres unnötiges ...

	Info_Mod_Shivar_Hi_D();
};

FUNC VOID Info_Mod_Shivar_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Shivar_Hi_A_15_00"); //Ich will dich davor warnen deinen wahnwitzigen Feldzug fortzuführen. Er ...

	Info_Mod_Shivar_Hi_D();
};

INSTANCE Info_Mod_Shivar_DemonsDead (C_INFO)
{
	npc		= Monster_11038_Shivar_REL;
	nr		= 1;
	condition	= Info_Mod_Shivar_DemonsDead_Condition;
	information	= Info_Mod_Shivar_DemonsDead_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Shivar_DemonsDead_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Shivar_Hi))
	&& (Npc_IsDead(Demon_Shivar_01))
	&& (Npc_IsDead(Demon_Shivar_02))
	&& (Npc_IsDead(Demon_Shivar_03))
	&& (Npc_IsDead(Demon_Shivar_04))
	&& (Npc_IsDead(Demon_Shivar_05))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shivar_DemonsDead_Info()
{
	AI_Output(self, hero, "Info_Mod_Shivar_DemonsDead_20_00"); //Ja, so sollen alle Feinde und Verräter Beliars zerschmettert werden, haha ...
	AI_Output(self, hero, "Info_Mod_Shivar_DemonsDead_20_01"); //Nun, du hast deine Sache gut gemacht und mir bewiesen, dass du auf der richtigen Seite stehst ...
	AI_Output(self, hero, "Info_Mod_Shivar_DemonsDead_20_02"); //Ich werde diese Insel verlassen und mich zu den kalten Gebieten begeben.
	AI_Output(self, hero, "Info_Mod_Shivar_DemonsDead_20_03"); //Ich habe dort einige verräterische Dämonen erspürt ... darunter auch ein sehr mächtiges Geschöpf, welches sie vermutlich anführt.
	AI_Output(self, hero, "Info_Mod_Shivar_DemonsDead_20_04"); //Die Bastarde scheinen sich dort zu sammeln ...
	AI_Output(self, hero, "Info_Mod_Shivar_DemonsDead_20_05"); //Nun denn, Beliar sei mit dir. Vielleicht werden sich unsere Wege eines Tages wieder kreuzen, Dämon ...

	B_LogEntry	(TOPIC_MOD_ADANOS_RASEND, "Ausgezeichnet. Er verlässt die Insel, um in kalten Gebieten auf die Jagd nach Verrätern zu gehen… und ich kann endlich wieder aus dieser Gestalt heraus. Saturas wird über meinen Erfolg nicht meckern können ...");

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "TOT");
	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Shivar_EXIT (C_INFO)
{
	npc		= Monster_11038_Shivar_REL;
	nr		= 1;
	condition	= Info_Mod_Shivar_EXIT_Condition;
	information	= Info_Mod_Shivar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Shivar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Shivar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};