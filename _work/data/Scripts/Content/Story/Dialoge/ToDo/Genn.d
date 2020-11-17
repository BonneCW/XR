INSTANCE Info_Mod_Genn_Hi (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Hi_Condition;
	information	= Info_Mod_Genn_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Genn_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_00"); //Du kommst gerade richtig.

	if (Mod_Struk_Dabei == TRUE)
	&& (Mod_Thorge_Dabei == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Hi_09_01"); //Du bist in Begleitung zweier Freunde.
	}
	else if (Mod_Struk_Dabei == TRUE)
	|| (Mod_Thorge_Dabei == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Hi_09_02"); //Du bist in Begleitung eines Freundes.
	};

	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_03"); //Wer bist du?
	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_04"); //Ich will bei euch Verwandlungsmagiern mitmachen.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_05"); //Dann hast du dir hierbei schon einen Pluspunkt eingehandelt. Wenn du willst, erzähle ich dir ein paar Takte über unser kleines Problem hier im Tal.
	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_06"); //Deswegen bin ich hier.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_07"); //Das ist gut. Sieh dich mal hier um. Die Goblins zerstören unser geliebtes Tal. Wir wissen nicht genau, woher sie kommen, aber wir haben eine Vermutung.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_08"); //Vor ein paar Tagen gab es ein Erdbeben, bei dem der Eingang eines gewaltigen Höhlensystems freigelegt worden ist.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_09"); //Wir vermuten, dass die Höhlen verschüttet worden sind und die Goblins als Fluchtweg unser Tal genommen haben.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_10"); //Doch die Matronen hören nicht auf, neue Würfe zu bekommen, und so haben wir hier keine Ruhe vor ihnen.
	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_11"); //Was soll ich tun?
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_12"); //Es ist ab Besten, wenn du die Matronen tötest. Mit dem Rest werden wir schon fertig.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_13"); //Du darfst natürlich auch jeden Goblin, der dir über den Weg läuft, umbringen.
	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_14"); //Dann mache ich mich mal sofort auf den Weg.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_15"); //Bevor du losgehst, nimm das hier, es wird dir helfen.

	B_GiveInvItems	(self, hero, ItSc_TrfSnapper, 2);

	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_16"); //Aber verwende sie nicht in der Gegenwart von Menschen, sie könnten dich sonst für ein Monster halten.

	if (Mod_Struk_Dabei == TRUE)
	&& (Mod_Thorge_Dabei == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Hi_15_17"); //Und was ist mit meinen Begleitern?
		AI_Output(self, hero, "Info_Mod_Genn_Hi_09_18"); //Sie werden dich nur bis zum Dorf begleiten, den Rest musst du alleine bewältigen.
	}
	else if (Mod_Struk_Dabei == TRUE)
	|| (Mod_Thorge_Dabei == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Hi_15_19"); //Und was ist mit meinem Begleiter?
		AI_Output(self, hero, "Info_Mod_Genn_Hi_09_20"); //Er wird dich nur bis zum Dorf begleiten, den Rest musst du alleine bewältigen.
	};

	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_21"); //Verstehe. Dann mache ich mich am besten gleich auf den Weg.

	B_LogEntry	(TOPIC_MOD_FERCO_GOBLIN, "Ich soll die Goblin-Matronen töten, damit sie keinen Nachwuchs mehr bekommen können.");
};

