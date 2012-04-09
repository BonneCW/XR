// *****************
// B_StopSeelenraub
// *****************

func void B_RestartSeelenraub()
{
	if (Npc_GetLastHitSpellID(self) == SPL_Seelenraub)
	{
		Npc_SetStateTime(self,0);
	};
};


func void B_StopSeelenraub()
{	
	Npc_PercEnable	(self, PERC_ASSESSMAGIC, B_AssessMagic);
	
	Npc_ClearAIQueue(self);
	AI_StandUp		(self);

	if (!Npc_IsPlayer(self))
	{
	    	if (self.guild < GIL_SEPERATOR_HUM)
	      	{
			B_AssessDamage();
	      	}
	    	else
	      	{
			Npc_SetTempAttitude (self, ATT_HOSTILE); //falls nicht schon Gilden-Attitüde hostile ist 
	      	};
	};
};

// **************
// ZS_Seelenraub
// **************

func int ZS_Seelenraub()
{
        Npc_SetTempAttitude(self, ATT_FRIENDLY);
        Perception_Set_Normal (); //Verhält sich weiter ganz normal
	Npc_PercEnable		(self, PERC_ASSESSMAGIC, B_RestartSeelenraub); 		// falls ein NSC nochmal von einem Freezespell getroffen wurde, so muss die State Time reseted werden
	
	Npc_ClearAIQueue(self);        //AI Befehle löschen (Kampf abbrechen)
	B_ClearPerceptions(self);      //Wahrnehmung resetten (Nein, ich bin nicht mehr dein Feind!)
	AI_StandUp(self);              //Aufstehen
	AI_SetWalkMode(self, NPC_RUN); //Lauf, Forest!
	AI_RemoveWeapon(self);         //Waffe wegstecken (wenn er sie braucht, muss er erst ziehen)
};



func int ZS_Seelenraub_Loop ()
{	
        Npc_SetTempAttitude(self, ATT_FRIENDLY);
	// EXIT LOOP IF...
	if (Npc_IsNear(self, hero))
	{
	    	AI_TurnToNpc(self, hero);
	}
	else
	{
	    	AI_GotoNpc(self, hero);
	};
	if (Npc_GetStateTime(self) > SPL_TIME_Seelenraub)
	{
		B_StopSeelenraub();
		return LOOP_END;
	};
	
	// LOOP FUNC
	return				LOOP_CONTINUE;
};


func void ZS_Seelenraub_End()
{

};
