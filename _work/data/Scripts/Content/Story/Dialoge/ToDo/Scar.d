INSTANCE Info_Mod_Scar_Belagerung (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Belagerung_Condition;
	information	= Info_Mod_Scar_Belagerung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Zrobiles to przez Ciebie?";
};

FUNC INT Info_Mod_Scar_Belagerung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_Belagerung_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_Belagerung_15_00"); //Zrobiles to przez Ciebie?
	AI_Output(self, hero, "Info_Mod_Scar_Belagerung_10_01"); //Tak, wszystko jest w porzadku. Stracilismy lub zniszczylismy prawie cala bron w walce.
	AI_Output(hero, self, "Info_Mod_Scar_Belagerung_15_02"); //Czy moge Ci pomóc?
	AI_Output(self, hero, "Info_Mod_Scar_Belagerung_10_03"); //Jesli mnie pan zapyta, tak. W bibliotece znajduje sie pudelko z instrukcja jak wykonac stalowe sztabki bojowe.
	AI_Output(self, hero, "Info_Mod_Scar_Belagerung_10_04"); //Popros mnie o instrukcje dotyczace budynku. Ale wystrzegaj sie! Kilku nieumarlych nowicjuszy zakorzenilo sie tam!
	AI_Output(hero, self, "Info_Mod_Scar_Belagerung_15_05"); //Wszystkie sluszne, wszystkie sluszne.

	Wld_InsertNpc	(Mod_4009_UntoterNovize_10_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4010_UntoterNovize_11_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4011_UntoterNovize_12_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4012_UntoterNovize_13_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4013_UntoterNovize_14_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4014_UntoterNovize_15_MT, "LABYRINTH_71");

	Log_CreateTopic	(TOPIC_MOD_BEL_STAEBE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_STAEBE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Scar chce, abym wyprowadzil go z biblioteki wraz z instrukcja budowy stalowych pretów. Bede jednak uwazac na nieumarlych nowicjuszy.");
};

INSTANCE Info_Mod_Scar_TruheMage (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_TruheMage_Condition;
	information	= Info_Mod_Scar_TruheMage_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nie moge otworzyc tulowia.";
};

FUNC INT Info_Mod_Scar_TruheMage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scar_Belagerung))
	&& (BEL_TruheMage == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_TruheMage_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_TruheMage_15_00"); //Nie moge otworzyc tulowia. Wydaje sie, ze jest chroniona magia!
	AI_Output(self, hero, "Info_Mod_Scar_TruheMage_10_01"); //Shit, zapomnialem o tym. Myslalem, ze instrukcje budowlane sa chronione. Zwróccie sie do Gomeza, wie o tych rzeczach!

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Gomez bedzie mógl mi pomóc z zamknieta klatka piersiowa, mówi Scar. Mam nadzieje, ze ma racje.");
};

INSTANCE Info_Mod_Scar_HabBauanleitung (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_HabBauanleitung_Condition;
	information	= Info_Mod_Scar_HabBauanleitung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto instrukcje.";
};

