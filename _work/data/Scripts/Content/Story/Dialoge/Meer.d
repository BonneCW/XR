INSTANCE Info_Mod_Meer_Hi (C_INFO)
{
	npc		= Mod_7330_Meer_HAL;
	nr		= 1;
	condition	= Info_Mod_Meer_Hi_Condition;
	information	= Info_Mod_Meer_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Meer_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Meer_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Meer_Hi_18_00"); //Du hast mich gefunden.
	AI_Output(hero, self, "Info_Mod_Meer_Hi_15_01"); //Was habe ich gefunden?
	AI_Output(self, hero, "Info_Mod_Meer_Hi_18_02"); //Mich! Die Antwort! Das, was den König wieder glücklich machen wird!
	AI_Output(hero, self, "Info_Mod_Meer_Hi_15_03"); //Du bist die Antwort?
	AI_Output(self, hero, "Info_Mod_Meer_Hi_18_04"); //Ich bin die Antwort! ICH BIN DIE ANTWORT!

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Ich habe das Meer gefunden und es ist die Antwort. Hm ... noch nicht sehr aufschlussreich.");
};