INSTANCE Info_Mod_Serra_Hi (C_INFO)
{
	npc		= Mod_7559_OUT_Serra_EIS;
	nr		= 1;
	condition	= Info_Mod_Serra_Hi_Condition;
	information	= Info_Mod_Serra_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Serra_Hi_Condition()
{
	if (Wld_IsTime(08,00,19,00))
	&& (Kapitel >= 3)
	&& (Npc_KnowsInfo(hero, Info_Mod_Alfans_Aufgabe))
	&& (Wld_GetDay()-2 >= Mod_AlfansQuest_Tag)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Serra_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Serra_Hi_17_00"); //Hallo Fremder. Du musst von weit herkommen, ich habe dich hier noch niemals gesehen.
	AI_Output(hero, self, "Info_Mod_Serra_Hi_15_01"); //Ja, mein Herkunftsort liegt tatsächlich ein ganzes Stück weg.
	AI_Output(self, hero, "Info_Mod_Serra_Hi_17_02"); //Du hast bestimmt viele Abenteuer bestritten und unzählige Monster erschlagen ... so etwas sieht man einem stattlichen Kerl wie dir an.
	AI_Output(hero, self, "Info_Mod_Serra_Hi_15_03"); //Ja, ist schon was dran.
	AI_Output(self, hero, "Info_Mod_Serra_Hi_17_04"); //Hmm, weißt du, ich habe gerade ein schweres Paket bei mir.
	AI_Output(self, hero, "Info_Mod_Serra_Hi_17_05"); //Wenn du es für mich trägst und mich zu meinem Haus begleitest, würde ich dich auch für diese gute Tat entlohnen.
	AI_Output(hero, self, "Info_Mod_Serra_Hi_15_06"); //Ok, mal sehen, was sich machen lässt.
	AI_Output(self, hero, "Info_Mod_Serra_Hi_17_07"); //Hier. Es ist auch nicht weit.

	B_GiveInvItems	(self, hero, ItMi_SeraPaket, 1);

	AI_Output(hero, self, "Info_Mod_Serra_Hi_15_08"); //(zu sich selbst) Hmm, so schwer ist das Paket ja gar nicht.

	AI_StopProcessInfos	(hero);

	B_StartOtherRoutine	(self, "TOHOME");
	B_StartOtherRoutine	(Mod_7560_OUT_Malfama_EIS, "TOHOME");

	Log_CreateTopic	(TOPIC_MOD_EIS_UNSCHULDIG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EIS_UNSCHULDIG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EIS_UNSCHULDIG, "Serra hat mich darum gebeten ihr Paket nach hause zu tragen. Dazu muss ich ihr einfach folgen.");
};

INSTANCE Info_Mod_Serra_AtHome (C_INFO)
{
	npc		= Mod_7559_OUT_Serra_EIS;
	nr		= 1;
	condition	= Info_Mod_Serra_AtHome_Condition;
	information	= Info_Mod_Serra_AtHome_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Serra_AtHome_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Serra_Hi))
	&& (Npc_HasItems(hero, ItMi_SeraPaket) == 1)
	&& (Npc_GetDistToWP(hero, "EIS_DORF_003") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Serra_AtHome_Info()
{
	AI_Output(self, hero, "Info_Mod_Serra_AtHome_17_00"); //Da sind wir schon. Vielen Dank für deine selbstlose Tat, mir das Paket zu tragen.

	B_GiveInvItems	(hero, self, ItMi_SeraPaket, 1);

	AI_Output(self, hero, "Info_Mod_Serra_AtHome_17_01"); //Du bist ein toller Mann. Hier hast du einige Goldmünzen zur Entlohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	AI_Output(hero, self, "Info_Mod_Serra_AtHome_15_02"); //Danke.
	AI_Output(self, hero, "Info_Mod_Serra_AtHome_17_03"); //Ach, wenn doch nur alle Menschen so gut und großherzig wären, wie du.
	AI_Output(hero, self, "Info_Mod_Serra_AtHome_15_04"); //Wieso?
	AI_Output(self, hero, "Info_Mod_Serra_AtHome_17_05"); //Ach, da gibt es diesen Mann, Alvar heißt er. Ein unmöglicher Mensch, ein Rüpel und Rohling.
	AI_Output(self, hero, "Info_Mod_Serra_AtHome_17_06"); //Er lässt mich einfach nicht in Frieden ... sogar mehrmals belästigt hat er mich.
	AI_Output(self, hero, "Info_Mod_Serra_AtHome_17_07"); //Zum Dorfschamanen traue ich mich jedoch nicht zu gehen, um sein Verhalten anzuklagen.
	AI_Output(self, hero, "Info_Mod_Serra_AtHome_17_08"); //Alvar würde sich furchtbar an mir rächen.

	B_GivePlayerXP	(50);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Serra_AtHome2 (C_INFO)
{
	npc		= Mod_7559_OUT_Serra_EIS;
	nr		= 1;
	condition	= Info_Mod_Serra_AtHome2_Condition;
	information	= Info_Mod_Serra_AtHome2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Serra_AtHome2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malfama_AtHome))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Serra_AtHome2_Info()
{
	AI_Output(self, hero, "Info_Mod_Serra_AtHome2_17_00"); //Vielen Dank. Dann könnten wir uns endlich wieder sicher fühlen.
	AI_Output(hero, self, "Info_Mod_Serra_AtHome2_15_01"); //Was kann ich tun? Ihn züchtigen?
	AI_Output(self, hero, "Info_Mod_Serra_AtHome2_17_02"); //Nein, das würde doch nichts helfen. Dann könnte er noch schlimmer werden aus Rache.
	AI_Output(self, hero, "Info_Mod_Serra_AtHome2_17_03"); //Es müsste etwas sein, das ihn vor der Gerichtsbarkeit bloßstellt und verhindert, dass er jemals wieder einer Frau im Dorf etwas antun kann.
	AI_Output(self, hero, "Info_Mod_Serra_AtHome2_17_04"); //Ja, wenn du uns sein Tagebuch bringen könntest.
	AI_Output(self, hero, "Info_Mod_Serra_AtHome2_17_05"); //Vielleicht hat er dort etwas über seine Missetaten festgehalten. Dann könnte man ihn überführen.
	AI_Output(hero, self, "Info_Mod_Serra_AtHome2_15_06"); //Sein Tagebuch ... das ließe sich einrichten.
	AI_Output(self, hero, "Info_Mod_Serra_AtHome2_17_07"); //(überschwänglich) Vielen Dank, du weißt gar nicht, wie sehr du uns damit hilfst.
	AI_Output(self, hero, "Info_Mod_Serra_AtHome2_17_08"); //Du müsstest es irgendwo bei ihm auf dem Tisch finden.
	AI_Output(self, hero, "Info_Mod_Serra_AtHome2_17_09"); //Viel Glück. Wir stehen damit tief in deiner Schuld.

	B_LogEntry	(TOPIC_MOD_EIS_UNSCHULDIG, "Serra und Malfama werden offensichtlich von einem Mann namens Alvar bedroht und bedrängt. Ich soll ihnen sein Tagebuch beschaffen. Vielleicht hat er seine Missetaten darin festgehalten.");

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_7560_OUT_Malfama_EIS, "START");

	Wld_InsertItem	(ItWr_AlvarTagebuch, "FP_ITEM_ALVAR_TAGEBUCH");
};