FUNC INT Info_Mod_Scar_HabBauanleitung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_HabDietrich))
	&& (Npc_HasItems(hero, ItWr_StahlkampfAnleitung) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_HabBauanleitung_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_HabBauanleitung_15_00"); //Oto instrukcje. Mam nadzieje, ze bylo to warte wysilku.

	B_GiveInvItems	(hero, self, ItWr_StahlkampfAnleitung, 1);

	AI_Output(self, hero, "Info_Mod_Scar_HabBauanleitung_10_01"); //Dzieki. Oto nagroda.

	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	AI_Output(hero, self, "Info_Mod_Scar_HabBauanleitung_15_02"); //Dobrze, dziekuje.
	AI_Output(self, hero, "Info_Mod_Scar_HabBauanleitung_10_03"); //Bede teraz kute karabiny. Uzupelnij swoje zadania!

	B_GivePlayerXP	(800);

	B_LogEntry_More	(TOPIC_MOD_BEL_STAEBE, TOPIC_MOD_BEL_BELAGERUNG, "Przekazalem instrukcje budowlane Scar' owi i dostalem nagrode.", "Pomagalem teraz Scar' owi. Zobaczmy, czy ktos inny potrzebuje pomocy.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_STAEBE, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Scar_ToteNovizen (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_ToteNovizen_Condition;
	information	= Info_Mod_Scar_ToteNovizen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam do pana kilka pytan.";
};

FUNC INT Info_Mod_Scar_ToteNovizen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Abdi_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_ToteNovizen_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_ToteNovizen_15_00"); //Mam do pana kilka pytan.
	AI_Output(self, hero, "Info_Mod_Scar_ToteNovizen_10_01"); //Co o tym chodzi?
	AI_Output(hero, self, "Info_Mod_Scar_ToteNovizen_15_02"); //Dwóch z naszych nowicjuszy zostalo znalezionych zmarlych na dwie ostatnie noce. Musze znalezc zabójce, zanim dostanie kogos innego.
	AI_Output(hero, self, "Info_Mod_Scar_ToteNovizen_15_03"); //Widziales cos?
	AI_Output(self, hero, "Info_Mod_Scar_ToteNovizen_10_04"); //Tak, wczoraj wieczorem uslyszalem jakis rodzaj drzenia. Kiedy wyszedlem, nic nie bylo. To wszystko, co wiem.
	AI_Output(hero, self, "Info_Mod_Scar_ToteNovizen_15_05"); //Cóz, dziekuje za informacje.

	B_LogEntry	(TOPIC_MOD_BEL_DAEMON, "Scar uslyszal drzenie, ale kiedy wyszedl juz nie bylo widac.");
};

INSTANCE Info_Mod_Scar_Jagdtrophaeen_SollIch (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Jagdtrophaeen_SollIch_Condition;
	information	= Info_Mod_Scar_Jagdtrophaeen_SollIch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Myxir mówi, ze masz klopoty z mysliwym.";
};

FUNC INT Info_Mod_Scar_Jagdtrophaeen_SollIch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Scar))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_Jagdtrophaeen_SollIch_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_Jagdtrophaeen_SollIch_15_00"); //Myxir mówi, ze masz klopoty z mysliwym.
	AI_Output(self, hero, "Info_Mod_Scar_Jagdtrophaeen_SollIch_10_01"); //Z Bartokiem, prawda. Plotka mówi, ze przez caly dzien cieszyl sie czerwona latarnia.
	AI_Output(self, hero, "Info_Mod_Scar_Jagdtrophaeen_SollIch_10_02"); //Kto móglby mu winic? W obozie znajduja sie spizarnie dla zmarlych kobiet.
	AI_Output(self, hero, "Info_Mod_Scar_Jagdtrophaeen_SollIch_10_03"); //Nie zmieniaj jednak faktu, ze ktos musi znów przycinac rogi biegaczy cieni. W przeciwnym razie usadowie sie tutaj na suchej ziemi.
	AI_Output(self, hero, "Info_Mod_Scar_Jagdtrophaeen_SollIch_10_04"); //Jesli przywrócisz go do pracy, dam ci dobre ceny, obiecuje.

	Log_CreateTopic	(TOPIC_MOD_FAULERJÄGER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FAULERJÄGER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FAULERJÄGER, "Scar nie sprzeda mi swoich trofeów mysliwskich, dopóki nie otrzymam jego pomocnika Bartok' a, aby ponownie udal sie na polowanie. Bartok spedza wiekszosc czasu w miescie i tam w 'Czerwonej Lampce'.");
};

INSTANCE Info_Mod_Scar_BartokArbeitetWieder (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_BartokArbeitetWieder_Condition;
	information	= Info_Mod_Scar_BartokArbeitetWieder_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bartok wraca do pracy.";
};

