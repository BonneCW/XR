INSTANCE Info_Mod_Soeren_Hi (C_INFO)
{
	npc		= Mod_7038_VMK_Soeren_TUG;
	nr		= 1;
	condition	= Info_Mod_Soeren_Hi_Condition;
	information	= Info_Mod_Soeren_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Soeren_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Faice))
	&& (Mod_VMG_FaiceGifty_Gift == 4)
	&& (!Npc_IsInState(Mod_1959_VMG_Genn_TUG, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Soeren_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Soeren_Hi_08_00"); //Ich habe schon von dir gehört. Es wäre aber unheimlich freundlich, wenn wir beide uns in Ruhe weiter unterhalten könnten.
	AI_Output(hero, self, "Info_Mod_Soeren_Hi_15_01"); //Ich möchte nur kurz mit Genn sprechen, dann bin ich wieder weg.
	AI_Output(self, hero, "Info_Mod_Soeren_Hi_08_02"); //In Ordnung.

	Mod_VMG_FaiceGifty_Gift = 5;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Soeren_Mendulus (C_INFO)
{
	npc		= Mod_7038_VMK_Soeren_TUG;
	nr		= 1;
	condition	= Info_Mod_Soeren_Mendulus_Condition;
	information	= Info_Mod_Soeren_Mendulus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Soeren_Mendulus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Mendulus))
	&& (Mod_VMG_FaiceGifty_Gift == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Soeren_Mendulus_Info()
{
	AI_Output(self, hero, "Info_Mod_Soeren_Mendulus_08_00"); //Du brauchst also eine seltene Heilpflanze, habe ich mitbekommen?

	Info_ClearChoices	(Info_Mod_Soeren_Mendulus);

	Info_AddChoice	(Info_Mod_Soeren_Mendulus, "Da irrst du dich aber gewaltig.", Info_Mod_Soeren_Mendulus_B);
	Info_AddChoice	(Info_Mod_Soeren_Mendulus, "Und wenn es so wäre?", Info_Mod_Soeren_Mendulus_A);
};

FUNC VOID Info_Mod_Soeren_Mendulus_E()
{
	AI_Output(self, hero, "Info_Mod_Soeren_Mendulus_E_08_00"); //Dann würde ich dich jetzt bitten, sie mir zu geben, damit ein Blutvergießen vermieden wird.

	Info_ClearChoices	(Info_Mod_Soeren_Mendulus);

	Info_AddChoice	(Info_Mod_Soeren_Mendulus, "Und wenn ich sie dir daraufhin nicht geben würde?", Info_Mod_Soeren_Mendulus_I);
	Info_AddChoice	(Info_Mod_Soeren_Mendulus, "Du willst nicht beim Wiederaufbau helfen.", Info_Mod_Soeren_Mendulus_H);
};

FUNC VOID Info_Mod_Soeren_Mendulus_J()
{
	AI_Output(self, hero, "Info_Mod_Soeren_Mendulus_J_08_00"); //Wenn ich dir das sagen würde, müsste ich dich danach töten.
	AI_Output(hero, self, "Info_Mod_Soeren_Mendulus_J_15_01"); //Versuch's doch.

	Info_ClearChoices	(Info_Mod_Soeren_Mendulus);

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Sören ist anscheinend gar nicht der hilfsbereite Mann, den er darstellt. Er wollte mir die Pflanzen abnehmen.");

	B_Attack	(self, hero, AR_Kill, 0);
};

FUNC VOID Info_Mod_Soeren_Mendulus_B()
{
	AI_Output(hero, self, "Info_Mod_Soeren_Mendulus_B_15_00"); //Da irrst du dich aber gewaltig.
	AI_Output(self, hero, "Info_Mod_Soeren_Mendulus_B_08_01"); //Versuch nicht, mich zu verarschen!

	Info_ClearChoices	(Info_Mod_Soeren_Mendulus);

	Info_AddChoice	(Info_Mod_Soeren_Mendulus, "Okay, ich habe die Pflanze, und jetzt?", Info_Mod_Soeren_Mendulus_D);
	Info_AddChoice	(Info_Mod_Soeren_Mendulus, "Würde ich nie tun.", Info_Mod_Soeren_Mendulus_C);
};

FUNC VOID Info_Mod_Soeren_Mendulus_A()
{
	AI_Output(hero, self, "Info_Mod_Soeren_Mendulus_A_15_00"); //Und wenn es so wäre?
	
	Info_Mod_Soeren_Mendulus_E();
};

FUNC VOID Info_Mod_Soeren_Mendulus_D()
{
	AI_Output(hero, self, "Info_Mod_Soeren_Mendulus_D_15_00"); //Okay, ich habe die Pflanze, und jetzt?
	
	Info_Mod_Soeren_Mendulus_E();
};

FUNC VOID Info_Mod_Soeren_Mendulus_C()
{
	AI_Output(hero, self, "Info_Mod_Soeren_Mendulus_C_15_00"); //Würde ich nie tun.
	AI_Output(self, hero, "Info_Mod_Soeren_Mendulus_C_08_01"); //Legst du es drauf an?

	Info_ClearChoices	(Info_Mod_Soeren_Mendulus);

	Info_AddChoice	(Info_Mod_Soeren_Mendulus, "Das können wir auch anders regeln.", Info_Mod_Soeren_Mendulus_G);
	Info_AddChoice	(Info_Mod_Soeren_Mendulus, "Komm doch her.", Info_Mod_Soeren_Mendulus_F);
};

FUNC VOID Info_Mod_Soeren_Mendulus_G()
{
	AI_Output(hero, self, "Info_Mod_Soeren_Mendulus_G_15_00"); //Das können wir auch anders regeln.
	AI_Output(self, hero, "Info_Mod_Soeren_Mendulus_G_08_01"); //Dann gib mir die Pflanze, ich weiß, dass du sie dabei hast.
	AI_Output(hero, self, "Info_Mod_Soeren_Mendulus_I_15_02"); //Dann sag mir, was du damit vorhast.
	
	Info_Mod_Soeren_Mendulus_J();
};

FUNC VOID Info_Mod_Soeren_Mendulus_F()
{
	AI_Output(hero, self, "Info_Mod_Soeren_Mendulus_F_15_00"); //Komm doch her.
	AI_Output(self, hero, "Info_Mod_Soeren_Mendulus_F_08_01"); //Wie du willst.

	Info_ClearChoices	(Info_Mod_Soeren_Mendulus);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

FUNC VOID Info_Mod_Soeren_Mendulus_I()
{
	AI_Output(hero, self, "Info_Mod_Soeren_Mendulus_I_15_00"); //Und wenn ich sie dir daraufhin nicht geben würde?
	AI_Output(self, hero, "Info_Mod_Soeren_Mendulus_I_08_01"); //Dann müsste ich ich leider niederschlagen, aber das tue ich nur höchst ungern.
	AI_Output(hero, self, "Info_Mod_Soeren_Mendulus_I_15_02"); //Dann sag mir, was du damit vorhast.
	
	Info_Mod_Soeren_Mendulus_J();
};

FUNC VOID Info_Mod_Soeren_Mendulus_H()
{
	AI_Output(hero, self, "Info_Mod_Soeren_Mendulus_H_15_00"); //Du willst nicht beim Wiederaufbau helfen.
	AI_Output(self, hero, "Info_Mod_Soeren_Mendulus_H_08_01"); //Du bist aber ein schlaues Bürschen. Natürlich will ich nicht helfen.
	AI_Output(hero, self, "Info_Mod_Soeren_Mendulus_H_15_02"); //Was willst du dann?
	
	Info_Mod_Soeren_Mendulus_J();
};

INSTANCE Info_Mod_Soeren_EXIT (C_INFO)
{
	npc		= Mod_7038_VMK_Soeren_TUG;
	nr		= 1;
	condition	= Info_Mod_Soeren_EXIT_Condition;
	information	= Info_Mod_Soeren_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Soeren_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Soeren_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};