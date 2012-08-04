INSTANCE Info_Mod_Sancho_Alissandro (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_Alissandro_Condition;
	information	= Info_Mod_Sancho_Alissandro_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich komme von Alissandro und habe eine Botschaft für euch.";
};

FUNC INT Info_Mod_Sancho_Alissandro_Condition()
{
	if (Npc_HasItems(hero, ItWr_AliBotschaft) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sancho_Alissandro_Info()
{
	AI_Output(hero, self, "Info_Mod_Sancho_Alissandro_15_00"); //Ich komme von Alissandro und habe eine Botschaft für euch.
	AI_Output(self, hero, "Info_Mod_Sancho_Alissandro_06_01"); //(noch gelangweilter) Falsches Passwort.

	B_StartOtherRoutine	(Mod_761_BDT_Dexter_MT, "EINGANG");
	AI_Teleport	(Mod_761_BDT_Dexter_MT, "LOCATION_06_04");

	self.aivar[AIV_PASSGATE] = TRUE;
};

INSTANCE Info_Mod_Sancho_GardistenInfos (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_GardistenInfos_Condition;
	information	= Info_Mod_Sancho_GardistenInfos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Sancho_GardistenInfos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_NochEinAuftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Torgan_GardistenZettel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sancho_GardistenInfos_Info()
{
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_06_01"); //Hi, was willst du?
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_15_02"); //Ich bin auf der Suche nach Informationen.
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_06_03"); //Das kostet dich eine Kleinigkeit.
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_15_04"); //Wieviel?
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_06_05"); //50 Gold.

	Info_ClearChoices	(Info_Mod_Sancho_GardistenInfos);

	Info_AddChoice	(Info_Mod_Sancho_GardistenInfos, "Das ist zuviel!", Info_Mod_Sancho_GardistenInfos_C);
	Info_AddChoice	(Info_Mod_Sancho_GardistenInfos, "50 Gold? Tun es nicht auch 20?", Info_Mod_Sancho_GardistenInfos_B);

	if (Npc_HasItems(hero, ItMi_Gold) > 49)
	{
		Info_AddChoice	(Info_Mod_Sancho_GardistenInfos, "Hier.", Info_Mod_Sancho_GardistenInfos_A);
	};
};

FUNC VOID Info_Mod_Sancho_GardistenInfos_C()
{
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_C_15_00"); //Das ist zuviel!
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_C_06_01"); //Dann verschwinde endlich!

	Info_ClearChoices	(Info_Mod_Sancho_GardistenInfos);
};

FUNC VOID Info_Mod_Sancho_GardistenInfos_B()
{
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_B_15_00"); //50 Gold? Tun es nicht auch 20?
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_B_06_01"); //Nun, weil du es bist sind es jetzt 80.

	Info_ClearChoices	(Info_Mod_Sancho_GardistenInfos);

	Info_AddChoice	(Info_Mod_Sancho_GardistenInfos, "Halsabschneider!", Info_Mod_Sancho_GardistenInfos_E);

	if (Npc_HasItems(hero, ItMi_Gold) > 79)
	{
		Info_AddChoice	(Info_Mod_Sancho_GardistenInfos, "Halsabschneider. (80 Gold geben)", Info_Mod_Sancho_GardistenInfos_D);
	};
};

FUNC VOID Info_Mod_Sancho_GardistenInfos_E()
{
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_E_15_00"); //Halsabschneider!
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_E_06_01"); //Dann verschwinde endlich!

	Info_ClearChoices	(Info_Mod_Sancho_GardistenInfos);
};

FUNC VOID Info_Mod_Sancho_GardistenInfos_D()
{
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_D_15_00"); //Halsabschneider.

	B_GiveInvItems	(hero, self, ItMi_Gold, 80);

	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_D_06_01"); //Oh, es fehlen noch 20 Gold. Tut mir echt leid, Kumpel, aber du musst dich verzählt haben.

	Info_ClearChoices	(Info_Mod_Sancho_GardistenInfos);

	Info_AddChoice	(Info_Mod_Sancho_GardistenInfos, "Das waren genau 80 Gold. Sag mir jetzt, was ich von dir wissen möchte!", Info_Mod_Sancho_GardistenInfos_G);

	if (Npc_HasItems(hero, ItMi_Gold) > 19)
	{
		Info_AddChoice	(Info_Mod_Sancho_GardistenInfos, "Hier nimm und sag mir was ich wissen möchte.", Info_Mod_Sancho_GardistenInfos_F);
	};
};

FUNC VOID Info_Mod_Sancho_GardistenInfos_G()
{
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_G_15_00"); //Das waren genau 80 Gold. Sag mir jetzt, was ich von dir wissen möchte!
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_G_06_01"); //Vergiss es, Kumpel. Zieh bloß Leine, bevor ich dir deinen unverschämten Schädel spalte!

	Info_ClearChoices	(Info_Mod_Sancho_GardistenInfos);

	Info_AddChoice	(Info_Mod_Sancho_GardistenInfos, "Das wirst du bereuen, du  verdammter Mistkerl!", Info_Mod_Sancho_GardistenInfos_I);
	Info_AddChoice	(Info_Mod_Sancho_GardistenInfos, "Wir sehen uns wieder.", Info_Mod_Sancho_GardistenInfos_H);
};

FUNC VOID Info_Mod_Sancho_GardistenInfos_I()
{
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_I_15_00"); //Das wirst du bereuen, du  verdammter Mistkerl!

	AI_DrawWeapon	(hero);

	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_I_06_01"); //Was?

	CreateInvItems	(self, ItWr_MagicPaper, 1);

	Info_ClearChoices	(Info_Mod_Sancho_GardistenInfos);

	Mod_SanchoKampfWegenZettel = 1;

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

FUNC VOID Info_Mod_Sancho_GardistenInfos_A()
{
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_A_15_00"); //Hier.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_A_06_01"); //Was möchtest du nun wissen?
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_A_15_02"); //Sind hier in letzter Zeit ein paar Gardisten aufgetaucht?
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_A_06_03"); //Zufällig ja.
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_A_15_04"); //Wo sind sie hingegangen?
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_A_06_05"); //Nirgendwo hin.
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_A_15_06"); //Also sind sie noch hier?
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_A_06_07"); //Im Prinzip ja.
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_A_15_08"); //Kann ich sie sprechen?
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_A_06_09"); //Nein.
	
	B_Say	(hero, self, "$WIESONICHT");

	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_A_06_11"); //Weil du dann erstmal bei 'nem Rudel Snapper anfangen müsstest ihre Einzelteile zu suchen.
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_A_15_12"); //Sie sind von Snappern getötet wurden?
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_A_06_13"); //Nein.
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_A_15_14"); //Wie jetzt? Du sagtest doch eben ...
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_A_06_15"); //... das sie von ihnen gefressen wurden! Getötet haben wir sie. (lacht dreckig)
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_A_15_16"); //Ah. Ist euch vielleicht was an ihnen aufgefallen oder hatten sie etwas dabei gehabt?
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_A_06_17"); //Niemand von uns hatte sie bisher im Minental gesehen, aber so ungewöhnlich ist das nun auch wieder nicht. Sie hatten einen Zettel bei sich gehabt.
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_A_15_18"); //Kann ich den Zettel mal sehen?
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_A_06_19"); //Natürlich. Das würde dich dann weitere 50 Gold kosten.


	Info_ClearChoices	(Info_Mod_Sancho_GardistenInfos);

	Info_AddChoice	(Info_Mod_Sancho_GardistenInfos, "Weitere 50 Gold? So langsam reicht es mir!", Info_Mod_Sancho_GardistenInfos_K);

	if (Npc_HasItems(hero, ItMi_Gold) > 49)
	{
		Info_AddChoice	(Info_Mod_Sancho_GardistenInfos, "Na gut, hier hast du das verdammte Gold. (50 Gold geben)", Info_Mod_Sancho_GardistenInfos_J);
	};
};

FUNC VOID Info_Mod_Sancho_GardistenInfos_H()
{
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_H_15_00"); //Wir sehen uns wieder.

	Info_ClearChoices	(Info_Mod_Sancho_GardistenInfos);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Sancho_GardistenInfos_F()
{
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_F_15_00"); //Hier nimm und sag mir was ich wissen möchte.

	B_GiveInvItems	(hero, self, ItMi_Gold, 20);

	Info_ClearChoices	(Info_Mod_Sancho_GardistenInfos);

	Info_Mod_Sancho_GardistenInfos_A();
};

FUNC VOID Info_Mod_Sancho_GardistenInfos_K()
{
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_K_15_00"); //Weitere 50 Gold? So langsam reicht es mir!
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_K_06_01"); //50 Gold oder lass es bleiben. Du möchtest den Zettel und ich habe ihn, mir ist es gleich.

	Info_ClearChoices	(Info_Mod_Sancho_GardistenInfos);

	Info_AddChoice	(Info_Mod_Sancho_GardistenInfos, "Es gibt auch noch eine dritte Möglichkeit ...", Info_Mod_Sancho_GardistenInfos_M);
	Info_AddChoice	(Info_Mod_Sancho_GardistenInfos, "Du bekommst von mir nichts mehr.", Info_Mod_Sancho_GardistenInfos_L);

	if (Npc_HasItems(hero, ItMi_Gold) > 49)
	{
		Info_AddChoice	(Info_Mod_Sancho_GardistenInfos, "Halsabschneider. (80 Gold geben)", Info_Mod_Sancho_GardistenInfos_J);
	};
};

FUNC VOID Info_Mod_Sancho_GardistenInfos_M()
{
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_M_15_00"); //Es gibt auch noch eine dritte Möglichkeit ...

	CreateInvItems	(self, ItWr_MagicPaper, 1);

	Mod_SanchoKampfWegenZettel = 1;

	Info_ClearChoices	(Info_Mod_Sancho_GardistenInfos);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

FUNC VOID Info_Mod_Sancho_GardistenInfos_L()
{
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_L_15_00"); //Du bekommst von mir nichts mehr. Die Informationen, die ich brauche, finde ich auch woanders.
	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_L_06_01"); //Na gut, hier nimm den Zettel. Ich kann ihn eh nicht lesen.

	B_GiveInvItems	(self, hero, ItWr_MagicPaper, 1);

	Mod_SanchoHatZettel = 2;

	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_L_06_02"); //Und jetzt lenk mich nicht weiter ab.

	Info_ClearChoices	(Info_Mod_Sancho_GardistenInfos);

	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Sancho hat mir einen Zettel gegeben, den die Gardisten bei sich hatten.");
};

FUNC VOID Info_Mod_Sancho_GardistenInfos_J()
{
	AI_Output(hero, self, "Info_Mod_Sancho_GardistenInfos_J_15_00"); //Na gut, hier hast du das verdammte Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_J_06_01"); //Na gut, hier nimm den Zettel. Ich kann ihn eh nicht lesen.

	B_GiveInvItems	(self, hero, ItWr_MagicPaper, 1);

	Mod_SanchoHatZettel = 2;

	AI_Output(self, hero, "Info_Mod_Sancho_GardistenInfos_J_06_02"); //Und jetzt lenk mich nicht weiter ab.

	Info_ClearChoices	(Info_Mod_Sancho_GardistenInfos);

	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Sancho hat mir einen Zettel gegeben, den die Gardisten bei sich hatten.");
};

INSTANCE Info_Mod_Sancho_Umgehauen (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_Umgehauen_Condition;
	information	= Info_Mod_Sancho_Umgehauen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Woher kommt dieser Zettel?";
};

FUNC INT Info_Mod_Sancho_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_GardistenInfos))
	&& (Mod_SanchoHatZettel	==	1)
	&& (Mod_SanchoKampfWegenZettel == 1)
	&& (self.aivar[AIV_LastPlayerAR] == AR_NONE)
	&& (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sancho_Umgehauen_Info()
{
	AI_Output(hero, self, "Info_Mod_Sancho_Umgehauen_15_00"); //Woher kommt dieser Zettel?
	AI_Output(self, hero, "Info_Mod_Sancho_Umgehauen_06_01"); //Au, du hast einen ganz schön harten Schlag drauf. Der kommt von ein paar Gardisten, die hier neulich vorbeigekommen sind.
	AI_Output(self, hero, "Info_Mod_Sancho_Umgehauen_06_02"); //Behalte ihn, ich kann ihn eh nicht gebrauchen. Und jetzt lass mich in Frieden.

	Mod_SanchoHatZettel = 2;

	// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
	self.aivar[AIV_ArenaFight] = AF_NONE;
		
	// ------ AIVAR resetten! ------	
	self.aivar[AIV_LastFightComment] = TRUE;
};

INSTANCE Info_Mod_Sancho_WasFuerLosung (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_WasFuerLosung_Condition;
	information	= Info_Mod_Sancho_WasFuerLosung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was für ein Losungswort?";
};

FUNC INT Info_Mod_Sancho_WasFuerLosung_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sancho_WasFuerLosung_Info()
{
	AI_Output(hero, self, "Info_Mod_Sancho_WasFuerLosung_15_00"); //Was für ein Losungswort?
	AI_Output(self, hero, "Info_Mod_Sancho_WasFuerLosung_06_01"); //(genervt) Das Losungswort, das es dir erlaubt ins Lager zu kommen, ohne dass du von mir und den Jungs drinnen ins Stücke gehackt wirst, du Einfallspinsel.
};

INSTANCE Info_Mod_Sancho_WasFuerLosung2 (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_WasFuerLosung2_Condition;
	information	= Info_Mod_Sancho_WasFuerLosung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und wo und wie soll ich das Losungswort bekommen?";
};

FUNC INT Info_Mod_Sancho_WasFuerLosung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_WasFuerLosung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sancho_WasFuerLosung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Sancho_WasFuerLosung2_15_00"); //Und wo und wie soll ich das Losungswort bekommen?
	AI_Output(self, hero, "Info_Mod_Sancho_WasFuerLosung2_06_01"); //Hey man, langsam gehst du mir auf die Nerven.
	AI_Output(self, hero, "Info_Mod_Sancho_WasFuerLosung2_06_02"); //Wenn du das verdammte Losungswort haben willst, wirst du unseren Jungs in Khorinis helfen müssen.
	AI_Output(self, hero, "Info_Mod_Sancho_WasFuerLosung2_06_03"); //Aber glaub bloß nicht, dass du einfach hingehen kannst und es bekommst.
	AI_Output(self, hero, "Info_Mod_Sancho_WasFuerLosung2_06_04"); //Falls sie mal wirklich irgendwann deine Hilfe benötigen werden, dann sprechen sie dich schon an.
	AI_Output(self, hero, "Info_Mod_Sancho_WasFuerLosung2_06_05"); //Und jetzt nerv mich nicht weiter.
};

INSTANCE Info_Mod_Sancho_Nek (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_Nek_Condition;
	information	= Info_Mod_Sancho_Nek_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sancho_Nek_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fingers_Nek3))
	&& (Npc_HasItems(hero, ItAm_Nek) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sancho_Nek_Info()
{
	AI_Output(self, hero, "Info_Mod_Sancho_Nek_06_00"); //(rau) Was suchst du hier?
	AI_Output(hero, self, "Info_Mod_Sancho_Nek_15_01"); //Ich habe Neks Amulett. Schau.

	B_GiveInvItems	(hero, self, ItAm_Nek, 1);

	AI_Output(self, hero, "Info_Mod_Sancho_Nek_06_02"); //Tatsache. Hier ist dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 350);

	B_GivePlayerXP	(200);

	B_SetTopicStatus	(TOPIC_MOD_FINGERS_NEK, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Sancho_Dam (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_Dam_Condition;
	information	= Info_Mod_Sancho_Dam_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe dir das Amulett gebracht.";
};

FUNC INT Info_Mod_Sancho_Dam_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_Nek))
	&& (Npc_KnowsInfo(hero, Info_Mod_Sancho_WasFuerLosung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sancho_Dam_Info()
{
	AI_Output(hero, self, "Info_Mod_Sancho_Dam_15_00"); //Ich habe dir das Amulett gebracht. Das sollte es doch wert sein, um ins Lager zu kommen.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_01"); //Du gibst einfach nicht locker, oder?
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_02"); //Ok, dann hätte ich einen Vorschlag für dich.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_03"); //Wenn du das hinbekommen solltest, dürften auch die anderen nichts dagegen haben, dass du in unser Lager darfst, selbst, wenn du noch nicht zu uns gehörst.
	AI_Output(hero, self, "Info_Mod_Sancho_Dam_15_04"); //Ich höre ...
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_05"); //Ok, du hast mir ja das Amulett gebracht. Weißt du, was es damit auf sich hat?
	AI_Output(hero, self, "Info_Mod_Sancho_Dam_15_06"); //Nun, es hat mal einem Gardisten Namens Nek gehört, der das Zeitliche gesegnet hat ...
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_07"); //Ha, und das glaubst du wirklich.
	AI_Output(hero, self, "Info_Mod_Sancho_Dam_15_08"); //Eigentlich ... ja .
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_09"); //Dann hör mal zu, Junge.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_10"); //Nicht er hat das Amulett mit seinem Namen gekennzeichnet ... sondern das Amulett ihn mit dessen Namen.
	AI_Output(hero, self, "Info_Mod_Sancho_Dam_15_11"); //Was?!
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_12"); //Das Amulett ist kein gewöhnliches Schutzamulett.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_13"); //Es gehört zu einer Gattung von Artefakten mit unglückseligen Eigenschaften.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_14"); //Das Nek-Amulett für seinen Teil ergreift mit der Zeit Besitz von seinem Träger ... und bringt ihm früher oder später den Tod.
	AI_Output(hero, self, "Info_Mod_Sancho_Dam_15_15"); //Was ...?! Aber das würde zumindest einiges erklären ...
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_16"); //Jedenfalls haben diese Stücke bei Schwarzmagiern und Okkultisten einen hohen Sammlerwert.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_17"); //Sie stammen aus einem verfluchten Moor in Relendel.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_18"); //Und dort muss sich auch noch der andere Teil des Amulettes befinden, der quasi die Rückseite des Nek-Amulettes darstellt ... zumindest hat es das.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_19"); //Nek war vor der Zeit in der Kolonie Schatzsucher im Moor ... und er erzählte einmal von einem anderen Amulett ...
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_20"); //Da er es jedoch nicht bei sich trug, könnte es noch dort sein.
	AI_Output(hero, self, "Info_Mod_Sancho_Dam_15_21"); //Und dieses soll ich jetzt finden.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam_06_22"); //Genau. Was sagst du?
};

INSTANCE Info_Mod_Sancho_Dam2 (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_Dam2_Condition;
	information	= Info_Mod_Sancho_Dam2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich besorge das Amulett.";
};

FUNC INT Info_Mod_Sancho_Dam2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_Dam))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sancho_Dam2_Info()
{
	AI_Output(hero, self, "Info_Mod_Sancho_Dam2_15_00"); //Ich besorge das Amulett.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam2_06_01"); //Gut. Der andere Teil ist das Dam-Amulett. Es bringt dem Träger Verdammnis.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam2_06_02"); //Dieses Set – Tod und Verdammnis – dürfte noch einen wesentlich höheren Wert haben, als die Einzelstücke.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam2_06_03"); //Wenn du es mir besorgst, wird sicher keiner mehr im Lager was dagegen haben, dass du im Lager vorbeischaust und mit unseren Jungs handelst ... wie auch immer.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam2_06_04"); //Gibt genug in unserem Lager, was von Wert und Nutzen ist.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam2_06_05"); //Hör dich am besten in der Schenke zur goldenen Gülle um, die beim Moor liegt.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam2_06_06"); //Alles klar? Ok. Dann mach dich auf den Weg.

	Log_CreateTopic	(TOPIC_MOD_SANCHO_DAM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SANCHO_DAM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SANCHO_DAM, "Wenn ich Sancho das Dam-Amulett bringe, darf ich in das Banditenlager. Er meinte, ich soll mich am besten in der Schenke zur goldenen Gülle umhören, die im verfluchten Moor in Relendel gelegen ist.");
};

