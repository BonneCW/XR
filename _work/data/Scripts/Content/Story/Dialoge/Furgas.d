INSTANCE Info_Mod_Furgas_Hi (C_INFO)
{
	npc		= Mod_1747_KDF_Furgas_PAT;
	nr		= 1;
	condition	= Info_Mod_Furgas_Hi_Condition;
	information	= Info_Mod_Furgas_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Furgas_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Furgas_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Furgas_Hi_13_00"); //Ein neues Gesicht in unseren Reihen, wie erfreulich.
	AI_Output(self, hero, "Info_Mod_Furgas_Hi_13_01"); //Lass mich dir kurz etwas wichtiges erklären.
	AI_Output(hero, self, "Info_Mod_Furgas_Hi_15_02"); //Erzähl.
	AI_Output(self, hero, "Info_Mod_Furgas_Hi_13_03"); //Dieser Turm ist eine zentrale Stelle im Kloster.
	AI_Output(self, hero, "Info_Mod_Furgas_Hi_13_04"); //Auf der Spitze findest du das Orakel, das sehr nützlich sein kann.
	AI_Output(self, hero, "Info_Mod_Furgas_Hi_13_05"); //Wenn du jedoch in das Pentagramm schreitest, so wirst du in unsere Höhle teleportiert.
	AI_Output(self, hero, "Info_Mod_Furgas_Hi_13_06"); //Dort gibt es eine Mine, in der wir Runensteine abbauen, und einen Kräutergarten.
	AI_Output(hero, self, "Info_Mod_Furgas_Hi_15_07"); //Ein Kräutergarten unter der Erde?
	AI_Output(self, hero, "Info_Mod_Furgas_Hi_13_08"); //Ja, und die Pflanzen gedeihen dort dank unserer Magie prächtig.
	AI_Output(hero, self, "Info_Mod_Furgas_Hi_15_09"); //Danke für die Informationen.
};

INSTANCE Info_Mod_Furgas_Paket (C_INFO)
{
	npc		= Mod_1747_KDF_Furgas_PAT;
	nr		= 1;
	condition	= Info_Mod_Furgas_Paket_Condition;
	information	= Info_Mod_Furgas_Paket_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Nahrungspaket für dich.";
};

FUNC INT Info_Mod_Furgas_Paket_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tojan_Hi))
	&& (Npc_HasItems(hero, ItMi_PAT_Nahrung) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Furgas_Paket_Info()
{
	AI_Output(hero, self, "Info_Mod_Furgas_Paket_15_00"); //Ich hab Paketer ein Nahrungspaket für dich.
	
	B_GiveInvItems	(hero, self, ItMi_Pat_Nahrung, 1);

	AI_Output(self, hero, "Info_Mod_Furgas_Paket_13_01"); //Ah, endlich. Die Paladine haben schon darauf gewartet.
	AI_Output(self, hero, "Info_Mod_Furgas_Paket_13_02"); //Hier hast du einen Runenstein als Dank.

	CreateInvItems	(self, ItMi_Runeblank, 1);
	B_GiveInvItems	(self, hero, ItMi_Runeblank, 1);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Furgas_EXIT (C_INFO)
{
	npc		= Mod_1747_KDF_Furgas_PAT;
	nr		= 1;
	condition	= Info_Mod_Furgas_EXIT_Condition;
	information	= Info_Mod_Furgas_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Furgas_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Furgas_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};