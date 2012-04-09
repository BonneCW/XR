// ********************************************************************
// C_NpcBelongsTo -
// ----------------
// - OldCamp
// - City
// - Monastery
// - Farm
// Checks werden vor allem von Crime/News/Absolution - System verwendet
// ********************************************************************

func int C_NpcBelongsToOldCamp (var C_NPC slf)
{
	if (slf.npctype == NPCTYPE_mt_buddler)
	|| (slf.npctype == NPCTYPE_mt_schatten)
	|| (slf.npctype == npctype_mt_gardist)
	|| (slf.npctype == NPCTYPE_mt_babe)
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1131_GRD_Torwache_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_966_GRD_Thorus_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1108_GRD_Bullit_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1107_GRD_Jackal_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1109_GRD_Scorpio_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1110_GRD_Cutter_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1113_GRD_Fletcher_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1126_GRD_Torwache_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1127_GRD_Torwache_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1129_GRD_Torwache_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1128_GRD_Torwache_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1130_GRD_Torwache_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_943_GRD_Bloodwyn_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_800_GRD_Stone_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1469_BUD_Graham_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1506_BUD_Jesse_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_801_STT_Sly_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_802_STT_Herek_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_803_STT_Mud_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_954_STT_Huno_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_950_STT_Fisk_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_962_STT_Scatty_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_965_STT_Snaf_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1173_STT_Fingers_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1426_BUD_Grim_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1427_BUD_Guy_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1428_BUD_Kyle_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1430_BUD_Gravo_MT))
	{
		if (slf.guild == GIL_OUT)
		{
			return TRUE;
		};
	};
	
	return FALSE;
};

func int C_NpcBelongsToPsiCamp (var C_NPC slf)
{
	if (slf.npctype == NPCTYPE_mt_sumpfnovize)
	|| (slf.npctype == NPCTYPE_mt_templer)
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2007_GUR_BaalOrun_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2003_GUR_BaalTondral_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2004_GUR_BaalNamib_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2005_GUR_CorCadar_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2006_GUR_BaalTyon_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2011_TPL_GorNaDrak_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_106_TPL_Angar_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2009_TPL_GorNaRan_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2010_TPL_GorNaToth_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2014_PSINOV_Darrion_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_951_PSINOV_Fortuno_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1116_PSINOV_Caine_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1117_PSINOV_BaalKagan_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1118_PSINOV_BaalIsidro_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1724_PSINOV_Dusty_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1119_PSINOV_Shrat_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2008_PSINOV_Ghorim_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2012_PSINOV_Talas_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_3001_PSINOV_Balor_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2013_PSINOV_Joru_MT))
	{
		return TRUE;
	};
	
	return FALSE;
};

func int C_NpcBelongsToPatherion (var C_NPC slf)
{
	if (slf.npctype == NPCTYPE_pat_feuermagier)
	|| (slf.npctype == NPCTYPE_pat_ordenspriester)
	|| (slf.npctype == NPCTYPE_pat_ordenspriester_mauer)
	|| (slf.npctype == NPCTYPE_pat_paladin_mauer)
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1771_KDF_Aaron_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1738_KDF_Velario_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1857_KDF_Magier_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1746_KDF_Tojan_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1747_KDF_Furgas_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1770_KDF_Faros_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1773_KDF_Nagon_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1772_KDF_Gizar_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1858_KDF_Aaron_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1769_PAL_Paladin_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1856_PAL_Paladin_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1855_PAL_Paladin_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1739_KDF_Ordenspriester_PAT))
	{
		return TRUE;
	};
	
	return FALSE;
};

func int C_NpcBelongsToBandit (var C_NPC slf)
{
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1121_BDT_Drax_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_761_BDT_Dexter_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_948_BDT_Esteban_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_946_BDT_Edgor_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_790_BDT_Morgahard_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_952_BDT_Franco_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_955_BDT_Juan_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_957_BDT_Logan_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_961_BDT_Sancho_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_958_BDT_Miguel_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_963_BDT_Senyan_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_967_BDT_Tom_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_964_BDT_Skinner_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1120_BDT_Ratford_MT))
	{
		return TRUE;
	};
	
	return FALSE;
};