FUNc INT Info_Mod_Scar_BartokArbeitetWieder_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bartok_ArbeiteWieder))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_BartokArbeitetWieder_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_BartokArbeitetWieder_15_00"); //Bartok wraca do pracy.
	AI_Output(self, hero, "Info_Mod_Scar_BartokArbeitetWieder_10_01"); //Dzieki, ze mnie pan bardzo mi to przysluzyl.
	AI_Output(self, hero, "Info_Mod_Scar_BartokArbeitetWieder_10_02"); //Od teraz moge sprzedac wam moje trofea mysliwskie.
	AI_Output(self, hero, "Info_Mod_Scar_BartokArbeitetWieder_10_03"); //Wez to zloto jako nagrode.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_FAULERJÄGER, "Scar sprzedaje mi teraz trofea mysliwskie. Mam nadzieje, ze ma cien rogu lyzwiarskiego.");
	B_SetTopicStatus	(TOPIC_MOD_FAULERJÄGER, LOG_SUCCESS);

	CreateInvItems	(self, ItAt_ShadowHorn, 1);
	CreateInvItems	(self, ItAt_Claw, 5);
	CreateInvItems	(self, itat_LurkerSkin, 3);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Scar_AlteMineQuest (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_AlteMineQuest_Condition;
	information	= Info_Mod_Scar_AlteMineQuest_Info;
	permanent	= 0;
	important	= 1;
};

FUNc INT Info_Mod_Scar_AlteMineQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_AlteMineQuest))
	&& (Npc_IsDead(Mod_7713_DMR_Daemonenritter_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_AlteMineQuest_Info()
{
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest_10_00"); //Damn, znów jeden z tych szalenców.
	AI_Output(hero, self, "Info_Mod_Scar_AlteMineQuest_15_01"); //Co sie stalo?
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest_10_02"); //Wszyscy szaleja w kopalni.
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest_10_03"); //Wlasnie zaczeli sie zabijac, a teraz atakuja nas.
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest_10_04"); //Co dzieje sie w piekle?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Scar_AlteMineQuest2 (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_AlteMineQuest2_Condition;
	information	= Info_Mod_Scar_AlteMineQuest2_Info;
	permanent	= 0;
	important	= 1;
};

FUNc INT Info_Mod_Scar_AlteMineQuest2_Condition()
{
	if (Mod_AMQ_Viper == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_AlteMineQuest2_Info()
{
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest2_10_00"); //Czy rzeczywiscie oczyszcziles kopalnie szalenców?
	AI_Output(hero, self, "Info_Mod_Scar_AlteMineQuest2_15_01"); //Tak, szpikulka ma koniec.
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest2_10_02"); //Jestes pieklem faceta. Tutaj wez kilka trofeów i lyk nagrody.

	B_ShowGivenThings	("Serce demoniczne, czarna perla, 3 kosci szkieletowe i 2 zakonserwowane alkoholi czystych");

	CreateInvItems	(hero, ItAt_DemonHeart, 1);
	CreateInvItems	(hero, ItMi_DarkPearl, 1);
	CreateInvItems	(hero, ItAt_SkeletonBone, 3);
	CreateInvItems	(hero, ItMi_Alchemy_Alcohol_01, 2);

	B_GivePlayerXP	(100);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Scar_AlterFreund (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_AlterFreund_Condition;
	information	= Info_Mod_Scar_AlterFreund_Info;
	permanent	= 0;
	important	= 0;
	description	= "Cóz, stary przyjaciel!";
};

FUNc INT Info_Mod_Scar_AlterFreund_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Scar_AlterFreund_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_15_00"); //Cóz, stary przyjaciel!
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_10_01"); //Stary przyjaciel?
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_15_02"); //Nie rozpoznajesz mnie? Bylismy kiedys najlepszymi kolegami!
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_10_03"); //Moze tak. Musialem miec zbyt wiele do picia w barierze. Nic nie pamietaja. (smiertelnicy zabrudzeni

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);

	if (Npc_HasItems(hero, ItFo_Beer) >= 2)
	{
		Info_AddChoice	(Info_Mod_Scar_AlterFreund, "Wrócmy do dawnych czasów!", Info_Mod_Scar_AlterFreund_B);
	};

	Info_AddChoice	(Info_Mod_Scar_AlterFreund, "Obiecal mi pan wtedy cos jeszcze wtedy obiecal....", Info_Mod_Scar_AlterFreund_A);
};

FUNC VOID Info_Mod_Scar_AlterFreund_B()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_B_15_00"); //Wrócmy do dawnych czasów!

	B_GiveInvItems	(hero, self, ItFo_Beer, 1);

	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_B_10_01"); //(Zmieszane) Dla mnie. Do naszej przyjazni!

	B_UseItem	(hero, ItFo_Beer);
	B_UseItem	(self, ItFo_Beer);

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);
};

FUNC VOID Info_Mod_Scar_AlterFreund_A()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_A_15_01"); //Obiecal mi pan wtedy cos jeszcze wtedy obiecal....
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_A_10_02"); //To nie moze byc dobre.

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);

	Info_AddChoice	(Info_Mod_Scar_AlterFreund, "Nadal jestes mi winien zloto. Zwyciezylem zaklad.", Info_Mod_Scar_AlterFreund_D);
	Info_AddChoice	(Info_Mod_Scar_AlterFreund, "Byles gonna dostalem mi bron.", Info_Mod_Scar_AlterFreund_C);
};

