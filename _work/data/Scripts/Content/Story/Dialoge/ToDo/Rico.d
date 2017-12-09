INSTANCE Info_Mod_Rico_Hi (C_INFO)
{
	npc		= Mod_4017_EIS_Rico_EIS;
	nr		= 1;
	condition	= Info_Mod_Rico_Hi_Condition;
	information	= Info_Mod_Rico_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rico_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rico_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Rico_Hi_04_00"); //Komm näher, Fremder.

	Info_ClearChoices	(Info_Mod_Rico_Hi);

	Info_AddChoice	(Info_Mod_Rico_Hi, "Was gibt’s denn?", Info_Mod_Rico_Hi_B);
	Info_AddChoice	(Info_Mod_Rico_Hi, "Und wenn nicht?", Info_Mod_Rico_Hi_A);
};

FUNC VOID Info_Mod_Rico_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Rico_Hi_B_15_00"); //Was gibt’s denn?
	AI_Output(self, hero, "Info_Mod_Rico_Hi_B_04_01"); //Du bist doch sicherlich an einem guten Geschäft interessiert, oder nicht?

	Info_ClearChoices	(Info_Mod_Rico_Hi);

	Info_AddChoice	(Info_Mod_Rico_Hi, "Worum geht’s dabei?", Info_Mod_Rico_Hi_D);
	Info_AddChoice	(Info_Mod_Rico_Hi, "Natürlich.", Info_Mod_Rico_Hi_C);
};

FUNC VOID Info_Mod_Rico_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Rico_Hi_A_15_00"); //Und wenn nicht?
	AI_Output(self, hero, "Info_Mod_Rico_Hi_A_04_01"); //Jeder ist seines eigenen Glückes Schmied.

	Info_ClearChoices	(Info_Mod_Rico_Hi);

	Info_AddChoice	(Info_Mod_Rico_Hi, "Was gibt’s denn?", Info_Mod_Rico_Hi_B);
	Info_AddChoice	(Info_Mod_Rico_Hi, "Ich gehe dann mal lieber.", Info_Mod_Rico_Hi_H);
};

FUNC VOID Info_Mod_Rico_Hi_H()
{
	AI_Output(hero, self, "Info_Mod_Rico_Hi_H_15_00"); //Ich gehe dann mal lieber.
	AI_Output(self, hero, "Info_Mod_Rico_Hi_H_04_01"); //Das ist eine verpasste Chance!

	Info_ClearChoices	(Info_Mod_Rico_Hi);

	Info_AddChoice	(Info_Mod_Rico_Hi, "Was gibt’s denn?", Info_Mod_Rico_Hi_B);
	Info_AddChoice	(Info_Mod_Rico_Hi, "ENDE", Info_Mod_Rico_Hi_I);
};

FUNC VOID Info_Mod_Rico_Hi_I()
{
	Info_ClearChoices	(Info_Mod_Rico_Hi);
};

FUNC VOID Info_Mod_Rico_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Rico_Hi_D_15_00"); //Worum geht’s dabei?
	AI_Output(self, hero, "Info_Mod_Rico_Hi_D_04_01"); //Also bist du dabei?

	Info_ClearChoices	(Info_Mod_Rico_Hi);

	Info_AddChoice	(Info_Mod_Rico_Hi, "Das ist nichts für mich.", Info_Mod_Rico_Hi_E);
	Info_AddChoice	(Info_Mod_Rico_Hi, "Natürlich.", Info_Mod_Rico_Hi_C);
};

FUNC VOID Info_Mod_Rico_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Rico_Hi_E_15_00"); //Das ist nichts für mich.
	AI_Output(self, hero, "Info_Mod_Rico_Hi_E_04_01"); //Das ist eine verpasste Chance!

	Info_ClearChoices	(Info_Mod_Rico_Hi);

	Info_AddChoice	(Info_Mod_Rico_Hi, "Worum geht es?", Info_Mod_Rico_Hi_G);
	Info_AddChoice	(Info_Mod_Rico_Hi, "Ich lasse es lieber.", Info_Mod_Rico_Hi_F);
};

FUNC VOID Info_Mod_Rico_Hi_J()
{
	AI_Output(self, hero, "Info_Mod_Rico_Hi_J_04_00"); //Sehr gut. Ich kenne da jemanden, der einen wertvollen Gürtel besitzt. Er ist so reich, dass er fast schon stinkt.
	AI_Output(self, hero, "Info_Mod_Rico_Hi_J_04_01"); //Wollen wir ihn nicht von seiner schweren Last befreien?

	Info_ClearChoices	(Info_Mod_Rico_Hi);

	Info_AddChoice	(Info_Mod_Rico_Hi, "Das ist nichts für mich.", Info_Mod_Rico_Hi_L);
	Info_AddChoice	(Info_Mod_Rico_Hi, "Das ist eine gute Idee.", Info_Mod_Rico_Hi_K);
};

FUNC VOID Info_Mod_Rico_Hi_L()
{
	AI_Output(hero, self, "Info_Mod_Rico_Hi_L_15_00"); //Das ist nichts für mich.
	AI_Output(self, hero, "Info_Mod_Rico_Hi_L_04_01"); //Das ist eine verpasste Chance!

	Info_ClearChoices	(Info_Mod_Rico_Hi);

	Info_AddChoice	(Info_Mod_Rico_Hi, "Okay, ich mach's.", Info_Mod_Rico_Hi_N);
	Info_AddChoice	(Info_Mod_Rico_Hi, "Ich lasse mich auf so etwas nicht ein.", Info_Mod_Rico_Hi_M);
};

