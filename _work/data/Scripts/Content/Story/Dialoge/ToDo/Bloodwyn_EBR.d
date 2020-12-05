INSTANCE Info_Mod_Bloodwyn_EBR_Belagerung (C_INFO)
{
	npc		= Mod_1876_EBR_Bloodwyn_MT;
	nr		= 1;
	condition	= Info_Mod_Bloodwyn_EBR_Belagerung_Condition;
	information	= Info_Mod_Bloodwyn_EBR_Belagerung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bloodwyn_EBR_Belagerung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Botschaft))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bloodwyn_EBR_Belagerung_Info()
{
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_00"); //Co tu mamy? Jezyk weza Dexter i boczny z mousy grey Alissandro.
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_01"); //Idziesz na trud zlapania ambasadora, a nastepnie stary czlowiek wysyla jednego z jego pochlebców.
	AI_Output(hero, self, "Info_Mod_Bloodwyn_EBR_Belagerung_15_02"); //Czy Bartholo nie jest w stanie wyciagnac jednego z wiezniów z lochów?
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_03"); //Bartholo wie, kto moze mu pomóc, w przeciwienstwie do Thorusa.
	AI_Output(hero, self, "Info_Mod_Bloodwyn_EBR_Belagerung_15_04"); //Jak dostales sie do obozu?
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_05"); //Ujmijmy to w ten sposób: bylem ostatnia osoba, która poprosila Sancho o haslo.
	AI_Output(hero, self, "Info_Mod_Bloodwyn_EBR_Belagerung_15_06"); //Z pewnoscia nie spodoba sie to bandyci. Chca zemscic sie.
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_07"); //Nie sadze. Ze mna przyszlo 15 strazników, którzy maja za zadanie zabic kazdego, kto powoduje klopoty w tym obozie lub od razu go opuszcza.
	AI_Output(hero, self, "Info_Mod_Bloodwyn_EBR_Belagerung_15_08"); //Mówisz, ze jestesmy oblezeni?
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_09"); //To wlasnie to oznacza.
	AI_Output(hero, self, "Info_Mod_Bloodwyn_EBR_Belagerung_15_10"); //Nie boimy sie Ciebie. Alissandro wysle nam szukajacych nas ludzi.
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_11"); //Ach, myslisz, ze boimy sie rebeliantów, których dziadek posyla?
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_12"); //Wir sitzen am längeren Hebel. Sollten Alissandros "ludzie" kommen, werden wir sie mit Leichtigkeit überwältigen können.

	if (Npc_HasItems(hero, ItRu_TeleportSeaport) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_TeleportSeaport, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportSeaport, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_TeleportMonastery) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_TeleportMonastery, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportMonastery, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_TeleportPatBack) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_TeleportPatBack, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportPatBack, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_Teleport_Pat) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_Teleport_Pat, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_Teleport_Pat, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_Teleport_Pat_01) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_Teleport_Pat_01, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_Teleport_Pat_01, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_Teleport_Pat_02) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_Teleport_Pat_02, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_Teleport_Pat_02, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_TeleportFarm) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_TeleportFarm, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportFarm, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_TeleportXardas) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_TeleportXardas, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportXardas, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_TeleportPassNW) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_TeleportPassNW, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportPassNW, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_TeleportPassOW) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_TeleportPassOW, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportPassOW, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_TeleportOC) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_TeleportOC, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportOC, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_TeleportOWDemonTower) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_TeleportOWDemonTower, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportOWDemonTower, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_TeleportTaverne) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_TeleportTaverne, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportTaverne, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_TeleportDemonTower) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_TeleportDemonTower, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportDemonTower, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_TeleportPsicamp) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_TeleportPsicamp, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportPsicamp, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_TeleportOldcamp) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_TeleportOldcamp, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportOldcamp, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_TeleportNewcamp) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_TeleportNewcamp, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportNewcamp, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_Teleport_3) == 1)
	{
		Npc_RemoveInvItems	(hero, Itru_Teleport_3, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_Teleport_3, 1);

		Mod_HeroHasRune += 1;
	};

	if (Npc_HasItems(hero, ItRu_TeleportObelisk) == 1)
	{
		Npc_RemoveInvItems	(hero, ItRu_TeleportObelisk, 1);
		Mob_CreateItems	("TELEPORTRUNENTRUHE", ItRu_TeleportObelisk, 1);

		Mod_HeroHasRune += 1;
	};

	if (Mod_HeroHasRune > 0)
	{
		AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_13"); //Widze, ze macie teleportrunki. Wydaje mi sie, ze nie przeszkadza ci, jesli ja zabiore.
		
		B_LogEntry	(TOPIC_MOD_AL_BOTSCHAFTER, "");
	};

	Wld_InsertNpc	(Mod_1879_GRD_Gardist_MT, "LOCATION_11_01");
	Wld_InsertNpc	(Mod_1880_GRD_Gardist_MT, "LOCATION_11_01");
	Wld_InsertNpc	(Mod_1881_GRD_Gardist_MT, "LOCATION_11_01");
	Wld_InsertNpc	(Mod_1882_GRD_Gardist_MT, "LOCATION_11_01");
	Wld_InsertNpc	(Mod_1883_GRD_Gardist_MT, "LOCATION_11_01");
	Wld_InsertNpc	(Mod_1884_GRD_Gardist_MT, "LOCATION_11_01");
	Wld_InsertNpc	(Mod_1885_GRD_Gardist_MT, "LOCATION_11_01");
	Wld_InsertNpc	(Mod_1886_GRD_Gardist_MT, "LOCATION_11_01");
	Wld_InsertNpc	(Mod_1887_GRD_Gardist_MT, "LOCATION_11_01");
	Wld_InsertNpc	(Mod_1888_GRD_Gardist_MT, "LOCATION_11_01");
	Wld_InsertNpc	(Mod_1889_GRD_Gardist_MT, "LOCATION_11_01");
	Wld_InsertNpc	(Mod_1890_GRD_Gardist_MT, "LOCATION_11_01");

	B_StartOtherRoutine	(Mod_1108_GRD_Bullit_MT, "WACHE");

	B_LogEntry	(TOPIC_MOD_AL_BOTSCHAFTER, "Po przekazaniu wiadomosci Dexterowi, zostalismy zaatakowani przez strazników, którzy mieli rozkaz zabic nas po opuszczeniu obozu.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ALTESLAGER");
	AI_Teleport	(self, "OC1");

	B_StartOtherRoutine	(Mod_1877_GRD_Gardist_MT, "WACHE");
	B_StartOtherRoutine	(Mod_1878_GRD_Gardist_MT, "WACHE");

	B_KillNpc	(Mod_961_BDT_Sancho_MT);
};

