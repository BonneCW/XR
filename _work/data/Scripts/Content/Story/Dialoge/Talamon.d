INSTANCE Info_Mod_Talamon_Hi (C_INFO)
{
	npc		= Mod_925_KDF_Talamon_NW;
	nr		= 1;
	condition	= Info_Mod_Talamon_Hi_Condition;
	information	= Info_Mod_Talamon_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Talamon_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Talamon_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	if (Kapitel < 5)
	{
		AI_Output(self, hero, "Info_Mod_Talamon_Hi_04_01"); //Ich bin Talamon, Wächter der Bilbiothek.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Talamon_Hi_04_02"); //Ich bin Talamon, Stellvertreter für Pyrokar.
	};
};

INSTANCE Info_Mod_Talamon_Patherion (C_INFO)
{
	npc		= Mod_925_KDF_Talamon_NW;
	nr		= 1;
	condition	= Info_Mod_Talamon_Patherion_Condition;
	information	= Info_Mod_Talamon_Patherion_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Talamon_Patherion_Condition()
{
	if (Npc_GetDistToWP(self, "NW_MONASTERY_THRONE_01") < 1000)	
	&& (Npc_KnowsInfo(hero, Info_Mod_Aaron_BarriereWeg))
	&& (Npc_KnowsInfo(hero, Info_Mod_Talamon_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Talamon_Patherion_Info()
{
	AI_Output(self, hero, "Info_Mod_Talamon_Patherion_04_00"); //Gut, dass du kommst, Bruder! Garan hat mir einen Boten geschickt. Deine Anwesenheit in Patherion ist erwünscht.
	AI_Output(hero, self, "Info_Mod_Talamon_Patherion_15_01"); //Ich mache mich sofort auf den Weg.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Talamon_Befoerderung (C_INFO)
{
	npc		= Mod_925_KDF_Talamon_NW;
	nr		= 1;
	condition	= Info_Mod_Talamon_Befoerderung_Condition;
	information	= Info_Mod_Talamon_Befoerderung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin bereit Ordenspriester zu werden.";
};

FUNC INT Info_Mod_Talamon_Befoerderung_Condition()
{
	if (Mod_Gilde == 7)
	&& (Kapitel > 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Talamon_Befoerderung_Info()
{
	AI_Output(hero, self, "Info_Mod_Talamon_Befoerderung_15_00"); //Ich bin bereit Ordenspriester zu werden.
	AI_Output(self, hero, "Info_Mod_Talamon_Befoerderung_04_01"); //Du hast Innos deine Loyalität bewiesen und da Pyrokar mich dazu befugt hat, ernenne ich dich hiermit zum Ordenspriester Innos'.
	AI_Output(self, hero, "Info_Mod_Talamon_Befoerderung_04_02"); //Ich hoffe du missbrauchst die Macht nicht, die du durch diesen Rang erlangt hast.
	AI_Output(self, hero, "Info_Mod_Talamon_Befoerderung_04_03"); //Hier ist deine neue Robe.

	CreateInvItems	(hero, ItAr_Kdf_H, 1);

	B_ShowGivenThings	("Ordenspriesterrobe erhalten");

	AI_UnequipArmor	(hero);
	AI_EquipArmor	(hero, ItAr_Kdf_H);

	Snd_Play ("LEVELUP");
	
	B_GivePlayerXP	(400);

	Mod_Gilde = 8;

	B_Göttergefallen(1, 5);
};

INSTANCE Info_Mod_Talamon_Ruestung (C_INFO)
{
	npc		= Mod_925_KDF_Talamon_NW;
	nr		= 1;
	condition	= Info_Mod_Talamon_Ruestung_Condition;
	information	= Info_Mod_Talamon_Ruestung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kann ich bei dir eine bessere Robe bekommen?";
};

FUNC INT Info_Mod_Talamon_Ruestung_Condition()
{
	if ((Mod_Gilde == 6)
	|| (Mod_Gilde == 7))
	&& (Npc_KnowsInfo(hero, Info_Mod_Talamon_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Talamon_Ruestung_Info()
{
	AI_Output(hero, self, "Info_Mod_Talamon_Ruestung_15_00"); //Kann ich bei dir eine bessere Robe bekommen?

	if (Kapitel > 1)
	&& (Mod_ErsteVerbesserung == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Talamon_Ruestung_04_02"); //Ich hab gehört, dass beim Pass zum Minental ein Feuersnapper sein soll. Mit dessen Haut könnte ich deine Feuer Novizenrobe sicher ein wenig verbessern.
	
		Mod_ErsteVerbesserung = TRUE;
	
		Wld_InsertNpc	(Feuersnapper,	"NW_PASS_06");
	};

	if (Kapitel > 3)
	&& (Mod_ZweiteVerbesserung == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Talamon_Ruestung_04_03"); //Ich hab gehört, dass beim Weg zur Ausgrabungsstätte der Wassermagier ein Feuerläufer sein soll. Mit dessen Fell könnte ich deine Feuermagierrobe sicher ein wenig verbessern.
	
		Mod_ZweiteVerbesserung = TRUE;
	
		Wld_InsertNpc	(Feuerlaeufer,	"FP_MAGICGOLEM");
	};

	Info_ClearChoices	(Info_Mod_Talamon_Ruestung);
	Info_AddChoice	(Info_Mod_Talamon_Ruestung, DIALOG_BACK, Info_Mod_Talamon_Ruestung_BACK);

	if (Mod_ErsteVerbesserung == TRUE)
	&& (Mod_Gilde == 6)
	{
		Info_AddChoice	(Info_Mod_Talamon_Ruestung, "Feuer-Novizenrobe verbessern", Info_Mod_Talamon_Ruestung_NOV_S);
	};

	if (Mod_ZweiteVerbesserung == TRUE)
	&& (Mod_Gilde == 7)
	{
		Info_AddChoice	(Info_Mod_Talamon_Ruestung, "Feuermagierrobe verbessern", Info_Mod_Talamon_Ruestung_KDF_S);
	};
};

FUNC VOID Info_Mod_Talamon_Ruestung_BACK ()
{
	Info_ClearChoices	(Info_Mod_Talamon_Ruestung);
};

FUNC VOID Info_Mod_Talamon_Ruestung_NOV_S ()
{
	AI_Output(hero, self, "Info_Mod_Talamon_Ruestung_NOV_S_15_00"); //Verbessere meine Feuer-Novizenrobe.

	if (Npc_HasItems(hero, ItAt_FeuersnapperHaut) == 1)
	&& (Npc_HasItems(hero, ItAr_NOV_L) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Talamon_Ruestung_NOV_S_04_01"); //Alles klar.

		Npc_RemoveInvItems	(hero, ItAt_FeuersnapperHaut, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_NOV_L, 1);

		CreateInvItems	(self, ItAr_NOV_M, 1);

		B_GiveInvItems	(self, hero, ItAr_NOV_M, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_Nov_M);
	
		Mod_ErsteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_NOV_L) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Talamon_Ruestung_NOV_S_04_02"); //Du musst schon eine Feuer-Novizenrobe haben, sonst kann ich sie dir nicht verbessern.
	}
	else if (Npc_HasItems(hero, ItAt_Feuersnapperhaut) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Talamon_Ruestung_NOV_S_04_03"); //Wenn du nicht die Snapperhaut hast, kann ich deine Robe nicht verbessern.
	};

	Info_ClearChoices	(Info_Mod_Talamon_Ruestung);
};

FUNC VOID Info_Mod_Talamon_Ruestung_KDF_S ()
{
	AI_Output(hero, self, "Info_Mod_Talamon_Ruestung_KDF_S_15_00"); //Verbessere meine Feuermagierrobe.

	if (Npc_HasItems(hero, ItAt_FireShadowFur) == 1)
	&& (Npc_HasItems(hero, ItAr_KDF_L) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Talamon_Ruestung_KDF_S_04_01"); //Alles klar.

		Npc_RemoveInvItems	(hero, ItAt_FireShadowFur, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_KDF_L, 1);

		CreateInvItems	(self, ItAr_KDF_L_FEUER, 1);

		B_GiveInvItems	(self, hero, ItAr_KDF_L_FEUER, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_KDF_L_Feuer);
	
		Mod_ZweiteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_KDF_L_FEUER) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Talamon_Ruestung_KDF_S_04_02"); //Du musst schon eine Feuermagierrobe haben, sonst kann ich sie dir nicht verbessern.
	}
	else if (Npc_HasItems(hero, ItAt_FireShadowFur) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Talamon_Ruestung_KDF_S_04_03"); //Wenn du nicht das Feuerläufer hast, kann ich deine Robe nicht verbessern.
	};

	Info_ClearChoices	(Info_Mod_Talamon_Ruestung);
};

const string Talamon_Checkpoint	= "NW_MONASTERY_SEALROOM_01";	//WP hinter City-Tor vom Spielstart aus!

instance Info_Mod_Talamon_FirstWarn (C_INFO)
{
	npc		= Mod_925_KDF_Talamon_NW;
	nr		= 1;
	condition	= Info_Mod_Talamon_FirstWarn_Condition;
	information	= Info_Mod_Talamon_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_Talamon_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(hero, Talamon_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};

	if (Kapitel >= 4) //NICHT von hinten!
	{
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

func void Info_Mod_Talamon_FirstWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_Talamon_FirstWarn_04_00"); //Es ist dir nicht gestattet, weiter zu gehen. Kehr um!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, Talamon_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_Talamon_SecondWarn (C_INFO)
{
	npc		= Mod_925_KDF_Talamon_NW;
	nr		= 1;
	condition	= Info_Mod_Talamon_SecondWarn_Condition;
	information	= Info_Mod_Talamon_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Talamon_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_GetDistToWP(hero, Talamon_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50))) 
	{
		return TRUE;
	};
};

func void Info_Mod_Talamon_SecondWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_Talamon_SecondWarn_04_00"); //Innos wird seinen Zorn auf dich richten, wenn du nicht umkehrst!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP (hero,Talamon_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_Talamon_Attack (C_INFO)
{
	npc		= Mod_925_KDF_Talamon_NW;
	nr		= 1;
	condition	= Info_Mod_Talamon_Attack_Condition;
	information	= Info_Mod_Talamon_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Talamon_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
	&& (Npc_GetDistToWP(hero,Talamon_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50)))
	{
		return TRUE;
	};
};

func void Info_Mod_Talamon_Attack_Info()
{
	hero.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_StopProcessInfos	(self);	

	B_Attack (self, hero, AR_GuardStopsIntruder, 0); 
};

INSTANCE Info_Mod_Talamon_Pickpocket (C_INFO)
{
	npc		= Mod_925_KDF_Talamon_NW;
	nr		= 1;
	condition	= Info_Mod_Talamon_Pickpocket_Condition;
	information	= Info_Mod_Talamon_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Talamon_Pickpocket_Condition()
{
	C_Beklauen	(117, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Talamon_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Talamon_Pickpocket);

	Info_AddChoice	(Info_Mod_Talamon_Pickpocket, DIALOG_BACK, Info_Mod_Talamon_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Talamon_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Talamon_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Talamon_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Talamon_Pickpocket);
};

FUNC VOID Info_Mod_Talamon_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Talamon_Pickpocket);
};

INSTANCE Info_Mod_Talamon_EXIT (C_INFO)
{
	npc		= Mod_925_KDF_Talamon_NW;
	nr		= 1;
	condition	= Info_Mod_Talamon_EXIT_Condition;
	information	= Info_Mod_Talamon_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Talamon_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Talamon_EXIT_Info()
{
	AI_Output(self, hero, "Info_Mod_Talamon_EXIT_04_00"); //Magie zu ehren!

	AI_StopProcessInfos	(self);
};