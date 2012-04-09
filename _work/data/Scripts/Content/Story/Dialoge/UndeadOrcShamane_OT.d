INSTANCE Info_Mod_UndeadOrcShamane_OT_Hi (C_INFO)
{
	npc		= Mod_10039_ORC_UndeadShamane_OT;
	nr		= 1;
	condition	= Info_Mod_UndeadOrcShamane_OT_Hi_Condition;
	information	= Info_Mod_UndeadOrcShamane_OT_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_UndeadOrcShamane_OT_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_UndeadOrcShamane_OT_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_UndeadOrcShamane_OT_Hi_18_00"); //Zu spät du bist hier.
	AI_Output(self, hero, "Info_Mod_UndeadOrcShamane_OT_Hi_18_01"); //Das Schwert, dass die Macht der drei Götter vereint, es ist gebrochen in Stücke ... so wie ich nun deinen Leib zerschmettern werde.
	AI_Output(hero, self, "Info_Mod_UndeadOrcShamane_OT_Hi_15_02"); //Das wird einer vertrockneten Leiche wie dir gewiss nicht gelingen ... genauso wenig, wie bei unserer ersten Begegnung.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};