INSTANCE Info_Mod_Genn_Matronen (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Matronen_Condition;
	information	= Info_Mod_Genn_Matronen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Matronen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lorforn_Hi))
	&& (TUG_Lorforn == TRUE)
	&& (Npc_IsDead(Gobbo_Matrone))
	&& (((Npc_IsDead(Mod_1962_OUT_Lorforn_TUG))
	&& (Npc_HasItems(hero, ItWr_LorfornsBrief) == 1))
	|| (!Npc_IsDead(Mod_1962_OUT_Lorforn_TUG)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Matronen_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Matronen_09_00"); //Sind die Matronen tot?
	AI_Output(hero, self, "Info_Mod_Genn_Matronen_15_01"); //Ja, ich habe sie getötet. Außerdem kenne ich den Schuldigen, der für das Erdbeben verantwortlich ist.
	AI_Output(self, hero, "Info_Mod_Genn_Matronen_09_02"); //Wer ist es?

	Info_ClearChoices	(Info_Mod_Genn_Matronen);

	if (Npc_IsDead(Mod_1962_OUT_Lorforn_TUG))
	&& (Npc_HasItems(hero, ItWr_LorfornsBrief) == 1)
	{
		Info_AddChoice	(Info_Mod_Genn_Matronen, "Da war so ein Typ namens Lorforn ...", Info_Mod_Genn_Matronen_B);
	}
	else
	{
		Info_AddChoice	(Info_Mod_Genn_Matronen, "Da war so ein Typ mit Lederklamotten ...", Info_Mod_Genn_Matronen_A);
	};
};

FUNC VOID Info_Mod_Genn_Matronen_C()
{
	AI_Output(hero, self, "Info_Mod_Genn_Matronen_C_15_00"); //Danke. Wir sehen uns.
	AI_Output(self, hero, "Info_Mod_Genn_Matronen_C_09_01"); //Bestimmt. Ich wünsche dir alles Gute. Der Teleporter ist noch aktiviert. Wenn du dich beeilst, schaffst du es noch hinüber ins Minental.

	if (Mod_Struk_Dabei == TRUE)
	&& (Mod_Thorge_Dabei == TRUE)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorge_TUG_AtDorf))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Struk_TUG_AtDorf))
	{
		AI_Output(self, hero, "Info_Mod_Genn_Matronen_C_09_02"); //Deine zwei Begleiter werden allerdings hier bleiben müssen.

		B_StartOtherRoutine	(Mod_1961_VMK_Struk_TUG, "ATCITY");
		B_StartOtherRoutine	(Mod_1960_VMG_Thorge_TUG, "ATCITY");

		Struk_Abgeliefert = 1;
		Thorge_Abgeliefert = 1;

		Mod_1961_VMK_Struk_TUG.aivar[AIV_Partymember] = FALSE;
		Mod_1960_VMG_Thorge_TUG.aivar[AIV_Partymember] = FALSE;
	}
	else if ((Mod_Struk_Dabei == TRUE)
	|| (Mod_Thorge_Dabei == TRUE))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorge_TUG_AtDorf))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Struk_TUG_AtDorf))
	{
		AI_Output(self, hero, "Info_Mod_Genn_Matronen_C_09_03"); //Dein Begleiter muss allerdings hier bleiben.

		B_StartOtherRoutine	(Mod_1961_VMK_Struk_TUG, "ATCITY");
		B_StartOtherRoutine	(Mod_1960_VMG_Thorge_TUG, "ATCITY");

		Struk_Abgeliefert = 1;
		Thorge_Abgeliefert = 1;

		Mod_1961_VMK_Struk_TUG.aivar[AIV_Partymember] = FALSE;
		Mod_1960_VMG_Thorge_TUG.aivar[AIV_Partymember] = FALSE;
	};

	B_StartOtherRoutine	(Mod_7355_VMG_Asko_TUG, "STUDIEREN");
};

FUNC VOID Info_Mod_Genn_Matronen_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Matronen_B_15_00"); //Da war so ein Typ namens Lorforn, der von einem 'P.' geschickt wurde, um das Beben auszulösen. Hier ist der Beweisbrief.

	B_GiveInvItems	(hero, self, ItWr_LorfornsBrief, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Genn_Matronen_B_09_01"); //Vielen Dank für diesen Brief. Wir bleiben an der Sache dran. Hier hast du eine Entlohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_FERCO_GOBLIN, "Ich habe Genn die Situation geschildert und eine Entlohnung bekommen. Ich sollte mich nun auf den Rückweg ins Minental machen.");

	Info_ClearChoices	(Info_Mod_Genn_Matronen);

	Info_Mod_Genn_Matronen_C();
};

FUNC VOID Info_Mod_Genn_Matronen_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Matronen_A_15_00"); //Da war so ein Typ mit Lederklamotten, der meinte, er wäre geschickt worden, um dies zu tun. Ich habe ihn laufen lassen.
	AI_Output(self, hero, "Info_Mod_Genn_Matronen_A_09_01"); //Danke für die Information. Wir bleiben an der Sache dran. Hier hast du eine Entlohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_FERCO_GOBLIN, "Ich habe Genn die Situation geschildert und eine Entlohnung bekommen. Ich sollte mich nun auf den Rückweg ins Minental machen.");

	Info_ClearChoices	(Info_Mod_Genn_Matronen);

	Info_Mod_Genn_Matronen_C();
};

INSTANCE Info_Mod_Genn_Faice (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Faice_Condition;
	information	= Info_Mod_Genn_Faice_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Faice_Condition()
{
	if (Mod_VMG_FaiceGifty_Gift == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Faice_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Faice_09_00"); //Das ist ja mal ein Zufall, wir haben gerade über dich gesprochen.

	Info_ClearChoices	(Info_Mod_Genn_Faice);

	Info_AddChoice	(Info_Mod_Genn_Faice, "Wer ist das?", Info_Mod_Genn_Faice_B);
	Info_AddChoice	(Info_Mod_Genn_Faice, "Worum ging es denn?", Info_Mod_Genn_Faice_A);
};

FUNC VOID Info_Mod_Genn_Faice_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Faice_B_15_00"); //Wer ist das?
	AI_Output(self, hero, "Info_Mod_Genn_Faice_B_09_01"); //Das ist Sören. Er kommt von weit her, um uns beim Wiederaufbau unserer Siedlung zu helfen.
	AI_Output(hero, self, "Info_Mod_Genn_Faice_B_15_02"); //Das freut mich, Sören. Ich bin ...
	AI_Output(self, hero, "Info_Mod_Genn_Faice_B_09_03"); //Das ist Sören. Er kommt von weit her, um uns beim Wiederaufbau unserer Siedlung zu helfen.

	Info_ClearChoices	(Info_Mod_Genn_Faice);

	AI_StopProcessInfos	(self);

	Mod_VMG_FaiceGifty_Gift = 4;
};

FUNC VOID Info_Mod_Genn_Faice_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Faice_A_15_00"); //Worum ging es denn?
	AI_Output(self, hero, "Info_Mod_Genn_Faice_A_09_01"); //Es ging um den Erdrutsch vor der Goblinplage, falls du dich erinnerst.
	AI_Output(hero, self, "Info_Mod_Genn_Faice_A_15_02"); //Ja, wie könnte ich das vergessen?
	AI_Output(self, hero, "Info_Mod_Genn_Faice_A_09_03"); //Warum bist du hier?

	Info_ClearChoices	(Info_Mod_Genn_Faice);

	Mod_VMG_FaiceGifty_Gift = 5;
};