INSTANCE Info_Mod_Sancho_Dam3 (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_Dam3_Condition;
	information	= Info_Mod_Sancho_Dam3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Dam-Amulett.";
};

FUNC INT Info_Mod_Sancho_Dam3_Condition()
{
	if (Npc_HasItems(hero, ItAm_Dam) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sancho_Dam3_Info()
{
	AI_Output(hero, self, "Info_Mod_Sancho_Dam3_15_00"); //Ich habe das Dam-Amulett.
	AI_Output(self, hero, "Info_Mod_Sancho_Dam3_06_01"); //(ungläubig) Was?! Kann nicht sein. Zeig her!

	B_GiveInvItems	(hero, self, ItAm_Dam, 1);

	AI_Output(self, hero, "Info_Mod_Sancho_Dam3_06_02"); //Tatsächlich. Das nenn ich mal saubere Arbeit. Hätte nicht gedacht, dass du das Moor überlebst.

	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Sancho_Dam3_06_03"); //Damit hast du dir den Einlass in unser Lager mehr als verdient ... auch, wenn du damit noch kein Bandit bist.
		AI_Output(self, hero, "Info_Mod_Sancho_Dam3_06_04"); //Aber da kann ich dir einen Tipp geben. Einer unserer Jungs hat sich in der Hafenstadt postiert.
		AI_Output(self, hero, "Info_Mod_Sancho_Dam3_06_05"); //Er hält nach fähigen und erfahrenen Männern Ausschau, solchen, die bereits einer großen Gilde angehören.
		AI_Output(self, hero, "Info_Mod_Sancho_Dam3_06_06"); //Aber sollte nicht grad die Stadtwache sein ...

		self.aivar[AIV_PASSGATE] = TRUE;
	};

	B_SetTopicStatus	(TOPIC_MOD_SANCHO_DAM, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Sancho_Parole (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_Parole_Condition;
	information	= Info_Mod_Sancho_Parole_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Losungswort sagen)";
};

FUNC INT Info_Mod_Sancho_Parole_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Senyan_HabSchwert))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sancho_Parole_Info()
{
	AI_Output(hero, self, "Info_Mod_Sancho_Parole_15_00"); //Dex-Ban.
	AI_Output(self, hero, "Info_Mod_Sancho_Parole_06_01"); //Gut, du darfst passieren.

	self.aivar[AIV_PASSGATE] = TRUE;
};

