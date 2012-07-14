const string PasswachePAL_Checkpoint	= "NW_PASS_GATE_01";

instance Info_Mod_PasswachePAL_Hi (C_INFO)
{
	npc		= Mod_7675_RIT_Ritter_NW;
	nr		= 1;
	condition	= Info_Mod_PasswachePAL_Hi_Condition;
	information	= Info_Mod_PasswachePAL_Hi_Info;
	permanent	= 0;
	important	= 1;
};                       

func int Info_Mod_PasswachePAL_Hi_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Hagen_Hi))
	{
		return TRUE;
	};
};

func void Info_Mod_PasswachePAL_Hi_Info()
{
	AI_Output (self, hero, "Info_Mod_PasswachePAL_Hi_12_00"); //Halt! Das Flüchten aus dem Minental ist untersagt!
	AI_Output (hero, self, "Info_Mod_PasswachePAL_Hi_15_01"); //Ich komme doch nicht aus dem Minental, sondern will hinein.
	AI_Output (self, hero, "Info_Mod_PasswachePAL_Hi_12_02"); //Äh ... Du willst da rein?
	AI_Output (hero, self, "Info_Mod_PasswachePAL_Hi_15_03"); //Ja. Ist wenigstens das erlaubt?
	AI_Output (self, hero, "Info_Mod_PasswachePAL_Hi_12_04"); //(unsicher) Das Durchqueren dieses Zuganges ist allgemein untersagt. Du könntest ja Waffen schmuggeln ... oder so.
	AI_Output (hero, self, "Info_Mod_PasswachePAL_Hi_15_05"); //Sehe ich so aus, als würde ich viele Waffen bei mir tragen?
	AI_Output (self, hero, "Info_Mod_PasswachePAL_Hi_12_06"); //Keine Ahnung.
	AI_Output (hero, self, "Info_Mod_PasswachePAL_Hi_15_07"); //(seufzt) An wen muss ich mich wenden, damit ihr Schwachköpfe mich durchlasst?
	AI_Output (self, hero, "Info_Mod_PasswachePAL_Hi_12_08"); //Wir kontrollieren den Zugang auf ausdrücklichen Befehl Lord Hagens.
	AI_Output (hero, self, "Info_Mod_PasswachePAL_Hi_15_09"); //(ironisch) Immer schön die Augen offen halten!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, PasswachePAL_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

instance Info_Mod_PasswachePAL_Asylanten (C_INFO)
{
	npc		= Mod_7675_RIT_Ritter_NW;
	nr		= 1;
	condition	= Info_Mod_PasswachePAL_Asylanten_Condition;
	information	= Info_Mod_PasswachePAL_Asylanten_Info;
	permanent	= 0;
	important	= 1;
};                       

func int Info_Mod_PasswachePAL_Asylanten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_Hi))
	{
		return TRUE;
	};
};

func void Info_Mod_PasswachePAL_Asylanten_Info()
{
	AI_Output (self, hero, "Info_Mod_PasswachePAL_Asylanten_12_00"); //Du bist ...
	AI_Output (hero, self, "Info_Mod_PasswachePAL_Asylanten_15_01"); //Ja. Lass mich durch!
	AI_Output (self, hero, "Info_Mod_PasswachePAL_Asylanten_12_02"); //Ich würde da ja niemals freiwillig reingehen, aber wenn du unbedingt willst ... Lass dich nicht aufhalten.

	self.aivar[AIV_PassGate] = TRUE;

	AI_StopProcessInfos	(self);
};

instance Info_Mod_PasswachePAL_FirstWarn (C_INFO)
{
	npc		= Mod_7675_RIT_Ritter_NW;
	nr		= 1;
	condition	= Info_Mod_PasswachePAL_FirstWarn_Condition;
	information	= Info_Mod_PasswachePAL_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_PasswachePAL_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(hero, PasswachePAL_Checkpoint) <= 300) //NICHT von hinten!
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

func void Info_Mod_PasswachePAL_FirstWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_PasswachePAL_FirstWarn_12_00"); //Hey! Du darfst immer noch nicht durch!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, PasswachePAL_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_PasswachePAL_SecondWarn (C_INFO)
{
	npc		= Mod_7675_RIT_Ritter_NW;
	nr		= 1;
	condition	= Info_Mod_PasswachePAL_SecondWarn_Condition;
	information	= Info_Mod_PasswachePAL_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_PasswachePAL_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_GetDistToWP(hero, PasswachePAL_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50))) 
	{
		return TRUE;
	};
};

func void Info_Mod_PasswachePAL_SecondWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_PasswachePAL_SecondWarn_12_00"); //Ich sag's dir zum letzten Mal. Einen Schritt weiter und du begibst dich in die Welt des Schmerzes!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP (hero,PasswachePAL_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_PasswachePAL_Attack (C_INFO)
{
	npc		= Mod_7675_RIT_Ritter_NW;
	nr		= 1;
	condition	= Info_Mod_PasswachePAL_Attack_Condition;
	information	= Info_Mod_PasswachePAL_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_PasswachePAL_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
	&& (Npc_GetDistToWP(hero,PasswachePAL_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50)))
	{
		return TRUE;
	};
};

func void Info_Mod_PasswachePAL_Attack_Info()
{
	hero.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, hero,"Info_Mod_PasswachePAL_Attack_12_00"); //Du hast es so gewollt ...

	AI_StopProcessInfos	(self);	

	B_Attack (self, hero, AR_GuardStopsIntruder, 0); 
};

INSTANCE Info_Mod_PasswachePAL_EXIT (C_INFO)
{
	npc		= Mod_7675_RIT_Ritter_NW;
	nr		= 1;
	condition	= Info_Mod_PasswachePAL_EXIT_Condition;
	information	= Info_Mod_PasswachePAL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_PasswachePAL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_PasswachePAL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};