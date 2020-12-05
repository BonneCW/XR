INSTANCE Info_Mod_Gomez_Hi (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Hi_Condition;
	information	= Info_Mod_Gomez_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gomez_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Gomez_Hi_16_00"); //Hej, buster. Wez to latwo, bo w przeciwnym razie bedziesz martwy.
	AI_Output(hero, self, "Info_Mod_Gomez_Hi_15_01"); //Zapraszamy!
	AI_Output(self, hero, "Info_Mod_Gomez_Hi_16_02"); //Calkiem tak. Co Pan tutaj robi?
	AI_Output(hero, self, "Info_Mod_Gomez_Hi_15_03"); //Uh.... Chce zobaczyc pewnego Andokai.
	AI_Output(self, hero, "Info_Mod_Gomez_Hi_16_04"); //To dobre dopasowanie. Przyczyna tego jest to, do czego teraz cie zabieram.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Gomez_Belagerung (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Belagerung_Condition;
	information	= Info_Mod_Gomez_Belagerung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz dla mnie cos do zrobienia?";
};

FUNC INT Info_Mod_Gomez_Belagerung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_Belagerung_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Belagerung_15_00"); //Masz dla mnie cos do zrobienia?
	AI_Output(self, hero, "Info_Mod_Gomez_Belagerung_16_01"); //Hmmmmm..... nic, co mogloby miec znaczenie!
	AI_Output(hero, self, "Info_Mod_Gomez_Belagerung_15_02"); //Co powinienem zrobic?
	AI_Output(self, hero, "Info_Mod_Gomez_Belagerung_16_03"); //W lesie przed twierdza znajduja sie zmarli nowicjusze i magowie. Uniemozliwiaja nam one zlapanie na plaskowyzu glównych oddzialów Innosa.
	AI_Output(self, hero, "Info_Mod_Gomez_Belagerung_16_04"); //Chce, zebys zabil tych facetów, abysmy wreszcie mogli walczyc z powrotem.
	AI_Output(hero, self, "Info_Mod_Gomez_Belagerung_15_05"); //Wkrótce wyjde!
	AI_Output(self, hero, "Info_Mod_Gomez_Belagerung_16_06"); //Zabijaj wszystkich wrogów!
	AI_Output(hero, self, "Info_Mod_Gomez_Belagerung_15_07"); //Nie zignoruje nikogo.

	Log_CreateTopic	(TOPIC_MOD_BEL_DURCHBRUCH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_DURCHBRUCH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_DURCHBRUCH, "Gomez chce, abym wykonywal nieumarlych nowicjuszy i magów w lesie przed twierdza.");
};

INSTANCE Info_Mod_Gomez_Durchbruch (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Durchbruch_Condition;
	information	= Info_Mod_Gomez_Durchbruch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wróg zostaje oslabiony.";
};

