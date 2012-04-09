INSTANCE Info_Mod_Velaya_Hi (C_INFO)
{
	npc		= Mod_1621_EBR_Velaya_MT;
	nr		= 1;
	condition	= Info_Mod_Velaya_Hi_Condition;
	information	= Info_Mod_Velaya_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Falls du diesen Ort verlassen willst, zieh das hier über und folge mir.";
};

FUNC INT Info_Mod_Velaya_Hi_Condition()
{
	if (Mod_SLD_Nebel == 1)
	&& (Npc_HasItems(hero, ItAr_WomanCape) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Velaya_Hi_15_00"); //Falls du diesen Ort verlassen willst, zieh das hier über und folge mir.

	B_GiveInvItems	(hero, self, ItAr_WomanCape, 1);

	AI_Output(self, hero, "Info_Mod_Velaya_Hi_17_01"); //Endlich hier weg? Nichts lieber als das.

	AI_EquipArmor	(self, ItAr_WomanCape);

	Mod_SLD_Nebel = 2;

	Wld_SendUntrigger	("MT_NEBEL_01");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWOUTOFOC");
};

INSTANCE Info_Mod_Velaya_AusLager (C_INFO)
{
	npc		= Mod_1621_EBR_Velaya_MT;
	nr		= 1;
	condition	= Info_Mod_Velaya_AusLager_Condition;
	information	= Info_Mod_Velaya_AusLager_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Velaya_AusLager_Condition()
{
	if (Mod_SLD_Nebel == 2)
	&& (Npc_GetDistToWP(self, "WP_MT_JACKAL_BEFREIUNG") > 10000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_AusLager_Info()
{
	AI_UnEquipArmor	(self);

	Npc_RemoveInvItems	(self, ItAr_WomanCape, 1);

	AI_Output(self, hero, "Info_Mod_Velaya_AusLager_17_00"); //(überglücklich) Endlich diesem verfluchten Lager entkommen, juchu, jippieh. Und jetzt dieses Tal verlassen.
	
	Info_ClearChoices	(Info_Mod_Velaya_AusLager);

	Info_AddChoice	(Info_Mod_Velaya_AusLager, "Selbstverständlich, gehen wir.", Info_Mod_Velaya_AusLager_B);
	Info_AddChoice	(Info_Mod_Velaya_AusLager, "Nein, jetzt gehen wir ins Neue Lager.", Info_Mod_Velaya_AusLager_A);
};

FUNC VOID Info_Mod_Velaya_AusLager_B()
{
	AI_Output(hero, self, "Info_Mod_Velaya_AusLager_B_15_00"); //Selbstverständlich, gehen wir.
	AI_Output(self, hero, "Info_Mod_Velaya_AusLager_B_17_01"); //Na dann los. Bleib aber in meiner Nähe.

	Info_ClearChoices	(Info_Mod_Velaya_AusLager);

	Mod_SLD_Velaya = 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDING");
};

FUNC VOID Info_Mod_Velaya_AusLager_A()
{
	AI_Output(hero, self, "Info_Mod_Velaya_AusLager_A_15_00"); //Nein, jetzt gehen wir ins Neue Lager.
	AI_Output(self, hero, "Info_Mod_Velaya_AusLager_A_17_01"); //Was?! Auf keinen Fall.

	Info_ClearChoices	(Info_Mod_Velaya_AusLager);

	Mod_SLD_Velaya = 2;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "PASS");
};

INSTANCE Info_Mod_Velaya_Umgehauen (C_INFO)
{
	npc		= Mod_1621_EBR_Velaya_MT;
	nr		= 1;
	condition	= Info_Mod_Velaya_Umgehauen_Condition;
	information	= Info_Mod_Velaya_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Velaya_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Velaya_AusLager))
	&& (Mod_SLD_Velaya == 2)
	&& (self.attribute[ATR_HITPOINTS] < 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_Umgehauen_Info()
{
	AI_Output(self, hero, "Info_Mod_Velaya_Umgehauen_17_00"); //Du Schuft ...
	AI_Output(hero, self, "Info_Mod_Velaya_Umgehauen_15_01"); //Na, immer noch bockig. Los, du folgst mir jetzt.

	Mod_SLD_Velaya = 3;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTONL");

	self.aivar[AIV_ArenaFight] = AF_NONE;
		
	// ------ AIVAR resetten! ------	
	self.aivar[AIV_LastFightComment] = TRUE;

	B_Göttergefallen (3, 1);
};

INSTANCE Info_Mod_Velaya_Unterwegs (C_INFO)
{
	npc		= Mod_1621_EBR_Velaya_MT;
	nr		= 1;
	condition	= Info_Mod_Velaya_Unterwegs_Condition;
	information	= Info_Mod_Velaya_Unterwegs_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Velaya_Unterwegs_Condition()
{
	if (Mod_SLD_Velaya == 1)
	&& (Npc_IsInState(self, ZS_Talk))
	&& (Npc_GetDistToWP(self, "OW_PATH_1_16_8") > 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_Unterwegs_Info()
{
	Info_ClearChoices	(Info_Mod_Velaya_Unterwegs);

	Info_AddChoice	(Info_Mod_Velaya_Unterwegs, "Ich habe es mir anders überlegt.", Info_Mod_Velaya_Unterwegs_B);
	Info_AddChoice	(Info_Mod_Velaya_Unterwegs, "Gehen wir weiter.", Info_Mod_Velaya_Unterwegs_A);
};

FUNC VOID Info_Mod_Velaya_Unterwegs_B()
{
	AI_Output(hero, self, "Info_Mod_Velaya_Unterwegs_B_15_00"); //Ich habe es mir anders überlegt. Wir gehen ins neue Lager.
	AI_Output(self, hero, "Info_Mod_Velaya_Unterwegs_B_17_01"); //Niemals!

	Info_ClearChoices	(Info_Mod_Velaya_Unterwegs);

	Mod_SLD_Velaya = 2;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "PASS");
};

FUNC VOID Info_Mod_Velaya_Unterwegs_A()
{
	AI_Output(hero, self, "Info_Mod_Velaya_Unterwegs_A_15_00"); //Gehen wir weiter.

	Info_ClearChoices	(Info_Mod_Velaya_Unterwegs);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Velaya_AtPass (C_INFO)
{
	npc		= Mod_1621_EBR_Velaya_MT;
	nr		= 1;
	condition	= Info_Mod_Velaya_AtPass_Condition;
	information	= Info_Mod_Velaya_AtPass_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Velaya_AtPass_Condition()
{
	if (Mod_SLD_Velaya == 1)
	&& (Npc_GetDistToWP(self, "OW_PATH_1_16_8") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_AtPass_Info()
{
	AI_Output(self, hero, "Info_Mod_Velaya_AtPass_17_00"); //Ab hier schaffe ich es dann allein. Wie kann ich dir nur danken ... Aber halt, da fällt mir doch was ein.
	AI_Output(self, hero, "Info_Mod_Velaya_AtPass_17_01"); //Seitdem irgendjemand alle Truhen im Haus der Erzbarone leer geräumt hat, wurden die Schätze und Reichtümer an verschiedenen geheimen Stellen im Haus deponiert.
	AI_Output(self, hero, "Info_Mod_Velaya_AtPass_17_02"); //Eine davon – so habe ich einmal beobachtet – ist im Kamin von Bartholos Zimmer. Unterhalb der Asche ist ein kleines Versteck. Da solltest du fündig werden.
	AI_Output(self, hero, "Info_Mod_Velaya_AtPass_17_03"); //Aber lass dich nicht erwischen. Und pass auf dich auf.

	B_GivePlayerXP	(450);

	MOBNAME_XR_ERZBARONVELAYA = "Versteck im Kamin";

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FLUCHT");

	Mod_VelayaFrei = TRUE;

	B_Göttergefallen (1, 1);
};

INSTANCE Info_Mod_Velaya_EXIT (C_INFO)
{
	npc		= Mod_1621_EBR_Velaya_MT;
	nr		= 1;
	condition	= Info_Mod_Velaya_EXIT_Condition;
	information	= Info_Mod_Velaya_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Velaya_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Velaya_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};