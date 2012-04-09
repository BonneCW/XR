FUNC VOID ENTER_EVT_ORKTEMPEL_ERDBEBEN01 ()
{
	Wld_PlayEffect	("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE);
	Snd_Play	("Ravens_Earthquake4");

	Wld_SendTrigger	("PFX_ERDBEBEN_01");
	Wld_SendTrigger	("PFX_ERDBEBEN_02");
	Wld_SendTrigger	("PFX_ERDBEBEN_03");
	Wld_SendTrigger	("PFX_ERDBEBEN_04");
	Wld_SendTrigger	("PFX_ERDBEBEN_05");
	Wld_SendTrigger	("PFX_ERDBEBEN_06");
};

FUNC VOID ENTER_EVT_ORKTEMPEL_ERDBEBEN02 ()
{
	Wld_PlayEffect	("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE);
	Snd_Play	("Ravens_Earthquake4");

	Wld_SendTrigger	("PFX_ERDBEBEN_07");
};

FUNC VOID ENTER_EVT_ORKTEMPEL_ERDBEBEN03 ()
{
	Wld_PlayEffect	("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE);
	Snd_Play	("Ravens_Earthquake4");

	Wld_SendTrigger	("PFX_ERDBEBEN_08");
};

FUNC VOID ENTER_EVT_ORKTEMPEL_ERDBEBEN04 ()
{
	Wld_PlayEffect	("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE);
	Snd_Play	("Ravens_Earthquake4");

	Wld_SendTrigger	("PFX_ERDBEBEN_09");
	Wld_SendTrigger	("PFX_ERDBEBEN_10");
};

FUNC VOID ENTER_EVT_ORKTEMPEL_ERDBEBEN05 ()
{
	Wld_PlayEffect	("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE);
	Snd_Play	("Ravens_Earthquake4");

	Wld_SendTrigger	("PFX_ERDBEBEN_11");
};

FUNC VOID ENTER_EVT_ORKTEMPEL_ERDBEBEN06 ()
{
	Wld_PlayEffect	("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE);
	Snd_Play	("Ravens_Earthquake4");

	Wld_SendTrigger	("PFX_ERDBEBEN_13");
};

FUNC VOID ENTER_EVT_ORKTEMPEL_ERDBEBEN07 ()
{
	Wld_PlayEffect	("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE);
	Snd_Play	("Ravens_Earthquake4");

	Wld_SendTrigger	("PFX_ERDBEBEN_14");
};

FUNC VOID ENTER_EVT_ORKTEMPEL_STOSSZAHN ()
{
	Wld_PlayEffect("FX_EarthQuake", hero, hero, 0, 0, 0, FALSE);
	Snd_Play 	("Ravens_Earthquake4");
	Wld_SendTrigger	("STOSSZAHNTRIGGER");

	Wld_SendTrigger	("PFX_ERDBEBEN_20");
};

FUNC VOID ENTER_EVT_ORKTEMPEL_LEUCHTERAMENDE ()
{
	Wld_PlayEffect	("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE);
	Snd_Play	("Ravens_Earthquake4");
	Wld_SendTrigger	("LEUCHTERAMENDE");

	Wld_SendTrigger	("PFX_ERDBEBEN_15");
	Wld_SendTrigger	("PFX_ERDBEBEN_16");
};

FUNC VOID ENTER_EVT_ORKTEMPEL_WANDTEIL ()
{
	Wld_PlayEffect	("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE);
	Snd_Play	("Ravens_Earthquake4");
	Wld_SendTrigger	("WANDTEIL");

	Wld_SendTrigger	("PFX_ERDBEBEN_12");
};

FUNC VOID ENTER_EVT_ORKTEMPEL_BODENPLATTE ()
{
	Wld_PlayEffect	("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE);
	Snd_Play	("Ravens_Earthquake4");
	Wld_SendTrigger	("BODENPLATTE");
	Wld_SendTrigger	("BODENPLATTEFEUER");

	Wld_SendTrigger	("PFX_ERDBEBEN_17");
};

FUNC VOID ENTER_EVT_ORKTEMPEL_BODENPALTTEVORNE ()
{
	Wld_PlayEffect	("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE);
	Snd_Play	("Ravens_Earthquake4");
	Wld_SendTrigger	("EINGANGBODENPALTTE");

	Wld_SendTrigger	("PFX_ERDBEBEN_18");
};

FUNC VOID ENTER_EVT_ORKTEMPEL_DECKEVESTECK ()
{
	Wld_PlayEffect	("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE);
	Snd_Play	("Ravens_Earthquake4");
	Wld_SendTrigger	("DECKEINDERHALLEVORNE");
	Wld_SendTrigger	("LAVAFOGVORNE");
	Wld_SendTrigger	("STANDLAMPEMOVER");

	Wld_SendTrigger	("PFX_ERDBEBEN_19");
};