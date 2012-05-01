INSTANCE Info_Mod_Arto_FrischeLuft (C_INFO)
{
	npc		= Mod_1105_EBR_Arto_MT;
	nr		= 1;
	condition	= Info_Mod_Arto_FrischeLuft_Condition;
	information	= Info_Mod_Arto_FrischeLuft_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Arto_FrischeLuft_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_FrischeLuft))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Arto_FrischeLuft_Info()
{
	AI_Output(self, hero, "Info_Mod_Arto_FrischeLuft_13_00"); //Komm mit.

	AI_StopProcessInfos	(self);

	self.aivar[AIV_PARTYMEMBER] = TRUE;

	B_StartOtherRoutine	(self, "WAYTONL");
};

INSTANCE Info_Mod_Arto_Ruestung (C_INFO)
{
	npc		= Mod_1105_EBR_Arto_MT;
	nr		= 1;
	condition	= Info_Mod_Arto_Ruestung_Condition;
	information	= Info_Mod_Arto_Ruestung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Arto_Ruestung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Arto_FrischeLuft))
	&& (Npc_HasItems(hero, ItAr_BDT_M_01) > 0)
	&& (Npc_GetDistToWP(self, "OW_PATH_063") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Arto_Ruestung_Info()
{
	AI_Output(self, hero, "Info_Mod_Arto_Ruestung_13_00"); //Zieh dir die Banditenrüstung an.

	AI_UnequipArmor	(self);
	AI_UnequipArmor (hero);

	AI_EquipArmor	(hero, ItAr_BDT_M_01);

	CreateInvItems	(self, ItAr_BDT_M_01, 1);
	AI_EquipArmor	(self, ItAr_BDT_M_01);

	AI_StopProcessInfos	(self);

	self.aivar[AIV_PARTYMEMBER] = TRUE;

	B_StartOtherRoutine	(self, "WAYTOORIK");
	B_StartOtherRoutine	(Mod_1319_SLD_Organisator_MT, "ARTO");
};

INSTANCE Info_Mod_Arto_WaitForOrik (C_INFO)
{
	npc		= Mod_1105_EBR_Arto_MT;
	nr		= 1;
	condition	= Info_Mod_Arto_WaitForOrik_Condition;
	information	= Info_Mod_Arto_WaitForOrik_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Arto_WaitForOrik_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Arto_Ruestung))
	&& (Npc_GetDistToWP(self, "NC_PATH62") < 200)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Arto_WaitForOrik_Info()
{
	AI_Output(self, hero, "Info_Mod_Arto_WaitForOrik_13_00"); //Wir warten, bis Orik die Höhle verlässt.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "WAITFORORIK");
	B_StartOtherRoutine	(Mod_1266_SLD_Orik_MT, "ARTO");
};

INSTANCE Info_Mod_Arto_OrikDa (C_INFO)
{
	npc		= Mod_1105_EBR_Arto_MT;
	nr		= 1;
	condition	= Info_Mod_Arto_OrikDa_Condition;
	information	= Info_Mod_Arto_OrikDa_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Arto_OrikDa_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Arto_WaitForOrik))
	&& (Npc_GetDistToWP(Mod_1266_SLD_Orik_MT, "NC_ENTRANCE_WP01") < 200)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Arto_OrikDa_Info()
{
	AI_Output(self, hero, "Info_Mod_Arto_OrikDa_13_00"); //Da ist er ja, schnappen wir ihn uns.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATTACKORIK");

	B_Attack	(self, Mod_1266_SLD_Orik_MT, AR_NONE, 0);
};

