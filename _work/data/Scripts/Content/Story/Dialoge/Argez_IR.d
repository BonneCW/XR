INSTANCE Info_Mod_Argez_IR_Hi (C_INFO)
{
	npc		= PC_Friend_IR;
	nr		= 1;
	condition	= Info_Mod_Argez_IR_Hi_Condition;
	information	= Info_Mod_Argez_IR_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Argez?";
};

FUNC INT Info_Mod_Argez_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Argez_IR_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Argez_IR_Hi_15_00"); //Argez?
	AI_Output(self, hero, "Info_Mod_Argez_IR_Hi_37_01"); //Ja, entschuldige mein ungeladenes Erscheinen.
	AI_Output(hero, self, "Info_Mod_Argez_IR_Hi_15_02"); //Was, wie ...?
	AI_Output(self, hero, "Info_Mod_Argez_IR_Hi_37_03"); //Nun, ich hielt mich im Lagerraum verborgen. Ich musste euch einfach auf dieser Reise begleiten.
	AI_Output(hero, self, "Info_Mod_Argez_IR_Hi_15_04"); //Das Bedürfnis, auf diese abscheuliche, finstere Insel mitzukommen?
	AI_Output(self, hero, "Info_Mod_Argez_IR_Hi_37_05"); //Frag nicht wieso. Ich kann es auch nicht genau sagen ...
	AI_Output(self, hero, "Info_Mod_Argez_IR_Hi_37_06"); //Es ist einerseits ein furchtbarer Ort, voller abscheulicher Geschöpfe Bosheit, den ich für gewöhnlich nie betreten wollte ... aber andererseits ...
	AI_Output(hero, self, "Info_Mod_Argez_IR_Hi_15_07"); //Ja, weißt du etwas darüber?
	AI_Output(self, hero, "Info_Mod_Argez_IR_Hi_37_08"); //Nun, es erscheint es mir manches so vertraut ... so viele Bruchstücke von Sinneseindrücken und Erinnerungen, die auf mich eindringen ...
	AI_Output(hero, self, "Info_Mod_Argez_IR_Hi_15_09"); //Was ist?
	AI_Output(self, hero, "Info_Mod_Argez_IR_Hi_37_10"); //Ich ... es ist so viel was meinen Geist auf einmal durchdringt ... Eindrücke, Bilder, Stimmen ... es ...

	AI_PlayAni  (self, "T_MAGRUN_2_HEASHOOT");

	AI_Output(self, hero, "Info_Mod_Argez_IR_Hi_37_11"); //Der Weg, der sich offenbart durch die Hände zweier ... das, was zu verbinden scheint und doch trennen wird ...
	AI_Output(self, hero, "Info_Mod_Argez_IR_Hi_37_12"); //... zur rechten und zur linken wird sich entscheiden, ob in Blut getränkt oder rein, wie Quellwasser ...
	AI_Output(hero, self, "Info_Mod_Argez_IR_Hi_15_13"); //Was hat das alles zu bedeu ...

	AI_PlayAni  (self, "T_HEASHOOT_2_STAND");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "DRAINED");

	AI_TurnToNpc	(hero, Mod_7458_NONE_Jack_IR);

	AI_Output(hero, self, "Info_Mod_Argez_IR_Hi_15_14"); //Verdammt, er ist ohnmächtig.
};

INSTANCE Info_Mod_Argez_IR_Bridge (C_INFO)
{
	npc		= PC_Friend_IR;
	nr		= 1;
	condition	= Info_Mod_Argez_IR_Bridge_Condition;
	information	= Info_Mod_Argez_IR_Bridge_Info;
	permanent	= 0;
	important	= 0;
	description	= "Argez! Du bist bei Bewusstsein?";
};

FUNC INT Info_Mod_Argez_IR_Bridge_Condition()
{
	if (Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_IR_Bridge_Info()
{
	AI_Output(hero, self, "Info_Mod_Argez_IR_Bridge_15_00"); //Argez! Du bist bei Bewusstsein? Und die Brücke wieder begehbar. War das dein Werk?
	AI_Output(self, hero, "Info_Mod_Argez_IR_Bridge_37_01"); //Ja, es ist mir gelungen, den Mechanismus für die Brücke magisch auszulösen ... und ich spüre, dass die Präsenz des Dämonen erloschen ist.
	AI_Output(self, hero, "Info_Mod_Argez_IR_Bridge_37_02"); //Im Augenblick, als du ich ihn erschlugst, erlangte ich das Bewusstsein zurück.
	AI_Output(self, hero, "Info_Mod_Argez_IR_Bridge_37_03"); //Nun ist es noch mein einziger Wunsch, die Insel schnell zu verlassen.
	AI_Output(hero, self, "Info_Mod_Argez_IR_Bridge_15_04"); //Ja, davon soll uns nichts mehr abhalten. Zurück zum Schiff.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Argez_IR_EXIT (C_INFO)
{
	npc		= PC_Friend_IR;
	nr		= 1;
	condition	= Info_Mod_Argez_IR_EXIT_Condition;
	information	= Info_Mod_Argez_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Argez_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Argez_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};