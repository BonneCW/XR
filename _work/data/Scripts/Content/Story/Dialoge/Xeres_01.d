INSTANCE Info_Mod_Xeres_Hi (C_INFO)
{
	npc		= Xeres_01;
	nr		= 1;
	condition	= Info_Mod_Xeres_Hi_Condition;
	information	= Info_Mod_Xeres_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xeres_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Xeres_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Xeres_Hi_14_00"); //(höhnisch) Ahh, da ist ja mein "Befreier".
	AI_Output(self, hero, "Info_Mod_Xeres_Hi_14_01"); //Gekommen um dem neuen Regenten der Welt und des Himmels zu huldigen?
	AI_Output(hero, self, "Info_Mod_Xeres_Hi_15_02"); //Du glaubst doch nicht wirklich, dass du dich der Macht der drei Götter entgegenstellen kannst.
	AI_Output(hero, self, "Info_Mod_Xeres_Hi_15_03"); //Ich als ihr Stellvertreter bin hier, um dich von deinem wahnwitzigen Vorhaben abzuhalten.
	AI_Output(self, hero, "Info_Mod_Xeres_Hi_14_04"); //(sarkastisch) Die himmlischen Götter.
	AI_Output(self, hero, "Info_Mod_Xeres_Hi_14_05"); //Sitzen da Oben und versuchen die Geschicke der Welt zu bestimmen, während die eigentliche Schlacht doch hier unten stattfindet und entschieden wird ...
	AI_Output(self, hero, "Info_Mod_Xeres_Hi_14_06"); //(finsterer) Nun aber genug getratscht. Du willst mich aufhalten?
	AI_Output(self, hero, "Info_Mod_Xeres_Hi_14_07"); //Eitler Narr, glaubst, du könntest auch nur einen Kratzer meiner Rüstung zufügen ...
	AI_Output(self, hero, "Info_Mod_Xeres_Hi_14_08"); //Wobei ... dir ist es tatsächlich gelungen meinen Diener zu bannen und meine Pläne zu vereiteln.
	AI_Output(self, hero, "Info_Mod_Xeres_Hi_14_09"); //Damit hast du bewiesen, dass du unter den Sterblichen eine Gefahr für mich darstellen könntest ...
	AI_Output(self, hero, "Info_Mod_Xeres_Hi_14_10"); //Von daher werde ich kein unnötiges Risiko eingehen und dir einen schnellen Tod bereiten.
	AI_Output(self, hero, "Info_Mod_Xeres_Hi_14_11"); //Bereite dich vor auf ewige Finsternis und Verdammung.

	AI_StopProcessInfos	(self);

	Wld_PlayEffect("DEMENTOR_FX",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );

	AI_StartState	(hero, ZS_MagicFreeze, 0, "");

	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	B_Attack	(self, hero, AR_NONE, 1);

	B_StartOtherRoutine	(Schattenlord_877_Urnol, "TOT");
};

INSTANCE Info_Mod_Xeres_Beliar (C_INFO)
{
	npc		= Xeres_01;
	nr		= 1;
	condition	= Info_Mod_Xeres_Beliar_Condition;
	information	= Info_Mod_Xeres_Beliar_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xeres_Beliar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_HabSchwert))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xeres_Beliar_Info()
{
	AI_Output(self, hero, "Info_Mod_Xeres_Beliar_14_00"); //Da bist du ja wieder. Denkst du du hast diesmal eine größere Chance?
	AI_Output(hero, self, "Info_Mod_Xeres_Beliar_15_01"); //Das werden wir ja gleich sehen.
	AI_Output(self, hero, "Info_Mod_Xeres_Beliar_14_02"); //Diesmal wird niemand kommen und dich retten.
	
	AI_StopProcessInfos	(self);

	if (Mod_TeleportZuFestung == 0)
	{
		Wld_PlayEffect("DEMENTOR_FX",  self, self, 0, 0, 0, FALSE );
		Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );

		AI_StartState	(hero, ZS_MagicFreeze, 0, "");
	};

	B_Attack	(self, hero, AR_GuildEnemy, 1);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild	(self, GIL_STRF);
};