INSTANCE Info_Mod_Attila_REL_Hi (C_INFO)
{
	npc		= Mod_7709_OUT_Attila_REL;
	nr		= 1;
	condition	= Info_Mod_Attila_REL_Hi_Condition;
	information	= Info_Mod_Attila_REL_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Attila_REL_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Attila_REL_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Attila_REL_Hi_09_00"); //Es scheint, dass die Kinder der Einfalt ihr Lagerhaus gerade mit Vorräten befüllen.
	AI_Output(self, hero, "Info_Mod_Attila_REL_Hi_09_01"); //Immer von morgens bis abends tragen sie Kisten und Säcke gefüllt mit Speis und Trank ins Gebäude.
	AI_Output(self, hero, "Info_Mod_Attila_REL_Hi_09_02"); //Fenster befinden sich dort leider keine.
	AI_Output(self, hero, "Info_Mod_Attila_REL_Hi_09_03"); //Zwei Wachen bewachen den ganzen Ablauf, welche das Gebäude auch immer abends abschließen.
	AI_Output(self, hero, "Info_Mod_Attila_REL_Hi_09_04"); //Einer von beiden hält dann die Nacht über Wache bei der Vordertür.
	AI_Output(self, hero, "Info_Mod_Attila_REL_Hi_09_05"); //Das war alles, was ich erfahren habe.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Attila_REL_Glorie (C_INFO)
{
	npc		= Mod_7709_OUT_Attila_REL;
	nr		= 1;
	condition	= Info_Mod_Attila_REL_Glorie_Condition;
	information	= Info_Mod_Attila_REL_Glorie_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Attila_REL_Glorie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jesper_REL_Glorie2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Attila_REL_Glorie_Info()
{
	AI_Output(self, hero, "Info_Mod_Attila_REL_Glorie_09_00"); //(ironisch) Sei gegrüßt, Vater der Gelehrsamkeit.
	AI_Output(hero, self, "Info_Mod_Attila_REL_Glorie_15_01"); //Du hier? Sollst du nicht dafür sorgen, dass der Gelehrte hier nicht auftaucht?

	AI_PlayAni	(hero, "T_SEARCH");

	AI_Output(self, hero, "Info_Mod_Attila_REL_Glorie_09_02"); //Nun, es gelang mir nicht ihn in ein Gespräch zu verwickeln.
	AI_Output(self, hero, "Info_Mod_Attila_REL_Glorie_09_03"); //Da musste ich zu anderen Mitteln greifen.
	AI_Output(hero, self, "Info_Mod_Attila_REL_Glorie_15_04"); //Du hast ihn doch nicht etwa ...
	AI_Output(self, hero, "Info_Mod_Attila_REL_Glorie_09_05"); //Nein, nein ... nur einige gezielte Würfe mit faulen Obst, gefolgt von einer kurzen Verfolgungsjagd mit ihm und seiner Leibwache.
	AI_Output(self, hero, "Info_Mod_Attila_REL_Glorie_09_06"); //Er dürfte jetzt in seiner besudelten Kleidung das Haus hüten.
	AI_Output(hero, self, "Info_Mod_Attila_REL_Glorie_15_07"); //Faules Obst? Das ist sonst nicht deine Art.
	AI_Output(self, hero, "Info_Mod_Attila_REL_Glorie_09_08"); //Ein Dieb muss sich stets zu wandeln wissen ... wobei mir dies in Erinnerung ruft, Ramirez aus seiner prekären Lage zu erlösen.
	AI_Output(self, hero, "Info_Mod_Attila_REL_Glorie_09_09"); //Wenn wir es geschickt anstellen, sollte es uns sogar gelingen das Kleid zurückzulegen, ehe der Diebstahl bemerkt wird.
	AI_Output(self, hero, "Info_Mod_Attila_REL_Glorie_09_10"); //Komm!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOSCHNEIDER");
};

INSTANCE Info_Mod_Attila_REL_Glorie2 (C_INFO)
{
	npc		= Mod_7709_OUT_Attila_REL;
	nr		= 1;
	condition	= Info_Mod_Attila_REL_Glorie2_Condition;
	information	= Info_Mod_Attila_REL_Glorie2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Attila_REL_Glorie2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Attila_REL_Glorie))
	&& (Npc_GetDistToWP(self, "REL_CITY_231") < 500)
	&& (Npc_HasItems(hero, ItAr_GelehrterNeu) == 1)
	&& (Npc_HasItems(hero, ItAr_Bart) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Attila_REL_Glorie2_Info()
{
	AI_Output(self, hero, "Info_Mod_Attila_REL_Glorie2_09_00"); //So, darf ich den vornehmen Herrn um seine Kleidung bitten?

	B_GiveInvItems	(hero, self, ItAr_GelehrterNeu, 1);

	Npc_RemoveInvItems (hero, ItAr_Bart, 1);

	AI_EquipBestArmor (hero);

	AI_SetWalkmode (self, NPC_SNEAK);

	AI_GotoWP (self, "REL_CITY_232");

	AI_GotoNpc (self, hero);

	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Attila_REL_Glorie3 (C_INFO)
{
	npc		= Mod_7709_OUT_Attila_REL;
	nr		= 1;
	condition	= Info_Mod_Attila_REL_Glorie3_Condition;
	information	= Info_Mod_Attila_REL_Glorie3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Attila_REL_Glorie3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Attila_REL_Glorie2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Attila_REL_Glorie3_Info()
{
	AI_Output(self, hero, "Info_Mod_Attila_REL_Glorie3_09_00"); //So, jetzt nichts wie zurück ins Lager.

	AI_StopProcessInfos (self);

	B_StartOtherRoutine	(self, "INHAUS");
	B_StartOtherRoutine	(Mod_7704_OUT_Jesper_REL, "INHAUS");
	B_StartOtherRoutine	(Mod_7705_OUT_Cassia_REL, "INHAUS");
	B_StartOtherRoutine	(Mod_7708_OUT_Ramirez_REL, "INHAUS");
};

INSTANCE Info_Mod_Attila_REL_Glorie4 (C_INFO)
{
	npc		= Mod_7709_OUT_Attila_REL;
	nr		= 1;
	condition	= Info_Mod_Attila_REL_Glorie4_Condition;
	information	= Info_Mod_Attila_REL_Glorie4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Attila_REL_Glorie4_Condition()
{
	if (Npc_GetDistToWP(hero, "REL_CITY_KANAL_027") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Attila_REL_Glorie4_Info()
{
	AI_Output(self, hero, "Info_Mod_Attila_REL_Glorie4_09_00"); //Beliar ist groß ... schaut euch nur diesen Schatz an.

	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Attila_REL_Glorie5 (C_INFO)
{
	npc		= Mod_7709_OUT_Attila_REL;
	nr		= 1;
	condition	= Info_Mod_Attila_REL_Glorie5_Condition;
	information	= Info_Mod_Attila_REL_Glorie5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Attila_REL_Glorie5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jesper_REL_Glorie4))
	&& (Npc_IsDead(Lesser_Skeleton_Diebe_01))
	&& (Npc_IsDead(Lesser_Skeleton_Diebe_02))
	&& (Npc_IsDead(Lesser_Skeleton_Diebe_03))
	&& (Npc_IsDead(Lesser_Skeleton_Diebe_04))
	&& (Npc_IsDead(Lesser_Skeleton_Diebe_05))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Attila_REL_Glorie5_Info()
{
	AI_Output(self, hero, "Info_Mod_Attila_REL_Glorie5_09_00"); //Nun, ich denke wir haben Beliar für heute genug erzürnt. Wir sollten seinen Schatz besser nicht weiter plündern.

	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Attila_REL_EXIT (C_INFO)
{
	npc		= Mod_7709_OUT_Attila_REL;
	nr		= 1;
	condition	= Info_Mod_Attila_REL_EXIT_Condition;
	information	= Info_Mod_Attila_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Attila_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Attila_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};