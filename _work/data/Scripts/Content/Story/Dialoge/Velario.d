INSTANCE Info_Mod_Velario_Hi (C_INFO)
{
	npc		= Mod_1738_KDF_Velario_PAT;
	nr		= 1;
	condition	= Info_Mod_Velario_Hi_Condition;
	information	= Info_Mod_Velario_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Velario_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Velario_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Velario_Hi_06_01"); //Ich bin Velario.
};

INSTANCE Info_Mod_Velario_MangelQuest (C_INFO)
{
	npc		= Mod_1738_KDF_Velario_PAT;
	nr		= 1;
	condition	= Info_Mod_Velario_MangelQuest_Condition;
	information	= Info_Mod_Velario_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was studierst du, Bruder?";
};

FUNC INT Info_Mod_Velario_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Velario_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velario_MangelQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Velario_MangelQuest_15_00"); //Was studierst du, Bruder?
	AI_Output(self, hero, "Info_Mod_Velario_MangelQuest_06_01"); //Hmm, was? Ohh, entschuldige, ich war gerade in die Schriften vertieft.
	AI_Output(hero, self, "Info_Mod_Velario_MangelQuest_15_02"); //Womit beschäftigst du dich?
	AI_Output(self, hero, "Info_Mod_Velario_MangelQuest_06_03"); //Nun, ich suche nach neuen Möglichkeiten der magischen Kriegsführung.
	AI_Output(self, hero, "Info_Mod_Velario_MangelQuest_06_04"); //Diese Belagerung verlangt uns alles ab, und da darf ich nichts unversucht lassen, uns einen Vorteil im Kampf zu verschaffen.
	AI_Output(hero, self, "Info_Mod_Velario_MangelQuest_15_05"); //Und wie laufen die Studien?
	AI_Output(self, hero, "Info_Mod_Velario_MangelQuest_06_06"); //Ehrlich gesagt ... miserabel. Ich habe schon jedes dieser Bücher hier gelesen, aber es steht einfach nichts Nennenswertes drin.
	AI_Output(self, hero, "Info_Mod_Velario_MangelQuest_06_07"); //Ich bräuchte einfach mehr Schriften für meine Studien, sonst bezweifele ich ernsthaft, dass ich jemals irgendwelche Fortschritte erziele.

	B_StartMangel();

	B_LogEntry	(TOPIC_MOD_FM_MANGEL, "Velario sucht verzweifelt nach Schriften über magische Kriegsführung, um der Belagerung besser zu widerstehen.");
};

INSTANCE Info_Mod_Velario_MangelQuest2 (C_INFO)
{
	npc		= Mod_1738_KDF_Velario_PAT;
	nr		= 1;
	condition	= Info_Mod_Velario_MangelQuest2_Condition;
	information	= Info_Mod_Velario_MangelQuest2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich denke das hier könnte dich interessieren.";
};

FUNC INT Info_Mod_Velario_MangelQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Velario_MangelQuest))
	&& (Npc_HasItems(hero, ItWr_ZombieToHuman) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velario_MangelQuest2_Info()
{
	AI_Output(hero, self, "Info_Mod_Velario_MangelQuest2_15_00"); //Ich denke das hier könnte dich interessieren.

	B_GiveInvItems	(hero, self, ItWr_ZombieToHuman, 1);

	AI_Output(self, hero, "Info_Mod_Velario_MangelQuest2_06_01"); //Lass sehen.

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Velario_MangelQuest2_06_02"); //(verblüfft) Was zum ... Bei Innos, woher hast du dieses Werk und unter welchem Umständen ist es in deinen Besitz gelangt?
	AI_Output(hero, self, "Info_Mod_Velario_MangelQuest2_15_03"); //Es stammt aus einem uralten Tempel und die Umstände ... sagen wir mal, ich war dem Tode näher, als mir lieb war.
	AI_Output(self, hero, "Info_Mod_Velario_MangelQuest2_06_04"); //Das muss ich erst einmal gründlich studieren. Ich glaube, das könnte mir zu entscheidenden Kenntnissen verhelfen ...
	AI_Output(self, hero, "Info_Mod_Velario_MangelQuest2_06_05"); //Aber warte, nimm diese Spruchrollen zum Dank.

	B_ShowGivenThings	("Feuerregen Spruchrolle und 2 Feuersturm Spruchrollen erhalten");

	AI_Output(self, hero, "Info_Mod_Velario_MangelQuest2_06_06"); //Eine vergleichsweise bescheidene Gabe, wenn das Buch tatsächlich das halten sollte, was es auf den ersten Blick zu versprechen scheint.

	CreateInvItems	(hero, ItSc_Firerain, 1);
	CreateInvItems	(hero, ItSc_Pyrokinesis, 2);

	B_GivePlayerXP	(500);

	B_LogEntry	(TOPIC_MOD_FM_MANGEL, "Velario war über das Buch mehr als nur glücklich.");

	B_StopMangel();
};

INSTANCE Info_Mod_Velario_Fake (C_INFO)
{
	npc		= Mod_1738_KDF_Velario_PAT;
	nr		= 1;
	condition	= Info_Mod_Velario_Fake_Condition;
	information	= Info_Mod_Velario_Fake_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du irgendwas verdächtiges gesehen?";
};

FUNC INT Info_Mod_Velario_Fake_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faros_Fake))
	&& (Npc_KnowsInfo(hero, Info_Mod_Velario_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velario_Fake_Info()
{
	AI_Output(hero, self, "Info_Mod_Velario_Fake_15_00"); //Hast du irgendwas verdächtiges gesehen?
	AI_Output(self, hero, "Info_Mod_Velario_Fake_06_01"); //Nein, ich glaube nicht.
	AI_Output(hero, self, "Info_Mod_Velario_Fake_15_02"); //Bist du sicher? Ist hier kein Magier vorbeigekommen, der es ziemlich eilig hatte?
	AI_Output(self, hero, "Info_Mod_Velario_Fake_06_03"); //Da war tatsächlich jemand. Er wollte glaub ich in die Mine.

	B_LogEntry	(TOPIC_MOD_FM_SM, "Velario meint, dass der Magier in die Mine geflohen sei.");
};

INSTANCE Info_Mod_Velario_EXIT (C_INFO)
{
	npc		= Mod_1738_KDF_Velario_PAT;
	nr		= 1;
	condition	= Info_Mod_Velario_EXIT_Condition;
	information	= Info_Mod_Velario_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Velario_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Velario_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};