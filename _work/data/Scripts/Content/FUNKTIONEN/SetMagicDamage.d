FUNC VOID SetMagicDamage()
{
	// Innoszauber

	if (Mod_Gottstatus == 9)
	{
		// Schaden + 100%

		SPL_Damage_ChargeFireball = 150+Mod_GottInnos;
		SPL_Damage_Firebolt = 50+Mod_GottInnos;
		SPL_Damage_InstantFireStorm = 200+Mod_GottInnos;
		SPL_Damage_FireRain = 1000+Mod_GottInnos;
		SPL_Damage_InstantFireball = 150+Mod_GottInnos;
		SPL_PYROKINESIS_DAMAGE_PER_SEC = 100+Mod_GottInnos;
		SPL_Damage_PalRepelEvil = 600+Mod_GottInnos;
		SPL_Damage_FireStorm = 150+Mod_GottInnos;
		SPL_Damage_PalHolyBolt = 200+Mod_GottInnos;
		SPL_Damage_PalDestroyEvil = 1200+Mod_GottInnos;
	}
	else if (Mod_Gottstatus == 10)
	{
		// Schaden + 50%

		SPL_Damage_ChargeFireball = 112+Mod_GottInnos;
		SPL_Damage_Firebolt = 37+Mod_GottInnos;
		SPL_Damage_InstantFireStorm = 150+Mod_GottInnos;
		SPL_Damage_FireRain = 750+Mod_GottInnos;
		SPL_Damage_InstantFireball = 112+Mod_GottInnos;
		SPL_PYROKINESIS_DAMAGE_PER_SEC = 75+Mod_GottInnos;
		SPL_Damage_PalRepelEvil = 450+Mod_GottInnos;
		SPL_Damage_FireStorm = 112+Mod_GottInnos;
		SPL_Damage_PalHolyBolt = 150+Mod_GottInnos;
		SPL_Damage_PalDestroyEvil = 900+Mod_GottInnos;
	}
	else if (Mod_Gottstatus == 11)
	{
		// Schaden + 25%

		SPL_Damage_ChargeFireball = 93+Mod_GottInnos;
		SPL_Damage_Firebolt = 31+Mod_GottInnos;
		SPL_Damage_InstantFireStorm = 125+Mod_GottInnos;
		SPL_Damage_FireRain = 625+Mod_GottInnos;
		SPL_Damage_InstantFireball = 93+Mod_GottInnos;
		SPL_PYROKINESIS_DAMAGE_PER_SEC = 62+Mod_GottInnos;
		SPL_Damage_PalRepelEvil = 375+Mod_GottInnos;
		SPL_Damage_FireStorm = 93+Mod_GottInnos;
		SPL_Damage_PalHolyBolt = 125+Mod_GottInnos;
		SPL_Damage_PalDestroyEvil = 750+Mod_GottInnos;
	}
	else if (Mod_Gottstatus == 12)
	{
		// Schaden + 10%

		SPL_Damage_ChargeFireball = 82+Mod_GottInnos;
		SPL_Damage_Firebolt = 27+Mod_GottInnos;
		SPL_Damage_InstantFireStorm = 110+Mod_GottInnos;
		SPL_Damage_FireRain = 550+Mod_GottInnos;
		SPL_Damage_InstantFireball = 82+Mod_GottInnos;
		SPL_PYROKINESIS_DAMAGE_PER_SEC = 55+Mod_GottInnos;
		SPL_Damage_PalRepelEvil = 330+Mod_GottInnos;
		SPL_Damage_FireStorm = 82+Mod_GottInnos;
		SPL_Damage_PalHolyBolt = 110+Mod_GottInnos;
		SPL_Damage_PalDestroyEvil = 660+Mod_GottInnos;
	}
	else
	{
		SPL_Damage_ChargeFireball = 75+Mod_GottInnos;
		SPL_Damage_Firebolt = 25+Mod_GottInnos;
		SPL_Damage_InstantFireStorm = 100+Mod_GottInnos;
		SPL_Damage_FireRain = 500+Mod_GottInnos;
		SPL_Damage_InstantFireball = 75+Mod_GottInnos;
		SPL_PYROKINESIS_DAMAGE_PER_SEC = 50+Mod_GottInnos;
		SPL_Damage_PalRepelEvil = 300+Mod_GottInnos;
		SPL_Damage_FireStorm = 75+Mod_GottInnos;
		SPL_Damage_PalHolyBolt = 100+Mod_GottInnos;
		SPL_Damage_PalDestroyEvil = 600+Mod_GottInnos;
	};

	// Beliarzauber

	if (Mod_Gottstatus == 1)
	{
		// Schaden + 100%

		SPL_DAMAGE_BreathOfDeath = 1332;
		SPL_Damage_EnergyBall = 400;
		SPL_Damage_MasterOfDisaster = 600;
		SPL_Damage_MassDeath = 1000;
		SPL_Damage_Skull = 1332;
		SPL_SuckEnergy_Damage = 100;
	}
	else if (Mod_Gottstatus == 2)
	{
		// Schaden + 50%

		SPL_DAMAGE_BreathOfDeath = 999;
		SPL_Damage_EnergyBall = 300;
		SPL_Damage_MasterOfDisaster = 450;
		SPL_Damage_MassDeath = 750;
		SPL_Damage_Skull = 999;
		SPL_SuckEnergy_Damage = 75;
	}
	else if (Mod_Gottstatus == 3)
	{
		// Schaden + 25%

		SPL_DAMAGE_BreathOfDeath = 832;
		SPL_Damage_EnergyBall = 250;
		SPL_Damage_MasterOfDisaster = 375;
		SPL_Damage_MassDeath = 625;
		SPL_Damage_Skull = 832;
		SPL_SuckEnergy_Damage = 62;
	}
	else if (Mod_Gottstatus == 4)
	{
		// Schaden + 10%

		SPL_DAMAGE_BreathOfDeath = 732;
		SPL_Damage_EnergyBall = 220;
		SPL_Damage_MasterOfDisaster = 330;
		SPL_Damage_MassDeath = 550;
		SPL_Damage_Skull = 732;
		SPL_SuckEnergy_Damage = 55;
	}
	else
	{
		SPL_DAMAGE_BreathOfDeath = 666;
		SPL_Damage_EnergyBall = 200;
		SPL_Damage_MasterOfDisaster = 300;
		SPL_Damage_MassDeath = 500;
		SPL_Damage_Skull = 666;
		SPL_SuckEnergy_Damage = 50;
	};

	// Adanoszauber

	if (Mod_Gottstatus == 5)
	{
		// Schaden + 100%

		SPL_Damage_ChargeZap = 60;
		SPL_Damage_Geyser = 300;
		SPL_Damage_IceRain = 800;
		SPL_Damage_IceBolt = 60;
		SPL_Damage_Icelance = 200;
		SPL_Damage_LightningFlash = 300;
		SPL_Damage_InstantIceball = 150;
		SPL_Damage_Waterfist = 250;
		SPL_Damage_Zap = 60;
		SPL_Damage_Thunderstorm = 400;
	}
	else if (Mod_Gottstatus == 6)
	{
		// Schaden + 50%

		SPL_Damage_ChargeZap = 45;
		SPL_Damage_Geyser = 225;
		SPL_Damage_IceRain = 600;
		SPL_Damage_IceBolt = 45;
		SPL_Damage_Icelance = 150;
		SPL_Damage_LightningFlash = 225;
		SPL_Damage_InstantIceball = 112;
		SPL_Damage_Waterfist = 187;
		SPL_Damage_Zap = 45;
		SPL_Damage_Thunderstorm = 300;
	}
	else if (Mod_Gottstatus == 7)
	{
		// Schaden + 25%

		SPL_Damage_ChargeZap = 37;
		SPL_Damage_Geyser = 187;
		SPL_Damage_IceRain = 500;
		SPL_Damage_IceBolt = 37;
		SPL_Damage_Icelance = 125;
		SPL_Damage_LightningFlash = 187;
		SPL_Damage_InstantIceball = 93;
		SPL_Damage_Waterfist = 156;
		SPL_Damage_Zap = 37;
		SPL_Damage_Thunderstorm = 250;
	}
	else if (Mod_Gottstatus == 8)
	{
		// Schaden + 10%

		SPL_Damage_ChargeZap = 33;
		SPL_Damage_Geyser = 165;
		SPL_Damage_IceRain = 440;
		SPL_Damage_IceBolt = 33;
		SPL_Damage_Icelance = 110;
		SPL_Damage_LightningFlash = 165;
		SPL_Damage_InstantIceball = 82;
		SPL_Damage_Waterfist = 137;
		SPL_Damage_Zap = 33;
		SPL_Damage_Thunderstorm = 220;
	}
	else
	{
		SPL_Damage_ChargeZap = 30;
		SPL_Damage_Geyser = 150;
		SPL_Damage_IceRain = 400;
		SPL_Damage_IceBolt = 30;
		SPL_Damage_Icelance = 100;
		SPL_Damage_LightningFlash = 150;
		SPL_Damage_InstantIceball = 75;
		SPL_Damage_Waterfist = 125;
		SPL_Damage_Zap = 30;
		SPL_Damage_Thunderstorm = 200;
	};
};