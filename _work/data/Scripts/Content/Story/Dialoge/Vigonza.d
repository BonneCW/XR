INSTANCE Info_Mod_Vigonza_Hi (C_INFO)
{
	npc		= Mod_7572_OUT_Vigonza_EIS;
	nr		= 1;
	condition	= Info_Mod_Vigonza_Hi_Condition;
	information	= Info_Mod_Vigonza_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Vigonza_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Luis_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vigonza_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_00"); //Was zum Teufel?! Wie kommst du hier rauf und was hast du mit meinen Männern gemacht?
	AI_Output(hero, self, "Info_Mod_Vigonza_Hi_15_01"); //Um deine Männer würde ich mir keine Sorgen mehr machen, mit denen hatte der Sensenmann schon seinen Spaß. Bei dir steht das noch aus.
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_02"); //Hast du überhaupt den blassesten Schimmer, was wir hier machen und wer wir sind?
	AI_Output(hero, self, "Info_Mod_Vigonza_Hi_15_03"); //Ihr seid selbst Schuld. Warum greifen deine Leute auch jeden an?
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_04"); //Auf einmal sind meine Leute Schuld? Wir wurden doch als Erste angegriffen.
	AI_Output(hero, self, "Info_Mod_Vigonza_Hi_15_05"); //Wer soll euch denn angriffen haben?
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_06"); //Ein Jäger. Er hat einen meiner besten Männer mit seinem Bogen beschossen.
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_07"); //Natürlich konnte ich ihm das nicht durchgehen lassen und hab zwei meiner Männer losgeschickt, die ihn zu mir bringen sollten.
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_08"); //Sie sind aber bis heute nicht zurückgekehrt. Deshalb habe ich befohlen, jeden, der sich uns nähert, anzugreifen, bis ich weiß, ob man uns hier feindlich gesonnen ist.
	AI_Output(hero, self, "Info_Mod_Vigonza_Hi_15_09"); //Ich hab den Jäger gefunden, der von deinen Leuten verfolgt wurde. Sie haben ihn getötet und das gleiche auch bei mir versucht, allerdings ohne Erfolg.
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_10"); //Wenn sie ihn getötet haben, dann nur, weil er sie angegriffen hat. Und kannst du es ihnen dann übel nehmen, wenn sie auch dich für eine Feind halten.
	AI_Output(hero, self, "Info_Mod_Vigonza_Hi_15_11"); //Gut, aber dann erklär mir, warum ein Jäger euch angreifen sollte?
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_12"); //Ich schätze mal er wollte das, weshalb auch wir in diese Lande gekommen sind. Mit der Ausnahme, dass er hinter dem schnellen Gold her war und wir um unsere Existenz kämpfen.
	AI_Output(hero, self, "Info_Mod_Vigonza_Hi_15_13"); //Das musst du mir genauer erklären.
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_14"); //Ich bin Hauptmann unseres Königs George Goddard, dem Zweiten.
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_15"); //Unser König hat uns entsandt, um das Blut der Dalma, einer Riesenspinne, die normalerweise tief unter der Erde lebt, zu holen, um ihn von seiner Familienkrankheit zu heilen.
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_16"); //Allerdings ist sie uns im Kampf in den Tiefen der Berge entwischt und in dieses Land geflüchtet.
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_17"); //Als mein bester Krieger sie für mich besiegen sollte, wurde er von dem Jäger angegriffen. Warscheinlich, weil er den Wert der Trophäen vor Augen hatte.
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_18"); //Und seitdem habe ich versucht, meine Leute auf einen Angriff vorzubereiten. Aber ohne meinen besten Krieger hätten sie es warscheinlich nicht geschafft.
	AI_Output(hero, self, "Info_Mod_Vigonza_Hi_15_19"); //Ich glaube euch. Hätte man das vorher klären können, wären eure Leute noch am Leben.
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_20"); //Vielleicht war es Schicksal. Du siehst aus, als könntest du gut kämpfen, und vielleicht hast du mehr Chancen gegen das Monster, als alle meine Leute zusammen.
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_21"); //Ich bitte dichh darum, mir im Kampf gegen die Dalma zur Seite zu stehen. Ich kann mich in meiner Heimat nicht ohne das Blut sehen lassen.
	AI_Output(hero, self, "Info_Mod_Vigonza_Hi_15_22"); //In Ordnung. Führe mich zu der Spinne und ich werde dir helfen.
	AI_Output(self, hero, "Info_Mod_Vigonza_Hi_08_23"); //Folge mir!

	B_LogEntry	(TOPIC_MOD_EIS_ALTERTURM, "Alles nur ein Misverständnis. Es scheint so als hätte Randi diesen Angriff provoziert. Wenigstens hat er seine gerechte Strafe bekommen. Vigonza, der Anführer der Bande, hat mich gebeten ihm beim Kampf gegen die Dalma, eine gefährliche Riesenspinne beizustehen. Er wird mich dorthin führen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "DALMA");

	Wld_InsertNpc	(Dalma, "EIS_400");
};

INSTANCE Info_Mod_Vigonza_Dalma (C_INFO)
{
	npc		= Mod_7572_OUT_Vigonza_EIS;
	nr		= 1;
	condition	= Info_Mod_Vigonza_Dalma_Condition;
	information	= Info_Mod_Vigonza_Dalma_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Vigonza_Dalma_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vigonza_Hi))
	&& (Npc_GetDistToWP(self, "EIS_400") < 500)
	&& (Npc_IsDead(Dalma))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vigonza_Dalma_Info()
{
	AI_Output(self, hero, "Info_Mod_Vigonza_Dalma_08_00"); //Endlich ist das Mistvieh erlegt. Ich danke dir. Hier, nimm dies als Belohnung.

	B_GiveInvItems	(self, hero, ItAt_DalmaZange, 2);

	AI_Output(self, hero, "Info_Mod_Vigonza_Dalma_08_01"); //Es sind die Zangen der Dalma. Mögen sie dir einen Goldregen schenken.
	AI_Output(self, hero, "Info_Mod_Vigonza_Dalma_08_02"); //Ich werde mich jetzt zum Pass begeben. Hoffentlich komme ich nicht zu spät. Alles Gute, Fremder.

	B_LogEntry	(TOPIC_MOD_EIS_ALTERTURM, "Die Dalma ist erledigt. Vigonza wird nun zurückkehren und ich sollte zu Keith gehen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Vigonza_EXIT (C_INFO)
{
	npc		= Mod_7572_OUT_Vigonza_EIS;
	nr		= 1;
	condition	= Info_Mod_Vigonza_EXIT_Condition;
	information	= Info_Mod_Vigonza_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Vigonza_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Vigonza_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};