func int C_NpcBelongsToWMCamp (var C_NPC slf)
{
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_9000_KDW_Saturas_AW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_524_KDW_Vatras_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_774_KDW_Saturas_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1532_HTR_Ethan_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_926_RDW_Lance_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_512_RDW_Cavalorn_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_538_RDW_Diego_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_588_WNOV_Joe_NW))
	|| (slf.npctype == NPCTYPE_NW_WASSERKRIEGER)
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1536_WKR_Roka_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1537_WKR_Vanas_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1530_WKR_Everaldo_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1533_WKR_Salvador_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_9004_KDW_Merdarion_AW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_758_KDW_Cronos_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_769_KDW_Nefarius_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_768_KDW_Merdarion_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_9001_KDW_Cronos_AW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_771_KDW_Riordian_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_9002_KDW_Nefarius_AW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_9003_KDW_Riordian_AW))
	{
		return TRUE;
	};
	
	return FALSE;
};

func int C_NpcBelongsToSCamp (var C_NPC slf)
{
	if (slf.npctype == NPCTYPE_NW_SCHWARZERNOVIZE)
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1030_SNOV_Abdi_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_516_SNOV_Bodo_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_519_SNOV_Bartok_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_473_DMB_Andokai_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_513_DMB_Xardas_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_514_DMB_Karras_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1000_DMR_Kurgan_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_517_DMR_Gomez_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_520_DMR_Raven_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1029_SMK_Fahim_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_518_SMK_Scar_mt))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1027_SMK_Eduard_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_515_KDS_Myxir_MT))
	{
		return TRUE;
	};
	
	return FALSE;
};
// ---------------------------------------------------------------------

func int C_NpcBelongsToCity (var C_NPC slf)
{
	if ((slf.guild == GIL_PAL)
	&& (slf.npctype == NPCTYPE_AMBIENT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_540_PAL_Andre_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_762_NONE_Farim_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_522_NONE_Vanja_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_530_NONE_Regis_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_529_NONE_Matteo_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_532_NONE_Constantino_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_535_NONE_Harad_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_537_NONE_Lehmar_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_531_NONE_Bosper_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_536_NONE_Thorben_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_547_NONE_Alrik_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_546_NONE_Liselotte_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_548_NONE_Canthar_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(MOD_558_NONE_Abuyin_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_560_NONE_Alwin_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_563_NONE_Borka_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_549_NONE_Carl_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_550_NONE_Josef_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_566_NONE_Brian_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_561_NONE_Baltram_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_570_NONE_Coragon_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_567_NONE_Bromor_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_572_NONE_Edda_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_568_NONE_Cassia_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_565_NONE_Brahim_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_574_NONE_Fellan_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_573_NONE_Elvrich_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_571_NONE_Cornelius_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_576_NONE_Fernando_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_577_NONE_Garvell_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_580_NONE_Gritta_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_581_NONE_Hakon_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_575_NONE_Fenia_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_582_NONE_Halvor_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_578_NONE_Gerbrandt_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_587_NONE_Jesper_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_583_NONE_Hanna_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_590_NONE_Kardif_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_584_NONE_Ignaz_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_591_NONE_Larius_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_593_NONE_Lucy_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_589_NONE_Jora_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_594_NONE_Lutero_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_597_NONE_Meldor_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_599_NONE_Moe_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_748_NONE_Rengaru_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_750_NONE_Rupert_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_743_NONE_Nagur_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_751_NONE_Salandril_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_752_NONE_Sonja_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_757_NONE_Zuris_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_754_NONE_Valentino_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_746_NONE_Ramirez_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_741_NONE_Monty_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_760_NONE_Attila_NW))
	|| (slf.npctype == NPCTYPE_NW_MILIZ)
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1723_MIL_Gidan_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mil_304_Torwache))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mil_305_Torwache))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mil_309_Stadtwache))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mil_310_Stadtwache))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mil_332_Stadtwache))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mil_333_Stadtwache))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_109_MIL_Rick_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_543_MIL_Picasso_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_118_MIL_Rumbold_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_555_MIL_Pig_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_564_MIL_Boltan_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_595_MIL_Mario_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_596_MIL_Martin_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_745_MIL_Peck_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_598_MIL_Mika_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_747_MIL_Rangar_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_742_MIL_Mortis_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_755_MIL_Wambo_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_744_MIL_Pablo_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_756_MIL_Wulfgar_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_969_MIL_Den_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_749_MIL_Ruga_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_980_MIL_Olav_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1179_MIL_Torwache_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_968_MIL_Bilgot_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1180_MIL_Torwache_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1730_MIL_Lawrence_NW))
	|| (slf.npctype == NPCTYPE_NW_PALADIN)
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_559_PAL_Albrecht_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_592_PAL_Hagen_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_500_PAL_Garond_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_503_PAL_Oric_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_539_PAL_Lothar_NW))
	{
		return TRUE;
	};
		
	return FALSE;
};

