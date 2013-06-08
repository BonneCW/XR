// **************************
// B_GiveDeathInv
// --------------
// für Menschen und Monster
// gibt Monstern AnimalTrophy
// **************************

FUNC VOID B_GiveDeathRandomRing (var C_NPC slf)
{
	var int rnd;
	rnd = r_max(8);

	if (rnd == 0)
	{
		CreateInvItems	(slf, ItRi_Spheric, 1);
	}
	else if (rnd == 1)
	{
		CreateInvItems	(slf, ItRi_Wiederkehr, 1);
	}
	else if (rnd == 2)
	{
		CreateInvItems	(slf, ItRi_Buecherwurm, 1);
	}
	else if (rnd == 3)
	{
		CreateInvItems	(slf, ItRi_Eber, 1);
	}
	else if (rnd == 4)
	{
		CreateInvItems	(slf, ItRi_Kuenstler, 1);
	}
	else if (rnd == 5)
	{
		CreateInvItems	(slf, ItRi_Troll, 1);
	}
	else if (rnd == 6)
	{
		CreateInvItems	(slf, ItRi_Heilung, 1);
	}
	else if (rnd == 7)
	{
		CreateInvItems	(slf, ItRi_Willenskraft, 1);
	}
	else if (rnd == 8)
	{
		CreateInvItems	(slf, ItRi_KritischerTreffer, 1);
	};
};

FUNC VOID B_GiveDeathRandomAmulett (var C_NPC slf)
{
	var int rnd;
	rnd = r_max(1);

	if (rnd == 0)
	{
		CreateInvItems	(slf, ItAm_Blickfang, 1);
	}
	else if (rnd == 1)
	{
		CreateInvItems	(slf, ItAm_Blutmond, 1);
	};
};

FUNC VOID B_GiveDeathRandomGuertel (var C_NPC slf)
{
	var int rnd;
	rnd = r_max(0);

	if (rnd == 0)
	{
		CreateInvItems	(slf, ItBe_Dornenguertel, 1);
	};
};

