INSTANCE Info_Mod_Garvell_Hi (C_INFO)
{
	npc		= Mod_577_NONE_Garvell_NW;
	nr		= 1;
	condition	= Info_Mod_Garvell_Hi_Condition;
	information	= Info_Mod_Garvell_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Garvell_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Garvell_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Garvell_Hi_04_01"); //Ich bin Garvell.
	AI_Output(hero, self, "Info_Mod_Garvell_Hi_15_02"); //Und was machst du hier?
	AI_Output(self, hero, "Info_Mod_Garvell_Hi_04_03"); //Ich baue ein Schiff, damit ich aufs Festland kann sobald der Krieg mit den Orks vorbei ist.
};

INSTANCE Info_Mod_Garvell_Irdorath (C_INFO)
{
	npc		= Mod_577_NONE_Garvell_NW;
	nr		= 1;
	condition	= Info_Mod_Garvell_Irdorath_Condition;
	information	= Info_Mod_Garvell_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich sehe, du verstehst dein Handwerk.";
};

FUNC INT Info_Mod_Garvell_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_JackHW == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garvell_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Garvell_Irdorath_15_00"); //Ich sehe, du verstehst dein Handwerk.
	AI_Output(hero, self, "Info_Mod_Garvell_Irdorath_15_01"); //Was würdest du davon halten, eine Seereise auf dem Schiff der Paladine zu unternehmen ...?
	AI_Output(self, hero, "Info_Mod_Garvell_Irdorath_04_02"); //Was?! Wieso sollte ich das machen?
	AI_Output(self, hero, "Info_Mod_Garvell_Irdorath_04_03"); //Ich habe hier noch mehr als genug zu tun an meinem eigenen Schiff ...

	Info_ClearChoices	(Info_Mod_Garvell_Irdorath);

	Info_AddChoice	(Info_Mod_Garvell_Irdorath, "Du könntest bestimmt viel durch das Schiff der Paladine über den Bootsbau lernen.", Info_Mod_Garvell_Irdorath_B);
	Info_AddChoice	(Info_Mod_Garvell_Irdorath, "Khorinis befindet sich in großer Gefahr und wenn wir die Seereise zu dieser Insel unternehmen (...)", Info_Mod_Garvell_Irdorath_A);
};

FUNC VOID Info_Mod_Garvell_Irdorath_B()
{
	AI_Output(hero, self, "Info_Mod_Garvell_Irdorath_B_15_00"); //Du könntest bestimmt viel durch das Schiff der Paladine über den Bootsbau lernen.
	AI_Output(hero, self, "Info_Mod_Garvell_Irdorath_B_15_01"); //Das wäre doch eine Gelegenheit ...
	AI_Output(self, hero, "Info_Mod_Garvell_Irdorath_B_04_02"); //Was soll dieser Unsinn? Glaubst du vielleicht, ich hätte noch nie ein Schiff von innen gesehen?
	AI_Output(self, hero, "Info_Mod_Garvell_Irdorath_B_04_03"); //Mit so einem Angebot könntest du vielleicht einen Knaben beeindrucken ... also wirklich ...
	AI_Output(self, hero, "Info_Mod_Garvell_Irdorath_B_04_04"); //Und jetzt stör mich nicht weiter bei der Arbeit.

	Info_ClearChoices	(Info_Mod_Garvell_Irdorath);

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Tja, das mit Bootsbauer Garvell wird wohl nichts.");
};

FUNC VOID Info_Mod_Garvell_Irdorath_A()
{
	AI_Output(hero, self, "Info_Mod_Garvell_Irdorath_A_15_00"); //Khorinis befindet sich in großer Gefahr, und wenn wir die Seereise zu dieser Insel unternehmen, könnten wir das drohende Unheil abwenden.
	AI_Output(self, hero, "Info_Mod_Garvell_Irdorath_A_04_01"); //Was, drohendes Unheil?
	AI_Output(self, hero, "Info_Mod_Garvell_Irdorath_A_04_02"); //Dann sollte ich mich umso mehr mit dem Bau meines Schiffes beeilen, um rechtzeitig fertig zu werden ...

	Info_ClearChoices	(Info_Mod_Garvell_Irdorath);

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Tja, das mit Bootsbauer Garvell wird wohl nichts.");
};

INSTANCE Info_Mod_Garvell_Paddel (C_INFO)
{
	npc		= Mod_577_NONE_Garvell_NW;
	nr		= 1;
	condition	= Info_Mod_Garvell_Paddel_Condition;
	information	= Info_Mod_Garvell_Paddel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du verkaufst Paddel?";
};