FUNC INT Info_Mod_Gomez_Durchbruch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_Belagerung))
	&& (Npc_IsDead(Mod_4037_UntoterNovize_20_MT))
	&& (Npc_IsDead(Mod_4038_UntoterNovize_21_MT))
	&& (Npc_IsDead(Mod_4039_UntoterNovize_22_MT))
	&& (Npc_IsDead(Mod_4040_UntoterNovize_23_MT))
	&& (Npc_IsDead(Mod_4041_UntoterNovize_24_MT))
	&& (Npc_IsDead(Mod_4042_UntoterNovize_25_MT))
	&& (Npc_IsDead(Mod_4043_UntoterNovize_26_MT))
	&& (Npc_IsDead(Mod_4044_UntoterNovize_27_MT))
	&& (Npc_IsDead(Mod_4045_UntoterNovize_28_MT))
	&& (Npc_IsDead(Mod_4046_UntoterNovize_29_MT))
	&& (Npc_IsDead(Mod_4047_UntoterMagier_06_MT))
	&& (Npc_IsDead(Mod_4048_UntoterMagier_07_MT))
	&& (Npc_IsDead(Mod_4049_UntoterMagier_08_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_Durchbruch_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Durchbruch_15_00"); //Wróg zostaje oslabiony.
	AI_Output(self, hero, "Info_Mod_Gomez_Durchbruch_16_01"); //Wykonal pan dobra prace. Mozemy wiec kontratakowac. Powiem Ravenowi o tym!

	B_GivePlayerXP	(600);

	B_LogEntry_More	(TOPIC_MOD_BEL_DURCHBRUCH, TOPIC_MOD_BEL_BELAGERUNG, "Powiedzialem Gomezowi, ze oblezenie zostalo cofniete.", "Pomagalem Gomezowi i przelamalem oblezenie. Przekaze teraz Ravenowi.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_DURCHBRUCH, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Gomez_TruheMage (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_TruheMage_Condition;
	information	= Info_Mod_Gomez_TruheMage_Info;
	permanent	= 0;
	important	= 0;
	description	= "Scar wyslal mnie.";
};

FUNC INT Info_Mod_Gomez_TruheMage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scar_TruheMage))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_TruheMage_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_TruheMage_15_00"); //Scar wyslal mnie.
	AI_Output(self, hero, "Info_Mod_Gomez_TruheMage_16_01"); //Co sie dzieje?
	AI_Output(hero, self, "Info_Mod_Gomez_TruheMage_15_02"); //Chce produkowac nowa bron, ale instrukcje budowlane sa zamkniete w magicznej klatce piersiowej. Skrzynia znajduje sie na wiezy twierdzy.
	AI_Output(self, hero, "Info_Mod_Gomez_TruheMage_16_03"); //Potrzebujesz magicznego wyboru zamka. Potrafi zlamac taki zaklecie.
	AI_Output(hero, self, "Info_Mod_Gomez_TruheMage_15_04"); //Gdzie mam zamek?
	AI_Output(self, hero, "Info_Mod_Gomez_TruheMage_16_05"); //Zwróc sie do Eduarda. On uczyni cie specjalna dietricha, która dam ci niezbedna sile.
	AI_Output(hero, self, "Info_Mod_Gomez_TruheMage_15_06"); //Dlaczego nie moze byc to latwiejsze?

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Gomez wyslal mnie do Eduarda. Chce, aby uczynil mnie magicznym dietrichiem, którego Gomez da mi sile, której potrzebuje.");
};

INSTANCE Info_Mod_Gomez_HabDietrich (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_HabDietrich_Condition;
	information	= Info_Mod_Gomez_HabDietrich_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tutaj znajduje sie blokada.";
};

FUNC INT Info_Mod_Gomez_HabDietrich_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_DietrichFertig))
	&& (Npc_HasItems(hero, ItKe_Lockpick_Mage_Unloaded) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_HabDietrich_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_HabDietrich_15_00"); //Tutaj znajduje sie blokada.

	B_GiveInvItems	(hero, self, ItKe_Lockpick_Mage_Unloaded, 1);

	AI_Output(self, hero, "Info_Mod_Gomez_HabDietrich_16_01"); //Wszystkie prawa, trzymac sie.

	AI_PlayAni	(self,"T_PRACTICEMAGIC5");

	AI_Output(self, hero, "Info_Mod_Gomez_HabDietrich_16_02"); //Tutaj znajduje sie blokada.

	B_GiveInvItems	(self, hero, ItKe_Lockpick_Mage, 1);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Blokada jest magicznie naladowana i teraz moge zlamac klatke piersiowa.");
};

