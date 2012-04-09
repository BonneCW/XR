INSTANCE Info_Mod_Makanius_Hi (C_INFO)
{
	npc		= Mod_1874_HMG_Makanius_MT;
	nr		= 1;
	condition	= Info_Mod_Makanius_Hi_Condition;
	information	= Info_Mod_Makanius_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Makanius_Hi_Condition()
{
	if (Mod_TemplerBeiThorus == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Makanius_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Makanius_Hi_07_00"); //Endlich bist du aufgewacht. Du kannst froh sein, dass du noch lebst.
	AI_Output(hero, self, "Info_Mod_Makanius_Hi_15_01"); //Wer bist du und was ist geschehen?
	AI_Output(self, hero, "Info_Mod_Makanius_Hi_07_02"); //Ich bin Makanius, ein Heilungsmagier. Du hattest Glück. Als du vom Turm gestürzt bist, sind wir gerade ins Lager gekommen. Wir konnte deinen Sturz bremsen und deine Wunden heilen.
	AI_Output(hero, self, "Info_Mod_Makanius_Hi_15_03"); //Ich muss dringend Thorus sprechen. Ich habe ihm Wichtiges zu berichten.
	AI_Output(self, hero, "Info_Mod_Makanius_Hi_07_04"); //Das ist momentan nicht möglich. Thorus wurde von seinem Verwalter Bartholo gerufen. Anscheinend haben sich einige Buddler aufgelehnt.
	AI_Output(hero, self, "Info_Mod_Makanius_Hi_15_05"); //(aufgebracht) Wo sind sie hingegangen?
	AI_Output(self, hero, "Info_Mod_Makanius_Hi_07_06"); //Sie sind zu der Molerathöhle nahe der Brücke gegangen. Anscheinend haben sich die Buddler dort versammelt.
	AI_Output(hero, self, "Info_Mod_Makanius_Hi_15_07"); //Ich muss da sofort hin., Bartholo ist ein Verräter.
	AI_Output(self, hero, "Info_Mod_Makanius_Hi_07_08"); //Was? Ich werde mitkommen. Alleine wird es dir in deiner Verfassung kaum möglich sein, dich einem Kampf zu stellen.
	AI_Output(self, hero, "Info_Mod_Makanius_Hi_07_09"); //Folge mir, ich bring dich zur Höhle.

	self.aivar[AIV_PARTYMEMBER] = TRUE;

	B_LogEntry	(TOPIC_MOD_AL_SCHMUGGLER, "Der Heilungsmagier Makanius hat mir das Leben gerettet. Er hat mir auch berichtet, dass Bartholo Thorus zur Molerathöhle nahe der Brücke gelockt hat. Ich muss sofort dorthin und Thorus warnen.");

	hero.flags = 0;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETOTHORUS");
};

INSTANCE Info_Mod_Makanius_Falle (C_INFO)
{
	npc		= Mod_1874_HMG_Makanius_MT;
	nr		= 1;
	condition	= Info_Mod_Makanius_Falle_Condition;
	information	= Info_Mod_Makanius_Falle_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Makanius_Falle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Makanius_Hi))
	&& (Npc_GetDistToWP(self, "WP_MT_FALLE_04") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Makanius_Falle_Info()
{
	AI_Output(self, hero, "Info_Mod_Makanius_Falle_07_00"); //Das sieht nicht gut aus.

	self.aivar[AIV_PARTYMEMBER] = TRUE;

	AI_GotoWP	(self, "SPAWN_OW_MOLERAT_CAVE1_OC");
	AI_PlayAni	(self, "T_PLUNDER");
	AI_GotoWP	(self, "WP_MT_FALLE_02");
	AI_PlayAni	(self, "T_PLUNDER");
	AI_GotoWP	(self, "WP_MT_FALLE_04");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Makanius_ThorusTot (C_INFO)
{
	npc		= Mod_1874_HMG_Makanius_MT;
	nr		= 1;
	condition	= Info_Mod_Makanius_ThorusTot_Condition;
	information	= Info_Mod_Makanius_ThorusTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Makanius_ThorusTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Makanius_Falle))
	&& (Npc_GetDistToWP(self, "WP_MT_FALLE_04") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Makanius_ThorusTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Makanius_ThorusTot_07_00"); //Für Thorus konnte ich nichts mehr tun, doch Alissandro scheint noch zu leben.

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "THORUSTOT");
};

INSTANCE Info_Mod_Makanius_AL (C_INFO)
{
	npc		= Mod_1874_HMG_Makanius_MT;
	nr		= 1;
	condition	= Info_Mod_Makanius_AL_Condition;
	information	= Info_Mod_Makanius_AL_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Makanius_AL_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_ThorusTot))
	&& (!Npc_IsInState(Mod_1870_EBR_Alissandro_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Makanius_AL_Info()
{
	AI_Output(self, hero, "Info_Mod_Makanius_AL_07_00"); //Ich werde zum Lager zurück gehen und vorgeben, mich Bartholo anzuschließen. Die anderen Heilungsmagier werden mir sicher folgen.
	
	AI_StopProcessInfos	(self);

	B_InitMonsterAttitudes ();

	B_StartOtherRoutine	(self, "ALTESLAGER");
};

INSTANCE Info_Mod_Makanius_KillMission (C_INFO)
{
	npc		= Mod_1874_HMG_Makanius_MT;
	nr		= 1;
	condition	= Info_Mod_Makanius_KillMission_Condition;
	information	= Info_Mod_Makanius_KillMission_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Makanius_KillMission_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_GotoJackal))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Makanius_KillMission_Info()
{
	AI_Output(self, hero, "Info_Mod_Makanius_KillMission_07_00"); //Schön dich zu sehen. Leider kannst du dich im Lager nicht frei bewegen, weswegen du nur im Haus der Magier sicher bist.
	AI_Output(self, hero, "Info_Mod_Makanius_KillMission_07_01"); //Wir können dir bei deinem Auftrag nicht helfen. Für Fragen wendest du dich an Jackal, er hält bei uns Wache.
	
	B_StartOtherRoutine	(self, "ALTESLAGER");
};

INSTANCE Info_Mod_Makanius_Eroberung_04 (C_INFO)
{
	npc		= Mod_1874_HMG_Makanius_MT;
	nr		= 1;
	condition	= Info_Mod_Makanius_Eroberung_04_Condition;
	information	= Info_Mod_Makanius_Eroberung_04_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Makanius_Eroberung_04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Eroberung_03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Makanius_Eroberung_04_Info()
{
	AI_Output(self, hero, "Info_Mod_Makanius_Eroberung_04_07_00"); //Wenn ihr im inneren Teil seid, gebe ich das Zeichen dafür, dass die Tore von den Spionen im alten Lager geöffnet werden.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Makanius_Eroberung_09 (C_INFO)
{
	npc		= Mod_1874_HMG_Makanius_MT;
	nr		= 1;
	condition	= Info_Mod_Makanius_Eroberung_09_Condition;
	information	= Info_Mod_Makanius_Eroberung_09_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Makanius_Eroberung_09_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Eroberung_08))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Makanius_Eroberung_09_Info()
{
	AI_Output(self, hero, "Info_Mod_Makanius_Eroberung_09_07_00"); //Einige von uns begleiten und unterstützen euch, während die anderen der königlichen Garde und den Banditen helfen.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Makanius_BartholosFlucht (C_INFO)
{
	npc		= Mod_1874_HMG_Makanius_MT;
	nr		= 1;
	condition	= Info_Mod_Makanius_BartholosFlucht_Condition;
	information	= Info_Mod_Makanius_BartholosFlucht_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Makanius_BartholosFlucht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_WacheTotWoBartholo))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Makanius_BartholosFlucht_Info()
{
	AI_Output(self, hero, "Info_Mod_Makanius_BartholosFlucht_07_00"); //Bartholo ist in die Kerker gelaufen. Wir müssen ihm folgen.
	
	B_LogEntry	(TOPIC_MOD_AL_EROBERUNG, "Makanius sagt, Bartholo floh in die Kerker. Wir müssen ihn verfolgen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTOKERKER");
	B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "FOLLOWTOKERKER");
};

INSTANCE Info_Mod_Makanius_Lockvogel (C_INFO)
{
	npc		= Mod_1874_HMG_Makanius_MT;
	nr		= 1;
	condition	= Info_Mod_Makanius_Lockvogel_Condition;
	information	= Info_Mod_Makanius_Lockvogel_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Makanius_Lockvogel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Lockvogel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Makanius_Lockvogel_Info()
{
	AI_Output(self, hero, "Info_Mod_Makanius_Lockvogel_07_00"); //(nervös) Oh, du bist da ...
	AI_Output(hero, self, "Info_Mod_Makanius_Lockvogel_15_01"); //Was soll dieser unsichere Tonfall? Alissandro meinte, du hättest einen Plan.
	AI_Output(self, hero, "Info_Mod_Makanius_Lockvogel_07_02"); //Ja, allerdings ... Er ist nur ziemlich unangenehm.

	Info_ClearChoices	(Info_Mod_Makanius_Lockvogel);

	Info_AddChoice	(Info_Mod_Makanius_Lockvogel, "Wie lautet er?", Info_Mod_Makanius_Lockvogel_B);
	Info_AddChoice	(Info_Mod_Makanius_Lockvogel, "Für dich oder für mich?", Info_Mod_Makanius_Lockvogel_A);
};

FUNC VOID Info_Mod_Makanius_Lockvogel_C()
{
	AI_Output(hero, self, "Info_Mod_Makanius_Lockvogel_C_15_00"); //Gut, dann machen wir das.
	AI_Output(self, hero, "Info_Mod_Makanius_Lockvogel_C_07_01"); //Jetzt sofort?
	AI_Output(hero, self, "Info_Mod_Makanius_Lockvogel_C_15_02"); //(ärgerlich) Wann sonst? Mach schon!
	AI_Output(self, hero, "Info_Mod_Makanius_Lockvogel_C_07_03"); //Muss das unbedingt ...

	AI_DrawWeapon	(hero);

	Info_ClearChoices	(Info_Mod_Makanius_Lockvogel);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Makanius_Lockvogel_B()
{
	AI_Output(hero, self, "Info_Mod_Makanius_Lockvogel_B_15_00"); //Wie lautet er?
	AI_Output(self, hero, "Info_Mod_Makanius_Lockvogel_B_07_01"); //Greif mich an an, dadurch lockst du einen der Wächter ins Haus. Schlag ihn nieder und nimm seine Rüstung.

	B_LogEntry	(TOPIC_MOD_AL_LOCKVOGEL, "Ich soll Makarius angreifen, den Wächter vor dem Magierhaus somit anlocken, ihn töten und die Rüstung abnehmen.");

	Info_Mod_Makanius_Lockvogel_C();
};

FUNC VOID Info_Mod_Makanius_Lockvogel_A()
{
	AI_Output(hero, self, "Info_Mod_Makanius_Lockvogel_A_15_00"); //Für dich oder für mich?
	AI_Output(self, hero, "Info_Mod_Makanius_Lockvogel_A_07_01"); //Für mich. Du kannst, was das angeht, unbesorgt sein.

	Info_Mod_Makanius_Lockvogel_B();
};

INSTANCE Info_Mod_Makanius_Armor (C_INFO)
{
	npc		= Mod_1874_HMG_Makanius_MT;
	nr		= 1;
	condition	= Info_Mod_Makanius_Armor_Condition;
	information	= Info_Mod_Makanius_Armor_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das hätten wir.";
};

FUNC INT Info_Mod_Makanius_Armor_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Makanius_Lockvogel))
	&& (Npc_HasItems(hero, ItAr_Raven_Addon) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Makanius_Armor_Info()
{
	AI_Output(hero, self, "Info_Mod_Makanius_Armor_15_00"); //Das hätten wir.
	AI_Output(self, hero, "Info_Mod_Makanius_Armor_07_01"); //Musstest du so fest zuschlagen?
	AI_Output(hero, self, "Info_Mod_Makanius_Armor_15_02"); //Bist du nun ein Heilmagier oder nicht?
	AI_Output(self, hero, "Info_Mod_Makanius_Armor_07_03"); //Sicher bin ich das. Wir kommen also zum nächsten Teil des Planes. Geh in das Haus der Erzbarone und triff dich mit Gomez.
	AI_Output(self, hero, "Info_Mod_Makanius_Armor_07_04"); //Lock ihn vor das Lager ... dann können unsere Leute ihn fertig machen.
	AI_Output(hero, self, "Info_Mod_Makanius_Armor_15_05"); //Ein Haufen Kämpfer für einen Mann? Ist das nicht etwas übertrieben?
	AI_Output(self, hero, "Info_Mod_Makanius_Armor_07_06"); //Gomez ist jetzt mit Beliar im Bunde Und nicht nur mehr ein starker Kämpfer sondern auch ein mächtiger Magier.
	AI_Output(self, hero, "Info_Mod_Makanius_Armor_07_07"); //Er ist nicht mehr der gierige Erzbaron als den du ihn schonmal besiegt hast.
	AI_Output(hero, self, "Info_Mod_Makanius_Armor_15_08"); //Verstehe.

	B_LogEntry	(TOPIC_MOD_AL_LOCKVOGEL, "Ich habe die Rüstung. Nun muss ich Gomez dazu überreden das Lager zu verlassen ... wenn er noch immer so stur ist wie damals könnte das interessant werden.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Makanius_Pickpocket (C_INFO)
{
	npc		= Mod_1874_HMG_Makanius_MT;
	nr		= 1;
	condition	= Info_Mod_Makanius_Pickpocket_Condition;
	information	= Info_Mod_Makanius_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Makanius_Pickpocket_Condition()
{
	C_Beklauen	(130, ItMi_Gold, 1300);
};

FUNC VOID Info_Mod_Makanius_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Makanius_Pickpocket);

	Info_AddChoice	(Info_Mod_Makanius_Pickpocket, DIALOG_BACK, Info_Mod_Makanius_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Makanius_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Makanius_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Makanius_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Makanius_Pickpocket);
};

FUNC VOID Info_Mod_Makanius_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Makanius_Pickpocket);
};

INSTANCE Info_Mod_Makanius_EXIT (C_INFO)
{
	npc		= Mod_1874_HMG_Makanius_MT;
	nr		= 1;
	condition	= Info_Mod_Makanius_EXIT_Condition;
	information	= Info_Mod_Makanius_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Makanius_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Makanius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};