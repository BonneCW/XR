INSTANCE Info_Mod_Echsenhaendler_HeilkrautM (C_INFO)
{
	npc		= Mod_12016_DRA_Echsenhaendler_AW;
	nr		= 1;
	condition	= Info_Mod_Echsenhaendler_HeilkrautM_Condition;
	information	= Info_Mod_Echsenhaendler_HeilkrautM_Info;
	permanent	= 0;
	important	= 0;
	description	= "Heilkraut kaufen (5 merkw¸rdige kleine Dinger)";
};

FUNC INT Info_Mod_Echsenhaendler_HeilkrautM_Condition()
{
	if (Npc_HasItems(hero, ItMi_MerkwuerdigeDinger) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Echsenhaendler_HeilkrautM_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_MerkwuerdigeDinger, 5);
	CreateInvItems	(hero, ItPl_Heilknospe, 1);

	B_ShowGivenThings	("5 merkw¸rdige kleine Dinger gegeben und Heilknospe erhalten");
};

INSTANCE Info_Mod_Echsenhaendler_Heilkraut (C_INFO)
{
	npc		= Mod_12016_DRA_Echsenhaendler_AW;
	nr		= 1;
	condition	= Info_Mod_Echsenhaendler_Heilkraut_Condition;
	information	= Info_Mod_Echsenhaendler_Heilkraut_Info;
	permanent	= 0;
	important	= 0;
	description	= "Heilkraut kaufen (5 Golemherzfragmente)";
};

FUNC INT Info_Mod_Echsenhaendler_Heilkraut_Condition()
{
	if (Npc_HasItems(hero, ItMi_HerzFragment) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Echsenhaendler_Heilkraut_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_HerzFragment, 5);
	CreateInvItems	(hero, ItPl_Heilknospe, 1);

	B_ShowGivenThings	("5 Golemherzfragmente gegeben und Heilknospe erhalten");
};

INSTANCE Info_Mod_Echsenhaendler_Waffe (C_INFO)
{
	npc		= Mod_12016_DRA_Echsenhaendler_AW;
	nr		= 1;
	condition	= Info_Mod_Echsenhaendler_Waffe_Condition;
	information	= Info_Mod_Echsenhaendler_Waffe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Waffe kaufen (10 Golemherzfragmente)";
};

FUNC INT Info_Mod_Echsenhaendler_Waffe_Condition()
{
	if (Npc_HasItems(hero, ItMi_HerzFragment) >= 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Echsenhaendler_Waffe_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_HerzFragment, 10);

	if (hero.HitChance[NPC_TALENT_BOW] > hero.HitChance[NPC_TALENT_2H])
	&& (hero.HitChance[NPC_TALENT_BOW] > hero.HitChance[NPC_TALENT_1H])
	{
		CreateInvItems	(hero, ItRw_EchsenBogen, 1);
		CreateInvItems	(hero, ItRw_Arrow, 50);

		B_ShowGivenThings	("10 Golemherzfragmente gegeben und Echsenbogen und Pfeile erhalten");
	}
	else if (hero.HitChance[NPC_TALENT_1H] > hero.HitChance[NPC_TALENT_2H])
	&& (hero.HitChance[NPC_TALENT_1H] > hero.HitChance[NPC_TALENT_BOW])
	{
		if (hero.attribute[ATR_STRENGTH] > hero.attribute[ATR_DEXTERITY])
		{
			CreateInvItems	(hero, ItMw_EchsenSchwertStr, 1);

		B_ShowGivenThings	("10 Golemherzfragmente gegeben und Echsenschwert erhalten");
		}
		else
		{
			CreateInvItems	(hero, ItMw_EchsenSchwertDex, 1);

		B_ShowGivenThings	("10 Golemherzfragmente gegeben und Echsenschwert erhalten");
		};
	}
	else
	{
		CreateInvItems	(hero, ItMw_EchsenZweihaender, 1);

		B_ShowGivenThings	("10 Golemherzfragmente gegeben und groﬂes Echsenschwert erhalten");
	};
};

INSTANCE Info_Mod_Echsenhaendler_EXIT (C_INFO)
{
	npc		= Mod_12016_DRA_Echsenhaendler_AW;
	nr		= 1;
	condition	= Info_Mod_Echsenhaendler_EXIT_Condition;
	information	= Info_Mod_Echsenhaendler_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Echsenhaendler_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Echsenhaendler_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};