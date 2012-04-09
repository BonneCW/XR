INSTANCE Info_Mod_PennerVater_Hi (C_INFO)
{
	npc		= Mod_7541_OUT_PennerVater_REL;
	nr		= 1;
	condition	= Info_Mod_PennerVater_Hi_Condition;
	information	= Info_Mod_PennerVater_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Guten Tag, alter Mann.";
};

FUNC INT Info_Mod_PennerVater_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Penner_NochDa))
	&& (Npc_HasItems(Mod_7540_OUT_Penner_REL, ItMi_BrokenRune01) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_PennerVater_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_PennerVater_Hi_15_00"); //Guten Tag, alter Mann.
	AI_Output(self, hero, "Info_Mod_PennerVater_Hi_03_01"); //Im Frieden ist jeder Tag ein guter Tag.
	AI_Output(hero, self, "Info_Mod_PennerVater_Hi_15_02"); //Wie? Ach so.  Ich habe deinen Sohn getroffen. Seine Frau ...
	AI_Output(self, hero, "Info_Mod_PennerVater_Hi_03_03"); //Früh gefreit hat nie gereut.
	AI_Output(hero, self, "Info_Mod_PennerVater_Hi_15_04"); //... ist sterbenskrank. Er braucht etwas Geld für die Überfahrt.
	AI_Output(self, hero, "Info_Mod_PennerVater_Hi_03_05"); //Spare in der Zeit, dann hast du in der Not.
	AI_Output(hero, self, "Info_Mod_PennerVater_Hi_15_06"); //Wohl wahr! Aber vielleicht hast du doch ein paar Goldstücke ...

	B_GiveInvItems	(self, hero, ItMi_Gold, 2);

	AI_Output(self, hero, "Info_Mod_PennerVater_Hi_03_07"); //Der Spatz in der Hand ist besser, als die Taube auf dem Dach.
	AI_Output(hero, self, "Info_Mod_PennerVater_Hi_15_08"); //Sagst du. Ich weiß nicht ...
	AI_Output(self, hero, "Info_Mod_PennerVater_Hi_03_09"); //Wer die Münze nicht ehrt, ist des Schatzes nicht wert.
	AI_Output(hero, self, "Info_Mod_PennerVater_Hi_15_10"); //Da hast du recht. Übrigens, Wie geht's dir hier so?
	AI_Output(self, hero, "Info_Mod_PennerVater_Hi_03_11"); //Hunger ist der beste Koch.
	AI_Output(hero, self, "Info_Mod_PennerVater_Hi_15_12"); //Mag sein. Ich meine ...
	AI_Output(self, hero, "Info_Mod_PennerVater_Hi_03_13"); //Besser eigenes Brot als fremder Braten.
	AI_Output(hero, self, "Info_Mod_PennerVater_Hi_15_14"); //Hmm.
	AI_Output(self, hero, "Info_Mod_PennerVater_Hi_03_15"); //Der Mensch lebt nicht vom Brot allein. Alles hat ein Ende, nur die Wurst hat zwei.
	AI_Output(hero, self, "Info_Mod_PennerVater_Hi_15_16"); //Ah, ich verstehe. Du willst was zum Essen.
	AI_Output(self, hero, "Info_Mod_PennerVater_Hi_03_17"); //Der Eintopf ist armer Leute Sonntagsspeise und ein Glas Wein auf die Suppe, ist dem Heiler eine Münze entzogen.
	AI_Output(hero, self, "Info_Mod_PennerVater_Hi_15_18"); //Ganz schöne Liste. Noch was?
	AI_Output(self, hero, "Info_Mod_PennerVater_Hi_03_19"); //In der Not schmeckt der Käs' auch ohne Brot und auch der Apfel fällt nicht weit vom Stamm.
	AI_Output(hero, self, "Info_Mod_PennerVater_Hi_15_20"); //Verstehe. Muss es gleich sein? Ich hätte gern gehört, was es mit der Münze und dem Schatz auf sich hat.
	AI_Output(self, hero, "Info_Mod_PennerVater_Hi_03_21"); //Was du heute kannst besorgen, das verschiebe nicht auf morgen.

	B_LogEntry	(TOPIC_MOD_JG_PENNERSVATER, "Ist schon ein komischer Kauz, der Alte. Ich möchte wissen, wo der die ganzen Sprichwörter her hat. Mal sehen, ob ich alles dabei habe, was der alte Herr will: Brot, Wurst, Eintopf, Wein, Käse und einen Apfel. Sonst muss ich noch mal zum Händler.");
};

