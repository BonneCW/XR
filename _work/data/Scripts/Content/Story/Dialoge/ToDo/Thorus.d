INSTANCE Info_Mod_Thorus_Hi (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Hi_Condition;
	information	= Info_Mod_Thorus_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thorus_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thorus_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Thorus_Hi_12_00"); //Ty! Nie oszczedze!
	AI_Output(hero, self, "Info_Mod_Thorus_Hi_15_01"); //Witaj, Thorus. Przeszliscie dluga droge, widze.
	AI_Output(self, hero, "Info_Mod_Thorus_Hi_12_02"); //Jak go zabrac. W tych czterech scianach kazdy slucha mnie, ale nie wiem, jak to wyglada na zewnatrz.
	AI_Output(hero, self, "Info_Mod_Thorus_Hi_15_03"); //Czy nie mozesz wyjsc?
	AI_Output(self, hero, "Info_Mod_Thorus_Hi_12_04"); //Pewne, zawsze. Jesli chce podjac ryzyko ataku lub zastrzelenia.
	AI_Output(self, hero, "Info_Mod_Thorus_Hi_12_05"); //I prosze mi wierzyc, ryzyko nie jest zbyt male.
};

INSTANCE Info_Mod_Thorus_Schlecht (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Schlecht_Condition;
	information	= Info_Mod_Thorus_Schlecht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Uslyszalem, ze potrzebowales pomocy.";
};

FUNC INT Info_Mod_Thorus_Schlecht_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Thorus_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Bartholo_Hi)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Schlecht_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Schlecht_15_00"); //Ich habe gesehen, dass es euch ziemlich dreckig geht, und will euch helfen. 
	AI_Output(self, hero, "Info_Mod_Thorus_Schlecht_12_01"); //Soso, auf einmal willst du uns helfen? Nun, wir können jeden brauchen. Aber woher wissen wir, ob wir dir vertrauen können?
	AI_Output(self, hero, "Info_Mod_Thorus_Schlecht_12_02"); //Du erinnerst dich doch noch an die Aufnahme zur Zeit der Kolonie.

	Info_ClearChoices	(Info_Mod_Thorus_Schlecht);

	Info_AddChoice	(Info_Mod_Thorus_Schlecht, "Nie.", Info_Mod_Thorus_Schlecht_Nein);
	Info_AddChoice	(Info_Mod_Thorus_Schlecht, "Tak.", Info_Mod_Thorus_Schlecht_Ja);
};

FUNC VOID Info_Mod_Thorus_Schlecht_Nein()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Schlecht_Nein_15_00"); //Nie.
	AI_Output(self, hero, "Info_Mod_Thorus_Schlecht_Nein_12_01"); //Kazdy kandydat musi zdac egzamin specjalny. Sprawdza, czy mozemy Ci zaufac.

	Info_ClearChoices	(Info_Mod_Thorus_Schlecht);
};

FUNC VOID Info_Mod_Thorus_Schlecht_Ja()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Schlecht_Ja_15_00"); //Tak, masz na mysli próbe zaufania.
	AI_Output(self, hero, "Info_Mod_Thorus_Schlecht_Ja_12_01"); //Dokladnie.

	Info_ClearChoices	(Info_Mod_Thorus_Schlecht);
};

INSTANCE Info_Mod_Thorus_Pruefung (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Pruefung_Condition;
	information	= Info_Mod_Thorus_Pruefung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co chcesz, abym zrobil?";
};

FUNC INT Info_Mod_Thorus_Pruefung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Schlecht))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Pruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Pruefung_15_00"); //Co chcesz, abym zrobil?
	AI_Output(self, hero, "Info_Mod_Thorus_Pruefung_12_01"); //Ktos kradnie towary z Domu Arcybaronów i chce, abyscie je znalezli i dali mi dowód przeciwko nim.
	AI_Output(hero, self, "Info_Mod_Thorus_Pruefung_15_02"); //Cóz, czy sa jakies informacje na jego temat?
	AI_Output(self, hero, "Info_Mod_Thorus_Pruefung_12_03"); //Zapytaj Alissandro, zebral wszystkie niezbedne informacje.

	Log_CreateTopic	(TOPIC_MOD_PDV, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PDV, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PDV, "Ktos kradnie barony luków i poniewaz musze dac swiadectwo zaufania, mam zaszczyt odnalezc winowajce. Baron Alissandro dostarczy mi niezbednych informacji.");
};

INSTANCE Info_Mod_Thorus_Diebe (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Diebe_Condition;
	information	= Info_Mod_Thorus_Diebe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wiem, kim sa zlodzieje.";
};

