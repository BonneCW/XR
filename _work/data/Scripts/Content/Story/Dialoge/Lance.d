INSTANCE Info_Mod_Lance_Kristall (C_INFO)
{
	npc		= Mod_926_RDW_Lance_NW;
	nr		= 1;
	condition	= Info_Mod_Lance_Kristall_Condition;
	information	= Info_Mod_Lance_Kristall_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich möchte den Magiern des Wassers diesen magischen Kristall überbringen.";
};

FUNC INT Info_Mod_Lance_Kristall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Kristall))
	&& (Npc_HasItems(hero, Mod_PaladinKristall) == 1)
	&& (Npc_HasItems(hero, ItWr_TorlofForSaturas) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lance_Kristall_Info()
{
	AI_Output(hero, self, "Info_Mod_Lance_Kristall_15_00"); //Ich möchte den Magiern des Wassers diesen magischen Kristall wie auch dieses Schreiben überbringen.

	B_ShowGivenThings	("Kristall und Brief gegeben");

	Npc_RemoveInvItems	(hero, ItWr_TorlofForSaturas, 1);
	Npc_RemoveInvItems	(hero, Mod_PaladinKristall, 1);

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Lance_Kristall_03_01"); //Acha, magischer Kristall ... Entgelt.
	AI_Output(self, hero, "Info_Mod_Lance_Kristall_03_02"); //(zum Held) Gut, ich werde den Wassermagiern beides übergeben. Komm morgen wieder.

	Mod_LanceKristall = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_NL_KRISTALL, "Na toll. Jetzt darf ich einen ganzen Tag warten, bis die Wassermagier sich über die Bezahlung geeinigt haben.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Lance_KristallEntgelt (C_INFO)
{
	npc		= Mod_926_RDW_Lance_NW;
	nr		= 1;
	condition	= Info_Mod_Lance_KristallEntgelt_Condition;
	information	= Info_Mod_Lance_KristallEntgelt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lance_KristallEntgelt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lance_Kristall))
	&& (Wld_GetDay() > Mod_LanceKristall)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lance_KristallEntgelt_Info()
{
	AI_Output(self, hero, "Info_Mod_Lance_KristallEntgelt_03_00"); //Die Wassermagier waren sehr erfreut über das Artefakt.
	AI_Output(self, hero, "Info_Mod_Lance_KristallEntgelt_03_01"); //Sie gaben mir 1000 Goldstücke und dieses Paket voller nützlicher magischer Gegenstände für euch mit. Bring beides am besten gleich zu Torlof.

	B_ShowGivenThings	("1000 Gold und Paket erhalten");

	CreateInvItems	(hero, ItMi_Gold, 1000);
	CreateInvItems	(hero, ItMi_MagicPaket, 1);

	B_LogEntry	(TOPIC_MOD_NL_KRISTALL, "Ich habe die Entlohnung der Wassermagier und sollte sie nun zu Torlof bringen.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Lance_Soeldner (C_INFO)
{
	npc		= Mod_926_RDW_Lance_NW;
	nr		= 1;
	condition	= Info_Mod_Lance_Soeldner_Condition;
	information	= Info_Mod_Lance_Soeldner_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich bin Söldner.";
};

FUNC INT Info_Mod_Lance_Soeldner_Condition()
{
	if (Mod_Gilde == 4)
	&& (Mod_PortalLance == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lance_Soeldner_Info()
{
	AI_Output(hero, self, "Info_Mod_Lance_Soeldner_15_00"); //Ich bin Söldner.

	var C_ITEM SLDRuessi;
	SLDRuessi = Npc_GetEquippedArmor(hero);

	if (Hlp_IsItem(SLDRuessi, ItAr_SLD_L) == TRUE)
	|| (Hlp_IsItem(SLDRuessi, ItAr_SLD_M) == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Lance_Soeldner_03_01"); //Die Söldner und Wassermagier haben damals im Minental zusammengearbeitet und einige der Wasserkrieger sind ehemalige Söldner. In Ordnung, du kannst rein.

		Mod_PortalLance	= TRUE;

		Wld_SendTrigger	("EVT_PORTAL_EINGANG_TOR_01");

		self.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Lance_Soeldner_03_02"); //Ach ja, und woran soll man das bitte erkennen?
	};
};

INSTANCE Info_Mod_Lance_RDW (C_INFO)
{
	npc		= Mod_926_RDW_Lance_NW;
	nr		= 1;
	condition	= Info_Mod_Lance_RDW_Condition;
	information	= Info_Mod_Lance_RDW_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich gehöre zu euch.";
};

FUNC INT Info_Mod_Lance_RDW_Condition()
{
	if (Mod_Gilde == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lance_RDW_Info()
{
	AI_Output(hero, self, "Info_Mod_Lance_RDW_15_00"); //Ich gehöre zu euch.
	AI_Output(self, hero, "Info_Mod_Lance_RDW_03_01"); //Ein neuer. Na dann geh mal rein.

	Mod_PortalLance = TRUE;

	Wld_SendTrigger	("EVT_PORTAL_EINGANG_TOR_01");

	self.aivar[AIV_PASSGATE] = TRUE;
};

INSTANCE Info_Mod_Lance_Brief (C_INFO)
{
	npc		= Mod_926_RDW_Lance_NW;
	nr		= 1;
	condition	= Info_Mod_Lance_Brief_Condition;
	information	= Info_Mod_Lance_Brief_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich hab einen Brief für Saturas.";
};

FUNC INT Info_Mod_Lance_Brief_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Saturas))
	&& (Mod_LanceXardasBrief == FALSE)
	&& ((Npc_HasItems(hero, XardasLetterForSaturas) == 1)
	|| (Npc_HasItems(hero, XardasLetterForSaturas_Geoeffnet) == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lance_Brief_Info()
{
	AI_Output(hero, self, "Info_Mod_Lance_Brief_15_00"); //Ich hab hier einen Brief für Saturas.
	AI_Output(self, hero, "Info_Mod_Lance_Brief_03_01"); //Zeig ihn mir mal.

	Info_ClearChoices	(Info_Mod_Lance_Brief);

	Info_AddChoice	(Info_Mod_Lance_Brief, "Nein, der Brief ist nur für Saturas.", Info_Mod_Lance_Brief_Nein);
	Info_AddChoice	(Info_Mod_Lance_Brief, "Hier ist er.", Info_Mod_Lance_Brief_Ja);
};

FUNC VOID Info_Mod_Lance_Brief_Nein()
{
	AI_Output(hero, self, "Info_Mod_Lance_Brief_Nein_15_00"); //Nein, der Brief ist nur für Saturas.
	AI_Output(self, hero, "Info_Mod_Lance_Brief_Nein_03_01"); //Wenn ich nicht weiß worum es geht darf ich dich nicht reinlassen.

	Info_ClearChoices	(Info_Mod_Lance_Brief);
};

FUNC VOID Info_Mod_Lance_Brief_Ja()
{
	AI_Output(hero, self, "Info_Mod_Lance_Brief_Ja_15_00"); //Hier ist er.
	
	if (Npc_HasItems(hero, XardasLetterForSaturas) == 1)
	{
		B_GiveInvItems(hero, self, XardasLetterForSaturas, 1);

		B_GivePlayerXP	(100);
	}
	else
	{
		B_GiveInvItems(hero, self, XardasLetterForSaturas_Geoeffnet, 1);

		B_GivePlayerXP	(75);
	};

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Lance_Brief_Ja_03_01"); //Sieht wichtig aus. Hier ist der Brief wieder.

	B_GiveInvItems	(self, hero, XardasLetterForSaturas_Geoeffnet, 1);

	AI_Output(self, hero, "Info_Mod_Lance_Brief_Ja_03_02"); //Du kannst durch gehen.

	Mod_PortalLance	= TRUE;
	Mod_LanceXardasBrief = TRUE;

	Wld_SendTrigger	("EVT_PORTAL_EINGANG_TOR_01");

	self.aivar[AIV_PASSGATE] = TRUE;

	Info_ClearChoices	(Info_Mod_Lance_Brief);
};

INSTANCE Info_Mod_Lance_Erol (C_INFO)
{
	npc		= Mod_926_RDW_Lance_NW;
	nr		= 1;
	condition	= Info_Mod_Lance_Erol_Condition;
	information	= Info_Mod_Lance_Erol_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lance_Erol_Condition()
{
	if (Mod_Erol_Fahrender == 8)
	&& (Npc_GetDistToNpc(hero, Mod_521_NONE_Erol_NW) < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lance_Erol_Info()
{
	AI_Output(self, hero, "Info_Mod_Lance_Erol_03_00"); //Halt! Ihr könnt hier nicht rein.
	AI_Output(hero, self, "Info_Mod_Lance_Erol_15_01"); //Nicht schon wieder! Ich darf doch mittlerweile durch, oder?
	AI_Output(self, hero, "Info_Mod_Lance_Erol_03_02"); //Du schon, aber der Andere nicht.
	AI_Output(hero, self, "Info_Mod_Lance_Erol_15_03"); //Ich hab keine Zeit mehr. Und dieser Mann muss mit Cavalorn reden. Lass ihn durch, ich bürge für ihn.
	AI_Output(self, hero, "Info_Mod_Lance_Erol_03_04"); //Ich bekomme Probleme mit den Magiern ...
	AI_Output(hero, self, "Info_Mod_Lance_Erol_15_05"); //Quatsch. Ich bin Saturas engster Vertrauter. Das geht in Ordnung.
	AI_Output(self, hero, "Info_Mod_Lance_Erol_03_06"); //Ich vertrau dir mal. Aber wenn ich Ärger bekomme, dann lass dich nicht mehr hier sehen!
	AI_Output(hero, self, "Info_Mod_Lance_Erol_15_07"); //Ich benutze normal eh die Teleporter ...
};

const string Lance_Checkpoint	= "NW_TROLLAREA_PORTALTEMPEL_04";	//WP hinter City-Tor vom Spielstart aus!

instance Info_Mod_Lance_FirstWarn (C_INFO)
{
	npc		= Mod_926_RDW_Lance_NW;
	nr		= 1;
	condition	= Info_Mod_Lance_FirstWarn_Condition;
	information	= Info_Mod_Lance_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_Lance_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(hero, Lance_Checkpoint) <= 700) //NICHT von hinten!
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

func void Info_Mod_Lance_FirstWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_Lance_FirstWarn_03_00"); //HALT! Du darfst hier nicht rein.

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, Lance_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_Lance_SecondWarn (C_INFO)
{
	npc		= Mod_926_RDW_Lance_NW;
	nr		= 1;
	condition	= Info_Mod_Lance_SecondWarn_Condition;
	information	= Info_Mod_Lance_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Lance_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_GetDistToWP(hero, Lance_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50))) 
	{
		return TRUE;
	};
};

func void Info_Mod_Lance_SecondWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_Lance_SecondWarn_03_00"); //Ich sag's dir zum letzten Mal. Einen Schritt weiter und du begibst dich in die Welt des Schmerzes!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP (hero,Lance_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_Lance_Attack (C_INFO)
{
	npc		= Mod_926_RDW_Lance_NW;
	nr		= 1;
	condition	= Info_Mod_Lance_Attack_Condition;
	information	= Info_Mod_Lance_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Lance_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
	&& (Npc_GetDistToWP(hero,Lance_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50)))
	{
		return TRUE;
	};
};

func void Info_Mod_Lance_Attack_Info()
{
	hero.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, hero,"Info_Mod_Lance_Attack_03_00"); //Du hast es so gewollt ...

	AI_StopProcessInfos	(self);	

	B_Attack (self, hero, AR_GuardStopsIntruder, 0); 
};

INSTANCE Info_Mod_Lance_Pickpocket (C_INFO)
{
	npc		= Mod_926_RDW_Lance_NW;
	nr		= 1;
	condition	= Info_Mod_Lance_Pickpocket_Condition;
	information	= Info_Mod_Lance_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Lance_Pickpocket_Condition()
{
	C_Beklauen	(73, ItMi_Gold, 320);
};

FUNC VOID Info_Mod_Lance_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lance_Pickpocket);

	Info_AddChoice	(Info_Mod_Lance_Pickpocket, DIALOG_BACK, Info_Mod_Lance_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lance_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lance_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lance_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lance_Pickpocket);
};

FUNC VOID Info_Mod_Lance_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Lance_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Lance_Pickpocket);

		Info_AddChoice	(Info_Mod_Lance_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Lance_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Lance_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Lance_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Lance_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Lance_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Lance_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Lance_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Lance_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Lance_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Lance_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Lance_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Lance_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Lance_EXIT (C_INFO)
{
	npc		= Mod_926_RDW_Lance_NW;
	nr		= 1;
	condition	= Info_Mod_Lance_EXIT_Condition;
	information	= Info_Mod_Lance_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lance_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lance_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};