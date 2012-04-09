INSTANCE Info_Mod_Kakos_Hi (C_INFO)
{
	npc		= Kakos_11006_NW;
	nr		= 1;
	condition	= Info_Mod_Kakos_Hi_Condition;
	information	= Info_Mod_Kakos_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kakos_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kakos_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Kakos_Hi_10_00"); //(grob) Hey, du Mensch. Du kommst doch bestimmt von der Taverne.
	AI_Output(self, hero, "Info_Mod_Kakos_Hi_10_01"); //Da kannst du gleich noch mal hingehen und mir etwas zu trinken besorgen. 30 Bier oder 15 Wacholder.

	Info_ClearChoices	(Info_Mod_Kakos_Hi);

	Info_AddChoice	(Info_Mod_Kakos_Hi, "Hol dir dein Gesöff doch selbst.", Info_Mod_Kakos_Hi_B);
	Info_AddChoice	(Info_Mod_Kakos_Hi, "Klar, ich helfe gern.", Info_Mod_Kakos_Hi_A);
};

FUNC VOID Info_Mod_Kakos_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Kakos_Hi_B_15_00"); //Hol dir dein Gesöff doch selbst.
	AI_Output(self, hero, "Info_Mod_Kakos_Hi_B_10_01"); //Dann muss ich dir den Schädel einschlagen.

	Info_ClearChoices	(Info_Mod_Kakos_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

FUNC VOID Info_Mod_Kakos_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Kakos_Hi_A_15_00"); //Klar, ich helfe gern.
	AI_Output(self, hero, "Info_Mod_Kakos_Hi_A_10_01"); //Dann stehe hier nicht rum, sondern mach dich auf den Weg, bevor ich dir Beine machen muss.

	Info_ClearChoices	(Info_Mod_Kakos_Hi);

	Mod_NL_Kakos = 1;

	AI_StopProcessInfos	(self);

	Log_CreateTopic	(TOPIC_MOD_NL_KAKOS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NL_KAKOS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NL_KAKOS, "Ich soll dem Riesen, der sich bei Bengar breit gemacht hat, 30 Bier oder 15 Flaschen Wacholder besorgen. Vielleicht sollte ich ihm den Genuss der Getränke mit einigen Fliegenpilzen steigern ...");
};

INSTANCE Info_Mod_Kakos_Alkohol (C_INFO)
{
	npc		= Kakos_11006_NW;
	nr		= 1;
	condition	= Info_Mod_Kakos_Alkohol_Condition;
	information	= Info_Mod_Kakos_Alkohol_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe den Alkohol.";
};