FUNC INT Info_Mod_Thorus_Diebe_Condition()
{
	if (Mod_PDV_Fisk_Infos == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Diebe_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Diebe_15_00"); //
	AI_Output(self, hero, "Info_Mod_Thorus_Diebe_12_01"); //
	AI_Output(hero, self, "Info_Mod_Thorus_Diebe_15_02"); //
	AI_Output(self, hero, "Info_Mod_Thorus_Diebe_12_03"); //
	AI_Output(hero, self, "Info_Mod_Thorus_Diebe_15_04"); //
	AI_Output(self, hero, "Info_Mod_Thorus_Diebe_12_05"); //

	B_LogEntry	(TOPIC_MOD_PDV, "Cóz, zglosilem je Thorusowi. Bedzie ja trzymal az do momentu, kiedy bede mial dowód.");

	AI_Teleport	(Mod_943_GRD_Bloodwyn_MT, "OCC_CELLAR_BACK_RIGHT_CELL");
	AI_Teleport	(Mod_1110_GRD_Cutter_MT, "OCC_CELLAR_BACK_LEFT_CELL");

	B_StartOtherRoutine	(Mod_943_GRD_Bloodwyn_MT, "KNAST");
	B_StartOtherRoutine	(Mod_1110_GRD_Cutter_MT, "KNAST");

	AI_UnequipWeapons	(Mod_943_GRD_Bloodwyn_MT);

	Npc_RemoveInvItems	(Mod_943_GRD_Bloodwyn_MT, ItMw_Sturmbringer, 1);
};

INSTANCE Info_Mod_Thorus_Zettel (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Zettel_Condition;
	information	= Info_Mod_Thorus_Zettel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam panstwa dowód.";
};

FUNC INT Info_Mod_Thorus_Zettel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_Zettel))
	&& (Npc_HasItems(hero, ItWr_FisksNotiz) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Zettel_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Zettel_15_00"); //
	
	B_GiveInvItems	(hero, self, ItWr_FisksNotiz, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Thorus_Zettel_12_01"); //

	if (Mod_AnzahlNebengilden < MaxNebengilden)
	&& (Banditen_Dabei == FALSE)
	&& (hero.guild != GIL_MIL)
	&& (KG_Dabei == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Thorus_Zettel_12_02"); //

		B_LogEntry	(TOPIC_MOD_PDV, "Thorus zablokowal Cutter i Bloodwyn. Moge teraz zostac straznikiem.");

		B_Göttergefallen(2, 1);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Thorus_Zettel_12_03"); //
	};

	B_SetTopicStatus	(TOPIC_MOD_PDV, LOG_SUCCESS);

	B_GivePlayerXP	(400);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Thorus_Aufnahme (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Aufnahme_Condition;
	information	= Info_Mod_Thorus_Aufnahme_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chce byc straznikiem.";
};

FUNC INT Info_Mod_Thorus_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Zettel))
	&& (Mod_AnzahlNebengilden < MaxNebengilden)
	&& (Banditen_Dabei == FALSE)
	&& (hero.guild != GIL_MIL)
	&& (KG_Dabei == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Aufnahme_Info()
{
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_54);
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_65);
	
	AI_Output(hero, self, "Info_Mod_Thorus_Aufnahme_15_00"); //Chce byc straznikiem.
	AI_Output(self, hero, "Info_Mod_Thorus_Aufnahme_12_01"); //Potem zapraszamy do straznika. Oto Twoja zbroja.

	Log_CreateTopic	(TOPIC_MOD_NEBENGILDEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NEBENGILDEN, "Thorus zabral mnie z straznikami starego obozu.");

	CreateInvItems	(self, GRD_ARMOR_L, 1);
	B_GiveInvItems	(self, hero, GRD_ARMOR_L, 1);

	Gardist_Dabei = TRUE;

	Mod_AnzahlNebengilden += 1;

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Thorus_Arena (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Arena_Condition;
	information	= Info_Mod_Thorus_Arena_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz dla mnie cos do zrobienia?";
};

FUNC INT Info_Mod_Thorus_Arena_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Zettel))
	&& (Gardist_Dabei == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Arena_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Arena_15_00"); //Masz dla mnie cos do zrobienia?
	AI_Output(self, hero, "Info_Mod_Thorus_Arena_12_01"); //Tak, na arenie sa problemy. Nie moge tego udowodnic, ale jeden z bojowników walczy niesprawiedliwymi srodkami.
	AI_Output(hero, self, "Info_Mod_Thorus_Arena_15_02"); //Co sie z nim dzieje?
	AI_Output(self, hero, "Info_Mod_Thorus_Arena_12_03"); //Nikt go nie pokonal przez wiele dni, mimo ze nie walczy zbyt sprawnie. Chcialbym, aby przyjrzal sie pan temu zagadnieniu.
	AI_Output(hero, self, "Info_Mod_Thorus_Arena_15_04"); //Dobre.
	AI_Output(self, hero, "Info_Mod_Thorus_Arena_12_05"); //Jedna z jego walk ma sie wkrótce odbyc. Mozna by sie temu przyjrzec.

	Log_CreateTopic	(TOPIC_MOD_AL_ARENA, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_ARENA, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_ARENA, "Thorus powiedzial, ze obcy nieznajomy, który walczy na arenie, nie zostal pokonany przez wiele dni, mimo swojej nieudolnosci. Mysle, ze przyjrze sie temu.");

	B_StartOtherRoutine	(Mod_962_STT_Scatty_MT,	"ARENAFIGHT");
	B_StartOtherRoutine	(Mod_1871_TPL_GorKaranto_MT, "ARENAFIGHT");
	B_StartOtherRoutine	(Mod_1872_NONE_Unbekannt_MT, "ARENAFIGHT");
};

