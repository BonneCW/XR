INSTANCE Info_Mod_GorNaKar_Hi (C_INFO)
{
	npc		= Mod_1925_TPL_GorNaKar_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaKar_Hi_Condition;
	information	= Info_Mod_GorNaKar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_GorNaKar_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Eroberung_10))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_GorNaKar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_GorNaKar_Hi_08_00"); //Wir haben euch erwartet, nehmt euch diese Novizenröcke.

	AI_UnequipArmor	(Mod_1870_EBR_Alissandro_MT);
	AI_UnequipArmor (hero);

	CreateInvItems	(self, Nov_Armor_L, 1);
	B_GiveInvItems	(self, hero, Nov_Armor_L, 1);

	AI_EquipArmor	(hero, Nov_Armor_L);

	CreateInvItems	(Mod_1870_EBR_Alissandro_MT, Nov_Armor_L, 1);
	AI_EquipArmor	(Mod_1870_EBR_Alissandro_MT, Nov_Armor_L);

	B_LogEntry	(TOPIC_MOD_AL_EROBERUNG, "Vor dem Tempel wurden wir bereits von zwei Templern erwartet. Ich haben einen Novizenrock bekommen und jetzt brechen wir auf.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_GorNaKar_Torwache_01 (C_INFO)
{
	npc		= Mod_1925_TPL_GorNaKar_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaKar_Torwache_01_Condition;
	information	= Info_Mod_GorNaKar_Torwache_01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_GorNaKar_Torwache_01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torwache_Halt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_GorNaKar_Torwache_01_Info()
{
	AI_TurnToNpc	(self, Mod_1130_GRD_Torwache_MT);

	AI_Output(self, Mod_1130_GRD_Torwache_MT, "Info_Mod_GorNaKar_Torwache_01_08_00"); //Wir sind hier um Sumpfkraut zu Bartholo zu bringen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTOBARTHOLO");
	B_StartOtherRoutine	(Mod_1924_TPL_GorNaMon_MT, "GUIDETOBARTHOLO");
	B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "FOLLOWTOBARTHOLO");
	B_StartOtherRoutine	(Mod_1105_EBR_Arto_MT, "BOSS");

	if (Mod_ALTor_03 == 1)
	{
		Mod_ALTor_03 = 0;

		Wld_SendTrigger	("EVT_OC_MAINGATE02_02");
	};
};

INSTANCE Info_Mod_GorNaKar_Hueterklinge (C_INFO)
{
	npc		= Mod_1925_TPL_GorNaKar_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaKar_Hueterklinge_Condition;
	information	= Info_Mod_GorNaKar_Hueterklinge_Info;
	permanent	= 0;
	important	= 0;
	description	= "Woher bekomme ich eine Hüterklinge?";
};

FUNC INT Info_Mod_GorNaKar_Hueterklinge_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hueterklinge))
	&& (Mod_TPL_Hueterklinge == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_GorNaKar_Hueterklinge_Info()
{
	AI_Output(hero, self, "Info_Mod_GorNaKar_Hueterklinge_15_00"); //Woher bekomme ich eine Hüterklinge?
	AI_Output(self, hero, "Info_Mod_GorNaKar_Hueterklinge_08_01"); //Komisch, du bist der Zweite der mich das in so kurzer Zeit fragt.
	AI_Output(hero, self, "Info_Mod_GorNaKar_Hueterklinge_15_02"); //Vor kurzem hat dich das noch jemand gefragt?
	AI_Output(self, hero, "Info_Mod_GorNaKar_Hueterklinge_08_03"); //Kann noch keine zwei Tage her sein. Ein junger Templer namens Gor Na Kosh.
	AI_Output(hero, self, "Info_Mod_GorNaKar_Hueterklinge_15_04"); //Und was hast du ihm gesagt?
	AI_Output(self, hero, "Info_Mod_GorNaKar_Hueterklinge_08_05"); //Ich weiß nicht. Ach ... ich hätte gerne einen Stängel.
};

INSTANCE Info_Mod_GorNaKar_Hueterklinge2 (C_INFO)
{
	npc		= Mod_1925_TPL_GorNaKar_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaKar_Hueterklinge2_Condition;
	information	= Info_Mod_GorNaKar_Hueterklinge2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nimm.";
};

FUNC INT Info_Mod_GorNaKar_Hueterklinge2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaKar_Hueterklinge))
	&& (Mod_TPL_Hueterklinge == 0)
	&& (Npc_HasItems(hero, ItMi_Joint) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_GorNaKar_Hueterklinge2_Info()
{
	AI_Output(hero, self, "Info_Mod_GorNaKar_Hueterklinge2_15_00"); //Nimm.

	B_GiveInvItems	(hero, self, ItMi_Joint, 1);

	B_UseItem	(self, ItMi_Joint);

	AI_Output(hero, self, "Info_Mod_GorNaKar_Hueterklinge2_15_01"); //Und, kannst du dich jetzt erinnern?
	AI_Output(self, hero, "Info_Mod_GorNaKar_Hueterklinge2_08_02"); //Keine Ahnung.

	Info_ClearChoices	(Info_Mod_GorNaKar_Hueterklinge2);

	Info_AddChoice	(Info_Mod_GorNaKar_Hueterklinge2, "Was könnte deinem Gedächtnis auf die Sprünge helfen?", Info_Mod_GorNaKar_Hueterklinge2_B);
	Info_AddChoice	(Info_Mod_GorNaKar_Hueterklinge2, "Muss ich dir erst aufs Maul hauen?", Info_Mod_GorNaKar_Hueterklinge2_A);
};

FUNC VOID Info_Mod_GorNaKar_Hueterklinge2_C()
{
	AI_Output(self, hero, "Info_Mod_GorNaKar_Hueterklinge2_C_08_00"); //Ich weiß nicht, keine Ahnung. 
	AI_Output(hero, self, "Info_Mod_GorNaKar_Hueterklinge2_C_15_01"); //Jetzt reicht's.
	AI_Output(self, hero, "Info_Mod_GorNaKar_Hueterklinge2_C_08_02"); //Was willst du eigentlich von mir? Ich hab’s dir doch gesagt!
	AI_Output(self, hero, "Info_Mod_GorNaKar_Hueterklinge2_C_08_03"); //Ich hab dem jungen Spund gesagt "Ich weiß nicht. Keine Ahnung."
	AI_Output(self, hero, "Info_Mod_GorNaKar_Hueterklinge2_C_08_04"); //Er ist dann glaub ich zu Baal Ydran gegangen.

	Info_ClearChoices	(Info_Mod_GorNaKar_Hueterklinge2);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Von Gor Na Kar hab ich erfahren, dass Gor Na Kosh sich auch kürzlich wegen der Zutaten erkundigt hat. Dieser ist danach zu Baal Yrdan gegangen. Ob Baal Namib mir sagen kann, wo ich ihn finde?");
};

FUNC VOID Info_Mod_GorNaKar_Hueterklinge2_B()
{
	AI_Output(hero, self, "Info_Mod_GorNaKar_Hueterklinge2_B_15_00"); //Was könnte deinem Gedächtnis auf die Sprünge helfen?

	Info_Mod_GorNaKar_Hueterklinge2_C();
};

FUNC VOID Info_Mod_GorNaKar_Hueterklinge2_A()
{
	AI_Output(hero, self, "Info_Mod_GorNaKar_Hueterklinge2_A_15_00"); //Muss ich dir erst aufs Maul hauen?

	Info_Mod_GorNaKar_Hueterklinge2_C();
};

INSTANCE Info_Mod_GorNaKar_EXIT (C_INFO)
{
	npc		= Mod_1925_TPL_GorNaKar_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaKar_EXIT_Condition;
	information	= Info_Mod_GorNaKar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_GorNaKar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_GorNaKar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};