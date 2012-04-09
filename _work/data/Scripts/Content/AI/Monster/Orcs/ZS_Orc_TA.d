func void B_Orc_Idle_Ani()
{
	var int ani;

	B_SetSchwierigkeit();
	ani = Hlp_Random( 130 );
	if ( ani < 10 )
	{
		AI_PlayAni( self, "T_PERCEPTION" );
	}
	else if ( ani < 20 )
	{
		AI_PlayAni( self, "T_WARN" );
	}
	else if ( ani < 30 )
	{
		AI_PlayAni( self, "T_ANGRY" );
	}
	else if ( ani < 40 )
	{
		AI_PlayAni( self, "T_FRIGHTEND" );
	}
	else if ( ani < 50 )
	{
		AI_PlayAni( self, "T_HAPPY" );
	}
	else if ( ani < 60 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_01" );
	}
	else if ( ani < 70 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_02" );
	}
	else if ( ani < 80 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_03" );
	}
	else if ( ani < 90 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_04" );
	}
	else if ( ani < 100 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_05" );
	}
	else if ( ani < 110 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_06" );
	}
	else if ( ani < 120 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_07" );
	}
	else if ( ani < 130 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_08" );
	};
	
	AI_Wait( self, 1 );
};
func void ZS_Orc_Stonemill()
{
	PrintDebugNpc( PD_ZS_FRAME,"ZS_Orc_Stonemill" );
	
	if ( Npc_GetBodyState( self ) != BS_MOBINTERACT )
	{
		AI_SetWalkmode( self, NPC_WALK );		// Walkmode für den Zustand
		if ( Hlp_StrCmp( Npc_GetNearestWp(self), self.wp) == 0 )
		{
			AI_GotoWP( self, self.wp );
		};
	};
	
	Perception_Set_Monster_Rtn();

	B_SetSchwierigkeit();
};

func void ZS_Orc_Stonemill_Loop()
{
	PrintDebugNpc( PD_ZS_FRAME,"ZS_Orc_Stonemill_Loop" );

	AI_UseMob( self, "STONEMILL", 1 );
	AI_UseMob( self, "STONEMILL", 0 );
	
	//CS: Orc muss sich jede Runde einmal ab- und wieder anmelden, damit er mit dem Mobsi synchronisiert bleibt
	AI_UseMob( self, "STONEMILL", -1 ); 
};

func void ZS_Orc_Stonemill_End()
{
	PrintDebugNpc( PD_ZS_FRAME,"ZS_Orc_Stonemill_End" );
	Npc_ClearAIQueue( self );
	AI_UseMob( self, "STONEMILL", -1 );
};

//#######################################################
//	ZS_Orc_Pray
//#######################################################
func void ZS_Orc_Pray ()
{
    PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Pray" );
	
	Perception_Set_Monster_Rtn();

	B_SetSchwierigkeit();

	AI_SetWalkmode( self, NPC_WALK );		// Walkmode für den Zustand
	if ( !Npc_IsOnFP( self, "PREY" ) )
	{
		AI_GotoFP(self, "PREY");               // Gehe zum Tagesablaufstart
	};
};

func void ZS_Orc_Pray_Loop ()
{
    PrintDebugNpc( PD_ZS_LOOP, "ZS_Orc_Pray_Loop" );

 	AI_GotoFP	(self, "PREY");
 
   	if ( Npc_GetBodyState( self ) != BS_SIT )
   	{
   		AI_PlayAniBS( self, "T_STAND_2_PRAY", BS_SIT );
   	}
   	else
   	{
   		AI_PlayAniBS( self, "T_PRAY_RANDOM", BS_SIT );
   	};

	AI_Wait( self, 1 );    
};

func void ZS_Orc_Pray_End ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Pray_End" );
	Npc_ClearAIQueue( self );
	AI_PlayAniBS( self, "T_PRAY_2_STAND", BS_STAND );
};