INSTANCE Info_Mod_Thorus_Verloren (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Verloren_Condition;
	information	= Info_Mod_Thorus_Verloren_Info;
	permanent	= 0;
	important	= 0;
	description	= "Walczac z nieznanymi....";
};

FUNC INT Info_Mod_Thorus_Verloren_Condition()
{
	if (Mod_GorKarantoSchwach == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Verloren_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Verloren_15_00"); //
	AI_Output(self, hero, "Info_Mod_Thorus_Verloren_12_01"); //

	B_LogEntry	(TOPIC_MOD_AL_ARENA, "Thorus nie dopomógl.");

	B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "UNBEKANNTER");

	Mob_CreateItems	("TRUHE_MT_100", ItSc_Schwaechen, 15);
	Mob_CreateItems	("TRUHE_MT_100", ItWr_DraganNachricht, 1);
};

INSTANCE Info_Mod_Thorus_Botschaft (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Botschaft_Condition;
	information	= Info_Mod_Thorus_Botschaft_Info;
	permanent	= 0;
	important	= 0;
	description	= "Znalazlem kilka informacji.";
};

FUNC INT Info_Mod_Thorus_Botschaft_Condition()
{
	if (Mod_GorKarantoSchwach == 7)
	&& (Npc_HasItems(hero, ItWr_DraganNachricht) == 1)
	&& (Npc_HasItems(hero, ItSc_Schwaechen) == 15)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Botschaft_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Botschaft_15_00"); //Oto te role i to przeslanie znalazlem w chacie nieznanego.

	Npc_RemoveInvItems	(hero, ItWr_DraganNachricht, 1);
	Npc_RemoveInvItems	(hero, ItSc_Schwaechen, 15);
	
	B_ShowGivenThings	("Wiadomosc i role slabych punktów");

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Thorus_Botschaft_12_01"); //To jest Paran i Dragan. Nie pomyslalbym, ze to mozliwe.
	AI_Output(hero, self, "Info_Mod_Thorus_Botschaft_15_02"); //Kim sa Paran i Dragan?
	AI_Output(self, hero, "Info_Mod_Thorus_Botschaft_12_03"); //Dwóch malych zlodziei wiszacych przed chwila wokól obozu. Chcieli oni uwolnic ludzi obozu z ich rzeczy. Potem straznicy zauwazyli to i wygnali ich.
	AI_Output(self, hero, "Info_Mod_Thorus_Botschaft_12_04"); //No cóz, teraz, gdy mamy zaklecia, mozesz znów rzucic mu wyzwanie.

	B_LogEntry	(TOPIC_MOD_AL_ARENA, "Thorus powiedzial, ze nieznajomy nie jest niczym innym jak drobnym zlodziejem. Teraz juz nie bede mial problemów z pokonaniem go.");
};

INSTANCE Info_Mod_Thorus_ParanWeg (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_ParanWeg_Condition;
	information	= Info_Mod_Thorus_ParanWeg_Info;
	permanent	= 0;
	important	= 0;
	description	= "Paran i Dragan nie sprawia wiecej klopotów.";
};

FUNC INT Info_Mod_Thorus_ParanWeg_Condition()
{
	if (Mod_GorKarantoSchwach > 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_ParanWeg_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_ParanWeg_15_00"); //Paran i Dragan nie sprawia wiecej klopotów.
	AI_Output(self, hero, "Info_Mod_Thorus_ParanWeg_12_01"); //Cóz, tutaj mozesz zachowac role.

	CreateInvItems	(self, ItSc_Schwaechen, 15);
	B_GiveInvItems	(self, hero, ItSc_Schwaechen, 15);

	B_SetTopicStatus	(TOPIC_MOD_AL_ARENA, LOG_SUCCESS);

	B_Göttergefallen(2, 1);

	B_GivePlayerXP	(500);
};

INSTANCE Info_Mod_Thorus_FrischeLuft (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_FrischeLuft_Condition;
	information	= Info_Mod_Thorus_FrischeLuft_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thorus_FrischeLuft_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_ParanWeg))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_FrischeLuft_Info()
{
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_00"); //Mysle, ze nadszedl czas, abys mial troche swiezego powietrza. Mam prace dla Ciebie.
	AI_Output(hero, self, "Info_Mod_Thorus_FrischeLuft_15_01"); //Co o tym chodzi?
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_02"); //Udasz sie do nowego obozu i porwiesz jednego z oficerów Lee. Nazywa sie Orik.
	AI_Output(hero, self, "Info_Mod_Thorus_FrischeLuft_15_03"); //Co? Samobójstwo byloby samobójstwem, gdyby udac sie do nowego obozu. I wyciagnac z niej kogos.
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_04"); //To wszystko jest w porzadku, Arto pójdzie z toba. On równiez bedzie przewodniczyl misji.
	AI_Output(hero, self, "Info_Mod_Thorus_FrischeLuft_15_05"); //Dlaczego kieruje misja?
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_06"); //Poniewaz jest Erzbaronem, a Ty jestes straznikiem.
	AI_Output(hero, self, "Info_Mod_Thorus_FrischeLuft_15_07"); //Widze.
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_08"); //Cóz, powodzenia, wtedy zycze Wam wszystkiego najlepszego. Oto bandyta. Nie rozpoznaja Cie z tym.

	CreateInvItems	(self, ItAr_BDT_M_01, 1);
	B_GiveInvItems	(self, hero, ItAr_BDT_M_01, 1);

	Log_CreateTopic	(TOPIC_MOD_AL_ORIK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_ORIK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_ORIK, "Thorus kazal mi zabrac z Arto Orika, najemnika. Dal mi pancerz bandyta na okladke.");
};

