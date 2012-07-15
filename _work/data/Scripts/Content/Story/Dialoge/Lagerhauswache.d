INSTANCE Info_Mod_Lagerhauswache_Diebe (C_INFO)
{
	npc		= Mod_7611_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache_Diebe_Condition;
	information	= Info_Mod_Lagerhauswache_Diebe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lagerhauswache_Diebe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_REL_Lagerhaus))
	&& (Npc_HasItems(hero, ItMi_Kiste) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lagerhauswache_Diebe_Info()
{
	AI_Output(self, hero, "Info_Mod_Lagerhauswache_Diebe_28_00"); //Moment mal! Wohin des Wegs?
	AI_Output(hero, self, "Info_Mod_Lagerhauswache_Diebe_15_01"); //Ins Lager, Kisten schleppen.
	AI_Output(self, hero, "Info_Mod_Lagerhauswache_Diebe_28_02"); //Und wo ist Seine Kiste? Schau, da drüben liegen sie.
	AI_Output(self, hero, "Info_Mod_Lagerhauswache_Diebe_28_03"); //Los, schnappe Er sich eine Ladung Schweinefutter ... Er wird nicht fürs Herumstehen bezahlt.

	self.aivar[AIV_PASSGATE] = FALSE;
};

INSTANCE Info_Mod_Lagerhauswache_Diebe2 (C_INFO)
{
	npc		= Mod_7611_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache_Diebe2_Condition;
	information	= Info_Mod_Lagerhauswache_Diebe2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lagerhauswache_Diebe2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_REL_Lagerhaus))
	&& (Npc_HasItems(hero, ItMi_Kiste) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lagerhauswache_Diebe2_Info()
{
	AI_Output(self, hero, "Info_Mod_Lagerhauswache_Diebe2_28_00"); //Warte Er mal ... ahh, eine Kiste voll mit Schweinefutter für unser Lager.
	AI_Output(self, hero, "Info_Mod_Lagerhauswache_Diebe2_28_01"); //Na los, beweg Er sich weiter.

	self.aivar[AIV_PASSGATE] = TRUE;
};

INSTANCE Info_Mod_Lagerhauswache_Stadthalter (C_INFO)
{
	npc		= Mod_7611_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache_Stadthalter_Condition;
	information	= Info_Mod_Lagerhauswache_Stadthalter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin der Stadthalter. Lass mich rein!";
};

FUNC INT Info_Mod_Lagerhauswache_Stadthalter_Condition()
{
	if (Mod_Jim_Freudenspender == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lagerhauswache_Stadthalter_Info()
{
	AI_Output(hero, self, "Info_Mod_Lagerhauswache_Stadthalter_15_00"); //Ich bin der Stadthalter. Lass mich rein!
	AI_Output(self, hero, "Info_Mod_Lagerhauswache_Stadthalter_28_01"); //(lacht dröhnend) Halte Er mich nicht zum Narren! Ich sehe von weitem, dass kein blaues Blut in Seinen Adern fließt!
};

INSTANCE Info_Mod_Lagerhauswache_Duell (C_INFO)
{
	npc		= Mod_7611_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache_Duell_Condition;
	information	= Info_Mod_Lagerhauswache_Duell_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich fordere dich zum Duell!";
};

FUNC INT Info_Mod_Lagerhauswache_Duell_Condition()
{
	if (Mod_Jim_Freudenspender == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lagerhauswache_Duell_Info()
{
	AI_Output(hero, self, "Info_Mod_Lagerhauswache_Duell_15_00"); //Ich fordere dich zum Duell!
	AI_Output(self, hero, "Info_Mod_Lagerhauswache_Duell_28_01"); //Ein Duell? Aus welchem Grund?

	Info_ClearChoices	(Info_Mod_Lagerhauswache_Duell);

	Info_AddChoice	(Info_Mod_Lagerhauswache_Duell, "Dein Vater hat meine Familienehre beschmutzt!", Info_Mod_Lagerhauswache_Duell_B);
	Info_AddChoice	(Info_Mod_Lagerhauswache_Duell, "Einfach so!", Info_Mod_Lagerhauswache_Duell_A);
};

FUNC VOID Info_Mod_Lagerhauswache_Duell_B()
{
	AI_Output(hero, self, "Info_Mod_Lagerhauswache_Duell_B_15_00"); //Dein Vater hat meine Familienehre beschmutzt!
	AI_Output(self, hero, "Info_Mod_Lagerhauswache_Duell_B_28_01"); //(betroffen) Mein Vater? Nein! Mein Vater war ein rechtschaffener Mann!
	AI_Output(self, hero, "Info_Mod_Lagerhauswache_Duell_B_28_02"); //(hart) Er zieht das Ansehen meiner Familie durch seine Anschuldigung in den Unrat. Das kann ich nicht ungesühnt lassen.
	AI_Output(self, hero, "Info_Mod_Lagerhauswache_Duell_B_28_03"); //Zieh Er seine Waffe!

	Info_ClearChoices	(Info_Mod_Lagerhauswache_Duell);

	Mod_Jim_Freudenspender = 2;

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

FUNC VOID Info_Mod_Lagerhauswache_Duell_A()
{
	AI_Output(hero, self, "Info_Mod_Lagerhauswache_Duell_A_15_00"); //Einfach so!
	AI_Output(self, hero, "Info_Mod_Lagerhauswache_Duell_A_28_01"); //Oh nein, dafür kann ich nicht meine Pflicht vernachlässigen.

	Info_ClearChoices	(Info_Mod_Lagerhauswache_Duell);
};

INSTANCE Info_Mod_Lagerhauswache_Bestechung (C_INFO)
{
	npc		= Mod_7611_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache_Bestechung_Condition;
	information	= Info_Mod_Lagerhauswache_Bestechung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie wär's mit ein wenig Gold?";
};

FUNC INT Info_Mod_Lagerhauswache_Bestechung_Condition()
{
	if (Mod_Jim_Freudenspender == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lagerhauswache_Bestechung_Info()
{
	AI_Output(hero, self, "Info_Mod_Lagerhauswache_Bestechung_15_00"); //Wie wär's mit ein wenig Gold?
	AI_Output(self, hero, "Info_Mod_Lagerhauswache_Bestechung_28_01"); //Pah, beleidige Er mich nicht!
};

INSTANCE Info_Mod_Lagerhauswache_Umgehauen (C_INFO)
{
	npc		= Mod_7611_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache_Umgehauen_Condition;
	information	= Info_Mod_Lagerhauswache_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lagerhauswache_Umgehauen_Condition()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE)
	&& (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lagerhauswache_Umgehauen_Info()
{
	AI_Output(self, hero, "Info_Mod_Lagerhauswache_Umgehauen_28_00"); //(unterwürfig) Bitte, spreche Er mich nicht mehr an. Ich bitte Ihn um Verzeihung für alle Beleidigungen, die Ihm durch meine Familie widerfahren sind!

	// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
	self.aivar[AIV_ArenaFight] = AF_NONE;
		
	// ------ AIVAR resetten! ------	
	self.aivar[AIV_LastFightComment] = TRUE;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Lagerhauswache_Umgehauen2 (C_INFO)
{
	npc		= Mod_7611_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache_Umgehauen2_Condition;
	information	= Info_Mod_Lagerhauswache_Umgehauen2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lagerhauswache_Umgehauen2_Condition()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE)
	&& (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_WON)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lagerhauswache_Umgehauen2_Info()
{
	AI_Output(self, hero, "Info_Mod_Lagerhauswache_Umgehauen2_28_00"); //Was wagt Er es, mich nach seiner Niederlage noch einmal anzusprechen? Bleibe Er liegen im Staub der Straße!

	// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
	self.aivar[AIV_ArenaFight] = AF_NONE;
		
	// ------ AIVAR resetten! ------	
	self.aivar[AIV_LastFightComment] = TRUE;

	AI_StopProcessInfos	(self);
};

const string Lagerhauswache_Checkpoint	= "REL_CITY_144";	//WP hinter City-Tor vom Spielstart aus!

instance Info_Mod_Lagerhauswache_FirstWarn (C_INFO)
{
	npc		= Mod_7611_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache_FirstWarn_Condition;
	information	= Info_Mod_Lagerhauswache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_Lagerhauswache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(hero, Lagerhauswache_Checkpoint) <= 300) //NICHT von hinten!
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

func void Info_Mod_Lagerhauswache_FirstWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_Lagerhauswache_FirstWarn_28_00"); //Mäßige Er seinen Schritt! Zu diesem Lagerhaus hat nur unser allerdurchlauchtigster Stadthalter Zutritt!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, Lagerhauswache_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_Lagerhauswache_SecondWarn (C_INFO)
{
	npc		= Mod_7611_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache_SecondWarn_Condition;
	information	= Info_Mod_Lagerhauswache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Lagerhauswache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_GetDistToWP(hero, Lagerhauswache_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50))) 
	{
		return TRUE;
	};
};

func void Info_Mod_Lagerhauswache_SecondWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_Lagerhauswache_SecondWarn_28_00"); //Ich sag's Ihm zum letzten Mal. Einen Schritt weiter und Er begibt sich in die Welt des Schmerzes!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP (hero,Lagerhauswache_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_Lagerhauswache_Attack (C_INFO)
{
	npc		= Mod_7611_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache_Attack_Condition;
	information	= Info_Mod_Lagerhauswache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Lagerhauswache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
	&& (Npc_GetDistToWP(hero,Lagerhauswache_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50)))
	{
		return TRUE;
	};
};

func void Info_Mod_Lagerhauswache_Attack_Info()
{
	hero.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, hero,"Info_Mod_Lagerhauswache_Attack_28_00"); //Er hat es so gewollt ...

	AI_StopProcessInfos	(self);	

	B_Attack (self, hero, AR_GuardStopsIntruder, 0); 
};

INSTANCE Info_Mod_Lagerhauswache_EXIT (C_INFO)
{
	npc		= Mod_7611_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache_EXIT_Condition;
	information	= Info_Mod_Lagerhauswache_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lagerhauswache_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lagerhauswache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};