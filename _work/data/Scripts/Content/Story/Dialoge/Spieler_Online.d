FUNC VOID Info_Mod_Spielleiter_Online_NotOnline_Info() {
	AI_Output(self, hero, "Info_Mod_Spielleiter_Online_RuedigerBesiegt_01_00"); //Nicht jetzt.
	
	AI_StopProcessInfos(self);
};

FUNC VOID Info_Mod_Spielleiter_Online_RuedigerBesiegt_Info() {
	AI_Output(hero, self, "Info_Mod_Spielleiter_Online_RuedigerBesiegt_15_00"); //Lust auf eine Partie Schagby?
	AI_Output(self, hero, "Info_Mod_Spielleiter_Online_RuedigerBesiegt_01_01"); //Ich bin selber kein Spieler, aber kann dir helfen, einen Gegner zu finden.
	AI_Output(hero, self, "Info_Mod_Spielleiter_Online_RuedigerBesiegt_15_02"); //Was muss ich dafür tun?
	AI_Output(self, hero, "Info_Mod_Spielleiter_Online_RuedigerBesiegt_01_03"); //Im Grunde ist das ganz einfach: Du sagst mir, dass du spielen willst und wartest hier, bis ich einen Gegner gefunden habe.
	AI_Output(self, hero, "Info_Mod_Spielleiter_Online_RuedigerBesiegt_01_04"); //Wenn du hier allerdings verschwindest, breche ich die Suche ab.
};

FUNC VOID B_MG_Start_Spielleiter_Online() {
	MG_WaitingForMatch = TRUE;
};

FUNC VOID Info_Mod_Spielleiter_Online_Spielstart_Info() {
	AI_Output(hero, self, "Info_Mod_Spielleiter_Online_Spielstart_15_00"); //Such mir einen Gegner.
	AI_Output(self, hero, "Info_Mod_Spielleiter_Online_Spielstart_01_01"); //Geht klar.
	AI_Output(self, hero, "Info_Mod_Spielleiter_Online_Spielstart_01_02"); //Vergiss nicht, dass ich die Suche abbreche, wenn du das Gebäude verlässt.
	AI_Output(self, hero, "Info_Mod_Spielleiter_Online_Spielstart_01_03"); //Mach es dir einfach gemütlich und trink etwas, bis ich jemanden gefunden habe.

	AI_StopProcessInfos	(self);

	AI_Function (self, B_MG_Start_Spielleiter_Online);
	
	Spine_SearchMatch(2, 0);
};

FUNC VOID Info_Mod_Spielleiter_Online_SuchAbbruch_Info() {
	AI_Output(hero, self, "Info_Mod_Spielleiter_Online_Spielstart_15_00"); //Lassen wir das mit der Suche erstmal.
	AI_Output(self, hero, "Info_Mod_Spielleiter_Online_Spielstart_01_01"); //Wie du meinst. Komm jederzeit zurück, wenn du es dir anders überlegst.
	
	MG_WaitingForMatch = FALSE;
	
	Spine_StopSearchMatch();
};

FUNC VOID Info_Mod_Spielleiter_Online_Spielende_Info() {
	if (MG_SiegState == 2) {
		AI_Output(self, hero, "Info_Mod_Spielleiter_Online_Spielende_01_00"); //Beim nächsten Mal hast du sicher mehr Erfolg.
	} else {
		AI_Output(self, hero, "Info_Mod_Spielleiter_Online_Spielende_01_01"); //Gut gemacht!
	};

	MG_SiegState = 0;
	MG_CurrentOpp = 0;
};