INSTANCE Info_Mod_Genn_Mendulus (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Mendulus_Condition;
	information	= Info_Mod_Genn_Mendulus_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich suche eine große Heilpflanze mit lila Streben. Hast du sie gesehen?";
};

FUNC INT Info_Mod_Genn_Mendulus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Faice))
	&& (Mod_VMG_FaiceGifty_Gift == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Mendulus_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_15_00"); //Ich suche eine große Heilpflanze mit lila Streben. Hast du sie gesehen?
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_09_01"); //Natürlich kenne ich das Mendulus-Kraut. Erinnerst du dich an die Höhle mit den Matronen? Da in der Gegend wächst es, wenn ich mich nicht irre.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_09_02"); //Wenn du schon dort bist, kannst du mir gleich eine mitbringen.

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Die Pflanze heißt 'Mendulus-Kraut' und wächst in der Nähe des Höhleneingangs, bei dem sich die Goblinmatronen befanden.");

	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_01");
	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_02");
	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_03");
	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_04");
	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_05");

	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	Info_AddChoice	(Info_Mod_Genn_Mendulus, "Ich spiele doch nicht den Laufburschen für dich.", Info_Mod_Genn_Mendulus_B);
	Info_AddChoice	(Info_Mod_Genn_Mendulus, "Alles klar. Wir sehen uns.", Info_Mod_Genn_Mendulus_A);
};

FUNC VOID Info_Mod_Genn_Mendulus_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_B_15_00"); //Ich spiele doch nicht den Laufburschen für dich.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_B_09_01"); //Komm schon, wenn du sowieso auf dem Weg bist ...
	
	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	AI_StopProcessInfos	(self);

	Info_AddChoice	(Info_Mod_Genn_Mendulus, "Nein, vergiss es.", Info_Mod_Genn_Mendulus_D);
	Info_AddChoice	(Info_Mod_Genn_Mendulus, "Okay.", Info_Mod_Genn_Mendulus_C);
};

FUNC VOID Info_Mod_Genn_Mendulus_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_A_15_00"); //Alles klar. Wir sehen uns.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_C_09_01"); //Viel Glück.

	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	Mod_VMG_FaiceGifty_Gift = 6;
};

FUNC VOID Info_Mod_Genn_Mendulus_D()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_D_15_00"); //Nein, vergiss es.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_D_09_01"); //Du hast dich verändert. Leider.

	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	Mod_VMG_FaiceGifty_Gift = 6;
};

FUNC VOID Info_Mod_Genn_Mendulus_C()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_C_15_00"); //Okay.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_C_09_01"); //Viel Glück.

	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	Mod_VMG_FaiceGifty_Gift = 6;
};

INSTANCE Info_Mod_Genn_Soeren (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Soeren_Condition;
	information	= Info_Mod_Genn_Soeren_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Soeren_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Soeren_Mendulus))
	&& (Mod_VMG_FaiceGifty_Gift == 8)
	&& (Npc_HasItems(hero, ItWr_SoerensPBrief) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Soeren_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_09_00"); //Hast du Sören gesehen? Er ist so plötzlich verschwunden.
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_15_01"); //Allerdings. Hier, lies das.

	B_GiveInvItems	(hero, self, ItWr_SoerensPBrief, 1);

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_Genn_Soeren_09_02"); //Aber ... das ist ja schrecklich! Wie konnte ich nur auf ihn hereinfallen? Und schon wieder dieser P.

	B_StartOtherRoutine	(self, "START");
	
	Info_ClearChoices	(Info_Mod_Genn_Soeren);

	Info_AddChoice	(Info_Mod_Genn_Soeren, "Wie sieht es mit einer Belohnung aus?", Info_Mod_Genn_Soeren_B);
	Info_AddChoice	(Info_Mod_Genn_Soeren, "Was wirst du nun tun?", Info_Mod_Genn_Soeren_A);
};

