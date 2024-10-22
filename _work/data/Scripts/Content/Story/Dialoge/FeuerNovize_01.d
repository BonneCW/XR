INSTANCE Info_Mod_FeuerNovize_Hi (C_INFO)
{
	npc		= Mod_7193_NOV_Novize_NW;
	nr		= 1;
	condition	= Info_Mod_FeuerNovize_Hi_Condition;
	information	= Info_Mod_FeuerNovize_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was tust du da?";
};

FUNC INT Info_Mod_FeuerNovize_Hi_Condition()
{
	if (WM_Boden_09 == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_FeuerNovize_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_FeuerNovize_Hi_15_00"); //Was tust du da?
	AI_Output(self, hero, "Info_Mod_FeuerNovize_Hi_13_01"); //(arroganter Tonfall) Stör mich nicht. Ich wirke den Segen meines Herrn Innos auf diese profane Umgebung.
	AI_Output(hero, self, "Info_Mod_FeuerNovize_Hi_15_02"); //Ich meinerseits bin ein Diener Adanos und hier, um dich darum zu bitten, diesen Vorgang einzustellen. Es schadet dem ...
	AI_Output(self, hero, "Info_Mod_FeuerNovize_Hi_13_03"); //(abfällig) Pääh, du willst mir doch nicht, einem Diener Innos, gebieten, was er zu tun hat.
	AI_Output(self, hero, "Info_Mod_FeuerNovize_Hi_13_04"); //Und jetzt verschwinde und stör mich nicht weiter, bei meinem heiligen Werk.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_FeuerNovize_Entweihung (C_INFO)
{
	npc		= Mod_7193_NOV_Novize_NW;
	nr		= 1;
	condition	= Info_Mod_FeuerNovize_Entweihung_Condition;
	information	= Info_Mod_FeuerNovize_Entweihung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_FeuerNovize_Entweihung_Condition()
{
	if (WM_Boden_09 == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_FeuerNovize_Entweihung_Info()
{
	AI_Output(self, hero, "Info_Mod_FeuerNovize_Entweihung_13_00"); //(aufgebracht) Was tust du?! Du Trampel zerstörst mein Werk. Warte, dir komme ich schon bei.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	B_Attack	(self, hero, AR_Kill, 0);
};

INSTANCE Info_Mod_FeuerNovize_EXIT (C_INFO)
{
	npc		= Mod_7193_NOV_Novize_NW;
	nr		= 1;
	condition	= Info_Mod_FeuerNovize_EXIT_Condition;
	information	= Info_Mod_FeuerNovize_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_FeuerNovize_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_FeuerNovize_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};