INSTANCE Info_Mod_Spielleiter_Kardif_Online_NotOnline (C_INFO) {
	npc		= Mod_505_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Kardif_Online_NotOnline_Condition;
	information	= Info_Mod_Spielleiter_Online_NotOnline_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Spielleiter_Kardif_Online_NotOnline_Condition() {
	if (Npc_IsInState(self, ZS_Talk))
	&& ((MG_Ruediger_Runde == 0)
	|| (!Spine_Initialized)
	|| (!Spine_IsOnline())) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Coragon_Online_NotOnline (C_INFO) {
	npc		= Mod_506_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Coragon_Online_NotOnline_Condition;
	information	= Info_Mod_Spielleiter_Online_NotOnline_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Spielleiter_Coragon_Online_NotOnline_Condition() {
	if (Npc_IsInState(self, ZS_Talk))
	&& ((MG_Ruediger_Runde == 0)
	|| (!Spine_Initialized)
	|| (!Spine_IsOnline())) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Thekla_Online_NotOnline (C_INFO) {
	npc		= Mod_507_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Thekla_Online_NotOnline_Condition;
	information	= Info_Mod_Spielleiter_Online_NotOnline_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Spielleiter_Thekla_Online_NotOnline_Condition() {
	if (Npc_IsInState(self, ZS_Talk))
	&& ((MG_Ruediger_Runde == 0)
	|| (!Spine_Initialized)
	|| (!Spine_IsOnline())) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_NewCamp_Online_NotOnline (C_INFO) {
	npc		= Mod_508_VLK_Spielleiter_MT;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_NewCamp_Online_NotOnline_Condition;
	information	= Info_Mod_Spielleiter_Online_NotOnline_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Spielleiter_NewCamp_Online_NotOnline_Condition() {
	if (Npc_IsInState(self, ZS_Talk))
	&& ((MG_Ruediger_Runde == 0)
	|| (!Spine_Initialized)
	|| (!Spine_IsOnline())) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Gelato_Online_NotOnline (C_INFO) {
	npc		= Mod_509_VLK_Spielleiter_EIS;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Gelato_Online_NotOnline_Condition;
	information	= Info_Mod_Spielleiter_Online_NotOnline_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Spielleiter_Gelato_Online_NotOnline_Condition() {
	if (Npc_IsInState(self, ZS_Talk))
	&& ((MG_Ruediger_Runde == 0)
	|| (!Spine_Initialized)
	|| (!Spine_IsOnline())) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Kardif_Online_RuedigerBesiegt (C_INFO) {
	npc		= Mod_505_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Kardif_Online_RuedigerBesiegt_Condition;
	information	= Info_Mod_Spielleiter_Online_RuedigerBesiegt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lust auf eine Partie Schagby?";
};

FUNC INT Info_Mod_Spielleiter_Kardif_Online_RuedigerBesiegt_Condition() {
	if (MG_Ruediger_Runde >= 1) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Coragon_Online_RuedigerBesiegt (C_INFO) {
	npc		= Mod_506_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Coragon_Online_RuedigerBesiegt_Condition;
	information	= Info_Mod_Spielleiter_Online_RuedigerBesiegt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lust auf eine Partie Schagby?";
};

FUNC INT Info_Mod_Spielleiter_Coragon_Online_RuedigerBesiegt_Condition() {
	if (MG_Ruediger_Runde >= 1) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Thekla_Online_RuedigerBesiegt (C_INFO) {
	npc		= Mod_507_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Thekla_Online_RuedigerBesiegt_Condition;
	information	= Info_Mod_Spielleiter_Online_RuedigerBesiegt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lust auf eine Partie Schagby?";
};

FUNC INT Info_Mod_Spielleiter_Thekla_Online_RuedigerBesiegt_Condition() {
	if (MG_Ruediger_Runde >= 1) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_NewCamp_Online_RuedigerBesiegt (C_INFO) {
	npc		= Mod_508_VLK_Spielleiter_MT;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_NewCamp_Online_RuedigerBesiegt_Condition;
	information	= Info_Mod_Spielleiter_Online_RuedigerBesiegt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lust auf eine Partie Schagby?";
};

FUNC INT Info_Mod_Spielleiter_NewCamp_Online_RuedigerBesiegt_Condition() {
	if (MG_Ruediger_Runde >= 1) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Gelato_Online_RuedigerBesiegt (C_INFO) {
	npc		= Mod_509_VLK_Spielleiter_EIS;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Gelato_Online_RuedigerBesiegt_Condition;
	information	= Info_Mod_Spielleiter_Online_RuedigerBesiegt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lust auf eine Partie Schagby?";
};

FUNC INT Info_Mod_Spielleiter_Gelato_Online_RuedigerBesiegt_Condition() {
	if (MG_Ruediger_Runde >= 1) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Kardif_Online_Spielstart (C_INFO) {
	npc		= Mod_505_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Kardif_Online_Spielstart_Condition;
	information	= Info_Mod_Spielleiter_Online_Spielstart_Info;
	permanent	= 1;
	important	= 0;
	description	= "Such mir einen Gegner.";
};

FUNC INT Info_Mod_Spielleiter_Kardif_Online_Spielstart_Condition() {
	if (Npc_KnowsInfo(hero, Info_Mod_Spielleiter_Kardif_Online_RuedigerBesiegt))
	&& (!MG_WaitingForMatch) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Coragon_Online_Spielstart (C_INFO) {
	npc		= Mod_506_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Coragon_Online_Spielstart_Condition;
	information	= Info_Mod_Spielleiter_Online_Spielstart_Info;
	permanent	= 1;
	important	= 0;
	description	= "Such mir einen Gegner.";
};

FUNC INT Info_Mod_Spielleiter_Coragon_Online_Spielstart_Condition() {
	if (Npc_KnowsInfo(hero, Info_Mod_Spielleiter_Coragon_Online_RuedigerBesiegt))
	&& (!MG_WaitingForMatch) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Thekla_Online_Spielstart (C_INFO) {
	npc		= Mod_507_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Thekla_Online_Spielstart_Condition;
	information	= Info_Mod_Spielleiter_Online_Spielstart_Info;
	permanent	= 1;
	important	= 0;
	description	= "Such mir einen Gegner.";
};

FUNC INT Info_Mod_Spielleiter_Thekla_Online_Spielstart_Condition() {
	if (Npc_KnowsInfo(hero, Info_Mod_Spielleiter_Thekla_Online_RuedigerBesiegt))
	&& (!MG_WaitingForMatch) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_NewCamp_Online_Spielstart (C_INFO) {
	npc		= Mod_508_VLK_Spielleiter_MT;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_NewCamp_Online_Spielstart_Condition;
	information	= Info_Mod_Spielleiter_Online_Spielstart_Info;
	permanent	= 1;
	important	= 0;
	description	= "Such mir einen Gegner.";
};

FUNC INT Info_Mod_Spielleiter_NewCamp_Online_Spielstart_Condition() {
	if (Npc_KnowsInfo(hero, Info_Mod_Spielleiter_NewCamp_Online_RuedigerBesiegt))
	&& (!MG_WaitingForMatch) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Gelato_Online_Spielstart (C_INFO) {
	npc		= Mod_509_VLK_Spielleiter_EIS;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Gelato_Online_Spielstart_Condition;
	information	= Info_Mod_Spielleiter_Online_Spielstart_Info;
	permanent	= 1;
	important	= 0;
	description	= "Such mir einen Gegner.";
};

FUNC INT Info_Mod_Spielleiter_Gelato_Online_Spielstart_Condition() {
	if (Npc_KnowsInfo(hero, Info_Mod_Spielleiter_Gelato_Online_RuedigerBesiegt))
	&& (!MG_WaitingForMatch) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Kardif_Online_SuchAbbruch (C_INFO) {
	npc		= Mod_505_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Kardif_Online_SuchAbbruch_Condition;
	information	= Info_Mod_Spielleiter_Online_SuchAbbruch_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lassen wir die Suche erstmal.";
};

FUNC INT Info_Mod_Spielleiter_Kardif_Online_SuchAbbruch_Condition() {
	if (Npc_KnowsInfo(hero, Info_Mod_Spielleiter_Kardif_Online_RuedigerBesiegt))
	&& (MG_WaitingForMatch) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Coragon_Online_SuchAbbruch (C_INFO) {
	npc		= Mod_506_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Coragon_Online_SuchAbbruch_Condition;
	information	= Info_Mod_Spielleiter_Online_SuchAbbruch_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lassen wir die Suche erstmal.";
};

FUNC INT Info_Mod_Spielleiter_Coragon_Online_SuchAbbruch_Condition() {
	if (Npc_KnowsInfo(hero, Info_Mod_Spielleiter_Coragon_Online_RuedigerBesiegt))
	&& (MG_WaitingForMatch) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Thekla_Online_SuchAbbruch (C_INFO) {
	npc		= Mod_507_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Thekla_Online_SuchAbbruch_Condition;
	information	= Info_Mod_Spielleiter_Online_SuchAbbruch_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lassen wir die Suche erstmal.";
};

FUNC INT Info_Mod_Spielleiter_Thekla_Online_SuchAbbruch_Condition() {
	if (Npc_KnowsInfo(hero, Info_Mod_Spielleiter_Thekla_Online_RuedigerBesiegt))
	&& (MG_WaitingForMatch) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_NewCamp_Online_SuchAbbruch (C_INFO) {
	npc		= Mod_508_VLK_Spielleiter_MT;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_NewCamp_Online_SuchAbbruch_Condition;
	information	= Info_Mod_Spielleiter_Online_SuchAbbruch_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lassen wir die Suche erstmal.";
};

FUNC INT Info_Mod_Spielleiter_NewCamp_Online_SuchAbbruch_Condition() {
	if (Npc_KnowsInfo(hero, Info_Mod_Spielleiter_NewCamp_Online_RuedigerBesiegt))
	&& (MG_WaitingForMatch) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Gelato_Online_SuchAbbruch (C_INFO) {
	npc		= Mod_509_VLK_Spielleiter_EIS;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Gelato_Online_SuchAbbruch_Condition;
	information	= Info_Mod_Spielleiter_Online_SuchAbbruch_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lassen wir die Suche erstmal.";
};

FUNC INT Info_Mod_Spielleiter_Gelato_Online_SuchAbbruch_Condition() {
	if (Npc_KnowsInfo(hero, Info_Mod_Spielleiter_Gelato_Online_RuedigerBesiegt))
	&& (MG_WaitingForMatch) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Kardif_Online_Spielende (C_INFO) {
	npc		= Mod_505_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Kardif_Online_Spielende_Condition;
	information	= Info_Mod_Spielleiter_Online_Spielende_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Spielleiter_Kardif_Online_Spielende_Condition() {
	if (MG_SiegState > 0)
	&& ((MG_CurrentOpp == MG_GEGNER_ONLINE)
	|| (MG_CurrentOpp == MG_GEGNER_FALLBACK)) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Coragon_Online_Spielende (C_INFO) {
	npc		= Mod_506_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Coragon_Online_Spielende_Condition;
	information	= Info_Mod_Spielleiter_Online_Spielende_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Spielleiter_Coragon_Online_Spielende_Condition() {
	if (MG_SiegState > 0)
	&& ((MG_CurrentOpp == MG_GEGNER_ONLINE)
	|| (MG_CurrentOpp == MG_GEGNER_FALLBACK)) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Thekla_Online_Spielende (C_INFO) {
	npc		= Mod_507_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Thekla_Online_Spielende_Condition;
	information	= Info_Mod_Spielleiter_Online_Spielende_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Spielleiter_Thekla_Online_Spielende_Condition() {
	if (MG_SiegState > 0)
	&& ((MG_CurrentOpp == MG_GEGNER_ONLINE)
	|| (MG_CurrentOpp == MG_GEGNER_FALLBACK)) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_NewCamp_Online_Spielende (C_INFO) {
	npc		= Mod_508_VLK_Spielleiter_MT;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_NewCamp_Online_Spielende_Condition;
	information	= Info_Mod_Spielleiter_Online_Spielende_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Spielleiter_NewCamp_Online_Spielende_Condition() {
	if (MG_SiegState > 0)
	&& ((MG_CurrentOpp == MG_GEGNER_ONLINE)
	|| (MG_CurrentOpp == MG_GEGNER_FALLBACK)) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Gelato_Online_Spielende (C_INFO) {
	npc		= Mod_509_VLK_Spielleiter_EIS;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Gelato_Online_Spielende_Condition;
	information	= Info_Mod_Spielleiter_Online_Spielende_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Spielleiter_Gelato_Online_Spielende_Condition() {
	if (MG_SiegState > 0)
	&& ((MG_CurrentOpp == MG_GEGNER_ONLINE)
	|| (MG_CurrentOpp == MG_GEGNER_FALLBACK)) {
		return 1;
	};
};

INSTANCE Info_Mod_Spielleiter_Kardif_Online_EXIT (C_INFO) {
	npc		= Mod_505_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Kardif_Online_EXIT_Condition;
	information	= Info_Mod_Spielleiter_Kardif_Online_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Spielleiter_Kardif_Online_EXIT_Condition() {
	return 1;
};

FUNC VOID Info_Mod_Spielleiter_Kardif_Online_EXIT_Info() {
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Spielleiter_Coragon_Online_EXIT (C_INFO) {
	npc		= Mod_506_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Coragon_Online_EXIT_Condition;
	information	= Info_Mod_Spielleiter_Coragon_Online_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Spielleiter_Coragon_Online_EXIT_Condition() {
	return 1;
};

FUNC VOID Info_Mod_Spielleiter_Coragon_Online_EXIT_Info() {
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Spielleiter_Thekla_Online_EXIT (C_INFO) {
	npc		= Mod_507_VLK_Spielleiter_NW;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Thekla_Online_EXIT_Condition;
	information	= Info_Mod_Spielleiter_Thekla_Online_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Spielleiter_Thekla_Online_EXIT_Condition() {
	return 1;
};

FUNC VOID Info_Mod_Spielleiter_Thekla_Online_EXIT_Info() {
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Spielleiter_NewCamp_Online_EXIT (C_INFO) {
	npc		= Mod_508_VLK_Spielleiter_MT;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_NewCamp_Online_EXIT_Condition;
	information	= Info_Mod_Spielleiter_NewCamp_Online_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Spielleiter_NewCamp_Online_EXIT_Condition() {
	return 1;
};

FUNC VOID Info_Mod_Spielleiter_NewCamp_Online_EXIT_Info() {
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Spielleiter_Gelato_Online_EXIT (C_INFO) {
	npc		= Mod_509_VLK_Spielleiter_EIS;
	nr		= 1;
	condition	= Info_Mod_Spielleiter_Gelato_Online_EXIT_Condition;
	information	= Info_Mod_Spielleiter_Gelato_Online_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Spielleiter_Gelato_Online_EXIT_Condition() {
	return 1;
};

FUNC VOID Info_Mod_Spielleiter_Gelato_Online_EXIT_Info() {
	AI_StopProcessInfos	(self);
};