FUNC INT Info_Mod_Garvell_Paddel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garvell_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 200)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garvell_Paddel_Info()
{
	AI_Output(hero, self, "Info_Mod_Garvell_Paddel_15_00"); //Du verkaufst Paddel?
	AI_Output(self, hero, "Info_Mod_Garvell_Paddel_04_01"); //Wohl wahr. Beste Qualität. Aus Zedernholz vom Festland. Extra großes exklusives Blatt. Und besonders leicht dazu.
	AI_Output(hero, self, "Info_Mod_Garvell_Paddel_15_02"); //Schon gut. Gib mir halt zwei Paddel.
	AI_Output(self, hero, "Info_Mod_Garvell_Paddel_04_03"); //Hier. 200 Gold das Stück.

	B_GiveInvItems	(self, hero, ItMi_Paddel, 2);

	AI_Output(hero, self, "Info_Mod_Garvell_Paddel_15_04"); //Was? Da kann ich mir ja welche aus Goldtellern machen. Mit Silberleuchter als Griff. Hier, 100.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Garvell_Paddel_04_05"); //Bist du von Sinnen? Das ist erstklassige Ware. Aber ich will nicht streiten. 300 für beide.
	AI_Output(hero, self, "Info_Mod_Garvell_Paddel_15_06"); //Farim sagt, dass er sie auch für 100 Gold von dir bekommt ...
	AI_Output(self, hero, "Info_Mod_Garvell_Paddel_04_07"); //Das war auch Ausschussware. Bestimmt sind die bald hinüber.
	AI_Output(hero, self, "Info_Mod_Garvell_Paddel_15_08"); //Das stimmt allerdings. Hier sind nochmal 100 Gold. Mehr hab ich nicht.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	AI_Output(hero, self, "Info_Mod_Garvell_Paddel_15_09"); //Sonst kannst du mit den Dingern Suppe löffeln.
	AI_Output(self, hero, "Info_Mod_Garvell_Paddel_04_10"); //Du treibst mich in den Ruin. Hier die Paddel. Und komm ja nicht wieder.
	AI_Output(hero, self, "Info_Mod_Garvell_Paddel_15_11"); //Keine Angst.

	B_LogEntry	(TOPIC_MOD_SKIP_PADDEL, "Ich habe zwei Paddel. Hat mich ganze 200 Goldstücke gekostet.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Garvell_Fenia (C_INFO)
{
	npc		= Mod_577_NONE_Garvell_NW;
	nr		= 1;
	condition	= Info_Mod_Garvell_Fenia_Condition;
	information	= Info_Mod_Garvell_Fenia_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Garvell_Fenia_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garvell_Hi))
	&& (hero.attribute[ATR_MANA_MAX] >= 200)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garvell_Fenia_Info()
{
	AI_Output(self, hero, "Info_Mod_Garvell_Fenia_04_00"); //Hey, du. Du kannst mit Magie umgehen, richtig?

	Info_ClearChoices	(Info_Mod_Garvell_Fenia);

	Info_AddChoice	(Info_Mod_Garvell_Fenia, "Da siehst du wohl was falsch.", Info_Mod_Garvell_Fenia_B);
	Info_AddChoice	(Info_Mod_Garvell_Fenia, "Aber sicher doch.", Info_Mod_Garvell_Fenia_A);
};

FUNC VOID Info_Mod_Garvell_Fenia_B()
{
	AI_Output(hero, self, "Info_Mod_Garvell_Fenia_B_15_00"); //Da siehst du wohl was falsch.
	AI_Output(self, hero, "Info_Mod_Garvell_Fenia_B_04_01"); //In Ordnung, schönen Tag noch.

	Info_ClearChoices	(Info_Mod_Garvell_Fenia);
};

FUNC VOID Info_Mod_Garvell_Fenia_A()
{
	AI_Output(hero, self, "Info_Mod_Garvell_Fenia_A_15_00"); //Aber sicher doch.
	AI_Output(self, hero, "Info_Mod_Garvell_Fenia_A_04_01"); //In dem Fall hätte ich nämlich eine kleine Bitte an dich.
	AI_Output(self, hero, "Info_Mod_Garvell_Fenia_A_04_02"); //Ich hab hier diese Telekinese-Spruchrolle ... erworben.
	AI_Output(self, hero, "Info_Mod_Garvell_Fenia_A_04_03"); //Könntest du Fenia in einem unbeobachteten Moment damit ihren (hüstelt) Büstenhalter nehmen?
	AI_Output(self, hero, "Info_Mod_Garvell_Fenia_A_04_04"); //Sie wird auch garantiert nichts merken ...

	Info_ClearChoices	(Info_Mod_Garvell_Fenia);

	Info_AddChoice	(Info_Mod_Garvell_Fenia, "Ähm... nein.", Info_Mod_Garvell_Fenia_D);
	Info_AddChoice	(Info_Mod_Garvell_Fenia, "Das wird ein Spaß!", Info_Mod_Garvell_Fenia_C);
};

FUNC VOID Info_Mod_Garvell_Fenia_D()
{
	AI_Output(hero, self, "Info_Mod_Garvell_Fenia_D_15_00"); //Ähm... nein.
	AI_Output(self, hero, "Info_Mod_Garvell_Fenia_D_04_01"); //Oh, wie schade. Dann muss ich ein anderes Opfer finden.

	B_GivePlayerXP	(50);

	Info_ClearChoices	(Info_Mod_Garvell_Fenia);
};

FUNC VOID Info_Mod_Garvell_Fenia_C()
{
	AI_Output(hero, self, "Info_Mod_Garvell_Fenia_C_15_00"); //Das wird ein Spaß!
	AI_Output(self, hero, "Info_Mod_Garvell_Fenia_C_04_01"); //Hier hast du die Spruchrolle. Viel Erfolg!

	B_GiveInvItems	(self, hero, ItSc_Telekinese, 1);

	Log_CreateTopic	(TOPIC_MOD_GARVELL_FENIA, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GARVELL_FENIA, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GARVELL_FENIA, "Ich soll Fenia, der Händlerin, im Auftrag eines Bürgers den Büstenhalter mit Hilfe eines Telekinese-Spruches stehlen. Wie infantil!");

	Mod_Garvell_Fenia = 1;

	Info_ClearChoices	(Info_Mod_Garvell_Fenia);
};

INSTANCE Info_Mod_Garvell_Fenia2 (C_INFO)
{
	npc		= Mod_577_NONE_Garvell_NW;
	nr		= 1;
	condition	= Info_Mod_Garvell_Fenia2_Condition;
	information	= Info_Mod_Garvell_Fenia2_Info;
	permanent	= 0;
	important	= 0;
	description	= "So, was sollte das jetzt?!";
};

FUNC INT Info_Mod_Garvell_Fenia2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fenia_BH))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garvell_Fenia2_Info()
{
	AI_Output(hero, self, "Info_Mod_Garvell_Fenia2_15_00"); //So, was sollte das jetzt?!
	AI_Output(self, hero, "Info_Mod_Garvell_Fenia2_04_01"); //(lacht ausgiebig) Herrlich, herrlich!
	AI_Output(hero, self, "Info_Mod_Garvell_Fenia2_15_02"); //Du hast mich also einfach nur verarscht?
	AI_Output(self, hero, "Info_Mod_Garvell_Fenia2_04_03"); //So ist es. Ein Mordsspaß, sag ich dir. (lacht)
	AI_Output(hero, self, "Info_Mod_Garvell_Fenia2_15_04"); //Na, ich hab ja die Spruchrolle. Mal sehen, was bei dir zu holen ist.
	AI_Output(self, hero, "Info_Mod_Garvell_Fenia2_04_05"); //Wa...?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Garvell_Fenia3 (C_INFO)
{
	npc		= Mod_577_NONE_Garvell_NW;
	nr		= 1;
	condition	= Info_Mod_Garvell_Fenia3_Condition;
	information	= Info_Mod_Garvell_Fenia3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Garvell_Fenia3_Condition()
{
	if (Mod_Garvell_Fenia == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garvell_Fenia3_Info()
{
	AI_Output(self, hero, "Info_Mod_Garvell_Fenia3_04_00"); //Gib mir sofort mein Gold zurück!
	AI_Output(hero, self, "Info_Mod_Garvell_Fenia3_15_01"); //Das ist die Bezahlung für meinen Arbeitsaufwand. Nichts für ungut, aber ich muss jetzt weiter.

	B_SetTopicStatus	(TOPIC_MOD_GARVELL_FENIA, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Garvell_Flugblaetter (C_INFO)
{
	npc		= Mod_577_NONE_Garvell_NW;
	nr		= 1;
	condition	= Info_Mod_Garvell_Flugblaetter_Condition;
	information	= Info_Mod_Garvell_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Garvell_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Garvell_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garvell_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Garvell_Flugblaetter_04_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Garvell_Flugblaetter_04_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Garvell_Pickpocket (C_INFO)
{
	npc		= Mod_577_NONE_Garvell_NW;
	nr		= 1;
	condition	= Info_Mod_Garvell_Pickpocket_Condition;
	information	= Info_Mod_Garvell_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_40;
};

FUNC INT Info_Mod_Garvell_Pickpocket_Condition()
{
	C_Beklauen	(38, ItMi_Gold, 90);
};

FUNC VOID Info_Mod_Garvell_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Garvell_Pickpocket);

	Info_AddChoice	(Info_Mod_Garvell_Pickpocket, DIALOG_BACK, Info_Mod_Garvell_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Garvell_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Garvell_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Garvell_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Garvell_Pickpocket);
};

FUNC VOID Info_Mod_Garvell_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Garvell_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Garvell_Pickpocket);

		Info_AddChoice	(Info_Mod_Garvell_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Garvell_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Garvell_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Garvell_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Garvell_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Garvell_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Garvell_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Garvell_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Garvell_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Garvell_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Garvell_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Garvell_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Garvell_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Garvell_EXIT (C_INFO)
{
	npc		= Mod_577_NONE_Garvell_NW;
	nr		= 1;
	condition	= Info_Mod_Garvell_EXIT_Condition;
	information	= Info_Mod_Garvell_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Garvell_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Garvell_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};