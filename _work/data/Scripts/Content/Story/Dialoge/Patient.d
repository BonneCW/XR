INSTANCE Info_Mod_Patient_Endres (C_INFO)
{
	npc		= Mod_7491_OUT_Patient_REL;
	nr		= 1;
	condition	= Info_Mod_Patient_Endres_Condition;
	information	= Info_Mod_Patient_Endres_Info;
	permanent	= 0;
	important	= 0;
	description	= "Stimmt es, dass der Heiler bei dir war, als Endres ermordet (...)";
};

FUNC INT Info_Mod_Patient_Endres_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Heiler_Endres03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Patient_Endres_Info()
{
	AI_Output(hero, self, "Info_Mod_Patient_Endres_15_00"); //Stimmt es, dass der Heiler bei dir war, als Endres ermordet wurde?
	AI_Output(self, hero, "Info_Mod_Patient_Endres_01_01"); //Ich kann es nicht genau sagen. An dem Tag bin ich komischerweise mittags eingeschlafen und erst abends wieder aufgewacht.
	AI_Output(self, hero, "Info_Mod_Patient_Endres_01_02"); //Aber der Heiler war da, bevor ich eingeschlafen und nachdem ich aufgewacht bin.

	if (!Npc_KnowsInfo(hero, Info_Mod_Richter_Endres02)) {
		B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Der Patient hat einen Großteil des Tages 'komischerweise' verschlafen. Das Alibi des Heilers ist also löchrig.");
	};
};

INSTANCE Info_Mod_Patient_WasFehlt (C_INFO)
{
	npc		= Mod_7491_OUT_Patient_REL;
	nr		= 1;
	condition	= Info_Mod_Patient_WasFehlt_Condition;
	information	= Info_Mod_Patient_WasFehlt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na, woran fehlt es uns denn?";
};

FUNC INT Info_Mod_Patient_WasFehlt_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Patient_WasFehlt_Info()
{
	AI_Output(hero, self, "Info_Mod_Patient_WasFehlt_15_00"); //Na, woran fehlt es uns denn?
	AI_Output(self, hero, "Info_Mod_Patient_WasFehlt_01_01"); //Am Betäubungsmittel. Hast du vielleicht was Hochprozentiges dabei?

	Info_ClearChoices	(Info_Mod_Patient_WasFehlt);

	Info_AddChoice	(Info_Mod_Patient_WasFehlt, "Ich hab nichts für dich.", Info_Mod_Patient_WasFehlt_B);

	if (Npc_HasItems(hero, ItFo_Booze) >= 1)
	|| (Npc_HasItems(hero, ItFo_Addon_Grog) >= 1)
	|| (Npc_HasItems(hero, ItFo_Addon_Rum) >= 1)
	{
		Info_AddChoice	(Info_Mod_Patient_WasFehlt, "Na sicher.", Info_Mod_Patient_WasFehlt_A);
	};
};

FUNC VOID Info_Mod_Patient_WasFehlt_B()
{
	AI_Output(hero, self, "Info_Mod_Patient_WasFehlt_B_15_00"); //Ich hab nichts für dich.

	Info_ClearChoices	(Info_Mod_Patient_WasFehlt);
};

FUNC VOID Info_Mod_Patient_WasFehlt_A()
{
	AI_Output(hero, self, "Info_Mod_Patient_WasFehlt_A_15_00"); //Na sicher.
	AI_Output(self, hero, "Info_Mod_Patient_WasFehlt_A_01_01"); //Was denn?

	Info_ClearChoices	(Info_Mod_Patient_WasFehlt);

	if (Npc_HasItems(hero, ItFo_Booze) >= 1)
	{
		Info_AddChoice	(Info_Mod_Patient_WasFehlt, "Grog wird dir sicher helfen.", Info_Mod_Patient_WasFehlt_E);
	};
	if (Npc_HasItems(hero, ItFo_Addon_Rum) >= 1)
	{
		Info_AddChoice	(Info_Mod_Patient_WasFehlt, "Wie sieht's mit Rum aus?", Info_Mod_Patient_WasFehlt_D);
	};
	if (Npc_HasItems(hero, ItFo_Booze) >= 1)
	{
		Info_AddChoice	(Info_Mod_Patient_WasFehlt, "Hier hab ich Wacholder.", Info_Mod_Patient_WasFehlt_C);
	};
};

FUNC VOID Info_Mod_Patient_WasFehlt_F(var C_Item itm)
{
	B_GiveInvItems	(hero, self, itm, 1);

	AI_Output(self, hero, "Info_Mod_Patient_WasFehlt_F_01_00"); //Danke, Mann.

	B_UseItem	(self, itm);

	AI_Output(self, hero, "Info_Mod_Patient_WasFehlt_F_01_01"); //Diese verfluchten Brustoperationen gehen mir echt an die Nieren.
	AI_Output(hero, self, "Info_Mod_Patient_WasFehlt_F_15_02"); //Welche Brustoperationen?
	AI_Output(self, hero, "Info_Mod_Patient_WasFehlt_F_01_03"); //Meine Leber scheint schlapp zu machen. Sagt jedenfalls der Heiler.
	AI_Output(self, hero, "Info_Mod_Patient_WasFehlt_F_01_04"); //Aber mir ging's besser, als ich noch nicht hier lag.

	B_GivePlayerXP	(50);

	Info_ClearChoices	(Info_Mod_Patient_WasFehlt);
};

FUNC VOID Info_Mod_Patient_WasFehlt_E()
{
	AI_Output(hero, self, "Info_Mod_Patient_WasFehlt_E_15_00"); //Grog wird dir sicher helfen.

	Info_Mod_Patient_WasFehlt_F(ItFo_Addon_Grog);
};

FUNC VOID Info_Mod_Patient_WasFehlt_D()
{
	AI_Output(hero, self, "Info_Mod_Patient_WasFehlt_D_15_00"); //Wie sieht's mit Rum aus?

	Info_Mod_Patient_WasFehlt_F(ItFo_Addon_Rum);
};

FUNC VOID Info_Mod_Patient_WasFehlt_C()
{
	AI_Output(hero, self, "Info_Mod_Patient_WasFehlt_C_15_00"); //Hier hab ich Wacholder.

	Info_Mod_Patient_WasFehlt_F(ItFo_Booze);
};

INSTANCE Info_Mod_Patient_EXIT (C_INFO)
{
	npc		= Mod_7491_OUT_Patient_REL;
	nr		= 1;
	condition	= Info_Mod_Patient_EXIT_Condition;
	information	= Info_Mod_Patient_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Patient_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Patient_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};