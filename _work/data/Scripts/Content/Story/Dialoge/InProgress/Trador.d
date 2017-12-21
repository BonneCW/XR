INSTANCE Info_Mod_Trador_Hi (C_INFO)
{
	npc		= Mod_7352_OUT_Trador_TUG;
	nr		= 1;
	condition	= Info_Mod_Trador_Hi_Condition;
	information	= Info_Mod_Trador_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Trador_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Trador_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Trador_Hi_03_00"); //Da bist du ja, ich habe zwar nicht mit dir gerechnet, freue mich aber, dass du erscheinst.

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	Info_AddChoice	(Info_Mod_Trador_Hi, "Was willst du von mir?", Info_Mod_Trador_Hi_B);
	Info_AddChoice	(Info_Mod_Trador_Hi, "Wer bist du?", Info_Mod_Trador_Hi_A);
};

FUNC VOID Info_Mod_Trador_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_B_15_00"); //Was willst du von mir?
	AI_Output(self, hero, "Info_Mod_Trador_Hi_B_03_01"); //Hältst du es nicht für angebracht, erst einmal etwas von dir zu erzählen?

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	Info_AddChoice	(Info_Mod_Trador_Hi, "Nein.", Info_Mod_Trador_Hi_D);
	Info_AddChoice	(Info_Mod_Trador_Hi, "Ich bin ...", Info_Mod_Trador_Hi_C);
};

FUNC VOID Info_Mod_Trador_Hi_A()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Trador_Hi_A_03_00"); //Ich bin Trador, hohes Mitglied im Kreise der Verwandlungsmagier.
	AI_Output(self, hero, "Info_Mod_Trador_Hi_A_03_01"); //Ich hörte bereits von deinem Kommen, so habe ich mich auf den Weg gemacht.

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	Info_AddChoice	(Info_Mod_Trador_Hi, "Was willst du von mir?", Info_Mod_Trador_Hi_B);
};

FUNC VOID Info_Mod_Trador_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_D_15_00"); //Nein.
	AI_Output(self, hero, "Info_Mod_Trador_Hi_D_03_01"); //Was habe ich dir getan? Sei doch nicht so störrisch.

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	Info_AddChoice	(Info_Mod_Trador_Hi, "Ich glaube, ich gehe lieber.", Info_Mod_Trador_Hi_E);
	Info_AddChoice	(Info_Mod_Trador_Hi, "Ich bin ...", Info_Mod_Trador_Hi_C);
};

FUNC VOID Info_Mod_Trador_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_C_15_00"); //Ich bin ...
	AI_Output(self, hero, "Info_Mod_Trador_Hi_C_03_01"); //Mich interessiert nicht, wer du bist, sondern eher, was du hier zu suchen hast.

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	Info_AddChoice	(Info_Mod_Trador_Hi, "Ich bringe Genn giftige Pflanzen, die hier wachsen.", Info_Mod_Trador_Hi_G);
	Info_AddChoice	(Info_Mod_Trador_Hi, "Warum sollte ich dir das erzählen?", Info_Mod_Trador_Hi_F);
};

FUNC VOID Info_Mod_Trador_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_E_15_00"); //Ich glaube, ich gehe lieber.
	AI_Output(self, hero, "Info_Mod_Trador_Hi_E_03_01"); //Warte! Was machst du eigentlich hier?

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	Info_AddChoice	(Info_Mod_Trador_Hi, "Ich bringe Genn giftige Pflanzen, die hier wachsen.", Info_Mod_Trador_Hi_G);
	Info_AddChoice	(Info_Mod_Trador_Hi, "Warum sollte ich dir das erzählen?", Info_Mod_Trador_Hi_F);
};

FUNC VOID Info_Mod_Trador_Hi_G()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_G_15_00"); //Ich bringe Genn giftige Pflanzen, die hier wachsen.
	AI_Output(self, hero, "Info_Mod_Trador_Hi_G_03_01"); //Kann ich die Pflanzen mal sehen?

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	Info_AddChoice	(Info_Mod_Trador_Hi, "Nein, die sind für Genn.", Info_Mod_Trador_Hi_I);
	Info_AddChoice	(Info_Mod_Trador_Hi, "Ja, nimm.", Info_Mod_Trador_Hi_H);
};

