INSTANCE Info_Mod_Owen_Hi (C_INFO)
{
	npc		= Mod_939_PIR_Owen_AW;
	nr		= 1;
	condition	= Info_Mod_Owen_Hi_Condition;
	information	= Info_Mod_Owen_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Owen_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Owen_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Owen_Hi_13_01"); //Ich bin Owen.
};

INSTANCE Info_Mod_Owen_Auftrag (C_INFO)
{
	npc		= Mod_939_PIR_Owen_AW;
	nr		= 1;
	condition	= Info_Mod_Owen_Auftrag_Condition;
	information	= Info_Mod_Owen_Auftrag_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich dir helfen?";
};

FUNC INT Info_Mod_Owen_Auftrag_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Owen_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Karte))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Owen_Auftrag_Info()
{
	AI_Output(hero, self, "Info_Mod_Owen_Auftrag_15_00"); //Kann ich dir helfen?
	AI_Output(self, hero, "Info_Mod_Owen_Auftrag_13_01"); //Ja, Das kannst du tatsächlich.
	AI_Output(self, hero, "Info_Mod_Owen_Auftrag_13_02"); //Geh zu dem Alchemisten in Khorinis. Er wird dir einen Beutel mit einer Essenz geben.
	AI_Output(self, hero, "Info_Mod_Owen_Auftrag_13_03"); //Das Ganze ist konzentriertes Vitamin C.
	AI_Output(self, hero, "Info_Mod_Owen_Auftrag_13_04"); //Als wir das letzte Mal auf Schatzsuche gingen mussten wir das Ganze absagen, weil die Hälfte der Mannschaft Skorbut hatte!
	AI_Output(hero, self, "Info_Mod_Owen_Auftrag_15_05"); //Gib mir das Geld und ich hol dein Vitamin C.
	AI_Output(self, hero, "Info_Mod_Owen_Auftrag_13_06"); //Hier, 400 Goldstücke.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	AI_Output(self, hero, "Info_Mod_Owen_Auftrag_13_07"); //Wenn er mehr verlangt haut er dich übern Tisch!
	AI_Output(hero, self, "Info_Mod_Owen_Auftrag_15_08"); //Ich werd's mir merken.

	Log_CreateTopic	(TOPIC_MOD_OWEN_SKORBUT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_OWEN_SKORBUT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_OWEN_SKORBUT, "Owen hat mir 400 Goldmünzen gegeben. Dafür soll ich in der Stadt beim Alchemisten einen Beutel Vitamin C kaufen.");
};

INSTANCE Info_Mod_Owen_VitaminC (C_INFO)
{
	npc		= Mod_939_PIR_Owen_AW;
	nr		= 1;
	condition	= Info_Mod_Owen_VitaminC_Condition;
	information	= Info_Mod_Owen_VitaminC_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab den Beutel.";
};

