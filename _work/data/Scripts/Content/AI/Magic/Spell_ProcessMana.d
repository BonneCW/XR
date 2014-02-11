// ******************************************************************************
// Spell_ProcessMana
// -----------------
// wird pro investiertem Mana aufgerufen 
// wieviele Mana bisher investiert wurden kann über manaInvested abgefragt werden
// diese Methode wird immer vom Caster aufgerufen
// self 	= Der Caster
// other 	= Das Opfer (kann auch leer sein)
// ******************************************************************************

func INT Spell_ProcessMana (VAR INT manaInvested)
{
	var int activeSpell; activeSpell = Npc_GetActiveSpell(self);
	//Mod-Zauber
	if (activeSpell == SPL_Altern)	{return	Spell_Logic_Altern(manaInvested);};
	if (activeSpell == SPL_Teleport4)	{return Spell_Logic_Teleport4(manaInvested);	};
	if (activeSpell == SPL_Teleport5)	{return Spell_Logic_Teleport5(manaInvested);	};
	if (activeSpell == SPL_TeleportSektis)	{return Spell_Logic_TeleportSektis(manaInvested);	};
	if (activeSpell == SPL_TeleportPatBack)	{return Spell_Logic_TeleportPatBack(manaInvested);	};
	if (activeSpell == SPL_TeleportOT)	{return Spell_Logic_TeleportOT(manaInvested);	};
	if (activeSpell == SPL_TeleportEisSH)	{return Spell_Logic_TeleportEisSH(manaInvested);	};
	
	//Paladin-Runen
	if (activeSpell == SPL_PalLight				)	{	return  Spell_Logic_PalLight			(manaInvested); };
	if (activeSpell == SPL_BeliarCity				)	{	return  Spell_Logic_BeliarCity			(manaInvested); };
	if (activeSpell == SPL_PalLightHeal			)	{	return  Spell_Logic_PalLightHeal		(manaInvested); };
	if (activeSpell == SPL_PalHolyBolt			)	{	return  Spell_Logic_PalHolyBolt			(manaInvested); };
	if (activeSpell == SPL_PalMediumHeal		)	{	return  Spell_Logic_PalMediumHeal		(manaInvested); };
	if (activeSpell == SPL_PalRepelEvil			)	{	return  Spell_Logic_PalRepelEvil		(manaInvested); };
	if (activeSpell == SPL_PalFullHeal			)	{	return  Spell_Logic_PalFullHeal			(manaInvested); };
	if (activeSpell == SPL_PalDestroyEvil		)	{	return  Spell_Logic_PalDestroyEvil		(manaInvested); };
	//Teleport-Runen
	if (activeSpell == SPL_PalTeleportSecret	)	{	return  Spell_Logic_PalTeleportSecret	(manaInvested); };
	if (activeSpell == SPL_TeleportSeaport		)	{	return  Spell_Logic_TeleportSeaport		(manaInvested); };
	if (activeSpell == SPL_TeleportMonastery	)	{	return  Spell_Logic_TeleportMonastery	(manaInvested); };
	if (activeSpell == SPL_TeleportFarm			)	{	return  Spell_Logic_TeleportFarm		(manaInvested); };
	if (activeSpell == SPL_TeleportXardas		)	{	return  Spell_Logic_TeleportXardas		(manaInvested); };
	if (activeSpell == SPL_TeleportPassNW		)	{	return  Spell_Logic_TeleportPassNW		(manaInvested); };
	if (activeSpell == SPL_TeleportPassOW		)	{	return  Spell_Logic_TeleportPassOW		(manaInvested); };
	if (activeSpell == SPL_TeleportOC			)	{	return  Spell_Logic_TeleportOC			(manaInvested); };
	if (activeSpell == SPL_TeleportOWDemonTower)	{	return  Spell_Logic_TeleportOWDemonTower(manaInvested); };
	if (activeSpell == SPL_TeleportTaverne		)	{	return  Spell_Logic_TeleportTaverne		(manaInvested); };
	if (activeSpell == SPL_TeleportDemonTower		)	{	return  Spell_Logic_TeleportDemonTower		(manaInvested); };
	if (activeSpell == SPL_TeleportPsicamp			)	{	return  Spell_Logic_TeleportPsicamp			(manaInvested); };
	if (activeSpell == SPL_Teleport_Pat			)	{	return  Spell_Logic_Teleport_Pat			(manaInvested); };
	if (activeSpell == SPL_TeleportOldcamp)	{	return  Spell_Logic_TeleportOldcamp(manaInvested); };
	if (activeSpell == SPL_TeleportNewcamp		)	{	return  Spell_Logic_TeleportNewcamp		(manaInvested); };
	if (activeSpell == SPL_Teleport_Pat_01			)	{	return  Spell_Logic_Teleport_Pat_01			(manaInvested); };
	if (activeSpell == SPL_TeleportBergwelt			)	{	return  Spell_Logic_TeleportBergwelt			(manaInvested); };
	if (activeSpell == SPL_Teleport_Pat_02			)	{	return  Spell_Logic_Teleport_Pat_02			(manaInvested); };
	if (activeSpell == SPL_TeleportVorAL			)	{	return  Spell_Logic_TeleportVorAL			(manaInvested); };
	if (activeSpell == SPL_TeleportXD			)	{	return  Spell_Logic_TeleportXD			(manaInvested); };
	if (activeSpell == SPL_Teleport_Eisgebiet			)	{	return  Spell_Logic_Teleport_Eisgebiet			(manaInvested); };
	if (activeSpell == SPL_TeleportBanditenlager			)	{	return  Spell_Logic_Teleport_Banditenlager			(manaInvested); };
	if (activeSpell == SPL_TeleportGelato			)	{	return  Spell_Logic_Teleport_Gelato			(manaInvested); };
	if (activeSpell == SPL_TeleportUW			)	{	return  Spell_Logic_Teleport_UW			(manaInvested); };
	//Runen und Scrolls
	//Kreis 1
	if (activeSpell == SPL_LIGHT				)	{	return  Spell_Logic_Light				(manaInvested); };
	if (activeSpell == SPL_Sprint				)	{	return  Spell_Logic_Sprint				(manaInvested); };
	if (activeSpell == SPL_ManaEntzug				)	{	return  Spell_Logic_ManaEntzug				(manaInvested); };
	if (activeSpell == SPL_Firebolt				)	{	return	Spell_Logic_Firebolt			(manaInvested);	};
	if (activeSpell == SPL_Geisterspell				)	{	return	Spell_Logic_Geisterspell				(manaInvested);	};
	if (activeSpell == SPL_Icebolt				)	{	return	Spell_Logic_Icebolt				(manaInvested);	};
	if (activeSpell == SPL_Zap					)	{	return	Spell_Logic_Zap					(manaInvested);	};
	if (activeSpell == SPL_LightHeal			)	{	return	Spell_Logic_LightHeal			(manaInvested);	};
	if (activeSpell == SPL_SummonGoblinSkeleton)	{	return	Spell_Logic_SummonGoblinSkeleton(manaInvested);	};
	if (activeSpell == SPL_SummonDragon)	{	return	Spell_Logic_SummonDragon(manaInvested);	};
	if (activeSpell == SPL_SummonEisgoblin)	{	return	Spell_Logic_SummonEisgoblin(manaInvested);	};
	if (activeSpell == SPL_SummonGoblinKrieger)	{	return	Spell_Logic_SummonGoblinKrieger(manaInvested);	};
	if (activeSpell == SPL_SummonUDSwampshark)	{	return	Spell_Logic_SummonUDSwampshark(manaInvested);	};
	if (activeSpell == SPL_SummonGeist)	{	return	Spell_Logic_SummonGeist(manaInvested);	};
	//Kreis 2
	if (activeSpell == SPL_InstantFireball		)	{	return	Spell_Logic_InstantFireball	(manaInvested);	};
	if (activeSpell == SPL_InstantIceball		)	{	return	Spell_Logic_InstantIceball	(manaInvested);	};
	if (activeSpell == SPL_SummonWolf			)	{	return	Spell_Logic_SummonWolf		(manaInvested);	};
	if (activeSpell == SPL_WINDFIST				)	{	return	Spell_Logic_Windfist		(manaInvested);	};
	if (activeSpell == SPL_GolemWINDFIST				)	{	return	Spell_Logic_GolemWindfist		(manaInvested);	};
	if (activeSpell == SPL_GolemGeyser				)	{	return	Spell_Logic_GolemGeyser		(manaInvested);	};
	if (activeSpell == SPL_Sleep				)	{	return	Spell_Logic_Sleep			(manaInvested);	};
	//Kreis 3
	if (activeSpell == SPL_MediumHeal			)	{	return	Spell_Logic_MediumHeal		(manaInvested);	};
	if (activeSpell == SPL_LightningFlash		) 	{	return	Spell_Logic_LightningFlash	(manaInvested);	};
	if (activeSpell == SPL_ChargeFireball	    ) 	{	return	Spell_Logic_ChargeFireball	(manaInvested);	};
	if (activeSpell == SPL_GolemChargeFireball	    ) 	{	return	Spell_Logic_GolemChargeFireball	(manaInvested);	};
	if (activeSpell == SPL_ChargeZap		    ) 	{	return	Spell_Logic_ChargeZap		(manaInvested);	};
	if (activeSpell == SPL_SummonSkeleton	    ) 	{	return	Spell_Logic_SummonSkeleton	(manaInvested);	};
	if (activeSpell == SPL_Fear	    			) 	{	return	Spell_Logic_Fear			(manaInvested);	};
	if (activeSpell == SPL_IceCube	    		) 	{	return	Spell_Logic_IceCube			(manaInvested);	};
	if (activeSpell == SPL_GolemIceCube	    		) 	{	return	Spell_Logic_GolemIceCube			(manaInvested);	};
	//Kreis 4
	if (activeSpell == SPL_ChargeZap	    	) 	{	return	Spell_Logic_ChargeZap		(manaInvested);	};
	if (activeSpell == SPL_SummonGolem   		) 	{	return	Spell_Logic_SummonGolem		(manaInvested);	};
	if (activeSpell == SPL_SummonFireGolem   		) 	{	return	Spell_Logic_SummonFireGolem		(manaInvested);	};
	if (activeSpell == SPL_SummonIceGolem   		) 	{	return	Spell_Logic_SummonIceGolem		(manaInvested);	};
	if (activeSpell == SPL_DestroyUndead 		)	{	return	Spell_Logic_DestroyUndead	(manaInvested);	};
	if (activeSpell == SPL_Pyrokinesis	    	) 	{	return	Spell_Logic_Pyrokinesis		(manaInvested);	};
	if (activeSpell == SPL_Pyrokinesis_g1	    	) 	{	return	Spell_Logic_Pyrokinesis_g1		(manaInvested);	};
	//Kreis 5
	if (activeSpell == SPL_Firestorm       		) 	{	return	Spell_Logic_Firestorm		(manaInvested);	};
	if (activeSpell == SPL_IceWave        		) 	{	return	Spell_Logic_IceWave			(manaInvested);	};
	if (activeSpell == SPL_SummonDemon			)	{	return	Spell_Logic_SummonDemon		(manaInvested);	};
	if (activeSpell == SPL_FullHeal				)	{	return	Spell_Logic_FullHeal		(manaInvested);	};
	//Kreis 6
	if (activeSpell == SPL_Firerain				)	{	return	Spell_Logic_Firerain		(manaInvested);	};
	if (activeSpell == SPL_Icerain				)	{	return	Spell_Logic_Icerain		(manaInvested);	};
	if (activeSpell == SPL_BreathOfDeath		)	{	return	Spell_Logic_BreathOfDeath	(manaInvested);	};
	if (activeSpell == SPL_MassDeath			)	{	return	Spell_Logic_MassDeath		(manaInvested);	};
	if (activeSpell == SPL_Deathwave			)	{	return	Spell_Logic_Deathwave		(manaInvested);	};
	if (activeSpell == SPL_EarthquakeNew				)	{	return	Spell_Logic_EarthquakeNew		(manaInvested);	};
	if (activeSpell == SPL_ArmyOfDarkness		)	{	return	Spell_Logic_ArmyOfDarkness	(manaInvested);	};
	if (activeSpell == SPL_Shrink				)	{	return	Spell_Logic_Shrink			(manaInvested);	};
	//Scrolls
	if (activeSpell == SPL_TrfMeatbug	    		)	{	return	Spell_Logic_TrfMeatbug 		(manaInvested);	};
	if (activeSpell == SPL_TrfOrk			)	{	return	Spell_Logic_TrfOrk 	(manaInvested);	};
	if (activeSpell == SPL_TrfShadowbeast			)	{	return	Spell_Logic_TrfShadowbeast		(manaInvested);	};
	if (activeSpell == SPL_TrfSnapper			)	{	return	Spell_Logic_TrfSnapper		(manaInvested);	};
	if (activeSpell == SPL_TrfWarg				)	{	return	Spell_Logic_TrfWarg			(manaInvested);	};
	if (activeSpell == SPL_TrfBlackTroll				)	{	return	Spell_Logic_TrfBlackTroll		(manaInvested);	};
	if (activeSpell == SPL_TrfGolem			)	{	return	Spell_Logic_TrfGolem		(manaInvested);	};
	if (activeSpell == SPL_TrfBloodfly				)	{	return	Spell_Logic_TrfBloodfly			(manaInvested);	};
	if (activeSpell == SPL_TrfBloodhound			)	{	return	Spell_Logic_TrfBloodhound	(manaInvested);	};
	if (activeSpell == SPL_TrfKeiler			)	{	return	Spell_Logic_TrfKeiler		(manaInvested);	};
	if (activeSpell == SPL_TrfSheep		)	{	return	Spell_Logic_TrfSheep	(manaInvested);	};
	if (activeSpell == SPL_TrfSkeleton		)	{	return	Spell_Logic_TrfSkeleton(manaInvested);	};
	if (activeSpell == SPL_TrfSkeleton2		)	{	return	Spell_Logic_TrfSkeleton2(manaInvested);	};
	if (activeSpell == SPL_Charm				)	{	return	Spell_Logic_Charm			(manaInvested);	};
	if (activeSpell == SPL_MasterOfDisaster		)	{	return	Spell_Logic_MasterOfDisaster(manaInvested);	};
	
	if (activeSpell == SPL_ConcussionBolt		)	{	return	Spell_Logic_ConcussionBolt	(manaInvested);	};
	if (activeSpell == SPL_Deathbolt			)	{	return	Spell_Logic_Deathbolt		(manaInvested);	};
	if (activeSpell == SPL_Deathball			)	{	return	Spell_Logic_Deathball		(manaInvested);	};
	
	//water
	if (activeSpell == SPL_Thunderstorm			)	{	return	Spell_Logic_Thunderstorm	(manaInvested);	};
	if (activeSpell == SPL_Waterfist			)	{	return	Spell_Logic_Waterfist		(manaInvested);	};
	if (activeSpell == SPL_Whirlwind			)	{	return	Spell_Logic_Whirlwind		(manaInvested);	};
	if (activeSpell == SPL_Geyser				) 	{	return	Spell_Logic_Geyser			(manaInvested);	};
	if (activeSpell == SPL_Inflate				) 	{	return	Spell_Logic_Inflate			(manaInvested);	};
	if (activeSpell == SPL_Icelance				) 	{	return	Spell_Logic_Icelance		(manaInvested);	};
	if (activeSpell == SPL_Firelance				) 	{	return	Spell_Logic_Firelance		(manaInvested);	};
	
	//beliar magic
	if (activeSpell == SPL_Zerfleischen				) 	{	return	Spell_Logic_Zerfleischen			(manaInvested);	};
	if (activeSpell == SPL_Swarm				)	{	return	Spell_Logic_Swarm			(manaInvested);	};
	if (activeSpell == SPL_Greententacle		)	{	return	Spell_Logic_Greententacle	(manaInvested);	};
	if (activeSpell == SPL_Laehmen		)	{	return	Spell_Logic_Laehmen	(manaInvested);	};
	if (activeSpell == SPL_SummonGuardian		)	{	return	Spell_Logic_SummonGuardian	(manaInvested);	};
	if (activeSpell == SPL_Schwaechen		)	{	return	Spell_Logic_Schwaechen	(manaInvested);	};
	if (activeSpell == SPL_Energyball			)	{	return	Spell_Logic_Energyball		(manaInvested);	};
	if (activeSpell == SPL_SuckEnergy			)	{	return	Spell_Logic_SuckEnergy		(manaInvested);	};
	if (activeSpell == SPL_Skull				)	{	return	Spell_Logic_Skull			(manaInvested);	};
	if (activeSpell == SPL_SummonZombie			)	{	return	Spell_Logic_SummonZombie	(manaInvested);	};
	if (activeSpell == SPL_SummonMud			)	{	return	Spell_Logic_SummonMud		(manaInvested);	};
	if (activeSpell == SPL_SummonZombieArmy			)	{	return	Spell_Logic_SummonZombieArmy		(manaInvested);	};
	if (activeSpell == SPL_SummonRats			)	{	return	Spell_Logic_SummonRats		(manaInvested);	};
	if (activeSpell == SPL_Berserk			)	{	return	Spell_Logic_Berserk		(manaInvested);	};
	if (activeSpell == SPL_Zaehmen			)	{	return	Spell_Logic_Zaehmen		(manaInvested);	};
	if (activeSpell == SPL_Wahnsinn) {return Spell_Logic_Wahnsinn (manaInvested);};
	if (activeSpell == SPL_Seelenraub) {return Spell_Logic_Seelenraub (manaInvested);};
	if (activeSpell == SPL_Blutopfer) {return Spell_Logic_Blutopfer (manaInvested);};
	if (activeSpell == SPL_Unsichtbarkeit) {return Spell_Logic_Unsichtbarkeit (manaInvested);};
	if (Npc_GetActiveSpell(self) == SPL_CONTROL			)	{	return	Spell_Logic_Control			(manaInvested);	};

	if (activeSpell == SPL_engel					)	{	return	Spell_Logic_engel				(manaInvested);	};
	if (activeSpell == SPL_soulsplit					)	{	return	Spell_Logic_soulsplit				(manaInvested);	};
	if (activeSpell == SPL_TrfWoman					)	{	return	Spell_Logic_TrfWoman				(manaInvested);	};
	if (activeSpell == SPL_TrfWomanBack					)	{	return	Spell_Logic_TrfWomanBack				(manaInvested);	};
	if (activeSpell == SPL_Verfluchen					)	{	return	Spell_Logic_Verfluchen				(manaInvested);	};
	if (activeSpell == SPL_Hagel					)	{	return	Spell_Logic_Hagel				(manaInvested);	};
	if (activeSpell == SPL_Beeinflussung					)	{	return	Spell_Logic_Beeinflussung				(manaInvested);	};
	if (activeSpell == SPL_AuraBerserker					)	{	return	Spell_Logic_AuraBerserker				(manaInvested);	};
	if (activeSpell == SPL_Nebel					)	{	return	Spell_Logic_Nebel				(manaInvested);	};
	if (activeSpell == SPL_HolyRain					)	{	return	Spell_Logic_HolyRain				(manaInvested);	};
	if (activeSpell == SPL_HolyWave					)	{	return	Spell_Logic_HolyWave				(manaInvested);	};
	if (activeSpell == SPL_FireWave					)	{	return	Spell_Logic_FireWave				(manaInvested);	};
	if (activeSpell == SPL_SumSwampGolem					)	{	return	Spell_Logic_SummonSwampGolem				(manaInvested);	};
	if (activeSpell == SPL_AuraDesStehlens					)	{	return	Spell_Logic_AuraDesStehlens				(manaInvested);	};
	if (activeSpell == SPL_ModifiedZap			)	{	return	Spell_Logic_ModifiedZap	(manaInvested);	};
	if (activeSpell == SPL_TeleportBeliarOut			)	{	return	Spell_Logic_TeleportBeliarOut	(manaInvested);	};
	if (activeSpell == SPL_SummonCrawler			)	{	return	Spell_Logic_SummonCrawler	(manaInvested);	};
	if (activeSpell == SPL_TeleportBergfestung			)	{	return	Spell_Logic_TeleportBergfestung	(manaInvested);	};
	if (activeSpell == SPL_TeleportKlosterruine			)	{	return	Spell_Logic_TeleportKlosterruine	(manaInvested);	};
	if (activeSpell == SPL_TeleportSonnenkreis			)	{	return	Spell_Logic_TeleportSonnenkreis	(manaInvested);	};
	if (activeSpell == SPL_TeleportObelisk			)	{	return	Spell_Logic_TeleportObelisk	(manaInvested);	};
	if (activeSpell == SPL_TeleportKhorata			)	{	return	Spell_Logic_TeleportKhorata	(manaInvested);	};
	if (activeSpell == SPL_TeleportTorgan			)	{	return	Spell_Logic_TeleportTorgan	(manaInvested);	};
	if (activeSpell == SPL_TeleportRELBauernhof			)	{	return	Spell_Logic_TeleportRELBauernhof	(manaInvested);	};
	if (activeSpell == SPL_TeleportRELPass			)	{	return	Spell_Logic_TeleportRELPass	(manaInvested);	};
	if (activeSpell == SPL_TeleportRELRaeuber			)	{	return	Spell_Logic_TeleportRELRaeuber	(manaInvested);	};
	if (activeSpell == SPL_TeleportRELSee			)	{	return	Spell_Logic_TeleportRELSee	(manaInvested);	};
	if (activeSpell == SPL_TeleportBeliarfestung			)	{	return	Spell_Logic_TeleportBeliarfestung	(manaInvested);	};
	if (activeSpell == SPL_SummonRabbit			)	{	return	Spell_Logic_SummonRabbit	(manaInvested);	};
	if (activeSpell == SPL_SummonKrautschaf			)	{	return	Spell_Logic_SummonKrautschaf	(manaInvested);	};
	if (activeSpell == SPL_SumHagen			)	{	return	Spell_Logic_SummonHagen	(manaInvested);	};
	if (activeSpell == SPL_TeleportWaldis			)	{	return	Spell_Logic_TeleportWaldis	(manaInvested);	};
	if (activeSpell == SPL_TeleportWaldiPlattform			)	{	return	Spell_Logic_TeleportWaldiPlattform	(manaInvested);	};
	if (activeSpell == SPL_TeleportRELHofstaat			)	{	return	Spell_Logic_TeleportRELHofstaat	(manaInvested);	};
	if (activeSpell == SPL_Eisklinge			)	{	return	Spell_Logic_Eisklinge	(manaInvested);	};
	if (activeSpell == SPL_TeleportOrkfriedhof			)	{	return	Spell_Logic_TeleportOrkfriedhof	(manaInvested);	};
	if (activeSpell == SPL_Poison			)	{	return	Spell_Logic_Poison	(manaInvested);	};
	if (activeSpell == SPL_Telekinese			)	{	return	Spell_Logic_Telekinese	(manaInvested);	};
	if (activeSpell == SPL_TeleportGenn			)	{	return	Spell_Logic_TeleportGenn	(manaInvested);	};
	if (activeSpell == SPL_AuraFrost					)	{	return	Spell_Logic_AuraFrost				(manaInvested);	};
	if (activeSpell == SPL_AuraFeuer					)	{	return	Spell_Logic_AuraFeuer				(manaInvested);	};
	if (activeSpell == SPL_AuraHeilung					)	{	return	Spell_Logic_AuraHeilung				(manaInvested);	};
	if (activeSpell == SPL_TeleportRELMoor			)	{	return	Spell_Logic_TeleportRELMoor	(manaInvested);	};
	if (activeSpell == SPL_Spucke			)	{	return	Spell_Logic_Spucke	(manaInvested);	};
	if (activeSpell == SPL_ArgezVision			)	{	return	Spell_Logic_ArgezVision	(manaInvested);	};
	if (activeSpell == SPL_Fackel			)	{	return	Spell_Logic_Fackel	(manaInvested);	};
	if (activeSpell == SPL_Giftteppich			)	{	return	Spell_Logic_Giftteppich	(manaInvested);	};
	if (activeSpell == SPL_AuraFlammen					)	{	return	Spell_Logic_AuraFlammen				(manaInvested);	};
	if (activeSpell == SPL_TeleportGDG					)	{	return	Spell_Logic_TeleportGDG				(manaInvested);	};
	if (activeSpell == SPL_ZiegeZaehmen					)	{	return	Spell_Logic_ZiegeZaehmen				(manaInvested);	};
	if (activeSpell == SPL_TeleportArgezToSaturas					)	{	return	Spell_Logic_TeleportArgezToSaturas				(manaInvested);	};

//Leer

//	if (Npc_GetActiveSpell(self) == SPL_B					)	{	return	Spell_Logic_XXX				(manaInvested);	};
//	if (Npc_GetActiveSpell(self) == SPL_C					)	{	return	Spell_Logic_XXX				(manaInvested);	};
//	if (Npc_GetActiveSpell(self) == SPL_D					)	{	return	Spell_Logic_XXX				(manaInvested);	};
//	if (Npc_GetActiveSpell(self) == SPL_E					)	{	return	Spell_Logic_XXX				(manaInvested);	};
//	if (Npc_GetActiveSpell(self) == SPL_F					)	{	return	Spell_Logic_XXX				(manaInvested);	};
//	if (Npc_GetActiveSpell(self) == SPL_G					)	{	return	Spell_Logic_XXX				(manaInvested);	};
//	if (Npc_GetActiveSpell(self) == SPL_H					)	{	return	Spell_Logic_XXX				(manaInvested);	};
};
