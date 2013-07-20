// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Mil_305_Torwache_EXIT (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 999;
	condition	= DIA_Mil_305_Torwache_EXIT_Condition;
	information	= DIA_Mil_305_Torwache_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Mil_305_Torwache_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Mil_305_Torwache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Ich BIN Bürger!  				  
// ************************************************************
INSTANCE DIA_Mil_305_Torwache_PassAsCitizen (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 1;
	condition	= DIA_Mil_305_Torwache_PassAsCitizen_Condition;
	information	= DIA_Mil_305_Torwache_PassAsCitizen_Info;
	important	= TRUE;
};                       
FUNC INT DIA_Mil_305_Torwache_PassAsCitizen_Condition()
{	
	if (Mod_IstLehrling == 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Mil_305_Torwache_PassAsCitizen_Info()
{
	AI_Output (self, hero, "DIA_Mil_305_Torwache_PassAsCitizen_03_00"); //Auf dich hab ich gewartet!
	AI_Output (hero, self, "DIA_Mil_305_Torwache_PassAsCitizen_15_01"); //Hab ich was verbrochen?
	AI_Output (self, hero, "DIA_Mil_305_Torwache_PassAsCitizen_03_02"); //(lacht) Bestimmt. Aber darum geht's nicht. Lord Hagen will dich sehen. Geradeaus im Rathaus.
		
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string Mil_305_Checkpoint	= "NW_CITY_UPTOWN_PATH_02";	//WP hinter City-Tor vom Spielstart aus!
// -----------------------------------------------------------
//	var int Mil_305_schonmalreingelassen; Hab ich mal in Globals geschrieben, weils im Close Log abgefragt wird Mattes
// -----------------------------------------------------------

instance DIA_Mil_305_Torwache_FirstWarn (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 1;
	condition	= DIA_Mil_305_Torwache_FirstWarn_Condition;
	information	= DIA_Mil_305_Torwache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Mil_305_Torwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, Mil_305_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) //wenn CRIME in Stadt bekannt
	&& (Mil_305_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else //CRIME_NONE (oder Sheepkiller) - wenn Crime rehabilitiert, wird hier PASSGATE automatisch wieder auf TRUE gesetzt
	{
		if (Mil_305_schonmalreingelassen == TRUE)
		{
			self.aivar[AIV_PASSGATE] = TRUE;
		};
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_00"); //HALT!

	// ------ PETZMASTER LIGHT und Personal CRIMES -------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_01"); //Du wirst in der Stadt als Mörder gesucht! Bis die Sache geklärt ist, kann ich dich nicht ins obere Viertel lassen.
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_02"); //Solange du des Diebstahls angeklagt bist, kannst du nicht in obere Viertel!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_03"); //Einen Unruhestifter wie dich kann ich nicht ins obere Viertel lassen.
		};
	
		AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_04"); //Geh zu Lord Andre und regele die Sache!
	}
	
	// ------ normales Reinkommen ------
	else 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_05"); //Nur Bürger der Stadt und Truppen des Königs kommen ins obere Viertel!
	};

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Mil_305_Torwache_SecondWarn (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 2;
	condition	= DIA_Mil_305_Torwache_SecondWarn_Condition;
	information	= DIA_Mil_305_Torwache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_305_Torwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_305_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_305_Torwache_SecondWarn_03_00"); //Ich sag's dir zum letzten Mal. Einen Schritt weiter und du begibst dich in die Welt des Schmerzes!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Mil_305_Torwache_Attack (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 3;
	condition	= DIA_Mil_305_Torwache_Attack_Condition;
	information	= DIA_Mil_305_Torwache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_305_Torwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_305_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Mil_305_Torwache_Attack_03_00"); //Du hast es so gewollt ...
	AI_StopProcessInfos	(self);	
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};

INSTANCE DIA_Mil_305_Torwache_ToHagen (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 3;
	condition	= DIA_Mil_305_Torwache_ToHagen_Condition;
	information	= DIA_Mil_305_Torwache_ToHagen_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Mil_305_Torwache_ToHagen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Flucht))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_ToHagen_Info()
{
	AI_Output (self, other,"DIA_Mil_305_Torwache_ToHagen_03_00"); //Stop!
	AI_Output (self, other,"DIA_Mil_305_Torwache_ToHagen_03_01"); //Der Bürger Bodo hat uns davon berichtet dass du ein gesuchter Bandit aus dem Minental bist.
	AI_Output (hero, self,"DIA_Mil_305_Torwache_ToHagen_15_02"); //Was? Ich habe ein wichtiges Anliegen an die Paladine. Geh zu Lord Hagen und sag ihm, dass mich Alissandro geschickt hat, er wird mich sicher empfangen.
	AI_Output (self, other,"DIA_Mil_305_Torwache_ToHagen_03_03"); //Oh nein, das werde ich nicht machen. Du wirst per Haftbefehl gesucht, Freundchen, und deshalb kommst du jetzt einmal schön mit.

	AI_StopProcessInfos	(self);	

	B_StartOtherRoutine	(Mod_540_PAL_Andre_NW,	"KNAST");

	AI_Teleport	(hero, "WP_HERO_KNAST"); 

	B_LogEntry	(TOPIC_MOD_AL_FLUCHT, "In der Stadt wurde ich festgenommen. Lord Andre wird mich nun verhören.");

	if (Mod_Zellentuer_Knast_01 == 1)
	{
		Mod_Zellentuer_Knast_01 = 0;

		Wld_SendTrigger	("EVT_CITY_PRISON_03");
	};
};

	

