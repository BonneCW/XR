var int Bel_SteinReparieren;

INSTANCE Info_Mod_Eduard_Hi (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Hi_Condition;
	information	= Info_Mod_Eduard_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witaj. Jestem tu nowy.";
};

FUNC INT Info_Mod_Eduard_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Eduard_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Hi_15_00"); //Witaj. Jestem tu nowy.
	AI_Output(self, hero, "Info_Mod_Eduard_Hi_32_01"); //Tak wiele nowych twarzy ostatnio..... Jak pamietasz to wszystko?
	AI_Output(self, hero, "Info_Mod_Eduard_Hi_32_02"); //Kilka tygodni temu bylo to przytulne miejsce - a potem to Bang! Bariera zniknela, a wszyscy ci ludzie tancza do obcych.
	AI_Output(self, hero, "Info_Mod_Eduard_Hi_32_03"); //Od tego czasu brakowalo mi wszystkiego i nie moge nadazyc za bronia. Nienawidze kowalstwa.
};

INSTANCE Info_Mod_Eduard_SchmiedenLehren (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_SchmiedenLehren_Condition;
	information	= Info_Mod_Eduard_SchmiedenLehren_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy mozesz mnie nauczyc jak sie kusic?";
};

FUNC INT Info_Mod_Eduard_SchmiedenLehren_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Eduard_SchmiedenLehren_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_SchmiedenLehren_15_00"); //Czy mozesz mnie nauczyc jak sie kusic?
	AI_Output(self, hero, "Info_Mod_Eduard_SchmiedenLehren_32_01"); //Moge spróbowac. Ale nie oczekuj zbyt wiele.
	AI_Output(self, hero, "Info_Mod_Eduard_SchmiedenLehren_32_02"); //Ja sam nigdy nie mialem zadnego treningu i jestem bardzo szczesliwy, kiedy jakos to zrozumialem.
};

INSTANCE Info_Mod_Eduard_Haendler (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Haendler_Condition;
	information	= Info_Mod_Eduard_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sprzedajesz akcesoria do kucia?";
};

FUNC INT Info_Mod_Eduard_Haendler_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Eduard_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Haendler_15_00"); //Sprzedajesz akcesoria do kucia?
	AI_Output(self, hero, "Info_Mod_Eduard_Haendler_32_01"); //Moge ci sprzedac troche rzeczy, ale nie wszystko. Uzupelnienie jest zawsze drogie i nastepuje jedynie w zastoju.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_BELIARFESTUNG, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_BELIARFESTUNG, "Eduard's gonna sprzedaj mi jakies kucie zapasów i broni.");
};

INSTANCE Info_Mod_Eduard_Belagerung (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Belagerung_Condition;
	information	= Info_Mod_Eduard_Belagerung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wszystko jest w porzadku?";
};

FUNC INT Info_Mod_Eduard_Belagerung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scar_HabBauanleitung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Belagerung_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Belagerung_15_00"); //Wszystko jest w porzadku?
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_01"); //Bylem lepszy! Czego znów chcesz?
	AI_Output(hero, self, "Info_Mod_Eduard_Belagerung_15_02"); //Mam za zadanie pomóc Tobie w powrocie na tor. Zastanawialem sie, czy masz dla mnie cos do zrobienia.
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_03"); //Tak, rzeczywiscie.
	AI_Output(hero, self, "Info_Mod_Eduard_Belagerung_15_04"); //Co o tym chodzi?
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_05"); //Robie nowe palki, które powinienem wykonac dla Scar. Jednak w instrukcjach budowlanych jest napisane, ze bron jest o wiele trudniejsza, jesli wezmie sie pod uwage cztery Trollhauer. Chce, zebyscie panstwo mnie to przywiezli.
	AI_Output(hero, self, "Info_Mod_Eduard_Belagerung_15_06"); //Gdzie moge znalezc Trollhauera?
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_07"); //W dól w dolinie znajduje sie opuszczony obóz mysliwski. Jesli masz szczescie, znajdziecie tam cos dla siebie.
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_08"); //Ale jest tam pelen nieumarlych nowicjuszy, wiec uwazaj.

	Mob_CreateItems	("JAEGERTRUHE", ItAt_TrollTooth, 4);
	
	Log_CreateTopic	(TOPIC_MOD_BEL_TROLLHAUER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_TROLLHAUER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_TROLLHAUER, "Eduard potrzebuje czterech pracowników firmy Trollhauer do obslugi Scar. W dolinie znajduje sie opuszczony obóz mysliwski, gdzie moze jeszcze byc kilka. To jednak tetni zyciem nieumarlych nowicjuszy.");
};

