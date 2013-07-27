// **************
// ZS_MagicShrink
// **************

func int ZS_MagicShrink()
{
	if ( !Npc_HasBodyFlag( self, BS_FLAG_INTERRUPTABLE) )
	{
		AI_StandUp 		(self);
	}
	else
	{
		AI_StandUpQuick (self);
	};
	
	self.aivar[AIV_MM_ShrinkState] = 0;   		 // AIV resetten
};


func int ZS_MagicShrink_Loop ()
{	
	if 	(self.aivar[AIV_MM_ShrinkState] == 0)	{	Mdl_SetModelScale(self,	0.90,	0.90, 	0.90);	self.aivar[AIV_MM_ShrinkState] = 1;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 1)	{	Mdl_SetModelScale(self,	0.85,	0.85, 	0.85);	self.aivar[AIV_MM_ShrinkState] = 2;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 2)	{	Mdl_SetModelScale(self,	0.80,	0.80, 	0.80);	self.aivar[AIV_MM_ShrinkState] = 3;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 3)	{	Mdl_SetModelScale(self,	0.75,	0.75, 	0.75);	self.aivar[AIV_MM_ShrinkState] = 4;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 4)	{	Mdl_SetModelScale(self,	0.70,	0.70, 	0.70);	self.aivar[AIV_MM_ShrinkState] = 5;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 5)	{	Mdl_SetModelScale(self,	0.65,	0.65, 	0.65);	self.aivar[AIV_MM_ShrinkState] = 6;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 6)	{	Mdl_SetModelScale(self,	0.60,	0.60, 	0.60);	self.aivar[AIV_MM_ShrinkState] = 7;		}
 	else if	(self.aivar[AIV_MM_ShrinkState] == 7)	{	Mdl_SetModelScale(self,	0.55,	0.55, 	0.55);	self.aivar[AIV_MM_ShrinkState] = 8;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 8)	{	Mdl_SetModelScale(self,	0.50,	0.50, 	0.50);	self.aivar[AIV_MM_ShrinkState] = 9;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 9)	{	Mdl_SetModelScale(self,	0.45,	0.45, 	0.45);	self.aivar[AIV_MM_ShrinkState] = 10;	}
	else if	(self.aivar[AIV_MM_ShrinkState] == 10)	{	Mdl_SetModelScale(self,	0.40,	0.40, 	0.40);	self.aivar[AIV_MM_ShrinkState] = 11;	}
	else if	(self.aivar[AIV_MM_ShrinkState] == 11)	{	Mdl_SetModelScale(self,	0.35,	0.35, 	0.35);	self.aivar[AIV_MM_ShrinkState] = 12;	}
	else if	(self.aivar[AIV_MM_ShrinkState] == 12)	{	Mdl_SetModelScale(self,	0.30,	0.30, 	0.30);	self.aivar[AIV_MM_ShrinkState] = 13;	}
 
	else if (self.aivar[AIV_MM_ShrinkState] == 13) 	
	{
		//-------- Attribute reduzieren ! --------
		Npc_ChangeAttribute (self, ATR_HITPOINTS, -((self.attribute[ATR_HITPOINTS]*9)/10));      
		Npc_ChangeAttribute (self, ATR_HITPOINTS_MAX, -((self.attribute[ATR_HITPOINTS_MAX]*9)/10));      
		Npc_ChangeAttribute (self, ATR_STRENGTH, -((self.attribute[ATR_STRENGTH]	*9)/10));      
		self.protection[PROT_BLUNT]	=	self.protection[PROT_BLUNT]/10;	    
		self.protection[PROT_EDGE]	=	self.protection[PROT_EDGE]/10;	
		self.protection[PROT_FIRE]	=	self.protection[PROT_FIRE]/10;	
		self.protection[PROT_FLY]	=	0;	
		self.protection[PROT_MAGIC]	=	self.protection[PROT_MAGIC]/10;    
		self.protection[PROT_POINT]	=	self.protection[PROT_POINT]/10;    
		self.level	=	self.level / 3;		


		self.aivar[AIV_MM_ShrinkState] = 14;
	}
	else if (self.aivar[AIV_MM_ShrinkState] == 14) 
	{
		Npc_ClearAIQueue(self);

		if (Mod_Argez_Shrink == 1)
		{
			Mod_Argez_Shrink = 0;

			Mod_Argez_ShrinkMonster = Hlp_GetNpc(self);

			AI_Teleport	(self, "TOT");

			self.wp = "TOT";
			self.spawnPoint = "TOT";

			AI_StartState		(self, ZS_Roam, 1, "");

			AI_Teleport	(self, "TOT");

			B_LogEntry	(TOPIC_MOD_MAGISCHEMARKIERUNG, "Ich habe ein Monster gefangen und sollte jetzt zu Argez zurückkehren.");
		}
		else
		{
			self.start_aistate = ZS_MagicShrunk;
			AI_StartState	(self, ZS_MagicShrunk, 1, "");
		};

		return LOOP_END;	 
	};

	AI_Wait (self, 0.38);		// 5 Sekunden gesamte Schrumpfzeit geteilt durch 13 Stadien

	return LOOP_CONTINUE;
};

