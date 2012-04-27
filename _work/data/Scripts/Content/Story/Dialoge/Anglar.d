INSTANCE Info_Mod_Anglar_Hi (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Hi_Condition;
	information	= Info_Mod_Anglar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anglar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anglar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Anglar_Hi_06_00"); //Sei gegrüßt Fremder. Wenn du feinen und frischen Fisch suchst, bist du hier genau richtig.
	AI_Output(hero, self, "Info_Mod_Anglar_Hi_15_01"); //Was hast du sonst noch?
	AI_Output(self, hero, "Info_Mod_Anglar_Hi_06_02"); //Nur feinsten Fisch. Was braucht man mehr? Kein Tag ohne Fisch, pflegte mein Großvater zu sagen, und so wurde er auch über 100 Jahre alt ...
};

INSTANCE Info_Mod_Anglar_Feuersbrunst (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Feuersbrunst_Condition;
	information	= Info_Mod_Anglar_Feuersbrunst_Info;
	permanent	= 0;
	important	= 0;
	description	= "So groß ist dein Angebot aber nicht ...";
};

FUNC INT Info_Mod_Anglar_Feuersbrunst_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anglar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hyglas_FeuerGegenEis7))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anglar_Feuersbrunst_Info()
{
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_00"); //So groß ist dein Angebot aber nicht ...
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_01"); //Ja, das stimmt Zurzeit leider. Es ist auch schon einige Wochen her, dass ich am großen See angeln war.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_02"); //(halblaut, zu sich selbst) Das nennt sich also frisch ...

	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_03"); //Aber nach den letzten Vorkommnissen trau ich mich nicht mehr auch nur in die Nähe ...
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_04"); //Was ist passiert?
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_05"); //Als ich vor einigen Tagen gerade das Loch in das Eis gehauen hatte und meine Angel auswarf, schien zunächst alles ganz normal. Es war nur recht bewölkt und dunkel ... als plötzlich ...
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_06"); //Ja?
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_07"); //Als plötzlich im Südosten eine Spirale aus Feuer alles erhellte. Wie gebannt starrte ich weiter in die Richtung, wo sich das Schauspiel ereignet hatte. Aber es passierte nichts mehr weiter.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_08"); //Also nahm ich meinen Mut zusammen, holte die Angel ein und begab mich auf Schusters Rappen in die Richtung, an der das Schauspiel stattgefunden hatte.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_09"); //Nach einigen hundert Metern Fußmarsch erkannte ich in der Ferne eine Horde Eissnapper ... und wie aus dem Nichts fielen plötzlich Flammen auf diese herab und verbrannten sie in einem Augenblick.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_10"); //Der Anblick genügte mir, um die Beine in die Hand zu nehmen und rasch zum Dorf zu flüchten.
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_11"); //Und was glaubst du, was sich da ereignet hatte?
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_12"); //Ich weiß es nicht genau ... aber vermutlich wird irgendein Feuerdämon dort sein Unwesen treiben.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_13"); //Und da ich vernünftig bin und keine Lust habe ebenfalls als Grillfleisch zu enden, bleibe ich vorerst hinter den sicheren Palisaden des Dorfes.

	Log_CreateTopic	(TOPIC_MOD_FM_FEUERSBRUNST, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FM_FEUERSBRUNST, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FM_FEUERSBRUNST, "Der Fischverkäufer Anglar erzählte mir eine Geschichte, die sich am Südosten hinter dem gefrorenen Sees zugetragen hatte. Irgendeine unbekannte Macht – womöglich ein Dämon - scheint dort die Gegend mit Flammen unsicher zu machen und alles zu verbrennen, was sich ihr nährt.");

	Wld_InsertNpc	(Mod_7793_KDF_Hyglas_EIS, "EINSIEDLER_1");
};

INSTANCE Info_Mod_Anglar_Feuersbrunst2 (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Feuersbrunst2_Condition;
	information	= Info_Mod_Anglar_Feuersbrunst2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dein Dämon wird die Gegend nicht mehr verheeren.";
};

FUNC INT Info_Mod_Anglar_Feuersbrunst2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_EIS_Feuersbrunst))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anglar_Feuersbrunst2_Info()
{
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst2_15_00"); //Dein Dämon wird die Gegend nicht mehr verheeren.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst2_06_01"); //Was? Bist du sicher?
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst2_15_02"); //Ja, er ist weiter gezogen in eine andere Region der Erde.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst2_06_03"); //Da bin ich aber erleichtert, das zu hören. Dann werde ich mich sofort wieder auf Fischfang begeben.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst2_06_04"); //Achja, hier zum Dank für die Information der restliche Fisch den ich noch habe.

	B_GiveInvItems	(self, hero, ItFo_Fish, 17);

	B_SetTopicStatus	(TOPIC_MOD_FM_FEUERSBRUNST, LOG_SUCCESS);

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Anglar_Trade (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Trade_Condition;
	information	= Info_Mod_Anglar_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Anglar_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anglar_Feuersbrunst2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anglar_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Anglar_Pickpocket (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Pickpocket_Condition;
	information	= Info_Mod_Anglar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Anglar_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 350);
};

FUNC VOID Info_Mod_Anglar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);

	Info_AddChoice	(Info_Mod_Anglar_Pickpocket, DIALOG_BACK, Info_Mod_Anglar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Anglar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Anglar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Anglar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);
};

FUNC VOID Info_Mod_Anglar_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);
};

INSTANCE Info_Mod_Anglar_EXIT (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_EXIT_Condition;
	information	= Info_Mod_Anglar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Anglar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anglar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};