INSTANCE Info_Mod_Eduard_Trolle (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Trolle_Condition;
	information	= Info_Mod_Eduard_Trolle_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tutaj masz cztery Trollhauer.";
};

FUNC INT Info_Mod_Eduard_Trolle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_Belagerung))
	&& (Npc_HasItems(hero, ItAt_TrollTooth) >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Trolle_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Trolle_15_00"); //Tutaj masz cztery Trollhauer.

	B_GiveInvItems	(hero, self, ItAt_TrollTooth, 4);

	AI_Output(self, hero, "Info_Mod_Eduard_Trolle_32_01"); //Dzieki. Byliscie bardzo pomocni. Tutaj wez te 200 sztuk zlota.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	B_GivePlayerXP	(300);
	
	B_LogEntry_More	(TOPIC_MOD_BEL_TROLLHAUER, TOPIC_MOD_BEL_BELAGERUNG, "Dalem Eduardowi trollhauera.", "Pomagalem Eduardowi teraz.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_TROLLHAUER, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Eduard_MagischerDietrich (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_MagischerDietrich_Condition;
	information	= Info_Mod_Eduard_MagischerDietrich_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gomez wyslal mnie!";
};

FUNC INT Info_Mod_Eduard_MagischerDietrich_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_TruheMage))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_MagischerDietrich_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_MagischerDietrich_15_00"); //Gomez wyslal mnie! Chce, abys zrobil dla mnie specjalna dietrich, który moze zostac przeksztalcony w magiczna dietrich!
	AI_Output(self, hero, "Info_Mod_Eduard_MagischerDietrich_32_01"); //Czyz nie koncza sie zlecenia? (sighs) No cóz, przyniesc mi dwie surowe stal i stara zlota monete, a ja zrobie ci to cos.

	CreateInvItems	(Mod_518_SMK_Scar_MT, ItMiSwordRaw, 2);
	CreateInvItems	(Mod_518_SMK_Scar_MT, ItMi_OldCoin, 5);

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Eduard potrzebuje dwie surowej stali i starej zlotej monety do dietrichu. Mam nadzieje, ze Scar's dostal rzeczy, których chce.");
};

INSTANCE Info_Mod_Eduard_ZutatenFuerDietrich (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_ZutatenFuerDietrich_Condition;
	information	= Info_Mod_Eduard_ZutatenFuerDietrich_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto rzeczy!";
};

FUNC INT Info_Mod_Eduard_ZutatenFuerDietrich_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_MagischerDietrich))
	&& (Npc_HasItems(hero, ItMiSwordRaw) >= 2)
	&& (Npc_HasItems(hero, ItMi_OldCoin) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_ZutatenFuerDietrich_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZutatenFuerDietrich_15_00"); //Oto rzeczy!

	Npc_RemoveInvItems	(hero, ItMiSwordRaw, 2);
	Npc_RemoveInvItems	(hero, ItMi_OldCoin, 1);

	B_ShowGivenThings	("Dwie surowe monety stalowe i stara zlota");

	AI_Output(self, hero, "Info_Mod_Eduard_ZutatenFuerDietrich_32_01"); //Wróc jutro i odbierz Dietrich.

	EduardDietrich_Day = Wld_GetDay();

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Produkcja dietrichu trwa jedna noc. Chca, abym wrócil jutro.");
};

INSTANCE Info_Mod_Eduard_DietrichFertig (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_DietrichFertig_Condition;
	information	= Info_Mod_Eduard_DietrichFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy chwytak zamka jest gotowy?";
};

FUNC INT Info_Mod_Eduard_DietrichFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_ZutatenFuerDietrich))
	&& (EduardDietrich_Day < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_DietrichFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_DietrichFertig_15_00"); //Czy chwytak zamka jest gotowy?
	AI_Output(self, hero, "Info_Mod_Eduard_DietrichFertig_32_01"); //Tak, tutaj. Teraz odejdz i zostaw mnie sam na sam!

	B_GiveInvItems	(self, hero, ItKe_Lockpick_Mage_Unloaded, 1);

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Dostalem blokade. Przejdzmy do Gomeza.");
};

INSTANCE Info_Mod_Eduard_Beliarstein (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Beliarstein_Condition;
	information	= Info_Mod_Eduard_Beliarstein_Info;
	permanent	= 0;
	important	= 0;
	description	= "Potrzebuje panstwa pomocy.";
};

