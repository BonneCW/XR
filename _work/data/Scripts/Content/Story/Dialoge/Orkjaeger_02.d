INSTANCE Info_Mod_Orkjaeger_02 (C_INFO)
{
	npc		= Mod_1271_SLD_Soeldner_MT;
	nr		= 1;
	condition	= Info_Mod_Orkjaeger_02_Condition;
	information	= Info_Mod_Orkjaeger_02_Info;
	permanent	= 1;
	description 	= "Ich könnte etwas Unterstützung bei einem Orkproblem brauchen.";
};                       

FUNC INT Info_Mod_Orkjaeger_02_Condition()
{
	if (Mod_Orchunter_Counter < 6)
	&& (Npc_HasItems(hero, ItAm_MegaAmulett2) == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Dexter_OschustAmulett))
	&& (!Npc_IsDead(Mod_10012_ORC_Scout_MT))
	&& (!Npc_IsDead(Mod_10013_ORC_Scout_MT))
	&& (!Npc_IsDead(Mod_10014_ORC_Elite_MT))
	&& (!Npc_IsDead(Mod_10015_ORC_Elite_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orkjaeger_02_Info()
{
	AI_Output(hero,self,"Info_Mod_Orkjaeger_02_15_00"); //Ich könnte etwas Unterstützung bei einem Orkproblem brauchen.
	AI_Output(self,hero,"Info_Mod_Orkjaeger_02_11_01"); //Worum geht’s?
	AI_Output(hero,self,"Info_Mod_Orkjaeger_02_15_02"); //In einer Höhle im Wald nahe dem Banditenlager kampiert eine Handvoll der haarigen Zeitgenossen.

	if (Mod_Gilde == 4)
	{
		AI_Output(self,hero,"Info_Mod_Orkjaeger_02_11_03"); //Hmm, das klingt nicht ganz leicht. Aber wenn du läppische 200 Goldmünzen springen lässt – du gehörst ja zu unserem Lager - und zumindest einen weiteren Mann für die Aktion findest bin ich dabei.
	}
	else if ((Mod_Gilde == 5)
	|| (Mod_Gilde == 19))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Lee_HabPfeife))
	{
		AI_Output(self,hero,"Info_Mod_Orkjaeger_02_11_04"); //Hmm, das klingt nicht ganz leicht. Aber wenn du läppische 150 Goldmünzen springen lässt – du gehörst ja zu uns - und zumindest einen weiteren Mann für die Aktion findest bin ich dabei.
	}
	else if ((Mod_Gilde == 5)
	|| (Mod_Gilde == 19))
	&& (Npc_KnowsInfo(hero, Info_Mod_Lee_HabPfeife))
	{
		AI_Output(self,hero,"Info_Mod_Orkjaeger_02_11_05"); //Hmm, das klingt nicht ganz leicht. Aber wenn du mir als mein Boss den Sold von 100 Goldmünzen zahlst und zumindest einen weiteren Mann für die Aktion findest bin ich dabei.
	}
	else
	{
		AI_Output(self,hero,"Info_Mod_Orkjaeger_02_11_06"); //Hmm, das klingt nicht ganz leicht. Aber wenn du 250 Goldmünzen springen lässt und und zumindest einen weiteren Mann für die Aktion findest bin ich dabei.
	};

	Info_ClearChoices	(Info_Mod_Orkjaeger_02);

	Info_AddChoice	(Info_Mod_Orkjaeger_02, "Nein, das ist mir zu teuer.", Info_Mod_Orkjaeger_02_B);

	if (Mod_Gilde == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 200)
	{
		Info_AddChoice	(Info_Mod_Orkjaeger_02, "In Ordnung, hier hast du das Gold.", Info_Mod_Orkjaeger_02_A);
	}
	else if ((Mod_Gilde == 5)
	|| (Mod_Gilde == 19))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Lee_HabPfeife))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 150)
	{
		Info_AddChoice	(Info_Mod_Orkjaeger_02, "In Ordnung, hier hast du das Gold.", Info_Mod_Orkjaeger_02_A);
	}
	else if ((Mod_Gilde == 5)
	|| (Mod_Gilde == 19))
	&& (Npc_KnowsInfo(hero, Info_Mod_Lee_HabPfeife))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		Info_AddChoice	(Info_Mod_Orkjaeger_02, "In Ordnung, hier hast du das Gold.", Info_Mod_Orkjaeger_02_A);
	}
	else if (Npc_HasItems(hero, ItMi_Gold) >= 250)
	{
		Info_AddChoice	(Info_Mod_Orkjaeger_02, "In Ordnung, hier hast du das Gold.", Info_Mod_Orkjaeger_02_A);
	};
};

FUNC VOID Info_Mod_Orkjaeger_02_B()
{
	AI_Output(hero,self,"Info_Mod_Orkjaeger_02_B_15_00"); //Nein, das ist mir zu teuer.
	AI_Output(self,hero,"Info_Mod_Orkjaeger_02_B_11_01"); //Falls es dir doch anders überlegst, weißt du, wo du mich findest.
	
	Info_ClearChoices	(Info_Mod_Orkjaeger_02);
};

FUNC VOID Info_Mod_Orkjaeger_02_A()
{
	AI_Output(hero, self, "Info_Mod_Orkjaeger_02_A_15_00"); //In Ordnung, hier hast du das Gold.

	if (Mod_Gilde == 4)
	{
		B_GiveInvItems	(hero, self, ItMi_Gold, 200);
	}
	else if ((Mod_Gilde == 5)
	|| (Mod_Gilde == 19))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Lee_HabPfeife))
	{
		B_GiveInvItems	(hero, self, ItMi_Gold, 150);
	}
	else if ((Mod_Gilde == 5)
	|| (Mod_Gilde == 19))
	&& (Npc_KnowsInfo(hero, Info_Mod_Lee_HabPfeife))
	{
		B_GiveInvItems	(hero, self, ItMi_Gold, 100);
	}
	else
	{
		B_GiveInvItems	(hero, self, ItMi_Gold, 250);
	};

	B_GiveInvItems	(hero, self, ItMi_Gold, 250);

	AI_Output(self, hero, "Info_Mod_Orkjaeger_02_A_11_01"); //Gut, wir sehen uns dann beim Durchgang vor dem Wald.
	
	Info_ClearChoices	(Info_Mod_Orkjaeger_02);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ORKJAGD");

	self.npctype = NPCTYPE_MT_ORKJAGD;
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	Mod_Orchunter_Counter += 1;
};