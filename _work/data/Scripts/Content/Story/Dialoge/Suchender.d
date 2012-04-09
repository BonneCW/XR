INSTANCE Info_Mod_Suchender_Hi (C_INFO)
{
	npc		= Mod_7434_DMT_Suchender_MT;
	nr		= 1;
	condition	= Info_Mod_Suchender_Hi_Condition;
	information	= Info_Mod_Suchender_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Suchender_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Suchender_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Suchender_Hi_10_00"); //Ah, so schnell hätte ich dich hier nicht erwartet ...
	AI_Output(hero, self, "Info_Mod_Suchender_Hi_15_01"); //Erwartet? Wer bist du?
	AI_Output(self, hero, "Info_Mod_Suchender_Hi_10_02"); //Du bist in einem meiner Heime und weißt nicht einmal, wen du eigentlich besuchst? (lacht)
	AI_Output(hero, self, "Info_Mod_Suchender_Hi_15_03"); //Was hast du mit den Überfallen auf die Jäger und Waldläufer zu tun?
	AI_Output(self, hero, "Info_Mod_Suchender_Hi_10_04"); //(spöttisch) Ist das denn nicht klar, Ungestümer?
	AI_Output(hero, self, "Info_Mod_Suchender_Hi_15_05"); //Du Mörder, ich werde dich zu deinen Opfern schicken!

	AI_ReadyMeleeWeapon	(hero);

	AI_Output(self, hero, "Info_Mod_Suchender_Hi_10_06"); //(lacht) Bist du dir da sicher? Vielleicht bin ich gar nicht der Mörder, den du suchst.
	AI_Output(hero, self, "Info_Mod_Suchender_Hi_15_07"); //Wenn du noch was zu sagen hast, sag schnell, oder dir bleibt keine Zeit mehr.
	AI_Output(self, hero, "Info_Mod_Suchender_Hi_10_08"); //Ich habe alle Zeit, die ich brauche. Aber vielleicht hast du auch einfach noch nicht gut genug nachgeforscht.
	AI_Output(self, hero, "Info_Mod_Suchender_Hi_10_09"); //Oder aber vielleicht doch und du entdeckst es nur nicht? Ich werde dich bald erwarten.

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "TOT");
	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Suchender_Turm (C_INFO)
{
	npc		= Mod_7434_DMT_Suchender_MT;
	nr		= 1;
	condition	= Info_Mod_Suchender_Turm_Condition;
	information	= Info_Mod_Suchender_Turm_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Suchender_Turm_Condition()
{
	if (Mod_SuchenderAtTurm == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Suchender_Turm_Info()
{
	AI_Output(self, hero, "Info_Mod_Suchender_Turm_10_00"); //Ha, du schon wieder! Hast hierher gefunden. Erstaunlich, aber umsonst.
	AI_Output(self, hero, "Info_Mod_Suchender_Turm_10_01"); //Mein Meister lebt schon lange nicht mehr hier.
	AI_Output(hero, self, "Info_Mod_Suchender_Turm_15_02"); //Aber dich erwische ich diesmal!
	AI_Output(self, hero, "Info_Mod_Suchender_Turm_10_03"); //Halt! Wenn du mich tötest, was dir schwerlich gelingen dürfte, wirst du nie erfahren, wo der ist, den du suchst. Deshalb ...

	AI_PlayAni	(hero, "T_STAND_2_VICTIM_SLE");

	B_LogEntry	(TOPIC_MOD_JG_TURM, "Schon wieder entwischt, dieser Suchende. Na wenigstens hab ich seinen Schlüssel. Der wird mir sicherlich noch nützlich sein. Vielleicht weiß Wulfgar etwas.");

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "TOT");
	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Suchender_EXIT (C_INFO)
{
	npc		= Mod_7434_DMT_Suchender_MT;
	nr		= 1;
	condition	= Info_Mod_Suchender_EXIT_Condition;
	information	= Info_Mod_Suchender_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Suchender_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Suchender_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};