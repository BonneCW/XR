INSTANCE Info_Mod_HeroBot_Gelaber (C_INFO)
{
	npc		= HeroBot_NW;
	nr		= 1;
	condition	= Info_Mod_HeroBot_Gelaber_Condition;
	information	= Info_Mod_HeroBot_Gelaber_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist Kolam's Kampfroboter!";
};

FUNC INT Info_Mod_HeroBot_Gelaber_Condition()
{
	if (Mod_PAL_HeroBot == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HeroBot_Gelaber_Info()
{
	AI_Output(hero, self, "Info_Mod_HeroBot_Gelaber_15_00"); //Du bist Kolam's Kampfroboter!
	AI_Output(self, hero, "Info_Mod_HeroBot_Gelaber_15_01"); //"Das Androhen von Gewalt gegen ein Individuum oder die Allgemeinheit als solche ist als Straftat anzusehen."
	AI_Output(hero, self, "Info_Mod_HeroBot_Gelaber_15_02"); //Das beenden wir jetzt ein für alle Mal.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_PAL_RL, "Der verrückte Guru wurde von Kolams Roboter getötet. Jetzt werde ich ihn endgültig vernichten.");
};

INSTANCE Info_Mod_HeroBot_Weg (C_INFO)
{
	npc		= HeroBot_NW;
	nr		= 1;
	condition	= Info_Mod_HeroBot_Weg_Condition;
	information	= Info_Mod_HeroBot_Weg_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HeroBot_Weg_Condition()
{
	if (Mod_PAL_HeroBot == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HeroBot_Weg_Info()
{
	AI_Output(self, hero, "Info_Mod_HeroBot_Weg_15_00"); //Auftrag erledigt. Suchvorgang iniziiert.
	
	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_PAL_RL, "Der Roboter ist verschwunden. Ich konnte ihn nicht mal ankratzen.");

	B_StartOtherRoutine	(self, "TOT");

	AI_Teleport	(self, "TOT");
};