INSTANCE Info_Mod_Gomez_Jagd01 (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Jagd01_Condition;
	information	= Info_Mod_Gomez_Jagd01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_Jagd01_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(hero, Info_Mod_Hagen_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_Jagd01_Info()
{
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd01_16_00"); //Tam znów pan jest.
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd01_15_01"); //Czekaliscie na mnie?
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd01_16_02"); //Chcialem Panstwa zaprosic na mala wycieczke mysliwska.
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd01_15_03"); //I dlaczego ja?
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd01_16_04"); //.... Dla lepszego znajomego. Widze wiec, co masz.

	Info_ClearChoices	(Info_Mod_Gomez_Jagd01);

	Info_AddChoice	(Info_Mod_Gomez_Jagd01, "Moze innym razem. Nie mam teraz czasu.", Info_Mod_Gomez_Jagd01_B);
	Info_AddChoice	(Info_Mod_Gomez_Jagd01, "Wyraznie.", Info_Mod_Gomez_Jagd01_A);
};

FUNC VOID Info_Mod_Gomez_Jagd01_B()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd01_B_15_00"); //Moze innym razem. Nie mam teraz czasu.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd01_B_16_01"); //To jest zbyt zle.

	Info_ClearChoices	(Info_Mod_Gomez_Jagd01);
};

FUNC VOID Info_Mod_Gomez_Jagd01_A()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd01_A_15_00"); //Wyraznie.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd01_A_16_01"); //Na zewnatrz twierdzy, za gestym lasem, znajduje sie ogromny plaskowyz.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd01_A_16_02"); //Zawsze znajdziesz tam mnóstwo butów.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd01_A_16_03"); //Daj mi znac, kiedy jestesmy na naszej drodze.

	Log_CreateTopic	(TOPIC_MOD_GOMEZHORN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GOMEZHORN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GOMEZHORN, "Gomez zaprosil mnie na polowanie - nie moglem powiedziec 'nie'.");
	
	Mod_GomezHorn = 1;

	Info_ClearChoices	(Info_Mod_Gomez_Jagd01);
};

INSTANCE Info_Mod_Gomez_Jagd02 (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Jagd02_Condition;
	information	= Info_Mod_Gomez_Jagd02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mozemy opuscic teraz.";
};

FUNC INT Info_Mod_Gomez_Jagd02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_Jagd01))
	&& (Mod_GomezHorn == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_Jagd02_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd02_15_00"); //Mozemy opuscic teraz.
	AI_Output(self, hero, "DEFAULT"); //

	Wld_SendTrigger	("AUSENTORBURG");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "JAGD");
};

INSTANCE Info_Mod_Gomez_Jagd03 (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Jagd03_Condition;
	information	= Info_Mod_Gomez_Jagd03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_Jagd03_Condition()
{
	if (Npc_GetDistToWP(self, "PALTO_25") < 500)
	&& (Npc_KnowsInfo(hero, Info_Mod_Gomez_Jagd02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_Jagd03_Info()
{
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_16_00"); //Teraz wszyscy jestesmy razem.
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_15_01"); //A....
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_16_02"); //Chodzi o mój czas spedzony w kolonii. Andokai i Xardas powiedzieli mi duzo o tym, ze bylem prostym Buddlerem w starym obozie.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_16_03"); //Ale ja im nie wierze. Ja kopaczka i as-kisser? Nigdy nigdy!
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_16_04"); //Ukrywali przed mna cos.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_16_05"); //Zauwazylem, ze byles równiez w tej kolonii. Czy znaliscie mnie wiec z czasów kolonii?

	Info_ClearChoices	(Info_Mod_Gomez_Jagd03);

	Info_AddChoice	(Info_Mod_Gomez_Jagd03, "Nie. Nigdy cie nie spotkalem.", Info_Mod_Gomez_Jagd03_B);
	Info_AddChoice	(Info_Mod_Gomez_Jagd03, "Tak.", Info_Mod_Gomez_Jagd03_A);
};

FUNC VOID Info_Mod_Gomez_Jagd03_C()
{
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_C_16_00"); //(Cichutko) No cichy, nie wydaje mi sie wiec, zebys tez bardzo mi pomagal. Powinnismy skupic sie na polowaniu, czyz nie powinnismy?
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_C_15_01"); //Mówisz to.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_C_16_02"); //Co mówi pan, ze organizujemy ten konkurs?
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_C_15_03"); //Przejdz do przodu.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_C_16_04"); //Sluchajmy wiec, oboje zaczynamy stad. Kazdy ma piec minut na zabicie jak najwiekszej liczby królików.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_C_16_05"); //Zwyciezca jest ten, kto po tym czasie zabil najwiecej królików.

	B_LogEntry	(TOPIC_MOD_GOMEZHORN, "Zgodzilem sie wziac udzial w zawodach z Gomezem: Jesli uda Ci sie zabic wiecej królików w ciagu pieciu minut, to jestes zwyciezca.");

	Info_ClearChoices	(Info_Mod_Gomez_Jagd03);

	Info_AddChoice	(Info_Mod_Gomez_Jagd03, "Jestem gotowy.", Info_Mod_Gomez_Jagd03_G);
	Info_AddChoice	(Info_Mod_Gomez_Jagd03, "Czym jest nagroda?", Info_Mod_Gomez_Jagd03_F);
};

