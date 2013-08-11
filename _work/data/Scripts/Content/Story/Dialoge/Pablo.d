INSTANCE Info_Mod_Pablo_Hi (C_INFO)
{
	npc		= Mod_744_MIL_Pablo_NW;
	nr		= 1;
	condition	= Info_Mod_Pablo_Hi_Condition;
	information	= Info_Mod_Pablo_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Pablo_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Pablo_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Pablo_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Pablo_Hi_12_01"); //Hi.
};

INSTANCE Info_Mod_Pablo_Mortis (C_INFO)
{
	npc		= Mod_744_MIL_Pablo_NW;
	nr		= 1;
	condition	= Info_Mod_Pablo_Mortis_Condition;
	information	= Info_Mod_Pablo_Mortis_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mortis schickt mich.";
};

FUNC INT Info_Mod_Pablo_Mortis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pablo_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Mortis_Andre))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pablo_Mortis_Info()
{
	AI_Output(hero, self, "Info_Mod_Pablo_Mortis_15_00"); //Mortis schickt mich. Ich soll dich fragen ob alles in Ordnung ist.
	AI_Output(self, hero, "Info_Mod_Pablo_Mortis_12_01"); //Bring mir erst mal ein Brot, einen Käse und eine Flasche Wasser.
};

INSTANCE Info_Mod_Pablo_Infos (C_INFO)
{
	npc		= Mod_744_MIL_Pablo_NW;
	nr		= 1;
	condition	= Info_Mod_Pablo_Infos_Condition;
	information	= Info_Mod_Pablo_Infos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab dein Essen.";
};