INSTANCE Info_Mod_Thorus_OrikDabei (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_OrikDabei_Condition;
	information	= Info_Mod_Thorus_OrikDabei_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mamy Orika.";
};

FUNC INT Info_Mod_Thorus_OrikDabei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Arto_BeiThorus))
	&& (Npc_GetDistToWP(Mod_1266_SLD_Orik_MT, "OCC_BARONS_DANCE2") < 1000)
	&& (Npc_HasItems(hero, ItAr_BDT_M_01) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_OrikDabei_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_OrikDabei_15_00"); //
	AI_Output(self, hero, "Info_Mod_Thorus_OrikDabei_12_01"); //
	AI_Output(self, hero, "Info_Mod_Thorus_OrikDabei_12_02"); //

	CreateInvItems	(hero, ItMi_Gold, 500);
	CreateInvItems	(hero, GRD_ARMOR_M, 1);

	B_ShowGivenThings	("500 Zlote i szatnie otrzymane");

	var C_Item itm;
	
	itm = Npc_GetEquippedArmor(hero);
	if (Hlp_IsItem(itm, ITAR_BDT_M_01) == TRUE)
	{
		AI_UnequipArmor	(hero);

		AI_EquipBestArmor	(hero);
	};

	Mod_OrikAbgeliefert = Wld_GetDay();

	Npc_RemoveInvItems	(hero, ItAr_BDT_M_01, 1);

	B_LogEntry	(TOPIC_MOD_AL_ORIK, "Przekazalismy Orika Thorusa, ale moga pojawic sie problemy z nowym obozem.");
	B_SetTopicStatus	(TOPIC_MOD_AL_ORIK, LOG_SUCCESS);

	AI_Teleport	(Mod_1266_SLD_Orik_MT, "OCC_CELLAR_FRONT_RIGHT_CELL");
	B_StartOtherRoutine	(Mod_1266_SLD_Orik_MT, "KNAST");

	B_GivePlayerXP	(500);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Thorus_Templer (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Templer_Condition;
	information	= Info_Mod_Thorus_Templer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jest templariusz?";
};

FUNC INT Info_Mod_Thorus_Templer_Condition()
{
	if (Mod_TemplerBeiThorus == 1)
	&& (Npc_GetDistToWP(self, "OCC_BARONS_DANCE2") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Templer_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Templer_15_00"); //
	AI_Output(self, hero, "Info_Mod_Thorus_Templer_12_01"); //
	AI_Output(self, hero, "Info_Mod_Thorus_Templer_12_02"); //
	AI_Output(hero, self, "Info_Mod_Thorus_Templer_15_03"); //
	AI_Output(self, hero, "Info_Mod_Thorus_Templer_12_04"); //

	B_Say	(hero, self, "$WOFINDEICHIHN");

	AI_Output(self, hero, "Info_Mod_Thorus_Templer_12_06"); //

	CreateInvItems	(self, DungeonKey, 1);
	B_GiveInvItems	(self, hero, DungeonKey, 1);

	B_KillNpc	(Mod_1110_GRD_Cutter_MT);

	Log_CreateTopic	(TOPIC_MOD_AL_SCHMUGGLER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_SCHMUGGLER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_SCHMUGGLER, "Thorus zatrudnil mnie do uzyskania informacji od Cuttera. Znajde go w lochu.");
};

INSTANCE Info_Mod_Thorus_CutterTot (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_CutterTot_Condition;
	information	= Info_Mod_Thorus_CutterTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Smierc noza.";
};

FUNC INT Info_Mod_Thorus_CutterTot_Condition()
{
	if (Mod_TemplerBeiThorus == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_CutterTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_CutterTot_15_00"); //Smierc noza.
	AI_Output(self, hero, "Info_Mod_Thorus_CutterTot_12_01"); //Damn, to oczywiscie komplikuje sytuacje.
	AI_Output(hero, self, "Info_Mod_Thorus_CutterTot_15_02"); //Kiedy bylem z nim w lochu, ktos zamknal brame.
	AI_Output(self, hero, "Info_Mod_Thorus_CutterTot_12_03"); //Najwyrazniej chca sie cie pozbyc, wiec badz ostrozny.
	AI_Output(hero, self, "Info_Mod_Thorus_CutterTot_15_04"); //Rozumiem, bede uwazny. Czy istnieja inne wskazania?
	AI_Output(self, hero, "Info_Mod_Thorus_CutterTot_12_05"); //Nie, mialem nadzieje na niektórych z Was.

	B_LogEntry	(TOPIC_MOD_AL_SCHMUGGLER, "Powiedzialem Thorusowi, ze Cutter jest martwy.");

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Thorus_WasLos (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_WasLos_Condition;
	information	= Info_Mod_Thorus_WasLos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co sie dzieje?";
};

FUNC INT Info_Mod_Thorus_WasLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_WasLos_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_WasLos_15_00"); //Co sie dzieje?
	AI_Output(self, hero, "Info_Mod_Thorus_WasLos_12_01"); //Ach, niektórzy straznicy i kopaczki wciaz gniewaja sie, ze wzialem sprawe w rece po zniknieciu Gomeza.
	AI_Output(self, hero, "Info_Mod_Thorus_WasLos_12_02"); //Skorpion i najbardziej lojalni zwolennicy odeszli teraz, ale nadal ma dosc gwaltownych sympatyków, którzy woleliby widziec go jako nowego przywódce.
};

INSTANCE Info_Mod_Thorus_Ian (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Ian_Condition;
	information	= Info_Mod_Thorus_Ian_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ian opowiedzial mi o dawnej mojej starej rzeczy.";
};

FUNC INT Info_Mod_Thorus_Ian_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Ian_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Ian_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Ian_15_00"); //Ian opowiedzial mi o dawnej mojej starej rzeczy.
	AI_Output(self, hero, "Info_Mod_Thorus_Ian_12_01"); //Tak, i? Czy teraz oczekujesz tez, ze zostawie caly obóz bez strzezony i ryzykujesz, zebym odzyskal glowe i szyje cos, z czym nie mozemy nic zrobic w tej chwili?
	AI_Output(self, hero, "Info_Mod_Thorus_Ian_12_02"); //Po utracie wielu dobrych mezczyzn, nie mamy mozliwosci prowadzenia i kontrolowania operacji skladowania i pracy kopalni jednoczesnie!
};

INSTANCE Info_Mod_Thorus_Erzbaron (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Erzbaron_Condition;
	information	= Info_Mod_Thorus_Erzbaron_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dlaczego jestes Erzbaronem?";
};

FUNC INT Info_Mod_Thorus_Erzbaron_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Schlecht))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Erzbaron_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Erzbaron_15_00"); //Dlaczego jestes Erzbaronem?
	AI_Output(self, hero, "Info_Mod_Thorus_Erzbaron_12_01"); //Gomez znikl. Zakladamy, ze umarl, ale jego cialo nigdy nie zostalo znalezione.
	AI_Output(self, hero, "Info_Mod_Thorus_Erzbaron_12_02"); //Scar i Raven równiez znikneli w nocy i nikt nie wie, czy przestraszyl sie, czy tez dyskretnie wyszedl z rogu.
	AI_Output(self, hero, "Info_Mod_Thorus_Erzbaron_12_03"); //Przez krótki czas byl to Bartholo, ale nie byl w stanie prowadzic obozu przez ponad tydzien i ponownie objal stare stanowisko administratora.
	AI_Output(self, hero, "Info_Mod_Thorus_Erzbaron_12_04"); //Arto na szczescie zrezygnowal z biura. Teraz mielismy problem, ale dzieki wewnetrznej decyzji zostalem Erzbaronem.
	AI_Output(hero, self, "Info_Mod_Thorus_Erzbaron_15_05"); //Widze.

	if (!Npc_KnowsInfo(hero, Info_Mod_Thorus_Erzbaron))
	{
		B_LogEntry	(TOPIC_MOD_ALTESLAGER, "Wiec Thorus zajal miejsce Gomeza i byl dosc zyczliwy. Cóz, maja szczescie, ze pozbyli sie Gomeza. Raven i Scar równiez ruszyli z miejsca.");
	};
};