//#####################################################
//		MOBSI: STOMPER
//#####################################################
func void ZS_Orc_Stomper()
{
	PrintDebugNpc( PD_TA_FRAME,"ZS_Orc_Stomper" );
	
	if ( Npc_GetBodyState( self) != BS_MOBINTERACT )
	{
		AI_SetWalkmode( self, NPC_WALK );		// Walkmode für den Zustand
		if ( Hlp_StrCmp( Npc_GetNearestWp(self), self.wp) == 0 )
		{
			AI_GotoWP( self, self.wp );
		};
	};

	Perception_Set_Monster_Rtn();

	B_SetSchwierigkeit();
};

func void ZS_Orc_Stomper_Loop()
{
	PrintDebugNpc( PD_TA_FRAME,"ZS_Orc_Stomper_Loop" );
	AI_UseMob( self, "STOMPER", 1 );		//Ani anwerfen
	AI_UseMob( self, "STOMPER", 0 );		//Ani anwerfen
	
    //CS: Orc muss sich jede Runde einmal ab- und wieder anmelden, damit er mit dem Mobsi synchronisiert bleibt
	AI_UseMob( self, "STOMPER", -1 ); 	
};

func void ZS_Orc_Stomper_End()
{
	PrintDebugNpc( PD_TA_FRAME,"ZS_Orc_Stomper_End" );
	Npc_ClearAIQueue( self );
	AI_UseMob( self, "STOMPER", -1 );						//Schluss jetzt mit dem Quatsch
};

func void ZS_Orc_Eat ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Eat" );
	
	Perception_Set_Monster_Rtn();

	B_SetSchwierigkeit();

	AI_SetWalkmode (self,NPC_WALK);	// Walkmode für den Zustand
	if ( !Npc_IsOnFP( self, "STAND" ) )
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	
};


func int ZS_Orc_Eat_Loop()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Eat_Loop" );
	
	AI_GotoFP	(self, "FP");
	
	B_Orc_ItemEat();
	var float pause;
	pause = intToFloat( Hlp_Random( 5 ) + 2 );
	AI_Wait( self, pause );
	
	return 0;	// bleibe in Loop
};


func void ZS_Orc_Eat_End ()
{
	PrintDebugNpc (PD_ZS_FRAME,"ZS_Eat_End");
	Npc_ClearAIQueue( self );
};

func void ZS_Orc_Sleep ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Sleep" );

	Perception_Set_Monster_Rtn();

	B_SetSchwierigkeit();

	if ( !C_BodyStateContains( self, BS_MOBINTERACT ) )
	{
		if ( Hlp_StrCmp( Npc_GetNearestWP( self ), self.wp ) == 0 )
		{
			AI_GotoWP	(self, self.wp);
		};
		AI_UnequipWeapons( self );
		AI_UseMob( self, "BEDLOW", 1 );
	};
};


func int ZS_Orc_Sleep_Loop ()
{
	PrintDebugNpc( PD_ZS_LOOP, "ZS_ORC_Sleep_Loop" );
	
	//	Wir dürfen an dieser Stelle weder davon ausgehen, das der NPC seinen wegpunkt schon erreicht 
	//	hat und im Bett liegt. Deshalb warten wir bis er den BodyState BS_MOBINTERACT erreicht hat!
	if ( C_BodyStateContains( self, BS_MOBINTERACT ) ) 
	{
		//	Hier könnte man Zufallsanimationen abspielen wenn sie existieren würden.
		
	};
	return 0;
};

func void ZS_Orc_Sleep_End ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Sleep_End" );	
	Npc_ClearAIQueue( self );
	
	//	Mobbenutzung beenden
	AI_UseMob( self, "BEDLOW", -1 );
	
	//	Aufwachgeräusche von sich geben			
	B_Say( self, NULL, "$AWAKE" );
	
	//	Waffen anlegen
	AI_EquipBestMeleeWeapon( self );
	AI_EquipBestRangedWeapon( self );
};

func void ZS_Orc_Drum ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Drum" );
	
	Perception_Set_Monster_Rtn();

	B_SetSchwierigkeit();

	//	Zum angegebenen Wegpunkt gehen und mit trommeln anfangen
	if ( Npc_GetBodyState( self) != BS_MOBINTERACT )
	{
		AI_SetWalkmode( self, NPC_WALK );
		if ( Hlp_StrCmp( Npc_GetNearestWp(self), self.wp) == 0 )
		{
			AI_GotoWP( self, self.wp );
		};
		AI_UseMob( self, "DRUM", 1 );		//Ani anwerfen
	};
	
};