FUNC INT Info_Mod_Pablo_Infos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pablo_Mortis))
	&& (Npc_HasItems(hero, ItFo_Water) >= 1)
	&& (Npc_HasItems(hero, ItFo_Cheese) >= 1)
	&& (Npc_HasItems(hero, ItFo_Bread) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pablo_Infos_Info()
{
	AI_Output(hero, self, "Info_Mod_Pablo_Infos_15_00"); //Ich hab dein Essen.

	Npc_RemoveInvItems	(hero, ItFo_Water, 1);
	Npc_RemoveInvItems	(hero, ItFo_Cheese, 1);
	Npc_RemoveInvItems	(hero, ItFo_Bread, 1);

	B_ShowGivenThings	("Wasser, Käse und Brot gegeben");

	AI_Output(self, hero, "Info_Mod_Pablo_Infos_12_01"); //Danke.
	AI_Output(hero, self, "Info_Mod_Pablo_Infos_15_02"); //Sagst du mir jetzt ob alles in Ordnung ist?
	AI_Output(self, hero, "Info_Mod_Pablo_Infos_12_03"); //Bei mir ist alles in Ordnung.

	B_LogEntry	(TOPIC_MOD_MORTIS_KONTROLLE, "Bei Pablo ist alles in Ordnung.");

	B_Göttergefallen(1, 1);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Pablo_RLMord (C_INFO)
{
	npc		= Mod_744_MIL_Pablo_NW;
	nr		= 1;
	condition	= Info_Mod_Pablo_RLMord_Condition;
	information	= Info_Mod_Pablo_RLMord_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pablo_RLMord_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_RLMord))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pablo_RLMord_Info()
{
	AI_Output(self, hero, "Info_Mod_Pablo_RLMord_12_00"); //Hier haben Unbefugte keine ... Oh, du bist einer von uns.
	AI_Output(self, hero, "Info_Mod_Pablo_RLMord_12_01"); //Andre hat mir bereits gesagt, dass er dich schicken würde. Wir vernehmen gerade die Anwesenden. Die Leiche ist oben im 2. Zimmer.

	Info_ClearChoices	(Info_Mod_Pablo_RLMord);

	Info_AddChoice	(Info_Mod_Pablo_RLMord, "Bei welcher der Prostituierten war Jason?", Info_Mod_Pablo_RLMord_C);
	Info_AddChoice	(Info_Mod_Pablo_RLMord, "Wer war zum Mordzeitpunkt alles anwesend?", Info_Mod_Pablo_RLMord_B);
	Info_AddChoice	(Info_Mod_Pablo_RLMord, "Wann geschah der Mord?", Info_Mod_Pablo_RLMord_A);
};

FUNC VOID Info_Mod_Pablo_RLMord_C()
{
	AI_Output(hero, self, "Info_Mod_Pablo_RLMord_C_15_00"); //Bei welcher der Prostituierten war Jason?
	AI_Output(self, hero, "Info_Mod_Pablo_RLMord_C_12_01"); //Bei Giselle, der mit dem blauen Kleid.

	Mod_PAL_RLChoices += 1;

	if (Mod_PAL_RLChoices == 5)
	{
		Info_ClearChoices	(Info_Mod_Pablo_RLMord);
	};
};

FUNC VOID Info_Mod_Pablo_RLMord_B()
{
	AI_Output(hero, self, "Info_Mod_Pablo_RLMord_B_15_00"); //Wer war zum Mordzeitpunkt alles anwesend?
	AI_Output(self, hero, "Info_Mod_Pablo_RLMord_B_12_01"); //Naja, zum einen Giselle, die ihn ... bediente, dann noch drei weitere Prostituierte und zwei Freier.
	AI_Output(self, hero, "Info_Mod_Pablo_RLMord_B_12_02"); //Die beiden anderen Paare werden gerade vernommen, waren aber augenscheinlich in ... einander vertieft, als der Mord begangen wurden.

	Mod_PAL_RLChoices += 1;

	if (Mod_PAL_RLChoices == 5)
	{
		Info_ClearChoices	(Info_Mod_Pablo_RLMord);
	};
};

FUNC VOID Info_Mod_Pablo_RLMord_A()
{
	AI_Output(hero, self, "Info_Mod_Pablo_RLMord_A_15_00"); //Wann geschah der Mord?
	AI_Output(self, hero, "Info_Mod_Pablo_RLMord_A_12_01"); //Heute früh gegen 4 Uhr.

	Mod_PAL_RLChoices += 1;

	if (Mod_PAL_RLChoices == 5)
	{
		Info_ClearChoices	(Info_Mod_Pablo_RLMord);
	};
};

INSTANCE Info_Mod_Pablo_Giselle (C_INFO)
{
	npc		= Mod_744_MIL_Pablo_NW;
	nr		= 1;
	condition	= Info_Mod_Pablo_Giselle_Condition;
	information	= Info_Mod_Pablo_Giselle_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pablo_Giselle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Giselle_RLMord))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pablo_Giselle_Info()
{
	AI_Output(self, hero, "Info_Mod_Pablo_Giselle_12_00"); //Und, schon was herausgefunden?
	AI_Output(hero, self, "Info_Mod_Pablo_Giselle_15_01"); //Irgendwas ist hier merkwürdig und zwar ...

	Info_ClearChoices	(Info_Mod_Pablo_Giselle);

	Info_AddChoice	(Info_Mod_Pablo_Giselle, "... die Waffe des Mörders.", Info_Mod_Pablo_Giselle_E);
	Info_AddChoice	(Info_Mod_Pablo_Giselle, "... die Waffe des Opfers.", Info_Mod_Pablo_Giselle_D);
	Info_AddChoice	(Info_Mod_Pablo_Giselle, "... die Wunde.", Info_Mod_Pablo_Giselle_C);
	Info_AddChoice	(Info_Mod_Pablo_Giselle, "... das Zimmer.", Info_Mod_Pablo_Giselle_B);
	Info_AddChoice	(Info_Mod_Pablo_Giselle, "... die Lage der Leiche.", Info_Mod_Pablo_Giselle_A);
};

FUNC VOID Info_Mod_Pablo_Giselle_F()
{
	AI_Output(self, hero, "Info_Mod_Pablo_Giselle_F_12_00"); //Nein, das scheint mir alles ins Bild zu passen.

	Mod_PAL_Pablo_FirstRaetsel += 1;
};

FUNC VOID Info_Mod_Pablo_Giselle_E()
{
	AI_Output(hero, self, "Info_Mod_Pablo_Giselle_E_15_00"); //... die Waffe des Mörders.

	Info_Mod_Pablo_Giselle_F();
};

