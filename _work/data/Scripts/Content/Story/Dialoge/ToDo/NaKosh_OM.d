INSTANCE Info_Mod_NaKosh_OM_Hi (C_INFO)
{
	npc		= Mod_7803_TPL_GorNaKosh_OM;
	nr		= 1;
	condition	= Info_Mod_NaKosh_OM_Hi_Condition;
	information	= Info_Mod_NaKosh_OM_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und, wie läuft die Crawlerjagd?";
};

FUNC INT Info_Mod_NaKosh_OM_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_NaKosh_OM_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_NaKosh_OM_Hi_15_00"); //Und, wie läuft die Crawlerjagd?
	AI_Output(self, hero, "Info_Mod_NaKosh_OM_Hi_13_01"); //(desillusioniert, benebelt) Garnicht. Wozu auch? Die großen Tage der Bruderschaft sind vorüber. Die einstmals großen Ziele sind nun dem Handel mit Kraut und Erz gewichen.
	AI_Output(self, hero, "Info_Mod_NaKosh_OM_Hi_13_02"); //Und von dem einstigen Stolz des Templers ist nichts geblieben ... außer der Schande.
	AI_Output(self, hero, "Info_Mod_NaKosh_OM_Hi_13_03"); //Ja, wo sind sie, die stolzen Taten und Insignien der Krieger? Zerfallen zu Nichts ... zerfallen zu Staub.
};

INSTANCE Info_Mod_NaKosh_OM_ZeichenDerBruderschaft (C_INFO)
{
	npc		= Mod_7803_TPL_GorNaKosh_OM;
	nr		= 1;
	condition	= Info_Mod_NaKosh_OM_ZeichenDerBruderschaft_Condition;
	information	= Info_Mod_NaKosh_OM_ZeichenDerBruderschaft_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_NaKosh_OM_ZeichenDerBruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_NaKosh_OM_Hi))
	&& (Npc_HasItems(hero, ItMi_ZeichenDerBruderschaft) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_NaKosh_OM_ZeichenDerBruderschaft_Info()
{
	AI_Output(self, hero, "Info_Mod_NaKosh_OM_ZeichenDerBruderschaft_13_00"); //(aufgerüttelt) Was… was sehe ich da? Das Zeichen der Bruderschaft, welches mein einstiger Mentor bei sich trug? Du hast es bei dir?
	AI_Output(self, hero, "Info_Mod_NaKosh_OM_ZeichenDerBruderschaft_13_01"); //Vielleicht ist doch nicht alles vertan, wenn ein einzelner Mann das erbringen kann, was als verloren galt.
	AI_Output(hero, self, "Info_Mod_NaKosh_OM_ZeichenDerBruderschaft_15_02"); //Es liegt in der Hand des Einzelnen, was er Kraft seines Mutes erreicht.
	AI_Output(self, hero, "Info_Mod_NaKosh_OM_ZeichenDerBruderschaft_13_03"); //(sich besinnend) Ja ... ja du hast recht.

	CreateInvItems	(self, TPL_ARMOR_M, 1);

	AI_UnequipArmor	(self);

	AI_EquipArmor	(self, TPL_ARMOR_M);

	CreateInvItems	(self, ItMw_2H_Sword_Light_02, 1);

	AI_EquipBestMeleeWeapon	(self);

	AI_Output(self, hero, "Info_Mod_NaKosh_OM_ZeichenDerBruderschaft_13_04"); //Lange genug habe ich mich in den Schwaden des Sumpfkrauts betäubt. Es wird wieder Zeit den Krieger in mir zu ergründen, der ich einstmals war.
	AI_Output(self, hero, "Info_Mod_NaKosh_OM_ZeichenDerBruderschaft_13_05"); //(bestimmend zu dem Helden) So wisse: Wann immer du einen Gefährten im Kampf brauchst, werde ich vor dem Eingang dieser Mine darauf warten dir beizustehen.
	AI_Output(self, hero, "Info_Mod_NaKosh_OM_ZeichenDerBruderschaft_13_06"); //Die Ehre des Kämpfers möge dich Allzeit geleiten.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_NaKosh_OM_EXIT (C_INFO)
{
	npc		= Mod_7803_TPL_GorNaKosh_OM;
	nr		= 1;
	condition	= Info_Mod_NaKosh_OM_EXIT_Condition;
	information	= Info_Mod_NaKosh_OM_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_NaKosh_OM_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_NaKosh_OM_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};