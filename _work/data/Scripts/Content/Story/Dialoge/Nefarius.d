INSTANCE Info_Mod_Nefarius_Hi (C_INFO)
{
	npc		= Mod_769_KDW_Nefarius_NW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_Hi_Condition;
	information	= Info_Mod_Nefarius_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Saturas hat mich geschickt.";
};

FUNC INT Info_Mod_Nefarius_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nefarius_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Nefarius_Hi_15_00"); //Saturas hat mich geschickt. Gibt es Fortschritte bei der Übersetzung der Inschriften?
	AI_Output(self, hero, "Info_Mod_Nefarius_Hi_05_01"); //Fortschritte schon, aber wir sind noch weit davon entfernt, etwas zu verstehen.
	AI_Output(self, hero, "Info_Mod_Nefarius_Hi_05_02"); //Niemand von uns kennt diese Sprache. Ich versuche, die Bedeutung der Zeichen zu verstehen. Dies funktioniert jedoch nur mit vielen Vergleichen und Vermutungen.
	AI_Output(self, hero, "Info_Mod_Nefarius_Hi_05_03"); //Es kann also noch dauern, bis wir erste Ergebnisse vorweisen können.
};

INSTANCE Info_Mod_Nefarius_Saturas (C_INFO)
{
	npc		= Mod_769_KDW_Nefarius_NW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_Saturas_Condition;
	information	= Info_Mod_Nefarius_Saturas_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Nefarius_Saturas_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Argez4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nefarius_Saturas_Info()
{
	AI_Output(self, hero, "Info_Mod_Nefarius_Saturas_05_00"); //Ich hab etwas neues herausgefunden. Es scheint einen Ring zu geben der in eine kleine Öffnung in der Wand neben dem Portal passt.
	AI_Output(self, hero, "Info_Mod_Nefarius_Saturas_05_01"); //Den Inschriften Zufolge wurde dieser Ring zur Sicherheit in vier gleiche Teile geteilt und in allen vier Himmelrichtungen versteckt.
	AI_Output(self, hero, "Info_Mod_Nefarius_Saturas_05_02"); //Bevor du dich auf die Suche machst solltest du noch mit Merdarion reden.

	B_LogEntry	(TOPIC_MOD_PORTAL, "Nefarius erzählt etwas von einem Ring, der das Portal öffnen könnte. Dieser Ring wurde jedoch scheinbar geteilt und in allen vier Himmelrichtungen versteckt.");
};

INSTANCE Info_Mod_Nefarius_PortalDicht (C_INFO)
{
	npc		= Mod_769_KDW_Nefarius_NW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_PortalDicht_Condition;
	information	= Info_Mod_Nefarius_PortalDicht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das sind aber keine sehr genauen Angaben.";
};

FUNC INT Info_Mod_Nefarius_PortalDicht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_Saturas))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nefarius_PortalDicht_Info()
{
	AI_Output(hero, self, "Info_Mod_Nefarius_PortalDicht_15_00"); //Das sind aber keine sehr genauen Angaben.
	AI_Output(self, hero, "Info_Mod_Nefarius_PortalDicht_05_01"); //Nun, hier steht eine Geschichte geschrieben. Demnach hat ein Gott mit Namen Radanos vor langer Zeit im alten Tal, genannt Jharkendar, geherrscht.
	AI_Output(self, hero, "Info_Mod_Nefarius_PortalDicht_05_02"); //Er war gütig und weise und schien mit den Bewohnern spirituell viel enger verbunden, als wir es von den drei Gottheiten heute kennen.
	AI_Output(hero, self, "Info_Mod_Nefarius_PortalDicht_15_03"); //Ein anderer Gott? Erzähl weiter ...
	AI_Output(self, hero, "Info_Mod_Nefarius_PortalDicht_05_04"); //Nun, es schien eine Art von Unheil oder Konflikt gegeben zu haben. Näheres konnte ich auch nicht erfahren.
	AI_Output(self, hero, "Info_Mod_Nefarius_PortalDicht_05_05"); //Auf jeden Fall scheint ganz plötzlich die Präsenz dieses Gottes zu enden ... und mit dieser Katastrophe beinahe auch alles Leben in Jharkendar ausgelöscht.
	AI_Output(self, hero, "Info_Mod_Nefarius_PortalDicht_05_06"); //Scheinbar sind nur vier der Erbauer entkommen und haben das Portal verschlossen. Sie wollten aus ihren Fehlern der Vergangenheit lernen.
	AI_Output(self, hero, "Info_Mod_Nefarius_PortalDicht_05_07"); //Den Schlüssel haben sie zerbrochen und geschworen, sich niemals wieder zu begegnen, um die Vergangenheit für immer zu begraben.
	AI_Output(self, hero, "Info_Mod_Nefarius_PortalDicht_05_08"); //Dann sind sie in verschiedene Richtungen aufgebrochen, damit die Stücke des Schlüssel voneinander getrennt sind.

	B_LogEntry	(TOPIC_MOD_PORTAL, "Nach einer Katastrophe in Jharkendar sind lediglich vier der Erbauer entkommen. Diese haben den Schlüssel zerbrochen und jeder ist mit einem Teil in eine andere Richtung gegangen.");
};