INSTANCE Info_Mod_PennerVater_Aufgabe (C_INFO)
{
	npc		= Mod_7541_OUT_PennerVater_REL;
	nr		= 1;
	condition	= Info_Mod_PennerVater_Aufgabe_Condition;
	information	= Info_Mod_PennerVater_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier. Essen und trinken hält Leib und Seele zusammen.";
};

FUNC INT Info_Mod_PennerVater_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_PennerVater_Hi))
	&& (Npc_HasItems(hero, ItFo_Bread) >= 1)
	&& (Npc_HasItems(hero, ItFo_Sausage) >= 1)
	&& (Npc_HasItems(hero, ItFo_Stew) >= 1)
	&& (Npc_HasItems(hero, ItFo_Apple) >= 1)
	&& (Npc_HasItems(hero, ItFo_Wine) >= 1)
	&& (Npc_HasItems(hero, ItFo_Cheese) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_PennerVater_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_PennerVater_Aufgabe_15_00"); //Hier. Essen und trinken hält Leib und Seele zusammen.

	Npc_RemoveInvItems	(hero, ItFo_Bread, 1);
	Npc_RemoveInvItems	(hero, ItFo_Sausage, 1);
	Npc_RemoveInvItems	(hero, ItFo_Stew, 1);
	Npc_RemoveInvItems	(hero, ItFo_Apple, 1);
	Npc_RemoveInvItems	(hero, ItFo_Wine, 1);
	Npc_RemoveInvItems	(hero, ItFo_Cheese, 1);

	B_ShowGivenThings	("Lebensmittel gegeben");

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_PennerVater_Aufgabe_15_01"); //(selbst) Ha! Kann ich auch.

	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_PennerVater_Aufgabe_03_02"); //Wes' Brot ich ess, des' Lied ich sing.
	AI_Output(hero, self, "Info_Mod_PennerVater_Aufgabe_15_03"); //Ich höre ...
	AI_Output(self, hero, "Info_Mod_PennerVater_Aufgabe_03_04"); //Stille Wasser sind tief. Und laute fallen.
	AI_Output(hero, self, "Info_Mod_PennerVater_Aufgabe_15_05"); //Was meinst du damit?
	AI_Output(self, hero, "Info_Mod_PennerVater_Aufgabe_03_06"); //Die besten Fische schwimmen am Grund.
	AI_Output(hero, self, "Info_Mod_PennerVater_Aufgabe_15_07"); //Aha! Aber ich kapiere nicht.
	AI_Output(self, hero, "Info_Mod_PennerVater_Aufgabe_03_08"); //Es ist noch kein Meister vom Himmel gefallen.
	AI_Output(hero, self, "Info_Mod_PennerVater_Aufgabe_15_09"); //Aber Wasser, oder?
	AI_Output(self, hero, "Info_Mod_PennerVater_Aufgabe_03_10"); //Frisch gewagt ist halb gewonnen. Reisende soll man nicht aufhalten.

	B_LogEntry	(TOPIC_MOD_JG_PENNERSVATER, "Hm ... tiefes Wasser ... laut fallen ... von oben ... das Beste am Grund ... Wasser fallen ... Hm ...");
};

INSTANCE Info_Mod_PennerVater_EXIT (C_INFO)
{
	npc		= Mod_7541_OUT_PennerVater_REL;
	nr		= 1;
	condition	= Info_Mod_PennerVater_EXIT_Condition;
	information	= Info_Mod_PennerVater_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_PennerVater_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_PennerVater_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};