FUNC VOID Info_Mod_Genn_Soeren_E()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_E_15_00"); //Ich werde dann ins Minental zurückkehren, wenn es dir nichts ausmacht.
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_E_09_01"); //Nein, der Teleporter ist noch aktiv.

	if (Mod_VMG_FaiceGifty_Gift == 8)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Soeren_E_09_02"); //Ach ja, ehe ich es vergesse: Hier ist deine Entlohnung. Du hast uns einen großen Dienst erwiesen.

		B_GiveInvItems	(self, hero, ItMi_Gold, 500);

		B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Ich habe mit Genn gesprochen und meine Entlohnung erhalten. Ich sollte jetzt ins Minental zurückkehren, solange der Teleporter noch aktiv ist.");

		Mod_VMG_FaiceGifty_Gift = 9;
	};
	
	Info_ClearChoices	(Info_Mod_Genn_Soeren);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Genn_Soeren_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_B_15_00"); //Wie sieht es mit einer Belohnung aus?
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_B_09_01"); //Natürlich, hier. Nimm dieses Gold als Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	Mod_VMG_FaiceGifty_Gift = 9;

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Ich habe mit Genn gesprochen und meine Entlohnung erhalten. Ich sollte jetzt ins Minental zurückkehren, solange der Teleporter noch aktiv ist.");
	
	Info_ClearChoices	(Info_Mod_Genn_Soeren);

	Info_AddChoice	(Info_Mod_Genn_Soeren, "Wie, das ist alles?", Info_Mod_Genn_Soeren_D);
	Info_AddChoice	(Info_Mod_Genn_Soeren, "Danke. Was wirst du nun tun?", Info_Mod_Genn_Soeren_C);
};

FUNC VOID Info_Mod_Genn_Soeren_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_A_15_00"); //Was wirst du nun tun?
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_A_09_01"); //Ich werde Nachforschungen anstellen. Wir müssen herausfinden, wer dieser P. ist.

	if (Mod_VMG_FaiceGifty_Gift == 8)
	{
		Info_ClearChoices	(Info_Mod_Genn_Soeren);

		Info_AddChoice	(Info_Mod_Genn_Soeren, "Wie sieht es mit einer Belohnung aus?", Info_Mod_Genn_Soeren_B);
		Info_AddChoice	(Info_Mod_Genn_Soeren, "Ich werde dann ins Minental zurückkehren, wenn es dir nichts ausmacht.", Info_Mod_Genn_Soeren_E);
	}
	else
	{
		Info_Mod_Genn_Soeren_E();
	};
};

FUNC VOID Info_Mod_Genn_Soeren_D()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_D_15_00"); //Wie, das ist alles?
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_D_09_01"); //Sei damit zufrieden. Und jetzt verschwinde, der Teleporter ist noch aktiv.

	Info_ClearChoices	(Info_Mod_Genn_Soeren);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Genn_Soeren_C()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_C_15_00"); //Danke.

	Info_Mod_Genn_Soeren_A();
};

