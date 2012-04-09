INSTANCE Info_Mod_EchseWache_03_Sumpfhaizahn (C_INFO)
{
	npc		= Mod_12008_DRA_Wache_AW;
	nr		= 1;
	condition	= Info_Mod_EchseWache_03_Sumpfhaizahn_Condition;
	information	= Info_Mod_EchseWache_03_Sumpfhaizahn_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Sumpfhaizahn geben)";
};

FUNC INT Info_Mod_EchseWache_03_Sumpfhaizahn_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_Kap4Stab))
	&& (Npc_HasItems(hero, ItAt_SharkTeeth) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_EchseWache_03_Sumpfhaizahn_Info()
{
	B_GiveInvItems	(hero, self, ItAt_SharkTeeth, 1);

	Mod_ECHSI_SumpfhaiZaehne += 1;

	if (Mod_ECHSI_SumpfhaiZaehne == 5)
	{
		B_LogEntry	(TOPIC_MOD_ECHSEN_SCHLACHT, "Jede schwarze Echse hat nun einen Sumpfhaizahn bekommen.");
	};
};

const string EchseWache_03_Checkpoint	= "BL_UP_CHECK";	//WP hinter City-Tor vom Spielstart aus!

instance Info_Mod_EchseWache_03_FirstWarn (C_INFO)
{
	npc		= Mod_12008_DRA_Wache_AW;
	nr		= 1;
	condition	= Info_Mod_EchseWache_03_FirstWarn_Condition;
	information	= Info_Mod_EchseWache_03_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_EchseWache_03_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(hero, EchseWache_03_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_GetDistToWP(self, self.wp) <= 500)
	&& (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void Info_Mod_EchseWache_03_FirstWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_EchseWache_03_FirstWarn_23_00"); //Schhhhhhhhhhhhhhhhhhhhhhhhhzzz.

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, EchseWache_03_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_EchseWache_03_SecondWarn (C_INFO)
{
	npc		= Mod_12008_DRA_Wache_AW;
	nr		= 1;
	condition	= Info_Mod_EchseWache_03_SecondWarn_Condition;
	information	= Info_Mod_EchseWache_03_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_EchseWache_03_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_GetDistToWP(hero, EchseWache_03_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50))) 
	{
		return TRUE;
	};
};

func void Info_Mod_EchseWache_03_SecondWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_EchseWache_03_SecondWarn_23_00"); //Schhhhhhhhhhhhhhhhhhhhhhhhhzzz.

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP (hero,EchseWache_03_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_EchseWache_03_Attack (C_INFO)
{
	npc		= Mod_12008_DRA_Wache_AW;
	nr		= 1;
	condition	= Info_Mod_EchseWache_03_Attack_Condition;
	information	= Info_Mod_EchseWache_03_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_EchseWache_03_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
	&& (Npc_GetDistToWP(hero,EchseWache_03_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50)))
	{
		return TRUE;
	};
};

func void Info_Mod_EchseWache_03_Attack_Info()
{
	hero.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, hero,"Info_Mod_EchseWache_03_Attack_23_00"); //Schhhhhhhhhhhhhhhhhhhhhhhhhzzz.

	AI_StopProcessInfos	(self);	

	B_Attack (self, hero, AR_GuardStopsIntruder, 0); 
};

INSTANCE Info_Mod_EchseWache_03_EXIT (C_INFO)
{
	npc		= Mod_12008_DRA_Wache_AW;
	nr		= 1;
	condition	= Info_Mod_EchseWache_03_EXIT_Condition;
	information	= Info_Mod_EchseWache_03_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_EchseWache_03_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_EchseWache_03_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};