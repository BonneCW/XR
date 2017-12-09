INSTANCE Info_Mod_Grim_NW_Hi (C_INFO)
{
	npc		= Mod_7686_BUD_Grim_NW;
	nr		= 1;
	condition	= Info_Mod_Grim_NW_Hi_Condition;
	information	= Info_Mod_Grim_NW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Grim_NW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Grim_NW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Grim_NW_Hi_06_00"); //Sieh an ...
	AI_Output(hero, self, "Info_Mod_Grim_NW_Hi_15_01"); //Grim?! Du hast es also tatsächlich aus dem Alten Lager geschafft ... und mit dir eine ganze Gruppe anderer, wie ich sehe.
	AI_Output(hero, self, "Info_Mod_Grim_NW_Hi_15_02"); //Ich bin überrascht ...
	AI_Output(self, hero, "Info_Mod_Grim_NW_Hi_06_03"); //Nun, wenn man gute Freunde hat, die zusammenhalten und füreinander da sind übersteht man alles.
	AI_Output(hero, self, "Info_Mod_Grim_NW_Hi_15_04"); //Ja ... man sieht euch auch gar nicht die Strapazen an.
	AI_Output(hero, self, "Info_Mod_Grim_NW_Hi_15_05"); //Wie dem auch sei, weißt du vielleicht, was passiert ist?
	AI_Output(hero, self, "Info_Mod_Grim_NW_Hi_15_06"); //Wie konnten die Orks das Lager stürmen?
	AI_Output(self, hero, "Info_Mod_Grim_NW_Hi_06_07"); //(geheimnisvoll) Ja ... ich hab’s gesehen ... jemand hat die Wachen ermordet und das Tor geöffnet.
	AI_Output(hero, self, "Info_Mod_Grim_NW_Hi_15_08"); //Was? Wer ist es gewesen?
	AI_Output(self, hero, "Info_Mod_Grim_NW_Hi_06_09"); //Nun ... es war dunkel und schwer zu erkennen ... aber ich glaube ...
	AI_Output(self, hero, "Info_Mod_Grim_NW_Hi_06_10"); //(wahnsinnig) ich war’s, wuahaha. Gute Freunde lässt man doch nicht draußen stehen ...
	AI_Output(self, hero, "Info_Mod_Grim_NW_Hi_06_11"); //(schreit) Ahhh.

	B_LogEntry	(TOPIC_MOD_MILIZ_FREUNDFEIND, "Tja, das mit der Gruppe bei Dragomir hat sich dann auf unschöne Weise erledigt. Grim eifert eben immer den falschen Vorbildern nach.");

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild	(self, GIL_STRF);

	Mod_7687_GRD_Gardist_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7687_GRD_Gardist_NW, GIL_STRF);

	Mod_7688_STT_Schatten_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7688_STT_Schatten_NW, GIL_STRF);

	Mod_7689_BUD_Buddler_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7689_BUD_Buddler_NW, GIL_STRF);

	Mod_7690_STT_Schatten_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7690_STT_Schatten_NW, GIL_STRF);

	Mod_7691_BUD_Buddler_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7691_BUD_Buddler_NW, GIL_STRF);
};