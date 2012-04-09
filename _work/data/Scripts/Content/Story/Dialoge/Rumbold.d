// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Rumbold_EXIT (C_INFO)
{
	npc			= Mod_118_MIL_Rumbold_NW;
	nr			= 999;
	condition	= DIA_Rumbold_EXIT_Condition;
	information	= DIA_Rumbold_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Rumbold_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Rumbold_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

INSTANCE DIA_Rumbold_Attack (C_INFO)
{
	npc			= Mod_118_MIL_Rumbold_NW;
	nr			= 3;
	condition	= DIA_Rumbold_Attack_Condition;
	information	= DIA_Rumbold_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Rumbold_Attack_Condition()
{
	if (Npc_GetDistToWP(hero, "NW_CITY_MERCHANT_PATH_03") < 400)
	{
		return TRUE;
	};
};

func void DIA_Rumbold_Attack_Info()
{	
	AI_Output (self, other,"DIA_Rumbold_Attack_10_00"); //Weg da, Dieb!
	AI_StopProcessInfos	(self);	
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};

const string Rumbold_Checkpoint	= "NW_CITY_MERCHANT_PATH_03";	//WP hinter City-Tor vom Spielstart aus!

instance Info_Mod_Rumbold_FirstWarn (C_INFO)
{
	npc		= Mod_118_MIL_Rumbold_NW;
	nr		= 1;
	condition	= Info_Mod_Rumbold_FirstWarn_Condition;
	information	= Info_Mod_Rumbold_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_Rumbold_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(hero, Rumbold_Checkpoint) <= 500) //NICHT von hinten!
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

func void Info_Mod_Rumbold_FirstWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_Rumbold_FirstWarn_10_00"); //HALT! Du darfst nicht ins Lager.

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, Rumbold_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_Rumbold_SecondWarn (C_INFO)
{
	npc		= Mod_118_MIL_Rumbold_NW;
	nr		= 1;
	condition	= Info_Mod_Rumbold_SecondWarn_Condition;
	information	= Info_Mod_Rumbold_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Rumbold_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_GetDistToWP(hero, Rumbold_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50))) 
	{
		return TRUE;
	};
};

func void Info_Mod_Rumbold_SecondWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_Rumbold_SecondWarn_10_00"); //Hey, hörst du schlecht? Dur darfst da nicht rein.

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP (hero,Rumbold_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_Rumbold_Attack (C_INFO)
{
	npc		= Mod_118_MIL_Rumbold_NW;
	nr		= 1;
	condition	= Info_Mod_Rumbold_Attack_Condition;
	information	= Info_Mod_Rumbold_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Rumbold_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
	&& (Npc_GetDistToWP(hero,Rumbold_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50)))
	{
		return TRUE;
	};
};

func void Info_Mod_Rumbold_Attack_Info()
{
	hero.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, hero,"Info_Mod_Rumbold_Attack_10_00"); //Du hast es so gewollt ...

	AI_StopProcessInfos	(self);	

	B_Attack (self, hero, AR_GuardStopsIntruder, 0); 
};