INSTANCE Info_Mod_Genn_Gift (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Gift_Condition;
	information	= Info_Mod_Genn_Gift_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Gift_Condition()
{
	if (Mod_Turendil_Faice_Day == 1)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Gift_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Gift_09_00"); //Sei mir gegrüßt. Kann ich dir helfen? Nach allem, was du für uns getan hast, wäre es mir eine Ehre, dir zu helfen.
		
	Info_ClearChoices	(Info_Mod_Genn_Gift);

	Info_AddChoice	(Info_Mod_Genn_Gift, "Ich finde mich schon zurecht.", Info_Mod_Genn_Gift_B);
	Info_AddChoice	(Info_Mod_Genn_Gift, "Ich suche nach dem Gift, mit dem Faice vergiftet worden ist.", Info_Mod_Genn_Gift_A);
};

FUNC VOID Info_Mod_Genn_Gift_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Gift_B_15_00"); //Ich finde mich schon zurecht.
	AI_Output(self, hero, "Info_Mod_Genn_Gift_B_09_01"); //Wie du meinst.

	Info_ClearChoices	(Info_Mod_Genn_Gift);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Genn_Gift_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Gift_A_15_00"); //Ich suche nach dem Gift, mit dem Faice vergiftet worden ist, falls du davon gehört hast.

	if (Mod_VMG_FaiceGifty_Gift == 13)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Gift_A_15_01"); //Der Übeltäter soll sich hier in Tugettso aufhalten und ein Verwandlungsmagier oder Krieger sein.
		AI_Output(self, hero, "Info_Mod_Genn_Gift_A_09_02"); //Was? Wie ist das möglich? Ich kenne fast alle Mitglieder persönlich.
	};

	AI_Output(self, hero, "Info_Mod_Genn_Gift_A_09_03"); //Über das Gift kann ich nur Vermutungen anstellen. Wir haben hier einige wenige giftige Gewächse.
	AI_Output(self, hero, "Info_Mod_Genn_Gift_A_09_04"); //Am Besten ist es, wenn du mir von jedem Exemplar eines bringst. Hier hast du eine Liste.

	B_GiveInvItems	(self, hero, ItWr_GennGiftListe, 1);

	Wld_InsertItem	(ItPl_Mushroom_04, "FP_ITEM_FUNGO_01");
	Wld_InsertItem	(ItPl_Mushroom_04, "FP_ITEM_FUNGO_02");
	Wld_InsertItem	(ItPl_Mushroom_04, "FP_ITEM_FUNGO_03");
	Wld_InsertItem	(ItPl_Ponzola, "FP_ITEM_PONZOLA_01");
	Wld_InsertItem	(ItPl_Ponzola, "FP_ITEM_PONZOLA_02");
	Wld_InsertItem	(ItPl_Ponzola, "FP_ITEM_PONZOLA_03");
	Wld_InsertItem	(ItPl_VENENA, "FP_ITEM_VENENA_01");
	Wld_InsertItem	(ItPl_VENENA, "FP_ITEM_VENENA_02");
	Wld_InsertItem	(ItPl_VENENA, "FP_ITEM_VENENA_03");
	Wld_InsertItem	(ItPl_Mithrida, "FP_ITEM_MITHRIDA_01");
	Wld_InsertItem	(ItPl_Mithrida, "FP_ITEM_MITHRIDA_02");
	Wld_InsertItem	(ItPl_Mithrida, "FP_ITEM_MITHRIDA_03");
	Wld_InsertItem	(ItPl_Piante, "FP_ITEM_PIANTE_01");
	Wld_InsertItem	(ItPl_Piante, "FP_ITEM_PIANTE_02");
	Wld_InsertItem	(ItPl_Piante, "FP_ITEM_PIANTE_03");

	B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Ich habe von Genn eine Liste aller giftigen Pflanzen erhalten, die in Tugettso zu finden sind. Ich soll ihm ein Exemplar jeder Art besorgen.");

	Mod_Turendil_Faice_Day = 2;

	Info_ClearChoices	(Info_Mod_Genn_Gift);
};

INSTANCE Info_Mod_Genn_Trador (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Trador_Condition;
	information	= Info_Mod_Genn_Trador_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Trador_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trador_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Trador_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_00"); //Was ist passiert? Du siehst nicht gut aus.
	AI_Output(hero, self, "Info_Mod_Genn_Trador_15_01"); //Ich wurde von Golems angegriffen, als ich die Pflanzen eingesammelt hatte.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_02"); //Danach hat mir so ein Spinner namens Trador die Pflanzen abgenommen.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_03"); //Danach hat mich so ein Spinner namens Trador angesprochen und wollte die Pflanzen haben.
	};

	AI_Output(hero, self, "Info_Mod_Genn_Trador_15_04"); //Er meinte, er wäre ein hohes Mitglied bei den Verwandlungsmagiern.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Trador_09_05"); //Das ist ja furchtbar!
	};

	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_06"); //Ich kenne kein Mitglied dieses Namens, aber wenn er eine unserer Roben anhatte, muss er jemanden von uns umgebracht haben.
	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_07"); //Wir geben nämlich nur ausgewählten Mitgliedern so eine Robe.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Trador_09_08"); //Ach, und weiterhin muss ich dich bitten, die Pflanzen nochmal einzusammeln, da ich sie immer noch benötige.
	};

	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_09"); //Hat dieser Trador denn verraten, warum er das gemacht hat?

	if (Mod_VMG_FaiceGifty_Gift == 13)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_10"); //Dadurch, dass ich Furt ausgeliefert habe, ist Trador auf mich aufmerksam geworden.
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_11"); //Er und Furt haben gemeinsame Sache gemacht.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_12"); //Nachdem ich Furt habe laufen lassen, ist er zu Trador gegangen und hat ihm von mir erzählt.
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_13"); //Sie haben gemeinsame Sache gemacht.
	};

	AI_Output(hero, self, "Info_Mod_Genn_Trador_15_14"); //Warum sie Faice vergiften wollten, hat er mir allerdings nicht verraten.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_15"); //Ich mache mich sofort auf den Weg und sammle die Pflanzen erneut.
	};

	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_16"); //Ich schlage vor, wir gehen folgendermaßen vor:
	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_17"); //Du gehst ins Dorf und versuchst herauszufinden, wer verschwunden ist, damit wir wissen, von wem dieser Trador die Robe und vielleicht sogar noch etwas Wissen über uns hat.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Trador_09_18"); //Bring mir aber vorher doch bitte die Pflanzen.
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_19"); //Ich werde dir die Pflanzen bringen und danach herausfinden, welcher Magier umgebracht worden ist.

		B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Ich muss Genn wohl oder übel noch einmal ein Exemplar jeder giftigen Pflanze besorgen, damit er seine Untersuchungen fortsetzen kann.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Genn_Trador_09_20"); //Gibst du mir bitte die Pflanzen? Ich werde sie solange untersuchen.
	};
};