FUNC INT Info_Mod_Eduard_Beliarstein_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fahim_HabStein))
	&& (Npc_HasItems(hero, ItMi_Beliarstein_Unloaded) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Beliarstein_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Beliarstein_15_00"); //Potrzebuje panstwa pomocy.
	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_01"); //Co to jest sprawa?
	AI_Output(hero, self, "Info_Mod_Eduard_Beliarstein_15_02"); //Spójrz na te skale.

	B_GiveInvItems	(hero, self, ItMi_Beliarstein_Unloaded, 1);

	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_03"); //Hmm..... który zostal powaznie dotkniety.
	AI_Output(hero, self, "Info_Mod_Eduard_Beliarstein_15_04"); //Czy mozesz go naprawic?
	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_05"); //Nigdy wczesniej nie zrobilem niczego podobnego, ale byc moze mam.
	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_06"); //Potrzebuje dwóch kawalków czarnej rudy, aby kamien odzyskal swoja sile.
	AI_Output(hero, self, "Info_Mod_Eduard_Beliarstein_15_07"); //Nie ma tu jednak czarnej rudy.
	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_08"); //Zwróc sie do Ravena, wie o tych rzeczach!

	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Eduard potrafi naprawic kamien, ale potrzebuje dwóch kawalków czarnej rudy. Raven moze wiedziec, skad sie wzielam.");
};

INSTANCE Info_Mod_Eduard_HabErz (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_HabErz_Condition;
	information	= Info_Mod_Eduard_HabErz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tutaj masz odpowiedni material!";
};

FUNC INT Info_Mod_Eduard_HabErz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_ErzFertig))
	&& (Npc_HasItems(hero, ItMi_Zeitspalt_Addon) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_HabErz_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_HabErz_15_00"); //Tutaj masz odpowiedni material!

	B_GiveInvItems	(hero, self, ItMi_Zeitspalt_Addon, 2);

	AI_Output(self, hero, "Info_Mod_Eduard_HabErz_32_01"); //To dobra wiadomosc. Teraz podlacze czarna rude do kamienia.
	AI_Output(self, hero, "Info_Mod_Eduard_HabErz_32_02"); //Poczekaj do jutra i wróc!

	Bel_SteinReparieren = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Juz teraz mocowanie kamienia przez Eduarda. Jutro zostanie zrobiony.");
};

INSTANCE Info_Mod_Eduard_SteinFertig (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_SteinFertig_Condition;
	information	= Info_Mod_Eduard_SteinFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "A co?";
};

FUNC INT Info_Mod_Eduard_SteinFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_HabErz))
	&& (Wld_GetDay() > Bel_SteinReparieren)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_SteinFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_SteinFertig_15_00"); //A co?
	AI_Output(self, hero, "Info_Mod_Eduard_SteinFertig_32_01"); //Zajelo mi to cala noc, ale kamien znowu pulsuje energia!
	AI_Output(self, hero, "Info_Mod_Eduard_SteinFertig_32_02"); //Tutaj masz to!

	B_GiveInvItems	(self, hero, ItMi_Beliarstein, 1);

	AI_Output(hero, self, "Info_Mod_Eduard_SteinFertig_15_03"); //Teraz wróce do Fahimu.
	AI_Output(self, hero, "Info_Mod_Eduard_SteinFertig_32_04"); //Zrób to.

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Kamien jest naprawiany i ponownie pulsuje energia. Teraz powinienem wrócic do Fahima.");
};

INSTANCE Info_Mod_Eduard_ToteNovizen (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_ToteNovizen_Condition;
	information	= Info_Mod_Eduard_ToteNovizen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam do pana kilka pytan.";
};

FUNC INT Info_Mod_Eduard_ToteNovizen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Abdi_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_ToteNovizen_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ToteNovizen_15_00"); //Mam do pana kilka pytan.
	AI_Output(self, hero, "Info_Mod_Eduard_ToteNovizen_32_01"); //(calkowicie wykonczony) Wh--h- Wh--- Czego chcesz? Mialem dosc tego, co sie stalo! Te cienie.....
	AI_Output(hero, self, "Info_Mod_Eduard_ToteNovizen_15_02"); //Jakie cienie?
	AI_Output(self, hero, "Info_Mod_Eduard_ToteNovizen_32_03"); //(rzezby) wczoraj wieczorem widzialem wielki cien..... Skrzydla trzeszczone.... krzyczec.....
	AI_Output(hero, self, "Info_Mod_Eduard_ToteNovizen_15_04"); //Co to bylo?
	AI_Output(self, hero, "Info_Mod_Eduard_ToteNovizen_32_05"); //demon Mysle, ze to bylo..... Demon!

	B_LogEntry	(TOPIC_MOD_BEL_DAEMON, "Eduard zauwazyl cien. Uwaza, ze to byl demon. Powinienem udac sie do Raven.");
};