INSTANCE Info_Mod_Sancho_Asylanten (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_Asylanten_Condition;
	information	= Info_Mod_Sancho_Asylanten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was plant ihr so als nächstes?";
};

FUNC INT Info_Mod_Sancho_Asylanten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sancho_Asylanten_Info()
{
	AI_Output(hero, self, "Info_Mod_Sancho_Asylanten_15_00"); //Was plant ihr so als nächstes?
	AI_Output(self, hero, "Info_Mod_Sancho_Asylanten_06_01"); //(lacht) Das weißt du noch nicht?
	AI_Output(self, hero, "Info_Mod_Sancho_Asylanten_06_02"); //(vertraulich) Wir schleichen uns nachts an das Alte Lager heran, schalten die Wachen heimlich aus und stürmen dann die Burg.
	AI_Output(hero, self, "Info_Mod_Sancho_Asylanten_15_03"); //Tatsächlich?
	AI_Output(self, hero, "Info_Mod_Sancho_Asylanten_06_04"); //Für wie dumm hältst du mich, dass ich unsere Pläne ausplaudere?
	AI_Output(self, hero, "Info_Mod_Sancho_Asylanten_06_05"); //Soll ich mich gleich freiwillig in den Knast einweisen lassen?
	AI_Output(hero, self, "Info_Mod_Sancho_Asylanten_15_06"); //Aber ihr habt nicht vor, als nächstes nach Khorinis zu ziehen?
	AI_Output(self, hero, "Info_Mod_Sancho_Asylanten_06_07"); //Das lass mal unsere Sorge sein. (lacht) Aber ich sag dir Bescheid, wenn es so weit ist, Junge.
	AI_Output(self, hero, "Info_Mod_Sancho_Asylanten_06_08"); //(leise) Spinner.

	B_LogEntry	(TOPIC_MOD_HAGEN_ASYLANTEN, "Sancho will mir nicht verraten, was die Banditen vorhaben.");
};