FUNC INT Info_Mod_Kakos_Alkohol_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kakos_Hi))
	&& (Mod_NL_Kakos == 1)
	&& ((Npc_HasItems(hero, ItFo_Beer) >= 30)
	|| (Npc_HasItems(hero, ItFo_Booze) >= 15)
	|| ((Npc_HasItems(hero, ItFo_Beer) >= 29)
	&& (Npc_HasItems(hero, ItFo_GiftBooze) == 1))
	|| ((Npc_HasItems(hero, ItFo_Booze) >= 14)
	&& (Npc_HasItems(hero, ItFo_GiftBooze) == 1)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kakos_Alkohol_Info()
{
	AI_Output(hero, self, "Info_Mod_Kakos_Alkohol_15_00"); //Ich habe den Alkohol.
	AI_Output(self, hero, "Info_Mod_Kakos_Alkohol_10_01"); //Her damit.

	B_ShowGivenThings	("Alkohol gegeben");

	if (Npc_HasItems(hero, ItFo_GiftBooze) == 1)
	{
		AI_Output(hero, self, "Info_Mod_Kakos_Alkohol_15_02"); //(zu sich selbst) Hehehe, wohl bekomm’s.

		Npc_RemoveInvItems	(hero, ItFo_GiftBooze, 1);

		self.attribute[ATR_HITPOINTS] -= self.attribute[ATR_HITPOINTS_MAX]*6/10;

		if (Npc_HasItems(hero, ItFo_Beer) >= 29)
		{
			Npc_RemoveInvItems	(hero, ItFo_Beer, 29);
		}
		else
		{
			Npc_RemoveInvItems	(hero, ItFo_Booze, 14);
		};

		B_UseItem	(self, ItFo_GiftBooze);
	}
	else
	{
		if (Npc_HasItems(hero, ItFo_Beer) >= 30)
		{
			Npc_RemoveInvItems	(hero, ItFo_Beer, 30);

			B_UseItem	(self, ItFo_Beer);
		}
		else
		{
			Npc_RemoveInvItems	(hero, ItFo_Booze, 15);

			B_UseItem	(self, ItFo_Booze);
		};
	};

	AI_Output(self, hero, "Info_Mod_Kakos_Alkohol_10_03"); //Ahh, das war gut ...
	AI_Output(self, hero, "Info_Mod_Kakos_Alkohol_10_04"); //Und jetzt einige Stücke Fleisch.
	AI_Output(self, hero, "Info_Mod_Kakos_Alkohol_10_05"); //Ob gebraten oder nicht, ist mir einerlei, aber meine Riesennase verrät mir, dass du etwas bei dir hast.

	Info_ClearChoices	(Info_Mod_Kakos_Alkohol);

	Info_AddChoice	(Info_Mod_Kakos_Alkohol, "Ich habe nichts mehr.", Info_Mod_Kakos_Alkohol_Ende);
	if (Npc_HasItems(hero, ItFoMuttonZombie) > 0)
	{
		Info_AddChoice	(Info_Mod_Kakos_Alkohol, "Zombiefleisch geben", Info_Mod_Kakos_Alkohol_MuttonZombie);
	};
	if (Npc_HasItems(hero, ItFo_MuttonRaw) > 0)
	{
		Info_AddChoice	(Info_Mod_Kakos_Alkohol, "Rohes Fleisch geben", Info_Mod_Kakos_Alkohol_MuttonRaw);
	};
	if (Npc_HasItems(hero, ItFo_Mutton) > 0)
	{
		Info_AddChoice	(Info_Mod_Kakos_Alkohol, "Gebratenes Fleisch geben", Info_Mod_Kakos_Alkohol_Mutton);
	};
};

FUNC VOID B_CheckKakosFleisch ()
{
	if (Mod_NL_KakosFleisch == 30)
	{
		Mod_NL_Kakos = 2;

		AI_Output(self, hero, "Info_Mod_Kakos_Alkohol_FleischCheck_10_00"); //Ahh, das reicht, ein überaus reiches Mahl hast du mir bereitet.
		AI_Output(self, hero, "Info_Mod_Kakos_Alkohol_FleischCheck_10_01"); //Lass mich dir nun den Dank der Riesen zuteil werden lassen.

		AI_StopProcessInfos	(self);

		B_Attack	(self, hero, AR_Kill, 0);
	}
	else
	{
		var int Random;
		Random = Hlp_Random(5);
		
		if (Random == 0)
		{
			AI_Output(self, hero, "Info_Mod_Kakos_Alkohol_FleischCheck_10_02"); //Soll das alles sein?
		}
		else if (Random == 1)
		{
			AI_Output(self, hero, "Info_Mod_Kakos_Alkohol_FleischCheck_10_03"); //Her damit!
		}
		else if (Random == 2)
		{
			AI_Output(self, hero, "Info_Mod_Kakos_Alkohol_FleischCheck_10_04"); //Gib her!
		}
		else if (Random == 3)
		{
			AI_Output(self, hero, "Info_Mod_Kakos_Alkohol_FleischCheck_10_05"); //Mehr, mehr!
		}
		else if (Random == 4)
		{
			AI_Output(self, hero, "Info_Mod_Kakos_Alkohol_FleischCheck_10_06"); //Ich bin noch lange nicht satt.
		};		

		Info_ClearChoices	(Info_Mod_Kakos_Alkohol);

		Info_AddChoice	(Info_Mod_Kakos_Alkohol, "Ich habe nichts mehr.", Info_Mod_Kakos_Alkohol_Ende);
		if (Npc_HasItems(hero, ItFoMuttonZombie) > 0)
		{
			Info_AddChoice	(Info_Mod_Kakos_Alkohol, "Zombiefleisch geben", Info_Mod_Kakos_Alkohol_MuttonZombie);
		};
	if (Npc_HasItems(hero, ItFo_MuttonRaw) > 0)
	{
		Info_AddChoice	(Info_Mod_Kakos_Alkohol, "Rohes Fleisch geben", Info_Mod_Kakos_Alkohol_MuttonRaw);
	};
	if (Npc_HasItems(hero, ItFo_Mutton) > 0)
	{
		Info_AddChoice	(Info_Mod_Kakos_Alkohol, "Gebratenes Fleisch geben", Info_Mod_Kakos_Alkohol_Mutton);
	};
	};
};

FUNC VOID Info_Mod_Kakos_Alkohol_Ende()
{
	AI_Output(hero, self, "Info_Mod_Kakos_Alkohol_Ende_15_00"); //Ich habe nichts mehr.
	AI_Output(self, hero, "Info_Mod_Kakos_Alkohol_Ende_10_01"); //Was?! Du Bürschchen willst mich doch bestimmt nur zum Narren halten.
	AI_Output(self, hero, "Info_Mod_Kakos_Alkohol_Ende_10_02"); //Deinem zerschmetterten Körper werde ich abnehmen, was du mir nicht geben wolltest.

	Info_ClearChoices	(Info_Mod_Kakos_Alkohol);

	B_CheckKakosFleisch();
};

FUNC VOID Info_Mod_Kakos_Alkohol_MuttonZombie()
{
	Npc_RemoveInvItems	(hero, ItFoMuttonZombie, 1);

	Mod_NL_KakosFleisch += 1;

	self.attribute[ATR_HITPOINTS] -= self.attribute[ATR_HITPOINTS]/10;

	Info_ClearChoices	(Info_Mod_Kakos_Alkohol);

	B_CheckKakosFleisch();
};

FUNC VOID Info_Mod_Kakos_Alkohol_MuttonRaw()
{
	Npc_RemoveInvItems	(hero, ItFo_MuttonRaw, 1);

	Mod_NL_KakosFleisch += 1;

	Info_ClearChoices	(Info_Mod_Kakos_Alkohol);

	B_CheckKakosFleisch();
};

FUNC VOID Info_Mod_Kakos_Alkohol_Mutton()
{
	Npc_RemoveInvItems	(hero, ItFo_Mutton, 1);

	Mod_NL_KakosFleisch += 1;

	Info_ClearChoices	(Info_Mod_Kakos_Alkohol);

	B_CheckKakosFleisch();
};

INSTANCE Info_Mod_Kakos_EXIT (C_INFO)
{
	npc		= Kakos_11006_NW;
	nr		= 1;
	condition	= Info_Mod_Kakos_EXIT_Condition;
	information	= Info_Mod_Kakos_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Kakos_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kakos_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};