INSTANCE Info_Mod_Eduard_Skinner (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Skinner_Condition;
	information	= Info_Mod_Eduard_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Przynosze wymarzone wezwania od Skinnera.";
};

FUNC INT Info_Mod_Eduard_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_Hi))
	&& (Npc_HasItems(hero, ItMi_Traumruf) >= 8)
	&& (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Skinner_15_00"); //Przynosze wymarzone wezwania od Skinnera. 80 zloty apiece.

	B_GiveInvItems	(hero, self, ItMi_Traumruf, 8);

	B_UseItem	(self, ItMi_Traumruf);

	AI_Output(self, hero, "Info_Mod_Eduard_Skinner_32_01"); //Ahh, piekny i tak tani. Dostala tylko tyle zlotych monet na osiem.

	B_GiveInvItems	(self, hero, ItMi_Gold, 600);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "Bylem z Eduardem. Marzenia krzyki zdaja sie go dosyc zachmurzac.");

	Mod_EduardZuWenigGoldCounter = 3600;
	
	B_GivePlayerXP	(100);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Eduard_ZuWenigGold (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_ZuWenigGold_Condition;
	information	= Info_Mod_Eduard_ZuWenigGold_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hej, 600 zlotych monet nie wystarczy.";
};

FUNC INT Info_Mod_Eduard_ZuWenigGold_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_Skinner))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche2))
	&& (Mod_EduardZuWenigGoldCounter > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZuWenigGold_15_00"); //Hej, 600 zlotych monet nie wystarczy.
	AI_Output(self, hero, "Info_Mod_Eduard_ZuWenigGold_32_01"); //Czy tak jest? Haven nie byl tak arytmetyka od wedzenia. Ile jestem Ci winien?

	Info_ClearChoices	(Info_Mod_Eduard_ZuWenigGold);

	Info_AddChoice	(Info_Mod_Eduard_ZuWenigGold, "120 zlota.", Info_Mod_Eduard_ZuWenigGold_C);
	Info_AddChoice	(Info_Mod_Eduard_ZuWenigGold, "80 zlota.", Info_Mod_Eduard_ZuWenigGold_B);
	Info_AddChoice	(Info_Mod_Eduard_ZuWenigGold, "40 zlota.", Info_Mod_Eduard_ZuWenigGold_A);
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_C()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZuWenigGold_C_15_00"); //120 zlota.
	AI_Output(self, hero, "Info_Mod_Eduard_ZuWenigGold_C_32_01"); //Teraz poczekaj minute. Brakuje kilku monet. Daje ci zamiast tego trzy kawalki rudy?

	B_GiveInvItems	(self, hero, ItMi_Nugget, 3);

	Info_ClearChoices	(Info_Mod_Eduard_ZuWenigGold);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_E()
{
	AI_Output(self, hero, "Info_Mod_Eduard_ZuWenigGold_E_32_00"); //Ach, ledwo mialem juz tyle.
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_B()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZuWenigGold_B_15_00"); //80 zlota.

	Info_Mod_Eduard_ZuWenigGold_E();

	B_GiveInvItems	(self, hero, ItMi_Gold, 80);

	Info_ClearChoices	(Info_Mod_Eduard_ZuWenigGold);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_A()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZuWenigGold_A_15_00"); //40 zlota.

	Info_Mod_Eduard_ZuWenigGold_E();

	B_GiveInvItems	(self, hero, ItMi_Gold, 80);

	Info_ClearChoices	(Info_Mod_Eduard_ZuWenigGold);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Eduard_AlteMineQuest (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_AlteMineQuest_Condition;
	information	= Info_Mod_Eduard_AlteMineQuest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Eduard_AlteMineQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_AlteMineQuest2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_AlteMineQuest_Info()
{
	AI_Output(self, hero, "Info_Mod_Eduard_AlteMineQuest_32_00"); //Tak, tak, tak, ja nad tym pracuje. Ale ta dziwna mieszanka rudy z kopalni jest naprawde ciezka.
	AI_Output(self, hero, "Info_Mod_Eduard_AlteMineQuest_32_01"); //Zajmie mi to co najmniej pól dnia.

	AI_StopProcessInfos	(self);

	Npc_SetRefuseTalk (self, 60);
};

INSTANCE Info_Mod_Eduard_AlteMineQuest2 (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_AlteMineQuest2_Condition;
	information	= Info_Mod_Eduard_AlteMineQuest2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Eduard_AlteMineQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_AlteMineQuest))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_AlteMineQuest2_Info()
{
	AI_Output(self, hero, "Info_Mod_Eduard_AlteMineQuest2_32_00"); //Tutaj. To naprawde wspanialy kunszt. Staje sie coraz lepszy i lepszy.

	if (hero.guild == GIL_KDF)
	{
		B_GiveInvItems	(self, hero, ItAr_FinsternisPanzerhandschuh, 1);
	}
	else
	{
		B_GiveInvItems	(self, hero, ItAr_BoeserBlickAbwender, 1);
	};

	AI_Output(self, hero, "Info_Mod_Eduard_AlteMineQuest2_32_01"); //Nie wiem, jakie ukryte cechy kryja sie w tej zmodyfikowanej rudie, ale ten dobry kawalek z pewnoscia przyda sie wam jakos.

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Eduard_Ruestung (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Ruestung_Condition;
	information	= Info_Mod_Eduard_Ruestung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Czy moge uzyskac od Ciebie lepsza zbroje?";
};

FUNC INT Info_Mod_Eduard_Ruestung_Condition()
{
	if ((Mod_Gilde == 15)
	|| (Mod_Gilde == 12))
	&& (Npc_KnowsInfo(hero, Info_Mod_Eduard_Hi))
	&& (Mod_ZweiteVerbesserung < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Ruestung_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Ruestung_15_00"); //Czy moge uzyskac od Ciebie lepsza zbroje?

	if (Kapitel > 3)
	&& (Mod_ZweiteVerbesserung == FALSE)
	&& (Mod_Gilde == 15)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_32_02"); //Slyszalem, ze w drodze do wodnego miejsca wykopaliska maga wodnego ma byc koszmar. Z jego futrem z pewnoscia móglbym nieco poprawic twoja czarna pancerz wojenna.
	
		Mod_ZweiteVerbesserung = TRUE;

		Eduard_SpawnUpOne = TRUE;

		Log_CreateTopic	(TOPIC_MOD_RUESTUNGSUPGADSE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_RUESTUNGSUPGADSE, "W drodze do miejsca wykopaliska maga wodnego odbedzie sie koszmar, którego futro Eduard moze uzyc do poprawy mojej czarnej pancerzy wojennej.");
	};

	if (Kapitel > 1)
	&& (Mod_ErsteVerbesserung == FALSE)
	&& (Mod_Gilde == 12)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_32_03"); //Slysze, ze na przeleczy w Khorinis jest szpara cieni. Z jego skóra z pewnoscia moge poprawic swoja czarna nowicjuszka sukienke troche.
	
		Mod_ErsteVerbesserung = TRUE;

		Eduard_SpawnUpTwo = TRUE;

		Log_CreateTopic	(TOPIC_MOD_RUESTUNGSUPGADSE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_RUESTUNGSUPGADSE, "Na przeleczy niedaleko Khorinis podobno znajduje sie kropla cienia, której skóra Eduard moze posluzyc do poprawy mojej czarnej nowicjuszowej sukni.");
	};

	Info_ClearChoices	(Info_Mod_Eduard_Ruestung);
	Info_AddChoice	(Info_Mod_Eduard_Ruestung, DIALOG_BACK, Info_Mod_Eduard_Ruestung_BACK);

	if (Mod_ZweiteVerbesserung == TRUE)
	&& (Mod_Gilde == 15)
	{
		Info_AddChoice	(Info_Mod_Eduard_Ruestung, "Ulepszenie Czarnej Wojny Zbrojen", Info_Mod_Eduard_Ruestung_SKR_S);
	};

	if (Mod_ErsteVerbesserung == TRUE)
	&& (Mod_Gilde == 12)
	{
		Info_AddChoice	(Info_Mod_Eduard_Ruestung, "Udoskonalic Czarna Nowicje Robe", Info_Mod_Eduard_Ruestung_SNOV_S);
	};
};

FUNC VOID Info_Mod_Eduard_Ruestung_BACK ()
{
	Info_ClearChoices	(Info_Mod_Eduard_Ruestung);
};

FUNC VOID Info_Mod_Eduard_Ruestung_SKR_S ()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Ruestung_SKR_S_15_00"); //Popraw moja czarna zbroje.

	if (Npc_HasItems(hero, ItAt_NightmareFur) == 1)
	&& (Npc_HasItems(hero, ItAr_SMK_L) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SKR_S_32_01"); //Wszystko jasne.

		Npc_RemoveInvItems	(hero, ItAt_NightmareFur, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_SMK_L, 1);

		CreateInvItems	(self, ItAr_SKR_S, 1);

		B_GiveInvItems	(self, hero, ItAr_SKR_S, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_SKR_S);

		Mod_ZweiteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_SMK_L) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SKR_S_32_02"); //Musisz miec jakas czarna zbroje, bo ja nie bede w stanie ja dla ciebie naprawic.
	}
	else if (Npc_HasItems(hero, ItAt_NightmareFur) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SKR_S_32_03"); //Jesli nie masz koszmarnego plaszcza, nie moge poprawic twojej zbroi.
	};

	Info_ClearChoices	(Info_Mod_Eduard_Ruestung);
};

