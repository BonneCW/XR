INSTANCE Info_Mod_Alwin_Hi (C_INFO)
{
	npc		= Mod_560_NONE_Alwin_NW;
	nr		= 1;
	condition	= Info_Mod_Alwin_Hi_Condition;
	information	= Info_Mod_Alwin_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Alwin_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alwin_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Alwin_Hi_12_01"); //Ich bin Alwin, Schafshirte und Metzger. Was kann ich für dich tun?
};

INSTANCE Info_Mod_Alwin_Flugblaetter (C_INFO)
{
	npc		= Mod_560_NONE_Alwin_NW;
	nr		= 1;
	condition	= Info_Mod_Alwin_Flugblaetter_Condition;
	information	= Info_Mod_Alwin_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Alwin_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Alwin_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alwin_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Alwin_Flugblaetter_12_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Alwin_Flugblaetter_12_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter +=  1;
};

INSTANCE Info_Mod_Alwin_LobartScene (C_INFO)
{
	npc		= Mod_560_NONE_Alwin_NW;
	nr		= 1;
	condition	= Info_Mod_Alwin_LobartScene_Condition;
	information	= Info_Mod_Alwin_LobartScene_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alwin_LobartScene_Condition()
{
	if (Mod_LobartAlwin == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alwin_LobartScene_Info()
{
	AI_Output(self, hero, "Info_Mod_Alwin_LobartScene_12_00"); //Was glotzt ihr so?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Alwin_LobartScene2 (C_INFO)
{
	npc		= Mod_560_NONE_Alwin_NW;
	nr		= 1;
	condition	= Info_Mod_Alwin_LobartScene2_Condition;
	information	= Info_Mod_Alwin_LobartScene2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alwin_LobartScene2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Meldor_LobartAlwinScene))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alwin_LobartScene2_Info()
{
	AI_Output(self, hero, "Info_Mod_Alwin_LobartScene2_12_00"); //Besser saufen als kiffen, du Arsch. (stöhnt) Ah, meine Birne!
	AI_Output(self, hero, "Info_Mod_Alwin_LobartScene2_12_01"); //Kann mich gar nicht erinnern, dass ich heute schon voll war.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_560_NONE_Alwin_NW, "START");
	B_StartOtherRoutine	(Mod_597_NONE_Meldor_NW, "START");
	B_StartOtherRoutine	(Mod_1041_VLK_Buergerin_NW, "START");
	B_StartOtherRoutine	(Mod_1039_VLK_Buergerin_NW, "START");
	B_StartOtherRoutine	(Mod_593_NONE_Lucy_NW, "START");
};

INSTANCE Info_Mod_Alwin_Pickpocket (C_INFO)
{
	npc		= Mod_560_NONE_Alwin_NW;
	nr		= 1;
	condition	= Info_Mod_Alwin_Pickpocket_Condition;
	information	= Info_Mod_Alwin_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Alwin_Pickpocket_Condition()
{
	C_Beklauen	(10, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Alwin_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Alwin_Pickpocket);

	Info_AddChoice	(Info_Mod_Alwin_Pickpocket, DIALOG_BACK, Info_Mod_Alwin_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Alwin_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Alwin_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Alwin_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Alwin_Pickpocket);
};

FUNC VOID Info_Mod_Alwin_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Alwin_Pickpocket);
};

INSTANCE Info_Mod_Alwin_EXIT (C_INFO)
{
	npc		= Mod_560_NONE_Alwin_NW;
	nr		= 1;
	condition	= Info_Mod_Alwin_EXIT_Condition;
	information	= Info_Mod_Alwin_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alwin_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alwin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};