func void B_GiveDeathInv (var C_NPC slf)
{
	// EXIT IF...
	
	//-------- NUR beim ersten Durchlauf weitermachen (AIV_DeathInvGiven ist dann FALSE, wird hier (unten) auf TRUE gesetzt) --------
	if (B_GetAivar(slf, AIV_DeathInvGiven) == TRUE)
	{
		return;
	};

	if (slf.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE)
	&& (CurrentLevel == ORCTEMPEL_ZEN)
	{
		if (r_max(99) < 50)
		{
			CreateInvItems	(slf, ItLsTorch, 1);
		};
	};

	if (slf.guild == GIL_GOBBO)
	{
		if (r_max(999) < 4)
		{
			B_GiveDeathRandomRing(slf);
		};
		if (r_max(999) < 4)
		{
			B_GiveDeathRandomAmulett(slf);
		};
	};
	if (slf.guild == GIL_ZOMBIE)
	{
		if (r_max(999) < 4)
		{
			B_GiveDeathRandomRing(slf);
		};
		if (r_max(999) < 4)
		{
			B_GiveDeathRandomAmulett(slf);
		};
		if (r_max(99) < 1)
		{
			B_GiveDeathRandomAmulett(slf);
		};
	};
	if (slf.guild == GIL_SCAVENGER)
	{
		if (r_max(999) < 4)
		{
			B_GiveDeathRandomRing(slf);
		};
	};
	
	// FUNC
	
	// ------ Zähne verteilen ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WOLF)		{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ICEWOLF)		{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WARG)		{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)		{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)	{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_EISDRACHENSNAPPER)	{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_RAZOR)		{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)	{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_FIRESHADOWBEAST)	{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WATERSHADOWBEAST)	{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_NIGHTMARE)		{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEASTNEW)	{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_BLOODHOUND)		{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ORCBITER)		{	CreateInvItems (slf, ItAt_Teeth, 2);		};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)		{	CreateInvItems (slf, ItAt_Teeth, 2);		};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ORCDOG)		{	CreateInvItems (slf, ItAt_Teeth, 2);		};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ALLIGATOR)		{	CreateInvItems (slf, ItAt_Teeth, 2);		};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_KEILER)		{	CreateInvItems (slf, ItAt_KeilerHauer, 2);		};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_GARGOYLE)		{	CreateInvItems (slf, ItAt_Teeth, 2);		};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ALLIGATOR)		{	CreateInvItems (slf, ItAt_Teeth, 4);		};
	};
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SwampSharkTeeth] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK)		{	CreateInvItems (slf, ItAt_SharkTeeth, 3);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_UNDEADSWAMPSHARK)	{	CreateInvItems (slf, ItAt_UndeadSharkTeeth, 3);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_LINDWURM)		{	CreateInvItems (slf, ItAt_LindwurmTeeth, 3);	};
	};
	
	if (Mod_Wendel_FettNehmer == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL)		{	CreateInvItems (slf, ItMi_Trollfett, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_MOLERAT)		{	CreateInvItems (slf, ItMi_Moleratlubric_MIS, 1);	};
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Metzger_Blutkelch))
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_MOLERAT)		{	CreateInvItems (slf, ItMi_Moleratstreifen, 1);	};
	};
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Blood] == TRUE)
	{
		if (slf.guild < GIL_SEPERATOR_HUM)
		&& (slf.id < 13000)
		{
			CreateInvItems	(slf, ItPo_Blood, 1);
		};
	};

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TrollTeeth] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL)		{	CreateInvItems (slf, ItAt_TrollTooth, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK)	{	CreateInvItems (slf, ItAt_TrollTooth, 4);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_SILBER)	{	CreateInvItems (slf, ItAt_TrollTooth, 4);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_HÖHLE)	{	CreateInvItems (slf, ItAt_TrollTooth, 2);	};
	};

	// ------ Krallen verteilen ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WARAN)		{	CreateInvItems (slf, ItAt_Claw		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)		{	CreateInvItems (slf, ItAt_Claw		, 4);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)		{	CreateInvItems (slf, ItAt_Claw		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_RAZOR)		{	CreateInvItems (slf, ItAt_Claw		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)	{	CreateInvItems (slf, ItAt_Claw		, 4);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_EISDRACHENSNAPPER)	{	CreateInvItems (slf, ItAt_Claw		, 4);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)	{	CreateInvItems (slf, ItAt_Claw		, 4);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEASTNEW)	{	CreateInvItems (slf, ItAt_Claw		, 4);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_FIRESHADOWBEAST)	{	CreateInvItems (slf, ItAt_Claw		, 4);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WATERSHADOWBEAST)	{	CreateInvItems (slf, ItAt_Claw		, 4);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_NIGHTMARE)		{	CreateInvItems (slf, ItAt_Claw		, 4);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_BLOODHOUND)		{	CreateInvItems (slf, ItAt_Claw		, 4);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_GARGOYLE)		{	CreateInvItems (slf, ItAt_Claw		, 4);	};
		
		
		if (slf.aivar[AIV_MM_REAL_ID] == ID_LURKER)		{	CreateInvItems (slf, ItAt_LurkerClaw, 1);	};		
	};
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_AlligatorClaws] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ALLIGATOR)		{	CreateInvItems (slf, ItAt_AlligatorClaw, 2);	};
	};

	// ------ Fell und Häute verteilen ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	&& (slf.aivar[AIV_Trefferzone] == 1)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHEEP)		{	CreateInvItems (slf, ItAt_SheepFur	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ZIEGE)		{	CreateInvItems (slf, ItAt_ZiegenFur	, 1);	};
		if ((slf.aivar[AIV_MM_REAL_ID] == ID_WOLF) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Tiger_Weiß)))			{	CreateInvItems (slf, ItAt_WolfFur	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ICEWOLF)		{	CreateInvItems (slf, ItAt_WolfFur	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WARG)		{	CreateInvItems (slf, ItAt_WargFur	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)	{	CreateInvItems (slf, ItAt_ShadowFur	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEASTNEW)	{	CreateInvItems (slf, ItAt_ShadowFurNew	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL)		{	CreateInvItems (slf, ItAt_TrollFur	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK)	{	CreateInvItems (slf, ItAt_TrollBlackFur	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_HÖHLE)	{	CreateInvItems (slf, ItAt_TrollHöhleFur, 1);	};	
		if (slf.aivar[AIV_MM_REAL_ID] == ID_Keiler)		{	CreateInvItems (slf, ItAt_Addon_KeilerFur, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_Keiler01)		{	CreateInvItems (slf, ItAt_Addon_KeilerFur01, 1);	};	
		if (slf.aivar[AIV_MM_REAL_ID] == ID_Orcdog && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Orcdog_Big)))		{	CreateInvItems (slf, ItAt_OrcdogFur, 1);	};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(StonePuma))	{	CreateInvItems (slf, ItAt_StonePumaFur, 1);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Puma))	{	CreateInvItems (slf, ItAt_PumaFur, 1);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Schattenwark))	{	CreateInvItems (slf, ItAt_WargFur, 1);		};
	};

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	&& (slf.aivar[AIV_Trefferzone] == 0)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHEEP)		{	CreateInvItems (slf, ItAt_SheepFur_Rein, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ZIEGE)		{	CreateInvItems (slf, ItAt_ZiegenFur_Rein, 1);	};
		if ((slf.aivar[AIV_MM_REAL_ID] == ID_WOLF) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Tiger_Weiß)))			{	CreateInvItems (slf, ItAt_WolfFur_Rein, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ICEWOLF)		{	CreateInvItems (slf, ItAt_WolfFur_Rein, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WARG)		{	CreateInvItems (slf, ItAt_WargFur_Rein, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)	{	CreateInvItems (slf, ItAt_ShadowFur_Rein, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEASTNEW)	{	CreateInvItems (slf, ItAt_ShadowFurNew_Rein, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL)		{	CreateInvItems (slf, ItAt_TrollFur_Rein, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK)	{	CreateInvItems (slf, ItAt_TrollBlackFur_Rein, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_HÖHLE)	{	CreateInvItems (slf, ItAt_TrollHöhleFur_Rein, 1);	};	
		if (slf.aivar[AIV_MM_REAL_ID] == ID_Keiler)		{	CreateInvItems (slf, ItAt_Addon_KeilerFur_Rein, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_Keiler01)		{	CreateInvItems (slf, ItAt_Addon_KeilerFur01_Rein, 1);	};	
		if (slf.aivar[AIV_MM_REAL_ID] == ID_Orcdog)		{	CreateInvItems (slf, ItAt_OrcdogFur_Rein, 1);	};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(StonePuma))	{	CreateInvItems (slf, ItAt_StonePumaFur_Rein, 1);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Puma))	{	CreateInvItems (slf, ItAt_PumaFur_Rein, 1);		};	
	};

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	&& (slf.aivar[AIV_Trefferzone] == 2)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHEEP)		{	CreateInvItems (slf, ItAt_SheepFur_Feuer, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ZIEGE)		{	CreateInvItems (slf, ItAt_ZiegenFur_Feuer, 1);	};
		if ((slf.aivar[AIV_MM_REAL_ID] == ID_WOLF) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Tiger_Weiß)))			{	CreateInvItems (slf, ItAt_WolfFur_Feuer, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ICEWOLF)		{	CreateInvItems (slf, ItAt_WolfFur_Feuer, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WARG)		{	CreateInvItems (slf, ItAt_WargFur_Feuer, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)	{	CreateInvItems (slf, ItAt_ShadowFur_Feuer, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEASTNEW)	{	CreateInvItems (slf, ItAt_ShadowFurNew_Feuer, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL)		{	CreateInvItems (slf, ItAt_TrollFur_Feuer, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK)	{	CreateInvItems (slf, ItAt_TrollBlackFur_Feuer, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_HÖHLE)	{	CreateInvItems (slf, ItAt_TrollHöhleFur_Feuer, 1);	};	
		if (slf.aivar[AIV_MM_REAL_ID] == ID_Keiler)		{	CreateInvItems (slf, ItAt_Addon_KeilerFur_Feuer, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_Keiler01)		{	CreateInvItems (slf, ItAt_Addon_KeilerFur01_Feuer, 1);	};	
		if (slf.aivar[AIV_MM_REAL_ID] == ID_Orcdog)		{	CreateInvItems (slf, ItAt_OrcdogFur_Feuer, 1);	};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(StonePuma))	{	CreateInvItems (slf, ItAt_StonePumaFur_Feuer, 1);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Puma))	{	CreateInvItems (slf, ItAt_PumaFur_Feuer, 1);		};	
	};
	
	// ------ Fell und Häute verteilen ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == TRUE)
	&& (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(FeuerSnapper))
	&& (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(WasserSnapper))
	&& (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(SchattenSnapper))
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_LURKER)		{	CreateInvItems (slf, itat_LurkerSkin, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)		{	CreateInvItems (slf, itat_LurkerSkin, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_RAZOR)		{	CreateInvItems (slf, itat_LurkerSkin, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)	{	CreateInvItems (slf, itat_LurkerSkin, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_EISDRACHENSNAPPER)	{	CreateInvItems (slf, itat_LurkerSkin, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WARAN)		{	CreateInvItems (slf, itat_LurkerSkin, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)		{	CreateInvItems (slf, itat_LurkerSkin, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ALLIGATOR)		{	CreateInvItems (slf, itat_LurkerSkin, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK)		{	CreateInvItems (slf, ItAt_SharkSkin	, 1);	};	
		if (slf.aivar[AIV_MM_REAL_ID] == ID_UNDEADSWAMPSHARK)	{	CreateInvItems (slf, ItAt_UndeadSharkSkin	, 1);	};	
	};

	// ------ Herzen verteilen ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)		{	CreateInvItems (slf, ItAt_StoneGolemHeart	, 1);	};
		if ((slf.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(FireGolem_Balrog)))		{	CreateInvItems (slf, ItAt_FireGolemHeart	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)		{	CreateInvItems (slf, ItAt_IceGolemHeart		, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SWAMPGOLEM)		{	CreateInvItems (slf, ItAt_SwampGolemHeart		, 1);	};
		
		if ((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON)	 && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Demon_Balrog)))		{	CreateInvItems (slf, ItAt_DemonHeart, 1);	};
		if ((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD)  && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(DemonLord_Balrog)))		{	CreateInvItems (slf, ItAt_DemonHeart, 1);	};
	};

	// ------ Horn eines Shadowbeasts ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)	{	CreateInvItems (slf, ItAt_ShadowHorn, 1);	};
	};
	
	// ------ Zunge eines Feuerwarans ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)		{	CreateInvItems (slf, ItAt_WaranFiretongue, 1);	};
	};

	// ------ Blutfliegen-Flügel ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)		{	CreateInvItems (slf, ItAt_Wing, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_FLEISCHFLY)		{	CreateInvItems (slf, ItAt_Wing, 2);	};
	};
	
	// ------ Blutfliegen-Stachel ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)		{	CreateInvItems (slf, ItAt_Sting, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_FLEISCHFLY)		{	CreateInvItems (slf, ItAt_Sting, 1);	};
	};
	
	// ------ Zangen von Giant_Bugs und Crawlern ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_GIANT_BUG)		{	CreateInvItems (slf, ItAt_BugMandibles, 	1);	};		
		if (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)	{	CreateInvItems (slf, ItAt_CrawlerMandibles, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)	{	CreateInvItems (slf, ItAt_CrawlerMandibles, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SPIDER)		{	CreateInvItems (slf, ItAt_SpiderMandibles, 1);	};
	};
	
	// ------ Crawler-Platten ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == TRUE)
	{
		//if (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)	{	CreateInvItems (slf, ItAt_CrawlerPlate, 1);		};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)	{	CreateInvItems (slf, ItAt_CrawlerPlate, 2);		};
	};
	
	// ------ Drachensnapperhorn ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)		{	CreateInvItems (slf, ItAt_DrgSnapperHorn, 2); 	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_EISDRACHENSNAPPER)		{	CreateInvItems (slf, ItAt_DrgSnapperHorn, 2); 	};
	};
	
	// ------ Drachen-Schuppen ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == TRUE)
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Dragon_11009_NW))	{	CreateInvItems (slf, ItAt_DragonScale, 10);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Feuerdrache_11002_NW))	{	CreateInvItems (slf, ItAt_DragonScale, 8);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Giftdrache_11004_NW))	{	CreateInvItems (slf, ItAt_DragonScale, 9);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Knucker_11001_NW))	{	CreateInvItems (slf, ItAt_DragonScale, 8);		};
	};
 	
	// ------ Drachen-Blut------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == TRUE)
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Dragon_11009_NW)){	CreateInvItems (slf, ItAt_DragonBlood, 8);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Feuerdrache_11002_NW))	{	CreateInvItems (slf, ItAt_DragonBlood, 6);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Giftdrache_11004_NW))	{	CreateInvItems (slf, ItAt_DragonBlood, 6);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Knucker_11001_NW))	{	CreateInvItems (slf, ItAt_DragonBlood, 6);		};
	};
 	
	// ------ Drachen-Elixier------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonElixier] == TRUE)
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Dragon_11009_NW)){	CreateInvItems (slf, ItAt_DragonElixier, 3);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Feuerdrache_11002_NW))	{	CreateInvItems (slf, ItAt_DragonElixier, 3);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Giftdrache_11004_NW))	{	CreateInvItems (slf, ItAt_DragonElixier, 3);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Knucker_11001_NW))	{	CreateInvItems (slf, ItAt_DragonElixier, 3);		};
	};
 	
	// ------ Drachen-Sehne------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonSehne] == TRUE)
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Dragon_11009_NW)){	CreateInvItems (slf, ItAt_DragonSehne, 2);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Feuerdrache_11002_NW))	{	CreateInvItems (slf, ItAt_DragonSehne, 2);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Giftdrache_11004_NW))	{	CreateInvItems (slf, ItAt_DragonSehne, 2);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Knucker_11001_NW))	{	CreateInvItems (slf, ItAt_DragonSehne, 2);		};
	};
 	
	// ------ Crawler-Kristalle------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerKristall] == TRUE)
	&& (Npc_HasItems(hero, ItMi_Pliers) >= 1)
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(KristallMinecrawler))	{	CreateInvItems (slf, ItAt_CrawlerKristall, 4);		};
	};
 	
 	// ------ Verteilung von ANFANG AN ------
	//if (slf.aivar[AIV_MM_REAL_ID] == ID_MEATBUG)		{	CreateInvItems (slf, ItAt_MeatbugFlesh, 1);		}

	//ROHES FLEISCH IN NPC_SCRIPTEN!!! - HOGE
	
	// ------ Gobbo Green Inventory ------
	GoblinGreen_Randomizer = Hlp_Random (100);
	
	if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN)	
	&& (GoblinGreen_Randomizer == 0) 					{	CreateInvItems (slf, ItMi_SilverRing	, 1);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN)		
	&& (GoblinGreen_Randomizer <= 5) 					{	CreateInvItems (slf, ItPl_Mushroom_01	, 1);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN)		
	&& (GoblinGreen_Randomizer <= 15) 					{	CreateInvItems (slf, Itmi_Gold	, 5);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN)		
	&& (GoblinGreen_Randomizer <= 30) 					{	CreateInvItems (slf, ItFo_Fish	, 1);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN)		
	&& (GoblinGreen_Randomizer <= 50)					{	CreateInvItems (slf, ItMi_Gold	, 2);	};
	
	
	// ------ Gobbo Black Inventory ------
	GoblinBlack_Randomizer = Hlp_Random (100);
	
	if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)	
	&& (GoblinBlack_Randomizer == 0) 					{	CreateInvItems (slf, ItMi_GoldRing	, 1);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)		
	&& (GoblinBlack_Randomizer <= 5) 					{	CreateInvItems (slf, ItFo_Fish	, 1);	}	//CreateInvItems (slf, ItPl_Dex_Herb_01	, 1);

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)		
	&& (GoblinBlack_Randomizer <= 15) 					{	CreateInvItems (slf, Itmi_Gold	, 10);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)		
	&& (GoblinBlack_Randomizer <= 30) 					{	CreateInvItems (slf, ItPl_Mushroom_02	, 1);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)		
	&& (GoblinBlack_Randomizer <= 50)					{	CreateInvItems (slf, ItMi_Gold	, 5);	};
	
	
	// ------ Orc Inventory -----
	Orc_Randomizer	= r_max(9);
	
	//------ Orcwarrior -----
	
	if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCWARRIOR)
	&& (Orc_Randomizer == 0)		
	{	
		CreateInvItems (slf, ItPo_Health_02	, 1);
		CreateInvItems (slf, ItMI_Gold	, 2);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCWARRIOR)
	&& (Orc_Randomizer == 1)
	{	
		CreateInvItems (slf, ItPo_Health_01	, 1);
		CreateInvItems (slf, ItFo_MuttonRaw	, 1);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCWARRIOR)
	&& (Orc_Randomizer == 2)
	{	
		CreateInvItems (slf, ItPo_Health_01	, 2);
		CreateInvItems (slf, ItMI_Gold	, 18);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCWARRIOR)
	&& (Orc_Randomizer == 3)
	{	
		CreateInvItems (slf, ItFo_Booze	, 1);
		CreateInvItems (slf, ItMi_SilverRing	, 1);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCWARRIOR)
	&& (Orc_Randomizer == 4)
	{	
		CreateInvItems (slf, ItPl_Health_Herb_01	, 1);
		CreateInvItems (slf, ItMI_Gold	, 4);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCWARRIOR)
	&& (Orc_Randomizer <= 7)
	{	
		CreateInvItems (slf, ItMI_Gold	, 9);	
	};
	//----- OrcShamane -----

	if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCSHAMAN)
	&& (Orc_Randomizer == 0)
	{
		CreateInvItems (slf, ItPo_Mana_03	, 1);
		CreateInvItems (slf, ItMI_Gold	, 5);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCSHAMAN)
	&& (Orc_Randomizer == 1)
	{
		CreateInvItems (slf, ItPo_Mana_02	, 2);
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCSHAMAN)
	&& (Orc_Randomizer == 2)
	{
		CreateInvItems (slf, ItPo_Mana_02	, 1);
		CreateInvItems (slf, ItMi_Coal,1); 
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCSHAMAN)
	&& (Orc_Randomizer == 3)
	{
		CreateInvItems (slf, ItPo_Mana_01	, 2);
		CreateInvItems (slf, ItMI_Gold	, 12);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCSHAMAN)
	&& (Orc_Randomizer == 4)
	{
		CreateInvItems (slf, ItPo_Mana_01	, 1);
		CreateInvItems (slf, ItMi_Sulfur,1); 
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCSHAMAN)
	&& (Orc_Randomizer <= 8)
	{
		CreateInvItems (slf,ItPl_Mana_Herb_02,2);
		CreateInvItems (slf, ItMI_Gold	, 8);	
	};
	//----- OrcElite -----

	if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCELITE )
	&& (Orc_Randomizer == 0)
	{
		CreateInvItems (slf,ItAt_WolfFur,1);
		CreateInvItems (slf,ItPo_Health_03,1);
		//CreateInvItems (slf,ItFoMutton,2);
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCELITE)
	&& (Orc_Randomizer == 1)
	{
		CreateInvItems (slf,ItMi_GoldRing,1);
		CreateInvItems (slf,ItPo_Health_01,1);
		CreateInvItems (slf,ItMi_Gold,26);
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCELITE)
	&& (Orc_Randomizer == 2)
	{
		CreateInvItems (slf,ItSc_LightHeal,1);
		CreateInvItems (slf,ItLSTorch,2);
		CreateInvItems (slf,ItAt_Teeth,1); 
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCELITE)
	&& (Orc_Randomizer <= 5)
	{
		CreateInvItems (slf,ItMi_Gold,19);
		CreateInvItems (slf,ItPo_Health_02,1);
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCELITE)
	&& (Orc_Randomizer == 6)
	{
		CreateInvItems (slf,ItAt_WargFur,1);
		//CreateInvItems (slf,ItPl_Strength_Herb_01,1);
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCELITE)
	&& (Orc_Randomizer <= 9)
	{
		CreateInvItems (slf,ItMi_Gold ,22);
		CreateInvItems (slf,ItPo_Health_01,1);
	};
	
	//-------- Dämonen -----
	if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_DEMON)
	&& (Orc_Randomizer == 0)
	{
		CreateInvItems (slf, ItPo_Mana_03	, 2);
		CreateInvItems (slf, ItMi_GoldRing	, 1);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_DEMON)
	&& (Orc_Randomizer <= 2)
	{
		CreateInvItems (slf, ItPo_Mana_03	, 1);
		CreateInvItems (slf, ItPo_Health_02	, 1);
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_DEMON)
	&& (Orc_Randomizer <= 6)
	{
		CreateInvItems (slf, ItPo_Mana_02	, 2);
		CreateInvItems (slf, ItMi_Pitch,1); 
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_DEMON)
	{
		CreateInvItems (slf, ItPo_Mana_02	, 1);
		CreateInvItems (slf, ItPo_Health_02	, 1);	
	};
	
	//-------- Dämonen Lord-----
	if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_DEMON_LORD)
	&& (Orc_Randomizer <= 1)
	{
		CreateInvItems (slf, ItPo_Mana_03	, 2);
		CreateInvItems (slf, ItPo_Health_03	, 2);
		CreateInvItems (slf, ItSc_SumDemon	, 1);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_DEMON_LORD)
	&& (Orc_Randomizer <= 5)
	{
		CreateInvItems (slf, ItPo_Mana_03	, 2);
		CreateInvItems (slf, ItPo_Health_03	, 2);
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_DEMON_LORD)
	{
		CreateInvItems (slf, ItPo_Mana_03	, 1);
		CreateInvItems (slf, ItPo_Health_03	, 1);	
	};

	var C_ITEM arm;
	arm = Npc_GetEquippedArmor(slf);

	if (slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	|| (slf.aivar[AIv_MM_REAL_ID] == ID_ORCWARRIORCROSSBOW)
	|| (slf.guild == GIL_DRACONIAN)
	|| ((slf.guild < GIL_SEPERATOR_HUM)
	&& ((Hlp_IsItem(arm, ItAr_Assassine_01))
	|| (Hlp_IsItem(arm, ItAr_Assassine_02))))
	{
		if (r_max(99) < 30)
		{
			CreateInvItems	(slf, ItPo_Pflanzengift, 1);
		};
		if (r_max(99) < 5)
		{
			CreateInvItems	(slf, ItPo_Tiergift, 1);
		};
	};
	//-------- AIV setzen, damit INV-Items nur EINMAL vergeben werden  --------
	B_SetAivar(slf, AIV_DeathInvGiven, TRUE);
};