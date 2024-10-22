FUNC VOID B_FollowMe_Wisp ()
{
	AI_Output		(hero, self, "Info_Mod_Irrlicht_FollowMe_Wisp_15_00"); //Folge mir einfach.
};

FUNC VOID B_Fight_Wisp ()
{
	AI_Output		(hero, self, "Info_Mod_Irrlicht_Fight_Wisp_15_00"); //Kämpfe zusammen mit mir.
};

FUNC VOID B_MagicPlace_Wisp ()
{
	AI_Output		(hero, self, "Info_Mod_Irrlicht_MagicPlace_Wisp_15_00"); //Finde einen magischen Ort.
};

INSTANCE Info_Mod_Irrlicht_DetectItems		(C_INFO)
{
	npc		 = 	Wisp_Detector;
	nr		 = 	1;
	condition	 = 	Info_Mod_Irrlicht_DetectItems_Condition;
	information	 = 	Info_Mod_Irrlicht_DetectItems_Info;
	permanent	 = 	TRUE;

	description	 = 	"Such' mir etwas!";
};

FUNC INT Info_Mod_Irrlicht_DetectItems_Condition ()
{
	return TRUE;
};

FUNC VOID Info_Mod_Irrlicht_DetectItems_Info ()
{
	AI_Output	(hero, self, "Info_Mod_Irrlicht_DetectItems_15_00"); //Such mir etwas!

	Info_ClearChoices	(Info_Mod_Irrlicht_DetectItems);

	Info_AddChoice	(Info_Mod_Irrlicht_DetectItems, "Folge mir einfach.", Info_Mod_Irrlicht_DetectItems_Follow );
	Info_AddChoice	(Info_Mod_Irrlicht_DetectItems, "Ich suche etwas Wichtiges.", Info_Mod_Irrlicht_DetectItems_Quest);

	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] 	== TRUE)	
	{	
		Info_AddChoice	(Info_Mod_Irrlicht_DetectItems, "Ich brauche Runen und Schriftrollen.", Info_Mod_Irrlicht_DetectItems_RUNE );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] 	== TRUE)		
	{	
		Info_AddChoice	(Info_Mod_Irrlicht_DetectItems, "Ich brauche Gold, Schlüssel und Gebrauchsgegenstände", Info_Mod_Irrlicht_DetectItems_NONE );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] 	== TRUE)		
	{	
		Info_AddChoice	(Info_Mod_Irrlicht_DetectItems, "Ich brauche Fernkampfwaffen und Munition.", Info_Mod_Irrlicht_DetectItems_FF );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] 	== TRUE)		
	{	
		Info_AddChoice	(Info_Mod_Irrlicht_DetectItems, "Ich brauche Nahkampfwaffen.", Info_Mod_Irrlicht_DetectItems_NF );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] 	== TRUE)		
	{	
		Info_AddChoice	(Info_Mod_Irrlicht_DetectItems, "Ich brauche Nahrung und Planzen.", Info_Mod_Irrlicht_DetectItems_FOOD );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == TRUE)	
	{	
		Info_AddChoice	(Info_Mod_Irrlicht_DetectItems, "Ich brauche Ringe und Amulette.", Info_Mod_Irrlicht_DetectItems_MAGIC );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == TRUE)	
	{	
		Info_AddChoice	(Info_Mod_Irrlicht_DetectItems, "Ich brauche Tränke aller Art.", Info_Mod_Irrlicht_DetectItems_POTIONS );
	};

	Info_AddChoice	(Info_Mod_Irrlicht_DetectItems, "Such' einfach alles, was du finden kannst.", Info_Mod_Irrlicht_DetectItems_ALL );
};

FUNC VOID Info_Mod_Irrlicht_DetectItems_Follow ()
{
	B_FollowMe_Wisp ();
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
	WispSearching = WispSearch_Follow;
};