FUNC VOID Info_Mod_Trador_Hi_F()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_F_15_00"); //Warum sollte ich dir das erzählen?
	AI_Output(self, hero, "Info_Mod_Trador_Hi_F_03_01"); //Du kannst mir vertrauen. Ich bin schließlich ein Verwandlungsmagier.

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	Info_AddChoice	(Info_Mod_Trador_Hi, "Dein Gesicht passt mir aber nicht.", Info_Mod_Trador_Hi_J);
	Info_AddChoice	(Info_Mod_Trador_Hi, "Ich bringe Genn giftige Pflanzen, die hier wachsen.", Info_Mod_Trador_Hi_G);
};

FUNC VOID Info_Mod_Trador_Hi_J()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_J_15_00"); //Dein Gesicht passt mir aber nicht.
	AI_Output(self, hero, "Info_Mod_Trador_Hi_J_03_01"); //Beurteilst du Menschen immer nach ihrem Aussehen? Komm schon.

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	Info_AddChoice	(Info_Mod_Trador_Hi, "Ich denke, ich erzähle es dir nicht.", Info_Mod_Trador_Hi_O);
	Info_AddChoice	(Info_Mod_Trador_Hi, "Ich bringe Genn giftige Pflanzen, die hier wachsen.", Info_Mod_Trador_Hi_G);
};

FUNC VOID Info_Mod_Trador_Hi_I()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_I_15_00"); //Nein, die sind für Genn.
	AI_Output(self, hero, "Info_Mod_Trador_Hi_I_03_01"); //Ich bitte dich, für Genn kannst du doch neue Pflanzen suchen.
	AI_Output(self, hero, "Info_Mod_Trador_Hi_I_03_02"); //Ich kann dir diese Kräuter anbieten, sie sehen genauso aus wie die giftigen, sind aber vollkommen harmlos. Die kannst du Genn geben.
	AI_Output(hero, self, "Info_Mod_Trador_Hi_I_15_03"); //Was habe ich davon?
	AI_Output(self, hero, "Info_Mod_Trador_Hi_I_03_04"); //Sagen wir – 200 Goldmünzen?

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	Info_AddChoice	(Info_Mod_Trador_Hi, "Okay.", Info_Mod_Trador_Hi_L);
	Info_AddChoice	(Info_Mod_Trador_Hi, "Das reicht nicht.", Info_Mod_Trador_Hi_K);
};

FUNC VOID Info_Mod_Trador_Hi_T()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_T_15_00"); //Was hat Furt mit der Sache zu tun?

	if (Mod_VMG_FaiceGifty_Gift == 13)
	{
		AI_Output(self, hero, "Info_Mod_Trador_Hi_T_03_01"); //Ich war nicht gerade erfreut, dass er gefasst wurde. Aber ich habe mir schon gedacht, dass du etwas damit zu tun hast. Du hast zu viel herum geschnüffelt.

		B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Dadurch, dass ich Furt ausgeliefert habe, ist sein Meister, der sich als Trador vorgestellt hat, auf mich aufmerksam geworden. Er sprach in Rätseln zu mir. Ich denke, ich sollte mit Genn darüber reden.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Trador_Hi_T_03_02"); //Nachdem du ihn hast laufen lassen, ist er zu mir gekommen. Das war ziemlich leichtsinnig von dir.

		B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Nachdem ich Furt habe laufen lassen, ist er wohl zu seinem Meister gerannt, der sich als Trador vorgestellt hat. Vielleicht war das ein Fehler von mir. Er sprach in Rätseln zu mir. Ich denke, ich sollte mit Genn darüber reden.");
	};

	AI_Output(self, hero, "Info_Mod_Trador_Hi_T_03_03"); //Aber du wirst wohl nie erfahren, warum Faice sterben sollte. Adieu!

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	AI_Teleport	(self, "TOT");
};

FUNC VOID Info_Mod_Trador_Hi_R()
{
	AI_Output(self, hero, "Info_Mod_Trador_Hi_R_03_00"); //Danke, du Trottel! Die Pflanzen siehst du nie wieder! (lacht)

	if (Mod_VMG_FaiceGifty_Gift == 13)
	{
		AI_Output(self, hero, "Info_Mod_Trador_Hi_R_03_01"); //Das hast du jetzt davon, dass du Furt ausgeliefert hast!
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Trador_Hi_R_03_02"); //Furt hatte Recht, du bist wirklich leichtsinnig!
	};

	Mod_VMG_Giftpflanzen = 5;

	AI_Output(hero, self, "Info_Mod_Trador_Hi_R_15_03"); //Du mieser Hund!

	Info_Mod_Trador_Hi_T();
};

