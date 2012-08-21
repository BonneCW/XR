INSTANCE Info_Mod_Drach_Hi (C_INFO)
{
	npc		= GardeBeliars_1989_Drach;
	nr		= 1;
	condition	= Info_Mod_Drach_Hi_Condition;
	information	= Info_Mod_Drach_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Drach_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Drach_Hi_Info()
{
	Wld_PlayEffect("DEMENTOR_FX",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );

	AI_Output(self, hero, "Info_Mod_Drach_Hi_14_00"); //Keinen Schritt weiter, Mensch!
	AI_Output(hero, self, "Info_Mod_Drach_Hi_15_01"); //Was willst du?
	AI_Output(self, hero, "Info_Mod_Drach_Hi_14_02"); //Xardas und du, ihr habt etwas, was mein Meister will! GIB MIR DEN ALMANACH!
	AI_Output(hero, self, "Info_Mod_Drach_Hi_15_03"); //Vergiss es!

	AI_ReadyMeleeWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Drach_Hi_14_04"); //Dann werde ich dich töten!

	AI_ReadyMeleeWeapon	(hero);

	AI_Output(hero, self, "Info_Mod_Drach_Hi_15_05"); //Versuch's doch!
};

INSTANCE Info_Mod_Drach_WerBistDu (C_INFO)
{
	npc		= GardeBeliars_1989_Drach;
	nr		= 1;
	condition	= Info_Mod_Drach_WerBistDu_Condition;
	information	= Info_Mod_Drach_WerBistDu_Info;
	permanent	= 0;
	important	= 0;
	description	= "ENDE";
};

FUNC INT Info_Mod_Drach_WerBistDu_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Drach_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drach_WerBistDu_Info()
{
	Wld_StopEffect	("DEMENTOR_FX");

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);

	B_LogEntry	(TOPIC_MOD_BEL_ALMANACH, "Vor Xardas' Turm hab ich einen Krieger namens Drach getroffen. Er wollte den Almanach für seinen Meister. Ich werde ihn wohl töten müssen.");
};

INSTANCE Info_Mod_Drach_Besiegt (C_INFO)
{
	npc		= GardeBeliars_1989_Drach;
	nr		= 1;
	condition	= Info_Mod_Drach_Besiegt_Condition;
	information	= Info_Mod_Drach_Besiegt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Drach_Besiegt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Drach_WerBistDu))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drach_Besiegt_Info()
{
	AI_Output(self, hero, "Info_Mod_Drach_Besiegt_14_00"); //(zischt) Verdammt! Jetzt magst du gewonnen haben, aber ich komme wieder, und mit mir die anderen fünf Krieger.

	self.aivar[AIV_Partymember] = 0;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	AI_Teleport	(self, "TOT");

	Log_CreateTopic	(TOPIC_MOD_BEL_FIVEKNIGHTS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_FIVEKNIGHTS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_FIVEKNIGHTS, "Drach ist geflohen und kündigte seine Rückkehr mit weiteren fünf Kriegern an. Das kann ja lustig werden.");
};

INSTANCE Info_Mod_Drach_AtAlmanach (C_INFO)
{
	npc		= GardeBeliars_1989_Drach;
	nr		= 1;
	condition	= Info_Mod_Drach_AtAlmanach_Condition;
	information	= Info_Mod_Drach_AtAlmanach_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Drach_AtAlmanach_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_AlmanachOffen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drach_AtAlmanach_Info()
{
	AI_Output(self, hero, "Info_Mod_Drach_AtAlmanach_14_00"); //(triumphierend) Ah, du bist es, kleiner Mensch. Du kommst zu spät! Die anderen sind bereits auf der Suche nach der Axt.
	AI_Output(hero, self, "Info_Mod_Drach_AtAlmanach_15_01"); //(irritiert) Wie hast du herausgefunden, was im Buch steht?
	AI_Output(self, hero, "Info_Mod_Drach_AtAlmanach_14_02"); //(lacht) Wir haben unsere Augen und Ohren überall! Und nun stirb!

	B_LogEntry	(TOPIC_MOD_BEL_FIVEKNIGHTS, "Ich habe Drach wieder getroffen. Ich muss ihn diesmal wirklich töten.");

	CreateInvItems	(self, ItWr_AxtAlmanach_01, 1);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild	(self, GIL_STRF);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};