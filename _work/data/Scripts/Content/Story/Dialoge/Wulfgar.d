INSTANCE Info_Mod_Wulfgar_Hey (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Hey_Condition;
	information	= Info_Mod_Wulfgar_Hey_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin neu hier.";
};

FUNC INT Info_Mod_Wulfgar_Hey_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wulfgar_Hey_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Hey_15_00"); //Ich bin neu hier.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hey_04_01"); //Das sehe ich. Wenn Cyrco dich in den Rang der Waldläufer aufgenommen hat, werde ich mit dir handeln.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hey_04_02"); //Ich habe hier einige Spruchrollen und Tränke, die bestimmt interessant sind für dich.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hey_04_03"); //Außerdem kann ich dir helfen deine magische Kraft zu steigern.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_WALDIS, LOG_NOTE);
	Log_CreateTopic	(TOPIC_MOD_LEHRER_WALDIS, LOG_NOTE);
	B_LogEntry_More	(TOPIC_MOD_HAENDLER_WALDIS, TOPIC_MOD_LEHRER_WALDIS, "Wulfgar kann mir Tränke und Spruchrollen verkaufen.", "Wulfgar kann mir helfen mein MANA zu erhöhen.");
};

INSTANCE Info_Mod_Wulfgar_Hi (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Hi_Condition;
	information	= Info_Mod_Wulfgar_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, ich habe eine Nachricht für dich.";
};

FUNC INT Info_Mod_Wulfgar_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_NovizePass))
	&& (Npc_HasItems(hero, ItWr_NovizeJGPass) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Hi_15_00"); //Hier, ich habe eine Nachricht für dich.

	B_GiveInvItems	(hero, self, ItWr_NovizeJGPass, 1);
	Npc_RemoveInvItems	(self, ItWr_NovizeJGPass, 1);

	AI_Output(hero, self, "Info_Mod_Wulfgar_Hi_15_01"); //Kannst du was mit diesem Namen anfangen?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hi_04_02"); //Lasst mich mal sehen.

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_Wulfgar_Hi_04_03"); //Ja, der Name kommt mir bekannt vor. Ich werde nachsehen, was ich über ihn finden kann.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hi_04_04"); //Komm später wieder, wenn ich meine Recherchen abgeschlossen habe.

	B_LogEntry	(TOPIC_MOD_JG_BANDITENSCHULD, "Endlich eine Pause.");
	B_SetTopicStatus	(TOPIC_MOD_JG_BANDITENSCHULD, LOG_SUCCESS);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Wulfgar_Turm (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Turm_Condition;
	information	= Info_Mod_Wulfgar_Turm_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du wolltest mich ...";
};

FUNC INT Info_Mod_Wulfgar_Turm_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Turm))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Turm_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_00"); //Du wolltest mich ...
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_01"); //Ei, gewiss. Höre: Ich habe einiges über diesen Khorgor herausgefunden.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_02"); //Ich höre.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_03"); //Dieser Magier war früher ein hochgestelltes Mitglied bei den Wassermagiern.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_04"); //Ist offensichtlich vom Pfad des Gleichgewichts, den diese Leute verkörpern, abgekommen.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_05"); //Was mich wundert, da man ihm eine Schwäche für das Meer und das Wasser überhaupt nachsagt.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_06"); //Was kann das bedeuten? Siehst du einen Anhaltspunkt ?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_07"); //Gewiss. Hier in der Nähe ist doch diese Burgruine. Ihr unterer Eingang mündet direkt an der See.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_08"); //Dort könntest du ihn finden, meine ich.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_09"); //Aber Vorsicht. Er ist sehr mächtig geworden, scheint mir.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_10"); //Wahrscheinlich schwarze Magie, glaubt Cyrco.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_11"); //Das kann gut sein.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_12"); //Und wo genau ...
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_13"); //Nach Westen, entlang der Klippe. Wenn du den Wachturm hochkletterst, kannst du ihn sehen. Ist nicht zu verfehlen.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_14"); //Ach, du meinst den Nebelturm. Da war ich schon mal. Xardas hat mich hingeschickt.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_15"); //Xardas? Der Schwarzmagier?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_16"); //Genau der. Er suchte eine mächtige Waffe ...
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_17"); //Dann lass dich nicht aufhalten.

	Log_CreateTopic	(TOPIC_MOD_JG_TURM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_TURM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_TURM, "Aha. Ein verkappter Wassermagier könnte dieser Khorgor sein. Ich soll mal beim Nebelturm nachschauen.");
};

