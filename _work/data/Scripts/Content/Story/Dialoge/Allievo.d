INSTANCE Info_Mod_Allievo_Hi (C_INFO)
{
	npc		= Mod_7033_OUT_Allievo_NW;
	nr		= 1;
	condition	= Info_Mod_Allievo_Hi_Condition;
	information	= Info_Mod_Allievo_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Allievo_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Allievo_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Allievo_Hi_07_00"); //(kühn) Was willst du von mir?

	Info_ClearChoices	(Info_Mod_Allievo_Hi);

	Info_AddChoice	(Info_Mod_Allievo_Hi, "Falsche Frage. Was wollt ihr von mir?", Info_Mod_Allievo_Hi_B);
	Info_AddChoice	(Info_Mod_Allievo_Hi, "Bist du etwa ganz allein?", Info_Mod_Allievo_Hi_A);
};

FUNC VOID Info_Mod_Allievo_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Allievo_Hi_B_15_00"); //Falsche Frage. Was wollt ihr von mir?
	AI_Output(self, hero, "Info_Mod_Allievo_Hi_B_07_01"); //(erkennend) Ahh... Mein Meister versprach mir, dass ich mit dir machen könnte, was ich wollte.
	AI_Output(self, hero, "Info_Mod_Allievo_Hi_B_07_02"); //Unglücklicherweise bin ich gerade allein ...

	Info_ClearChoices	(Info_Mod_Allievo_Hi);

	Info_AddChoice	(Info_Mod_Allievo_Hi, "Wer ist denn normalerweise sonst noch hier?", Info_Mod_Allievo_Hi_D);
	Info_AddChoice	(Info_Mod_Allievo_Hi, "Was für ein begrüßenswerter Zufall, dass du allein bist. Jetzt bist du fällig!", Info_Mod_Allievo_Hi_C);
};

FUNC VOID Info_Mod_Allievo_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Allievo_Hi_A_15_00"); //Bist du etwa ganz allein?
	AI_Output(self, hero, "Info_Mod_Allievo_Hi_A_07_01"); //Jetzt vielleicht schon, aber jeden Moment kommen meine Freunde zurück. Wart's nur ab!

	Info_ClearChoices	(Info_Mod_Allievo_Hi);

	Info_AddChoice	(Info_Mod_Allievo_Hi, "Wer ist denn normalerweise sonst noch hier?", Info_Mod_Allievo_Hi_D);
	Info_AddChoice	(Info_Mod_Allievo_Hi, "Was für ein begrüßenswerter Zufall, dass du allein bist. Jetzt bist du fällig!", Info_Mod_Allievo_Hi_C);
};

FUNC VOID Info_Mod_Allievo_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Allievo_Hi_D_15_00"); //Wer ist denn normalerweise sonst noch hier?
	AI_Output(self, hero, "Info_Mod_Allievo_Hi_D_07_01"); //(redselig) Der Bruno, unser stiernackiger Tagedieb, und der gerissene Grima. Beides ausgezeichnete Leute.
	AI_Output(self, hero, "Info_Mod_Allievo_Hi_D_07_02"); //Äh ... (Nachdenkpause) Sie sind gerade unterwegs, aber es wird noch gaaanz lange dauern, bis sie wieder hier sind.
	AI_Output(self, hero, "Info_Mod_Allievo_Hi_D_07_03"); //Bis dahin sollte ich ein paar Pflanzen sammeln gehen, naja, du weißt schon, Heilkräuter und so einen Kram, was man halt so gebrauchen kann. (langgezogenes, mühsames Lachen)

	Info_ClearChoices	(Info_Mod_Allievo_Hi);

	Info_AddChoice	(Info_Mod_Allievo_Hi, "Wenn du schon so gern redest: Erzähl mir etwas über Canthar.", Info_Mod_Allievo_Hi_F);
	Info_AddChoice	(Info_Mod_Allievo_Hi, "Genug! Du wirst für Canthar' Taten leiden!", Info_Mod_Allievo_Hi_E);
};

FUNC VOID Info_Mod_Allievo_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Allievo_Hi_C_15_00"); //Was für ein begrüßenswerter Zufall, dass du allein bist. Jetzt bist du fällig!
	AI_Output(self, hero, "DEFAULT"); //
	
	Info_ClearChoices	(Info_Mod_Allievo_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Allievo_Hi_F()
{
	AI_Output(hero, self, "Info_Mod_Allievo_Hi_F_15_00"); //Wenn du schon so gern redest: Erzähl mir etwas über Canthar.
	AI_Output(self, hero, "Info_Mod_Allievo_Hi_F_07_01"); //Wo soll ich anfangen? Also, er spricht im Schlaf. Deshalb weiß ich, dass er auf Sonja steht.
	AI_Output(self, hero, "Info_Mod_Allievo_Hi_F_07_02"); //Und er behauptet manchmal, sein Ziel sei es, die Weltherrschaft zu erringen.
	AI_Output(self, hero, "Info_Mod_Allievo_Hi_F_07_03"); //Aber das glaube ich nicht, was soll man schließlich damit? Ist doch nur zusätzlicher Ärger.
	AI_Output(self, hero, "Info_Mod_Allievo_Hi_F_07_04"); //Äh ... (laut) Bruno, Grima, fasst ihn!

	Info_ClearChoices	(Info_Mod_Allievo_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);

	Mod_Allievo_Zusatzpower = 1;

	Wld_InsertNpc	(Mod_7034_OUT_Bruno_NW, "WAY_PASS_MILL_04");
	Wld_InsertNpc	(Mod_7035_OUT_Grima_NW, "WAY_PASS_MILL_04");
};

FUNC VOID Info_Mod_Allievo_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Allievo_Hi_E_15_00"); //Genug! Du wirst für Canthars Taten leiden!

	Info_ClearChoices	(Info_Mod_Allievo_Hi);

	AI_StopProcessInfos	(self);
};