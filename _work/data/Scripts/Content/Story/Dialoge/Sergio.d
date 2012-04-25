INSTANCE Info_Mod_Sergio_Dragon (C_INFO)
{
	npc		= Mod_924_RIT_Sergio_NW;
	nr		= 1;
	condition	= Info_Mod_Sergio_Dragon_Condition;
	information	= Info_Mod_Sergio_Dragon_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du denn hier?";
};

FUNC INT Info_Mod_Sergio_Dragon_Condition()
{
	if (Mod_NL_HasKamm >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sergio_Dragon_Info()
{
	AI_Output(hero, self, "Info_Mod_Sergio_Dragon_15_00"); //Was machst du denn hier? Bist du nicht der Paladin aus dem Kloster?
	AI_Output(self, hero, "Info_Mod_Sergio_Dragon_04_01"); //(in sein Schicksal ergeben) Ja, der bin ich. Ich bin hier, um meine Ehre wiederzugewinnen.
	AI_Output(self, hero, "Info_Mod_Sergio_Dragon_04_02"); //Bei dem Angriff der Dämonen auf das Kloster, zog ich mich mit den anderen in die inneren Räumlichkeiten zurück, anstatt weiter gegen die Bestien zu kämpfen.
	AI_Output(self, hero, "Info_Mod_Sergio_Dragon_04_03"); //Hier habe ich nun diese abscheulichen Geschöpfe ausfindig gemacht und sammle nun Kraft im Gebet, bevor ich gegen sie in den Kampf ziehe.
	AI_Output(hero, self, "Info_Mod_Sergio_Dragon_15_04"); //Auch ich sinne auf die Vernichtung dieser Geschöpfe. Ich treffe aber noch Vorbereitungen, um den Erfolg dieser Mission zu gewährleisten.
	AI_Output(self, hero, "Info_Mod_Sergio_Dragon_04_05"); //(hoffnungsvoll) Wirklich? Wenn es so weit ist, wird es mir eine Ehre sein, an deiner Seite zu kämpfen. Für Innos!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Sergio_FeuerGegenEis (C_INFO)
{
	npc		= Mod_924_RIT_Sergio_NW;
	nr		= 1;
	condition	= Info_Mod_Sergio_FeuerGegenEis_Condition;
	information	= Info_Mod_Sergio_FeuerGegenEis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sergio_FeuerGegenEis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_FeuerGegenEis2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sergio_FeuerGegenEis_Info()
{
	AI_Output(self, hero, "Info_Mod_Sergio_FeuerGegenEis_04_00"); //Verdammt, es waren einfach zu viele. Ich habe versagt und die Novizen nicht vor ihrem Verderben bewahrt.
	AI_Output(self, hero, "Info_Mod_Sergio_FeuerGegenEis_04_01"); //(zischt und setzt sich) Ahh, mein Bein.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATSEE2");
};

INSTANCE Info_Mod_Sergio_Pickpocket (C_INFO)
{
	npc		= Mod_924_RIT_Sergio_NW;
	nr		= 1;
	condition	= Info_Mod_Sergio_Pickpocket_Condition;
	information	= Info_Mod_Sergio_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Sergio_Pickpocket_Condition()
{
	C_Beklauen	(89, ItMi_Gold, 1900);
};

FUNC VOID Info_Mod_Sergio_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sergio_Pickpocket);

	Info_AddChoice	(Info_Mod_Sergio_Pickpocket, DIALOG_BACK, Info_Mod_Sergio_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sergio_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sergio_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sergio_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sergio_Pickpocket);
};

FUNC VOID Info_Mod_Sergio_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Sergio_Pickpocket);
};

INSTANCE Info_Mod_Sergio_EXIT (C_INFO)
{
	npc		= Mod_924_RIT_Sergio_NW;
	nr		= 1;
	condition	= Info_Mod_Sergio_EXIT_Condition;
	information	= Info_Mod_Sergio_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sergio_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sergio_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};