FUNC VOID Info_Mod_Pablo_Giselle_D()
{
	AI_Output(hero, self, "Info_Mod_Pablo_Giselle_D_15_00"); //... die Waffe des Opfers.
	AI_Output(self, hero, "Info_Mod_Pablo_Giselle_D_12_01"); //Du hast recht ... irgendwas stimmt da nicht ... aber was?

	if (Mod_PAL_Pablo_FirstRaetsel == 0)
	{
		B_GivePlayerXP	(1500);
	}
	else if (Mod_PAL_Pablo_FirstRaetsel == 1)
	{
		B_GivePlayerXP	(500);
	}
	else if (Mod_PAL_Pablo_FirstRaetsel == 2)
	{
		B_GivePlayerXP	(100);
	};

	Info_ClearChoices	(Info_Mod_Pablo_Giselle);

	Info_AddChoice	(Info_Mod_Pablo_Giselle, "Die Waffe ist gezogen.", Info_Mod_Pablo_Giselle_I);
	Info_AddChoice	(Info_Mod_Pablo_Giselle, "Die Waffe ist stumpf.", Info_Mod_Pablo_Giselle_H);
	Info_AddChoice	(Info_Mod_Pablo_Giselle, "Das ist nicht seine Waffe.", Info_Mod_Pablo_Giselle_G);
};

FUNC VOID Info_Mod_Pablo_Giselle_C()
{
	AI_Output(hero, self, "Info_Mod_Pablo_Giselle_C_15_00"); //... die Wunde.

	Info_Mod_Pablo_Giselle_F();
};

FUNC VOID Info_Mod_Pablo_Giselle_B()
{
	AI_Output(hero, self, "Info_Mod_Pablo_Giselle_B_15_00"); //... das Zimmer.

	Info_Mod_Pablo_Giselle_F();
};

FUNC VOID Info_Mod_Pablo_Giselle_A()
{
	AI_Output(hero, self, "Info_Mod_Pablo_Giselle_A_15_00"); //... die Lager der Leiche.

	Info_Mod_Pablo_Giselle_F();
};

FUNC VOID Info_Mod_Pablo_Giselle_I()
{
	AI_Output(hero, self, "Info_Mod_Pablo_Giselle_I_15_00"); //Die Waffe ist gezogen.
	AI_Output(self, hero, "Info_Mod_Pablo_Giselle_I_12_01"); //Du hast recht ... Giselle hat doch gesagt, dass er ohne Vorwarnung getötet wurde.

	if (Mod_PAL_Pablo_SecondRaetsel == 0)
	{
		B_GivePlayerXP	(1000);
	}
	else if (Mod_PAL_Pablo_SecondRaetsel == 1)
	{
		B_GivePlayerXP	(250);
	};

	B_LogEntry	(TOPIC_MOD_PAL_RL, "Jason hatte seine Waffe gezogen. Er kann also nicht überraschend gestorben sein. Ich sollte nochmal mit Giselle reden.");

	Info_ClearChoices	(Info_Mod_Pablo_Giselle);
};

FUNC VOID Info_Mod_Pablo_Giselle_H()
{
	AI_Output(hero, self, "Info_Mod_Pablo_Giselle_H_15_00"); //Die Waffe ist stumpf.
	AI_Output(self, hero, "Info_Mod_Pablo_Giselle_H_12_01"); //Die ist scharf wie ein Rasiermesser.

	Mod_PAL_Pablo_SecondRaetsel += 1;
};

FUNC VOID Info_Mod_Pablo_Giselle_G()
{
	AI_Output(hero, self, "Info_Mod_Pablo_Giselle_G_15_00"); //Das ist nicht seine Waffe.
	AI_Output(self, hero, "Info_Mod_Pablo_Giselle_G_12_01"); //Doch, die gehört ihm. Dienstwaffe.

	Mod_PAL_Pablo_SecondRaetsel += 1;
};

INSTANCE Info_Mod_Pablo_GiselleFlucht (C_INFO)
{
	npc		= Mod_744_MIL_Pablo_NW;
	nr		= 1;
	condition	= Info_Mod_Pablo_GiselleFlucht_Condition;
	information	= Info_Mod_Pablo_GiselleFlucht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Giselle verschweigt uns etwas.";
};