var int Thorus_LastPetzCounter;
var int Thorus_LastPetzCrime;

INSTANCE Info_Mod_Thorus_PMSchulden (C_INFO)
{
	npc         	= Mod_966_GRD_Thorus_MT;
	nr          	= 1;
	condition   	= Info_Mod_Thorus_PMSchulden_Condition;
	information 	= Info_Mod_Thorus_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Thorus_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Thorus_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Thorus_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Thorus_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_00"); //Czy przyszedles/as zaplacic grzywne?

	if (B_GetTotalPetzCounter(self) > Thorus_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_01"); //Zastanawialem sie, czy nawet nie osmieliscie sie tu przyjechac!
		AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_02"); //Najwyrazniej nie sa to ostatnie oskarzenia!

		if (Thorus_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_03"); //Ostrzegam cie! Grzywna, która musisz zaplacic jest teraz wyzsza!
			AI_Output (hero, self, "Info_Mod_Thorus_PMAdd_15_00"); //Ile?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Thorus_LastPetzCounter);
		
			if (diff > 0)
			{
				Thorus_Schulden = Thorus_Schulden + (diff * 50);
			};
		
			if (Thorus_Schulden > 1000)	{	Thorus_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Thorus_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_04"); //Zapusciles mnie tak zle!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Thorus_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_05"); //Pojawily sie nowe rzeczy.
		
		if (Thorus_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_06"); //Nagle nie ma juz nikogo, kto oskarzalby cie o morderstwo.
		};
		
		if (Thorus_LastPetzCrime == CRIME_THEFT)
		|| ( (Thorus_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_07"); //Nikt nie pamieta, ze widzisz sie przy kradziezy.
		};
		
		if (Thorus_LastPetzCrime == CRIME_ATTACK)
		|| ( (Thorus_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_08"); //Nie ma juz zadnych swiadków tego, ze kiedykolwiek walczyles.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_09"); //Widocznie wszystkie zarzuty przeciwko Tobie zniknely.
		};
		
		AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_10"); //Nie wiem, co sie stalo, ale ostrzegam: nie graj ze mna.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_11"); //Zrezygnowalem z waszego zadluzenia.
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_12"); //Upewnij sie, ze nie popadniesz ponownie w klopoty.
	
			Thorus_Schulden			= 0;
			Thorus_LastPetzCounter 	= 0;
			Thorus_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_13"); //Jedno jest pewne: nadal trzeba zaplacic kare w calosci.
			B_Say_Gold (self, hero, Thorus_Schulden);
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_14"); //Co to jest?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Thorus_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Thorus_PETZMASTER);
		Info_AddChoice		(Info_Mod_Thorus_PMSchulden, "Nie mam wystarczajaco duzo zlota!", Info_Mod_Thorus_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Thorus_PMSchulden, "Ile to znów bylo?", Info_Mod_Thorus_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Thorus_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Thorus_PMSchulden, "Chce zaplacic grzywne.", Info_Mod_Thorus_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Thorus_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Thorus_PMSchulden_HowMuchAgain_15_00"); //Ile to znów bylo?
	B_Say_Gold (self, hero, Thorus_Schulden);

	Info_ClearChoices  	(Info_Mod_Thorus_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Thorus_PETZMASTER);
	Info_AddChoice		(Info_Mod_Thorus_PMSchulden, "Nie mam wystarczajaco duzo zlota!", Info_Mod_Thorus_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Thorus_PMSchulden, "Ile to znów bylo?", Info_Mod_Thorus_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Thorus_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Thorus_PMSchulden, "Chce zaplacic grzywne.", Info_Mod_Thorus_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Thorus_PETZMASTER   (C_INFO)
{
	npc         	= Mod_966_GRD_Thorus_MT;
	nr          	= 1;
	condition   	= Info_Mod_Thorus_PETZMASTER_Condition;
	information 	= Info_Mod_Thorus_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Thorus_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Thorus_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Thorus_PETZMASTER_Info()
{
	Thorus_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_01"); //Ciesze sie, ze przyszedles do mnie, zanim sytuacja sie pogorszyla.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_02"); //Morderstwo jest powaznym wykroczeniem!

		Thorus_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Thorus_Schulden = Thorus_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_03"); //Nie wspominajac o innych rzeczach, które zrobiles.
		};

		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_04"); //Straznicy maja rozkaz osadzania kazdego mordercy na miejscu.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_05"); //Nawet wiekszosc cieni nie toleruje mordercy w obozie!
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_06"); //Nie interesuje mnie to, ze moge panstwa umiescic na szubienicy. Jestesmy na wojnie i potrzebujemy kazdego czlowieka, którego mozemy dostac.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_07"); //Ale nie bedzie latwo sprawic, by ludzie znów byli laskawi.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_08"); //Mozesz okazac swoja pokute placac grzywne - oczywiscie kara musi byc odpowiednia.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_09"); //Dobrze! Jestes oskarzony o kradziez! Sa swiadkowie!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_10"); //Nie chce nawet mówic o innych rzeczach, które slyszalem.
		};

		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_11"); //Nie bede tolerowal takiego zachowania w obozie!
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_12"); //Bedziesz musial zaplacic grzywne za swoje przestepstwo!
		
		Thorus_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_13"); //Jesli walczysz z Buddlerami, to jest jedna rzecz....
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_14"); //Jesli jednak zaatakujesz Cienie lub Ochraniacze, bede musial Cie pociagnac do odpowiedzialnosci.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_15"); //I nie sadze, aby tak bylo w przypadku owiec.
		};

		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_16"); //Jesli pozwole wam sie z tym uporac, wszyscy beda robic to, co chca.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_17"); //Placi sie wiec odpowiednia grzywne - a cala sprawa zostanie zapomniana.
		
		Thorus_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_18"); //Slyszalem, ze balaganiles sie z naszymi owcami.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_19"); //Zdajesz sobie sprawe, ze nie moge tego przepuscic.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_20"); //Bedziesz musial wyplacic odszkodowanie!
		
		Thorus_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Thorus_PETZMASTER_15_21"); //Ile?
	
	if (Thorus_Schulden > 1000)	{	Thorus_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Thorus_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Thorus_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Thorus_PETZMASTER);
	Info_AddChoice		(Info_Mod_Thorus_PETZMASTER, "Nie mam wystarczajaco duzo zlota!", Info_Mod_Thorus_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Thorus_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Thorus_PETZMASTER, "Chce zaplacic grzywne.", Info_Mod_Thorus_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Thorus_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Thorus_PETZMASTER_PayNow_15_00"); //Chce zaplacic grzywne!
	B_GiveInvItems (hero, self, itmi_gold, Thorus_Schulden);
	AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_PayNow_12_01"); //Dobrze! Doloze wszelkich staran, aby wszyscy w obozie sie o tym dowiedzieli - w pewnym stopniu przywróci to Twoja reputacje.

	B_GrantAbsolution (LOC_OLDCAMP);
	
	Thorus_Schulden			= 0;
	Thorus_LastPetzCounter 	= 0;
	Thorus_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Thorus_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Thorus_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Thorus_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Thorus_PETZMASTER_PayLater_15_00"); //Nie mam wystarczajaco duzo zlota!
	AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_PayLater_12_01"); //Nastepnie zobacz, ze zloto dostaniesz jak najszybciej.
	AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_PayLater_12_02"); //I ostrzegam cie, ze jesli cokolwiek zawdzieczasz sobie, to bedzie ci gorzej.
	
	Thorus_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Thorus_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Thorus_Lehrer (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Lehrer_Condition;
	information	= Info_Mod_Thorus_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy moge sie od Ciebie nauczyc?";
};

FUNC INT Info_Mod_Thorus_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Hi))
	&& ((Schatten_Dabei == TRUE)
	|| (Gardist_Dabei == TRUE)
	|| (Erzbaron_Dabei == TRUE))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Lehrer_15_00"); //Czy moge sie od Ciebie nauczyc?
	AI_Output(self, hero, "Info_Mod_Thorus_Lehrer_12_01"); //Poniewaz jestescie jednym z nas, naucze Was jak stac sie silniejszymi i bardziej umiejetnymi.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_OLDCAMP, "Thorus moze mnie nauczyc byc silniejszy i bardziej umiejetny.");
};