INSTANCE Info_Mod_Nefarius_VierErbauer (C_INFO)
{
	npc		= Mod_769_KDW_Nefarius_NW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_VierErbauer_Condition;
	information	= Info_Mod_Nefarius_VierErbauer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Steht in den Schriften denn noch irgendwas über die genauen Orte (...)";
};

FUNC INT Info_Mod_Nefarius_VierErbauer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_PortalDicht))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nefarius_VierErbauer_Info()
{
	AI_Output(hero, self, "Info_Mod_Nefarius_VierErbauer_15_00"); //Steht in den Schriften denn noch irgendwas über die genauen Orte, zu denen die Erbauer gegangen sind?
	AI_Output(self, hero, "Info_Mod_Nefarius_VierErbauer_05_01"); //Nichts genaues. Außerdem musst du bedenken, dass sich das Gebiet hier in den letzten Jahrhunderten auch verändert haben kann.
	AI_Output(self, hero, "Info_Mod_Nefarius_VierErbauer_05_02"); //Ich will dir jedoch so viel sagen, wie mir möglich ist.
	AI_Output(self, hero, "Info_Mod_Nefarius_VierErbauer_05_03"); //Einer der Erbauer, ein Priester, wollte in den Westen aufbrechen, um sich dort eine Residenz zu erschaffen und die Weisheit vom Ur-Adanos zu predigen.
	AI_Output(self, hero, "Info_Mod_Nefarius_VierErbauer_05_04"); //Leider steht hier nicht, was aus ihm geworden ist. Vielleicht solltest du dich mal in Khorinis umhören.
	AI_Output(self, hero, "Info_Mod_Nefarius_VierErbauer_05_05"); //Ein anderer ist in den Süden gegangen. Er wollte dort sein Glück in den Minen suchen.
	AI_Output(self, hero, "Info_Mod_Nefarius_VierErbauer_05_06"); //Den Schriften nach war er allerdings nur ein Mitglieder der Kaste der Heiler.
	AI_Output(hero, self, "Info_Mod_Nefarius_VierErbauer_15_07"); //Und was heißt das?
	AI_Output(self, hero, "Info_Mod_Nefarius_VierErbauer_05_08"); //Nun, zur damaligen Zeit gab es noch keine Handels- und Transportroute zwischen dem Minental und Khorinis.
	AI_Output(self, hero, "Info_Mod_Nefarius_VierErbauer_05_09"); //Daher dürften dort jede Menge gefährliche Monster unterwegs gewesen sein. Ich glaube kaum, dass ein Heiler da sehr weit gekommen ist.
	AI_Output(hero, self, "Info_Mod_Nefarius_VierErbauer_15_10"); //Klingt einleuchtend.
	AI_Output(self, hero, "Info_Mod_Nefarius_VierErbauer_05_11"); //Ein weiterer Erbauer, ein Krieger, wollte sich auf Khorinis niederlassen, eine Familie gründen und in Frieden leben.
	AI_Output(self, hero, "Info_Mod_Nefarius_VierErbauer_05_12"); //Sein Name war Onar. Vielleicht hat gibt es ja eine Verbindung zum Grossbauer ...
	AI_Output(hero, self, "Info_Mod_Nefarius_VierErbauer_15_13"); //Ich werde mir das mal ansehen.
	AI_Output(self, hero, "Info_Mod_Nefarius_VierErbauer_05_14"); //Der letzte der Überlebenden war ein Totenwächter, der wohl irgendwo im Norden von Khorinis zu finden sein muss.
	AI_Output(hero, self, "Info_Mod_Nefarius_VierErbauer_15_15"); //Zumindest das, was von ihm übrig ist ...
	AI_Output(self, hero, "Info_Mod_Nefarius_VierErbauer_05_16"); //Natürlich, es wäre erstaunlich, wenn er selber noch Leben würde. (lacht)
	AI_Output(self, hero, "Info_Mod_Nefarius_VierErbauer_05_17"); //Schau dich mal im Norden von Khorinis um, vielleicht findest du dort einen Ort, der einem Totenwächter würdig ist.
	AI_Output(hero, self, "Info_Mod_Nefarius_VierErbauer_15_18"); //Gut, ich mach mich dann mal auf den Weg.

	B_LogEntry	(TOPIC_MOD_PORTAL, "Einer der Erbauer ist in den Westen gegangen, um sich dort eine Residenz zu erschaffen. Ich sollte mich in Khorinis nach der Geschichte des Stammvaters erkundigen.");
	B_LogEntry	(TOPIC_MOD_PORTAL, "Ein Heiler ist in den Süden aufgebrochen. Nefarius denkt allerdings, dass er nicht allzu weit gekommen ist, da damals der Pass ins Minental sicher noch von gefährlichen Monstern besiedelt wurde.");
	B_LogEntry	(TOPIC_MOD_PORTAL, "Onar, ein Mitglieder der Krieger-Kaste, hat sich auf Khorinis niedergelassen und eine Familie gegründet. Der Name gleicht dem des heutigen Grossbauern. Vielleicht gibt es da eine Verbindung?");
	B_LogEntry	(TOPIC_MOD_PORTAL, "Der letzte Überlebende, ein Totenwächter, hat sich in den Norden aufgemacht. Ich soll mich dort mal umsehen.");

	Wld_InsertItem	(ItMi_Ornament_Totenwaechter,	"FP_ITEM_ORNAMENT_TOTENWAECHTER");

	Mob_CreateItems	("ONARSAHNENTRUHE", ItMi_Ornament_Krieger, 1);

	B_StartOtherRoutine	(Mod_763_NONE_Gaan_NW, "ORNAMENT");
};

