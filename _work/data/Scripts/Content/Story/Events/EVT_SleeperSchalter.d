FUNC VOID SLEEPER_SCHALTER_01_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	&& (Mod_Sleeper_01 == 0)
	{	
		Mod_Sleeper_01 = 1;

		B_MagicHurtNpc	(hero, Sleeper, (Sleeper.attribute[ATR_HITPOINTS_MAX]/3)+2);
	};
}; 

FUNC VOID SLEEPER_SCHALTER_02_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	&& (Mod_Sleeper_02 == 0)
	{	
		Mod_Sleeper_02 = 1;

		B_MagicHurtNpc	(hero, Sleeper, (Sleeper.attribute[ATR_HITPOINTS_MAX]/3)+2);
	};
}; 

FUNC VOID SLEEPER_SCHALTER_03_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	&& (Mod_Sleeper_03 == 0)
	{	
		Mod_Sleeper_03 = 1;

		B_MagicHurtNpc	(hero, Sleeper, (Sleeper.attribute[ATR_HITPOINTS_MAX]/3)+2);
	};
}; 