INSTANCE Info_Mod_Arto_OrikMit (C_INFO)
{
	npc		= Mod_1105_EBR_Arto_MT;
	nr		= 1;
	condition	= Info_Mod_Arto_OrikMit_Condition;
	information	= Info_Mod_Arto_OrikMit_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Arto_OrikMit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orik_Niedergeschlagen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Arto_OrikMit_Info()
{
	AI_Output(self, hero, "Info_Mod_Arto_OrikMit_13_00"); //Lass uns zum Lager zurückkehren.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "WAYTOAL");
};

INSTANCE Info_Mod_Arto_BeiThorus (C_INFO)
{
	npc		= Mod_1105_EBR_Arto_MT;
	nr		= 1;
	condition	= Info_Mod_Arto_BeiThorus_Condition;
	information	= Info_Mod_Arto_BeiThorus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Arto_BeiThorus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Arto_OrikMit))
	&& (Npc_GetDistToWP(self, "OCC_BARONS_DANCE2") < 200)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Arto_BeiThorus_Info()
{
	AI_Output(self, hero, "Info_Mod_Arto_BeiThorus_13_00"); //Bring Orik zu Thorus.

	AI_StopProcessInfos	(self);

	AI_UnequipArmor	(self);

	self.aivar[AIV_PARTYMEMBER] = FALSE;	

	CreateInvItems	(self, EBR_ARMOR_H2, 1);
	AI_EquipArmor	(self, EBR_ARMOR_H2);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Arto_NochErzbaron (C_INFO)
{
	npc		= Mod_1105_EBR_Arto_MT;
	nr		= 1;
	condition	= Info_Mod_Arto_NochErzbaron_Condition;
	information	= Info_Mod_Arto_NochErzbaron_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist ja immer noch ein Erzbaron.";
};

FUNC INT Info_Mod_Arto_NochErzbaron_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Arto_NochErzbaron_Info()
{
	AI_Output(hero, self, "Info_Mod_Arto_NochErzbaron_15_00"); //Du bist ja immer noch ein Erzbaron.
	AI_Output(self, hero, "Info_Mod_Arto_NochErzbaron_13_01"); //(emotionslos) Wenn man's genau nimmt, schon wieder. Bevor Thorus mich aus den Händen der Aufständischen gerettet hat, war ich kurzzeitig ein Flüchtling.
	AI_Output(hero, self, "Info_Mod_Arto_NochErzbaron_15_02"); //Wie ist das passiert?
	AI_Output(self, hero, "Info_Mod_Arto_NochErzbaron_13_03"); //Ich habe etwas zu lange gebraucht, um zu merken, welche Folgen Gomez' Verschwinden haben würde.
	AI_Output(self, hero, "Info_Mod_Arto_NochErzbaron_13_04"); //Als ich mich dann aus dem Staub machen wollte, bin ich Stone über den Weg gelaufen.
	AI_Output(self, hero, "Info_Mod_Arto_NochErzbaron_13_05"); //Der Dreckskerl hat sofort seine Mitverschwörer zu sich gerufen und mich einkesseln lassen.
	AI_Output(self, hero, "Info_Mod_Arto_NochErzbaron_13_06"); //Bevor sie mich aufknüpfen konnten, hat mich Thorus da rausgehauen.
	AI_Output(self, hero, "Info_Mod_Arto_NochErzbaron_13_07"); //Was Stone von der Aktion hatte, kannst du dir ja draußen noch anschauen - wir wollten nicht, dass  die anderen so schnell vergessen, was eine Rebellion für Folgen hat.
};

INSTANCE Info_Mod_Arto_WarumBarriere (C_INFO)
{
	npc		= Mod_1105_EBR_Arto_MT;
	nr		= 1;
	condition	= Info_Mod_Arto_WarumBarriere_Condition;
	information	= Info_Mod_Arto_WarumBarriere_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso bist du eigentlich in die Barriere geworfen worden?";
};

FUNC INT Info_Mod_Arto_WarumBarriere_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Arto_WarumBarriere_Info()
{
	AI_Output(hero, self, "Info_Mod_Arto_WarumBarriere_15_00"); //Wieso bist du eigentlich in die Barriere geworfen worden?
	AI_Output(self, hero, "Info_Mod_Arto_WarumBarriere_13_01"); //(kalt) Wegen Betrugs und Fälschung, vor allem. Ein paar Tote waren auch im Spiel, aber die hatte ich nicht geplant.
};

INSTANCE Info_Mod_Arto_WerRebellion (C_INFO)
{
	npc		= Mod_1105_EBR_Arto_MT;
	nr		= 1;
	condition	= Info_Mod_Arto_WerRebellion_Condition;
	information	= Info_Mod_Arto_WerRebellion_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer war an der Rebellion beteiligt?";
};

FUNC INT Info_Mod_Arto_WerRebellion_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Arto_NochErzbaron))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Arto_WerRebellion_Info()
{
	AI_Output(hero, self, "Info_Mod_Arto_WerRebellion_15_00"); //Wer war an der Rebellion beteiligt?
	AI_Output(self, hero, "Info_Mod_Arto_WerRebellion_13_01"); //Scorpio war ihr Anführer, dann eben noch Stone. Die beiden hatten sich wohl erhofft, Gomez' Nachfolge antreten zu können.
	AI_Output(self, hero, "Info_Mod_Arto_WerRebellion_13_02"); //Hatten dazu eine ganze Schar Schatten und Buddler hinter sich gebracht.
	AI_Output(self, hero, "Info_Mod_Arto_WerRebellion_13_03"); //Aber genützt hat es ihnen nichts.
};