FUNC VOID Info_Mod_Gomez_Jagd03_G()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_G_15_00"); //Jestem gotowy.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Gomez_Jagd03);

	self.aivar[AIV_Partymember] = TRUE;

	self.guild = GIL_KDF;
	Npc_SetTrueGuild	(self, GIL_KDF);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "HASENJAGD");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");

	Mod_Gomez_Timer = 300;
};

FUNC VOID Info_Mod_Gomez_Jagd03_F()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_F_15_00"); //Czym jest nagroda?
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_F_16_01"); //To tylko zaszczyt.
};

FUNC VOID Info_Mod_Gomez_Jagd03_B()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_B_15_00"); //Nie. Nigdy cie nie spotkalem.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_B_16_01"); //Jak niefortunnie. Musze zrobic wiecej badan.

	Info_Mod_Gomez_Jagd03_C();
};

FUNC VOID Info_Mod_Gomez_Jagd03_A()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_A_15_00"); //Tak.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_A_16_01"); //Potem opowiedz mi o tym.

	Info_ClearChoices	(Info_Mod_Gomez_Jagd03);

	Info_AddChoice	(Info_Mod_Gomez_Jagd03, "Jestes najpotezniejszym czlowiekiem w kopule od lat.", Info_Mod_Gomez_Jagd03_E);
	Info_AddChoice	(Info_Mod_Gomez_Jagd03, "Xardas i Andokai maja racje - byles tylko Buddlerem.", Info_Mod_Gomez_Jagd03_D);
};

FUNC VOID Info_Mod_Gomez_Jagd03_E()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_E_15_00"); //Jestes najpotezniejszym czlowiekiem w kopule od lat.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_E_16_01"); //Zrobil czas. Wiec jak to bylo za daleko?
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_E_15_02"); //Uh.... Tak naprawde nie wiem. Z wyjatkiem tego, ze zostales obalony.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_E_16_03"); //To ciekawe do poznania. Konieczne beda dalsze badania.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_E_16_04"); //Nawiasem mówiac, jesli nadal chcesz polowac, nie zmuszaj sie do tego. Laki sa pelne zwierzat.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_E_16_05"); //Nie mam teraz na to czasu.

	B_SetTopicStatus	(TOPIC_MOD_GOMEZHORN, LOG_SUCCESS);

	Info_ClearChoices	(Info_Mod_Gomez_Jagd03);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

FUNC VOID Info_Mod_Gomez_Jagd03_D()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_D_15_00"); //Xardas i Andokai maja racje - byles tylko Buddlerem.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_D_16_01"); //I nadal w to nie wierze. Moze mialem jakies zajecia, których nawet nie zauwazyles.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_D_16_02"); //Ale nie bylem zwyklym Buddlerkiem!

	Info_Mod_Gomez_Jagd03_C();
};