FUNC VOID Info_Mod_Eduard_Ruestung_SNOV_S ()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Ruestung_SNOV_S_15_00"); //Popraw moja czarna nowicjuszke.

	if (Npc_HasItems(hero, ItAt_Schattensnapperhaut) == 1)
	&& (Npc_HasItems(hero, ItAr_NOV_DMB_01) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SNOV_S_32_01"); //Wszystko jasne.

		Npc_RemoveInvItems	(hero, ItAt_Schattensnapperhaut, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_NOV_DMB_01, 1);

		CreateInvItems	(self, ItAr_SNOV_S, 1);

		B_GiveInvItems	(self, hero, ItAr_SNOV_S, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_SNOV_S);

		Mod_ErsteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_NOV_DMB_01) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SNOV_S_32_02"); //Musisz miec czarna próbke nowicjatu, bo w przeciwnym razie nie bede w stanie go dla ciebie naprawic.
	}
	else if (Npc_HasItems(hero, ItAt_Schattensnapperhaut) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SNOV_S_32_03"); //Jesli nie masz skóry cienia, nie moge poprawic pancerza.
	};

	Info_ClearChoices	(Info_Mod_Eduard_Ruestung);
};

instance Info_Mod_Eduard_TeachCOMMON (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr          	= 1;
	condition	= Info_Mod_Eduard_TeachCOMMON_Condition;
	information	= Info_Mod_Eduard_TeachCOMMON_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString("Nauka kuzniania sie", B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
};

func int Info_Mod_Eduard_TeachCOMMON_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Eduard_SchmiedenLehren))
	{
		return TRUE;
	};
};