FUNC VOID Info_Mod_Irrlicht_DetectItems_ALL ()
{
	AI_Output			(hero, self, "Info_Mod_Irrlicht_DetectItems_ALL_15_00"); //Such mir alles, was du finden kannst.
	WispSearching = WispSearch_ALL;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

FUNC VOID Info_Mod_Irrlicht_DetectItems_Quest ()
{
	AI_Output			(hero, self, "Info_Mod_Irrlicht_DetectItems_Quest_15_00"); //Ich suche etwas wichtiges.
	WispSearching = WispSearch_Quest;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

FUNC VOID Info_Mod_Irrlicht_DetectItems_POTIONS ()
{
	AI_Output			(hero, self, "Info_Mod_Irrlicht_DetectItems_POTIONS_15_00"); //Ich brauche Tränke aller Art.
	WispSearching = WispSearch_POTIONS;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

FUNC VOID Info_Mod_Irrlicht_DetectItems_MAGIC ()
{
	AI_Output			(hero, self, "Info_Mod_Irrlicht_DetectItems_MAGIC_15_00"); //Ich brauche Ringe und Amulette.
	WispSearching = WispSearch_MAGIC;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

FUNC VOID Info_Mod_Irrlicht_DetectItems_FOOD ()
{
	AI_Output			(hero, self, "Info_Mod_Irrlicht_DetectItems_FOOD_15_00"); //Ich brauche Nahrung und Planzen.
	WispSearching = WispSearch_FOOD;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

FUNC VOID Info_Mod_Irrlicht_DetectItems_NF ()
{
	AI_Output			(hero, self, "Info_Mod_Irrlicht_DetectItems_NF_15_00"); //Ich brauche Nahkampfwaffen.
	WispSearching = WispSearch_NF;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

FUNC VOID Info_Mod_Irrlicht_DetectItems_FF ()
{
	AI_Output			(hero, self, "Info_Mod_Irrlicht_DetectItems_FF_15_00"); //Ich brauche Fernkampfwaffen und Munition.
	WispSearching = WispSearch_FF;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

FUNC VOID Info_Mod_Irrlicht_DetectItems_NONE ()
{
	AI_Output			(hero, self, "Info_Mod_Irrlicht_DetectItems_NONE_15_00"); //Ich brauche Gold, Schlüssel und Gebrauchsgegenstände
	WispSearching = WispSearch_NONE;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

FUNC VOID Info_Mod_Irrlicht_DetectItems_RUNE ()
{
	AI_Output			(hero, self, "Info_Mod_Irrlicht_DetectItems_RUNE_15_00"); //Ich brauche Runen und Schriftrollen.
	WispSearching = WispSearch_RUNE;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Irrlicht_MagicPlace		(C_INFO)
{
	npc		 = 	Wisp_Detector;
	nr		 = 	1;
	condition	 = 	Info_Mod_Irrlicht_MagicPlace_Condition;
	information	 = 	Info_Mod_Irrlicht_MagicPlace_Info;
	permanent	 = 	TRUE;

	description	 = 	"Finde einen magischen Ort.";
};

FUNC INT Info_Mod_Irrlicht_MagicPlace_Condition ()
{
	return TRUE;
};

FUNC VOID Info_Mod_Irrlicht_MagicPlace_Info ()
{
	B_MagicPlace_Wisp ();
	B_IrrlichtBeep();

	var int SearchMagicPlace;
	SearchMagicPlace = 0;

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if (Npc_GetDistToWP(self, "NW_LITTLESTONEHENDGE") <= Npc_GetDistToWP(self, "WP_STEINKREIS_04"))
		&& (Npc_GetDistToWP(self, "NW_LITTLESTONEHENDGE") <= Npc_GetDistToWP(self, "WP_STEINKREIS_05"))
		&& (Npc_GetDistToWP(self, "NW_LITTLESTONEHENDGE") <= Npc_GetDistToWP(self, "NW_MAGECAVE_RUNE"))
		&& (Npc_GetDistToWP(self, "NW_LITTLESTONEHENDGE") <= Npc_GetDistToWP(self, "NW_TROLLAREA_TROLLROCKCAVE_01"))
		&& (Npc_GetDistToWP(self, "NW_LITTLESTONEHENDGE") <= Npc_GetDistToWP(self, "WP_STEINKREIS_06"))
		{
			self.wp = "NW_LITTLESTONEHENDGE";
			SearchMagicPlace = 1;
		}
		else if (Npc_GetDistToWP(self, "WP_STEINKREIS_04") <= Npc_GetDistToWP(self, "NW_LITTLESTONEHENDGE"))
		&& (Npc_GetDistToWP(self, "WP_STEINKREIS_04") <= Npc_GetDistToWP(self, "WP_STEINKREIS_05"))
		&& (Npc_GetDistToWP(self, "WP_STEINKREIS_04") <= Npc_GetDistToWP(self, "NW_MAGECAVE_RUNE"))
		&& (Npc_GetDistToWP(self, "WP_STEINKREIS_04") <= Npc_GetDistToWP(self, "NW_TROLLAREA_TROLLROCKCAVE_01"))
		&& (Npc_GetDistToWP(self, "WP_STEINKREIS_04") <= Npc_GetDistToWP(self, "WP_STEINKREIS_06"))
		{
			self.wp = "WP_STEINKREIS_04";
			SearchMagicPlace = 1;
		}
		else if (Npc_GetDistToWP(self, "WP_STEINKREIS_05") <= Npc_GetDistToWP(self, "WP_STEINKREIS_04"))
		&& (Npc_GetDistToWP(self, "WP_STEINKREIS_05") <= Npc_GetDistToWP(self, "NW_LITTLESTONEHENDGE"))
		&& (Npc_GetDistToWP(self, "WP_STEINKREIS_05") <= Npc_GetDistToWP(self, "NW_MAGECAVE_RUNE"))
		&& (Npc_GetDistToWP(self, "WP_STEINKREIS_05") <= Npc_GetDistToWP(self, "NW_TROLLAREA_TROLLROCKCAVE_01"))
		&& (Npc_GetDistToWP(self, "WP_STEINKREIS_05") <= Npc_GetDistToWP(self, "WP_STEINKREIS_06"))
		{
			self.wp = "WP_STEINKREIS_05";
			SearchMagicPlace = 1;
		}
		else if (Npc_GetDistToWP(self, "NW_MAGECAVE_RUNE") <= Npc_GetDistToWP(self, "WP_STEINKREIS_04"))
		&& (Npc_GetDistToWP(self, "NW_MAGECAVE_RUNE") <= Npc_GetDistToWP(self, "WP_STEINKREIS_05"))
		&& (Npc_GetDistToWP(self, "NW_MAGECAVE_RUNE") <= Npc_GetDistToWP(self, "NW_LITTLESTONEHENDGE"))
		&& (Npc_GetDistToWP(self, "NW_MAGECAVE_RUNE") <= Npc_GetDistToWP(self, "NW_TROLLAREA_TROLLROCKCAVE_01"))
		&& (Npc_GetDistToWP(self, "NW_MAGECAVE_RUNE") <= Npc_GetDistToWP(self, "WP_STEINKREIS_06"))
		{
			self.wp = "NW_MAGECAVE_RUNE";
			SearchMagicPlace = 1;
		}
		else if (Npc_GetDistToWP(self, "NW_TROLLAREA_TROLLROCKCAVE_01") <= Npc_GetDistToWP(self, "WP_STEINKREIS_04"))
		&& (Npc_GetDistToWP(self, "NW_TROLLAREA_TROLLROCKCAVE_01") <= Npc_GetDistToWP(self, "WP_STEINKREIS_05"))
		&& (Npc_GetDistToWP(self, "NW_TROLLAREA_TROLLROCKCAVE_01") <= Npc_GetDistToWP(self, "NW_MAGECAVE_RUNE"))
		&& (Npc_GetDistToWP(self, "NW_TROLLAREA_TROLLROCKCAVE_01") <= Npc_GetDistToWP(self, "NW_LITTLESTONEHENDGE"))
		&& (Npc_GetDistToWP(self, "NW_TROLLAREA_TROLLROCKCAVE_01") <= Npc_GetDistToWP(self, "WP_STEINKREIS_06"))
		{
			self.wp = "NW_TROLLAREA_TROLLROCKCAVE_01";
			SearchMagicPlace = 1;
		}
		else if (Npc_GetDistToWP(self, "WP_STEINKREIS_06") <= Npc_GetDistToWP(self, "WP_STEINKREIS_04"))
		&& (Npc_GetDistToWP(self, "WP_STEINKREIS_06") <= Npc_GetDistToWP(self, "WP_STEINKREIS_05"))
		&& (Npc_GetDistToWP(self, "WP_STEINKREIS_06") <= Npc_GetDistToWP(self, "NW_MAGECAVE_RUNE"))
		&& (Npc_GetDistToWP(self, "WP_STEINKREIS_06") <= Npc_GetDistToWP(self, "NW_TROLLAREA_TROLLROCKCAVE_01"))
		&& (Npc_GetDistToWP(self, "WP_STEINKREIS_06") <= Npc_GetDistToWP(self, "NW_LITTLESTONEHENDGE"))
		{
			self.wp = "WP_STEINKREIS_06";
			SearchMagicPlace = 1;
		};
	};

	if (SearchMagicPlace == 1)
	{
		AI_StopProcessInfos (self);

		AI_StartState	(self, ZS_Guide_Player, 0, "");
	};
};

INSTANCE Info_Mod_Irrlicht_Follow		(C_INFO)
{
	npc		 = 	Wisp_Detector;
	nr		 = 	1;
	condition	 = 	Info_Mod_Irrlicht_Follow_Condition;
	information	 = 	Info_Mod_Irrlicht_Follow_Info;
	permanent	 = 	TRUE;

	description	 = 	"Folge mir einfach.";
};

FUNC INT Info_Mod_Irrlicht_Follow_Condition ()
{
	return TRUE;
};

FUNC VOID Info_Mod_Irrlicht_Follow_Info ()
{
	B_FollowMe_Wisp ();
	WispSearching = WispSearch_Follow;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Irrlicht_Fight		(C_INFO)
{
	npc		 = 	Wisp_Detector;
	nr		 = 	1;
	condition	 = 	Info_Mod_Irrlicht_Fight_Condition;
	information	 = 	Info_Mod_Irrlicht_Fight_Info;
	permanent	 = 	TRUE;

	description	 = 	"Kämpfe zusammen mit mir.";
};

FUNC INT Info_Mod_Irrlicht_Fight_Condition ()
{
	return FALSE;
};

FUNC VOID Info_Mod_Irrlicht_Fight_Info ()
{
	B_Fight_Wisp ();
	WispSearching = WispSearch_Fight;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Irrlicht_EXIT   (C_INFO)
{
	npc         = Wisp_Detector;
	nr          = 1;
	condition   = Info_Mod_Irrlicht_EXIT_Condition;
	information = Info_Mod_Irrlicht_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT Info_Mod_Irrlicht_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID Info_Mod_Irrlicht_EXIT_Info()
{
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};