INSTANCE Info_Mod_Serra_AlvarTagebuch (C_INFO)
{
	npc		= Mod_7559_OUT_Serra_EIS;
	nr		= 1;
	condition	= Info_Mod_Serra_AlvarTagebuch_Condition;
	information	= Info_Mod_Serra_AlvarTagebuch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Serra_AlvarTagebuch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Serra_AtHome2))
	&& (Mod_AlvarTagebuch == 2)
	&& (Npc_HasItems(hero, ItWr_AlvarTagebuch) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Serra_AlvarTagebuch_Info()
{
	AI_Output(self, hero, "Info_Mod_Serra_AlvarTagebuch_17_00"); //Du bist wieder da! Hast du das Tagebuch, mein Held?
	AI_Output(hero, self, "Info_Mod_Serra_AlvarTagebuch_15_01"); //Ja, hier ist es. Auf den ersten Blick konnte ich keine Straftaten finden, die er festgehalten hätte.

	B_GiveInvItems	(hero, self, ItWr_AlvarTagebuch, 1);

	AI_Output(self, hero, "Info_Mod_Serra_AlvarTagebuch_17_02"); //Toll, du bist der größte. Zeig doch mal her.
	AI_Output(self, hero, "Info_Mod_Serra_AlvarTagebuch_17_03"); //Es wird bestimmt etwas zu finden sein. Man muss es nur gewissenhaft durchlesen.
	AI_Output(hero, self, "Info_Mod_Serra_AlvarTagebuch_15_04"); //In Ordnung. Viel Glück.
	AI_Output(self, hero, "Info_Mod_Serra_AlvarTagebuch_17_05"); //Ja, dein selbstloses Handeln soll allen anderen Vorbild sein.

	Mod_SeraHatBuch = Wld_GetDay();
};

INSTANCE Info_Mod_Serra_AlvarDead (C_INFO)
{
	npc		= Mod_7559_OUT_Serra_EIS;
	nr		= 1;
	condition	= Info_Mod_Serra_AlvarDead_Condition;
	information	= Info_Mod_Serra_AlvarDead_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Serra_AlvarDead_Condition()
{
	if (Mod_AlvarDead == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Serra_AlvarDead_Info()
{
	AI_Output(self, hero, "Info_Mod_Serra_AlvarDead_17_00"); //Ahh, da ist ja mein Held.
	AI_Output(hero, self, "Info_Mod_Serra_AlvarDead_15_01"); //Was hat das mit Alvar zu bedeuten?
	AI_Output(self, hero, "Info_Mod_Serra_AlvarDead_17_02"); //(heuchlerisch) Was? Ach, du meinst den schrecklichen Zwischenfall. Ja, der Arme. Das hat er nicht verdient.
	AI_Output(hero, self, "Info_Mod_Serra_AlvarDead_15_03"); //Was sollen diese Spielchen, was habt ihr damit zu tun?
	AI_Output(self, hero, "Info_Mod_Serra_AlvarDead_17_04"); //(unschuldig) Nichts, gar nichts. Es waren die Schneegeister ... er war einfach zu unvorsichtig.

	Info_ClearChoices	(Info_Mod_Serra_AlvarDead);

	Info_AddChoice	(Info_Mod_Serra_AlvarDead, "Ihr wisst ganz genau, was geschehen ist.", Info_Mod_Serra_AlvarDead_B);
	Info_AddChoice	(Info_Mod_Serra_AlvarDead, "Verstehe.", Info_Mod_Serra_AlvarDead_A);
};

FUNC VOID Info_Mod_Serra_AlvarDead_B()
{
	AI_Output(hero, self, "Info_Mod_Serra_AlvarDead_B_15_00"); //Ihr wisst ganz genau, was geschehen ist. Und es wird nicht ungesühnt bleiben.
	AI_Output(self, hero, "Info_Mod_Serra_AlvarDead_B_17_01"); //(trügerisch) Ich weiß nicht, was du meinst.
	AI_Output(self, hero, "Info_Mod_Serra_AlvarDead_B_17_02"); //Du warst es doch, der sein Tagebuch entwendet hat. Es gibt Zeugen.
	AI_Output(self, hero, "Info_Mod_Serra_AlvarDead_B_17_03"); //Also solltest du besser aufpassen, wen du beschuldigst. Du könntest sonst Unmut im Dorf heraufbeschwören.

	Info_ClearChoices	(Info_Mod_Serra_AlvarDead);

	Mod_AlvarDead = 2;
};

FUNC VOID Info_Mod_Serra_AlvarDead_A()
{
	AI_Output(hero, self, "Info_Mod_Serra_AlvarDead_A_15_00"); //Verstehe.

	Info_ClearChoices	(Info_Mod_Serra_AlvarDead);

	B_SetTopicStatus	(TOPIC_MOD_EIS_UNSCHULDIG, LOG_SUCCESS);
};

INSTANCE Info_Mod_Serra_Traenenkristall (C_INFO)
{
	npc		= Mod_7559_OUT_Serra_EIS;
	nr		= 1;
	condition	= Info_Mod_Serra_Traenenkristall_Condition;
	information	= Info_Mod_Serra_Traenenkristall_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Serra_Traenenkristall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alvar_Unbekannt))
	&& (Npc_HasItems(hero, ItMi_Traenenkristall) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Serra_Traenenkristall_Info()
{
	AI_Output(self, hero, "Info_Mod_Serra_Traenenkristall_17_00"); //Was, du hier? Knatus, halte ihn auf!
	AI_Output(hero, self, "Info_Mod_Serra_Traenenkristall_15_01"); //Einen Augenblick. Jetzt soll der Kristall seine Macht zeigen. Was hast du mit Thys vor?
	AI_Output(self, hero, "Info_Mod_Serra_Traenenkristall_17_02"); //Ich und Malfama haben Thys mit einem Schadenszauber belegt um vorzutäuschen, er sei krank.
	AI_Output(self, hero, "Info_Mod_Serra_Traenenkristall_17_03"); //Und jetzt werden wir ihn vergiften, um endgültig die Macht über dieses armselige Dorf zu bekommen.
	AI_Output(self, hero, "Info_Mod_Serra_Traenenkristall_17_04"); //Die Bewohner sind auf alle unsere Intrigen hereingefallen und fressen uns ja aus der Hand, wie dumme Esel.
	AI_Output(self, hero, "Info_Mod_Serra_Traenenkristall_17_05"); //Knatus, den Idioten, haben wir sogar so weit abgerichtet, dass er bereit ist, dich zu töten ...

	AI_TurnToNpc	(hero, Mod_7564_OUT_Knatus_EIS);

	AI_Output(hero, self, "Info_Mod_Serra_Traenenkristall_15_06"); //Hörst du Knatus, was sie über dich zu sagen haben?

	AI_StopProcessInfos	(hero);
};

INSTANCE Info_Mod_Serra_EXIT (C_INFO)
{
	npc		= Mod_7559_OUT_Serra_EIS;
	nr		= 1;
	condition	= Info_Mod_Serra_EXIT_Condition;
	information	= Info_Mod_Serra_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Serra_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Serra_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};