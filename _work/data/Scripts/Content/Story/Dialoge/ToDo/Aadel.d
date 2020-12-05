INSTANCE Info_Mod_Aadel_Hi (C_INFO)
{
	npc		= Mod_7145_ASS_Aadel_NW;
	nr		= 1;
	condition	= Info_Mod_Aadel_Hi_Condition;
	information	= Info_Mod_Aadel_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jestes Aadela?";
};

FUNC INT Info_Mod_Aadel_Hi_Condition()
{
	if (Mod_ASS_Magier == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aadel_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_00"); //Jestes Aadela?
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_01"); //Pewne. Czego chcesz?
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_02"); //Mam sie z Toba skontaktowac.
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_03"); //Mówi kto kogo?
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_04"); //Masut tak mówi. Chce byc magikiem.
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_05"); //Sluchaj, slysze, slyszysz! Kazdy mógl przyjsc.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_06"); //Nie jestem wszystkim. Przeciez przechodzilem przez jakies podstepy.
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_07"); //Oops! Uczciwie?
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_08"); //Logiczne. W przeciwnym razie nie dotarlbym tu az tak daleko.
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_09"); //To wystarczy. Sluchajcie wiec: musicie sie z nami równiez przyjrzec. Nie kazdy oszust uciekajacy moze do nas dolaczyc.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_10"); //Co wiec musze zrobic?
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_11"); //Zostan nowicjuszem.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_12"); //Co to znaczy?
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_13"); //Wykonuj male zadania dla magików. Zaoferuj pomoc. Jesli wiesz, co mam na mysli.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_14"); //Oczywiscie. A od czego zaczac?
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_15"); //Wróc tam do Kamala. To jest karczma w naszym klubie. Zawsze czegos potrzebuje.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_16"); //Na zyczenie, mistrz.
	
	B_LogEntry	(TOPIC_MOD_ASS_MAGIER, "");
};

INSTANCE Info_Mod_Aadel_Later (C_INFO)
{
	npc		= Mod_7145_ASS_Aadel_NW;
	nr		= 1;
	condition	= Info_Mod_Aadel_Later_Condition;
	information	= Info_Mod_Aadel_Later_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wracam. Cos zlego?";
};

FUNC INT Info_Mod_Aadel_Later_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kais_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Kais_Blutkelch))
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aadel_Later_Info()
{
	AI_Output(hero, self, "Info_Mod_Aadel_Later_15_00"); //Wracam. Cos zlego?
	AI_Output(self, hero, "Info_Mod_Aadel_Later_02_01"); //Zostales wyslany do doków.
	AI_Output(hero, self, "Info_Mod_Aadel_Later_15_02"); //Tego dnia nie chcial ode mnie niczego innego.
	AI_Output(self, hero, "Info_Mod_Aadel_Later_02_03"); //Byka! Potrzebuje pilnej pomocy. Idz na to!
};

INSTANCE Info_Mod_Aadel_Pickpocket (C_INFO)
{
	npc		= Mod_7145_ASS_Aadel_NW;
	nr		= 1;
	condition	= Info_Mod_Aadel_Pickpocket_Condition;
	information	= Info_Mod_Aadel_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Aadel_Pickpocket_Condition()
{
	C_Beklauen	(133, ItMi_Gold, 77);
};

FUNC VOID Info_Mod_Aadel_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

	Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_BACK, Info_Mod_Aadel_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Aadel_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Aadel_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);
};

FUNC VOID Info_Mod_Aadel_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

		Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aadel_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aadel_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aadel_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aadel_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aadel_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aadel_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Aadel_EXIT (C_INFO)
{
	npc		= Mod_7145_ASS_Aadel_NW;
	nr		= 1;
	condition	= Info_Mod_Aadel_EXIT_Condition;
	information	= Info_Mod_Aadel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Aadel_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aadel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