INSTANCE Info_Mod_Thorus_Lernen (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Lernen_Condition;
	information	= Info_Mod_Thorus_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Naucz mnie czegos.";
};

FUNC INT Info_Mod_Thorus_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Lehrer))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Lernen_15_00"); //Naucz mnie czegos.

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

FUNC VOID Info_Mod_Thorus_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Thorus_Lernen);
};

FUNC VOID Info_Mod_Thorus_Lernen_DEX_5()
{
	B_TeachAttributePoints_New	(self, hero, ATR_DEXTERITY, 5, 200);

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

FUNC VOID Info_Mod_Thorus_Lernen_DEX_1()
{
	B_TeachAttributePoints	(self, hero, ATR_DEXTERITY, 1, 200);

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

FUNC VOID Info_Mod_Thorus_Lernen_STR_5()
{
	B_TeachAttributePoints_New	(self, hero, ATR_STRENGTH, 5, 200);

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

FUNC VOID Info_Mod_Thorus_Lernen_STR_1()
{
	B_TeachAttributePoints	(self, hero, ATR_STRENGTH, 1, 200);

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

// ------------------------------------------------------------
// 			  				CANYOUTEACH 
// ------------------------------------------------------------ 

INSTANCE Info_Mod_Thorus_CanYouTeach   (C_INFO) 
{ 
	npc     	= Mod_966_GRD_Thorus_MT; 
	nr          = 1; 
	condition   = Info_Mod_Thorus_CanYouTeach_Condition; 
	information = Info_Mod_Thorus_CanYouTeach_Info; 
	important   = FALSE; 
	permanent   = FALSE; 
	description = ""; 
}; 
 
FUNC INT Info_Mod_Thorus_CanYouTeach_Condition () 
{ 
    if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Lehrer)) 
    { 
  	 	return TRUE; 
    }; 
}; 
 
FUNC VOID Info_Mod_Thorus_CanYouTeach_Info () 
{ 
	AI_Output(hero, self, "Info_Mod_Thorus_CanYouTeach_15_00"); //Kannst du mich auch im Kampf unterrichten?

	AI_Output(self, hero, "Info_Mod_Thorus_CanYouTeach_12_01"); //Ja. Ich kann dir zeigen, wie man mit Zweihändern kämpft. 

	Log_CreateTopic	(TOPIC_MOD_LEHRER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_OLDCAMP, "");
}; 


// ------------------------------------------------------------
// 			  				   LERNEN 
// ------------------------------------------------------------ 

var int Thorus_Merke2H;

INSTANCE Info_Mod_Thorus_2HLernen   (C_INFO) 
{ 
	npc     	= Mod_966_GRD_Thorus_MT; 
	nr          = 1; 
	condition   = Info_Mod_Thorus_2HLernen_Condition; 
	information = Info_Mod_Thorus_2HLernen_Info; 
	important   = FALSE; 
	permanent   = TRUE; 
	description = ""; 
}; 
 
FUNC INT Info_Mod_Thorus_2HLernen_Condition () 
{ 
    if (Npc_KnowsInfo(hero, Info_Mod_Thorus_CanYouTeach)) 
    { 
  	 	return TRUE; 
    }; 
}; 
 
FUNC VOID Info_Mod_Thorus_2HLernen_Info () 
{ 
	AI_Output(hero, self, "Info_Mod_Thorus_2HLernen_15_00"); //

	if (hero.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self, hero, "Info_Mod_Thorus_2HLernen_12_01"); //
	}
	else
	{
		Thorus_merke2H = hero.HitChance[NPC_TALENT_2H];

		Info_ClearChoices	(Info_Mod_Thorus_2HLernen);
		Info_AddChoice 		(Info_Mod_Thorus_2HLernen, DIALOG_BACK, Info_Mod_Thorus_2HLernen_Back);
		Info_AddChoice		(Info_Mod_Thorus_2HLernen, B_BuildLearnString(PRINT_Learn2H1,	 B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)),		Info_Mod_Thorus_2HLernen_2H_1);
		Info_AddChoice		(Info_Mod_Thorus_2HLernen, B_BuildLearnString(PRINT_Learn2H5,	 B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)),		Info_Mod_Thorus_2HLernen_2H_5);
	};
}; 

