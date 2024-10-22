// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE Info_Mod_Parlaf_EXIT (C_INFO)
{
	npc			= Mil_309_Stadtwache;
	nr			= 999;
	condition	= Info_Mod_Parlaf_EXIT_Condition;
	information	= Info_Mod_Parlaf_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT Info_Mod_Parlaf_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID Info_Mod_Parlaf_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string Mil_309_Checkpoint	= "NW_CITY_ENTRANCE_MAIN";	//WP hinter City-Tor vom Spielstart aus!
// -----------------------------------------------------------
	var int MIL_309_Personal_AbsolutionLevel;
	//var int Mil_309_schonmalreingelassen; --> GLOBALS
// -----------------------------------------------------------

INSTANCE Info_Mod_Parlaf_HaradLehrling (C_INFO)
{
	npc		= Mil_309_Stadtwache;
	nr		= 1;
	condition	= Info_Mod_Parlaf_HaradLehrling_Condition;
	information	= Info_Mod_Parlaf_HaradLehrling_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Parlaf_HaradLehrling_Condition()
{
	if (Npc_HasItems(hero, ItMi_Waffenbuendel) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlaf_HaradLehrling_Info()
{
	AI_Output(self, hero, "Info_Mod_Parlaf_HaradLehrling_06_00"); //Stopp. Du bist doch der Lehrling von Harad, oder?
	AI_Output(hero, self, "Info_Mod_Parlaf_HaradLehrling_15_01"); //Ja, schon ...
	AI_Output(self, hero, "Info_Mod_Parlaf_HaradLehrling_06_02"); //Auf Anweisung Tengrons müssen wir dich durchsuchen. Einen kleinen Moment, bitte ...

	AI_PlayAni	(self, "T_PLUNDER");

	AI_Output(self, hero, "Info_Mod_Parlaf_HaradLehrling_06_03"); //Um dieses Waffenbündel ging es. Damit verstößt Harad gegen eine Bestimmung Tengrons. Wir müssen es an uns nehmen.

	B_GiveInvItems	(hero, self, ItMi_Waffenbuendel, 1);

	AI_Output(self, hero, "Info_Mod_Parlaf_HaradLehrling_06_04"); //Dass Harad versucht, es durch dich zu den Söldnern zu schmuggeln, wird ernsthafte Konsequenzen für ihn haben.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Parlaf_Randolph (C_INFO)
{
	npc		= Mil_309_Stadtwache;
	nr		= 1;
	condition	= Info_Mod_Parlaf_Randolph_Condition;
	information	= Info_Mod_Parlaf_Randolph_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Parlaf_Randolph_Condition()
{
	if (Mod_Randolph_Started == 11)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Mika_Randolph))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlaf_Randolph_Info()
{
	AI_Output(self, hero, "Info_Mod_Parlaf_Randolph_06_00"); //Du machst besser, dass du schnell in die Stadt kommst.
	AI_Output(self, hero, "Info_Mod_Parlaf_Randolph_06_01"); //Hier draußen treiben sich zurzeit Dämonen umher, die keinen am Leben lassen, der ihren Weg kreuzt.
	AI_Output(hero, self, "Info_Mod_Parlaf_Randolph_15_02"); //Dämonen? Woher stammen diese?
	AI_Output(self, hero, "Info_Mod_Parlaf_Randolph_06_03"); //Keine Ahnung, sie sind hier überall in den Wäldern nahe der Stadt. Und in der Nähe von Lobart’s Hof treibt sich zudem eine obskure Gestalt umher.
	AI_Output(self, hero, "Info_Mod_Parlaf_Randolph_06_04"); //Egal, ich muss jetzt aufpassen und habe keine Zeit mich weiter zu unterhalten.
};

INSTANCE Info_Mod_Parlaf_RandolphWeg (C_INFO)
{
	npc		= Mil_309_Stadtwache;
	nr		= 1;
	condition	= Info_Mod_Parlaf_RandolphWeg_Condition;
	information	= Info_Mod_Parlaf_RandolphWeg_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Parlaf_RandolphWeg_Condition()
{
	if ((Mod_Randolph_Started == 13)
	|| (Mod_Randolph_Started == 16))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Mika_RandolphWeg))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlaf_RandolphWeg_Info()
{
	AI_Output(self, hero, "Info_Mod_Parlaf_RandolphWeg_06_00"); //Gute Nachrichten. Die Dämonen scheinen sich langsam zurückzuziehen.
	AI_Output(self, hero, "Info_Mod_Parlaf_RandolphWeg_06_01"); //(hochmütig) Dürften wohl erkannt haben, dass sie es mit uns nicht aufnehmen können.
	AI_Output(self, hero, "Info_Mod_Parlaf_RandolphWeg_06_02"); //Du kannst also wieder unbesorgt vor die Stadt gehen.

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Parlaf_Rasend (C_INFO)
{
	npc		= Mil_309_Stadtwache;
	nr		= 1;
	condition	= Info_Mod_Parlaf_Rasend_Condition;
	information	= Info_Mod_Parlaf_Rasend_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Parlaf_Rasend_Condition()
{
	if (Mod_WM_Rasend >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlaf_Rasend_Info()
{
	AI_Output(self, hero, "Info_Mod_Parlaf_Rasend_06_00"); //Hey, pass auf, wenn du dich vor der Stadt herumtreibst.
	AI_Output(self, hero, "Info_Mod_Parlaf_Rasend_06_01"); //Am Hafen ist etwas Schreckliches vorgefallen und das üble dämonische Geschöpf, das dies alles getan hat, muss sich immer noch in der Nähe befinden.
};

INSTANCE Info_Mod_Parlaf_Hi (C_INFO)
{
	npc		= Mil_309_Stadtwache;
	nr		= 1;
	condition	= Info_Mod_Parlaf_Hi_Condition;
	information	= Info_Mod_Parlaf_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Parlaf_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Parlaf_Hi_Info()
{
	var C_Item NovArmorOrNot;
	NovArmorOrNot = Npc_GetEquippedArmor(hero);

	if (Hlp_IsItem(NovArmorOrNot, ITAR_FAKE_NOV_L) == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Parlaf_Hi_06_00"); //Halt! Was treibt dich denn hierher?
		AI_Output(self, hero, "Info_Mod_Parlaf_Hi_06_01"); //Ich gebe dir nur den guten Rat in der Stadt ja keinen Ärger zu machen, sonst findest du sich schneller außerhalb der Stadtmauern wieder, als dir lieb ist. Verstanden?
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Parlaf_Hi_06_02"); //Ahh, ein Novize des Innosklosters.
		AI_Output(self, hero, "Info_Mod_Parlaf_Hi_06_03"); //Es freut mich immer, wenn ich die Streiter für das Rechtschaffende in unseren Stadtmauern willkommen heißen darf.
		AI_Output(self, hero, "Info_Mod_Parlaf_Hi_06_04"); //Wenn man bedenkt, was sich sonst so für Gesindel seit dem Fall der Barriere hier herumtreibt ...
		AI_Output(self, hero, "Info_Mod_Parlaf_Hi_06_05"); //Jedenfalls solltest du aufpassen, was du in der Stadt tust, da gibt es leicht Ärger in letzter Zeit.
	};

	Info_ClearChoices	(Info_Mod_Parlaf_Hi);

	if (Hlp_IsItem(NovArmorOrNot, ITAR_FAKE_NOV_L) == FALSE)
	{
		Info_AddChoice	(Info_Mod_Parlaf_Hi, "Ich werde tun und lassen, was immer ich will.", Info_Mod_Parlaf_Hi_B);
	};
	Info_AddChoice	(Info_Mod_Parlaf_Hi, "Natürlich.", Info_Mod_Parlaf_Hi_A);
};

FUNC VOID Info_Mod_Parlaf_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Parlaf_Hi_B_15_00"); //Ich werde tun und lassen, was immer ich will.
	AI_Output(self, hero, "Info_Mod_Parlaf_Hi_B_06_01"); //So? Aber nicht in der Stadt. Einen Unruhestifter wie dich werde ich bestimmt nicht hereinlassen.

	if (!Npc_HasEquippedArmor(hero))
	{
		AI_Output(self, hero, "Info_Mod_Parlaf_Hi_B_06_02"); //Nicht mal Kleidung ...
	};

	Info_ClearChoices	(Info_Mod_Parlaf_Hi);

	AI_StopProcessInfos	(self);

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,Mil_309_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};

FUNC VOID Info_Mod_Parlaf_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Parlaf_Hi_A_15_00"); //Natürlich.
	AI_Output(self, hero, "Info_Mod_Parlaf_Hi_A_06_01"); //Gut, dann verstehen wir uns.

	Info_ClearChoices	(Info_Mod_Parlaf_Hi);

	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_333_Stadtwache.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
	Mil_309_schonmalreingelassen = TRUE;
};

INSTANCE Info_Mod_Parlaf_DunklerPilger (C_INFO)
{
	npc		= Mil_309_Stadtwache;
	nr		= 1;
	condition	= Info_Mod_Parlaf_DunklerPilger_Condition;
	information	= Info_Mod_Parlaf_DunklerPilger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist hier vor kurzem ein Pilger in schwarzem Gewand (...)";
};

FUNC INT Info_Mod_Parlaf_DunklerPilger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlaf_Hi))
	&& (self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlaf_DunklerPilger_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlaf_DunklerPilger_15_00"); //Ist hier vor kurzem ein Pilger in schwarzem Gewand vorbeigekommen?
	AI_Output(self, hero, "Info_Mod_Parlaf_DunklerPilger_06_01"); //Nicht, dass ich wüsste.
};

INSTANCE Info_Mod_Parlaf_Daemonisch (C_INFO)
{
	npc		= Mil_309_Stadtwache;
	nr		= 1;
	condition	= Info_Mod_Parlaf_Daemonisch_Condition;
	information	= Info_Mod_Parlaf_Daemonisch_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Parlaf_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlaf_Hi))
	&& (self.aivar[AIV_PASSGATE] == TRUE)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Mod_HQ_Daemonisch >= 2)
	&& (Kapitel == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlaf_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Parlaf_Daemonisch_06_00"); //Halt, erst den 1/4 Klosterwein trinken

	B_GiveInvItems	(self, hero, ItFo_KWine, 1);

	B_UseItem	(hero, ItFo_KWine);

	if (Mod_HQ_Daemonisch == 6)
	{
		AI_Output(self, hero, "Info_Mod_Parlaf_Daemonisch_06_01"); //Der Typ vorher wäre uns ja fast durch die Lappen gegangen, aber wir sind eben doch zu flink und er musste hübsch austrinken.
		AI_Output(self, hero, "Info_Mod_Parlaf_Daemonisch_06_02"); //Ist danach weiter wien Irrer in den Wald gerannt ...

		AI_TurnAway	(hero, self);

		AI_Output(hero, self, "Info_Mod_Parlaf_Daemonisch_15_03"); //(zu sich selbst) Was, er hat den Klosterweintest bestanden? Dann kann er ja eigentlich nur ...  Urnol.

		Mod_HQ_Daemonisch = 7;

		B_LogEntry	(TOPIC_MOD_DAEMONISCH, "So, vom Südtor aus rechts in den Wald gelaufen. Dich krieg ich ... Urnol.");
	};

	Npc_SetRefuseTalk (self, 40);
};

instance Info_Mod_Parlaf_FirstWarn (C_INFO)
{
	npc			= Mil_309_Stadtwache;
	nr			= 1;
	condition	= Info_Mod_Parlaf_FirstWarn_Condition;
	information	= Info_Mod_Parlaf_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_Parlaf_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, Mil_309_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) //wenn CRIME in Stadt bekannt
	&& (B_GetCurrentAbsolutionLevel(self) == MIL_309_Personal_AbsolutionLevel) //und noch nicht bezahlt
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else //CRIME_NONE (oder Sheepkiller) - wenn Crime rehabilitiert, wird hier PASSGATE automatisch wieder auf TRUE gesetzt
	{
		if (Mil_309_schonmalreingelassen == TRUE)
		{
			self.aivar[AIV_PASSGATE] = TRUE;
		};
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&& (self.aivar[AIV_PASSGATE]						== FALSE		)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&& (Npc_RefuseTalk(self) 							== FALSE 		))
	&& (Npc_KnowsInfo(hero, Info_Mod_Parlaf_Hi))
	{
		return TRUE;
	};
};

func void Info_Mod_Parlaf_FirstWarn_Info()
{
	AI_Output (self, other,"Info_Mod_Parlaf_FirstWarn_06_00"); //HALT!
		
	// ------ PETZMASTER LIGHT ------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output (other, self,"Info_Mod_Parlaf_FirstWarn_15_01"); //(seufzt) Was denn?
		AI_Output (self, other,"Info_Mod_Parlaf_FirstWarn_06_02"); //Das weißt du ganz genau!
	
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"Info_Mod_Parlaf_FirstWarn_06_03"); //Du wirst in der Stadt als Mörder gesucht!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"Info_Mod_Parlaf_FirstWarn_06_04"); //Dreckige Diebe brauchen wir hier nicht!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"Info_Mod_Parlaf_FirstWarn_06_05"); //Unruhestifter können wir in unserer Stadt nicht gebrauchen!
		};
	
		AI_Output (self, other,"Info_Mod_Parlaf_FirstWarn_06_06"); //Warum, glaubst du, sollten wir dich reinlassen?
	}
	else // ------ normales Reinkommen ------
	{
		 var C_Item itm; itm = Npc_GetEquippedArmor(other);
		
		// ------ ohne Rüstung ------
		if (Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output (other, self,"Info_Mod_Parlaf_FirstWarn_15_07"); //Was denn?
			AI_Output (self, other,"Info_Mod_Parlaf_FirstWarn_06_08"); //DU kommst hier nicht rein, mein Junge!
			AI_Output (other, self,"Info_Mod_Parlaf_FirstWarn_15_09"); //Warum nicht?
			AI_Output (self, other,"Info_Mod_Parlaf_FirstWarn_06_10"); //So abgerissen, wie du aussiehst, machst du hier bestimmt nur Ärger!
			AI_Output (self, other,"Info_Mod_Parlaf_FirstWarn_06_11"); //Wir haben schon genug Gesindel in der Stadt. Leute ohne Geld können wir nicht gebrauchen.
		}
 	 	else 
		{
			AI_Output (other, self,"Info_Mod_Parlaf_FirstWarn_15_18"); //(ruhig) Was?
			if (hero.guild == GIL_PAL)
			|| (hero.guild == GIL_KDF)
			{
				AI_Output (self, other,"Info_Mod_Parlaf_FirstWarn_06_19"); //Verzeihung, aber so sind nun mal die Vorschriften.
				AI_Output (other, self,"Info_Mod_Parlaf_FirstWarn_15_20"); //Willst du mich aufhalten?
				AI_Output (self, other,"Info_Mod_Parlaf_FirstWarn_06_21"); //Natürlich nicht. Alle Angehörigen der Kirche Innos' sind uns selbstverständlich willkommen.
				
			}
			else
			{
				AI_Output (self, other,"Info_Mod_Parlaf_FirstWarn_06_22"); //Wollte dich nur mal ansehen. Siehst aus, als ob du Geld hättest. Kannst reingehen.
			};
			self.aivar[AIV_PASSGATE] = TRUE;
			Mil_333_Stadtwache.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
			Mil_309_schonmalreingelassen = TRUE;
			
			AI_StopProcessInfos(self);
		};
	};

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,Mil_309_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_Parlaf_SecondWarn (C_INFO)
{
	npc			= Mil_309_Stadtwache;
	nr			= 2;
	condition	= Info_Mod_Parlaf_SecondWarn_Condition;
	information	= Info_Mod_Parlaf_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Parlaf_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_309_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void Info_Mod_Parlaf_SecondWarn_Info()
{
	AI_Output (self, other,"Info_Mod_Parlaf_SecondWarn_06_00"); //Jetzt werd mal nicht ulkig. Noch einen Schritt und ich hack dich in Stücke!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Mil_309_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_Parlaf_Attack (C_INFO)
{
	npc			= Mil_309_Stadtwache;
	nr			= 3;
	condition	= Info_Mod_Parlaf_Attack_Condition;
	information	= Info_Mod_Parlaf_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Parlaf_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_309_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void Info_Mod_Parlaf_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"Info_Mod_Parlaf_Attack_06_00"); //Du hast es so gewollt ...
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};


// ************************************************************
// 							Bestechung!
// ************************************************************

INSTANCE Info_Mod_Parlaf_Bribe (C_INFO)
{
	npc			= Mil_309_Stadtwache;
	nr			= 5;
	condition	= Info_Mod_Parlaf_Bribe_Condition;
	information	= Info_Mod_Parlaf_Bribe_Info;
	permanent	= TRUE;
	description	= "Hier sind 100 Goldstücke. Lass mich rein!";
};                       

FUNC INT Info_Mod_Parlaf_Bribe_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};
	
func void Info_Mod_Parlaf_Bribe_Info()
{
	AI_Output (other, self,"Info_Mod_Parlaf_Bribe_15_00"); //Hier sind 100 Goldstücke. Lass mich rein!
	
	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		AI_Output (self, other,"Info_Mod_Parlaf_Bribe_06_01"); //(gierig) 100 Goldstücke klingen gut. Dann mal immer rein mit dir.
		
		if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output (self, other,"Info_Mod_Parlaf_Bribe_06_02"); //Und geh direkt zu Lord Andre! Sonst knöpf ich dir beim nächsten Mal wieder 100 Goldstücke ab!
		};
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Mil_333_Stadtwache.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
		Mil_309_schonmalreingelassen = TRUE;
		B_CheckLog();
		
		// ------ wenn bezahlt, persönliche Absolution erteilen -------
		MIL_309_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else //nicht genug Gold
	{
		AI_Output (self, other,"Info_Mod_Parlaf_Bribe_06_03"); //Was?! Wo?! Ich sehe keine 100 Goldmünzen. Hau ab!
	};
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Parlaf_PERM (C_INFO)
{
	npc			= Mil_309_Stadtwache;
	nr			= 5;
	condition	= Info_Mod_Parlaf_PERM_Condition;
	information	= Info_Mod_Parlaf_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

FUNC INT Info_Mod_Parlaf_PERM_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	&& (Kapitel != 4)
	{
		return TRUE;
	};
};
	
func void Info_Mod_Parlaf_PERM_Info()
{
	AI_Output (self, other,"Info_Mod_Parlaf_PERM_06_00"); //Weitergehen!
	
	AI_StopProcessInfos (self);
};