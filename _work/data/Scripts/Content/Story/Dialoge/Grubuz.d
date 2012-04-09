INSTANCE Info_Mod_Grubuz_Stollen (C_INFO)
{
	npc		= Mod_4022_Orc_Grubuz_MT;
	nr		= 1;
	condition	= Info_Mod_Grubuz_Stollen_Condition;
	information	= Info_Mod_Grubuz_Stollen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Grubuz_Stollen_Condition()
{
	if (Mod_Hermy_KnowsQuest == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grubuz_Stollen_Info()
{
	AI_Output(self, hero, "Info_Mod_Grubuz_Stollen_18_00"); //Was Mensch wollen hier?
	
	Info_ClearChoices	(Info_Mod_Grubuz_Stollen);

	Info_AddChoice	(Info_Mod_Grubuz_Stollen, "Ich will euch stinkende Orks ausrotten!", Info_Mod_Grubuz_Stollen_B);
	Info_AddChoice	(Info_Mod_Grubuz_Stollen, "Ich muss in den Stollen, den ihr ausgegraben habt.", Info_Mod_Grubuz_Stollen_A);
};

FUNC VOID Info_Mod_Grubuz_Stollen_B()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Stollen_B_15_00"); //Ich will euch stinkende Orks ausrotten!
	AI_Output(self, hero, "Info_Mod_Grubuz_Stollen_B_18_01"); //Mensch böse, warum Gobshak lassen ihn zu mir?

	Info_ClearChoices	(Info_Mod_Grubuz_Stollen);

	Info_AddChoice	(Info_Mod_Grubuz_Stollen, "Das ist uninteressant. Interessanter ist, ob du Kämpfen kannst, du Schwächling!", Info_Mod_Grubuz_Stollen_D);
	Info_AddChoice	(Info_Mod_Grubuz_Stollen, "Das war nur ein Versprecher von mir.", Info_Mod_Grubuz_Stollen_C);
};

FUNC VOID Info_Mod_Grubuz_Stollen_A()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Stollen_A_15_00"); //Ich muss in den Stollen, den ihr ausgegraben habt.
	AI_Output(self, hero, "Info_Mod_Grubuz_Stollen_A_18_01"); //Warum?

	Info_ClearChoices	(Info_Mod_Grubuz_Stollen);

	Info_AddChoice	(Info_Mod_Grubuz_Stollen, "Dort müssen irgendwo noch Spruchrollen herumliegen, die ich benötige.", Info_Mod_Grubuz_Stollen_F);
	Info_AddChoice	(Info_Mod_Grubuz_Stollen, "Das ist ein Geheimnis.", Info_Mod_Grubuz_Stollen_E);
};

FUNC VOID Info_Mod_Grubuz_Stollen_D()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Stollen_D_15_00"); //Das ist uninteressant. Interessanter ist, ob du Kämpfen kannst, du Schwächling!

	Info_ClearChoices	(Info_Mod_Grubuz_Stollen);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

FUNC VOID Info_Mod_Grubuz_Stollen_C()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Stollen_C_15_00"); //Das war nur ein Versprecher von mir.
	AI_Output(self, hero, "Info_Mod_Grubuz_Stollen_C_18_01"); //Ich überhört habe. Was wollen Mensch also?

	Info_ClearChoices	(Info_Mod_Grubuz_Stollen);

	Info_AddChoice	(Info_Mod_Grubuz_Stollen, "Ich muss in den Stollen, den ihr ausgegraben habt.", Info_Mod_Grubuz_Stollen_A);
};

FUNC VOID Info_Mod_Grubuz_Stollen_E()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Stollen_E_15_00"); //Das ist ein Geheimnis.
	AI_Output(self, hero, "Info_Mod_Grubuz_Stollen_E_18_01"); //Mensch ... du müssen mir Geheimnis sagen, sonst ich nicht kann dich in Stollen lassen.

	Info_ClearChoices	(Info_Mod_Grubuz_Stollen);

	Info_AddChoice	(Info_Mod_Grubuz_Stollen, "Dort müssen irgendwo noch Spruchrollen herumliegen, die ich benötige.", Info_Mod_Grubuz_Stollen_F);
	Info_AddChoice	(Info_Mod_Grubuz_Stollen, "Ich denke gar nicht daran.", Info_Mod_Grubuz_Stollen_G);
};

