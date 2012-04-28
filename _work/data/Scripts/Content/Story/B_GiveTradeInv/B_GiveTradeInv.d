// **********************************************
// B_GiveTradeInventory
// --------------------
// Verteiler. Aufruf aller B_GiveTradeInv-Befehle
// **********************************************

func void B_GiveTradeInv (var C_NPC slf)
{
//******************************************************************
//	Hier muss jeder Händler eingetragen werden!!!!!!!
//******************************************************************	
	//MOD
	var C_NPC Trd_Myxir_MT;		Trd_Myxir_MT		= Hlp_GetNpc (Mod_515_KDS_Myxir_MT);
	var C_NPC Trd_Scar_MT;		Trd_Scar_MT		= Hlp_GetNpc (Mod_518_SMK_Scar_MT);
	var C_NPC Trd_Erol_NW;		Trd_Erol_NW		= Hlp_GetNpc (Mod_521_NONE_Erol_NW);
	var C_NPC Trd_Matteo_NW;	Trd_Matteo_NW		= Hlp_GetNpc (Mod_529_NONE_Matteo_NW);
	var C_NPC Trd_Bosper_NW;	Trd_Bosper_NW		= Hlp_GetNpc (Mod_531_NONE_Bosper_NW);
	var C_NPC Trd_Constantino_NW;	Trd_Constantino_NW	= Hlp_GetNpc (Mod_532_NONE_Constantino_NW);
	var C_NPC Trd_Elena_NW;		Trd_Elena_NW		= Hlp_GetNpc (Mod_783_BAU_Elena_NW);
	var C_NPC Trd_Thekla_NW;	Trd_Thekla_NW		= Hlp_GetNpc (Mod_799_BAU_Thekla_NW);
	Var C_NPC Trd_Gorax_NW;		Trd_Gorax_NW		= Hlp_GetNpc (Mod_917_KDF_Gorax_NW);
	var C_NPC Trd_Salandril_NW;	Trd_Salandril_NW	= Hlp_GetNpc (Mod_751_NONE_Salandril_NW);
	var C_NPC Trd_Brahim_NW;	Trd_Brahim_NW		= Hlp_GetNpc (Mod_565_NONE_Brahim_NW);
	var C_NPC Trd_Cronos_NW;	Trd_Cronos_NW		= Hlp_GetNpc (Mod_758_KDW_Cronos_NW);
	var C_NPC Trd_Cronos_AW;	Trd_Cronos_AW		= Hlp_GetNpc (Mod_9001_KDW_Cronos_AW);
	var C_NPC Trd_Baltram_NW;	Trd_Baltram_NW		= Hlp_GetNpc (Mod_561_NONE_Baltram_NW);
	var C_NPC Trd_Bennet_NW;	Trd_Bennet_NW		= Hlp_GetNpc (Mod_562_NONE_Bennet_NW);
	var C_NPC Trd_Brian_NW;		Trd_Brian_NW		= Hlp_GetNpc (Mod_566_NONE_Brian_NW);
	var C_NPC Trd_Coragon_NW;	Trd_Coragon_NW		= Hlp_GetNpc (Mod_570_NONE_Coragon_NW);
	var C_NPC Trd_Fenia_NW;		Trd_Fenia_NW		= Hlp_GetNpc (Mod_575_NONE_Fenia_NW);
	var C_NPC Trd_Gaertner_NW;	Trd_Gaertner_NW		= Hlp_GetNpc (Mod_1035_VLK_Gaertner_NW);
	var C_NPC Trd_Hakon_NW;		Trd_Hakon_NW		= Hlp_GetNpc (Mod_581_NONE_Hakon_NW);
	var C_NPC Trd_Halvor_NW;	Trd_Halvor_NW		= Hlp_GetNpc (Mod_582_NONE_Halvor_NW);
	var C_NPC Trd_Ignaz_NW;		Trd_Ignaz_NW		= Hlp_GetNpc (Mod_584_NONE_Ignaz_NW);
	var C_NPC Trd_Isgaroth_NW;	Trd_Isgaroth_NW		= Hlp_GetNpc (Mod_920_KDF_Isgaroth_NW);
	var C_NPC Trd_Jora_NW;		Trd_Jora_NW		= Hlp_GetNpc (Mod_589_NONE_Jora_NW);
	var C_NPC Trd_Kardif_NW;	Trd_Kardif_NW		= Hlp_GetNpc (Mod_590_NONE_Kardif_NW);
	var C_NPC Trd_Lutero_NW;	Trd_Lutero_NW		= Hlp_GetNpc (Mod_594_NONE_Lutero_NW);
	var C_NPC Trd_Orlan_NW;		Trd_Orlan_NW		= Hlp_GetNpc (Mod_776_NONE_Orlan_NW);
	var C_NPC Trd_Sagitta_NW;	Trd_Sagitta_NW		= Hlp_GetNpc (Mod_773_NONE_Sagitta_NW);
	var C_NPC Trd_Rosi_NW;		Trd_Rosi_NW		= Hlp_GetNpc (Mod_772_BAU_Rosi_NW);
	var C_NPC Trd_Liselotte_NW;	Trd_Liselotte_NW	= Hlp_GetNpc (Mod_546_NONE_Liselotte_NW);
	var C_NPC Trd_Zuris_NW;		Trd_Zuris_NW		= Hlp_GetNpc (Mod_757_NONE_Zuris_NW);
	var C_NPC Trd_Skip_AW;		Trd_Skip_AW		= Hlp_GetNpc (Mod_775_PIR_Skip_AW);
	var C_NPC Trd_Garett_AW;	Trd_Garett_AW		= Hlp_GetNpc (Mod_933_PIR_Garett_AW);
	var C_NPC Trd_Skip_DI;		Trd_Skip_DI		= Hlp_GetNpc (Mod_1540_PIR_Skip_DI);
	var C_NPC Trd_Garett_DI;	Trd_Garett_DI		= Hlp_GetNpc (Mod_1543_PIR_Garett_DI);
	var C_NPC Trd_Cipher_MT;	Trd_Cipher_MT		= Hlp_GetNpc (Mod_781_SLD_Cipher_MT);
	var C_NPC Trd_Miguel_MT;	Trd_Miguel_MT		= Hlp_GetNpc (Mod_958_BDT_Miguel_MT);
	var C_NPC Trd_Fisk_MT;		Trd_Fisk_MT		= Hlp_GetNpc (Mod_950_STT_Fisk_MT);
	var C_NPC Trd_Fortuno_MT;	Trd_Fortuno_MT		= Hlp_GetNpc (Mod_951_PSINOV_Fortuno_MT);
	var C_NPC Trd_Samuel_AW;	Trd_Samuel_AW		= Hlp_GetNpc (Mod_940_PIR_Samuel_AW);
	var C_NPC Trd_Thofeistos_MT;	Trd_Thofeistos_MT		= Hlp_GetNpc (Mod_7220_SLD_Thofeistos_MT);
	var C_NPC Trd_Borka_NW;		Trd_Borka_NW		= Hlp_GetNpc (Mod_563_NONE_Borka_NW);
	var C_NPC Trd_Darrion_MT;	Trd_Darrion_MT		= Hlp_GetNpc (Mod_2014_PSINOV_Darrion_MT);
	var C_NPC Trd_Lebensmittelhaendler_REL;	Trd_Lebensmittelhaendler_REL		= Hlp_GetNpc (Mod_7338_OUT_Lebensmittelhaendler_REL);
	var C_NPC Trd_Caine_MT;	Trd_Caine_MT		= Hlp_GetNpc (Mod_1116_PSINOV_Caine_MT);
	var C_NPC Trd_Snaf_MT;	Trd_Snaf_MT		= Hlp_GetNpc (Mod_965_STT_Snaf_MT);
	var C_NPC Trd_Anna_REL;	Trd_Anna_REL		= Hlp_GetNpc (Mod_7376_OUT_Anna_REL);
	var C_NPC Trd_Hans_REL;	Trd_Hans_REL		= Hlp_GetNpc (Mod_7377_OUT_Hans_REL);
	var C_NPC Trd_Daniel_REL;	Trd_Daniel_REL		= Hlp_GetNpc (Mod_7378_OUT_Daniel_REL);
	var C_NPC Trd_Erika_REL;	Trd_Erika_REL		= Hlp_GetNpc (Mod_7381_OUT_Erika_REL);
	var C_NPC Trd_Peter_REL;	Trd_Peter_REL		= Hlp_GetNpc (Mod_7386_OUT_Peter_REL);
	var C_NPC Trd_Martin_NW;	Trd_Martin_NW		= Hlp_GetNpc (Mod_596_MIL_Martin_NW);
	var C_NPC Trd_Ursula_REL;	Trd_Ursula_REL		= Hlp_GetNpc (Mod_7423_OUT_Ursula_REL);
	var C_NPC Trd_Wulfgar_JL;	Trd_Wulfgar_JL		= Hlp_GetNpc (Mod_7436_JG_Wulfgar_MT);
	var C_NPC Trd_Woron_JL;	Trd_Woron_JL		= Hlp_GetNpc (Mod_7521_JG_Woron_JL);
	var C_NPC Trd_Hungar_JL;	Trd_Hungar_JL		= Hlp_GetNpc (Mod_7522_JG_Hungar_JL);
	var C_NPC Trd_Silas_MT;	Trd_Silas_MT		= Hlp_GetNpc (Mod_1291_SLD_Silas_MT);
	var C_NPC Trd_Rupert_NW;	Trd_Rupert_NW		= Hlp_GetNpc (Mod_750_NONE_Rupert_NW);
	var C_NPC Trd_Bernd_MT;	Trd_Bernd_MT		= Hlp_GetNpc (Mod_1012_KGD_Bernd_MT);
	var C_NPC Trd_Brauer_REL;	Trd_Brauer_REL		= Hlp_GetNpc (Mod_7578_OUT_Brauer_REL);
	var C_NPC Trd_Sagitta_IR;	Trd_Sagitta_IR		= Hlp_GetNpc (Mod_7459_NONE_Sagitta_IR);
	var C_NPC Trd_Sharky_MT;	Trd_Sharky_MT		= Hlp_GetNpc (Mod_1293_SLD_Sharky_MT);
	var C_NPC Trd_Alfans_EIS;	Trd_Alfans_EIS		= Hlp_GetNpc (Mod_7644_OUT_Alfans_EIS);
	var C_NPC Trd_Aabid_NW;	Trd_Aabid_NW		= Hlp_GetNpc (Mod_7105_ASS_Aabid_NW);
	var C_NPC Trd_Maysara_NW;	Trd_Maysara_NW		= Hlp_GetNpc (Mod_7122_ASS_Maysara_NW);
	var C_NPC Trd_Mufid_NW;	Trd_Mufid_NW		= Hlp_GetNpc (Mod_7149_ASS_Mufid_NW);
	var C_NPC Trd_Harlok_REL;	Trd_Harlok_REL		= Hlp_GetNpc (Mod_2015_PSINOV_Harlok_REL);
	var C_NPC Trd_Morpheus_REL;	Trd_Morpheus_REL		= Hlp_GetNpc (Mod_7581_OUT_Morpheus_REL);
	var C_NPC Trd_Anor_MT;	Trd_Anor_MT		= Hlp_GetNpc (Mod_1628_VMG_Anor_MT);
	var C_NPC Trd_Hermy_MT;	Trd_Hermy_MT		= Hlp_GetNpc (Mod_4020_VMG_Hermy_MT);
	var C_NPC Trd_Genn_TUG;	Trd_Genn_TUG		= Hlp_GetNpc (Mod_1959_VMG_Genn_TUG);
	var C_NPC Trd_Gestath_EIS;	Trd_Gestath_EIS		= Hlp_GetNpc (Mod_974_OUT_Gestath_EIS);
	var C_NPC Trd_Schmuggler_NW;	Trd_Schmuggler_NW		= Hlp_GetNpc (Mod_7783_OUT_Schmuggler_NW);
	var C_NPC Trd_Anglar_EIS;	Trd_Anglar_EIS		= Hlp_GetNpc (Mod_7792_OUT_Anglar_EIS);
	var C_NPC Trd_Eduard_MT;	Trd_Eduard_MT		= Hlp_GetNpc (Mod_1027_SMK_Eduard_MT);
	var C_NPC Trd_Alberto_OM;	Trd_Alberto_OM		= Hlp_GetNpc (Mod_7800_SMK_Alberto_OM);
	
	
//********************************************************************
//		Hier auch!!!
//********************************************************************

	B_ClearRuneInv (slf);
	
	if (slf.aivar[AIV_ChapterInv] <= Kapitel)
	{
		//MOD
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Myxir_MT)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Myxir_MT		(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Scar_MT)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Scar_MT		(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Erol_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Erol_NW		(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Matteo_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Matteo_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Bosper_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Bosper_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Constantino_NW)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Constantino_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Elena_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Elena_NW		(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Thekla_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Thekla_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Gorax_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Gorax_NW		(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Salandril_NW)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Salandril_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Brahim_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Brahim_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Cronos_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Cronos_NW		(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Cronos_AW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Cronos_AW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Baltram_NW)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Baltram_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Bennet_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Bennet_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Brian_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Brian_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Coragon_NW)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Coragon_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Fenia_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Fenia_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Gaertner_NW)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Gaertner_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Hakon_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Hakon_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Halvor_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Halvor_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Ignaz_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Ignaz_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Isgaroth_NW)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Isgaroth_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Jora_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Jora_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Kardif_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Kardif_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Lutero_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Lutero_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Orlan_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Orlan_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Sagitta_NW)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Sagitta_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Rosi_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Rosi_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Skip_AW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Skip_AW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Garett_AW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Garett_AW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Skip_DI)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Skip_DI	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Garett_DI)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Garett_DI	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Liselotte_NW)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Liselotte_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Zuris_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Zuris_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Cipher_MT)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Cipher_MT	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Miguel_MT)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Miguel_MT	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Fisk_MT)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Fisk_MT	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Fortuno_MT)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Fortuno_MT	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Samuel_AW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Samuel_AW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Thofeistos_MT)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Thofeistos_MT	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Borka_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Borka_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Darrion_MT)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Darrion_MT	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Lebensmittelhaendler_REL)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Lebensmittelhaendler_REL	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Caine_MT)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Caine_MT	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Snaf_MT)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Snaf_MT	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Anna_REL)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Anna_REL	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Hans_REL)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Hans_REL	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Daniel_REL)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Daniel_REL	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Erika_REL)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Erika_REL	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Peter_REL)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Peter_REL	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Martin_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Martin_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Ursula_REL)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Ursula_REL	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Wulfgar_JL)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Wulfgar_JL	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Woron_JL)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Woron_JL	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Hungar_JL)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Hungar_JL	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Silas_MT)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Silas_MT	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Rupert_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Rupert_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Bernd_MT)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Bernd_MT	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Brauer_REL)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Brauer_REL	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Sagitta_IR)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Sagitta_IR	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Sharky_MT)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Sharky_MT	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Alfans_EIS)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Alfans_EIS	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Aabid_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Aabid_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Maysara_NW)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Maysara_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Mufid_NW)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Mufid_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Harlok_REL)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Harlok_REL	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Morpheus_REL)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Morpheus_REL	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Anor_MT)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Anor_MT	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Hermy_MT)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Hermy_MT	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Genn_TUG)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Genn_TUG	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Gestath_EIS)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Gestath_EIS	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Schmuggler_NW)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Schmuggler_NW	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Anglar_EIS)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Anglar_EIS	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Eduard_MT)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Eduard_MT	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Alberto_OM)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Mod_Alberto_OM	(slf);};
		
		slf.aivar[AIV_ChapterInv] = (Kapitel +1);
	};		
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//	Handelsware Clearen und Ambientstuff in die Tasche, wenn Trader Unconscious oder Dead
	////////////////////////////////////////////////////////////////////////////////////////////////////
	
	if 	(Npc_IsInState	(slf, ZS_Dead))
	||	(Npc_IsInState	(slf, ZS_Unconscious ))
	{
		//MOD
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Myxir_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Scar_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Erol_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Matteo_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Bosper_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Constantino_NW)	{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Elena_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Thekla_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Gorax_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Salandril_NW)	{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Brahim_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Cronos_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Cronos_AW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Baltram_NW)	{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Bennet_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Brian_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Coragon_NW)	{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Fenia_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Gaertner_NW)	{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Hakon_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Halvor_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Ignaz_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Isgaroth_NW)	{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Jora_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Kardif_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Lutero_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Orlan_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Sagitta_NW)	{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Rosi_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Liselotte_NW)	{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Zuris_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Skip_AW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Garett_AW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Skip_DI)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Garett_DI)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Cipher_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Miguel_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Fisk_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Fortuno_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Samuel_AW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Thofeistos_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Borka_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Darrion_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Lebensmittelhaendler_REL)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Caine_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Snaf_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Anna_REL)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Hans_REL)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Daniel_REL)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Erika_REL)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Peter_REL)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Martin_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Ursula_REL)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Wulfgar_JL)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Woron_JL)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Hungar_JL)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Silas_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Rupert_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Bernd_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Brauer_REL)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Sagitta_IR)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Sharky_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Alfans_EIS)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Aabid_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Maysara_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Mufid_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Harlok_REL)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Morpheus_REL)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Anor_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Hermy_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Genn_TUG)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Gestath_EIS)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Schmuggler_NW)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Anglar_EIS)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Eduard_MT)		{B_ClearDeadTrader	(slf);};
		if Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Alberto_OM)		{B_ClearDeadTrader	(slf);};		
	};
};