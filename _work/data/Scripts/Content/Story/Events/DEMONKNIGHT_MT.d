FUNC VOID DEMONKNIGHT_MT()
{
	if (AustauschDialog_Demon == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Flucht))
	{
		//Print ("FUNZT");

		Wld_SendTrigger	("DEMONKNIGHT_CAM");

		AustauschDialog_Demon = 1; 
	};
};