INSTANCE Info_Mod_Wulfgar_Turm2 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Turm2_Condition;
	information	= Info_Mod_Wulfgar_Turm2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tschuldigung. Ich hab was Neues.";
};

FUNC INT Info_Mod_Wulfgar_Turm2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Turm2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Turm2_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm2_15_00"); //Tschuldigung. Ich hab was Neues.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm2_04_01"); //Ja? Erzähl.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm2_15_02"); //Ich traf im Turm wieder auf den Suchenden. Er ist mir aber wieder entwischt.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm2_04_03"); //Bei Adanos! So kommen wir nicht weiter.

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_JG_TURM, LOG_SUCCESS);
};

INSTANCE Info_Mod_Wulfgar_Key (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Key_Condition;
	information	= Info_Mod_Wulfgar_Key_Info;
	permanent	= 0;
	important	= 0;
	description	= "Aber ich habe dort einen Schlüssel gefunden.";
};

FUNC INT Info_Mod_Wulfgar_Key_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Turm2))
	&& (Npc_HasItems(hero, ItKe_SuchenderJG) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Key_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_00"); //Aber ich habe dort einen Schlüssel gefunden.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_01"); //Zeig her.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_02"); //Hier.

	B_GiveInvItems	(hero, self, ItKe_SuchenderJG, 1);

	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_03"); //Ein seltsamer Bart ist das. Und oben verschnörkelt.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_04"); //Hm ... ein besonderer Schlüssel ... hm ...
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_05"); //Die Truhe dazu dürfte schwer zu finden sein.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_06"); //Xardas hat mir was von magischen Orten erzählt. Einer davon soll der Stonehege sein.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_07"); //Und dort sind auch Truhen, die mit dem Dietrich nicht zu öffnen ist.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_08"); //Woher weißt du?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_09"); //Ich war schon drin. In einer anderen Sache.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_10"); //Das könnte durchaus sein. Schau, was in der Truhe ist. Wir müssen das wissen.

	B_GiveInvItems	(self, hero, ItKe_SuchenderJG, 1);

	B_GivePlayerXP	(150);

	Log_CreateTopic	(TOPIC_MOD_JG_KEY, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_KEY, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_KEY, "Ich werde den Schlüssel bei den Truhen im Stonehege ausprobieren. Vielleicht hab ich Glück.");
};

INSTANCE Info_Mod_Wulfgar_Key2 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Key2_Condition;
	information	= Info_Mod_Wulfgar_Key2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bin zurück. Der Schlüssel hat gepasst.";
};

FUNC INT Info_Mod_Wulfgar_Key2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Key))
	&& (Npc_HasItems(hero, ItWr_TruhenScrollJG) == 1)
	&& (Npc_HasItems(hero, ItWr_TruhenNotizJG) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Key2_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_00"); //Bin zurück. Der Schlüssel hat gepasst.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_01"); //Und was hast du gefunden?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_02"); //Weiß ich auch nicht so recht. Eine Spruchrolle, die man nicht benutzen kann, einen Zettel, den man nicht lesen kann und ein bisschen was um Ansparen ...
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_03"); //Zeig her.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_04"); //Hier. Rolle und Nachricht.

	Npc_RemoveInvItems	(hero, ItWr_TruhenNotizJG, 1);
	Npc_RemoveInvItems	(hero, ItWr_TruhenScrollJG, 1);

	B_ShowGivenThings	("Geheimnisvolle Spruchrolle und Nachricht gegeben");

	B_UseFakeScroll();

	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_05"); //Und?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_06"); //Geduld! Hmm. Das scheint mir eine der ganz alten Sprachen zu sein. Kann sie selbst nicht lesen ...
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_07"); //Dann war der Schlüssel umsonst?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_08"); //Gemach! Vielleicht können da die Wassermagier weiterhelfen.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_09"); //Die studieren doch bei der Ausgrabungsstelle alte Geschichte.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_10"); //Gewiss. Wir sind sogar schon durch in einen neuen Ort. Irgendwo im Nordwesten der Insel.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_11"); //Davon musst du mir gelegentlich mehr erzählen.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_12"); //Mach ich. Frage erst mal bei Saturas nach. Bis später.

	CreateInvItems	(hero, ItWr_TruhenNotizJG, 1);
	CreateInvItems	(hero, ItWr_TruhenScrollJG, 1);

	B_ShowGivenThings	("Geheimnisvolle Spruchrolle und Nachricht erhalten");

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_JG_KEY, LOG_SUCCESS);
	Log_CreateTopic	(TOPIC_MOD_JG_SCROLL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_SCROLL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_SCROLL, "Eine neue Sprache. Saturas oder Riordian sollten das kennen.");
};

