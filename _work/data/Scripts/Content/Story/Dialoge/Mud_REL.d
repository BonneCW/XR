INSTANCE Info_Mod_Mud_REL_Hi (C_INFO)
{
	npc		= Mod_7697_STT_Mud_REL;
	nr		= 1;
	condition	= Info_Mod_Mud_REL_Hi_Condition;
	information	= Info_Mod_Mud_REL_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mud_REL_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mud_REL_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Mud_REL_Hi_03_00"); //(dümmlich freundlich) Ahh, hallo. Du bist’s mein lieber Freund.
	AI_Output(self, hero, "Info_Mod_Mud_REL_Hi_03_01"); //Ich würde ja gerne mir dir ein bisschen durch die Gegend spazieren gehen.
	AI_Output(self, hero, "Info_Mod_Mud_REL_Hi_03_02"); //Aber ich muss jetzt hier auf die netten Schäfchen aufpassen.
	AI_Output(hero, self, "Info_Mod_Mud_REL_Hi_15_03"); //Mud?!
	AI_Output(self, hero, "Info_Mod_Mud_REL_Hi_03_04"); //Ja, bin jetzt hier Schäfer. Bei Onar wollten sie mich nicht mehr.
	AI_Output(self, hero, "Info_Mod_Mud_REL_Hi_03_05"); //Da passt jetzt der Pepe auf die Schafe auf.
	AI_Output(hero, self, "Info_Mod_Mud_REL_Hi_15_06"); //Aber ... was war mit dem Alten Lager?
	AI_Output(self, hero, "Info_Mod_Mud_REL_Hi_03_07"); //Da waren jetzt so böse grüne Kerle.
	AI_Output(self, hero, "Info_Mod_Mud_REL_Hi_03_08"); //Die waren noch gemeiner als die anderen vorher im Lager, haben die ganze Zeit herumgebrüllt und wollte mich verhauen.
	AI_Output(self, hero, "Info_Mod_Mud_REL_Hi_03_09"); //Da bin ich weggelaufen.
	AI_Output(hero, self, "Info_Mod_Mud_REL_Hi_15_10"); //Aaalles klar. Dann wünsche ich dir noch viel vergnügen beim Bewachen der Wollknäule.
	AI_Output(self, hero, "Info_Mod_Mud_REL_Hi_03_11"); //Hihi, du bist komisch ... Wollknäule ... das muss ich mir unbedingt merken.

	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_NW_Hi))
	&& (Mod_Fisk_LeiseHoffnung == 0)
	{
		B_LogEntry	(TOPIC_MOD_LEISEHOFFNUNG, "Mud hatte offensichtlich mal wieder mehr Glück als Verstand. Er hütet jetzt Schafe in Khorata.");
	};
};

INSTANCE Info_Mod_Mud_REL_EXIT (C_INFO)
{
	npc		= Mod_7697_STT_Mud_REL;
	nr		= 1;
	condition	= Info_Mod_Mud_REL_EXIT_Condition;
	information	= Info_Mod_Mud_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Mud_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mud_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};