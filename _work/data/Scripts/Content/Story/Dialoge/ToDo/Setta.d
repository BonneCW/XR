INSTANCE Info_Mod_Setta_Hi (C_INFO)
{
	npc		= Mod_7360_OUT_Setta_WS;
	nr		= 1;
	condition	= Info_Mod_Setta_Hi_Condition;
	information	= Info_Mod_Setta_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Setta_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Setta_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Setta_Hi_16_00"); //Hey!

	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Setta_Hi_16_01"); //Mein Name ist Setta. Ich wohne hier seit ein paar Jahren, wohne ich.
	AI_Output(hero, self, "Info_Mod_Setta_Hi_15_02"); //Wie bist du hier hergekommen?
	AI_Output(self, hero, "Info_Mod_Setta_Hi_16_03"); //Ich weiß es nicht mehr genau. Wo kommst du denn her, kommst du?

	Info_ClearChoices	(Info_Mod_Setta_Hi);

	Info_AddChoice	(Info_Mod_Setta_Hi, "Ich komme aus dem Minental. Schon mal davon gehört?", Info_Mod_Setta_Hi_B);
	Info_AddChoice	(Info_Mod_Setta_Hi, "Ich bin von oben hereingeflogen.", Info_Mod_Setta_Hi_A);
};

FUNC VOID Info_Mod_Setta_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Setta_Hi_B_15_00"); //Ich komme aus dem Minental. Schon mal davon gehört?
	AI_Output(self, hero, "Info_Mod_Setta_Hi_B_16_01"); //Das habe ich tatsächlich, habe ich. Wenn ich mich recht entsinne, komme ich auch da her, komme ich. Ist denn die ... Barriere noch da?
	AI_Output(hero, self, "Info_Mod_Setta_Hi_B_15_02"); //Nein, sie ist weg. Und daran war ich nicht ganz unbeteiligt.
	AI_Output(self, hero, "Info_Mod_Setta_Hi_B_16_03"); //(staunt) Wow, ein richtiger Held. In meiner bescheidenen Hütte. Was kann ich für dich tun, kann ich?
	AI_Output(hero, self, "Info_Mod_Setta_Hi_B_15_04"); //Wie komme ich wieder weg von hier?
	AI_Output(self, hero, "Info_Mod_Setta_Hi_B_16_05"); //Das kann ich dir nicht sagen, kann ich nicht, ich weiß es nämlich selbst nicht. Sonst wäre ich wohl nicht mehr hier.
	AI_Output(hero, self, "Info_Mod_Setta_Hi_B_15_06"); //Hast du gar keine Idee?
	AI_Output(self, hero, "Info_Mod_Setta_Hi_B_16_07"); //Hm, jetzt wo du es sagst. Frag doch mal den alten Buff. Er lebt in einem Zelt den Weg runter, lebt er.
	AI_Output(hero, self, "Info_Mod_Setta_Hi_B_15_08"); //Danke für die Information.
	AI_Output(self, hero, "Info_Mod_Setta_Hi_B_16_09"); //Keine Ursache, hihi.

	Info_ClearChoices	(Info_Mod_Setta_Hi);

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Ich bin in einem merkwürdigen Tal gelandet, aus der es kein Entkommen zu geben scheint. Merkwürdigerweise habe ich den Aufladestein noch. Vielleicht bringt er mich hier raus. Die Einsiedlerin Setta gab mir den Rat, mich mit dem alten Buff in Verbindung zu setzen.");
};

FUNC VOID Info_Mod_Setta_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Setta_Hi_A_15_00"); //Ich bin von oben hereingeflogen.
	AI_Output(self, hero, "Info_Mod_Setta_Hi_A_16_01"); //Oh, wie ein Vogel? Ich liebe Vögel, liebe ich. Aber verarschen kann ich mich alleine, kann ich. Ich bin nicht so tatterig, wie ich aussehe.

	Info_Mod_Setta_Hi_B();
};

INSTANCE Info_Mod_Setta_EXIT (C_INFO)
{
	npc		= Mod_7360_OUT_Setta_WS;
	nr		= 1;
	condition	= Info_Mod_Setta_EXIT_Condition;
	information	= Info_Mod_Setta_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Setta_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Setta_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};