INSTANCE Info_Mod_Wulfgar_Opferschale (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Opferschale_Condition;
	information	= Info_Mod_Wulfgar_Opferschale_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Opferschale_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Opferschale))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Opferschale_Info()
{
	AI_Output(self, hero, "Info_Mod_Wulfgar_Opferschale_04_00"); //Was gibt's?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Opferschale_15_01"); //Ich suche die Opferschale.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Opferschale_04_02"); //Welche Opferschale?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Opferschale_15_03"); //Na DIE. Mehr weiß ich auch nicht.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Opferschale_04_04"); //Hm. Bei Adanos! Khorinis ist groß. Hast du keinen Anhaltspunkt?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Opferschale_15_05"); //Nun, eine alte Spruchrolle verspricht Hilfe in höchster Not. Dazu brauche ich die Opferschale.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Opferschale_04_06"); //Keine Ahnung. Ich schau mal in meine Bücher. Wird ein paar Tage dauern.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Opferschale_15_07"); //Und ich nach neuen Leuten ...

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_JG_OPFERSCHALE, "Cyrco und Wulfgar wissen nichts über die Schale. Wulfgar will in den Büchern nachlesen. Wird ein paar Tage dauern.");
};

INSTANCE Info_Mod_Wulfgar_Felle (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle_Condition;
	information	= Info_Mod_Wulfgar_Felle_Info;
	permanent	= 0;
	important	= 0;
	description	= "Noch was. Torgan hat mir erzählt, dass du die Felle anders als sonst bearbeitest.";
};

FUNC INT Info_Mod_Wulfgar_Felle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Turm2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Torgan_WeicheFelle))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle_15_00"); //Noch was. Torgan hat mir erzählt, dass du die Felle anders als sonst bearbeitest.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle_04_01"); //(stolz) Wohl wahr. Sie werden dann nicht mehr so steif nach einiger Zeit.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle_04_02"); //Das eignet sich natürlich dann nicht mehr für Rüstungen und so.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle_15_03"); //Interessant! Und wie ...
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle_04_04"); //Komm mit. Ich zeig's dir.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GERBEN");
};

INSTANCE Info_Mod_Wulfgar_Felle2 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle2_Condition;
	information	= Info_Mod_Wulfgar_Felle2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Felle2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Felle))
	&& (Npc_GetDistToWP(self, "JL_15") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle2_Info()
{
	if (Npc_HasItems (self,ItMi_Scoop) == 0)
	{
		CreateInvItem (self,ItMi_Scoop);				
	};

	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"CAULDRON"))
	{
		AI_UseMob (self, "CAULDRON", 1);
	};

	AI_UseMob	(self, "CAULDRON", -1);

	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle2_04_00"); //Hoppla. Ich brauche neues Wasser.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle2_15_01"); //Aha. Und da soll ich jetzt ...
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle2_04_02"); //Ei gewiss. Am Besten bei der Landzunge, unten zwischen dem Turm und unserem Lager. Hier, nimm den Eimer mit.

	B_GiveInvItems	(self, hero, ItMi_Eimer, 1);

	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle2_15_03"); //Na gut.

	B_LogEntry	(TOPIC_MOD_JG_TURMFELLE, "Wulfgar will mir zeigen, wie man Felle richtig gerbt. Dazu soll ich Wasser von der Landzunge zwischen dem Lager und dem Nebelturm holen.");
};

