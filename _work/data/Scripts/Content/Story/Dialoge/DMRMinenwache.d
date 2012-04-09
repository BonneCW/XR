INSTANCE Info_Mod_DMRMinenwache_GoIn (C_INFO)
{
	npc		= Mod_7358_DMR_Daemonenritter_MT;
	nr		= 1;
	condition	= Info_Mod_DMRMinenwache_GoIn_Condition;
	information	= Info_Mod_DMRMinenwache_GoIn_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gibt es irgendeine Möglichkeit, dass du mich reinlässt?";
};

FUNC INT Info_Mod_DMRMinenwache_GoIn_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Fertig))
	{
		return 1;
	};
};

FUNc VOID Info_Mod_DMRMinenwache_GoIn_Info()
{
	AI_Output(hero, self, "Info_Mod_DMRMinenwache_GoIn_15_00"); //Gibt es irgendeine Möglichkeit, dass du mich reinlässt?
	AI_Output(self, hero, "Info_Mod_DMRMinenwache_GoIn_05_01"); //Nein, nicht solange du zu uns gehörst. Und jetzt verschwinde.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_DMRMinenwache_GoIn2 (C_INFO)
{
	npc		= Mod_7358_DMR_Daemonenritter_MT;
	nr		= 1;
	condition	= Info_Mod_DMRMinenwache_GoIn2_Condition;
	information	= Info_Mod_DMRMinenwache_GoIn2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und könntest du nur kurz vom Eingang weggehen, wenn mir ein Beutel (...)";
};

FUNC INT Info_Mod_DMRMinenwache_GoIn2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_DMRMinenwache_GoIn))
	{
		return 1;
	};
};

FUNc VOID Info_Mod_DMRMinenwache_GoIn2_Info()
{
	AI_Output(hero, self, "Info_Mod_DMRMinenwache_GoIn2_15_00"); //Und könntest du nur kurz vom Eingang weggehen, wenn mir ein Beutel mit 200 Goldmünzen versehentlich auf den Boden fallen sollte?
	AI_Output(self, hero, "Info_Mod_DMRMinenwache_GoIn2_05_01"); //Der einzige Grund vom Eingang wegzugehen wäre, dir ordentlich in den Arsch zu treten.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_DMRMinenwache_GoIn3 (C_INFO)
{
	npc		= Mod_7358_DMR_Daemonenritter_MT;
	nr		= 1;
	condition	= Info_Mod_DMRMinenwache_GoIn3_Condition;
	information	= Info_Mod_DMRMinenwache_GoIn3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mir in den Arsch zu treten? Das glaube ich erst, wenn ich es gesehen habe ...";
};

FUNC INT Info_Mod_DMRMinenwache_GoIn3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_DMRMinenwache_GoIn2))
	{
		return 1;
	};
};

FUNc VOID Info_Mod_DMRMinenwache_GoIn3_Info()
{
	AI_Output(hero, self, "Info_Mod_DMRMinenwache_GoIn3_15_00"); //Mir in den Arsch zu treten? Das glaube ich erst, wenn ich es gesehen habe ...
	AI_Output(self, hero, "Info_Mod_DMRMinenwache_GoIn3_05_01"); //Ok, jetzt reicht’s.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

const string DMRMinenwache_Checkpoint	= "PALTOBURGLINKS_2_4";	//WP hinter City-Tor vom Spielstart aus!

instance Info_Mod_DMRMinenwache_FirstWarn (C_INFO)
{
	npc		= Mod_7358_DMR_Daemonenritter_MT;
	nr		= 1;
	condition	= Info_Mod_DMRMinenwache_FirstWarn_Condition;
	information	= Info_Mod_DMRMinenwache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_DMRMinenwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(hero, DMRMinenwache_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void Info_Mod_DMRMinenwache_FirstWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_DMRMinenwache_FirstWarn_05_00"); //HALT! Niemand darf ohne Genehmigung die Mine betreten.

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, DMRMinenwache_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_DMRMinenwache_SecondWarn (C_INFO)
{
	npc		= Mod_7358_DMR_Daemonenritter_MT;
	nr		= 1;
	condition	= Info_Mod_DMRMinenwache_SecondWarn_Condition;
	information	= Info_Mod_DMRMinenwache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_DMRMinenwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_GetDistToWP(hero, DMRMinenwache_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50))) 
	{
		return TRUE;
	};
};

func void Info_Mod_DMRMinenwache_SecondWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_DMRMinenwache_SecondWarn_05_00"); //Keinen Schritt weiter!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP (hero,DMRMinenwache_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_DMRMinenwache_Attack (C_INFO)
{
	npc		= Mod_7358_DMR_Daemonenritter_MT;
	nr		= 1;
	condition	= Info_Mod_DMRMinenwache_Attack_Condition;
	information	= Info_Mod_DMRMinenwache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_DMRMinenwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
	&& (Npc_GetDistToWP(hero,DMRMinenwache_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50)))
	{
		return TRUE;
	};
};

func void Info_Mod_DMRMinenwache_Attack_Info()
{
	hero.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, hero,"Info_Mod_DMRMinenwache_Attack_05_00"); //Du hast es so gewollt ...

	AI_StopProcessInfos	(self);	

	B_Attack (self, hero, AR_GuardStopsIntruder, 0); 
};

INSTANCE Info_Mod_DMRMinenwache_EXIT (C_INFO)
{
	npc		= Mod_7358_DMR_Daemonenritter_MT;
	nr		= 1;
	condition	= Info_Mod_DMRMinenwache_EXIT_Condition;
	information	= Info_Mod_DMRMinenwache_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_DMRMinenwache_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_DMRMinenwache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};