FUNC VOID Info_Mod_Trador_Hi_S()
{
	AI_Output(self, hero, "Info_Mod_Trador_Hi_S_03_00"); //Du machst mich noch wahnsinnig!

	if (Mod_VMG_FaiceGifty_Gift == 13)
	{
		AI_Output(self, hero, "Info_Mod_Trador_Hi_S_03_01"); //Aber ich habe schon erwartet, dass du hartnäckig bist, nachdem du Furt überführt hast.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Trador_Hi_S_03_02"); //Aber Furt hat schon erzählt, dass du hartnäckig sein könntest.
	};

	Mod_VMG_Giftpflanzen = 6;

	Info_Mod_Trador_Hi_T();
};

FUNC VOID Info_Mod_Trador_Hi_H()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_H_15_00"); //Ja, nimm.

	Npc_RemoveInvItems	(hero, ItPl_Mushroom_04, 1);
	Npc_RemoveInvItems	(hero, ItPl_Mithrida, 1);
	Npc_RemoveInvItems	(hero, ItPl_Piante, 1);
	Npc_RemoveInvItems	(hero, ItPl_Ponzola, 1);
	Npc_RemoveInvItems	(hero, ItPl_Venena, 1);

	B_ShowGivenThings	("Pflanzen gegeben");

	Info_Mod_Trador_Hi_R();
};

FUNC VOID Info_Mod_Trador_Hi_L()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_L_15_00"); //Okay.

	Npc_RemoveInvItems	(hero, ItPl_Mushroom_04, 1);
	Npc_RemoveInvItems	(hero, ItPl_Mithrida, 1);
	Npc_RemoveInvItems	(hero, ItPl_Piante, 1);
	Npc_RemoveInvItems	(hero, ItPl_Ponzola, 1);
	Npc_RemoveInvItems	(hero, ItPl_Venena, 1);

	B_ShowGivenThings	("Pflanzen gegeben");

	Info_Mod_Trador_Hi_R();
};

FUNC VOID Info_Mod_Trador_Hi_K()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_K_15_00"); //Das reicht nicht.
	AI_Output(self, hero, "Info_Mod_Trador_Hi_K_03_01"); //500 – Mein letztes Angebot.

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	Info_AddChoice	(Info_Mod_Trador_Hi, "Okay.", Info_Mod_Trador_Hi_L);
	Info_AddChoice	(Info_Mod_Trador_Hi, "Das reicht nicht.", Info_Mod_Trador_Hi_M);
};

FUNC VOID Info_Mod_Trador_Hi_M()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_M_15_00"); //Das reicht nicht.
	AI_Output(self, hero, "Info_Mod_Trador_Hi_M_03_01"); //1000. Und keine Münze mehr!

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	Info_AddChoice	(Info_Mod_Trador_Hi, "Okay.", Info_Mod_Trador_Hi_L);
	Info_AddChoice	(Info_Mod_Trador_Hi, "Hm, mehr wäre nicht schlecht.", Info_Mod_Trador_Hi_N);
};

FUNC VOID Info_Mod_Trador_Hi_N()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_N_15_00"); //Hm, mehr wäre nicht schlecht.

	Info_Mod_Trador_Hi_S();
};

FUNC VOID Info_Mod_Trador_Hi_O()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_O_15_00"); //Ich denke, ich erzähle es dir nicht.
	AI_Output(self, hero, "Info_Mod_Trador_Hi_O_03_01"); //Warum? Habe ich dir etwas getan? Ich muss das für eine wichtige ... Studie wissen.

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	Info_AddChoice	(Info_Mod_Trador_Hi, "Was für eine Studie?", Info_Mod_Trador_Hi_P);
	Info_AddChoice	(Info_Mod_Trador_Hi, "Ich bringe Genn giftige Pflanzen, die hier wachsen.", Info_Mod_Trador_Hi_G);
};

FUNC VOID Info_Mod_Trador_Hi_P()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_P_15_00"); //Was für eine Studie?
	AI_Output(self, hero, "Info_Mod_Trador_Hi_P_03_01"); //Über die ... Gewohnheiten der anderen Mitglieder, ja.

	Info_ClearChoices	(Info_Mod_Trador_Hi);

	Info_AddChoice	(Info_Mod_Trador_Hi, "Ich glaube dir kein Wort.", Info_Mod_Trador_Hi_Q);
	Info_AddChoice	(Info_Mod_Trador_Hi, "Ich bringe Genn giftige Pflanzen, die hier wachsen.", Info_Mod_Trador_Hi_G);
};

