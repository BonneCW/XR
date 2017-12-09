INSTANCE Info_Mod_Pirat_Hi (C_INFO)
{
	npc		= Mod_7585_PIR_PIRAT_NW;
	nr		= 1;
	condition	= Info_Mod_Pirat_Hi_Condition;
	information	= Info_Mod_Pirat_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pirat_Hi_Condition()
{
	if (Npc_HasItems(hero, ItMi_Gold) >= 700)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pirat_Hi_Info()
{
	var C_Item ar;
	ar = Npc_GetEquippedArmor(hero);

	if (Hlp_IsItem(ar, ItAr_Pir_L_Addon) == TRUE)
	|| (Hlp_IsItem(ar, ItAr_Pir_M_Addon) == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Pirat_Hi_07_00"); //Hey, Genosse! Welche Strömung treibt dich her?
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Pirat_Hi_07_01"); //Halt, Bürschchen! Was tust du hier?
	};

	AI_Output(hero, self, "Info_Mod_Pirat_Hi_15_02"); //Ich komme im Auftrag Matteos, um mit dir zu handeln.
	AI_Output(self, hero, "Info_Mod_Pirat_Hi_07_03"); //Is sich der alte Stinker wohl wieder zu fein, was? Also, ich hab hier zwo Kisten mit Grog. Die hat er bei mir bestellt.
	AI_Output(hero, self, "Info_Mod_Pirat_Hi_15_04"); //Wie viel verlangst du für die Kisten?
	AI_Output(self, hero, "Info_Mod_Pirat_Hi_07_05"); //700 Blinker sind die schon wert, meinste nich?

	Info_ClearChoices	(Info_Mod_Pirat_Hi);

	Info_AddChoice	(Info_Mod_Pirat_Hi, "(Feilschen) Das soll wohl ein Witz sein.", Info_Mod_Pirat_Hi_B);
	Info_AddChoice	(Info_Mod_Pirat_Hi, "Kein Problem, hier ist das Gold.", Info_Mod_Pirat_Hi_A);
};

FUNC VOID Info_Mod_Pirat_Hi_Fertig()
{
	B_GiveInvItems	(self, hero, ItMi_GrogPaket_Matteo, 2);

	B_LogEntry	(TOPIC_MOD_LEHRLING_MATTEO_THREE, "Ich habe die zwei Kisten. Jetzt muss ich sie nur noch bei Matteo abliefern.");

	Info_ClearChoices	(Info_Mod_Pirat_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Pirat_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Pirat_Hi_B_15_00"); //Das soll wohl ein Witz sein.

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Pirat_Hi_B_07_01"); //Hey, is ja gut. Dann sagen wir 500.

		B_RaiseHandelsgeschick (2);

		Info_ClearChoices	(Info_Mod_Pirat_Hi);

		Info_AddChoice	(Info_Mod_Pirat_Hi, "(Feilschen) So viel kannst du ja wohl schlecht verlangen!", Info_Mod_Pirat_Hi_D);
		Info_AddChoice	(Info_Mod_Pirat_Hi, "Alles klar.", Info_Mod_Pirat_Hi_C);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Pirat_Hi_B_07_02"); //Hör mal, Matrose: Verscherz es dir nicht mit mir, klar? 700 Mäuse oder es läuft nix.

		Info_ClearChoices	(Info_Mod_Pirat_Hi);

		Info_AddChoice	(Info_Mod_Pirat_Hi, "Kein Problem, hier ist das Gold.", Info_Mod_Pirat_Hi_A);
	};
};

FUNC VOID Info_Mod_Pirat_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Pirat_Hi_A_15_00"); //Kein Problem, hier ist das Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 700);

	B_GivePlayerXP	(50);

	Info_Mod_Pirat_Hi_Fertig();
};

FUNC VOID Info_Mod_Pirat_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Pirat_Hi_D_15_00"); //So viel kannst du ja wohl schlecht verlangen!

	if (Hlp_Random(100) < Mod_Verhandlungsgeschick)
	{
		AI_Output(self, hero, "Info_Mod_Pirat_Hi_D_07_01"); //Okay, okay. 350. Aber drunter geht's nicht.

		B_RaiseHandelsgeschick (2);

		Info_ClearChoices	(Info_Mod_Pirat_Hi);

		Info_AddChoice	(Info_Mod_Pirat_Hi, "(Feilschen) So kommen wir nicht ins Geschäft.", Info_Mod_Pirat_Hi_F);
		Info_AddChoice	(Info_Mod_Pirat_Hi, "Meinetwegen.", Info_Mod_Pirat_Hi_E);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Pirat_Hi_D_07_02"); //Das ist ein verdammt guter Preis. Entweder du zahlst oder du gehst.

		Info_ClearChoices	(Info_Mod_Pirat_Hi);

		Info_AddChoice	(Info_Mod_Pirat_Hi, "Alles klar.", Info_Mod_Pirat_Hi_C);
	};
};

FUNC VOID Info_Mod_Pirat_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Pirat_Hi_C_15_00"); //Alles klar.

	B_GiveInvItems	(hero, self, ItMi_Gold, 500);

	B_GivePlayerXP	(150);

	Info_Mod_Pirat_Hi_Fertig();
};

FUNC VOID Info_Mod_Pirat_Hi_F()
{
	AI_Output(hero, self, "Info_Mod_Pirat_Hi_F_15_00"); //So kommen wir nicht ins Geschäft.

	if (Hlp_Random(100) < Mod_Verhandlungsgeschick)
	{
		AI_Output(self, hero, "Info_Mod_Pirat_Hi_F_07_01"); //(verzweifelt) 200 Gold ist wirklich mein letztes Angebot.

		B_RaiseHandelsgeschick (2);

		Info_ClearChoices	(Info_Mod_Pirat_Hi);

		Info_AddChoice	(Info_Mod_Pirat_Hi, "Abgemacht. Ist doch ein guter Preis jetzt.", Info_Mod_Pirat_Hi_G);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Pirat_Hi_F_07_02"); //Hältst du dich für eine Art Jedi oder so, dass du immer so mit der Hand fuchtelst? Solche Tricks funktionieren bei mir nicht!

		Info_ClearChoices	(Info_Mod_Pirat_Hi);

		Info_AddChoice	(Info_Mod_Pirat_Hi, "Meinetwegen.", Info_Mod_Pirat_Hi_E);
	};
};

FUNC VOID Info_Mod_Pirat_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Pirat_Hi_E_15_00"); //Meinetwegen.

	B_GiveInvItems	(hero, self, ItMi_Gold, 350);

	B_GivePlayerXP	(300);

	Info_Mod_Pirat_Hi_Fertig();
};

FUNC VOID Info_Mod_Pirat_Hi_G()
{
	AI_Output(hero, self, "Info_Mod_Pirat_Hi_G_15_00"); //Abgemacht. Ist doch ein guter Preis jetzt.

	B_GiveInvItems	(hero, self, ItMi_Gold, 200);

	B_GivePlayerXP	(600);

	Info_Mod_Pirat_Hi_Fertig();
};