FUNC INT Info_Mod_Owen_VitaminC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Owen_Auftrag))
	&& (Npc_HasItems(hero, ItFo_Addon_VitaminC) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Owen_VitaminC_Info()
{
	AI_Output(hero, self, "Info_Mod_Owen_VitaminC_15_00"); //Ich hab den Beutel.

	B_GiveInvItems	(hero, self, ItFo_Addon_VitaminC, 1);

	AI_Output(self, hero, "Info_Mod_Owen_VitaminC_13_01"); //Damit dürften wir diesmal keine Probleme bekommen. Gut gemacht.

	Mod_PiratenVorbereitungen += 1;

	B_GivePlayerXP	(200);

	B_Göttergefallen(2, 1);

	B_LogEntry	(TOPIC_MOD_OWEN_SKORBUT, "Diese Schatzsuche sollte sicher sein vor einem Skorbut-Befall.");
	B_SetTopicStatus	(TOPIC_MOD_OWEN_SKORBUT, LOG_SUCCESS);
};

INSTANCE Info_Mod_Owen_Befreiung (C_INFO)
{
	npc		= Mod_939_PIR_Owen_AW;
	nr		= 1;
	condition	= Info_Mod_Owen_Befreiung_Condition;
	information	= Info_Mod_Owen_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Owen, steh auf, es ist vorbei!";
};

FUNC INT Info_Mod_Owen_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bill_Befreiung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Owen_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Owen_Befreiung_15_00"); //Owen, steh auf, es ist vorbei!
	AI_Output(self, hero, "Info_Mod_Owen_Befreiung_03_01"); //(stöhnt) Argh, ich danke dir. Mann, ich dachte diese Räuber würden mich noch töten.
	AI_Output(hero, self, "Info_Mod_Owen_Befreiung_15_02"); //Was ist denn passiert?
	AI_Output(self, hero, "Info_Mod_Owen_Befreiung_03_03"); //Als ich auf Wache bei Greg's Hütte war bin ich zu weit zum Massiv gekommen. Auf einmal griffen mich aus der Dunkelheit etliche dieser Banditen an.
	AI_Output(self, hero, "Info_Mod_Owen_Befreiung_03_04"); //Ich konnte zwar einige töten, doch es waren einfach zu viele. Sie schlugen mich nieder und verschleppten mich nach hier oben.
	AI_Output(self, hero, "Info_Mod_Owen_Befreiung_03_05"); //Ich wurde gefoltert. Sie wollten wissen, was Greg als nächstes vorhat. Sie arbeiten anscheinend für diese komische Garde.
	AI_Output(self, hero, "Info_Mod_Owen_Befreiung_03_06"); //Ich dachte, dass ich es nicht mehr schaffe, aber dann bist du aufgetaucht und hast mich gerettet.
	AI_Output(hero, self, "Info_Mod_Owen_Befreiung_15_07"); //Keine Ursache, leider habe ich dir etwas schlimmes zu berichten.
	AI_Output(self, hero, "Info_Mod_Owen_Befreiung_03_08"); //(erschrocken) Was ist passiert?
	AI_Output(hero, self, "Info_Mod_Owen_Befreiung_15_09"); //Alligator Jack. Bill erzählte mir, dass er vor mir aufgebrochen ist, um dich zu suchen.
	AI_Output(hero, self, "Info_Mod_Owen_Befreiung_15_10"); //Leider fiel er den Banditen zum Opfer. Ich fand seine Leiche und mehrere tote Banditen etwas weiter entfernt von hier.
	AI_Output(self, hero, "Info_Mod_Owen_Befreiung_03_11"); //(murmelt) Alligator Jack ... tot ... kann ... nicht ... sein ...
	AI_Output(hero, self, "Info_Mod_Owen_Befreiung_15_12"); //Komm, ich bringe dich zu Bill. Er wird sich um dich kümmern.
	AI_Output(self, hero, "Info_Mod_Owen_Befreiung_03_13"); //Ja. Gehen wird zu Bill.
	AI_Output(hero, self, "Info_Mod_Owen_Befreiung_15_14"); //Folge mir.
	
	B_LogEntry	(TOPIC_MOD_BEL_PIRBILL, "Ich habe Owen gefunden und bringen ihn nun zurück zu Bill.");

	B_GivePlayerXP	(250);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "BILL");
};

INSTANCE Info_Mod_Owen_Beerdigung (C_INFO)
{
	npc		= Mod_939_PIR_Owen_AW;
	nr		= 1;
	condition	= Info_Mod_Owen_Beerdigung_Condition;
	information	= Info_Mod_Owen_Beerdigung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Owen_Beerdigung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_AW_Bshydal))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Owen_Beerdigung_Info()
{
	AI_Output(hero, self, "Info_Mod_Owen_Beerdigung_15_00"); //Hey, da bist du ja wieder. Du hast es tatsächlich geschafft.
	AI_Output(self, hero, "Info_Mod_Owen_Beerdigung_03_01"); //Ja, es war ein Spießrutenlauf, wie ich ihn in meinem Leben noch nie zurücklegen musste.
	AI_Output(self, hero, "Info_Mod_Owen_Beerdigung_03_02"); //Ein magisches Geschoß nach dem nächsten, dem ich ausweichen musste.
	AI_Output(self, hero, "Info_Mod_Owen_Beerdigung_03_03"); //Aber gerade als mir langsam die Puste auszugehen drohte, lösten sich die untoten Bastarde mit einem Knall in Schall und Rauch auf.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Owen_Pickpocket (C_INFO)
{
	npc		= Mod_939_PIR_Owen_AW;
	nr		= 1;
	condition	= Info_Mod_Owen_Pickpocket_Condition;
	information	= Info_Mod_Owen_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Owen_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 140);
};

FUNC VOID Info_Mod_Owen_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Owen_Pickpocket);

	Info_AddChoice	(Info_Mod_Owen_Pickpocket, DIALOG_BACK, Info_Mod_Owen_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Owen_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Owen_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Owen_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Owen_Pickpocket);
};

FUNC VOID Info_Mod_Owen_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Owen_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Owen_Pickpocket);

		Info_AddChoice	(Info_Mod_Owen_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Owen_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Owen_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Owen_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Owen_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Owen_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Owen_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Owen_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Owen_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Owen_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Owen_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Owen_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Owen_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Owen_EXIT (C_INFO)
{
	npc		= Mod_939_PIR_Owen_AW;
	nr		= 1;
	condition	= Info_Mod_Owen_EXIT_Condition;
	information	= Info_Mod_Owen_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Owen_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Owen_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};