FUNC VOID Info_Mod_Grubuz_Stollen_F()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Stollen_F_15_00"); //Dort müssen irgendwo noch Spruchrollen herumliegen, die ich benötige.
	AI_Output(self, hero, "Info_Mod_Grubuz_Stollen_F_18_01"); //Wir nicht gefunden haben Spruchrollen. Du können rein und suchen.
	AI_Output(hero, self, "Info_Mod_Grubuz_Stollen_F_15_02"); //Danke. Wir sehen uns.
	AI_Output(self, hero, "Info_Mod_Grubuz_Stollen_F_18_03"); //Es ehren mich, Dank zu haben.

	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "Ich habe die Erlaubnis von Grubuz, den Stollen zu betreten. Er sagt aber, dass die Orks dort keine Spruchrollen gefunden haben. Ich werde mich wohl genauer umsehen müssen.");

	Mod_Hermy_KnowsQuest = 3;

	Info_ClearChoices	(Info_Mod_Grubuz_Stollen);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Grubuz_Stollen_G()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Stollen_G_15_00"); //Ich denke gar nicht daran.
	AI_Output(self, hero, "Info_Mod_Grubuz_Stollen_G_18_01"); //Dann ich dich nicht kann in den Stollen lassen.
	AI_Output(hero, self, "Info_Mod_Grubuz_Stollen_G_15_02"); //Okay, ich sage es dir.

	Info_Mod_Grubuz_Stollen_F();
};

INSTANCE Info_Mod_Grubuz_Emerin (C_INFO)
{
	npc		= Mod_4022_Orc_Grubuz_MT;
	nr		= 1;
	condition	= Info_Mod_Grubuz_Emerin_Condition;
	information	= Info_Mod_Grubuz_Emerin_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Grubuz_Emerin_Condition()
{
	if (Mod_Hermy_KnowsQuest == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grubuz_Emerin_Info()
{
	AI_Output(self, hero, "Info_Mod_Grubuz_Emerin_18_00"); //Was du wollen hier?
	
	Info_ClearChoices	(Info_Mod_Grubuz_Emerin);

	Info_AddChoice	(Info_Mod_Grubuz_Emerin, "Die Frage ist doch: Was machst du hier?", Info_Mod_Grubuz_Emerin_B);
	Info_AddChoice	(Info_Mod_Grubuz_Emerin, "Die Spruchrolle, du stinkendes Monster.", Info_Mod_Grubuz_Emerin_A);
};

FUNC VOID Info_Mod_Grubuz_Emerin_K()
{
	AI_Output(self, hero, "Info_Mod_Grubuz_Emerin_K_18_00"); //Grubuz brauchen ein wenig frische Luft.

	Info_ClearChoices	(Info_Mod_Grubuz_Emerin);

	Info_AddChoice	(Info_Mod_Grubuz_Emerin, "Warum läufst du dann so weit fort?", Info_Mod_Grubuz_Emerin_L);
	Info_AddChoice	(Info_Mod_Grubuz_Emerin, "Rück' die Spruchrolle raus oder ich bringe dich um.", Info_Mod_Grubuz_Emerin_E);
};

FUNC VOID Info_Mod_Grubuz_Emerin_B()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Emerin_B_15_00"); //Die Frage ist doch: was machst du hier?

	Info_Mod_Grubuz_Emerin_K();
};

FUNC VOID Info_Mod_Grubuz_Emerin_A()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Emerin_A_15_00"); //Die Spruchrolle, du stinkendes Monster.
	AI_Output(self, hero, "Info_Mod_Grubuz_Emerin_A_18_01"); //Grubuz haben keine Spruchrolle. Grubuz nicht wissen, wovon Mensch reden.

	Info_ClearChoices	(Info_Mod_Grubuz_Emerin);

	Info_AddChoice	(Info_Mod_Grubuz_Emerin, "Warum bist du dann weggelaufen?", Info_Mod_Grubuz_Emerin_O);
	Info_AddChoice	(Info_Mod_Grubuz_Emerin, "Rück' die Spruchrolle raus oder ich bringe dich um.", Info_Mod_Grubuz_Emerin_E);
};

FUNC VOID Info_Mod_Grubuz_Emerin_O()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Emerin_O_15_00"); //Warum bist du dann weggelaufen?

	Info_Mod_Grubuz_Emerin_K();
};

FUNC VOID Info_Mod_Grubuz_Emerin_L()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Emerin_L_15_00"); //Warum läufst du dann so weit fort?
	AI_Output(self, hero, "Info_Mod_Grubuz_Emerin_L_18_01"); //Bei Wald die Luft sein am Besten.

	Info_ClearChoices	(Info_Mod_Grubuz_Emerin);

	Info_AddChoice	(Info_Mod_Grubuz_Emerin, "Und warum hast du dich dann nicht bei Gobshak abgemeldet?", Info_Mod_Grubuz_Emerin_N);
	Info_AddChoice	(Info_Mod_Grubuz_Emerin, "Sag mal, willst du mich verarschen? Rück' sofort die Spruchrolle raus!", Info_Mod_Grubuz_Emerin_M);
};