INSTANCE Info_Mod_Nefarius_PriesterOrnament (C_INFO)
{
	npc		= Mod_769_KDW_Nefarius_NW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_PriesterOrnament_Condition;
	information	= Info_Mod_Nefarius_PriesterOrnament_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab Bruchstück des Priesters.";
};

FUNC INT Info_Mod_Nefarius_PriesterOrnament_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_VierErbauer))
	&& (Npc_HasItems(hero, ItMi_Ornament_Priester) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nefarius_PriesterOrnament_Info()
{
	AI_Output(hero, self, "Info_Mod_Nefarius_PriesterOrnament_15_00"); //Ich hab Bruchstück des Priesters. Es war in Relendel in der Stadt Khorata.
	
	B_GiveInvItems	(hero, self, ItMi_Ornament_Priester, 1);

	AI_Output(self, hero, "Info_Mod_Nefarius_PriesterOrnament_05_01"); //In Khorata? Nun ja, jetzt haben wir es ja. Hier ist deine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_PORTAL, "Ich habe Nefarius das Stück des Priesters gegeben.");
};

INSTANCE Info_Mod_Nefarius_HeilerOrnament (C_INFO)
{
	npc		= Mod_769_KDW_Nefarius_NW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_HeilerOrnament_Condition;
	information	= Info_Mod_Nefarius_HeilerOrnament_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Ornamentstück des Heilers.";
};

FUNC INT Info_Mod_Nefarius_HeilerOrnament_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_VierErbauer))
	&& (Npc_HasItems(hero, ItMi_Ornament_Heiler) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nefarius_HeilerOrnament_Info()
{
	AI_Output(hero, self, "Info_Mod_Nefarius_HeilerOrnament_15_00"); //Ich habe das Ornamentstück des Heilers.
	
	B_GiveInvItems	(hero, self, ItMi_Ornament_Heiler, 1);

	AI_Output(self, hero, "Info_Mod_Nefarius_HeilerOrnament_05_01"); //Sehr gut. Hier hast du eine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_PORTAL, "Ich habe Nefarius das Stück des Heilers gegeben.");
};

INSTANCE Info_Mod_Nefarius_KriegerOrnament (C_INFO)
{
	npc		= Mod_769_KDW_Nefarius_NW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_KriegerOrnament_Condition;
	information	= Info_Mod_Nefarius_KriegerOrnament_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier ist das Stück des Kriegers.";
};

FUNC INT Info_Mod_Nefarius_KriegerOrnament_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_VierErbauer))
	&& (Npc_HasItems(hero, ItMi_Ornament_Krieger) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nefarius_KriegerOrnament_Info()
{
	AI_Output(hero, self, "Info_Mod_Nefarius_KriegerOrnament_15_00"); //Hier ist das Stück des Kriegers.
	
	B_GiveInvItems	(hero, self, ItMi_Ornament_Krieger, 1);

	AI_Output(self, hero, "Info_Mod_Nefarius_KriegerOrnament_05_01"); //Schön, wo hast du es gefunden?
	AI_Output(hero, self, "Info_Mod_Nefarius_KriegerOrnament_15_02"); //Es war in einer Truhe von Onar, dem Grossbauern.
	AI_Output(self, hero, "Info_Mod_Nefarius_KriegerOrnament_05_03"); //Ah ja, also waren die beiden tatsächlich verwandt.
	AI_Output(self, hero, "Info_Mod_Nefarius_KriegerOrnament_05_04"); //Hier ist deine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_PORTAL, "Ich habe Nefarius das Stück des Kriegers gegeben.");
};

INSTANCE Info_Mod_Nefarius_TotenwaechterOrnament (C_INFO)
{
	npc		= Mod_769_KDW_Nefarius_NW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_TotenwaechterOrnament_Condition;
	information	= Info_Mod_Nefarius_TotenwaechterOrnament_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Ornamentstück des Totenwächters gefunden.";
};

FUNC INT Info_Mod_Nefarius_TotenwaechterOrnament_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_VierErbauer))
	&& (Npc_HasItems(hero, ItMi_Ornament_Totenwaechter) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nefarius_TotenwaechterOrnament_Info()
{
	AI_Output(hero, self, "Info_Mod_Nefarius_TotenwaechterOrnament_15_00"); //Ich habe das Ornamentstück des Totenwächters gefunden.
	
	B_GiveInvItems	(hero, self, ItMi_Ornament_Totenwaechter, 1);

	AI_Output(self, hero, "Info_Mod_Nefarius_TotenwaechterOrnament_05_01"); //Und welcher Ort war des Totenwächters würdig?
	AI_Output(hero, self, "Info_Mod_Nefarius_TotenwaechterOrnament_15_02"); //Der Steinkreis in der Nähe des schwarzen Trolls.
	AI_Output(self, hero, "Info_Mod_Nefarius_TotenwaechterOrnament_05_03"); //Der Sonnenkreis also, interessant.
	AI_Output(self, hero, "Info_Mod_Nefarius_TotenwaechterOrnament_05_04"); //Sehr gut. Hier ist eine kleine Belohnung für dich.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_PORTAL, "Ich habe Nefarius das Stück des Totenwächters gegeben.");
};

INSTANCE Info_Mod_Nefarius_Komplett (C_INFO)
{
	npc		= Mod_769_KDW_Nefarius_NW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_Komplett_Condition;
	information	= Info_Mod_Nefarius_Komplett_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was passiert jetzt?";
};

FUNC INT Info_Mod_Nefarius_Komplett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_PriesterOrnament))
	&& (Npc_KnowsInfo(hero, Info_Mod_Nefarius_HeilerOrnament))
	&& (Npc_KnowsInfo(hero, Info_Mod_Nefarius_KriegerOrnament))
	&& (Npc_KnowsInfo(hero, Info_Mod_Nefarius_TotenwaechterOrnament))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nefarius_Komplett_Info()
{
	AI_Output(hero, self, "Info_Mod_Nefarius_Komplett_15_00"); //Was passiert jetzt?
	AI_Output(self, hero, "Info_Mod_Nefarius_Komplett_05_01"); //Nun, ich werde die Teile jetzt zusammensetzen. Es wird allerdings ein wenig dauern.
	AI_Output(self, hero, "Info_Mod_Nefarius_Komplett_05_02"); //Geh solange mal zu Riordian, ich glaube, er wollte dir etwas zeigen.

	Mod_OrnamentNefarius = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_PORTAL, "Nefarius wird die Teile nun zusammensetzen. Ich soll wieder kommen, wenn ich bei Riordian war.");
};