FUNC INT Info_Mod_Pablo_GiselleFlucht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Giselle_Jason))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pablo_GiselleFlucht_Info()
{
	AI_Output(hero, self, "Info_Mod_Pablo_GiselleFlucht_15_00"); //Giselle verschweigt uns etwas. Sie hat sich in der Kammer des Besitzers eingesperrt und weigert sich raus zu kommen.
	AI_Output(self, hero, "Info_Mod_Pablo_GiselleFlucht_12_01"); //Immer diese hysterischen Weiber. Als würde sie uns dadurch entkommen. Ich werde Neron anweisen, das Problem zu lösen. Bis dahin kannst du ja noch ein paar Beweise suchen oder was auch immer.

	Wld_InsertNpc	(Mod_7235_NONE_Galf_NW, "NW_CITY_HABOUR_PUFF_NADJA");

	B_LogEntry	(TOPIC_MOD_PAL_RL, "Pablo wird sich darum kümmern, dass Giselle zu vernunft kommt. Ich soll mich derweil noch ein wenig umsehen und nach Beweisen suchen.");
};

INSTANCE Info_Mod_Pablo_GalfKo (C_INFO)
{
	npc		= Mod_744_MIL_Pablo_NW;
	nr		= 1;
	condition	= Info_Mod_Pablo_GalfKo_Condition;
	information	= Info_Mod_Pablo_GalfKo_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pablo_GalfKo_Condition()
{
	if (Mod_PAL_Galf == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pablo_GalfKo_Info()
{
	AI_Output(self, hero, "Info_Mod_Pablo_GalfKo_12_00"); //Ich sagte Beweise suchen und nicht Leute in die Eingangshalle schmeißen! Das nennst du Ermittlungsarbeit? Wer ist dieser Typ überhaupt?
	AI_Output(hero, self, "Info_Mod_Pablo_GalfKo_15_01"); //Sein Name ist Galf. Mehr weiß ich auch nicht.
	AI_Output(self, hero, "Info_Mod_Pablo_GalfKo_12_02"); //Na schön, ich werde mal versuchen ihn aufzuwecken.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Pablo_GalfCall (C_INFO)
{
	npc		= Mod_744_MIL_Pablo_NW;
	nr		= 1;
	condition	= Info_Mod_Pablo_GalfCall_Condition;
	information	= Info_Mod_Pablo_GalfCall_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pablo_GalfCall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pablo_GalfKo))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pablo_GalfCall_Info()
{
	AI_TurnToNpc	(self, Mod_7235_NONE_Galf_NW);

	AI_Output(self, hero, "Info_Mod_Pablo_GalfCall_12_00"); //Galf! Aufwachen!
	
	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_7234_OUT_Giselle_NW, "GALF");
};

INSTANCE Info_Mod_Pablo_GiselleGeknackt (C_INFO)
{
	npc		= Mod_744_MIL_Pablo_NW;
	nr		= 1;
	condition	= Info_Mod_Pablo_GiselleGeknackt_Condition;
	information	= Info_Mod_Pablo_GiselleGeknackt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pablo_GiselleGeknackt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Giselle_Galf))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pablo_GiselleGeknackt_Info()
{
	AI_Output(self, hero, "Info_Mod_Pablo_GiselleGeknackt_12_00"); //Gut gemacht. Berichte nun Lord Andre, was hier vorgefallen ist.
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Pablo_Pickpocket (C_INFO)
{
	npc		= Mod_744_MIL_Pablo_NW;
	nr		= 1;
	condition	= Info_Mod_Pablo_Pickpocket_Condition;
	information	= Info_Mod_Pablo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Pablo_Pickpocket_Condition()
{
	C_Beklauen	(58, ItMi_Gold, 18);
};

FUNC VOID Info_Mod_Pablo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Pablo_Pickpocket);

	Info_AddChoice	(Info_Mod_Pablo_Pickpocket, DIALOG_BACK, Info_Mod_Pablo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Pablo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Pablo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Pablo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Pablo_Pickpocket);
};

FUNC VOID Info_Mod_Pablo_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Pablo_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Pablo_Pickpocket);

		Info_AddChoice	(Info_Mod_Pablo_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Pablo_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Pablo_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Pablo_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Pablo_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Pablo_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Pablo_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Pablo_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Pablo_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Pablo_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Pablo_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Pablo_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Pablo_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Pablo_EXIT (C_INFO)
{
	npc		= Mod_744_MIL_Pablo_NW;
	nr		= 1;
	condition	= Info_Mod_Pablo_EXIT_Condition;
	information	= Info_Mod_Pablo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Pablo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Pablo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};