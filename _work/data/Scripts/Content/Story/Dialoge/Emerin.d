INSTANCE Info_Mod_Emerin_Stollen (C_INFO)
{
	npc		= Mod_4025_NONE_Emerin_MT;
	nr		= 1;
	condition	= Info_Mod_Emerin_Stollen_Condition;
	information	= Info_Mod_Emerin_Stollen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Emerin_Stollen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grubuz_Stollen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Emerin_Stollen_Info()
{
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_12_00"); //Was? Wo kommst du denn her?
	AI_Output(hero, self, "Info_Mod_Emerin_Stollen_15_01"); //Das sollte ich eher dich fragen.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_12_02"); //Ich lebe hier unten. Die Orks sind vor ein paar Tagen nach hier unten durchgebrochen, und ich musste sie ja irgendwie verjagen.
	AI_Output(hero, self, "Info_Mod_Emerin_Stollen_15_03"); //Also bist du ein Totenbeschwörer?
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_12_04"); //Ja, das könnte man so sagen.

	Info_ClearChoices	(Info_Mod_Emerin_Stollen);

	Info_AddChoice	(Info_Mod_Emerin_Stollen, "Dann muss ich dich leider töten.", Info_Mod_Emerin_Stollen_B);
	Info_AddChoice	(Info_Mod_Emerin_Stollen, "Verstehst du dich auch auf die Verwandlungsmagie?", Info_Mod_Emerin_Stollen_A);
};

FUNC VOID Info_Mod_Emerin_Stollen_B()
{
	AI_Output(hero, self, "Info_Mod_Emerin_Stollen_B_15_00"); //Dann muss ich dich leider töten.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_B_12_01"); //Was habe ich dir denn getan?

	Info_ClearChoices	(Info_Mod_Emerin_Stollen);

	Info_AddChoice	(Info_Mod_Emerin_Stollen, "Ich habe es mir zum Beruf gemacht, Nekromanten zu töten.", Info_Mod_Emerin_Stollen_C);
	Info_AddChoice	(Info_Mod_Emerin_Stollen, "Das war nur ein Witz.", Info_Mod_Emerin_Stollen_D);
};

FUNC VOID Info_Mod_Emerin_Stollen_A()
{
	AI_Output(hero, self, "Info_Mod_Emerin_Stollen_A_15_00"); //Verstehst du dich auch auf die Verwandlungsmagie?
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_A_12_01"); //Natürlich. Ich war einst ein angesehenes Mitglied im Kreis der Verwandlungsmagier in Tugettso.
	AI_Output(hero, self, "Info_Mod_Emerin_Stollen_A_15_02"); //Warum bist du denn keiner mehr?
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_A_12_03"); //Das ist eine lange Geschichte.

	Info_ClearChoices	(Info_Mod_Emerin_Stollen);

	Info_AddChoice	(Info_Mod_Emerin_Stollen, "Bitte die Kurzversion.", Info_Mod_Emerin_Stollen_F);
	Info_AddChoice	(Info_Mod_Emerin_Stollen, "Ich habe Zeit.", Info_Mod_Emerin_Stollen_E);
};

FUNC VOID Info_Mod_Emerin_Stollen_D()
{
	AI_Output(hero, self, "Info_Mod_Emerin_Stollen_D_15_00"); //Das war nur ein Witz.

	Info_ClearChoices	(Info_Mod_Emerin_Stollen);

	Info_AddChoice	(Info_Mod_Emerin_Stollen, "Habt ihr hier zufällig einen Stollen entdeckt?", Info_Mod_Emerin_Stollen_A);
};

FUNC VOID Info_Mod_Emerin_Stollen_C()
{
	AI_Output(hero, self, "Info_Mod_Emerin_Stollen_C_15_00"); //Ich habe es mir zum Beruf gemacht, Nekromanten zu töten.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_C_12_01"); //Wenn das so ist ...

	Info_ClearChoices	(Info_Mod_Emerin_Stollen);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

FUNC VOID Info_Mod_Emerin_Stollen_G()
{
	AI_Output(hero, self, "Info_Mod_Emerin_Stollen_G_15_00"); //Also bist du noch in der Lage, dich zu verwandeln oder zumindest Verwandlungsrollen herzustellen?
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_G_12_01"); //Selbstverständlich. Magie vergisst man nicht so einfach. Was kann ich für dich tun?
	AI_Output(hero, self, "Info_Mod_Emerin_Stollen_G_15_02"); //Ich suche den Verwandlungszauber zur Harpie.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_G_12_03"); //Oh, davon habe ich keine mehr. Aber du kannst mir die nötigen Zutaten bringen, damit ich einen herstellen kann.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_G_12_04"); //Bist du daran interessiert?

	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "In den Stollen habe ich einen ehemaligen Verwandlungsmagier getroffen, der sich scheinbar sehr eingehend mit der Nekromantie, der Totenbeschwörung, befasst.");

	Info_ClearChoices	(Info_Mod_Emerin_Stollen);

	Info_AddChoice	(Info_Mod_Emerin_Stollen, "Vorher möchte ich noch etwas erledigen.", Info_Mod_Emerin_Stollen_I);
	Info_AddChoice	(Info_Mod_Emerin_Stollen, "Klar. Was soll ich dir bringen.", Info_Mod_Emerin_Stollen_H);
};

FUNC VOID Info_Mod_Emerin_Stollen_I()
{
	AI_Output(hero, self, "Info_Mod_Emerin_Stollen_I_15_00"); //Vorher möchte ich noch etwas erledigen.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_I_12_01"); //Komm wieder, wenn du interessiert bist.

	Info_ClearChoices	(Info_Mod_Emerin_Stollen);
};

FUNC VOID Info_Mod_Emerin_Stollen_H()
{
	AI_Output(hero, self, "Info_Mod_Emerin_Stollen_H_15_00"); //Klar. Was soll ich dir bringen.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_H_12_01"); //Ich brauche zwei Flügel einer Blutfliege, ein Blatt Papier – ein Steckbrief tut's auch -, und eine Mana Essenz.

	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "Der Nekromant Emerin braucht für die Herstellung der Spruchrolle „Verwandlung Harpie“ zwei Flügel einer Blutfliege, einen Blatt Papier und eine Mana Essenz.");

	Mod_Hermy_KnowsQuest = 4;

	Info_ClearChoices	(Info_Mod_Emerin_Stollen);
};

