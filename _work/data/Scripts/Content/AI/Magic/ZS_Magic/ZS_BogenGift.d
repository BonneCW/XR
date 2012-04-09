// *****************************************************
// B_MagicStopBurn
// ----------
// wird aufgerufen durch PERC_ASSESSSTOPMAGIC in ZS_BogenGift
// *****************************************************

const int SPL_BogenGift_DAMAGE_PER_SEC = 1;

// ************
// ZS_BogenGift
// ************

var int StateTime_Plus;

func int ZS_BogenGift()
{	
	Npc_SetStateTime	(self, 0);	
};

func int ZS_BogenGift_Loop ()
{	
	if (Npc_GetStateTime(self) > StateTime_Plus)
	{
		StateTime_Plus += 1;
		B_MagicHurtNpc (other, self, SPL_BogenGift_DAMAGE_PER_SEC);
	};
	
	if	(self.attribute[ATR_HITPOINTS] <= 0)
	{
		Npc_ClearAIQueue(self);		
		AI_StandUp		(self);				// FIXME: wieso ? dann steht er doch noch mal auf bevor er abkratzt
											// (dann sollte er auch noch sowas sagen wie: "Macht das nicht zu Hause Kinder" bevor er endgültig stirbt :)												
		return			LOOP_END;
	};
	
	return				LOOP_CONTINUE;
};


func void ZS_BogenGift_End()
{
};