INSTANCE Info_Mod_Wulfgar_Felle3 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle3_Condition;
	information	= Info_Mod_Wulfgar_Felle3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Felle3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Felle2))
	&& (Npc_GetDistToWP(self, "JL_15") < 300)
	&& (Npc_HasItems(hero, ItMi_EimerW) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle3_Info()
{
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle3_04_00"); //Ah. Da bist du ja. Her mit dem Wasser.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle3_15_01"); //Bitte, Meister. Und jetzt?

	B_GiveInvItems	(hero, self, ItMi_EimerW, 1);

	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle3_04_02"); //Jetzt muss ich erst den Kessel anheizen. Du besorgst inzwischen paar Felle von den Jägern oben.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle3_15_03"); //Aha! Darf's was Besonderes sein?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle3_04_04"); //Wolf oder Warg ist gut.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle3_15_05"); //Ich eile.

	B_LogEntry	(TOPIC_MOD_JG_TURMFELLE, "Ich soll Felle vom Jägerlager holen und Wulfgar bringen. Wolf- oder Wargfell.");

	B_StartOtherRoutine	(self, "KOCHEN");
};

INSTANCE Info_Mod_Wulfgar_Felle4 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle4_Condition;
	information	= Info_Mod_Wulfgar_Felle4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jetzt aber ... Was hast du denn da alles zu machen?";
};

FUNC INT Info_Mod_Wulfgar_Felle4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baldur_Felle))
	&& (Npc_HasItems(hero, ItAt_Wolffur) >= 5)
	&& (Npc_HasItems(hero, ItAt_WargFur) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle4_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_00"); //Jetzt aber ... Was hast du denn da alles zu machen?

	Npc_RemoveInvItems	(hero, ItAt_Wolffur, 5);
	Npc_RemoveInvItems	(hero, ItAt_WargFur, 5);

	B_ShowGivenThings	("5 Wolf- und Wargfelle gegeben");

	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_01"); //Na gut, ich will's dir mal erklären.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_02"); //Man setzt einen grossen Kessel Salzwasser auf und gibt eine halbe Flasche Alraun und etwas Borax dazu.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_03"); //Das Ganze erwärmen und gut verrühren.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_04"); //Bis die Lake, so heißt diese unappetitliche Brühe jetzt, erhitzt ist, schabt man mit einem scharfen Messer Fleischreste, Muskeln und die Unterhaut aus dem Fell heraus und wäscht es gründlich.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_05"); //Du hättest Fleischer werden sollen.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_06"); //Ruhe. Wenn es innen  ganz sauber ist, kommt das Fell in den Kessel.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_07"); //Man walkt es dann öfters kräftig durch. Zwischendurch gebe ich etwas Fichten- oder Eichenrinde dazu.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_08"); //Dieser Sud verhindert, dass das Fell später hart wird.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_09"); //Nach zehn Stunden spanne ich Fell zum Trocknen auf den Rahmen.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_10"); //Bevor es ganz trocken ist, reibe ich es gründlich mit Moleratfett ein, damit es geschmeidig bleibt.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_11"); //Du siehst, es ist ein Haufen Arbeit.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_12"); //Bei Adanos! Wer soll das bezahlen?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_13"); //Hi, hi, hi. Wer's sich leisten kann. Aber du bekommst eines umsonst. Morgen ist es fertig.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_14"); //(erstaunt) Meister?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_15"); //Du hast schon viel für uns getan.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_16"); //Danke, bis morgen.

	B_LogEntry	(TOPIC_MOD_JG_TURMFELLE, "Der Druide schenkt mir ein Kuschelfell. Morgen ist es fertig.");

	Mod_JG_WulfgarFell_Day = Wld_GetDay();

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Wulfgar_Felle5 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle5_Condition;
	information	= Info_Mod_Wulfgar_Felle5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Felle5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Felle4))
	&& (Wld_GetDay() > Mod_JG_WulfgarFell_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle5_Info()
{
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle5_04_00"); //Endlich bist du wieder da. Dein Fell ist fertig. Hier hast du es.

	B_GiveInvItems	(self, hero, ItMi_Kuschelfell, 1);

	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle5_15_01"); //Danke. Sieht sehr weich aus.

	B_LogEntry	(TOPIC_MOD_JG_TURMFELLE, "Wulfgar hat mir jetzt das fertige Kuschelfell gegeben. Ich kann es jetzt zum Turmwächter bringen.");

	B_GivePlayerXP	(100);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Wulfgar_Khorgor (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Khorgor_Condition;
	information	= Info_Mod_Wulfgar_Khorgor_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Khorgor_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Khorgor))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Khorgor_Info()
{
	AI_Output(self, hero, "Info_Mod_Wulfgar_Khorgor_04_00"); //Ist das etwa dieser Khorgor?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Khorgor_15_01"); //Gewiss. War nicht einfach. Aber mit Hilfe eines Drachen konnte ich dieses Übel beseitigen.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Khorgor_04_02"); //Einen Drache, sagst du?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Khorgor_15_03"); //Ja. Ein Wasserdrache. Ein lieber Kerl, nachdem ich ihn vorm Verdursten gerettet habe.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Khorgor_04_04"); //Bei Adanos!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Wulfgar_Lernen_MANA (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Lernen_MANA_Condition;
	information	= Info_Mod_Wulfgar_Lernen_MANA_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will meine magischen Kräfte steigern.";
};

FUNC INT Info_Mod_Wulfgar_Lernen_MANA_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Hey))
	&& (hero.attribute[ATR_MANA_MAX]	<=	300)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Lernen_MANA_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Lernen_MANA_15_00"); //Ich will meine magischen Kräfte steigern.

	Info_ClearChoices	(Info_Mod_Wulfgar_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, DIALOG_BACK, Info_Mod_Wulfgar_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Wulfgar_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Wulfgar_Lernen_MANA_1);
};