FUNC VOID Info_Mod_Trador_Hi_Q()
{
	AI_Output(hero, self, "Info_Mod_Trador_Hi_Q_15_00"); //Ich glaube dir kein Wort.

	Info_Mod_Trador_Hi_S();
};

INSTANCE Info_Mod_Trador_Teleport (C_INFO)
{
	npc		= Mod_7352_OUT_Trador_TUG;
	nr		= 1;
	condition	= Info_Mod_Trador_Teleport_Condition;
	information	= Info_Mod_Trador_Teleport_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Trador_Teleport_Condition()
{
	if (Mod_VMG_WSTrador == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Trador_Teleport_Info()
{
	AI_Output(self, hero, "Info_Mod_Trador_Teleport_03_00"); //Was, du hier? Du solltest eigentlich ganz woanders sein!

	Info_ClearChoices	(Info_Mod_Trador_Teleport);

	Info_AddChoice	(Info_Mod_Trador_Teleport, "Ich bringe dich um!", Info_Mod_Trador_Teleport_B);
	Info_AddChoice	(Info_Mod_Trador_Teleport, "Was ist hier los?", Info_Mod_Trador_Teleport_A);
};

FUNC VOID Info_Mod_Trador_Teleport_C()
{
	AI_Output(self, hero, "Info_Mod_Trador_Teleport_C_03_00"); //(lacht) Du hast keine Chance. Ich werde mir einfach ein paar Golems beschwören und sie auf dich hetzen. In der Zeit kann ich seelenruhig abhauen.
	AI_Output(hero, self, "Info_Mod_Trador_Teleport_C_15_01"); //So weit lasse ich es nicht kommen.
	AI_Output(self, hero, "Info_Mod_Trador_Teleport_C_03_02"); //Was willst du denn dagegen tun, hm?

	Info_ClearChoices	(Info_Mod_Trador_Teleport);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Trador_Teleport_B()
{
	AI_Output(hero, self, "Info_Mod_Trador_Teleport_B_15_00"); //Ich bringe dich um!

	Info_Mod_Trador_Teleport_C();
};

FUNC VOID Info_Mod_Trador_Teleport_A()
{
	AI_Output(hero, self, "Info_Mod_Trador_Teleport_A_15_00"); //Was ist hier los?
	AI_Output(self, hero, "Info_Mod_Trador_Teleport_A_03_01"); //Ich habe das Portal beschädigt, damit du in diesem einsamen Tal bei den beiden armen Leuten landest, die schon einmal unsere Pläne durchkreuzen wollten.
	AI_Output(hero, self, "Info_Mod_Trador_Teleport_A_15_02"); //Du mieses Schwein! Das wirst du büßen!

	Info_Mod_Trador_Teleport_C();
};

INSTANCE Info_Mod_Trador_Buff (C_INFO)
{
	npc		= Mod_7352_OUT_Trador_TUG;
	nr		= 1;
	condition	= Info_Mod_Trador_Buff_Condition;
	information	= Info_Mod_Trador_Buff_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Trador_Buff_Condition()
{
	if (Mod_VMG_WSTrador == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Trador_Buff_Info()
{
	AI_Output(self, hero, "Info_Mod_Trador_Buff_03_00"); //Was ...? Was soll das werden?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Trador_Setta (C_INFO)
{
	npc		= Mod_7352_OUT_Trador_TUG;
	nr		= 1;
	condition	= Info_Mod_Trador_Setta_Condition;
	information	= Info_Mod_Trador_Setta_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Trador_Setta_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Buff_TUG_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Trador_Setta_Info()
{
	AI_Output(self, hero, "Info_Mod_Trador_Setta_03_00"); //Arghhh ...
	AI_Output(hero, self, "Info_Mod_Trador_Setta_15_01"); //Jetzt bekommst du volles Pfund aufs Maul!
	AI_Output(self, hero, "Info_Mod_Trador_Setta_03_02"); //Kampflos werde ich mich nicht ergeben!

	AI_StopProcessInfos	(self);

	Wld_SpawnNpcRange (self, StoneGolem, 2, 1000);
};

INSTANCE Info_Mod_Trador_EXIT (C_INFO)
{
	npc		= Mod_7352_OUT_Trador_TUG;
	nr		= 1;
	condition	= Info_Mod_Trador_EXIT_Condition;
	information	= Info_Mod_Trador_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Trador_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Trador_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};