// ***************************************************************
//							Ausnahme (PERM)
// ***************************************************************
instance DIA_Mil_305_Torwache_Ausnahme (C_INFO)
{
	npc			 = 	Mil_305_Torwache;
	nr			 = 	2;
	condition	 = 	DIA_Mil_305_Torwache_Ausnahme_Condition;
	information	 = 	DIA_Mil_305_Torwache_Ausnahme_Info;
	permanent    =  TRUE;
	description	 = 	"Können wir nicht mal eine Ausnahme machen?";
};
func int DIA_Mil_305_Torwache_Ausnahme_Condition ()
{	
	if (Mil_305_schonmalreingelassen == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Mil_305_Torwache_Ausnahme_Info ()
{
	AI_Output (other, self, "DIA_Mil_305_Torwache_Ausnahme_15_00"); //Können wir nicht mal eine Ausnahme machen?
	AI_Output (self, other, "DIA_Mil_305_Torwache_Ausnahme_03_01"); //(poltert) Was?! Es gibt Regeln in dieser Stadt! Regeln, die für ausnahmslos alle gelten!
	AI_Output (self, other, "DIA_Mil_305_Torwache_Ausnahme_03_02"); //Wenn wir diese Regeln brechen, handeln wir ungerecht gegen alle, die sie einhalten.
};	

INSTANCE DIA_Mil_305_Torwache_PERM (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 1;
	condition	= DIA_Mil_305_Torwache_PERM_Condition;
	information	= DIA_Mil_305_Torwache_PERM_Info;
	permanent	= TRUE;
	description	= "Wie steht's?";
};        
         
FUNC INT DIA_Mil_305_Torwache_PERM_Condition()
{	
	if (Mil_305_schonmalreingelassen == TRUE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_305_Torwache_PERM_Info()
{
	AI_Output (other, self,"DIA_Mil_305_Torwache_PERM_15_00"); //Wie steht's?
	
	if (other.guild == GIL_PAL) 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_01"); //Alles in Ordnung, Kamerad!
	}
	else if (other.guild == GIL_VLK)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_02"); //Wir erfüllen hier nur unsere Pflicht. Danke, dass du mich beachtet hast, Erwählter!
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_03"); //Ich muss dich reinlassen, aber reden muss ich mit dir nicht!
	}
	else //GIL_None 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_04"); //Was willst du?
	};
	
	AI_StopProcessInfos	(self);
};