func void Info_Mod_Eduard_TeachCOMMON_Info ()
{
	AI_Output (other, self, "Info_Mod_Eduard_TeachCOMMON_15_00"); //Naucz mnie jak zakopac miecz!
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "Info_Mod_Eduard_TeachCOMMON_32_01"); //To proste: Zalóz sobie kawalek surowej stali, trzymaj go w ogniu, az sie rozpali.
		AI_Output (self, other, "Info_Mod_Eduard_TeachCOMMON_32_02"); //Nastepnie na kowadelko uderzysz w ostrze po prawej stronie.
		AI_Output (self, other, "Info_Mod_Eduard_TeachCOMMON_32_03"); //Upewnic sie, ze ostrze nie jest zbyt zimne. Masz tylko kilka minut na prace nad swoja bronia....
		AI_Output (self, other, "Info_Mod_Eduard_TeachCOMMON_32_04"); //Dowiesz sie reszte - po prostu cwiczysz.
	};
};

INSTANCE Info_Mod_Eduard_Trade (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Trade_Condition;
	information	= Info_Mod_Eduard_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Eduard_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Eduard_Pickpocket (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Pickpocket_Condition;
	information	= Info_Mod_Eduard_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Eduard_Pickpocket_Condition()
{
	C_Beklauen	(72, ItMiSwordRaw, 5);
};

FUNC VOID Info_Mod_Eduard_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

	Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_BACK, Info_Mod_Eduard_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Eduard_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Eduard_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);
};

FUNC VOID Info_Mod_Eduard_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

		Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Eduard_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Eduard_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Eduard_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Eduard_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Eduard_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Eduard_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Eduard_EXIT (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_EXIT_Condition;
	information	= Info_Mod_Eduard_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Eduard_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Eduard_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