FUNC VOID Info_Mod_Emerin_Stollen_E()
{
	AI_Output(hero, self, "Info_Mod_Emerin_Stollen_E_15_00"); //Ich habe Zeit.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_E_12_01"); //Ich entdeckte, dass die Lehren, die die anderen verfolgten, verkehrt waren. Der Weg, den sie gingen, war falsch.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_E_12_02"); //Aber als ich versuchte, sie davon zu überzeugen, glaubten sie mir nicht. Sie verstießen mich aus ihrer Gemeinschaft.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_E_12_03"); //So irrte ich umher und lernte nach und nach, dass die Beschwörung der Verwandlung weit voraus ist.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_E_12_04"); //Ich besuchte große Meister, die inzwischen wohl tot sind, und lernte einiges über die Nekromantie.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_E_12_05"); //Bald danach entdeckte ich diesen Stollen und machte ihn für mich bewohnbar, ehe ich ihn verschloss.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_E_12_06"); //Doch dann kamen die Orks und zwangen mich dazu, den Stollen zu verteidigen.

	Info_Mod_Emerin_Stollen_G();
};

FUNC VOID Info_Mod_Emerin_Stollen_F()
{
	AI_Output(hero, self, "Info_Mod_Emerin_Stollen_F_15_00"); //Bitte die Kurzversion.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_F_12_01"); //Nachdem die Verwandlungsmagier mich wegen meiner Einsicht über die Falschheit ihrer Lehren verstoßen hatten, irrte ich tagelang umher und lernte von großen, inzwischen wohl toten, Meistern einiges über die Nekromantie.
	AI_Output(self, hero, "Info_Mod_Emerin_Stollen_F_12_02"); //Danach richtete ich mir diesen Stollen ein und verschloss ihn, ehe die Orks ihn wieder aufbrachen und mich zwangen, den Stollen zu verteidigen.

	Info_Mod_Emerin_Stollen_G();
};

INSTANCE Info_Mod_Emerin_Zutaten (C_INFO)
{
	npc		= Mod_4025_NONE_Emerin_MT;
	nr		= 1;
	condition	= Info_Mod_Emerin_Zutaten_Condition;
	information	= Info_Mod_Emerin_Zutaten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was soll ich dir bringen.";
};

FUNC INT Info_Mod_Emerin_Zutaten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Emerin_Stollen))
	&& (Mod_Hermy_KnowsQuest < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Emerin_Zutaten_Info()
{
	AI_Output(hero, self, "Info_Mod_Emerin_Zutaten_15_00"); //Was soll ich dir bringen.
	AI_Output(self, hero, "Info_Mod_Emerin_Zutaten_12_01"); //Ich brauche zwei Flügel einer Blutfliege, ein Blatt Papier – ein Steckbrief tut's auch -, und eine Mana Essenz.

	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "Der Nekromant Emerin braucht für die Herstellung der Spruchrolle „Verwandlung Harpie“ zwei Flügel einer Blutfliege, einen Steckbrief von mir und eine Mana Essenz.");

	Mod_Hermy_KnowsQuest = 4;
};

INSTANCE Info_Mod_Emerin_HabZutaten (C_INFO)
{
	npc		= Mod_4025_NONE_Emerin_MT;
	nr		= 1;
	condition	= Info_Mod_Emerin_HabZutaten_Condition;
	information	= Info_Mod_Emerin_HabZutaten_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Emerin_HabZutaten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Emerin_Stollen))
	&& (Mod_Hermy_KnowsQuest == 4)
	&& (Npc_HasItems(hero, ItAt_Wing) >= 2)
	&& (Npc_HasItems(hero, ItPo_Mana_01) >= 1)
	&& (Npc_HasItems(hero, ItWr_Paper) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Emerin_HabZutaten_Info()
{
	AI_Output(self, hero, "Info_Mod_Emerin_HabZutaten_12_00"); //Hast du die Zutaten?
	AI_Output(hero, self, "Info_Mod_Emerin_HabZutaten_15_01"); //Ja, hier.

	B_ShowGivenThings	("Mana Essenz, zwei Blutfliegenflügel und Papier gegeben");

	Npc_RemoveInvItems	(hero, ItPo_Mana_01, 1);
	Npc_RemoveInvItems	(hero, ItAt_Wing, 2);
	Npc_RemoveInvItems	(hero, ItWr_Paper, 1);

	AI_Output(self, hero, "Info_Mod_Emerin_HabZutaten_12_02"); //Wunderbar, komme morgen wieder, dann gebe ich dir die Spruchrolle.

	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "Ich soll einen Tag warten und mir dann die Spruchrolle von Emerin abholen.");

	Mod_Hermy_KnowsQuest = 5;
	Mod_EmerinWillDie = Wld_GetDay();
};

INSTANCE Info_Mod_Emerin_EXIT (C_INFO)
{
	npc		= Mod_4025_NONE_Emerin_MT;
	nr		= 1;
	condition	= Info_Mod_Emerin_EXIT_Condition;
	information	= Info_Mod_Emerin_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Emerin_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Emerin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};