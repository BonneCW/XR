INSTANCE Info_Mod_Merdarion_Hi (C_INFO)
{
	npc		= Mod_768_KDW_Merdarion_NW;
	nr		= 1;
	condition	= Info_Mod_Merdarion_Hi_Condition;
	information	= Info_Mod_Merdarion_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Merdarion_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Merdarion_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Merdarion_Hi_06_00"); //Du schon wieder!
	AI_Output(self, hero, "Info_Mod_Merdarion_Hi_06_01"); //Du wagst es hier her zu kommen, nachdem du unseren Erzhaufen seine magische Energie genommen hast?
	AI_Output(hero, self, "Info_Mod_Merdarion_Hi_15_02"); //Es hat funktioniert. Immerhin sind wir jetzt frei.
	AI_Output(self, hero, "Info_Mod_Merdarion_Hi_06_03"); //Das ist auch der einzige Grund warum du noch lebst.
};

INSTANCE Info_Mod_Merdarion_Nefarius (C_INFO)
{
	npc		= Mod_768_KDW_Merdarion_NW;
	nr		= 1;
	condition	= Info_Mod_Merdarion_Nefarius_Condition;
	information	= Info_Mod_Merdarion_Nefarius_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nefarius schickt mich.";
};

FUNC INT Info_Mod_Merdarion_Nefarius_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_Saturas))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Merdarion_Nefarius_Info()
{
	AI_Output(hero, self, "Info_Mod_Merdarion_Nefarius_15_00"); //Nefarius schickt mich. Ich soll bei dir vorbeischauen bevor ich mich auf die Suche nach den vier Teilen des Rings für das Portal mache.
	AI_Output(self, hero, "Info_Mod_Merdarion_Nefarius_06_01"); //Gut, dass du gekommen bist. Es gibt hier in der Ruine einen Teleporter. Mit diesem Schlüssel kommt du durch die Tür.

	B_GiveInvItems	(self, hero, ItKe_PORTALTEMPELWALKTHROUGH_ADDON, 1);

	AI_Output(self, hero, "Info_Mod_Merdarion_Nefarius_06_02"); //Dann gibt es noch einen weiteren Teleporter in der Nähe der Taverne "Zur toten Harpie". Auch dieser Teleporter ist durch eine Tür geschützt.
	AI_Output(self, hero, "Info_Mod_Merdarion_Nefarius_06_03"); //Mit diesem Schlüssel kannst du die Tür öffnen.

	B_GiveInvItems	(self, hero, ITKE_ORLAN_TELEPORTSTATION, 1);

	AI_Output(self, hero, "Info_Mod_Merdarion_Nefarius_06_04"); //Und nun beeile dich.
};

INSTANCE Info_Mod_Merdarion_EXIT (C_INFO)
{
	npc		= Mod_768_KDW_Merdarion_NW;
	nr		= 1;
	condition	= Info_Mod_Merdarion_EXIT_Condition;
	information	= Info_Mod_Merdarion_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Merdarion_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Merdarion_EXIT_Info()
{
	AI_Output(self, hero, "Info_Mod_Merdarion_EXIT_06_00"); //Möge für immer das Gleichgewicht gegeben sein!

	AI_StopProcessInfos	(self);
};