INSTANCE Info_Mod_Nefarius_NTag (C_INFO)
{
	npc		= Mod_769_KDW_Nefarius_NW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_NTag_Condition;
	information	= Info_Mod_Nefarius_NTag_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du fertig?";
};

FUNC INT Info_Mod_Nefarius_NTag_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Riordian_PortalOeffnen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nefarius_NTag_Info()
{
	AI_Output(hero, self, "Info_Mod_Nefarius_NTag_15_00"); //Bist du fertig?
	AI_Output(self, hero, "Info_Mod_Nefarius_NTag_05_01"); //Ja, hier ist der Ring.

	B_GiveInvItems	(self, hero, ItMi_PortalRing_Addon, 1);

	AI_Output(self, hero, "Info_Mod_Nefarius_NTag_05_02"); //Setze ihn in die vorgesehen Öffnung und durchschreite dann das Portal. Wir werden dir dann folgen. Du kannst dich solange ein wenig umsehen.

	B_LogEntry	(TOPIC_MOD_PORTAL, "Nefarius hat mir den Ring gegeben. Ich soll den Ring nun einsetzen und dann das Portal durchschreiten. Die anderen werden mir dann folgen.");
	B_SetTopicStatus	(TOPIC_MOD_PORTAL, LOG_SUCCESS);
}; 

