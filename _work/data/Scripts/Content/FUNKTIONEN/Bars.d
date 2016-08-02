/*===================================================================
ShowBars
setzt die Bars an ihre gewohnte Position
HideBars
schiebt die Bars aus dem Bildschirm

Nach jedem Aufruf des Menüs ([Esc]) und Ähnlichem sind die Bars wieder
an ihrer alten Position, deshalb sollten die Funktion oft aufgerufen
werden, zum Beispiel in jedem Frame
==================================================================*/

func void ShowBars () {
	// ----- ursprüngliche Positionen -----
	
	var int focus_vposx;
	var int focus_vposy;

	focus_vposx = 3376;
	focus_vposy = 107;

	// ----- an die Bars rankommen -----
	MEM_InitGlobalInst ();
	var oCViewStatusBar bar_hp; bar_hp = MEM_PtrToInst (MEM_GAME.hpBar);
	var oCViewStatusBar bar_mana; bar_mana = MEM_PtrToInst (MEM_GAME.manaBar);
	var oCViewStatusBar bar_swim; bar_swim = MEM_PtrToInst (MEM_GAME.swimBar);
	var oCViewStatusBar bar_focus; bar_focus = MEM_PtrToInst (MEM_GAME.focusBar);

	// ----- Bars an die alte Position -----
	if (Mod_Balken == 0)
	|| (Mod_Balken == 1)
	|| ((Mod_Balken == 2)
	&& (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])) {
		bar_hp.zCView_vposx = 80;
		bar_hp.zCView_vposy = 7872;
	} else if ((Mod_Balken == 2)
	&& (hero.attribute[ATR_HITPOINTS] == hero.attribute[ATR_HITPOINTS_MAX])) {
		bar_hp.zCView_vposx = 8200;
		bar_hp.zCView_vposy = 8200;
	};

	if (Mod_Balken == 0) {
		bar_mana.zCView_vposx = 6246;
		bar_mana.zCView_vposy = 7872;
	} else if (Mod_Balken == 1)
	|| ((Mod_Balken == 2)
	&& (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])) {
		bar_mana.zCView_vposx = 80;
		bar_mana.zCView_vposy = 7572;
	} else if ((Mod_Balken == 2)
	&& (hero.attribute[ATR_HITPOINTS] == hero.attribute[ATR_HITPOINTS_MAX])) {
		bar_mana.zCView_vposx = 8200;
		bar_mana.zCView_vposy = 8200;
	};

	if (Mod_Balken == 0) {
		bar_swim.zCView_vposx = 3376;
		bar_swim.zCView_vposy = 7872;
	} else if (Mod_Balken == 1)
	|| (Mod_Balken == 2) {
		bar_swim.zCView_vposx = 80;
		bar_swim.zCView_vposy = 7272;
	};
	
	bar_focus.zCView_vposx = focus_vposx;
	bar_focus.zCView_vposy = focus_vposy;

	Npc_GetTarget(hero);

	if (Hlp_IsValidNpc(other)) {
		if (other.aivar[AIV_Pflanzengift] > 0)
		|| (other.aivar[AIV_Tiergift] > 0)
		{
			ViewPtr_SetTexture(bar_focus.value_bar, "BAR_POISON.TGA");
		} else {
			ViewPtr_SetTexture(bar_focus.value_bar, "BAR_HEALTH.TGA");
		};
	};

	if (GGPf_Sumpfgolem_Time > 0)
	|| (GGPi_Orkschamane_Time > 0)
	|| (GGPf_Echsenmensch_Time > 0)
	|| (GGPi_OrkkriegerArmbrust_Time > 0)
	|| (GGPi_Fliegenpilz_Time > 0)
	|| (GGPf_Echsenschwert_Time > 0)
	|| (GGPf_Assassinenschwert_Time > 0)
	|| (GGPi_Schamanenaxt_Time > 0)
	|| (GTB_Blutfliege_Time > 0)
	|| (GTS_Sumpfgasdrohne_Time > 0)
	|| (GTM_Minecrawler_Time > 0)
	|| (GTM_MinecrawlerWarrior_Time > 0)
	|| (GTSu_Sumpfhai_Time > 0)
	|| (GTS_Echsenschwert_Time > 0)
	|| (GTB_Assassinenschwert_Time > 0)
	|| (GTM_Schamanenaxt_Time > 0)
	|| (GGD_Sumpfgasdrohne_Time > 0)
	|| (GGD_Sumpfgolem_Time > 0)
	|| (GGD_Sumpfdrache_Time > 0)
	|| (GGD_Giftkrater_Time > 0) {
		ViewPtr_SetTexture(bar_hp.value_bar, "BAR_POISON.TGA");
	} else if (BissDerFaeulnis_Time > 0)
	|| (HauchDerPestilenz_Time > 0) {
		ViewPtr_SetTexture(bar_hp.value_bar, "BAR_KRANK.TGA");
	} else {
		ViewPtr_SetTexture(bar_hp.value_bar, "BAR_HEALTH.TGA");
	};
};

func void HideBars () {
	// ----- an die Bars rankommen -----
	MEM_InitGlobalInst ();
	var oCViewStatusBar bar_hp; bar_hp = MEM_PtrToInst (MEM_GAME.hpBar);
	var oCViewStatusBar bar_mana; bar_mana = MEM_PtrToInst (MEM_GAME.manaBar);
	var oCViewStatusBar bar_swim; bar_swim = MEM_PtrToInst (MEM_GAME.swimBar);
	var oCViewStatusBar bar_focus; bar_focus = MEM_PtrToInst (MEM_GAME.focusBar);

	// ----- Bars aus dem sichtbaren Bereich schieben -----
	bar_hp.zCView_vposx = 8200;
	bar_hp.zCView_vposy = 8200;
	
	bar_mana.zCView_vposx = 8200;
	bar_mana.zCView_vposy = 8200;
	
	bar_swim.zCView_vposx = 8200;
	bar_swim.zCView_vposy = 8200;
	
	bar_focus.zCView_vposx = 8200;
	bar_focus.zCView_vposy = 8200;
};