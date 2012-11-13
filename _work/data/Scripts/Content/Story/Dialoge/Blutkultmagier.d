INSTANCE Info_Mod_Blutkultmagier_Hi (C_INFO)
{
	npc		= Mod_4097_BlutkultMagier_NW;
	nr		= 1;
	condition	= Info_Mod_Blutkultmagier_Hi_Condition;
	information	= Info_Mod_Blutkultmagier_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Blutkultmagier_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Blutkultmagier_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Blutkultmagier_Hi_13_00"); //Ahhh. Seht, wer gekommen ist. Der Mensch, der den Schlüssel holen will, um die Wassermagier vor der Garde Innos' zu retten.
	AI_Output(hero, self, "Info_Mod_Blutkultmagier_Hi_15_01"); //Woher weißt du das?
	AI_Output(self, hero, "Info_Mod_Blutkultmagier_Hi_13_02"); //(lacht) Du Narr. Die Garde und wir haben einen Pakt geschlossen. Wir unterstützen sie und sie dezimieren im Gegenzug die armseligen Streiter Adanos’ und eröffnen uns zudem den Zugang zu Opfern für unsere blutigen Rituale.
	AI_Output(self, hero, "Info_Mod_Blutkultmagier_Hi_13_03"); //Wir haben für sie den Schlüssel gestohlen und der Rest wird mit ihnen Innos' Schwert bergen. Ich werde dich aufhalten, damit du nicht dazwischen funkst.
	AI_Output(hero, self, "Info_Mod_Blutkultmagier_Hi_15_04"); //Komm her.
	AI_Output(self, hero, "Info_Mod_Blutkultmagier_Hi_13_05"); //Schon bald wird dein Kopf auf einem Tablett der Garde serviert werden. STIRB, UNGLÄUBIGER!

	AI_StopProcessInfos	(self);

	Mod_4092_BlutkultKrieger_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_4092_BlutkultKrieger_NW, GIL_STRF);

	Mod_4093_BlutkultKrieger_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_4093_BlutkultKrieger_NW, GIL_STRF);

	Mod_4094_BlutkultKrieger_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_4094_BlutkultKrieger_NW, GIL_STRF);

	Mod_4095_BlutkultKrieger_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_4095_BlutkultKrieger_NW, GIL_STRF);

	Mod_4096_BlutkultKrieger_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_4096_BlutkultKrieger_NW, GIL_STRF);

	Mod_4097_BlutkultMagier_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_4097_BlutkultMagier_NW, GIL_STRF);
};