instance Info_Mod_Nefarius_Runen	(C_INFO)
{
	npc		= Mod_769_KDW_Nefarius_NW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_Runen_Condition;
	information	= Info_Mod_Nefarius_Runen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Unterweise mich (Runen erschaffen)";
};

func int Info_Mod_Nefarius_Runen_Condition ()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_Hi))
	&& ((Mod_Gilde == 9)
	|| (Mod_Gilde == 10)
	|| (Mod_Gilde == 11))
	{
		return 1;
	};
};

func void Info_Mod_Nefarius_Runen_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "Info_Mod_Nefarius_Runen_15_00"); //Unterweise mich.
	
	Info_ClearChoices 	(Info_Mod_Nefarius_Runen);
	Info_AddChoice		(Info_Mod_Nefarius_Runen, DIALOG_BACK, Info_Mod_Nefarius_Runen_BACK);
	
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) >= 6)
	{
		if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,Info_Mod_Nefarius_Runen_Shrink);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Icerain] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_Icerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icerain)) ,Info_Mod_Nefarius_Runen_Icerain);
			abletolearn = (abletolearn +1);
		};	
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 5)
	{
		if (PLAYER_TALENT_RUNES [SPL_IceWave] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_IceWave, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_IceWave)), Info_Mod_Nefarius_Runen_IceWave);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_FullHeal] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_FullHeal, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_FullHeal)), Info_Mod_Nefarius_Runen_FullHeal);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 4)
	{
		if (PLAYER_TALENT_RUNES [SPL_LightningFlash] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_LightningFlash, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_LightningFlash)), Info_Mod_Nefarius_Runen_LightningFlash);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Waterfist] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_Waterfist, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Waterfist)), Info_Mod_Nefarius_Runen_Waterfist);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 3)
	{
		if (PLAYER_TALENT_RUNES [SPL_MediumHeal] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_MediumHeal, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_MediumHeal)), Info_Mod_Nefarius_Runen_MediumHeal);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_IceCube] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_IceCube, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_IceCube)), Info_Mod_Nefarius_Runen_IceCube);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_ChargeZap] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_ChargeZap, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_ChargeZap)), Info_Mod_Nefarius_Runen_Thunderball);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Thunderstorm] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_Thunderstorm, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Thunderstorm)), Info_Mod_Nefarius_Runen_Thunderstorm);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Geyser] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_Geyser, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Geyser)), Info_Mod_Nefarius_Runen_Geyser);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 2)
	{
		if (PLAYER_TALENT_RUNES [SPL_Icelance] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_Icelance, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Icelance)), Info_Mod_Nefarius_Runen_Icelance);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_InstantIceball] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_InstantIceball, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_InstantIceball)), Info_Mod_Nefarius_Runen_InstantIceball);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	{
		if (PLAYER_TALENT_RUNES [SPL_Light] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_Light, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Light)), Info_Mod_Nefarius_Runen_Light);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_LightHeal] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_LightHeal, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_LightHeal)), Info_Mod_Nefarius_Runen_LightHeal);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Zap] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_Runen, B_BuildLearnString (NAME_SPL_Zap, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Zap)), Info_Mod_Nefarius_Runen_Zap);
			abletolearn = (abletolearn +1);
		};
	};

	if (abletolearn < 1)
	{
		AI_Output (self, other, "Info_Mod_Nefarius_Runen_14_01"); //Es gibt nichts mehr, das ich dir beibringen könnte.
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_BACK()
{
	Info_ClearChoices 	(Info_Mod_Nefarius_Runen);
};

FUNC VOID Info_Mod_Nefarius_Runen_Light()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Light);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Light) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Light, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_LightHeal()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_LightHeal);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_LightHeal) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_LightHeal, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_SummonWolf()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonWolf);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_SumWolf) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_SumWolf, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_Icerain()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Icerain);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Icerain) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Icerain, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_SummonDragon()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonDragon);
};

