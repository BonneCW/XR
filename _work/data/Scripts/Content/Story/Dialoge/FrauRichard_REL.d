INSTANCE Info_Mod_FrauRichard_REL_Hi (C_INFO)
{
	npc		= Mod_7719_OUT_Frau_REL;
	nr		= 1;
	condition	= Info_Mod_FrauRichard_REL_Hi_Condition;
	information	= Info_Mod_FrauRichard_REL_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieder gut eingelebt?";
};

FUNC INT Info_Mod_FrauRichard_REL_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_FrauRichard_REL_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_FrauRichard_REL_Hi_15_00"); //Wieder gut eingelebt?
	AI_Output(self, hero, "Info_Mod_FrauRichard_REL_Hi_19_01"); //Es hat sich ja einiges geändert, seitdem ich weg war.

	if (Mod_REL_Stadthalter == 1)
	{
		AI_Output(self, hero, "Info_Mod_FrauRichard_REL_Hi_19_02"); //Dass Theodorus mal Statthalter werden würde, hätte ich nie für möglich gehalten!
	}
	else if (Mod_REL_Stadthalter == 2)
	{
		AI_Output(self, hero, "Info_Mod_FrauRichard_REL_Hi_19_03"); //Dass Lukas mal Statthalter werden würde, hätte ich nie für möglich gehalten!
	}
	else if (Mod_REL_Stadthalter == 3)
	{
		AI_Output(self, hero, "Info_Mod_FrauRichard_REL_Hi_19_04"); //Dass Wendel mal Statthalter werden würde, hätte ich nie für möglich gehalten!
	};

	AI_Output(self, hero, "Info_Mod_FrauRichard_REL_Hi_19_05"); //Aber besser als unter Anselm konnte es ja nur werden.
	AI_Output(self, hero, "Info_Mod_FrauRichard_REL_Hi_19_06"); //Nun gibt es immerhin Vorschriften zum Gebrauch des Freudenspenders.
	AI_Output(hero, self, "Info_Mod_FrauRichard_REL_Hi_15_07"); //Und wenn ich mich nicht irre, hast du auch wieder einen Partner gefunden?
	AI_Output(self, hero, "Info_Mod_FrauRichard_REL_Hi_19_08"); //(verschwörerisch) Psst, nicht zu laut. Offiziell sind wir kein Paar, sondern nur alte Schulfreunde.
	AI_Output(self, hero, "Info_Mod_FrauRichard_REL_Hi_19_09"); //Er hat mich nach meiner Wiederkehr aufgenommen.
	AI_Output(self, hero, "Info_Mod_FrauRichard_REL_Hi_19_10"); //Aber es scheint sich da etwas zu entwickeln ...
	AI_Output(self, hero, "Info_Mod_FrauRichard_REL_Hi_19_11"); //Ohne dich wäre das alles nicht möglich gewesen. Hier, ich möchte dir dieses Geschenk machen.

	B_GiveInvItems	(self, hero, ItRi_Dex_01, 1);

	AI_Output(self, hero, "Info_Mod_FrauRichard_REL_Hi_19_12"); //Dieser Ring wird schon seit mindestens drei Generationen in der Familie weitergegeben. Aber jetzt soll er dir gehören.
	AI_Output(hero, self, "Info_Mod_FrauRichard_REL_Hi_15_13"); //Vielen Dank.
	AI_Output(self, hero, "Info_Mod_FrauRichard_REL_Hi_19_14"); //Mach's gut!
};

INSTANCE Info_Mod_FrauRichard_REL_EXIT (C_INFO)
{
	npc		= Mod_7719_OUT_Frau_REL;
	nr		= 1;
	condition	= Info_Mod_FrauRichard_REL_EXIT_Condition;
	information	= Info_Mod_FrauRichard_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_FrauRichard_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_FrauRichard_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};