FUNC VOID Info_Mod_Thorus_2HLernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Thorus_2HLernen);
	if (hero.HitChance[NPC_TALENT_2H] > Thorus_merke2H && hero.HitChance[NPC_TALENT_2H] < 100)
	{
		AI_Output(self, hero, "Info_Mod_Thorus_2HLernen_12_02"); //Du bist besser geworden, weiter so.
	}
	if (hero.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output (self, hero, "Info_Mod_Thorus_2HLernen_12_03"); //Du bist nun ein Meister im Umgang mit den Zweihändern. Ich bezweifle, dass du noch jemanden finden wirst, der dir etwas beibringen kann.
		AI_Output (self, hero, "Info_Mod_Thorus_2HLernen_12_04"); //Nun kommt es nur noch auf deine Praxiserfahrung an. 
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Thorus_2HLernen_12_05"); //Komm wieder, wenn du mehr lernen willst.
	};
};

FUNC VOID Info_Mod_Thorus_2HLernen_2H_5()
{
	B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 100);
	
	Info_ClearChoices	(Info_Mod_Thorus_2HLernen);
	Info_AddChoice 		(Info_Mod_Thorus_2HLernen, DIALOG_BACK, Info_Mod_Thorus_2HLernen_Back);
	Info_AddChoice		(Info_Mod_Thorus_2HLernen, B_BuildLearnString(PRINT_Learn2H1,	 B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)),		Info_Mod_Thorus_2HLernen_2H_1);
	Info_AddChoice		(Info_Mod_Thorus_2HLernen, B_BuildLearnString(PRINT_Learn2H5,	 B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)),		Info_Mod_Thorus_2HLernen_2H_5);
	
};

