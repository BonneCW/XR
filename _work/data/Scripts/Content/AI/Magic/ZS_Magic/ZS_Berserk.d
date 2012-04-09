// **************************************
// B_StopBerserk
// ----------------
// wird aus ZS_Berserk_loop aufgerufen
// wenn SPL_Time_Sleep vorbei ist
// **************************************

func int B_StopBerserk()
{
	Npc_PercDisable	(self,	PERC_ASSESSDAMAGE); //weil Wahrnehmung unten auf B_StopBerserk verweist
};		


// **********************
// B_AssessBerserkTalk
// **********************

func void B_AssessBerserkTalk()
{
};


// *************
// ZS_Berserk
// *************

func void ZS_Berserk ()
{
	// der ZS_Berserk beendet sich selbst im loop, daher ist keine perception PERC_ASSESSSTOPMAGIC nötig, und darf
	// auch nicht gesetzt werden, ansonsten wird der diesen zustand aktivierende effekt wenn er beendet ist (z.B. weil
	// der partikeleffekt stirbt) ein assessstopmagic senden, und dadurch illegalerweise vorzeitig den zustand beenden
	// mit anderen worten: der pfx triggert diesen zustand, und der zustand beendet sich selbst
		


	
};

func int ZS_Berserk_Loop ()
{
	Wld_DetectNpc	(self, -1, ZS_Talk, -1);
	B_Attack	(self, other, AR_GuildEnemy, 0);

	if (self.attribute[ATR_HITPOINTS] > 0)
	{
		return LOOP_CONTINUE;
	}
	else
	{
		return LOOP_END;
	};
};

func void ZS_Berserk_End()
{

};