const string Sancho_Checkpoint	= "SANCHO_DIST_CHECKPOINT";	//WP hinter City-Tor vom Spielstart aus!

instance Info_Mod_Sancho_FirstWarn (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_FirstWarn_Condition;
	information	= Info_Mod_Sancho_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_Sancho_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(hero, Sancho_Checkpoint) <= 500) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void Info_Mod_Sancho_FirstWarn_Info()
{
	if (Npc_HasItems(hero, ItWr_AliBotschaft) == 0)
	{
		AI_Output (self, hero,"Info_Mod_Sancho_FirstWarn_06_00"); //HALT! Niemand darf das Lager ohne Losungswort betreten.
	}
	else
	{
		AI_Output (self, hero,"Info_Mod_Sancho_FirstWarn_06_01"); //(gelangweilt) Passwort?
	};

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, Sancho_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_Sancho_SecondWarn (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_SecondWarn_Condition;
	information	= Info_Mod_Sancho_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Sancho_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_GetDistToWP(hero, Sancho_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50))) 
	{
		return TRUE;
	};
};

func void Info_Mod_Sancho_SecondWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_Sancho_SecondWarn_06_00"); //Ich sag's dir zum letzten Mal. Einen Schritt weiter und du begibst dich in die Welt des Schmerzes!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP (hero,Sancho_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_Sancho_Attack (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_Attack_Condition;
	information	= Info_Mod_Sancho_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Sancho_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
	&& (Npc_GetDistToWP(hero,Sancho_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50)))
	{
		return TRUE;
	};
};

