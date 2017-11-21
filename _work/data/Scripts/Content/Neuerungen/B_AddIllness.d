FUNC VOID B_AddBissDerFaeulnis() {
	// Zeit festlegen

	if (Krankheit == 0) {
		BissDerFaeulnis_Stufe01 = 200;
		BissDerFaeulnis_Stufe02 = 200;
		BissDerFaeulnis_Stufe03 = 200;
	} else if (Krankheit == 1) {
		BissDerFaeulnis_Stufe01 = 180;
		BissDerFaeulnis_Stufe02 = 180;
		BissDerFaeulnis_Stufe03 = 180;
	} else if (Krankheit == 2) {
		BissDerFaeulnis_Stufe01 = 162;
		BissDerFaeulnis_Stufe02 = 162;
		BissDerFaeulnis_Stufe03 = 162;
	} else if (Krankheit == 3) {
		BissDerFaeulnis_Stufe01 = 146;
		BissDerFaeulnis_Stufe02 = 146;
		BissDerFaeulnis_Stufe03 = 146;
	} else if (Krankheit == 4) {
		BissDerFaeulnis_Stufe01 = 131;
		BissDerFaeulnis_Stufe02 = 131;
		BissDerFaeulnis_Stufe03 = 131;
	};

	// Mali festlegen und die Start-Mali gleich abziehen

	if (KBDF == 0) {
		B_SetBissDerFaeulnisWerte (10, 10, 5, 5, 30, 15, 10, 10, 60, 30, 20, 20);
	} else if (KBDF == 1) {
		B_SetBissDerFaeulnisWerte (8, 8, 4, 4, 24, 12, 8, 8, 48, 24, 16, 16);
	} else if (KBDF == 2) {
		B_SetBissDerFaeulnisWerte (6, 6, 3, 3, 19, 10, 6, 6, 38, 19, 13, 13);
	} else if (KBDF == 3) {
		B_SetBissDerFaeulnisWerte (5, 5, 3, 3, 15, 8, 5, 5, 31, 15, 10, 10);
	} else if (KBDF == 4) {
		B_SetBissDerFaeulnisWerte (4, 4, 2, 2, 12, 6, 4, 4, 25, 12, 8, 8);
	};

	BissDerFaeulnis_Time = 1;
};

FUNC VOID B_AddHauchDerPestilenz() {
	// Zeit festlegen

	if (Krankheit == 0) {
		HauchDerPestilenz_Stufe01 = 120;
		HauchDerPestilenz_Stufe02 = 160;
		HauchDerPestilenz_Stufe03 = 720;
	} else if (Krankheit == 1) {
		HauchDerPestilenz_Stufe01 = 108;
		HauchDerPestilenz_Stufe02 = 144;
		HauchDerPestilenz_Stufe03 = 648;
	} else if (Krankheit == 2) {
		HauchDerPestilenz_Stufe01 = 97;
		HauchDerPestilenz_Stufe02 = 129;
		HauchDerPestilenz_Stufe03 = 583;
	} else if (Krankheit == 3) {
		HauchDerPestilenz_Stufe01 = 87;
		HauchDerPestilenz_Stufe02 = 116;
		HauchDerPestilenz_Stufe03 = 524;
	} else if (Krankheit == 4) {
		HauchDerPestilenz_Stufe01 = 78;
		HauchDerPestilenz_Stufe02 = 104;
		HauchDerPestilenz_Stufe03 = 472;
	};

	// Mali festlegen und die Start-Mali gleich abziehen

	if (KHDP == 0) {
		B_SetHauchDerPestilenzWerte (20, 15, 10, 10, 50, 30, 20, 20, 120, 60, 40, 40);
	} else if (KHDP == 1) {
		B_SetHauchDerPestilenzWerte (16, 12, 8, 8, 40, 24, 16, 16, 96, 48, 32, 32);
	} else if (KHDP == 2) {
		B_SetHauchDerPestilenzWerte (13, 10, 6, 6, 32, 19, 13, 13, 77, 38, 26, 26);
	} else if (KHDP == 3) {
		B_SetHauchDerPestilenzWerte (10, 8, 5, 5, 26, 15, 10, 10, 61, 31, 20, 20);
	} else if (KHDP == 4) {
		B_SetHauchDerPestilenzWerte (8, 6, 4, 4, 20, 12, 8, 8, 49, 25, 16, 16);
	};

	HauchDerPestilenz_Time = 1;
};
