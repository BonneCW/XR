INSTANCE Info_Mod_Frowin_Hi (C_INFO)
{
	npc		= GardeBeliars_1994_Frowin;
	nr		= 1;
	condition	= Info_Mod_Frowin_Hi_Condition;
	information	= Info_Mod_Frowin_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Frowin_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Frowin_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Frowin_Hi_14_00"); //Endlich bist du angekommen!
	AI_Output(hero, self, "Info_Mod_Frowin_Hi_15_01"); //Du bist der letzte der dunklen Krieger. Dich werde ich ebenfalls töten und danach die Axt sichern!
	AI_Output(self, hero, "Info_Mod_Frowin_Hi_14_02"); //Das werde ich zu verhindern wissen. Der Almanach ist jetzt nutzlos für mich. Und du wirst nicht mehr lebend hier rauskommen.
	AI_Output(hero, self, "Info_Mod_Frowin_Hi_15_03"); //Komm her!
	AI_Output(self, hero, "Info_Mod_Frowin_Hi_14_04"); //(lacht) Noch nicht!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "KRYPTA");

	AI_Teleport	(self, "BIGFARM");
};

INSTANCE Info_Mod_Frowin_HatAxt (C_INFO)
{
	npc		= GardeBeliars_1994_Frowin;
	nr		= 1;
	condition	= Info_Mod_Frowin_HatAxt_Condition;
	information	= Info_Mod_Frowin_HatAxt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Frowin_HatAxt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Frowin_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Frowin_HatAxt_Info()
{
	AI_Output(self, hero, "Info_Mod_Frowin_HatAxt_14_00"); //(lacht laut) Hahaha! Du kommst zu spät. Die Axt des Untergangs gehört mir. Ich werde sie meinem Meister übergeben, und er wird die Welt in tiefste Dunkelheit stürzen.
	AI_Output(self, hero, "Info_Mod_Frowin_HatAxt_14_01"); //Und nun, Mensch, wirst du sterben.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};