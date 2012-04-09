INSTANCE Info_Mod_Guru_Gelaber (C_INFO)
{
	npc		= Mod_7236_GUR_Guru_NW;
	nr		= 1;
	condition	= Info_Mod_Guru_Gelaber_Condition;
	information	= Info_Mod_Guru_Gelaber_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey.";
};

FUNC INT Info_Mod_Guru_Gelaber_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Jana))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Guru_Gelaber_Info()
{
	AI_Output(hero, self, "Info_Mod_Guru_Gelaber_15_00"); //Hey.
	AI_Output(self, hero, "Info_Mod_Guru_Gelaber_11_01"); //AAAAHHH! Ein neues paar Ohren für meine BOOOOTSCHAFT. So höre denn:
	AI_Output(self, hero, "Info_Mod_Guru_Gelaber_11_02"); //Nicht länger müsst ihr euch vorm Schläfer fürchten. Der schläft. Angst und Grauen solltet ihr jedoch empfinden vor dem einen, dem WÄCHTER! Er wacht! ERWACHT WÄCHTER!
	AI_Output(hero, self, "Info_Mod_Guru_Gelaber_15_03"); //Ganz ruhig, komm mal mit.
	AI_Output(self, hero, "Info_Mod_Guru_Gelaber_11_04"); //Wage es nicht mich, der ich wache, anzufassen, Schlafender!
	AI_Output(hero, self, "Info_Mod_Guru_Gelaber_15_05"); //Muss ich dich aus der Stadt prügeln?
	AI_Output(self, hero, "Info_Mod_Guru_Gelaber_11_06"); //Fass mich nicht an!

	B_ReadySpell	(self, SPL_FireRain, SPL_Cost_Firerain);

	AI_Output(self, hero, "Info_Mod_Guru_Gelaber_11_07"); //Niahahahaha! Ihr werdet alle in einem Feuerregen sterben! Doch keine Angst, ICH werde euch wiedererwecken und wir werden zusammen wachen!

	Wld_InsertNpc	(HeroBot_NW, "NW_CITY_MERCHANT_PATH_29");

	AI_StopProcessInfos	(self);
};