INSTANCE Info_Mod_Atalante_Hi (C_INFO)
{
	npc		= Mod_7678_OUT_Atalante_NW;
	nr		= 1;
	condition	= Info_Mod_Atalante_Hi_Condition;
	information	= Info_Mod_Atalante_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Atalante_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Atalante_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Atalante_Hi_16_00"); //(hechelnd) Ich werde Euch zerfetzen!
	AI_Output(hero, self, "Info_Mod_Atalante_Hi_15_01"); //Ganz ruhig, ich will dir nichts tun.
	AI_Output(self, hero, "Info_Mod_Atalante_Hi_16_02"); //(knurrt bedrohlich)
};

INSTANCE Info_Mod_Atalante_Bosper (C_INFO)
{
	npc		= Mod_7678_OUT_Atalante_NW;
	nr		= 1;
	condition	= Info_Mod_Atalante_Bosper_Condition;
	information	= Info_Mod_Atalante_Bosper_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll dir eine Nachricht von Bosper bringen.";
};

FUNC INT Info_Mod_Atalante_Bosper_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Atalante_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Atalante_Bosper_Info()
{
	AI_Output(hero, self, "Info_Mod_Atalante_Bosper_15_00"); //Ich soll dir eine Nachricht von Bosper bringen.
	AI_Output(self, hero, "Info_Mod_Atalante_Bosper_16_01"); //(heult auf) Ich will nichts davon hören! Schick ihn her, und ich werde mich seiner annehmen.
	AI_Output(hero, self, "Info_Mod_Atalante_Bosper_15_02"); //Er will dir verzeihen.
	AI_Output(self, hero, "Info_Mod_Atalante_Bosper_16_03"); //Verzeihen?! Auf seinen Knien soll er angekrochen kommen und um Vergebung flehen!
	AI_Output(hero, self, "Info_Mod_Atalante_Bosper_15_04"); //Was hat Bosper dir denn getan?
	AI_Output(self, hero, "Info_Mod_Atalante_Bosper_16_05"); //Hör auf, diesen Namen zu nennen! Er hat nur Leid über mein Leben gebracht.
	AI_Output(hero, self, "Info_Mod_Atalante_Bosper_15_06"); //Meinst du nicht, dass man darüber reden kann?
	AI_Output(self, hero, "Info_Mod_Atalante_Bosper_16_07"); //Nein, ich brauche nicht mehr zu reden. Was mir nicht gefällt, wird getötet und gefressen.
	AI_Output(self, hero, "Info_Mod_Atalante_Bosper_16_08"); //Und du gefällst mir nicht, neugieriger Mensch. Dein saftiges Fleisch wird meinen Magen füllen!

	B_LogEntry	(TOPIC_MOD_LEHRLING_BOSPER_FOUR, "Es ist mir nicht gelungen, vernünftig mit Atalante zu sprechen. Sie griff mich an, und so blieb mir nichts anderes übrig, als sie zu töten. Ich sollte Bosper die traurige Nachricht überbringen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TRANSFORM");
};