// ---------------------------------------------------------------------

func int C_NpcBelongsToMonastery (var C_NPC slf)
{
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_922_KDF_Neoras_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_523_KDF_Daron_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_554_KDF_Parlan_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_534_KDF_Milten_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_917_KDF_Gorax_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_921_KDF_Marduk_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_918_KDF_Hyglas_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_920_KDF_Isgaroth_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_925_KDF_Talamon_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_551_KDF_Pyrokar_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_553_KDF_Ulthar_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_552_KDF_Serpentes_NW))
	|| (slf.npctype == NPCTYPE_NW_FEUERNOVIZE)
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_915_NOV_Dyrian_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_923_NOV_Opolos_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_556_NOV_Theodor_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7037_NOV_Pedro_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_753_NOV_Ulf_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_724_NOV_Mattheus_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_913_NOV_Agon_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_914_NOV_Babo_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_916_NOV_Garwig_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_919_NOV_Igaraz_NW))
	{
		return TRUE;
	};
	
	return FALSE;
};

// ---------------------------------------------------------------------

func int C_NpcBelongsToFarm (var C_NPC slf)
{
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_912_BAU_Vino_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_100_BAU_Wasili_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_101_BAU_Balthasar_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_102_BAU_Babera_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_104_BAU_Rega_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_103_BAU_Bronko_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_108_BAU_Pardos_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_105_BAU_Sekob_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_107_BAU_Bengar_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_767_BAU_Malak_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_783_BAU_Elena_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_786_BAU_Hodges_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_772_BAU_Rosi_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_785_BAU_Gunnar_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_793_BAU_Pepe_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_799_BAU_Thekla_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_900_BAU_Akil_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_791_BAU_Onar_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_789_BAU_Maria_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_903_BAU_Ehnim_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_902_BAU_Egill_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_906_BAU_Randolph_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_908_BAU_Telbor_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_905_BAU_Kati_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_909_BAU_Hilda_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_907_BAU_Tonak_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_911_BAU_Maleth_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_910_BAU_Lobart_NW))
	|| (slf.npctype == NPCTYPE_NW_BAUER)
	|| (slf.npctype == NPCTYPE_MT_SCHUERFER)
	|| (slf.npctype == NPCTYPE_FM_SCHUERFER)
	|| (slf.npctype == NPCTYPE_NW_SOELDNER)
	|| (slf.npctype == NPCTYPE_FM_SOELDNER)
	|| (slf.npctype == NPCTYPE_MT_SOELDNER)
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2002_BAU_Ricelord_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2001_BAU_Horatio_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1288_SLD_Butch_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1289_SLD_Bruce_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1291_SLD_Silas_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1290_SLD_Roscoe_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1292_SLD_Shrike_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1294_SLD_Lefty_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1293_SLD_Sharky_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1296_SLD_Schlaeger_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1295_SLD_Schlaeger_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1269_SLD_Blade_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1104_BAU_Homer_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1122_SLD_Mordrag_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1266_SLD_Orik_MT))
	|| (slf.npctype == NPCTYPE_MT_REISBAUER)
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1087_BAU_Jeremiah_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_436_SLD_Cord_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_525_SLD_Lee_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_526_SLD_Lares_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_527_SLD_Torlof_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_528_SLD_Cord_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_533_SLD_Gorn_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_674_SLD_Lee_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_779_SLD_Bullco_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_781_SLD_Cipher_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_780_SLD_Buster_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_782_SLD_Dar_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_784_SLD_Fester_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_787_SLD_Jarvis_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_792_SLD_Patrick_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_788_SLD_Khaled_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_794_SLD_Raoul_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_795_SLD_Rod_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_796_SLD_Sentenza_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_798_SLD_Wolf_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_901_SLD_Alvares_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_797_SLD_Sylvio_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1081_BAU_Pock_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_904_SLD_Engardo_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1082_BAU_Rufus_MT))
	{
		return TRUE;
	};
	
	return FALSE;
};

