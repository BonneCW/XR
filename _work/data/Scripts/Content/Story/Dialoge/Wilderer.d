INSTANCE Info_Mod_Wilderer_Hi (C_INFO)
{
	npc		= Mod_7588_OUT_Wilderer_NW;
	nr		= 1;
	condition	= Info_Mod_Wilderer_Hi_Condition;
	information	= Info_Mod_Wilderer_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wilderer_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wilderer_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Wilderer_Hi_08_00"); //Wen haben wir denn hier… ohh, besser gesagt, was.

	AI_ReadyMeleeWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Wilderer_Hi_08_01"); //Schaut euch mal das an, Jungs! Zahme Snapper mit glänzenden Häuten ... die müssen ein Vermögen wert sein.
	AI_Output(hero, self, "Info_Mod_Wilderer_Hi_15_02"); //He, kommt besser auf keine dummen Gedanken.
	AI_Output(self, hero, "Info_Mod_Wilderer_Hi_08_03"); //Dumm?! Dumm ist deine Fresse. Los Jungs, heute haben wir das große Los gezogen.

	AI_StopProcessInfos	(self);
};