var C_NPC Gidan_FI;
var C_NPC Kolam;
var C_NPC Fluffy;
var C_NPC Seele;

FUNC VOID HeroLook()
{
	var C_Item HeroArmor;
	HeroArmor = Npc_GetEquippedArmor(hero);

	var int HeroArmor_Count;
	HeroArmor_Count = Npc_HasItems(hero, HeroArmor);

	if (HeroIstKeinZombie == FALSE)
	&& (CurrentLevel != ORCTEMPEL_ZEN)
	{
		//HeroIstKeinZombie = TRUE;
	};

	if (HeroIstKeinZombie == TRUE)
	{
		if (Mod_HeroIstDemon == 1)
		{
			Mdl_SetVisual (hero,"HUMANS.MDS");
			// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
			Mdl_SetVisualBody (hero, "hum_body_naked0", 18,				0,			"Hum_Head_Fighter", 	207,	0, 			HeroArmor);

			Mdl_RemoveOverlayMds	(hero, "Humans_Babe.mds"); 
		}
		else if (Mod_TrfWoman == 1)
		{
			Mdl_SetVisualBody (hero, "hum_body_babe0", 5,				0,			"Hum_Head_Babe1", 	FaceBabe_N_WhiteCloth,	0, 			HeroArmor);
			Mdl_ApplyOverlayMds	(hero, "Humans_Babe.mds"); 
		}
		else
		{
			Mdl_SetVisual (hero,"HUMANS.MDS");
			// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
			Mdl_SetVisualBody (hero, "hum_body_naked0", 1,				0,			"Hum_Head_Fighter", 	FACE_N_Player,	0, 			HeroArmor);

			Mdl_RemoveOverlayMds	(hero, "Humans_Babe.mds"); 
		};

		if (Npc_HasItems(hero, HeroArmor) > HeroArmor_Count)
		{
			Npc_RemoveInvItems	(hero, HeroArmor, 1);
		};
	};
};

func void  B_InitNpcGlobals ()
{
	Gidan_FI = Hlp_GetNpc(Mod_1974_MIL_Gidan_FI);
	Kolam = Hlp_GetNpc(Mod_1981_Kolam_FI);
	Fluffy = Hlp_GetNpc(Mod_7013_HS_Fluffy_REL);
	Seele = Hlp_GetNpc(PC_Seele);

	HeroLook();

	if (Mod_HasToTeleport == TRUE)
	{
		if (Npc_GetDistToWP(hero, Mod_TeleportOrt) > 300)
		{
			AI_Teleport	(hero, Mod_TeleportOrt);

			Mod_HasToTeleport = FALSE;
		};

		if (Npc_GetDistToWP(hero, Mod_TeleportOrt) <= 300)
		{
			Mod_HasToTeleport = FALSE;
		};
	};

	// Randolph auf Irdorath nach Dialog im Halbinfernalischer ;)

	if (Mod_RandolphIR_Demon == 1)
	{
		Mdl_SetVisualBody (Mod_7527_BAU_Randolph_IR, "hum_body_naked0", 17,				0,			"Hum_Head_Bald", 	206,	0, 			ItAr_BAU_L);
	};

	// Rudolf mit Schnapsnase nach Dialog

	if (Mod_RudolfSchnaps == 1)
	{
		Mdl_SetVisualBody (Mod_7338_OUT_Lebensmittelhaendler_REL, "hum_body_naked0", BodyTex_N,				0,			"Hum_Head_FatBald", 	222,	0, KhorataHaendler_01);
	};
};