// ---------------------------------------------------------------------

func int C_NpcBelongsToKhorata (var C_NPC slf)
{
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7281_OUT_Felicita_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7278_OUT_Bibliothekar_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7276_OUT_Regina_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7242_OUT_Robert_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7241_OUT_Anselm_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7338_OUT_Lebensmittelhaendler_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7378_OUT_Daniel_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7374_OUT_Gerichtswache_01))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7373_OUT_Schoeppe_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7371_OUT_Richter_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7365_OUT_Margarethe_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7346_OUT_Dichter_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7351_OUT_Ranck_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7372_OUT_Schoeppe_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7375_OUT_Gerichtswache_02))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7376_OUT_Anna_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7370_OUT_Ulrich_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7377_OUT_Hans_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7380_OUT_Hubert_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7481_OUT_Monteur_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7391_OUT_Henker_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7386_OUT_Peter_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7415_OUT_Axon_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7419_OUT_Leonhard_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7420_OUT_Michael_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7421_OUT_Philipp_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7424_OUT_Narkomane_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7423_OUT_Ursula_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7418_OUT_Ruprecht_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7425_KDF_Fuego_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7385_OUT_August_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7476_OUT_Arzt_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7480_OUT_Wendel_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7381_OUT_Erika_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7540_OUT_Penner_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7498_WM_Idrico_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7507_BUD_Sterling_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7516_OUT_Lukas_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7509_OUT_Lehrling_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7514_OUT_Ivan_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7515_OUT_Dalton_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7518_OUT_Davon_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7482_OUT_Juliana_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7499_KDF_Elvira_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7517_OUT_Friedel_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7519_OUT_Tyrus_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7535_OUT_Schneider_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7542_OUT_Raritaetenhaendler_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7591_OUT_Hannes_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7578_OUT_Brauer_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7574_OUT_Lehrling_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7577_OUT_Metzgerlehrling_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7576_OUT_Metzger_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7575_OUT_Baeckerfrau_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7579_OUT_Lehrling_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7580_OUT_Brauerfrau_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7573_OUT_Baecker_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7611_OUT_Lagerhauswache_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7581_OUT_Morpheus_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7589_OUT_Will_REL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7590_OUT_Berti_REL))
	|| (slf.npctype == NPCTYPE_REL_BUERGER)
	{
		return TRUE;
	};
	
	return FALSE;
};
// ---------------------------------------------------------------------

func int C_NpcBelongsToBL (var C_NPC slf)
{
	if (slf.npctype == NPCTYPE_BL_AMBIENT)
	|| (slf.npctype == NPCTYPE_BL_MAIN)
	{
		return TRUE;
	};
	
	return FALSE;
};
