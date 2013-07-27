// **************************************************** 
// B_AssessTalk	
// ------------
// aufgerufen durch Ansprechen (Wahrnehmung ASSESSTALK)
// oder durch B_AssessPlayer (NSC hat Important-Info)
// GILT AUCH FÜR MONSTER
// ****************************************************

func void B_AssessTalk ()
{
	// EXIT IF...

	B_Vergiftet (self);

	if (FF_Active(B_MG_GameLoop))
	{
		return;
	};

	if (Npc_GetDistToNpc(self, other) > 500)
	&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(PC_Friend_XW))
	{
		return;
	};

	if (Wld_IsTime(21,00,05,00))
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero))
	{
		if (!HeroAtLight)
		{
			HeroAtLight = 1 + C_HeroAtLight(); // sekündlich checken, ob Held in der Nähe einer Lampe ist
		};

		if (HeroAtLight == 1)
		{
			if (Npc_GetWalkMode(hero) == NPC_SNEAK)
			{
				if (Npc_GetDistToNpc(self, hero) > 200)
				{
					return;
				};
			}
			else if (Npc_GetWalkMode(hero) == NPC_WALK)
			{
				if (Npc_GetDistToNpc(self, hero) > 300)
				{
					return;
				};
			}
			else
			{
				if (Npc_GetDistToNpc(self, hero) > 400)
				{
					return;
				};
			};
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7314_Ziel_AW))
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);	

		AI_StartState 	(self, ZS_Talk, 0, ""); 	//sitzenbleiben
		return;
	};
	
	if (CurrentLevel == ORCGRAVEYARD_ZEN)
	{
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7265_GUR_BaalTavor_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7261_PSINOV_Novize_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7262_PSINOV_Novize_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7263_PSINOV_Novize_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7264_PSINOV_Novize_OGY)))
		&& (Mod_NL_UOS < 7)
		{
			return;
		};
	};

	if (Mod_CrazyRabbit == 1)
	{
		return;
	};

	if (self.aivar[AIV_MM_REAL_ID] == ID_TRUHE)
	{
		B_SetAttitude	(self, ATT_HOSTILE);

		return;
	};

	if (C_NpcIsHero(other))
	&& (Unsichtbarkeitsperk == TRUE)
	{		
		hero.flags = 0;

		Unsichtbarkeitsperk = FALSE;

		AI_Teleport	(hero, "PC_HERO");
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Moe_AufgebrachteFrau))
	&& (Mod_MoeTalkedAboutNoTalk < Wld_GetDay())
	&& ((Mod_MoeDontTalk == 1)
	|| (Mod_MoeDontTalk == 2)
	|| (Mod_MoeDontTalk == 3))
	{
		if (Mod_MoeDontTalk == 1)
		{
			Mod_MoeDontTalk = 2;

			B_LogEntry	(TOPIC_MOD_MOE_TALK, "Ich scheine nun mit den Auswirkungen von Canthars Rache konfrontiert zu werden: Niemand spricht mehr mit mir ... Niemand? Moe muss mir wieder helfen ...");
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_599_NONE_Moe_NW))
		{
		}
		else
		{
			return;
		};
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_UngebeterBesucher))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Eremit_Prisma))
	&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_9000_KDW_Saturas_AW))
	{
		return;
	};
	
	// ------ Exit-Conditions NUR für Monster
	if (self.guild > GIL_SEPERATOR_HUM)
	{
		// ------ Monster hat keine Info ------
		if (Npc_CheckInfo (self, 1) == FALSE)
		{
			if (Npc_CheckInfo (self, 0) == FALSE)
			{
				return;
			};
		};
	};
		
	// ------ Exit-Conditions NUR für Humans ------
	if (self.guild < GIL_SEPERATOR_HUM)
	{
		
		// ------ Spieler ist Enemy ------
		if (B_AssessEnemy())	
		{ 
			return;
		};
	
		// ------ Spieler ist Mörder ------
		if (B_GetPlayerCrime(self) == CRIME_MURDER)
		&& (C_WantToAttackMurder(self, other))
		{
			B_Attack (self, other, AR_HumanMurderedHuman, 0);	
			return;
		};
		
		if (C_PlayerIsFakeBandit (self,other) == TRUE)
		&& (self.guild != GIL_BDT)
		{
			B_Attack (self,other,AR_GuildEnemy,0);
			return;
		};
		
		
		if (C_RefuseTalk(self,other))
		{
			if C_PlayerHasFakeGuild (self,other)
			{
				Npc_ClearAIQueue	(self);
				AI_StartState (self,ZS_CommentFakeGuild , 1, "");
				return;
			}
			else
			{
				B_Say (self, other, "$NOTNOW");
				return;
			};	
		};
	};
	
		
	// FUNC

	if (DolchkampfAn == 1)
	&& (!Npc_CanSeeNpc(self, other))
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7100_ASS_Zahit_NW))
		{
			self.flags = 0;
		};

		if (self.flags == 2)
		{
			return;
		};

		AI_TurnToNpc	(other, self);
		if (Npc_GetDistToNpc(self,other) > 100)
		{
			AI_GotoNpc	(other, self);
		};
		Npc_ClearAIQueue	(self);
		AI_StartState (self, ZS_Gemeuchelt , 1, "");
		AI_ReadyMeleeWeapon	(other);
		AI_PlayAni	(other, "T_MEUCHELN");
		AI_RemoveWeapon	(other);

		return;
	};
	
	// ------ Spieler labert NSC an ------
	if (B_GetAivar(self, AIV_NpcStartedTalk) == FALSE)
	{
		if ( C_BodyStateContains(self,BS_WALK) || C_BodyStateContains(self,BS_RUN) )
		{
			B_Say (other,self,"$SC_HEYWAITASECOND");
		}
		else if (!Npc_CanSeeNpc(self, other))
		{
			var int rnd; rnd = Hlp_Random(100);
			if 		(rnd <= 25)	{	B_Say (other,self,"$SC_HEYTURNAROUND");		}
			else if (rnd <= 50)	{	B_Say (other,self,"$SC_HEYTURNAROUND02");	}
			else if (rnd <= 75)	{	B_Say (other,self,"$SC_HEYTURNAROUND03");	}
			else if (rnd <= 99) {	B_Say (other,self,"$SC_HEYTURNAROUND04");	};
		};
	};

	Npc_ClearAIQueue	(self);
	B_ClearPerceptions	(self);	
	
	// ------ NSC bleibt sitzen oder steht in Ruhe auf bzw. beendet Mobsi in Ruhe -----------------
	if (C_BodyStateContains(self, BS_SIT))
	{
		if (B_GetAivar(self, AIV_NpcStartedTalk) == TRUE)
		{
			AI_StandUpQuick (other); //Spieler anhalten
		}
		else
		{
			AI_StandUp		(other); //Spieler anhalten
		};
		
		if (Npc_CanSeeNpc(self, other))
		{
			AI_StartState 	(self, ZS_Talk, 0, ""); 	//sitzenbleiben
		}	
		else //nicht sehen
		{
			//HACK: Im ObservePlayer kann ein NSC sitzen, ohne daß in der END-Routine des ZS sauber aufgestanden wird (klar, denn ZS_ObservePlayer_End hat kein StandUp o.ä. - darf dies auch nicht haben)
			if (Npc_IsInState (self, ZS_ObservePlayer))
			{
				AI_StandUp 		(self);
			};
			AI_StartState 	(self, ZS_Talk, 1, ""); 	//aufstehen
		};
				
		return;
	}
	else //nicht sitzen
	{
		if (B_GetAivar(self, AIV_NpcStartedTalk) == TRUE)
		{
			AI_StandUpQuick (self);
			AI_StandUpQuick (other); //Spieler anhalten
		}
		else
		{
			AI_StandUp		(self);
			AI_StandUp		(other); //Spieler anhalten
		};
		
		AI_StartState 	(self, ZS_Talk, 0, ""); 	//sitzenbleiben
		return;
	};
};