INSTANCE Info_Mod_Regina_Hi (C_INFO)
{
	npc		= Mod_7276_OUT_Regina_REL;
	nr		= 1;
	condition	= Info_Mod_Regina_Hi_Condition;
	information	= Info_Mod_Regina_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Regina_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Regina_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Regina_Hi_26_00"); //Regina, eine einfache Hausfrau.
	AI_Output(self, hero, "Info_Mod_Regina_Hi_26_01"); //Ich habe dich noch nie gesehen ... reist du viel?

	Info_ClearChoices	(Info_Mod_Regina_Hi);

	Info_AddChoice	(Info_Mod_Regina_Hi, "Nein, ich bin nur neu zugezogen.", Info_Mod_Regina_Hi_B);
	Info_AddChoice	(Info_Mod_Regina_Hi, "Kann man wohl sagen.", Info_Mod_Regina_Hi_A);
};

FUNC VOID Info_Mod_Regina_Hi_C()
{
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_00"); //Mein Bub wollte auch immer raus in die weite Welt, da kann ich dir was erzählen, ja.
	AI_Output(hero, self, "Info_Mod_Regina_Hi_C_15_01"); //Ein andermal.
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_02"); //Er sagte, Mutti, wenn ich groß bin, will ich über die Leute herrschen. Süß, nich?
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_03"); //Vielleicht kennst du ja seinen Namen?
	AI_Output(hero, self, "Info_Mod_Regina_Hi_C_15_04"); //Der da lautet?
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_05"); //Gomez heißt er. Hat sich schon lange nich mehr bei seiner Mutter blicken lassen, der Lümmel.
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_06"); //Ich wüsste zu gern, wo er sich rumtreibt.
	AI_Output(hero, self, "Info_Mod_Regina_Hi_C_15_07"); //Gomez?!
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_08"); //Du kennst ihn? Nich dein Ernst!
	AI_Output(hero, self, "Info_Mod_Regina_Hi_C_15_09"); //Sein Traum ist wahr geworden ... wenn auch nur für kurze Zeit.
	AI_Output(hero, self, "Info_Mod_Regina_Hi_C_15_10"); //Dann wurde er von einem Unbekannten gestürzt.
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_11"); //Nee, oder? Und ich sag noch, Junge, sag ich, lass das man lieber sein, dieser Beherrschungskrams führt doch zu keinem gute Ende.
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_12"); //Ich hab's ihm gesagt! (aufgebracht, schnell) Aber nee, er wollte ja nicht hören, musste immer seinen Dickkopf durchsetzen.
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_13"); //Und schreibt mir nich mal Briefe, der Bengel.
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_14"); //Nich sein Zimmer hat er aufgeräumt, nichts, stell dir das mal vor!
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_15"); //Wie er noch klein gewesen war, sind wir immer zusammen zum See runter und haben Wäsche gewaschen, da hat er noch geholfen.
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_16"); //Aber später nich mehr, nee, da durfte ich immer alles allein machen.
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_17"); //Wurde schon fast wie sein Vater, der Bub.
	AI_Output(hero, self, "Info_Mod_Regina_Hi_C_15_18"); //Aha ...
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_19"); //Diese Freudenspender hat er dann auch irgendwann genommen, war dann immer komisch im Kopp.
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_20"); //Visionen hatte der, ich sag's dir.
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_21"); //Keine Ahnung, woher er all die Ideen hatte, aber glaub ja nicht, dass ich die gut fand!
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_22"); //Sein Frauenbild, das willst du nicht gekannt haben!
	AI_Output(hero, self, "Info_Mod_Regina_Hi_C_15_23"); //Ich muss dann mal ...
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_24"); //... aber die Höhe war ja noch ... Was?
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_25"); //Habe ich schon wieder zu viel geredet?
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_26"); //Das wirst du doch einer alten Mutter nachsehen, oder?
	AI_Output(hero, self, "Info_Mod_Regina_Hi_C_15_27"); //Ich überleg's mir.
	AI_Output(self, hero, "Info_Mod_Regina_Hi_C_26_28"); //(ruhig) Dann mach's mal gut. Auf Wiedersehen.

	Info_ClearChoices	(Info_Mod_Regina_Hi);
};

FUNC VOID Info_Mod_Regina_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Regina_Hi_B_15_00"); //Nein, ich bin nur neu zugezogen.
	AI_Output(self, hero, "Info_Mod_Regina_Hi_B_26_01"); //Schade.

	Info_Mod_Regina_Hi_C();
};

FUNC VOID Info_Mod_Regina_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Regina_Hi_A_15_00"); //Kann man wohl sagen.
	AI_Output(self, hero, "Info_Mod_Regina_Hi_A_26_01"); //Ach, wie hübsch.

	Info_Mod_Regina_Hi_C();
};

INSTANCE Info_Mod_Regina_Freudenspender (C_INFO)
{
	npc		= Mod_7276_OUT_Regina_REL;
	nr		= 1;
	condition	= Info_Mod_Regina_Freudenspender_Condition;
	information	= Info_Mod_Regina_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Willst du Freudenspender?";
};                       

FUNC INT Info_Mod_Regina_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Regina_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Regina_Freudenspender_15_00"); //Willst du Freudenspender?
	AI_Output(self, hero, "Info_Mod_Regina_Freudenspender_26_01"); //Ganz bestimmt nicht! Das hat meinem Sohn schon den Geist vernebelt.
};

INSTANCE Info_Mod_Regina_Pickpocket (C_INFO)
{
	npc		= Mod_7276_OUT_Regina_REL;
	nr		= 1;
	condition	= Info_Mod_Regina_Pickpocket_Condition;
	information	= Info_Mod_Regina_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90_Female;
};

FUNC INT Info_Mod_Regina_Pickpocket_Condition()
{
	C_Beklauen	(76, ItMi_Gold, 29);
};

FUNC VOID Info_Mod_Regina_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Regina_Pickpocket);

	Info_AddChoice	(Info_Mod_Regina_Pickpocket, DIALOG_BACK, Info_Mod_Regina_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Regina_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Regina_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Regina_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Regina_Pickpocket);
};

FUNC VOID Info_Mod_Regina_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Regina_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Regina_Pickpocket);

		Info_AddChoice	(Info_Mod_Regina_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Regina_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Regina_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Regina_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Regina_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Regina_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Regina_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Regina_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Regina_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Regina_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Regina_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Regina_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Regina_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Regina_EXIT (C_INFO)
{
	npc		= Mod_7276_OUT_Regina_REL;
	nr		= 1;
	condition	= Info_Mod_Regina_EXIT_Condition;
	information	= Info_Mod_Regina_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Regina_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Regina_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};