func void Info_Mod_Sancho_Attack_Info()
{
	hero.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, hero,"Info_Mod_Sancho_Attack_06_00"); //Du hast es so gewollt ...

	AI_StopProcessInfos	(self);	

	B_Attack (self, hero, AR_GuardStopsIntruder, 0); 
};

INSTANCE Info_Mod_Sancho_Pickpocket (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_Pickpocket_Condition;
	information	= Info_Mod_Sancho_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Sancho_Pickpocket_Condition()
{
	C_Beklauen	(57, ItMi_Gold, 170);
};

FUNC VOID Info_Mod_Sancho_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sancho_Pickpocket);

	Info_AddChoice	(Info_Mod_Sancho_Pickpocket, DIALOG_BACK, Info_Mod_Sancho_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sancho_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sancho_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sancho_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sancho_Pickpocket);
};

FUNC VOID Info_Mod_Sancho_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Sancho_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Sancho_Pickpocket);

		Info_AddChoice	(Info_Mod_Sancho_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Sancho_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Sancho_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Sancho_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Sancho_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Sancho_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Sancho_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Sancho_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Sancho_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Sancho_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Sancho_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Sancho_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Sancho_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Sancho_EXIT (C_INFO)
{
	npc		= Mod_961_BDT_Sancho_MT;
	nr		= 1;
	condition	= Info_Mod_Sancho_EXIT_Condition;
	information	= Info_Mod_Sancho_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sancho_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sancho_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};