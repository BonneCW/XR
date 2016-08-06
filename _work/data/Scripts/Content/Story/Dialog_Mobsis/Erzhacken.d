FUNC VOID Erzhacken_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		if (Npc_HasItems(hero, ItMw_2H_Axe_L_01) == 0)
		{
			Print	("Ohne Spitzhacke geht das nicht!");

			AI_UseMob (hero, "ORE", -1);
			return;
		};

		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Erzhacken;
		Ai_ProcessInfos (her);
	};
}; 

FUNC INT B_ErzMob_Bestimmung()
{
	if (Hlp_StrCmp (Npc_GetNearestWP (self), "FMC_ORE_05") && (ErzMob_01_Amount_MAX > ErzMob_01_Amount))
	{
		ErzMob_01_Amount = (ErzMob_01_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "FMC_ORE_06") && (ErzMob_02_Amount_MAX > ErzMob_02_Amount)
	{
		ErzMob_02_Amount = (ErzMob_02_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "FMC_ORE_04") && (ErzMob_03_Amount_MAX > ErzMob_03_Amount)
	{
		ErzMob_03_Amount = (ErzMob_03_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "FMC_ORE_07") && (ErzMob_04_Amount_MAX > ErzMob_04_Amount)
	{
		ErzMob_04_Amount = (ErzMob_04_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "FMC_ORE_10") && (ErzMob_05_Amount_MAX > ErzMob_05_Amount)
	{
		ErzMob_05_Amount = (ErzMob_05_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "FMC_ORE_01") && (ErzMob_06_Amount_MAX > ErzMob_06_Amount)
	{
		ErzMob_06_Amount = (ErzMob_06_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "FMC_ORE_09") && (ErzMob_07_Amount_MAX > ErzMob_07_Amount)
	{
		ErzMob_07_Amount = (ErzMob_07_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "FMC_ORE_08") && (ErzMob_08_Amount_MAX > ErzMob_08_Amount)
	{
		ErzMob_08_Amount = (ErzMob_08_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "FMC_ORE_03") && (ErzMob_09_Amount_MAX > ErzMob_09_Amount)
	{
		ErzMob_09_Amount = (ErzMob_09_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "FMC_ORE_02") && (ErzMob_10_Amount_MAX > ErzMob_10_Amount)
	{
		ErzMob_10_Amount = (ErzMob_10_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "FM_86") && (ErzMob_11_Amount_MAX > ErzMob_11_Amount))
	{
		ErzMob_11_Amount = (ErzMob_11_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "FM_88") && (ErzMob_12_Amount_MAX > ErzMob_12_Amount))
	{
		ErzMob_12_Amount = (ErzMob_12_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "FM_84") && (ErzMob_13_Amount_MAX > ErzMob_13_Amount))
	{
		ErzMob_13_Amount = (ErzMob_13_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "FM_89") && (ErzMob_14_Amount_MAX > ErzMob_14_Amount))
	{
		ErzMob_14_Amount = (ErzMob_14_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "FM_105") && (ErzMob_15_Amount_MAX > ErzMob_15_Amount))
	{
		ErzMob_15_Amount = (ErzMob_15_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "FM_103") && (ErzMob_16_Amount_MAX > ErzMob_16_Amount))
	{
		ErzMob_16_Amount = (ErzMob_16_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "FM_102") && (ErzMob_17_Amount_MAX > ErzMob_17_Amount))
	{
		ErzMob_17_Amount = (ErzMob_17_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "FM_137") && (ErzMob_18_Amount_MAX > ErzMob_18_Amount))
	{
		ErzMob_18_Amount = (ErzMob_18_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "FM_136") && (ErzMob_19_Amount_MAX > ErzMob_19_Amount))
	{
		ErzMob_19_Amount = (ErzMob_19_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "FM_135") && (ErzMob_20_Amount_MAX > ErzMob_20_Amount))
	{
		ErzMob_20_Amount = (ErzMob_20_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_MT_ORE_01") && (ErzMob_21_Amount_MAX > ErzMob_21_Amount))
	{
		ErzMob_21_Amount = (ErzMob_21_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_MT_ORE_02") && (ErzMob_22_Amount_MAX > ErzMob_22_Amount))
	{
		ErzMob_22_Amount = (ErzMob_22_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_MT_ORE_03") && (ErzMob_23_Amount_MAX > ErzMob_23_Amount))
	{
		ErzMob_23_Amount = (ErzMob_23_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_MT_ORE_04") && (ErzMob_24_Amount_MAX > ErzMob_24_Amount))
	{
		ErzMob_24_Amount = (ErzMob_24_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_MT_ORE_05") && (ErzMob_25_Amount_MAX > ErzMob_25_Amount))
	{
		ErzMob_25_Amount = (ErzMob_25_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_MT_ORE_06") && (ErzMob_26_Amount_MAX > ErzMob_26_Amount))
	{
		ErzMob_26_Amount = (ErzMob_26_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_MT_ORE_07") && (ErzMob_27_Amount_MAX > ErzMob_27_Amount))
	{
		ErzMob_27_Amount = (ErzMob_27_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_MT_PALAMINE_01") && (ErzMob_28_Amount_MAX > ErzMob_28_Amount))
	{
		ErzMob_28_Amount = (ErzMob_28_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_MT_PALAMINE_02") && (ErzMob_29_Amount_MAX > ErzMob_29_Amount))
	{
		ErzMob_29_Amount = (ErzMob_29_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_MT_PALAMINE_03") && (ErzMob_30_Amount_MAX > ErzMob_30_Amount))
	{
		ErzMob_30_Amount = (ErzMob_30_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_MT_PALAMINE_04") && (ErzMob_31_Amount_MAX > ErzMob_31_Amount))
	{
		ErzMob_31_Amount = (ErzMob_31_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "HOEHLE_10") && (ErzMob_32_Amount_MAX > ErzMob_32_Amount))
	{
		ErzMob_32_Amount = (ErzMob_32_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "HOEHLE_11") && (ErzMob_33_Amount_MAX > ErzMob_33_Amount))
	{
		ErzMob_33_Amount = (ErzMob_33_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "HOEHLE_12") && (ErzMob_34_Amount_MAX > ErzMob_34_Amount))
	{
		ErzMob_34_Amount = (ErzMob_34_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "HOEHLE_13") && (ErzMob_35_Amount_MAX > ErzMob_35_Amount))
	{
		ErzMob_35_Amount = (ErzMob_35_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_01B") && (ErzMob_36_Amount_MAX > ErzMob_36_Amount))
	{
		ErzMob_36_Amount = (ErzMob_36_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_01A") && (ErzMob_37_Amount_MAX > ErzMob_37_Amount))
	{
		ErzMob_37_Amount = (ErzMob_37_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_OM_ERZ_01") && (ErzMob_38_Amount_MAX > ErzMob_38_Amount))
	{
		ErzMob_38_Amount = (ErzMob_38_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_OM_ERZ_02") && (ErzMob_39_Amount_MAX > ErzMob_39_Amount))
	{
		ErzMob_39_Amount = (ErzMob_39_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_09") && (ErzMob_40_Amount_MAX > ErzMob_40_Amount))
	{
		ErzMob_40_Amount = (ErzMob_40_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_05") && (ErzMob_41_Amount_MAX > ErzMob_41_Amount))
	{
		ErzMob_41_Amount = (ErzMob_41_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_05B") && (ErzMob_42_Amount_MAX > ErzMob_42_Amount))
	{
		ErzMob_42_Amount = (ErzMob_42_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_06") && (ErzMob_43_Amount_MAX > ErzMob_43_Amount))
	{
		ErzMob_43_Amount = (ErzMob_43_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_07") && (ErzMob_44_Amount_MAX > ErzMob_44_Amount))
	{
		ErzMob_44_Amount = (ErzMob_44_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_057B") && (ErzMob_45_Amount_MAX > ErzMob_45_Amount))
	{
		ErzMob_45_Amount = (ErzMob_45_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_08") && (ErzMob_46_Amount_MAX > ErzMob_46_Amount))
	{
		ErzMob_46_Amount = (ErzMob_46_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_02") && (ErzMob_47_Amount_MAX > ErzMob_47_Amount))
	{
		ErzMob_47_Amount = (ErzMob_47_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_OM_ERZ_03") && (ErzMob_48_Amount_MAX > ErzMob_48_Amount))
	{
		ErzMob_48_Amount = (ErzMob_48_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_OM_ERZ_04") && (ErzMob_49_Amount_MAX > ErzMob_49_Amount))
	{
		ErzMob_49_Amount = (ErzMob_49_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_OM_ERZ_05") && (ErzMob_50_Amount_MAX > ErzMob_50_Amount))
	{
		ErzMob_50_Amount = (ErzMob_50_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_03") && (ErzMob_51_Amount_MAX > ErzMob_51_Amount))
	{
		ErzMob_51_Amount = (ErzMob_51_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_CAVE1_67") && (ErzMob_52_Amount_MAX > ErzMob_52_Amount))
	{
		ErzMob_52_Amount = (ErzMob_52_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_12") && (ErzMob_53_Amount_MAX > ErzMob_53_Amount))
	{
		ErzMob_53_Amount = (ErzMob_53_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_13") && (ErzMob_54_Amount_MAX > ErzMob_54_Amount))
	{
		ErzMob_54_Amount = (ErzMob_54_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_CAVE1_71") && (ErzMob_55_Amount_MAX > ErzMob_55_Amount))
	{
		ErzMob_55_Amount = (ErzMob_55_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_OM_ERZ_06") && (ErzMob_56_Amount_MAX > ErzMob_56_Amount))
	{
		ErzMob_56_Amount = (ErzMob_56_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_11") && (ErzMob_57_Amount_MAX > ErzMob_57_Amount))
	{
		ErzMob_57_Amount = (ErzMob_57_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_11B") && (ErzMob_58_Amount_MAX > ErzMob_58_Amount))
	{
		ErzMob_58_Amount = (ErzMob_58_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_CAVE1_74B") && (ErzMob_59_Amount_MAX > ErzMob_59_Amount))
	{
		ErzMob_59_Amount = (ErzMob_59_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_OM_ERZ_07") && (ErzMob_60_Amount_MAX > ErzMob_60_Amount))
	{
		ErzMob_60_Amount = (ErzMob_60_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_OM_ERZ_08") && (ErzMob_61_Amount_MAX > ErzMob_61_Amount))
	{
		ErzMob_61_Amount = (ErzMob_61_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_OM_ERZ_09") && (ErzMob_62_Amount_MAX > ErzMob_62_Amount))
	{
		ErzMob_62_Amount = (ErzMob_62_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_OM_ERZ_10") && (ErzMob_63_Amount_MAX > ErzMob_63_Amount))
	{
		ErzMob_63_Amount = (ErzMob_63_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_205") && (ErzMob_64_Amount_MAX > ErzMob_64_Amount))
	{
		ErzMob_64_Amount = (ErzMob_64_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_CAVE1_77") && (ErzMob_65_Amount_MAX > ErzMob_65_Amount))
	{
		ErzMob_65_Amount = (ErzMob_65_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_CAVE3_01") && (ErzMob_66_Amount_MAX > ErzMob_66_Amount))
	{
		ErzMob_66_Amount = (ErzMob_66_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_CAVE3_04B") && (ErzMob_67_Amount_MAX > ErzMob_67_Amount))
	{
		ErzMob_67_Amount = (ErzMob_67_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_CAVE3_04A") && (ErzMob_68_Amount_MAX > ErzMob_68_Amount))
	{
		ErzMob_68_Amount = (ErzMob_68_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_023") && (ErzMob_69_Amount_MAX > ErzMob_69_Amount))
	{
		ErzMob_69_Amount = (ErzMob_69_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_OM_ERZ_11") && (ErzMob_70_Amount_MAX > ErzMob_70_Amount))
	{
		ErzMob_70_Amount = (ErzMob_70_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_PICKORE_10") && (ErzMob_71_Amount_MAX > ErzMob_71_Amount))
	{
		ErzMob_71_Amount = (ErzMob_71_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_CAVE3_14") && (ErzMob_72_Amount_MAX > ErzMob_72_Amount))
	{
		ErzMob_72_Amount = (ErzMob_72_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_CAVE3_25A") && (ErzMob_73_Amount_MAX > ErzMob_73_Amount))
	{
		ErzMob_73_Amount = (ErzMob_73_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_CAVE3_25") && (ErzMob_74_Amount_MAX > ErzMob_74_Amount))
	{
		ErzMob_74_Amount = (ErzMob_74_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "OM_CAVE3_25B") && (ErzMob_75_Amount_MAX > ErzMob_75_Amount))
	{
		ErzMob_75_Amount = (ErzMob_75_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_VM_ERZHACKEN_01") && (ErzMob_76_Amount_MAX > ErzMob_76_Amount))
	{
		ErzMob_76_Amount = (ErzMob_76_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_VM_ERZHACKEN_02") && (ErzMob_77_Amount_MAX > ErzMob_77_Amount))
	{
		ErzMob_77_Amount = (ErzMob_77_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_VM_ERZHACKEN_03") && (ErzMob_78_Amount_MAX > ErzMob_78_Amount))
	{
		ErzMob_78_Amount = (ErzMob_78_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_VM_ERZHACKEN_04") && (ErzMob_79_Amount_MAX > ErzMob_79_Amount))
	{
		ErzMob_79_Amount = (ErzMob_79_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_VM_ERZHACKEN_05") && (ErzMob_80_Amount_MAX > ErzMob_80_Amount))
	{
		ErzMob_80_Amount = (ErzMob_80_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_VM_ERZHACKEN_06") && (ErzMob_82_Amount_MAX > ErzMob_82_Amount))
	{
		ErzMob_82_Amount = (ErzMob_82_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_VM_ERZHACKEN_07") && (ErzMob_83_Amount_MAX > ErzMob_83_Amount))
	{
		ErzMob_83_Amount = (ErzMob_83_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_VM_ERZHACKEN_08") && (ErzMob_84_Amount_MAX > ErzMob_84_Amount))
	{
		ErzMob_84_Amount = (ErzMob_84_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_VM_ERZHACKEN_09") && (ErzMob_85_Amount_MAX > ErzMob_85_Amount))
	{
		ErzMob_85_Amount = (ErzMob_85_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_VM_ERZHACKEN_10") && (ErzMob_86_Amount_MAX > ErzMob_86_Amount))
	{
		ErzMob_86_Amount = (ErzMob_86_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_VM_ERZHACKEN_11") && (ErzMob_87_Amount_MAX > ErzMob_87_Amount))
	{
		ErzMob_87_Amount = (ErzMob_87_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_VM_ERZHACKEN_12") && (ErzMob_88_Amount_MAX > ErzMob_88_Amount))
	{
		ErzMob_88_Amount = (ErzMob_88_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_VM_ERZHACKEN_13") && (ErzMob_89_Amount_MAX > ErzMob_89_Amount))
	{
		ErzMob_89_Amount = (ErzMob_89_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "WP_VM_ERZHACKEN_14") && (ErzMob_90_Amount_MAX > ErzMob_90_Amount))
	{
		ErzMob_90_Amount = (ErzMob_90_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "MINE_GO_24") && (ErzMob_91_Amount_MAX > ErzMob_91_Amount))
	{
		ErzMob_91_Amount = (ErzMob_91_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_58") && (ErzMob_92_Amount_MAX > ErzMob_92_Amount))
	{
		ErzMob_92_Amount = (ErzMob_92_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_59") && (ErzMob_93_Amount_MAX > ErzMob_93_Amount))
	{
		ErzMob_93_Amount = (ErzMob_93_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_60") && (ErzMob_94_Amount_MAX > ErzMob_94_Amount))
	{
		ErzMob_94_Amount = (ErzMob_94_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_61") && (ErzMob_95_Amount_MAX > ErzMob_95_Amount))
	{
		ErzMob_95_Amount = (ErzMob_95_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_62") && (ErzMob_96_Amount_MAX > ErzMob_96_Amount))
	{
		ErzMob_96_Amount = (ErzMob_96_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_63") && (ErzMob_97_Amount_MAX > ErzMob_97_Amount))
	{
		ErzMob_97_Amount = (ErzMob_97_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_64") && (ErzMob_98_Amount_MAX > ErzMob_98_Amount))
	{
		ErzMob_98_Amount = (ErzMob_98_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_65") && (ErzMob_99_Amount_MAX > ErzMob_99_Amount))
	{
		ErzMob_99_Amount = (ErzMob_99_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_66") && (ErzMob_100_Amount_MAX > ErzMob_100_Amount))
	{
		ErzMob_100_Amount = (ErzMob_100_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_67") && (ErzMob_101_Amount_MAX > ErzMob_101_Amount))
	{
		ErzMob_101_Amount = (ErzMob_101_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_68") && (ErzMob_102_Amount_MAX > ErzMob_102_Amount))
	{
		ErzMob_102_Amount = (ErzMob_102_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_69") && (ErzMob_103_Amount_MAX > ErzMob_103_Amount))
	{
		ErzMob_103_Amount = (ErzMob_103_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_70") && (ErzMob_104_Amount_MAX > ErzMob_104_Amount))
	{
		ErzMob_104_Amount = (ErzMob_104_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_71") && (ErzMob_105_Amount_MAX > ErzMob_105_Amount))
	{
		ErzMob_105_Amount = (ErzMob_105_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_72") && (ErzMob_106_Amount_MAX > ErzMob_106_Amount))
	{
		ErzMob_106_Amount = (ErzMob_106_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_73") && (ErzMob_107_Amount_MAX > ErzMob_107_Amount))
	{
		ErzMob_107_Amount = (ErzMob_107_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_74") && (ErzMob_108_Amount_MAX > ErzMob_108_Amount))
	{
		ErzMob_108_Amount = (ErzMob_108_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_75") && (ErzMob_109_Amount_MAX > ErzMob_109_Amount))
	{
		ErzMob_109_Amount = (ErzMob_109_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_76") && (ErzMob_110_Amount_MAX > ErzMob_110_Amount))
	{
		ErzMob_110_Amount = (ErzMob_110_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_77") && (ErzMob_111_Amount_MAX > ErzMob_111_Amount))
	{
		ErzMob_111_Amount = (ErzMob_111_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_78") && (ErzMob_112_Amount_MAX > ErzMob_112_Amount))
	{
		ErzMob_112_Amount = (ErzMob_112_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_56") && (ErzMob_113_Amount_MAX > ErzMob_113_Amount))
	{
		ErzMob_113_Amount = (ErzMob_113_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "RM_37") && (ErzMob_114_Amount_MAX > ErzMob_114_Amount))
	{
		ErzMob_114_Amount = (ErzMob_114_Amount +1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "NW_ORE_001") && (ErzMob_115_Amount_MAX > ErzMob_115_Amount))
	{
		ErzMob_115_Amount = (ErzMob_115_Amount + 1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "NW_ORE_002") && (ErzMob_116_Amount_MAX > ErzMob_116_Amount))
	{
		ErzMob_116_Amount = (ErzMob_116_Amount + 1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "NW_ORE_003") && (ErzMob_117_Amount_MAX > ErzMob_117_Amount))
	{
		ErzMob_117_Amount = (ErzMob_117_Amount + 1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "NW_ORE_004") && (ErzMob_118_Amount_MAX > ErzMob_118_Amount))
	{
		ErzMob_118_Amount = (ErzMob_118_Amount + 1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "NW_ORE_005") && (ErzMob_119_Amount_MAX > ErzMob_119_Amount))
	{
		ErzMob_119_Amount = (ErzMob_119_Amount + 1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "NW_ORE_006") && (ErzMob_120_Amount_MAX > ErzMob_120_Amount))
	{
		ErzMob_120_Amount = (ErzMob_120_Amount + 1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "NW_ORE_007") && (ErzMob_121_Amount_MAX > ErzMob_121_Amount))
	{
		ErzMob_121_Amount = (ErzMob_121_Amount + 1);
		return TRUE;
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self), "NW_ORE_008") && (ErzMob_122_Amount_MAX > ErzMob_122_Amount))
	{
		ErzMob_122_Amount = (ErzMob_122_Amount + 1);
		return TRUE;
	};

	return FALSE;
};

INSTANCE PC_Erzhacken_Hacken (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Erzhacken_Hacken_Condition;
	information	= PC_Erzhacken_Hacken_Info;
	permanent	= 1;
	important	= 0;
	description	= "Einfach mal hacken.";
};

FUNC INT PC_Erzhacken_Hacken_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Erzhacken)
	{
		return 1;
	};
};

FUNC VOID PC_Erzhacken_Hacken_Info()
{
	var int ErzKriegChance;
	var int ErzAnzahl;
	ErzKriegChance	=	r_max(99);
	ErzAnzahl	=	r_max(99);

	if (B_ErzMob_Bestimmung() == TRUE)
	{
		if (Erzhackchance >= ErzKriegChance)
		{
			if (ErzAnzahl < 60)
			{
				CreateInvItems	(hero, ItMi_Nugget, 1);
				PrintScreen	("1 Erzbrocken gehackt!", -1, -1, FONT_ScreenSmall, 2);
				Truemmer_Count = 0;
			}
			else if (ErzAnzahl < 80)
			{
				CreateInvItems	(hero, ItMi_Nugget, 2);
				PrintScreen	("2 Erzbrocken gehackt!", -1, -1, FONT_ScreenSmall, 2);
				Truemmer_Count = 0;
			}
			else
			{
				CreateInvItems	(hero, ItMi_Nugget, 3);
				PrintScreen	("3 Erzbrocken gehackt!", -1, -1, FONT_ScreenSmall, 2);
				Truemmer_Count = 0;
			};
		}
		else
		{
			PrintScreen	("Erzsplitter fliegen durch die Luft!", -1, -1, FONT_ScreenSmall, 2);	
			Truemmer_Count = (Truemmer_Count +1);		
		};
	}
	else
	{
		PrintScreen ("Hier gibt's nichts mehr zu holen.", -1, -1, FONT_ScreenSmall, 2);	
		B_ENDPRODUCTIONDIALOG ();
		return;
	};

	Learn_by_doing = (Learn_by_doing +1);
	
	if (Learn_by_doing == 10)
	{
		B_Upgrade_ErzHackChance (2);
	}
	else if (Learn_by_doing == 15)
	{
		B_Upgrade_ErzHackChance (3);
	}	
	else if (Learn_by_doing == 20)
	{
		B_Upgrade_ErzHackChance (5);
	}
	else if (Learn_by_doing%30 == 0)
	{
		B_Upgrade_ErzHackChance (5);
	};

	
	var int Abnutzung;
	Abnutzung	=	r_max(99);
	
	if (Abnutzung	<=	20)
	{
		SpitzhackenAbnutzung	=	SpitzhackenAbnutzung + 1;
	
		if (SpitzhackenAbnutzung	==	40)
		{
			B_ENDPRODUCTIONDIALOG();

			AI_UseMob		(hero,"ORE",-1);

			AI_UnequipWeapons	(hero);

			Npc_RemoveInvItems	(hero, ItMw_2H_Axe_L_01, 1);
		
			SpitzhackenAbnutzung	=	0;
		};
	};
};

INSTANCE PC_Erzhacken_TSchlag (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Erzhacken_TSchlag_Condition;
	information		= PC_Erzhacken_TSchlag_Info;
	permanent		= TRUE;
	description		= "Trümmerschlag ansetzen."; 
};

FUNC INT PC_Erzhacken_TSchlag_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_ERZHACKEN)
	&& (Truemmer_Count >= 2)
	&& (Knows_Truemmerschlag == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID PC_Erzhacken_TSchlag_Info()
{
	var int TruemmerChance;
	TruemmerChance = r_max(99);
		
	if (TruemmerChance < 5)
	{
			PrintScreen ("Nichts ...", -1, -1, FONT_ScreenSmall, 2);	
	}
	else
	{
		Snd_Play ("RAVENS_EARTHQUAKE3");
		Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
		
		
		if (TruemmerChance >= 85)
		{
			//----Gold verteilen-----------------------
			CreateInvItems (hero, ItMi_Nugget, 3);	
			PrintScreen ("3 Erzbrocken gehackt!", -1, -1, FONT_ScreenSmall, 2);	
			
		}
		else if (TruemmerChance >= 50)
		{
			CreateInvItems (hero, ItMi_Nugget, 2);	
			PrintScreen ("2 Erzbrocken gehackt! ...", -1, -1, FONT_ScreenSmall, 2);	
		
		}
		else 
		{
			CreateInvItems (hero, ItMi_Nugget, 1);	
			PrintScreen ("1 Erzbrocken gehackt! ...", -1, -1, FONT_ScreenSmall, 2);	
		};
	};

	Truemmer_Count = 0;	
};

INSTANCE PC_Erzhacken_Chance (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Erzhacken_Chance_Condition;
	information		= PC_Erzhacken_Chance_Info;
	permanent		= TRUE;
	description		= "(Eigene Fähigkeit prüfen)"; 
};

FUNC INT PC_Erzhacken_Chance_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_ERZHACKEN)
	{	
		return TRUE;
	};
};
FUNC VOID PC_Erzhacken_Chance_Info()
{
	var string ConcatText;

	if (ErzHackChance < 20) 
	{
		ConcatText = ConcatStrings ("blutiger Anfänger (", IntToString (ErzHackChance));
	}
	else if (ErzHackChance < 40) 
	{
		ConcatText = ConcatStrings ("ganz passabler Schürfer (" , IntToString (ErzHackChance));
	}
	else if (ErzHackChance < 55) 
	{
		ConcatText = ConcatStrings ("erfahrener Goldschürfer (", IntToString (ErzHackChance));
	}
	else if (ErzHackChance < 75) 
	{
		ConcatText = ConcatStrings ("waschechter Buddler ( ", IntToString (ErzHackChance));
	}
	else if (ErzHackChance < 90) 
	{
		ConcatText = ConcatStrings ("verdammt guter Buddler ( ", IntToString (ErzHackChance));
	}
	else if (ErzHackChance < 98) 
	{
		ConcatText = ConcatStrings ("Meister Buddler ( ", IntToString (ErzHackChance));
	}
	else
	{
		ConcatText = ConcatStrings ("Buddler Guru ( ", IntToString (ErzHackChance));
	};
	
	ConcatText = ConcatStrings (concatText, " Prozent)");
	
	PrintScreen (concatText, -1, -1, FONT_ScreenSmall,2);
};
	
INSTANCE PC_Erzhacken_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Erzhacken_EXIT_Condition;
	information	= PC_Erzhacken_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_Erzhacken_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Erzhacken)
	&& (Hacken	==	FALSE)
	{
		return 1;
	};
};

FUNC VOID PC_Erzhacken_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
	Truemmer_Count = 0;
};