INSTANCE Info_Mod_Gomez_Jagd04 (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Jagd04_Condition;
	information	= Info_Mod_Gomez_Jagd04_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_Jagd04_Condition()
{
	if (Mod_Gomez_Timer == 0)
	&& (Mod_Gomez_HasenKiller+Mod_Gomez_HasenKiller2 > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_Jagd04_Info()
{
	self.guild = GIL_DMT;
	Npc_SetTrueGuild	(self, GIL_DMT);

	if (Mod_Gomez_HasenKiller >= Mod_Gomez_HasenKiller2)
	{
		AI_Output(self, hero, "Info_Mod_Gomez_Jagd04_16_00"); //Kto jest teraz najlepszy?
		AI_Output(hero, self, "Info_Mod_Gomez_Jagd04_15_01"); //Po prostu miales szczescie.
		AI_Output(self, hero, "Info_Mod_Gomez_Jagd04_16_02"); //Tak, wierzcie. Ale wiem lepiej.
		AI_Output(self, hero, "Info_Mod_Gomez_Jagd04_16_03"); //Wracam do twierdzy i mam zimne piwo.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Gomez_Jagd04_16_04"); //Dzis nie mialem szczescia do polowania.
		AI_Output(hero, self, "Info_Mod_Gomez_Jagd04_15_05"); //Musi tak byc.
		AI_Output(self, hero, "Info_Mod_Gomez_Jagd04_16_06"); //Do nastepnego razu pomysle o czyms.
		AI_Output(self, hero, "Info_Mod_Gomez_Jagd04_16_07"); //Ale teraz wracam do twierdzy i mam zimne piwo.

		B_GivePlayerXP	(250);
	};

	B_SetTopicStatus	(TOPIC_MOD_GOMEZHORN, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Gomez_DuHier (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_DuHier_Condition;
	information	= Info_Mod_Gomez_DuHier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ty tutaj? Jak sie tu dostales?";
};

FUNC INT Info_Mod_Gomez_DuHier_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gomez_DuHier_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_DuHier_15_00"); //Ty tutaj? Jak sie tu dostales?
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_16_01"); //Chcesz poznac cala historie? To dosc skomplikowane.
	AI_Output(hero, self, "Info_Mod_Gomez_DuHier_15_02"); //Jasne!
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_16_03"); //Zaczyna sie w Myrtanie, w moim czasie jako dyplomata króla Rhobara.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_16_04"); //Wszystko zaczelo sie od odkrycia przez króla mojej wspólpracy z orkami, gdzie zarobilem troche dodatkowego chleba.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_16_05"); //O tak, to byla zabawa - zeby zobaczyc rozczarowana twarz starego worka, warto bylo.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_16_06"); //Jako kara, zostalem oczywiscie wrzucony do zapory, jak to bylo zwyczajowo w tamtym czasie.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_16_07"); //Innego razu lina by mnie oczekiwala, ale ruda byla dla króla wazniejsza niz moja smierc.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_16_08"); //I jak wszyscy wiedzielismy, bariera nie zostala na zawsze zbudowana, aby mogla zostac ponownie zniesiona, dzieki czemu wszyscy przestepcy mogliby byc wrzuceni do srodka z czystym sumieniem.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_16_09"); //Trudno mi zapamietac czas w kopule.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_16_10"); //Pamietam, ze u podnóza góry zostal zalozony maly obóz z punktem wymiany, w którym znajdowali sie inni wiezniowie.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_16_11"); //To byl trudny czas - po raz pierwszy przyszedlem tutaj do swiadomosci, pod oczami Xardasa.
};

INSTANCE Info_Mod_Gomez_Angebot (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Angebot_Condition;
	information	= Info_Mod_Gomez_Angebot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_Angebot_Condition()
{
	if (Hat_BuddlerNachrichtVonAL == TRUE)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_XeresLebt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_Angebot_Info()
{
	AI_UnequipWeapons	(hero);

	AI_Output(self, hero, "Info_Mod_Gomez_Angebot_16_00"); //Hej, czego chcesz?
	AI_Output(hero, self, "Info_Mod_Gomez_Angebot_15_01"); //Jestem z Starego Obozu i chce, aby oferta Raven byla dla mnie bardzo atrakcyjna.
	AI_Output(self, hero, "Info_Mod_Gomez_Angebot_16_02"); //Stary obóz? Dlaczego to znów mi sie ukluwa? Damn, gdybym po prostu pamietal, co bylo przed tym starym czarownica i Ravenem przyprowadzili mnie do Rycerzy Demonicznych.....
	AI_Output(hero, self, "Info_Mod_Gomez_Angebot_15_03"); //Uwierzcie mi, lepiej, jesli nie pamietasz.
	AI_Output(self, hero, "Info_Mod_Gomez_Angebot_16_04"); //Teraz, gdy mysle o tym, wydaje mi sie, ze widzialem twarz, a teraz, kiedy znów ja widze, czuje potrzebe zanurzenia w niej siekiery.
	AI_Output(hero, self, "Info_Mod_Gomez_Angebot_15_05"); //Mysle, ze lepiej, jesli pozwolisz mi przejsc obok, wysylam prosbe z Arcybarów do Ravena.
	AI_Output(self, hero, "Info_Mod_Gomez_Angebot_16_06"); //Powiedziales, ze Er Barone? To tez slyszalem. Z czasem moje wspomnienia powracaja dosc niejasne. Pierwsze dni w Minentalu.... wtedy prowadzilem obóz, a Raven rzadzil ze mna.... Wiecej
	AI_Output(self, hero, "Info_Mod_Gomez_Angebot_16_07"); //Byl jeszcze jeden obóz, z którym walczylismy. Potem ktos mnie przewrócil i obudzilem sie z Xardasem bez wspomnien. Jesli moge dostac rece na ten pies, który jest....
	AI_Output(hero, self, "Info_Mod_Gomez_Angebot_15_08"); //Nerwowy) No cóz, musze isc teraz do Raven' s, I....
	AI_Output(self, hero, "Info_Mod_Gomez_Angebot_16_09"); //Nigdzie nie trzeba isc! Ponowne spojrzenie w oko bylo bledem! Stracilem dla ciebie mój obóz i pamiec, ale teraz tracisz glowe!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

INSTANCE Info_Mod_Gomez_AtAL (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_AtAL_Condition;
	information	= Info_Mod_Gomez_AtAL_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_AtAL_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_DaemonenritterWache_Hi))
	&& (!Npc_IsInState(Mod_7066_DMR_Daemonenritter_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_AtAL_Info()
{
	AI_TurnToNpc	(self, Mod_7066_DMR_Daemonenritter_MT);

	AI_Output(self, hero, "Info_Mod_Gomez_AtAL_16_00"); //
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Gomez_AtAL2 (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_AtAL2_Condition;
	information	= Info_Mod_Gomez_AtAL2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_AtAL2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_DaemonenritterWache_Hi))
	&& (!Npc_IsInState(Mod_7066_DMR_Daemonenritter_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_AtAL2_Info()
{
	AI_Output(self, hero, "Info_Mod_Gomez_AtAL2_16_00"); //Tak wiec, mlody wojownik, powiedz co masz do powiedzenia i pozwól bogom miec milosierdzie na ciebie, jesli nie jest to naprawde wazne.
};

INSTANCE Info_Mod_Gomez_AtAL2_A (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_AtAL2_A_Condition;
	information	= Info_Mod_Gomez_AtAL2_A_Info;
	permanent	= 0;
	important	= 0;
	description	= "Strazników poza obozem atakuje sie.";
};

FUNC INT Info_Mod_Gomez_AtAL2_A_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_AtAL2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gomez_AtAL2_B))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_AtAL2_A_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_AtAL2_A_15_00"); //Strazników poza obozem atakuje sie. Potrzebujemy Cie osobiscie.
	AI_Output(self, hero, "Info_Mod_Gomez_AtAL2_A_16_01"); //jesli ci przegrani nie sa w stanie poradzic sobie z tym sami, to ich wina.... dopóki nikt nie zaatakuje w obozie, nie obchodzi mnie to. Co jeszcze innego?
};

INSTANCE Info_Mod_Gomez_AtAL2_B (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_AtAL2_B_Condition;
	information	= Info_Mod_Gomez_AtAL2_B_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na jednym z wysokich siedzisk poza obozem, jeden z naszych ludzi szalal i strzelal do nich.";
};

FUNC INT Info_Mod_Gomez_AtAL2_B_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_AtAL2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_AtAL2_B_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_AtAL2_B_15_00"); //Na jednym z wysokich siedzisk poza obozem, jeden z naszych ludzi szalal i strzelal do nich. On jest dla nas zbyt silny, potrzebujemy Cie osobiscie.
	AI_Output(self, hero, "Info_Mod_Gomez_AtAL2_B_16_01"); //zdrajca? To mnie martwi. Mysle, ze powinienem zadbac o tego faceta, zanim spowoduje on straty w obozie.

	B_LogEntry	(TOPIC_MOD_AL_LOCKVOGEL, "Gomez opuszcza obóz..... Teraz wiedzielismy, ze on nie zyje!");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "OUTDOOR");

	B_StartOtherRoutine	(Mod_1874_HMG_Makanius_MT, "OUTDOOR");
	AI_Teleport	(Mod_1874_HMG_Makanius_MT, "OC1");

	B_StartOtherRoutine	(Mod_7039_PAL_Oric_MT, "OUTDOOR");
	AI_Teleport	(Mod_7039_PAL_Oric_MT, "OC1");

	B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "OUTDOOR");
	AI_Teleport	(Mod_1870_EBR_Alissandro_MT, "OC1");
};

INSTANCE Info_Mod_Gomez_AtAL2_C (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_AtAL2_C_Condition;
	information	= Info_Mod_Gomez_AtAL2_C_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alissandro chce negocjowac.";
};

FUNC INT Info_Mod_Gomez_AtAL2_C_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_AtAL2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gomez_AtAL2_B))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_AtAL2_C_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_AtAL2_C_15_00"); //Alissandro chce negocjowac. Nalega jednak, aby widziec cie osobiscie i bez uzbrojonej eskorty.
	AI_Output(self, hero, "Info_Mod_Gomez_AtAL2_C_16_01"); //Czy ten stary bastard mysle, ze jestem glupi? Zapach niczym pulapka. Negocjacje prowadzone sa na moich warunkach.
};

