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
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_00"); //(spöttisch) Wen haben wir denn da? Die Schlangenzunge Dexter und ein Handlanger vom mausgrauen Alissandro.
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_01"); //Da macht man sich die Mühe und fängt den Botschafter ab, und dann schickt der alte Mann noch einen seiner Speichellecker.
	AI_Output(hero, self, "Info_Mod_Bloodwyn_EBR_Belagerung_15_02"); //Hat Bartholo keine andere Möglichkeit, als einen der Gefangenen aus dem Kerker zu ziehen?
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_03"); //Bartholo weiß, wer ihm helfen kann, im Gegensatz zu Thorus.
	AI_Output(hero, self, "Info_Mod_Bloodwyn_EBR_Belagerung_15_04"); //Wie bist du eigentlich ins Lager gekommen?
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_05"); //Sagen wir es so: Ich war der Letzte, den Sancho nach dem Passwort gefragt hat.
	AI_Output(hero, self, "Info_Mod_Bloodwyn_EBR_Belagerung_15_06"); //Das wird den Banditen sicherlich nicht gefallen. Sie werden sich rächen wollen.
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_07"); //Das glaube ich nicht. Mit mir sind 15 Gardisten gekommen, die den Auftrag haben, jeden der in diesem Lager für Unruhe sorgt oder es verlässt, sofort zu töten.
	AI_Output(hero, self, "Info_Mod_Bloodwyn_EBR_Belagerung_15_08"); //Soll das heißen, wir werden belagert?
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_09"); //Genau das soll es heißen.
	AI_Output(hero, self, "Info_Mod_Bloodwyn_EBR_Belagerung_15_10"); //Wir fürchten uns nicht vor dir. Alissandro wird Leute schicken, die nach uns suchen.
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_11"); //Oh, meinst du wir fürchten uns vor den Auflehnern, die das Großväterchen schickt?
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_12"); //Wir sitzen am längeren Hebel. Sollten Alissandros "Männer" kommen, werden wir sie mit Leichtigkeit überwältigen können.

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

	if (Mod_HeroHasRune > 0)
	{
		AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belagerung_04_13"); //Wie ich sehe hast du Teleportrunen. Ich schätze du hast nichts dagegen, wenn ich sie mitnehmen.
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

	B_LogEntry	(TOPIC_MOD_AL_BOTSCHAFTER, "Nachdem ich Dexter die Botschaft gegeben hatte, wurden wir von den Gardisten überfallen, die den Auftrag haben uns zu töten, sollten wir das Lager verlassen.");

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
	AI_Output(self, hero, "Info_Mod_Bloodwyn_EBR_Belauscht_04_00"); //So, im Bergkastell habt ihr Ratten also euer Loch. Kommt mit! Bartholo wird es freuen, das zu hören.
	
	B_LogEntry	(TOPIC_MOD_AL_KillMission, "Ich habe mit Jackal gesprochen, allerdings hat Bloodwyn mitgehört. Er bringt mich zu Bartholo.");

	AI_StopProcessInfos	(self);

	AI_Teleport	(Mod_1440_BUD_Buddler_MT,	"OCC_BARONS_GREATHALL_CENTER_FRONT");

	B_StartOtherRoutine	(self, "GEFANGENNAHME");
	B_StartOtherRoutine	(Mod_1107_GRD_Jackal_MT, "GEFANGENNAHME");
	B_StartOtherRoutine	(Mod_1440_BUD_Buddler_MT, "KILLED");
	B_StartOtherRoutine	(Mod_1106_EBR_Bartholo_MT, "SMALLTALK");

	AI_Teleport	(Mod_1440_BUD_Buddler_MT,	"OCC_BARONS_GREATHALL_CENTER_FRONT");
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