FUNC VOID Info_Mod_Wulfgar_Lernen_MANA_BACK()
{
	if (hero.attribute[ATR_MANA_MAX] >= 300)
	{
		AI_Output(self, hero, "Info_Mod_Wulfgar_Lernen_MANA_BACK_04_01"); //Deine magischen Kenntnisse sind jetzt so gut, dass ich dir nichts mehr beibringen kann.
	};

	Info_ClearChoices	(Info_Mod_Wulfgar_Lernen_MANA);
};

FUNC VOID Info_Mod_Wulfgar_Lernen_MANA_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 300);

	Info_ClearChoices	(Info_Mod_Wulfgar_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, DIALOG_BACK, Info_Mod_Wulfgar_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Wulfgar_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Wulfgar_Lernen_MANA_1);
};

FUNC VOID Info_Mod_Wulfgar_Lernen_MANA_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 300);

	Info_ClearChoices	(Info_Mod_Wulfgar_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, DIALOG_BACK, Info_Mod_Wulfgar_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Wulfgar_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Wulfgar_Lernen_MANA_1);
};

INSTANCE Info_Mod_Wulfgar_Trade (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Trade_Condition;
	information	= Info_Mod_Wulfgar_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Wulfgar_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Hey))
	&& (Npc_KnowsInfo(hero, Info_Mod_Cyrco_BaalOrun))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Wulfgar_Pickpocket (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Pickpocket_Condition;
	information	= Info_Mod_Wulfgar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Wulfgar_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Wulfgar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);

	Info_AddChoice	(Info_Mod_Wulfgar_Pickpocket, DIALOG_BACK, Info_Mod_Wulfgar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Wulfgar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Wulfgar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Wulfgar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Wulfgar_EXIT (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_EXIT_Condition;
	information	= Info_Mod_Wulfgar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Wulfgar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wulfgar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};