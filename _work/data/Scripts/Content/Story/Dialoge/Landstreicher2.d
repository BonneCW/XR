var int Mod_LandstreicherAttack;

INSTANCE Info_Mod_Landstreicher2_Hi (C_INFO)
{
	npc		= Mod_7745_BDT_Landstreicher_NW;
	nr		= 1;
	condition	= Info_Mod_Landstreicher2_Hi_Condition;
	information	= Info_Mod_Landstreicher2_Hi_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Landstreicher2_Hi_Condition()
{
	if (Npc_RefuseTalk(self) == FALSE)
	&& (!Mod_LandstreicherAttack)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Landstreicher2_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Landstreicher2_Hi_07_00"); //He, du. Lass besser 100 Münzen rüberwachsen, wenn du keine auf's Maul willst.

	Info_ClearChoices	(Info_Mod_Landstreicher2_Hi);

	Info_AddChoice	(Info_Mod_Landstreicher2_Hi, "Vergiss es, von mir bekommst du keinen Groschen.", Info_Mod_Landstreicher2_Hi_B);

	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		Info_AddChoice	(Info_Mod_Landstreicher2_Hi, "Ich will keinen Ärger. Hier hast du 100 Münzen.", Info_Mod_Landstreicher2_Hi_A);
	};
};

FUNC VOID Info_Mod_Landstreicher2_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Landstreicher2_Hi_B_15_00"); //Vergiss es, von mir bekommst du keinen Groschen.
	AI_Output(self, hero, "Info_Mod_Landstreicher2_Hi_B_07_01"); //Dann muss ich das Gold aus dir herausprügeln.

	Info_ClearChoices	(Info_Mod_Landstreicher2_Hi);
	
	Mod_LandstreicherAttack = TRUE;

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild (self, GIL_STRF);
};

FUNC VOID Info_Mod_Landstreicher2_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Landstreicher2_Hi_A_15_00"); //Ich will keinen Ärger. Hier hast du 100 Münzen.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Landstreicher2_Hi_A_07_01"); //Genau. Du weißt was gut für dich ist.

	Info_ClearChoices	(Info_Mod_Landstreicher2_Hi);

	AI_StopProcessInfos	(self);

	Npc_SetRefuseTalk	(self, 240);
};

INSTANCE Info_Mod_Landstreicher2_EXIT (C_INFO)
{
	npc		= Mod_7745_BDT_Landstreicher_NW;
	nr		= 1;
	condition	= Info_Mod_Landstreicher2_EXIT_Condition;
	information	= Info_Mod_Landstreicher2_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Landstreicher2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Landstreicher2_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};