INSTANCE Info_Mod_Arto_WasRebellion (C_INFO)
{
	npc		= Mod_1105_EBR_Arto_MT;
	nr		= 1;
	condition	= Info_Mod_Arto_WasRebellion_Condition;
	information	= Info_Mod_Arto_WasRebellion_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist aus den Aufständischen geworden?";
};

FUNC INT Info_Mod_Arto_WasRebellion_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Arto_NochErzbaron))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Arto_WasRebellion_Info()
{
	AI_Output(hero, self, "Info_Mod_Arto_WasRebellion_15_00"); //Was ist aus den Aufständischen geworden?
	AI_Output(self, hero, "Info_Mod_Arto_WasRebellion_13_01"); //Die eine Hälfte ist geflohen - wohin, weiß nur Beliar. Die andere Hälfte ist Thorus in die Hände gefallen.
	AI_Output(self, hero, "Info_Mod_Arto_WasRebellion_13_02"); //Stone wurde als Erster lebendig aufgespießt. Die anderen wurden gezwungen, ihm dabei zuzusehen.
	AI_Output(self, hero, "Info_Mod_Arto_WasRebellion_13_03"); //Die meisten von ihnen haben anschließend ihren Kopf verloren, bis auf die ganz Vorwitzigen, die einen etwas ... unappetitlicheren Tod erlitten haben.
};

INSTANCE Info_Mod_Arto_Pickpocket (C_INFO)
{
	npc		= Mod_1105_EBR_Arto_MT;
	nr		= 1;
	condition	= Info_Mod_Arto_Pickpocket_Condition;
	information	= Info_Mod_Arto_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Arto_Pickpocket_Condition()
{
	C_Beklauen	(100, ItMi_Gold, 900);
};

FUNC VOID Info_Mod_Arto_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Arto_Pickpocket);

	Info_AddChoice	(Info_Mod_Arto_Pickpocket, DIALOG_BACK, Info_Mod_Arto_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Arto_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Arto_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Arto_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Arto_Pickpocket);
};

FUNC VOID Info_Mod_Arto_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Arto_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Arto_Pickpocket);

		Info_AddChoice	(Info_Mod_Arto_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Arto_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Arto_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Arto_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Arto_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Arto_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Arto_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Arto_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Arto_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Arto_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Arto_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Arto_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Arto_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Arto_EXIT (C_INFO)
{
	npc		= Mod_1105_EBR_Arto_MT;
	nr		= 1;
	condition	= Info_Mod_Arto_EXIT_Condition;
	information	= Info_Mod_Arto_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Arto_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Arto_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};