FUNC VOID Info_Mod_Scar_AlterFreund_D()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_D_15_00"); //Nadal jestes mi winien zloto. Zwyciezylem zaklad.
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_D_10_01"); //Zloto? Myslalem, ze dostalem rude w barierze?
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_D_15_02"); //Mysle, ze tak, tak.
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_D_10_03"); //(smiech) No cóz, mozna miec moja rude. Tak czy owak niewiele pozostalo. A kiedy jestes zadowolony....

	B_GiveInvItems	(self, hero, ItMi_Nugget, 1);

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);
};

FUNC VOID Info_Mod_Scar_AlterFreund_C()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_C_15_00"); //Byles gonna dostalem mi bron.
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_C_10_01"); //Hmm, jesli to po prostu. Mialem juz to dosc.
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_C_10_02"); //Wezmy to pod uwage, a my bedziemy na równi!

	B_GiveInvItems	(self, hero, ItMw_1h_Mil_Sword, 1);

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);
};

INSTANCE Info_Mod_Scar_VieleSchwerter (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_VieleSchwerter_Condition;
	information	= Info_Mod_Scar_VieleSchwerter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Przenosisz z soba mnóstwo mieczy!";
};

FUNc INT Info_Mod_Scar_VieleSchwerter_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Scar_VieleSchwerter_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_VieleSchwerter_15_00"); //Przenosisz z soba mnóstwo mieczy!
	AI_Output(self, hero, "Info_Mod_Scar_VieleSchwerter_10_01"); //Tak, sa ciezkie. Ale Andokai powiedzial, ze musze byc dobry na cos, wiec sprzedaje go teraz.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_BELIARFESTUNG, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_BELIARFESTUNG, "Blizna w pistoletach.");
};

INSTANCE Info_Mod_Scar_Befoerderung (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Befoerderung_Condition;
	information	= Info_Mod_Scar_Befoerderung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chce byc rycerzem demonicznym.";
};

FUNC INT Info_Mod_Scar_Befoerderung_Condition()
{
	if (Mod_Gilde == 15)
	&& ((Kapitel > 4)
	|| (Npc_KnowsInfo(hero, Info_Mod_Xardas_AW_Bshydal)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_Befoerderung_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_Befoerderung_15_00"); //Chce byc rycerzem demonicznym.
	AI_Output(self, hero, "Info_Mod_Scar_Befoerderung_10_01"); //Demoniczni rycerze staja sie tylko naszym najlepszym. Ale zdobyles te range.
	AI_Output(self, hero, "Info_Mod_Scar_Befoerderung_10_02"); //Podniose cie do rangi Demon Knight.
	AI_Output(self, hero, "Info_Mod_Scar_Befoerderung_10_03"); //Oto Twoja zbroja.

	CreateInvItems	(hero, ITAR_Raven_Addon, 1);

	AI_PrintScreen (ITAR_Raven_Addon.name, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

	B_GivePlayerXP	(400);

	B_Göttergefallen(3, 5);

	Mod_Gilde = 16;

	Snd_Play ("LEVELUP");
};

INSTANCE Info_Mod_Scar_Trade (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Trade_Condition;
	information	= Info_Mod_Scar_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Scar_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scar_VieleSchwerter))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Scar_Pickpocket (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Pickpocket_Condition;
	information	= Info_Mod_Scar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Scar_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Scar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

	Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_BACK, Info_Mod_Scar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Scar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Scar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Scar_Pickpocket);
};

FUNC VOID Info_Mod_Scar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

		Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Scar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Scar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Scar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Scar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Scar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Scar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Scar_EXIT (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_EXIT_Condition;
	information	= Info_Mod_Scar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Scar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Scar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
