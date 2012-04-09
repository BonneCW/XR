INSTANCE Info_Mod_Shivar_Eisgebiet (C_INFO)
{
	npc		= Monster_11039_Shivar_EIS;
	nr		= 1;
	condition	= Info_Mod_Shivar_Eisgebiet_Condition;
	information	= Info_Mod_Shivar_Eisgebiet_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Shivar_Eisgebiet_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Shivar_Eisgebiet_Info()
{
	AI_Output(self, hero, "Info_Mod_Shivar_Eisgebiet_20_00"); //Was? Dich hier anzutreffen hätte ich nicht erwartet.
	AI_Output(hero, self, "Info_Mod_Shivar_Eisgebiet_15_01"); //Was geht hier vor?
	AI_Output(self, hero, "Info_Mod_Shivar_Eisgebiet_20_02"); //Ich bereite mit Kreaturen Beliars den Angriff auf die Dämonen des Magiers Xeres vor, die sich nicht weit von hier gesammelt haben ...
	AI_Output(self, hero, "Info_Mod_Shivar_Eisgebiet_20_03"); //Nun, mit deinem Eintreffen erhöht sich unsere Zahl und Schlagkraft.
	AI_Output(self, hero, "Info_Mod_Shivar_Eisgebiet_20_04"); //Wir können jede Hilfe gebrauchen, denn der Büffeldämon, der die Kreaturen anführt, ist mir fast ebenbürtig.
	AI_Output(self, hero, "Info_Mod_Shivar_Eisgebiet_20_05"); //Und zu dem kamen mir Gerüchte zu Ohren, dass kein Dämon in der Lage sei, ihn zu bannen.
	AI_Output(self, hero, "Info_Mod_Shivar_Eisgebiet_20_06"); //Nun, das werden wir jetzt auf die Probe stellen.
	AI_Output(self, hero, "Info_Mod_Shivar_Eisgebiet_20_07"); //(zu seinen Kreaturen) Macht euch kampfbereit, Kreaturen Beliars. Jetzt ist der Zeitpunkt loszuschlagen und die Verräter zu strafen. Für Beliar!

	AI_StopProcessInfos	(self);

	/*
	B_StartOtherRoutine	(self, "ANGRIFF");
	B_StartOtherRoutine	(Monster_11041_Demon_EIS, "ANGRIFF");
	B_StartOtherRoutine	(Monster_11042_Demon_EIS, "ANGRIFF");
	B_StartOtherRoutine	(Monster_11043_Demon_EIS, "ANGRIFF");
	B_StartOtherRoutine	(Monster_11044_Schrat_EIS, "ANGRIFF");
	B_StartOtherRoutine	(Monster_11045_Schrat_EIS, "ANGRIFF");
	B_StartOtherRoutine	(Monster_11046_Schrat_EIS, "ANGRIFF");
	*/
};

INSTANCE Info_Mod_Shivar_MahishaDead (C_INFO)
{
	npc		= Monster_11039_Shivar_EIS;
	nr		= 1;
	condition	= Info_Mod_Shivar_MahishaDead_Condition;
	information	= Info_Mod_Shivar_MahishaDead_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Shivar_MahishaDead_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Shivar_Eisgebiet))
	&& (Npc_IsDead(Monster_11040_Mahisha_EIS))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shivar_MahishaDead_Info()
{
	AI_Output(self, hero, "Info_Mod_Shivar_MahishaDead_20_00"); //Es ist vollbracht und die Feinde zerschmettert. Welch Wohltat, huahaha ...
	AI_Output(self, hero, "Info_Mod_Shivar_MahishaDead_20_01"); //Was mich aber verwundert ist die Tatsache, dass seine Dämonenaura erst durch dein Einwirken nun vollständig zu erlischen beginnt.
	AI_Output(hero, self, "Info_Mod_Shivar_MahishaDead_15_02"); //Tja, nun ...
	AI_Output(self, hero, "Info_Mod_Shivar_MahishaDead_20_03"); //Was bei Beliar ...
	AI_Output(hero, self, "Info_Mod_Shivar_MahishaDead_15_04"); //(zu sich selbst) Ohh, verdammt, nicht mehr genug Dämonenaura ...
	AI_Output(self, hero, "Info_Mod_Shivar_MahishaDead_20_05"); //(entsetzt) Du ... du bist ja gar kein Dämon, nur Täuschung.
	AI_Output(hero, self, "Info_Mod_Shivar_MahishaDead_15_06"); //Ähhm, es war notwendig ...
	AI_Output(self, hero, "Info_Mod_Shivar_MahishaDead_20_07"); //(unterbricht) Schweig! (überlegt) Nun, also daher vermochtest nur du Mahisha den Todesstoß zu versetzen.
	AI_Output(self, hero, "Info_Mod_Shivar_MahishaDead_20_08"); //(zum Helden) Nun, ich bin bereit dir deinen Frevel zu verzeihen ...
	AI_Output(self, hero, "Info_Mod_Shivar_MahishaDead_20_09"); //Und nun ... geh. Zu viel Zeit will ich mit euch gewöhnlichen Sterblichen auch nicht zubringen. Beliar sei mit dir.

	B_GivePlayerXP	(500);

	Mod_HeroDemonCounter = 10;

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "TOT");
	B_StartOtherRoutine	(self, "TOT");

	AI_Teleport	(Monster_11041_Demon_EIS, "TOT");
	B_StartOtherRoutine	(Monster_11041_Demon_EIS, "TOT");

	AI_Teleport	(Monster_11042_Demon_EIS, "TOT");
	B_StartOtherRoutine	(Monster_11042_Demon_EIS, "TOT");

	AI_Teleport	(Monster_11043_Demon_EIS, "TOT");
	B_StartOtherRoutine	(Monster_11043_Demon_EIS, "TOT");

	AI_Teleport	(Monster_11044_Schrat_EIS, "TOT");
	B_StartOtherRoutine	(Monster_11044_Schrat_EIS, "TOT");

	AI_Teleport	(Monster_11045_Schrat_EIS, "TOT");
	B_StartOtherRoutine	(Monster_11045_Schrat_EIS, "TOT");

	AI_Teleport	(Monster_11046_Schrat_EIS, "TOT");
	B_StartOtherRoutine	(Monster_11046_Schrat_EIS, "TOT");
};