FUNC VOID Info_Mod_Grubuz_Emerin_E()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Emerin_E_15_00"); //Rück' die Spruchrolle raus oder ich bringe dich um.
	AI_Output(self, hero, "Info_Mod_Grubuz_Emerin_E_18_01"); //Wenn du wirklich wollen kämpfen, Grubuz dich umbringen.

	Info_ClearChoices	(Info_Mod_Grubuz_Emerin);

	Info_AddChoice	(Info_Mod_Grubuz_Emerin, "Gib mir die Spruchrolle doch einfach und wir sind quitt.", Info_Mod_Grubuz_Emerin_F);
	Info_AddChoice	(Info_Mod_Grubuz_Emerin, "Dann komm doch her!", Info_Mod_Grubuz_Emerin_G);
};

FUNC VOID Info_Mod_Grubuz_Emerin_H()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Emerin_H_15_00"); //Was denn?
	AI_Output(self, hero, "Info_Mod_Grubuz_Emerin_H_18_01"); //Du mich nicht umbringen und mir Versprechen geben, dass mich nicht weiter verfolgen.

	Info_ClearChoices	(Info_Mod_Grubuz_Emerin);

	Info_AddChoice	(Info_Mod_Grubuz_Emerin, "Egal, du stirbst jetzt.", Info_Mod_Grubuz_Emerin_J);
	Info_AddChoice	(Info_Mod_Grubuz_Emerin, "Okay, ich verspreche es.", Info_Mod_Grubuz_Emerin_I);
};

FUNC VOID Info_Mod_Grubuz_Emerin_F()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Emerin_F_15_00"); //Gib mir die Spruchrolle doch einfach und wir sind quitt.
	AI_Output(self, hero, "Info_Mod_Grubuz_Emerin_F_18_01"); //Du müssen mir aber etwas versprechen.

	Info_Mod_Grubuz_Emerin_H();
};

FUNC VOID Info_Mod_Grubuz_Emerin_G()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Emerin_G_15_00"); //Dann komm doch her!

	CreateInvItems	(self, ItSc_TrfHarpie, 1);

	Info_ClearChoices	(Info_Mod_Grubuz_Emerin);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

FUNC VOID Info_Mod_Grubuz_Emerin_J()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Emerin_J_15_00"); //Egal, du stirbst jetzt.

	CreateInvItems	(self, ItSc_TrfHarpie, 1);

	Info_ClearChoices	(Info_Mod_Grubuz_Emerin);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

FUNC VOID Info_Mod_Grubuz_Emerin_I()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Emerin_I_15_00"); //Okay, ich verspreche es.
	AI_Output(self, hero, "Info_Mod_Grubuz_Emerin_I_18_01"); //Hier, Grubuz dir geben Spruro ... Spuch ... Zauber.

	CreateInvItems	(self, ItSc_TrfHarpie, 1);
	B_GiveInvItems	(self, hero, ItSc_TrfHarpie, 1);

	AI_Output(hero, self, "Info_Mod_Grubuz_Emerin_I_15_02"); //Ich halte mein Wort. Du kannst gehen.
	AI_Output(self, hero, "Info_Mod_Grubuz_Emerin_I_18_03"); //Hoffentlich wir uns sehen nie wieder.

	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "Ich habe die Spruchrolle 'Verwandlung Harpie'. Jetzt sollte ich damit zu Hermy gehen.");

	B_StartOtherRoutine	(self, "START");

	Mod_Hermy_KnowsQuest = 9;

	Info_ClearChoices	(Info_Mod_Grubuz_Emerin);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Grubuz_Emerin_N()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Emerin_N_15_00"); //Und warum hast du dich dann nicht bei Gobshak abgemeldet?
	AI_Output(self, hero, "Info_Mod_Grubuz_Emerin_N_18_01"); //Hören auf Grubuz zu quälen! Ich dir geben Rolle, wenn du mir etwas versprechen.

	Info_Mod_Grubuz_Emerin_H();
};

FUNC VOID Info_Mod_Grubuz_Emerin_M()
{
	AI_Output(hero, self, "Info_Mod_Grubuz_Emerin_M_15_00"); //Sag mal, willst du mich verarschen? Rück' sofort die Spruchrolle raus!
	AI_Output(self, hero, "Info_Mod_Grubuz_Emerin_M_18_01"); //Du wollen kämpfen? Grubuz dich umbringen.

	Info_Mod_Grubuz_Emerin_G();
};

INSTANCE Info_Mod_Grubuz_EXIT (C_INFO)
{
	npc		= Mod_4022_Orc_Grubuz_MT;
	nr		= 1;
	condition	= Info_Mod_Grubuz_EXIT_Condition;
	information	= Info_Mod_Grubuz_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Grubuz_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Grubuz_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};