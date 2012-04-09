// **************
// ZS_Konter
// **************

func int ZS_Konter()
{
	self.aivar[AIV_FreezeStateTime] = 0;
};



func int ZS_Konter_Loop ()
{	
	// EXIT LOOP IF...
	
	if (self.aivar[AIV_FreezeStateTime] > 1)
	{
		var int Damage;
		var C_Item NW;

		NW = Npc_GetReadiedWeapon (hero);

		if (Hlp_IsValidItem(NW))
		{
			Damage = 2*Nw.damageTotal + hero.attribute[ATR_STRENGTH] - self.protection[PROT_EDGE];

			AI_PrintScreen	(IntToString(Damage), -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
		};

		B_MagicHurtNpc	(hero, self, 99999);
		return LOOP_END;
	};
	/*if (Npc_GetDistToNpc(self, hero) > 100)
	{
		Npc_SetStateTime(self, 0);
	};*/
	
	// LOOP FUNC
	if (Npc_GetStateTime(self) != self.aivar[AIV_FreezeStateTime])
	{
		self.aivar[AIV_FreezeStateTime] = Npc_GetStateTime(self);
	
		
	};
	
	return	LOOP_CONTINUE;
};


func void ZS_Konter_End()
{

};