INSTANCE Info_Mod_Bloodwyn_EBR_Belauscht (C_INFO)
{
	npc		= Mod_1876_EBR_Bloodwyn_MT;
	nr		= 1;
	condition	= Info_Mod_Bloodwyn_EBR_Belauscht_Condition;
	information	= Info_Mod_Bloodwyn_EBR_Belauscht_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bloodwyn_EBR_Belauscht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jackal_AllDead))
	&& (!Npc_IsInState(Mod_1107_GRD_Jackal_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bloodwyn_EBR_Belauscht_Info()
{
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belauscht_04_00"); //Tak wiec szczury maja dziure w górskim fortie. Przyjedz ze mna! Bartholo chetnie to uslyszy.
	
	B_LogEntry	(TOPIC_MOD_AL_KillMission, "Rozmawialem z Jackalem, ale Bloodwyn sluchal. Zabiera mnie do Bartholo.");

	AI_StopProcessInfos	(self);

	AI_Teleport	(Mod_1440_BUD_Buddler_MT,	"OCC_BARONS_GREATHALL_CENTER_FRONT");
	
	Mod_1107_GRD_Jackal_MT.aivar[AIV_PARTYMEMBER] = TRUE;

	B_StartOtherRoutine	(self, "GEFANGENNAHME");
	B_StartOtherRoutine	(Mod_1107_GRD_Jackal_MT, "GEFANGENNAHME");
	B_StartOtherRoutine	(Mod_1440_BUD_Buddler_MT, "KILLED");
	B_StartOtherRoutine	(Mod_1106_EBR_Bartholo_MT, "SMALLTALK");
};

INSTANCE Info_Mod_Bloodwyn_EBR_EXIT (C_INFO)
{
	npc		= Mod_1876_EBR_Bloodwyn_MT;
	nr		= 1;
	condition	= Info_Mod_Bloodwyn_EBR_EXIT_Condition;
	information	= Info_Mod_Bloodwyn_EBR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bloodwyn_EBR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bloodwyn_EBR_EXIT_Info()
{
	AI_StopProcessInfos	(self);

	if (Npc_KnowsInfo(hero, Info_Mod_Bloodwyn_EBR_Belagerung))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Dexter_Plan))
	{
		B_StartOtherRoutine	(self, "ALTESLAGER");
		AI_Teleport	(self, "OC1");
	};
};
