INSTANCE Info_Mod_Kurgan_Angebot (C_INFO)
{
	npc		= Mod_1000_DMR_Kurgan_NW;
	nr		= 1;
	condition	= Info_Mod_Kurgan_Angebot_Condition;
	information	= Info_Mod_Kurgan_Angebot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kurgan_Angebot_Condition()
{
	if (Hat_BuddlerNachrichtVonAL == TRUE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_XeresLebt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kurgan_Angebot_Info()
{
	AI_UnequipWeapons	(hero);

	AI_Output(self, hero, "Info_Mod_Kurgan_Angebot_10_00"); //Hey, was willst du?
	AI_Output(hero, self, "Info_Mod_Kurgan_Angebot_15_01"); //Ich komme vom Alten Lager und will Raven ein Angebot machen.
	AI_Output(self, hero, "Info_Mod_Kurgan_Angebot_10_02"); //Raven ist nicht da und hat mich solange zum Anführer der Dämonenritter gemacht.
	AI_Output(hero, self, "Info_Mod_Kurgan_Angebot_15_03"); //Das Alte Lager will euch einen Teil der Mine abkaufen, schließlich gehört sie uns rechtmäßig.
	AI_Output(self, hero, "Info_Mod_Kurgan_Angebot_10_04"); //(lacht dreckig) Unsere Mine abkaufen. Richte deinen Erzbaronen aus, dass sie darauf sehr lange warten können.
	AI_Output(hero, self, "Info_Mod_Kurgan_Angebot_15_05"); //Entweder ihr stimmt zu oder wir müssen härtere Maßnahmen ergreifen.
	AI_Output(self, hero, "Info_Mod_Kurgan_Angebot_10_06"); //Na warte, dir zeig ichs!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};