func void ZS_MagicShrink_End()
{

};

func int ZS_MagicGrow()
{
	if (!Npc_HasBodyFlag(self, BS_FLAG_INTERRUPTABLE))
	{
		AI_StandUp 		(self);
	}
	else
	{
		AI_StandUpQuick (self);
	};
	
	self.aivar[AIV_MM_ShrinkState] = 0;   		 // AIV resetten
};


func int ZS_MagicGrow_Loop ()
{	
	if (self.aivar[AIV_MM_ShrinkState] == 2)	{	Mdl_SetModelScale(self,	0.90,	0.90, 	0.90);	self.aivar[AIV_MM_ShrinkState] = 1;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 3)	{	Mdl_SetModelScale(self,	0.85,	0.85, 	0.85);	self.aivar[AIV_MM_ShrinkState] = 2;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 4)	{	Mdl_SetModelScale(self,	0.80,	0.80, 	0.80);	self.aivar[AIV_MM_ShrinkState] = 3;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 5)	{	Mdl_SetModelScale(self,	0.75,	0.75, 	0.75);	self.aivar[AIV_MM_ShrinkState] = 4;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 6)	{	Mdl_SetModelScale(self,	0.70,	0.70, 	0.70);	self.aivar[AIV_MM_ShrinkState] = 5;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 7)	{	Mdl_SetModelScale(self,	0.65,	0.65, 	0.65);	self.aivar[AIV_MM_ShrinkState] = 6;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 8)	{	Mdl_SetModelScale(self,	0.60,	0.60, 	0.60);	self.aivar[AIV_MM_ShrinkState] = 7;		}
 	else if	(self.aivar[AIV_MM_ShrinkState] == 9)	{	Mdl_SetModelScale(self,	0.55,	0.55, 	0.55);	self.aivar[AIV_MM_ShrinkState] = 8;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 10)	{	Mdl_SetModelScale(self,	0.50,	0.50, 	0.50);	self.aivar[AIV_MM_ShrinkState] = 9;		}
	else if	(self.aivar[AIV_MM_ShrinkState] == 11)	{	Mdl_SetModelScale(self,	0.45,	0.45, 	0.45);	self.aivar[AIV_MM_ShrinkState] = 10;	}
	else if	(self.aivar[AIV_MM_ShrinkState] == 12)	{	Mdl_SetModelScale(self,	0.40,	0.40, 	0.40);	self.aivar[AIV_MM_ShrinkState] = 11;	}
	else if	(self.aivar[AIV_MM_ShrinkState] == 13)	{	Mdl_SetModelScale(self,	0.35,	0.35, 	0.35);	self.aivar[AIV_MM_ShrinkState] = 12;	}
	else if	(self.aivar[AIV_MM_ShrinkState] == 14)	{	Mdl_SetModelScale(self,	0.30,	0.30, 	0.30);	self.aivar[AIV_MM_ShrinkState] = 13;	}
 
	else if (self.aivar[AIV_MM_ShrinkState] == 1) 	
	{
		//-------- Attribute reduzieren ! --------    
		Npc_ChangeAttribute (self, ATR_HITPOINTS_MAX, +((self.attribute[ATR_HITPOINTS_MAX]*10)/9));      
		Npc_ChangeAttribute (self, ATR_HITPOINTS, +((self.attribute[ATR_HITPOINTS]*10)/9));    
		Npc_ChangeAttribute (self, ATR_STRENGTH,	+((self.attribute[ATR_STRENGTH]*10)/9));      
		self.protection[PROT_BLUNT]	=	self.protection[PROT_BLUNT]*10;	    
		self.protection[PROT_EDGE]	=	self.protection[PROT_EDGE]*10;	
		self.protection[PROT_FIRE]	=	self.protection[PROT_FIRE]*10;	
		self.protection[PROT_FLY]	=	0;	
		self.protection[PROT_MAGIC]	=	self.protection[PROT_MAGIC]*10;    
		self.protection[PROT_POINT]	=	self.protection[PROT_POINT]*10;    
		self.level	=	self.level * 3;		


		self.aivar[AIV_MM_ShrinkState] = 0;
	}
	else if (self.aivar[AIV_MM_ShrinkState] == 0) 
	{
		Npc_ClearAIQueue(self);
		self.start_aistate = ZS_Roam;
		AI_StartState		(self, ZS_Roam, 1, "");
		return LOOP_END;	 
	};

	AI_Wait (self, 0.38);		// 5 Sekunden gesamte Schrumpfzeit geteilt durch 13 Stadien

	Print (IntToString(self.aivar[AIV_MM_ShrinkState]));

	return LOOP_CONTINUE;
};

func void ZS_MagicGrow_End()
{

};

// **************
// ZS_MagicShrunk
// **************

func void ZS_MagicShrunk ()
{	
	Npc_SetTarget 	(self, hero);
	Npc_SetStateTime	(self, 0);
};

func int ZS_MagicShrunk_Loop ()
{
	AI_Flee (self);

	return LOOP_CONTINUE;
};

func void ZS_MagicShrunk_End ()
{	
	
};