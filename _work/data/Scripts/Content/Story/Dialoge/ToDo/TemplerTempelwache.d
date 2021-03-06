const string TemplerTempelwache_Checkpoint	= "PSI_TEMPLE_IN_02";	//WP hinter City-Tor vom Spielstart aus!

instance Info_Mod_TemplerTempelwache_FirstWarn (C_INFO)
{
	npc		= Mod_1210_TPL_Templer_MT;
	nr		= 1;
	condition	= Info_Mod_TemplerTempelwache_FirstWarn_Condition;
	information	= Info_Mod_TemplerTempelwache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_TemplerTempelwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(hero, TemplerTempelwache_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_RefuseTalk(self) == FALSE))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Jackal_AtPC))
	{
		return TRUE;
	};
};

func void Info_Mod_TemplerTempelwache_FirstWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_TemplerTempelwache_FirstWarn_13_00"); //HALT! Nur Angeh�rige des Lagers d�rfen den Tempel betreten.

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, TemplerTempelwache_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_TemplerTempelwache_SecondWarn (C_INFO)
{
	npc		= Mod_1210_TPL_Templer_MT;
	nr		= 1;
	condition	= Info_Mod_TemplerTempelwache_SecondWarn_Condition;
	information	= Info_Mod_TemplerTempelwache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_TemplerTempelwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_GetDistToWP(hero, TemplerTempelwache_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50))) 
	{
		return TRUE;
	};
};

func void Info_Mod_TemplerTempelwache_SecondWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_TemplerTempelwache_SecondWarn_13_00"); //Ich sag's dir zum letzten Mal. Einen Schritt weiter und du begibst dich in die Welt des Schmerzes!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP (hero,TemplerTempelwache_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_TemplerTempelwache_Attack (C_INFO)
{
	npc		= Mod_1210_TPL_Templer_MT;
	nr		= 1;
	condition	= Info_Mod_TemplerTempelwache_Attack_Condition;
	information	= Info_Mod_TemplerTempelwache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_TemplerTempelwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
	&& (Npc_GetDistToWP(hero,TemplerTempelwache_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50)))
	{
		return TRUE;
	};
};

func void Info_Mod_TemplerTempelwache_Attack_Info()
{
	hero.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, hero,"Info_Mod_TemplerTempelwache_Attack_13_00"); //Du hast es so gewollt ...

	AI_StopProcessInfos	(self);	

	B_Attack (self, hero, AR_GuardStopsIntruder, 0); 
};

INSTANCE Info_Mod_TemplerTempelwache_EXIT (C_INFO)
{
	npc		= Mod_1210_TPL_Templer_MT;
	nr		= 1;
	condition	= Info_Mod_TemplerTempelwache_EXIT_Condition;
	information	= Info_Mod_TemplerTempelwache_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_TemplerTempelwache_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_TemplerTempelwache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};