FUNC VOID Info_Mod_Thorus_2HLernen_2H_1()
{
	B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 1, 100);
	
	Info_ClearChoices	(Info_Mod_Thorus_2HLernen);
	Info_AddChoice 		(Info_Mod_Thorus_2HLernen, DIALOG_BACK, Info_Mod_Thorus_2HLernen_Back);
	Info_AddChoice		(Info_Mod_Thorus_2HLernen, B_BuildLearnString(PRINT_Learn2H1,	 B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)),		Info_Mod_Thorus_2HLernen_2H_1);
	Info_AddChoice		(Info_Mod_Thorus_2HLernen, B_BuildLearnString(PRINT_Learn2H5,	 B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)),		Info_Mod_Thorus_2HLernen_2H_5);

};

INSTANCE Info_Mod_Thorus_Pickpocket (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Pickpocket_Condition;
	information	= Info_Mod_Thorus_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Thorus_Pickpocket_Condition()
{
	C_Beklauen	(130, ItMi_Gold, 67);
};

FUNC VOID Info_Mod_Thorus_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

	Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_BACK, Info_Mod_Thorus_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Thorus_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Thorus_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);
};

FUNC VOID Info_Mod_Thorus_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

		Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Thorus_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Thorus_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Thorus_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Thorus_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Thorus_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Thorus_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Thorus_EXIT (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_EXIT_Condition;
	information	= Info_Mod_Thorus_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thorus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thorus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
