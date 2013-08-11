INSTANCE Info_Mod_Pepe_Hallo (C_INFO)
{
	npc		= Mod_793_BAU_Pepe_NW;
	nr		= 1;
	condition	= Info_Mod_Pepe_Hallo_Condition;
	information	= Info_Mod_Pepe_Hallo_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_Pepe_Hallo_Condition ()
{
	return 1;
};

FUNC VOID Info_Mod_Pepe_Hallo_Info ()
{
	B_Say	(hero, self, "$WASMACHSTDUHIER");

	AI_Output (self, hero, "Info_Mod_Pepe_Hallo_03_01"); //(gelangweilt) Schafe hüten! (seufzt) Und wenn es geht, allem Ärger aus dem Weg gehen.
};

INSTANCE Info_Mod_Pepe_Daemonisch (C_INFO)
{
	npc		= Mod_793_BAU_Pepe_NW;
	nr		= 1;
	condition	= Info_Mod_Pepe_Daemonisch_Condition;
	information	= Info_Mod_Pepe_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pepe_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pepe_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Pepe_Daemonisch_03_00"); //(panisch) Was macht du hier, was willst du? Bist du auch einer der schwarzen Schatten?
	AI_Output(hero, self, "Info_Mod_Pepe_Daemonisch_15_01"); //Jetzt beruhige dich erstmal. Was meinst du mit schwarzen Schatten?
	AI_Output(self, hero, "Info_Mod_Pepe_Daemonisch_03_02"); //(verstört)Ich meine die Ungeheuer, die nachts die Söldner im Wald gepackt hatten.
	AI_Output(self, hero, "Info_Mod_Pepe_Daemonisch_03_03"); //Sie tauchten aus dem nichts auf mit grellem kreischen.
	AI_Output(self, hero, "Info_Mod_Pepe_Daemonisch_03_04"); //Die Söldner zogen ihre Waffen und wollten gegen sie anstürmen.
	AI_Output(self, hero, "Info_Mod_Pepe_Daemonisch_03_05"); //Doch sie wurden alle von ihnen gepackt und von ihnen durchdrungen.
	AI_Output(self, hero, "Info_Mod_Pepe_Daemonisch_03_06"); //Sie brüllten, schrien und warfen sich zu Boden.
	AI_Output(self, hero, "Info_Mod_Pepe_Daemonisch_03_07"); //Einer von ihnen durchbohrte sich sogar mit seiner eigenen Waffe.
	AI_Output(self, hero, "Info_Mod_Pepe_Daemonisch_03_08"); //Ich ... ich konnte mich nicht rühren und blieb völlig regungslos beim Feuer sitzen, sah dem schrecklichen Schauspiel hilflos zu.
	AI_Output(self, hero, "Info_Mod_Pepe_Daemonisch_03_09"); //Auch, als schon alle am Boden lagen und keiner mehr eine Bewegung tat, war ich wie gelähmt ... viele Stunden.
	AI_Output(self, hero, "Info_Mod_Pepe_Daemonisch_03_10"); //Doch dann fingen sie plötzlich alle an zu zucken und zu ächzen.
	AI_Output(self, hero, "Info_Mod_Pepe_Daemonisch_03_11"); //Mich hielt nichts mehr und ich ergriff panisch die Flucht. Und seit dem verstecke ich mich hier.
	AI_Output(hero, self, "Info_Mod_Pepe_Daemonisch_15_12"); //Hmm, das ist sehr interessant, was du mir berichtest.
	AI_Output(hero, self, "Info_Mod_Pepe_Daemonisch_15_13"); //Du tust glaube ich auch gut daran dich hier noch ein Weilchen zu verstecken.
	AI_Output(self, hero, "Info_Mod_Pepe_Daemonisch_03_14"); //(etwas ruhiger) Ja ... ja, das werde ich.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Pepe hält sich versteckt und fürchtet um sein Leben. Nach seiner Aussage wurden sie nachts von schwarzen Schatten überfallen und alle Söldner zu Boden gerissen. Einer soll sich mit seiner eigenen Waffe durchbohrt haben. Er blieb paralysiert am Lagerfeuer sitzen und ergriff erst die Flucht, als die Söldner sich nach vielen Stunden zuckend wieder erhoben.");

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Pepe_Unheil (C_INFO)
{
	npc		= Mod_793_BAU_Pepe_NW;
	nr		= 1;
	condition	= Info_Mod_Pepe_Unheil_Condition;
	information	= Info_Mod_Pepe_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist dir in letzter Zeit Merkwürdiges widerfahren, Aussergewöhnliches aufgefallen – von den Ungetümen in der Umgebung abgesehen?";
};

FUNC INT Info_Mod_Pepe_Unheil_Condition()
{
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pepe_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Pepe_Unheil_15_00"); //Ist dir in letzter Zeit Merkwürdiges widerfahren, Aussergewöhnliches aufgefallen – von den Ungetümen in der Umgebung abgesehen?
	AI_Output(self, hero, "Info_Mod_Pepe_Unheil_03_01"); //Ja, allerdings. Dieses Rudel schwarzer Wölfe macht mir natürlich Kopfzerbrechen. Die Söldner hatten bereits im Wald nach ihnen gesucht, konnten aber nichts finden.
	AI_Output(self, hero, "Info_Mod_Pepe_Unheil_03_02"); //Und dann noch die gesundheitlichen Leiden meiner Schafe.
	AI_Output(self, hero, "Info_Mod_Pepe_Unheil_03_03"); //Irgendetwas scheint sie auch immer aufzuschrecken, wenn sie am Rande des Waldes an der Biegung zum Jäger Grom grasen.
	AI_Output(self, hero, "Info_Mod_Pepe_Unheil_03_04"); //Ich konnte bislang noch nichts entdecken, hatte aber einmal den Eindruck, als würde ich ein leises Ächzen von den Felsen über ihnen hören.
	AI_Output(self, hero, "Info_Mod_Pepe_Unheil_03_05"); //Hmm, Ansonsten schien es mir so, als hätte ich einige Male abends Gestalten in den Wald gehen sehen. Sehr unheimlich.
};

INSTANCE Info_Mod_Pepe_Hexen (C_INFO)
{
	npc		= Mod_793_BAU_Pepe_NW;
	nr		= 1;
	condition	= Info_Mod_Pepe_Hexen_Condition;
	information	= Info_Mod_Pepe_Hexen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pepe_Hexen_Condition()
{
	if (Mod_WM_PepeAtSheep == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pepe_Hexen_Info()
{
	AI_Output(self, hero, "Info_Mod_Pepe_Hexen_03_00"); //Diese scheußlichen Untiere haben mir meine gesamte Herde umgebracht und um ein Haar hätte auch ich dran glauben müssen.
	AI_Output(self, hero, "Info_Mod_Pepe_Hexen_03_01"); //Wie soll ich das nur Onar erklären. Wo ist Innos’ Segen, wenn man ihn mal braucht?!
};

INSTANCE Info_Mod_Pepe_PICKPOCKET (C_INFO)
{
	npc		= Mod_793_BAU_Pepe_NW;
	nr		= 1;
	condition	= Info_Mod_Pepe_PICKPOCKET_Condition;
	information	= Info_Mod_Pepe_PICKPOCKET_Info;
	permanent	= 1;
	description	= Pickpocket_30;
};                       

FUNC INT Info_Mod_Pepe_PICKPOCKET_Condition()
{
	C_Beklauen (15, ItMi_Gold, 11);
};
 
FUNC VOID Info_Mod_Pepe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(Info_Mod_Pepe_PICKPOCKET);
	Info_AddChoice		(Info_Mod_Pepe_PICKPOCKET, DIALOG_BACK 		,Info_Mod_Pepe_PICKPOCKET_BACK);
	Info_AddChoice		(Info_Mod_Pepe_PICKPOCKET, DIALOG_PICKPOCKET	,Info_Mod_Pepe_PICKPOCKET_DoIt);
};

FUNC VOID Info_Mod_Pepe_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Pepe_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Pepe_Pickpocket);

		Info_AddChoice	(Info_Mod_Pepe_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Pepe_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Pepe_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Pepe_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Pepe_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Pepe_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Pepe_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Pepe_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Pepe_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Pepe_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Pepe_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Pepe_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Pepe_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
FUNC VOID Info_Mod_Pepe_PICKPOCKET_BACK()
{
	Info_ClearChoices (Info_Mod_Pepe_PICKPOCKET);
};

INSTANCE Info_Mod_Pepe_EXIT   (C_INFO)
{
	npc         = Mod_793_BAU_Pepe_NW;
	nr          = 1;
	condition   = Info_Mod_Pepe_EXIT_Condition;
	information = Info_Mod_Pepe_EXIT_Info;
	permanent   = 1;
	description = DIALOG_ENDE;
};

FUNC INT Info_Mod_Pepe_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Pepe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};