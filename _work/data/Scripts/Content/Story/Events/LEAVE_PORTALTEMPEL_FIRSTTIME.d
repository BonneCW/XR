func void LEAVE_PORTALTEMPEL_FIRSTTIME_S1 ()
{
	if (LEAVE_PORTALTEMPEL_FIRSTTIME_ONETIME == FALSE)
	{
		Wld_InsertNpc	(Mod_9000_KDW_Saturas_AW,	"ADW_PORTALTEMPEL_11");
		Wld_InsertNpc	(Mod_9001_KDW_Cronos_AW,	"ADW_PORTALTEMPEL_11");
		Wld_InsertNpc	(Mod_9002_KDW_Nefarius_AW,	"ADW_PORTALTEMPEL_11");
		Wld_InsertNpc	(Mod_9003_KDW_Riordian_AW,	"ADW_PORTALTEMPEL_11");
		Wld_InsertNpc	(Mod_9004_KDW_Merdarion_AW,	"ADW_PORTALTEMPEL_11");
		Wld_InsertNpc	(PC_Friend_AW,	"ADW_PORTALTEMPEL_11");

		Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);
			
		//Wld_PlayEffect	("MFX_SLEEP_TARGET", hero, hero, 0, 0, 0, FALSE);
		//AI_PlayAni 	(hero,	"T_VICTIM_SLE_2_STAND");
			
		PrintScreen ("Einige Stunden später", -1, YPOS_LevelUp, FONT_Screen, 2);			

		Wld_SetTime	(24,00);

		AI_Teleport	(hero, "ADW_ENTRANCE_BUILDING2_05");

		LEAVE_PORTALTEMPEL_FIRSTTIME_ONETIME = TRUE;
	};
};