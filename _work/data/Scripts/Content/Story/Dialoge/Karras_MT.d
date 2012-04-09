INSTANCE Info_Mod_Karras_MT_Namib (C_INFO)
{
	npc		= Mod_1896_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_MT_Namib_Condition;
	information	= Info_Mod_Karras_MT_Namib_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Karras_MT_Namib_Condition()
{
	if (Mod_Sekte_Aufnahme == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_MT_Namib_Info()
{
	AI_Output(self, hero, "Info_Mod_Karras_MT_Namib_12_00"); //Berichte Baal Namib, dass wir hier sind.
};

INSTANCE Info_Mod_Karras_MT_Leader (C_INFO)
{
	npc		= Mod_1896_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_MT_Leader_Condition;
	information	= Info_Mod_Karras_MT_Leader_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Karras_MT_Leader_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_AtTempel))
	&& (hero.guild == GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_MT_Leader_Info()
{
	AI_Output(self, hero, "Info_Mod_Karras_MT_Leader_12_00"); //Da bist du ja, alles läuft nach Plan. Bald ist es so weit.
	AI_Output(self, hero, "Info_Mod_Karras_MT_Leader_12_01"); //Wir werden hier gleich Untote beschwören, aber keine Knochengerüste, sondern die Sumpfhaie, die hier ihr Ende fanden.
	AI_Output(self, hero, "Info_Mod_Karras_MT_Leader_12_02"); //Keine Angst, das hat den gleichen Effekt auf den Boden, doch wir werden einen Vorteil daraus ziehen.
	AI_Output(self, hero, "Info_Mod_Karras_MT_Leader_12_03"); //Wir haben dafür gesorgt, dass einer der Templer, der eine Kampfgruppe gegen die Untoten leiten sollte, nicht dazu kommen wird.
	AI_Output(self, hero, "Info_Mod_Karras_MT_Leader_12_04"); //Du wirst seinen Platz einnehmen.
	AI_Output(hero, self, "Info_Mod_Karras_MT_Leader_15_05"); //Warum?
	AI_Output(self, hero, "Info_Mod_Karras_MT_Leader_12_06"); //Da, nimm diesen Stein.

	B_GiveInvItems	(self, hero, ItMi_SumpfhaiStein, 1);

	AI_Output(self, hero, "Info_Mod_Karras_MT_Leader_12_07"); //Er wird die Energie jedes Sumphaies absorbieren, den du oder jemand aus deiner Gruppe umbringt.
	AI_Output(self, hero, "Info_Mod_Karras_MT_Leader_12_08"); //Es sollten mindestens zehn Haie sein, sonst war alles umsonst! Und jetzt geh.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Karras hat mir einen Stein gegeben. Er meinte, dass er die Energie von Sumpfhaien, die ich mit meiner Gruppe töte, absorbieren wird.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Karras_MT_Stein (C_INFO)
{
	npc		= Mod_1896_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_MT_Stein_Condition;
	information	= Info_Mod_Karras_MT_Stein_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Karras_MT_Stein_Condition()
{
	if (Npc_HasItems(hero, ItMi_SumpfhaiStein) == 1)
	&& (hero.guild == GIL_KDF)
	&& (Mod_Sekte_SH_Kampf == 4)
	&& (Npc_IsDead(Swampshark_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_MT_Stein_Info()
{
	AI_Output(self, hero, "Info_Mod_Karras_MT_Stein_12_00"); //Gib mir den Stein.

	B_GiveInvItems	(hero, self, ItMi_SumpfhaiStein, 1);

	if (Mod_Sekte_UDS_Stein >= 10)
	{
		AI_Output(self, hero, "Info_Mod_Karras_MT_Stein_12_01"); //Oh ja, sehr gut, er ist voll geladen. Komm in ein paar Tagen im Tal vorbei.
	
		B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Karras will, dass ich in ein paar Tagen nochmal bei ihm vorbei komme.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Karras_MT_Stein_12_02"); //Aber ... der ist ja gar nicht aufgeladen! Verdammt, es war alles umsonst! Du nichtsnutziger Bastard! Geh mir aus den Augen!
	};
	
	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	AI_Teleport	(self, "TOT");
};

INSTANCE Info_Mod_Karras_MT_Fertig (C_INFO)
{
	npc		= Mod_1896_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_MT_Fertig_Condition;
	information	= Info_Mod_Karras_MT_Fertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Karras_MT_Fertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_SUDD))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_MT_Fertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Karras_MT_Fertig_12_00"); //Ich werde jetzt wieder gehen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	AI_Teleport	(self, "TOT");
};

INSTANCE Info_Mod_Karras_MT_EXIT (C_INFO)
{
	npc		= Mod_1896_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_MT_EXIT_Condition;
	information	= Info_Mod_Karras_MT_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Karras_MT_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Karras_MT_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};