INSTANCE Info_Mod_Gomez_AtAL3 (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_AtAL3_Condition;
	information	= Info_Mod_Gomez_AtAL3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_AtAL3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_Oric))
	&& (!Npc_IsInState(Mod_520_DMR_Raven_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_AtAL3_Info()
{
	AI_TurnToNpc	(self, Mod_520_DMR_Raven_MT);

	AI_Output(self, hero, "Info_Mod_Gomez_AtAL3_16_00"); //O co to bylo chodzilo? Chcesz odebrac mój obóz? Nie musisz mnie zamawiac, Raven.
	AI_Output(self, hero, "Info_Mod_Gomez_AtAL3_16_01"); //Kiedys bylem tym, który wydal ci zamówienia i tylko dlatego, ze ssales do Xardas, nie masz prawa decydowac o takich sprawach.
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Gomez_Pickpocket (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Pickpocket_Condition;
	information	= Info_Mod_Gomez_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Gomez_Pickpocket_Condition()
{
	C_Beklauen	(160, ItMi_Gold, 106);
};

FUNC VOID Info_Mod_Gomez_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);

	Info_AddChoice	(Info_Mod_Gomez_Pickpocket, DIALOG_BACK, Info_Mod_Gomez_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gomez_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gomez_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gomez_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);
};

FUNC VOID Info_Mod_Gomez_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);

		Info_AddChoice	(Info_Mod_Gomez_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Gomez_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Gomez_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Gomez_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Gomez_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Gomez_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Gomez_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Gomez_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Gomez_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Gomez_EXIT (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_EXIT_Condition;
	information	= Info_Mod_Gomez_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gomez_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gomez_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
