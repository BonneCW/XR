INSTANCE Info_Mod_Regis_Hi (C_INFO)
{
	npc		= Mod_530_NONE_Regis_NW;
	nr		= 1;
	condition	= Info_Mod_Regis_Hi_Condition;
	information	= Info_Mod_Regis_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Regis_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Regis_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Regis_Hi_13_01"); //Ich bin Regis. Ich weiß am besten bescheid, was hier in der Stadt passiert.
};

INSTANCE Info_Mod_Regis_Paladine (C_INFO)
{
	npc		= Mod_530_NONE_Regis_NW;
	nr		= 1;
	condition	= Info_Mod_Regis_Paladine_Condition;
	information	= Info_Mod_Regis_Paladine_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was weißt du über die Paladine?";
};

FUNC INT Info_Mod_Regis_Paladine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Regis_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Regis_Paladine_Info()
{
	AI_Output(hero, self, "Info_Mod_Regis_Paladine_15_00"); //Was weißt du über die Paladine?
	AI_Output(self, hero, "Info_Mod_Regis_Paladine_13_01"); //Zuerst kamen sie nur gelegentlich nach Khorinis um einen Gefangenen in die Strafkolonie zu werfen oder um mit den Sträflingen zu verhandeln.
	AI_Output(self, hero, "Info_Mod_Regis_Paladine_13_02"); //Doch nachdem die Barriere zusammengebrochen ist, hat der König einen Trupp hierher geschickt, um die Stadt zu beschüzen.
	AI_Output(self, hero, "Info_Mod_Regis_Paladine_13_03"); //Seitdem haben sie die Kontrolle über die Stadt übernommen. Sie befürchten das die Söldner aus dem Minental die Stadt einnehmen.
	AI_Output(self, hero, "Info_Mod_Regis_Paladine_13_04"); //Der Anführer der Söldner soll damals ein Problem mit dem König gehabt haben und ist deswegen gegen die Paladine und versucht sie mit seinen Söldnern auszuschalten, um mit dem Paladinschiff nach Myrtana zu segeln und sich am König zu rächen.
};

INSTANCE Info_Mod_Regis_MehrPaladine (C_INFO)
{
	npc		= Mod_530_NONE_Regis_NW;
	nr		= 1;
	condition	= Info_Mod_Regis_MehrPaladine_Condition;
	information	= Info_Mod_Regis_MehrPaladine_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir noch mehr über die Paladine erzählen?";
};

FUNC INT Info_Mod_Regis_MehrPaladine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Regis_Paladine))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Regis_MehrPaladine_Info()
{
	AI_Output(hero, self, "Info_Mod_Regis_MehrPaladine_15_00"); //Kannst du mir mehr über die Paladine erzählen?
	AI_Output(self, hero, "Info_Mod_Regis_MehrPaladine_13_01"); //Ich hab dir alles gesagt was ich weiß.
	AI_Output(self, hero, "Info_Mod_Regis_MehrPaladine_13_02"); //Wenn du mehr erfahren willst, dann solltest du mit den Paladinen im Oberen Viertel sprechen.
};

INSTANCE Info_Mod_Regis_Flugblaetter (C_INFO)
{
	npc		= Mod_530_NONE_Regis_NW;
	nr		= 1;
	condition	= Info_Mod_Regis_Flugblaetter_Condition;
	information	= Info_Mod_Regis_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Regis_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 10)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Regis_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Regis_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");
	
	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Regis_Flugblaetter_13_01"); //Danke, für das Blatt ... auch, wenn ich ja sowieso schon den ganzen Tag vor seinem Laden herumsitze.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Regis_Pickpocket (C_INFO)
{
	npc		= Mod_530_NONE_Regis_NW;
	nr		= 1;
	condition	= Info_Mod_Regis_Pickpocket_Condition;
	information	= Info_Mod_Regis_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Regis_Pickpocket_Condition()
{
	C_Beklauen	(56, ItMi_Gold, 170);
};

FUNC VOID Info_Mod_Regis_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Regis_Pickpocket);

	Info_AddChoice	(Info_Mod_Regis_Pickpocket, DIALOG_BACK, Info_Mod_Regis_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Regis_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Regis_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Regis_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Regis_Pickpocket);
};

FUNC VOID Info_Mod_Regis_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Regis_Pickpocket);
};

INSTANCE Info_Mod_Regis_EXIT (C_INFO)
{
	npc		= Mod_530_NONE_Regis_NW;
	nr		= 1;
	condition	= Info_Mod_Regis_EXIT_Condition;
	information	= Info_Mod_Regis_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Regis_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Regis_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};