INSTANCE Info_Mod_Genn_Giftpflanzen (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Giftpflanzen_Condition;
	information	= Info_Mod_Genn_Giftpflanzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier sind die Pflanzen.";
};

FUNC INT Info_Mod_Genn_Giftpflanzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Trador))
	&& (Npc_HasItems(hero, ItPl_Mushroom_04) >= 1)
	&& (Npc_HasItems(hero, ItPl_Venena) >= 1)
	&& (Npc_HasItems(hero, ItPl_Mithrida) >= 1)
	&& (Npc_HasItems(hero, ItPl_Piante) >= 1)
	&& (Npc_HasItems(hero, ItPl_Ponzola) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Giftpflanzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Giftpflanzen_15_00"); //Hier sind die Pflanzen.

	Npc_RemoveInvItems	(hero, ItPl_Mushroom_04, 1);
	Npc_RemoveInvItems	(hero, ItPl_Mithrida, 1);
	Npc_RemoveInvItems	(hero, ItPl_Piante, 1);
	Npc_RemoveInvItems	(hero, ItPl_Ponzola, 1);
	Npc_RemoveInvItems	(hero, ItPl_Venena, 1);

	B_ShowGivenThings	("Pflanzen gegeben");

	AI_Output(self, hero, "Info_Mod_Genn_Giftpflanzen_09_01"); //Vielen Dank, ich werde sie untersuchen, solange du nach dem verschwundenen Magier Ausschau hälst.

	B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Jetzt liegt es an mir, herauszufinden, wer von Trador umgebracht wurde. Ich sollte mich im Dorf etwas umsehen.");

	AI_UnequipArmor	(Mod_7357_VMG_Dean_Tug);
	Npc_RemoveInvItems	(Mod_7357_VMG_Dean_TUG, ItAr_Naturmagier2, 1);

	B_StartOtherRoutine	(Mod_7357_VMG_Dean_TUG, "ERMORDET");
	B_KillNpc	(Mod_7357_VMG_Dean_TUG);

	Wld_InsertNpc	(Golem_DeanKiller, "TUG_83");
};

INSTANCE Info_Mod_Genn_Dean (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Dean_Condition;
	information	= Info_Mod_Genn_Dean_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Dean_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Per_Dean))
	|| (Npc_KnowsInfo(hero, Info_Mod_Dever_Dean))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Dean_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_00"); //Und? Was hast du herausgefunden?
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_01"); //Der getötete Magier heißt Dean.
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_02"); //Er wurde von einem Golem überfallen, als er sich auf den Weg gemacht hat, den alten Steinkreis zu untersuchen.
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_03"); //Merkwürdigerweise hat aber niemand den Golem vorher gesehen.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_04"); //Dean also. Das ist schon ein Schlag.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_05"); //Er hat sich bei uns um die mystischen und unerklärlichen Angelegenheiten gekümmert.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_06"); //Wir müssen davon ausgehen, dass unser Feind Dinge weiß, die ihn nichts angehen.
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_07"); //Wie geht es jetzt weiter?
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_08"); //Ach ja, genau. Ich habe die Pflanzen untersucht.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_09"); //Ich denke, er wurde mit der Venena-Pflanze vergiftet. Hier hast du ein Exemplar davon.

	B_GiveInvItems	(self, hero, ItPl_Venena, 1);

	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_10"); //Jetzt geh zu Turendil und berichte ihm alles, was du hier herausgefunden hast.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_11"); //Er wird wissen, was zu tun ist.
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_12"); //Okay, danke. Ich mache mich dann auf den Weg.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_13"); //Beeile dich.

	B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Genn hat herausgefunden, dass Faice mit dem Gift der Venena-Pflanze vergiftet wurde. Ich sollte jetzt zurück zu Turendil gehen und ihm alles erzählen, was ich herausgefunden habe.");
};

