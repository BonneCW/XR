// ***********************************************
// B_RefreshAtInsert
// -----------------
// Funktion wird von der Engine aufgerufen
// und zwar für jedem NSC (auch Monster), 
// die in die "Darstellungsglocke" kommen
// self ist hier immr der jeweils abgehandelte NSC
// ***********************************************

func void B_RefreshAtInsert()
{
	// EXIT IF...
	
	// ------ Tote = Exit ------
	if (self.attribute[ATR_HITPOINTS] <= 0)
	{
		return;
	};

	// ------ Tote = Exit ------
	if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	&& (self.guild < GIL_SEPERATOR_HUM)
	&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(hero))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	};

	if (self.aivar[AIV_Verhandlungsgeschick] != Mod_Verhandlungsgeschick)
	&& (self.guild < GIL_SEPERATOR_HUM)
	{
		self.aivar[AIV_Verhandlungsgeschick] = Mod_Verhandlungsgeschick;

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1951_Priester_NW))
		{
			if (r_max(99) < 75)
			{
				self.aivar[AIV_Verhandlung] = TRUE;
			}
			else
			{
				self.aivar[AIV_Verhandlung] = FALSE;
			};
		}
		else if (r_max(99) < Mod_Verhandlungsgeschick)
		{
			self.aivar[AIV_Verhandlung] = TRUE;
		}
		else
		{
			self.aivar[AIV_Verhandlung] = FALSE;
		};
	};
		
	// FUNC
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	// ------ Nur für Humans -----
	if (self.guild < GIL_SEPERATOR_HUM)
	&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(her))
	{
		// ------ LE wieder auf MAX ------
		//self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		
		// ------ Game-Engine equippt automatisch die besten Waffen NACHDEM diese Funktion aufgerufen wird ------
		if 	(Npc_HasEquippedWeapon(self) == FALSE) //NK- ODER FK-Waffe
		{
			if (self.guild < GIL_SEPERATOR_HUM)	
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_758_KDW_Cronos_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_768_KDW_Merdarion_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_769_KDW_Nefarius_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_771_KDW_Riordian_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1554_KDW_Jones_DI))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_9001_KDW_Cronos_AW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_9002_KDW_Nefarius_AW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_9003_KDW_Riordian_AW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_9004_KDW_Merdarion_AW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_473_DMB_Andokai_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_513_DMB_Xardas_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_678_DMB_Xardas_AW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_514_DMB_Karras_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_680_DMB_Xardas_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_843_DMB_Xardas_GDG))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_6007_DMB_Andokai_GDG))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_6008_DMB_Karras_GDG))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_2003_GUR_BaalTondral_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_2004_GUR_BaalNamib_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_2005_GUR_CorCadar_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_2006_GUR_BaalTyon_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_2007_GUR_BaalOrun_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_524_KDW_Vatras_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_774_KDW_Saturas_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_6003_KDW_Saturas_GDG))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_6010_KDW_Vatras_GDG))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_9000_KDW_Saturas_AW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1625_VMG_Neol_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1626_VMG_Furt_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1627_VMG_Ken_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1628_VMG_Anor_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1630_VMG_Ferco_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_588_WNOV_Joe_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_515_KDS_Myxir_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_556_NOV_Theodor_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_724_NOV_Mattheus_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_753_NOV_Ulf_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_913_NOV_Agon_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_914_NOV_Babo_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_915_NOV_Dyrian_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_916_NOV_Garwig_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_919_NOV_Igaraz_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_923_NOV_Opolos_NW))
			&& (self.npctype != NPCTYPE_NW_FEUERNOVIZE)
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_534_KDF_Milten_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_523_KDF_Daron_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_554_KDF_Parlan_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_917_KDF_Gorax_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_918_KDF_Hyglas_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_921_KDF_Marduk_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_922_KDF_Neoras_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_920_KDF_Isgaroth_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1771_KDF_Aaron_PAT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_551_KDF_Pyrokar_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_552_KDF_Serpentes_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_553_KDF_Ulthar_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_925_KDF_Talamon_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_6002_KDF_Pyrokar_GDG))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_6009_KDF_Ulthar_GDG))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_6011_KDF_Serpentes_GDG))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1746_KDF_Tojan_PAT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1747_KDF_Furgas_PAT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1770_KDF_Faros_PAT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1772_KDF_Gizar_PAT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1773_KDF_Nagon_PAT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1857_KDF_Magier_PAT))
			&& (self.npctype != npctype_pat_ordenspriester)
			&& (self.npctype != npctype_pat_ordenspriester_mauer)
			&& (self.npctype != npctype_pat_hexe)
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1030_SNOV_Abdi_MT))
			&& (self.npctype != NPCTYPE_NW_SCHWARZERNOVIZE)
			&& (self.npctype != NPCTYPE_PAT_SCHWARZERMAGIER)
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1775_DMB_Beschwoerer_PAT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1739_KDF_Ordenspriester_PAT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1738_KDF_Velario_PAT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1768_KDF_Magier_PAT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_1896_DMB_Karras_MT))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_7036_NONE_Pilger_NW))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_7371_OUT_Richter_REL))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_7372_OUT_Schoeppe_REL))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_7373_OUT_Schoeppe_REL))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_7391_OUT_Henker_REL))
			&& ((self.id < 13000)
			|| (self.id >= 14000))
			{
				CreateInvItems	(self, ItMw_1h_Bau_Mace, 1);
			};
		};
	};

	if (self.npctype == NPCTYPE_MT_GARDIST)
	|| (self.npctype == NPCTYPE_MT_SCHATTEN)
	|| (self.npctype == NPCTYPE_MT_BUDDLER)
	{
		if (Kapitel >= 4)
		{
			B_KillNpc	(self);
		};
	};

	self.aivar[AIV_OrkUluMulu] = FALSE;
};