FUNC VOID Info_Mod_Rico_Hi_P()
{
	AI_Output(self, hero, "Info_Mod_Rico_Hi_P_04_00"); //Du gefällst mir. Folge mir.

	Info_ClearChoices	(Info_Mod_Rico_Hi);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDE");
};

FUNC VOID Info_Mod_Rico_Hi_O()
{
	AI_Output(self, hero, "Info_Mod_Rico_Hi_O_04_00"); //Wie du willst.

	Info_ClearChoices	(Info_Mod_Rico_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Rico_Hi_N()
{
	AI_Output(hero, self, "Info_Mod_Rico_Hi_N_15_00"); //Okay, ich mach's.

	Info_Mod_Rico_Hi_P();
};

FUNC VOID Info_Mod_Rico_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Rico_Hi_C_15_00"); //Natürlich.

	Info_Mod_Rico_Hi_J();
};

FUNC VOID Info_Mod_Rico_Hi_G()
{
	AI_Output(hero, self, "Info_Mod_Rico_Hi_G_15_00"); //Worum geht es?

	Info_Mod_Rico_Hi_J();
};

FUNC VOID Info_Mod_Rico_Hi_F()
{
	AI_Output(hero, self, "Info_Mod_Rico_Hi_F_15_00"); //Ich lasse es lieber.

	Info_Mod_Rico_Hi_O();
};

FUNC VOID Info_Mod_Rico_Hi_K()
{
	AI_Output(hero, self, "Info_Mod_Rico_Hi_K_15_00"); //Das ist eine gute Idee.

	Info_Mod_Rico_Hi_P();
};

FUNC VOID Info_Mod_Rico_Hi_M()
{
	AI_Output(hero, self, "Info_Mod_Rico_Hi_M_15_00"); //Ich lasse mich auf so etwas nicht ein.

	Info_Mod_Rico_Hi_O();
};

INSTANCE Info_Mod_Rico_AtDungeon (C_INFO)
{
	npc		= Mod_4017_EIS_Rico_EIS;
	nr		= 1;
	condition	= Info_Mod_Rico_AtDungeon_Condition;
	information	= Info_Mod_Rico_AtDungeon_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rico_AtDungeon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rico_Hi))
	&& (Npc_GetDistToWP(self, "EIS_132") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rico_AtDungeon_Info()
{
	AI_Output(self, hero, "Info_Mod_Rico_AtDungeon_04_00"); //Du Idiot, wir werden dich jetzt leider umlegen.

	Info_ClearChoices	(Info_Mod_Rico_AtDungeon);

	Info_AddChoice	(Info_Mod_Rico_AtDungeon, "Dann kommt mal her!", Info_Mod_Rico_AtDungeon_B);
	Info_AddChoice	(Info_Mod_Rico_AtDungeon, "Hey, es muss doch eine friedliche Lösung geben.", Info_Mod_Rico_AtDungeon_A);
};

FUNC VOID Info_Mod_Rico_AtDungeon_B()
{
	AI_Output(hero, self, "Info_Mod_Rico_AtDungeon_B_15_00"); //Dann kommt mal her!

	AI_TurnToNpc	(self, Mod_4018_EIS_Buck_EIS);

	AI_Output(self, hero, "Info_Mod_Rico_AtDungeon_B_04_01"); //Buck! Auf geht's!

	Info_ClearChoices	(Info_Mod_Rico_AtDungeon);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_KILL, 0);
	B_Attack	(Mod_4018_EIS_Buck_EIS, hero, AR_KILL, 3);
};

FUNC VOID Info_Mod_Rico_AtDungeon_A()
{
	AI_Output(hero, self, "Info_Mod_Rico_AtDungeon_A_15_00"); //Hey, es muss doch eine friedliche Lösung geben.
	AI_Output(self, hero, "Info_Mod_Rico_AtDungeon_A_04_01"); //Dann gib uns dein ganzes Gold oder wir holen es uns.

	Info_ClearChoices	(Info_Mod_Rico_AtDungeon);

	Info_AddChoice	(Info_Mod_Rico_AtDungeon, "Hier habt ihr mein Gold, jetzt lasst mich laufen.", Info_Mod_Rico_AtDungeon_D);
	Info_AddChoice	(Info_Mod_Rico_AtDungeon, "Gibt es noch eine andere Lösung?", Info_Mod_Rico_AtDungeon_C);
};

FUNC VOID Info_Mod_Rico_AtDungeon_D()
{
	AI_Output(hero, self, "Info_Mod_Rico_AtDungeon_D_15_00"); //Hier habt ihr mein Gold, jetzt lasst mich laufen.

	B_GiveInvItems	(hero, self, ItMi_Gold, Npc_HasItems(hero, ItMi_Gold));

	AI_Output(self, hero, "Info_Mod_Rico_AtDungeon_D_04_01"); //Jetzt verschwinde.

	Info_ClearChoices	(Info_Mod_Rico_AtDungeon);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Rico_AtDungeon_C()
{
	AI_Output(hero, self, "Info_Mod_Rico_AtDungeon_C_15_00"); //Gibt es noch eine andere Lösung?
	AI_Output(self, hero, "Info_Mod_Rico_AtDungeon_C_04_01"); //Nein.

	Info_ClearChoices	(Info_Mod_Rico_AtDungeon);

	Info_AddChoice	(Info_Mod_Rico_AtDungeon, "Hier habt ihr mein Gold, jetzt lasst mich laufen.", Info_Mod_Rico_AtDungeon_D);
};

INSTANCE Info_Mod_Rico_EXIT (C_INFO)
{
	npc		= Mod_4017_EIS_Rico_EIS;
	nr		= 1;
	condition	= Info_Mod_Rico_EXIT_Condition;
	information	= Info_Mod_Rico_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Rico_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rico_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};