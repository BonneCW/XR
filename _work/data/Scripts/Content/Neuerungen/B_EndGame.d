FUNC VOID B_EndGame() {
	if (hero.guild == GIL_PAL) {
		Spine_OverallSaveSetInt("PaladinEnde", 1);
	} else if (hero.guild == GIL_KDF) {
		Spine_OverallSaveSetInt("BeliarEnde", 1);
	} else if (hero.guild == GIL_MIL) {
		Spine_OverallSaveSetInt("MerchantEnde", 1);
	} else if (hero.guild == GIL_VLK) {
		Spine_OverallSaveSetInt("InnosEnde", 1);
	} else if (hero.guild == GIL_NOV) {
		Spine_OverallSaveSetInt("AdanosEnde", 1);
	};
	
	var int amount; amount = 0;
	amount += Spine_OverallSaveGetInt("PaladinEnde");
	amount += Spine_OverallSaveGetInt("MerchantEnde");
	amount += Spine_OverallSaveGetInt("InnosEnde");
	amount += Spine_OverallSaveGetInt("AdanosEnde");
	amount += Spine_OverallSaveGetInt("BeliarEnde");
	
	Spine_UpdateAchievementProgress(SPINE_ACHIEVEMENT_56, amount);
		
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_7);
	
	if (SomeUnimportantRandomValue == 1) {
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_72);
	} else if (SomeUnimportantRandomValue == 2) {
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_72);
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_73);
	} else if (SomeUnimportantRandomValue == 3) {
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_72);
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_73);
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_74);
	};
	
	PlayVideo("Xeres\Credits.bik");

	ExitSession();
};