FUNC VOID Info_Mod_Nefarius_Runen_SummonIceGolem()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonIceGolem);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_SumIceGol) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_SumIceGol, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_SummonEisgoblin()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonEisgoblin);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_SumGobEis) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_SumGobEis, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_Icebolt()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Icebolt);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Icebolt) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Icebolt, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_Zap()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Zap);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Zap) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Zap, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_Icelance()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Icelance);
	
	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Icelance) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Icelance, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_InstantIceball()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_InstantIceball);
	
	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_InstantIceball) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_InstantIceball, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_Waterfist()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Waterfist);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Waterfist) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Waterfist, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_IceCube()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_IceCube);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_IceCube) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_IceCube, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_Thunderball()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_ChargeZap);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Thunderball) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Thunderball, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_Thunderstorm()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Thunderstorm);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Thunderstorm) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Thunderstorm, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_Geyser()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Geyser);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Geyser) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Geyser, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_MediumHeal()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_MediumHeal);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_MediumHeal) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_MediumHeal, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_LightningFlash()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_LightningFlash);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_LightningFlash) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_LightningFlash, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_IceWave()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_IceWave);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_IceWave) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_IceWave, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_Shrink()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Shrink);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Shrink) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Shrink, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_Runen_FullHeal()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_FullHeal);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_FullHeal) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_FullHeal, 1);
	};
};

INSTANCE Info_Mod_Nefarius_EXIT (C_INFO)
{
	npc		= Mod_769_KDW_Nefarius_NW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_EXIT_Condition;
	information	= Info_Mod_Nefarius_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Nefarius_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};