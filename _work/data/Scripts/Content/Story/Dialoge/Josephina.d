INSTANCE Info_Mod_Josephina_Hi (C_INFO)
{
	npc		= GardeInnos_4099_Josephina;
	nr		= 1;
	condition	= Info_Mod_Josephina_Hi_Condition;
	information	= Info_Mod_Josephina_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Josephina_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Josephina_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Josephina_Hi_17_00"); //(schrill) DU?!? WIE KOMMST DU HIERHER? DANAE MÜSSTE DICH BEREITS GETÖTET HABEN!
	AI_Output(hero, self, "Info_Mod_Josephina_Hi_15_01"); //Tja, er sieht wohl das Gras von unten.
	AI_Output(self, hero, "Info_Mod_Josephina_Hi_17_02"); //(hämisch) Egal. Danae war ein Versager. An mir wirst du scheitern, kleiner Held!
	AI_Output(hero, self, "Info_Mod_Josephina_Hi_15_03"); //Ach komm. Du meinst doch nicht ernsthaft, dass du gegen mich eine Chance hast?
	AI_Output(self, hero, "Info_Mod_Josephina_Hi_17_04"); //Hochmut kommt vor dem Fall, Sterblicher.
	AI_Output(hero, self, "Info_Mod_Josephina_Hi_15_05"); //Lass uns anfangen.
	AI_Output(self, hero, "Info_Mod_Josephina_Hi_17_06"); //(lacht) Wie du willst.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);

	AI_UnequipWeapons	(Mod_930_PIR_Bones_AW);

	Npc_RemoveInvItems	(Mod_930_PIR_Bones_AW, ItMw_BonesAxt, 100);

	B_StartOtherRoutine	(Mod_930_PIR_Bones_AW,	"BEFREIUNG");
	B_StartOtherRoutine	(Mod_775_PIR_Skip_AW,	"BEFREIUNG");
};