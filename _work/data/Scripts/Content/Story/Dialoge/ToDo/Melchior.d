INSTANCE Info_Mod_Melchior_Hi (C_INFO)
{
	npc		= Mod_7754_OUT_Melchior_EIS;
	nr		= 1;
	condition	= Info_Mod_Melchior_Hi_Condition;
	information	= Info_Mod_Melchior_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Melchior_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Marcus_UntoteOrks2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Melchior_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Melchior_Hi_10_00"); //Endlich ist die Verstärkung da. Ich habe schon geglaubt, der Kommander hätte mich vergessen.
	AI_Output(hero, self, "Info_Mod_Melchior_Hi_15_01"); //Eigentlich sollst du mich Verstärken. Ich brauch jemanden, der die Orks verhören kann. Du sprichst doch ihre Sprache?!
	AI_Output(self, hero, "Info_Mod_Melchior_Hi_10_02"); //Ja, aber alle Orks hier in der Gegend sind untot. Sie haben meinen Freund Jacoby im Wald erschlagen.
	AI_Output(self, hero, "Info_Mod_Melchior_Hi_10_03"); //Es waren so viele, dass ich fliehen musste. Ich glaube nicht, dass wir sie befragen können.
	AI_Output(hero, self, "Info_Mod_Melchior_Hi_15_04"); //Ihre Anführer sind aber immer noch lebendig. Es muss doch einen geben, der ein wenig von der Masse getrennt ist.
	AI_Output(self, hero, "Info_Mod_Melchior_Hi_10_05"); //Da gibt es einen. Er entsendet von einer alten Ruine seine Spähtruppen ins Eisgebiet.
	AI_Output(hero, self, "Info_Mod_Melchior_Hi_15_06"); //Marcus wird für dich hier übernehmen und du zeigst mir diese Ruine.

	B_StartOtherRoutine	(self, "GUIDETORUINE");
	B_StartOtherRoutine	(Mod_7754_OUT_Melchior_EIS, "ATMELCHIOR");
};

INSTANCE Info_Mod_Melchior_EXIT (C_INFO)
{
	npc		= Mod_7754_OUT_Melchior_EIS;
	nr		= 1;
	condition	= Info_Mod_Melchior_EXIT_Condition;
	information	= Info_Mod_Melchior_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Melchior_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Melchior_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};