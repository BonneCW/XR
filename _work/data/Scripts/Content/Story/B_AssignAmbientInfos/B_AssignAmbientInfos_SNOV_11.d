INSTANCE Info_Mod_SNOV_11_Leader (C_INFO)
{
	nr		= 1;
	condition	= Info_Mod_SNOV_11_Leader_Condition;
	information	= Info_Mod_SNOV_11_Leader_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wer hat hier das Sagen?";
};

FUNC INT Info_Mod_SNOV_11_Leader_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_SNOV_11_Leader_Info()
{
	B_Say	(hero, self, "$AMBISNOV01");

	AI_Output(self, hero, "Info_Mod_SNOV_11_Leader_11_00"); //Das weiß ich auch nicht so genau. Frag doch wen anders.
};

INSTANCE Info_Mod_SNOV_11_Beliarkloster (C_INFO)
{
	nr		= 1;
	condition	= Info_Mod_SNOV_11_Beliarkloster_Condition;
	information	= Info_Mod_SNOV_11_Beliarkloster_Info;
	permanent	= 1;
	important	= 0;
	description	= "Was gibt es hier für wichtige Orte?";
};

FUNC INT Info_Mod_SNOV_11_Beliarkloster_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_SNOV_11_Beliarkloster_Info()
{
	B_Say	(hero, self, "$AMBISNOV03");

	if (Mod_BibEntdeckt)
	{
		AI_Output(self, hero, "Info_Mod_SNOV_11_Beliarkloster_11_00"); //Du hast doch die Bibliothek entdeckt. Du kennst dich hier wahrscheinlich besser aus als ich.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_SNOV_11_Beliarkloster_11_01"); //Die Kirche in der Mitte des Platzes. Dort solltest du regelmäßig erscheinen, wenn du nicht verdächtig werden willst.
		AI_Output(self, hero, "Info_Mod_SNOV_11_Beliarkloster_11_02"); //Dahinter liegt irgendwo versteckt im Labyrinth die Bibliothek, die seit Jahren niemand mehr zu Gesicht bekommen hat, weil niemand durch den Irrgarten findet.
	};
};

INSTANCE Info_Mod_SNOV_11_Interessantes (C_INFO)
{
	nr		= 1;
	condition	= Info_Mod_SNOV_11_Interessantes_Condition;
	information	= Info_Mod_SNOV_11_Interessantes_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ist in letzter Zeit was Interessantes passiert?";
};

FUNC INT Info_Mod_SNOV_11_Interessantes_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_SNOV_11_Interessantes_Info()
{
	B_Say	(hero, self, "$AMBISNOV04");

	AI_Output(self, hero, "Info_Mod_SNOV_11_Interessantes_11_00"); //Die ganzen Typen aus dem alten Lager sind noch nicht lange hier.
	AI_Output(self, hero, "Info_Mod_SNOV_11_Interessantes_11_01"); //Waren ganz komisch, als Xardas sie angeschleppt hat, wussten ihren eigenen Namen nicht mehr und so weiter.
	AI_Output(self, hero, "Info_Mod_SNOV_11_Interessantes_11_02"); //Wahrscheinlich hat er ihnen eine ordentliche Gehirnwäsche verpasst.
};

INSTANCE Info_Mod_SNOV_11_Pickpocket (C_INFO)
{
	nr		= 1;
	condition	= Info_Mod_SNOV_11_Pickpocket_Condition;
	information	= Info_Mod_SNOV_11_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_SNOV_11_Pickpocket_Condition()
{
	C_Beklauen	(60 + r_max(30), ItMi_Gold, 20 + r_max(10));
};

FUNC VOID Info_Mod_SNOV_11_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_SNOV_11_Pickpocket);

	Info_AddChoice	(Info_Mod_SNOV_11_Pickpocket, DIALOG_BACK, Info_Mod_SNOV_11_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_SNOV_11_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_SNOV_11_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_SNOV_11_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_SNOV_11_Pickpocket);
};

FUNC VOID Info_Mod_SNOV_11_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_SNOV_11_Pickpocket);
};

INSTANCE Info_Mod_SNOV_11_EXIT (C_INFO)
{
	nr		= 1;
	condition	= Info_Mod_SNOV_11_EXIT_Condition;
	information	= Info_Mod_SNOV_11_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_SNOV_11_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_SNOV_11_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SNOV_11 (var c_NPC slf)
{
	Info_Mod_SNOV_11_Leader.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_SNOV_11_Beliarkloster.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_SNOV_11_Interessantes.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_SNOV_11_Pickpocket.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_SNOV_11_EXIT.npc	= Hlp_GetInstanceID(slf);
};