func int ZS_Orc_Drum_Loop ()
{
	PrintDebugNpc( PD_ZS_LOOP, "ZS_Orc_Drum_Loop" );
	
	if ( Npc_GetBodyState(self) == BS_MOBINTERACT_INTERRUPT )
	{
		var int random;
		random = Hlp_Random( 15 );
		if ( random < 5 )
		{
			AI_PlayAniBS( self, "T_ORCDRUM_RANDOM_1", BS_MOBINTERACT_INTERRUPT );
		}
		else if ( random < 10 )
		{
			AI_PlayAniBS( self, "T_ORCDRUM_RANDOM_2", BS_MOBINTERACT_INTERRUPT );
		}
		else
		{
			AI_PlayAniBS( self, "T_ORCDRUM_RANDOM_3", BS_MOBINTERACT_INTERRUPT );
		};
	};
	
	return LOOP_CONTINUE;
};

func int ZS_Orc_Drum_End ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Drum_End" );
	Npc_ClearAIQueue( self );

	//nicht mehr Trommeln
	AI_UseMob( self, "DRUM", -1 );	
};

func void ZS_Orc_DrinkAlcohol ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_DrinkAlcohol" );
	Perception_Set_Monster_Rtn();

	B_SetSchwierigkeit();

	AI_SetWalkmode (self,NPC_WALK);	// Walkmode für den Zustand
	if ( !Npc_IsOnFP( self, "STAND" ) )
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
};


func int ZS_Orc_DrinkAlcohol_Loop()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_DrinkAlcohol_Loop" );
	
	AI_GotoFP		(self, "FP");

	B_Orc_ItemPotion();
	var float pause;
	pause = intToFloat( Hlp_Random( 5 ) + 2 );
	AI_Wait( self, pause );
	
	return 0;	// bleibe in Loop
};


func void ZS_Orc_DrinkAlcohol_End ()
{
	PrintDebugNpc (PD_ZS_FRAME,"ZS_DrinkAlcohol_End");
	Npc_ClearAIQueue( self );
};

func void ZS_Orc_Dance()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Dance" );
	Perception_Set_Monster_Rtn();
	//	Zum angegebenen Wegpunkt gehen
	AI_SetWalkmode( self, NPC_WALK );

	B_SetSchwierigkeit();
	if ( !Npc_IsOnFP( self, "DANCE" ) )
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
};

func void ZS_Orc_Dance_Loop()
{
	PrintDebugNpc( PD_ZS_LOOP, "ZS_Orc_Dance_Loop" );
	
	AI_GotoFP		(self, "DANCE");

	if ( Hlp_Random( 10 ) < 5 )
	{
		PrintDebugNpc( PD_ZS_FRAME,"ZS_Orc_Dance_Loop: T_DANCE" );
		AI_PlayAni( self, "T_DANCE" );
	}
	else
	{
		PrintDebugNpc( PD_ZS_FRAME,"ZS_Orc_Dance_Loop: T_DANCE_RANDOM_1" );
		AI_PlayAni( self, "T_DANCE_RANDOM_1" );
	};

};

func void ZS_Orc_Dance_End()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Dance_End" );
	Npc_ClearAIQueue( self );
	AI_StandUp( self );
};

func void ZS_Orc_Guard()
{
    PrintDebugNpc	(PD_TA_FRAME, "ZS_Orc_Guard" );

	        
	AI_SetWalkmode	(self, NPC_WALK);

	B_SetSchwierigkeit();

	if ( !Npc_IsOnFP(self, "STAND") )
	{
		AI_GotoWP	(self, self.wp); 
	};
	
};

func void ZS_Orc_Guard_Loop()
{
    PrintDebugNpc	(PD_ZS_FRAME, "ZS_Orc_Guard_Loop" );

	AI_GotoFP		(self, "STAND");
	AI_AlignToFP	(self);

	AI_Wait			(self, 1);
};

func void ZS_Orc_Guard_End()
{
	PrintDebugNpc	(PD_TA_FRAME, "ZS_Orc_Guard_End" );

	Npc_ClearAIQueue(self);
};