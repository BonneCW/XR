INSTANCE Info_Mod_Entfuehrer_Pisser_Hi (C_INFO)
{
	npc		= Mod_7030_OUT_Entfuehrer_NW;
	nr		= 1;
	condition	= Info_Mod_Entfuehrer_Pisser_Hi_Condition;
	information	= Info_Mod_Entfuehrer_Pisser_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Entfuehrer_Pisser_Hi_Condition()
{
	if (Npc_GetDistToWP(self, "WP_PINKELPAUSE") < 400)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Entfuehrer_Pisser_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Entfuehrer_Pisser_Hi_01_00"); //Halt! Was willst du von mir?

	Info_ClearChoices	(Info_Mod_Entfuehrer_Pisser_Hi);

	Info_AddChoice	(Info_Mod_Entfuehrer_Pisser_Hi, "Ich wollte dich bloß umbringen.", Info_Mod_Entfuehrer_Pisser_Hi_B);
	Info_AddChoice	(Info_Mod_Entfuehrer_Pisser_Hi, "Ich wollte dich fragen, ob du mir beim Blümchenpflücken hilfst.", Info_Mod_Entfuehrer_Pisser_Hi_A);
};

FUNC VOID Info_Mod_Entfuehrer_Pisser_Hi_C()
{
	AI_Output(self, hero, "Info_Mod_Entfuehrer_Pisser_Hi_C_01_00"); //Du bist derjenige, den wir suchen. Ich könnte jetzt laut rufen und dich angreifen. Du hättest keine Chance.
	AI_Output(hero, self, "Info_Mod_Entfuehrer_Pisser_Hi_C_15_01"); //Und warum tust du's nicht?
	AI_Output(self, hero, "Info_Mod_Entfuehrer_Pisser_Hi_C_01_02"); //Ich habe drei Kinder zu ernähren, und mit einem Schwert in der Brust lässt es sich schwer Geld verdienen.
	AI_Output(self, hero, "Info_Mod_Entfuehrer_Pisser_Hi_C_01_03"); //Ich schlage dir vor, du lässt mich laufen, und ich werde keine Hilfe rufen.

	Info_ClearChoices	(Info_Mod_Entfuehrer_Pisser_Hi);

	Info_AddChoice	(Info_Mod_Entfuehrer_Pisser_Hi, "Nein, ich kann dich nicht am Leben lassen.", Info_Mod_Entfuehrer_Pisser_Hi_E);
	Info_AddChoice	(Info_Mod_Entfuehrer_Pisser_Hi, "Einverstanden. Hau schon ab!", Info_Mod_Entfuehrer_Pisser_Hi_D);
};

FUNC VOID Info_Mod_Entfuehrer_Pisser_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Entfuehrer_Pisser_Hi_B_15_00"); //Ich wollte dich bloß umbringen.

	Info_Mod_Entfuehrer_Pisser_Hi_C();
};

FUNC VOID Info_Mod_Entfuehrer_Pisser_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Entfuehrer_Pisser_Hi_A_15_00"); //Ich wollte dich fragen, ob du mir beim Blümchenpflücken hilfst.
	AI_Output(self, hero, "Info_Mod_Entfuehrer_Pisser_Hi_A_01_01"); //(ungerührt) Haha. (Pause)

	Info_Mod_Entfuehrer_Pisser_Hi_C();
};

FUNC VOID Info_Mod_Entfuehrer_Pisser_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Entfuehrer_Pisser_Hi_E_15_00"); //Nein, ich kann dich nicht am Leben lassen.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Entfuehrer_Pisser_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

FUNC VOID Info_Mod_Entfuehrer_Pisser_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Entfuehrer_Pisser_Hi_D_15_00"); //Einverstanden. Hau schon ab!
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Entfuehrer_Pisser_Hi);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FLUCHT");

	B_GivePlayerXP	(100);

	Mod_ValentineKill03 = 2;
};