INSTANCE Info_Mod_Genn_TradorTot (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_TradorTot_Condition;
	information	= Info_Mod_Genn_TradorTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_TradorTot_Condition()
{
	if (Mod_VMG_WSTrador == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_TradorTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_TradorTot_09_00"); //Wo kommst du denn her? Und was war das für ein Lärm da hinten?

	Info_ClearChoices	(Info_Mod_Genn_TradorTot);

	Info_AddChoice	(Info_Mod_Genn_TradorTot, "Die lange Version.", Info_Mod_Genn_TradorTot_B);
	Info_AddChoice	(Info_Mod_Genn_TradorTot, "Die kurze Version", Info_Mod_Genn_TradorTot_A);
};

FUNC VOID Info_Mod_Genn_TradorTot_C()
{
	AI_Output(self, hero, "Info_Mod_Genn_TradorTot_C_09_00"); //Sehr gut, ich bin stolz auf dich.
	AI_Output(self, hero, "Info_Mod_Genn_TradorTot_C_09_01"); //Ich denke, es wäre das Beste, wenn ich den Teleporter zurück ins Minental für dich aktiviere, damit du Turendil von der Sache berichten kannst.
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_C_15_02"); //Tu das.
	AI_Output(self, hero, "Info_Mod_Genn_TradorTot_C_09_03"); //So, du kannst. Wir sehen uns.

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Genn weiß Bescheid und hat das Portal für den Rückweg aktiviert. Jetzt sollte ich zu Turendil gehen.");

	Info_ClearChoices	(Info_Mod_Genn_TradorTot);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Genn_TradorTot_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_00"); //Die lange Version:
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_01"); //Nachdem Trador den Teleporter manipuliert hatte, bin ich in einem abgelegenen Tal herausgekommen.
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_02"); //Dort habe ich die beiden Einsiedler Setta und Buff kennen gelernt und habe den taleigenen Teleporter repariert.
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_03"); //Danach sind wir hierhergekommen und wurden von Trador überrascht.
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_04"); //Ich habe ihn umgebracht und ihm die Spruchrollen zur Golembeschwörung abgenommen.

	Info_Mod_Genn_TradorTot_C();
};

FUNC VOID Info_Mod_Genn_TradorTot_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_A_15_00"); //Die kurze Version:
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_A_15_01"); //Trador ist tot und ich habe die Spruchrollen zur Golembeschwörung sichergestellt. Er hatte den Teleporter manipuliert.

	Info_Mod_Genn_TradorTot_C();
};

INSTANCE Info_Mod_Genn_Pruefung (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Pruefung_Condition;
	information	= Info_Mod_Genn_Pruefung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Faice schickt mich.";
};

FUNC INT Info_Mod_Genn_Pruefung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Pruefung))
	&& (Mod_VMG_Pruefung == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Pruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_15_00"); //Faice schickt mich.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_09_01"); //Ja, ich weiß. Du willst die drei Tests meistern, die dich in unsere Praktiken einweisen, habe ich recht?

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);

	Info_AddChoice	(Info_Mod_Genn_Pruefung, "Was für Tests?", Info_Mod_Genn_Pruefung_B);
	Info_AddChoice	(Info_Mod_Genn_Pruefung, "So ist es.", Info_Mod_Genn_Pruefung_A);
};

FUNC VOID Info_Mod_Genn_Pruefung_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_B_15_00"); //Was für Tests?
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_B_09_01"); //Das hat Faice dir nicht erzählt? Dann steht es mir auch nicht zu.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_B_09_02"); //Du wirst nacheinander Aufgaben gestellt bekommen, die du ohne Hilfe lösen musst.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_B_09_03"); //Ich werde dir jetzt die erste dieser Aufgaben auferlegen. Bist du bereit?

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);

	Info_AddChoice	(Info_Mod_Genn_Pruefung, "Ich muss noch was erledigen.", Info_Mod_Genn_Pruefung_D);
	Info_AddChoice	(Info_Mod_Genn_Pruefung, "Ich bin bereit.", Info_Mod_Genn_Pruefung_C);
};

FUNC VOID Info_Mod_Genn_Pruefung_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_A_15_00"); //So ist es.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_A_09_01"); //Dann werde ich dir jetzt die erste Aufgabe auferlegen. Bist du bereit?

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);

	Info_AddChoice	(Info_Mod_Genn_Pruefung, "Ich muss noch was erledigen.", Info_Mod_Genn_Pruefung_D);
	Info_AddChoice	(Info_Mod_Genn_Pruefung, "Ich bin bereit.", Info_Mod_Genn_Pruefung_C);
};

FUNC VOID Info_Mod_Genn_Pruefung_D()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_D_15_00"); //Ich muss noch was erledigen.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_D_09_01"); //Beeile dich.

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);
};

FUNC VOID Info_Mod_Genn_Pruefung_C()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_C_15_00"); //Ich bin bereit.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_01"); //Vielleicht ist dir schon der Tempel vor unserem Lager aufgefallen.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_02"); //Falls nicht habe ich eine Karte für dich vorbereitet, auf der der Standpunkt eingezeichnet ist.

	B_GiveInvItems	(self, hero, ItWr_Map_Tugettso_Tempel, 1);

	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_03"); //Außerdem erhältst du von mir drei Spruchrollen, die du dort weise einsetzen musst.

	B_ShowGivenThings	("3 Spruchrollen erhalten");

	CreateInvItems	(hero, ItSc_TrfMeatbug, 1);
	CreateInvItems	(hero, ItSc_TrfBloodfly, 1);
	CreateInvItems	(hero, Itsc_TrfSheep, 1);

	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_04"); //Unten im Tempel, ganz am Ende ist eine Truhe. Bring mir den Gegenstand, der darin ist. Ein Teleporter wird dich wieder zu mir führen.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_05"); //Doch sei gewarnt: Du wirst nur mit den Spruchrollen dein Ziel erreichen können, denn der Weg wird von drei Hindernissen versperrt.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_06"); //Überlege dir gut, welche Rolle du für welches Hindernis benutzt. Noch Fragen?
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_C_15_07"); //Nein.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_08"); //Alles klar, hier hast du noch den Schlüssel und einen Teleportzauber.

	B_ShowGivenThings	("Schlüssel und Spruchrolle erhalten");

	CreateInvItems	(hero, ItSc_TeleportGenn, 1);
	CreateInvItems	(hero, ItKe_TugettsoTempel, 1);

	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_C_15_09"); //Gut, ich mache mich dann auf den Weg.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_10"); //Viel Erfolg!

	Mod_VMG_Pruefung = 1;

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich soll zum Tempel, der auf der Karte von Tugettso markiert ist und mit der Hilfe von drei Spruchrollen einen Gegenstand aus seinem Gewölbe holen.");

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Genn_Pruefung2 (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Pruefung2_Condition;
	information	= Info_Mod_Genn_Pruefung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin zurück.";
};

