INSTANCE Info_Mod_Schwarzmagier_PAT_Fokus02_Hi (C_INFO)
{
	npc		= Mod_7794_KDS_SchwarzerMagier_PAT;
	nr		= 1;
	condition	= Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_Condition;
	information	= Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_Condition()
{
	if (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToWP(self, "WP_PAT_FOKUS_01_04") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_03_00"); //Ein Roter ... ganz schön mutig. Was treibt dich hierher?

	Info_ClearChoices	(Info_Mod_Schwarzmagier_PAT_Fokus02_Hi);

	Info_AddChoice	(Info_Mod_Schwarzmagier_PAT_Fokus02_Hi, "Ich brauch diesen Fokus und werde ihn jetzt nehmen.", Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_B);
	Info_AddChoice	(Info_Mod_Schwarzmagier_PAT_Fokus02_Hi, "Auf dem Weg durch die Kristallhöhle bin ich auf einen riesigen Schatz gestoßen.", Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_A);
};

FUNC VOID Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_B_15_00"); //Ich brauch diesen Fokus und werde ihn jetzt nehmen.
	AI_Output(self, hero, "Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_B_03_01"); //Nur über meine Leiche. Komm bei, Rothaut.

	Info_ClearChoices	(Info_Mod_Schwarzmagier_PAT_Fokus02_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_KILL, 0);

	Npc_SetRefuseTalk	(self, 120);
};

FUNC VOID Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_A_15_00"); //Auf dem Weg durch die Kristallhöhle bin ich auf einen riesigen Schatz gestoßen.
	AI_Output(hero, self, "Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_A_15_01"); //Der ist aber mit irgend einem schwarzen Zauber belegt. Ich komm da einfach nicht dran.
	AI_Output(hero, self, "Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_A_15_02"); //Jetzt dachte ich, du könntest mir dabei helfen und wir machen dann Halbe/Halbe ...
	AI_Output(self, hero, "Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_A_03_03"); //Das hört sich erst mal gut an. Wo geht's lang?
	AI_Output(hero, self, "Info_Mod_Schwarzmagier_PAT_Fokus02_Hi_A_15_04"); //Folge mir. Ich bring dich hin.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Schwarzmagier_PAT_Fokus02_Hi);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");

	Npc_SetRefuseTalk	(self, 120);
};

INSTANCE Info_Mod_Schwarzmagier_PAT_Fokus02_AtHoehle (C_INFO)
{
	npc		= Mod_7794_KDS_SchwarzerMagier_PAT;
	nr		= 1;
	condition	= Info_Mod_Schwarzmagier_PAT_Fokus02_AtHoehle_Condition;
	information	= Info_Mod_Schwarzmagier_PAT_Fokus02_AtHoehle_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Schwarzmagier_PAT_Fokus02_AtHoehle_Condition()
{
	if (Npc_GetDistToWP(self, "WP_PAT_HOEHLE_WALD") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Schwarzmagier_PAT_Fokus02_AtHoehle_Info()
{
	AI_Output(hero, self, "Info_Mod_Schwarzmagier_PAT_Fokus02_AtHoehle_15_00"); //Siehst du den Gang da drüben? Da drin ist dieser Zauber und der Schatz.
	AI_Output(self, hero, "Info_Mod_Schwarzmagier_PAT_Fokus02_AtHoehle_03_01"); //Ich schau dann mal.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "HOEHLE");

	B_LogEntry	(TOPIC_MOD_FM_FOKI, "Den hab ich aber schön verarscht, listig, wie ich bin ...");

	Mod_PAT_Focus_02 = 1;
};

INSTANCE Info_Mod_Schwarzmagier_PAT_Fokus02_EXIT (C_INFO)
{
	npc		= Mod_7794_KDS_SchwarzerMagier_PAT;
	nr		= 1;
	condition	= Info_Mod_Schwarzmagier_PAT_Fokus02_EXIT_Condition;
	information	= Info_Mod_Schwarzmagier_PAT_Fokus02_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Schwarzmagier_PAT_Fokus02_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Schwarzmagier_PAT_Fokus02_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};