FUNC INT Info_Mod_Genn_Pruefung2_Condition()
{
	if (Mod_VMG_Pruefung == 1)
	&& (Mod_VMG_Pruefung_Teleport > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Pruefung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_00"); //Ich bin zurück.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_01"); //Und? Hast du den Gegenstand?

	if (Npc_HasItems(hero, ItMi_Statue_Genn) == 1)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_02"); //Hier ist die Büste.
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_03"); //Wunderbar, du hast die erste Aufgabe gemeistert! Gib mir die Büste.
		AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_04"); //Hier hast du sie.

		B_GiveInvItems	(hero, self, ItMi_Statue_Genn, 1);

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich habe die erste Aufgabe zu Genns Zufriedenheit gelöst. Asko wird mir nun die nächste Aufgabe stellen. Er wartet im Dorf auf mich.");

		Mod_VMG_Pruefung_Genn = 1;
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_05"); //Nein.
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_06"); //Oh, verstehe. Das ist eine verzwickte Situation, eigentlich dürfte ich dich nicht weiter lassen.
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_07"); //Aber du hast schon so viel für unser Tal getan, dass ich ein Auge zudrücken werde.
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_08"); //Ich werde Faice davon berichten, aber du darfst jetzt bei keiner weiteren Aufgabe scheitern!
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_09"); //Hast du mich verstanden?
		AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_10"); //Alles klar.

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich habe die Aufgabe von Genn nicht lösen können. Jetzt soll mir Asko die nächste Aufgabe stellen, bei der ich nicht scheitern sollte.");

		Mod_VMG_Pruefung_Genn = 2;
	};

	AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_11"); //Gut. Die nächste Aufgabe wird dir Asko stellen. Am besten, du gehst gleich zu ihm.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_12"); //Er ist inzwischen wieder im Dorf.

	B_StartOtherRoutine	(Mod_7355_VMG_Asko_TUG, "START");
};

INSTANCE Info_Mod_Genn_Pruefung3 (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Pruefung3_Condition;
	information	= Info_Mod_Genn_Pruefung3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin zurück.";
};

FUNC INT Info_Mod_Genn_Pruefung3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Per_Pruefung4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Pruefung3_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung3_15_00"); //Ich bin zurück.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung3_09_01"); //Das freut mich. Ich will dich auch gar nicht lange aufhalten, denn Faice möchte dich sehen.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung3_09_02"); //Ich werde dann ja erfahren, wie es ausgegangen ist. Ich wünsche dir auf jeden Fall viel Glück!
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung3_09_03"); //Der Teleporter ist aktiv, du kannst dich gleich auf den Weg machen.
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung3_15_04"); //Vielen Dank.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung3_09_05"); //Mach's gut!
};

var int Mod_Knows_GennTrader;

INSTANCE Info_Mod_Genn_Trade (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Trade_Condition;
	information	= Info_Mod_Genn_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Genn_Trade_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Genn_Trade_Info()
{
	if (Mod_Knows_GennTrader == FALSE)
	{
		Mod_Knows_GennTrader = TRUE;

		Log_CreateTopic	(TOPIC_MOD_HAENDLER_VM, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HAENDLER_VM, "Genn handelt mit magischem Zubehör.");
	};

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Genn_Pickpocket (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Pickpocket_Condition;
	information	= Info_Mod_Genn_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Genn_Pickpocket_Condition()
{
	C_Beklauen	(55, ItSc_TrfBloodfly, 1);
};

FUNC VOID Info_Mod_Genn_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

	Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_BACK, Info_Mod_Genn_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Genn_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Genn_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Genn_Pickpocket);
};

FUNC VOID Info_Mod_Genn_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

		Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Genn_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Genn_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Genn_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Genn_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Genn_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Genn_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Genn_EXIT (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_EXIT_Condition;
	information	= Info_Mod_Genn_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Genn_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Genn_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};