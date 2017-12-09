INSTANCE Info_Mod_Torwache_Sekte_01_GardistenInfos (C_INFO)
{
	npc		= Mod_1222_TPL_Templer_MT;
	nr		= 1;
	condition	= Info_Mod_Torwache_Sekte_01_GardistenInfos_Condition;
	information	= Info_Mod_Torwache_Sekte_01_GardistenInfos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Habt ihr in den letzten Tagen irgendwelche Gardisten gesehen?";
};

FUNC INT Info_Mod_Torwache_Sekte_01_GardistenInfos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_NochEinAuftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Torgan_GardistenZettel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torwache_Sekte_01_GardistenInfos_Info()
{
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_GardistenInfos_15_00"); //Habt ihr in den letzten Tagen irgendwelche Gardisten hier in der Nähe gesehen?
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_13_01"); //Gardisten? Ab und an kommen hier welche vorbei, doch ist mir nichts besonderes an ihnen aufgefallen.
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_13_02"); //Warum fragst du?

	Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_GardistenInfos);
	
	Info_AddChoice	(Info_Mod_Torwache_Sekte_01_GardistenInfos, "Ich bin ein paar Gardisten begegnet (...)", Info_Mod_Torwache_Sekte_01_GardistenInfos_D);
	Info_AddChoice	(Info_Mod_Torwache_Sekte_01_GardistenInfos, "Das geht dich nichts an.", Info_Mod_Torwache_Sekte_01_GardistenInfos_C);
	Info_AddChoice	(Info_Mod_Torwache_Sekte_01_GardistenInfos, "Mich haben auf dem Weg hierher ein paar Gardisten angefallen.", Info_Mod_Torwache_Sekte_01_GardistenInfos_B);
	Info_AddChoice	(Info_Mod_Torwache_Sekte_01_GardistenInfos, "Die Waldläufer hatten einige Probleme mit ihnen gehabt.", Info_Mod_Torwache_Sekte_01_GardistenInfos_A);
};

FUNC VOID Info_Mod_Torwache_Sekte_01_GardistenInfos_D()
{
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_GardistenInfos_D_15_00"); //Ich bin ein paar Gardisten begegnet, die ich hier bisher noch nie gesehen hatte.
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_D_13_01"); //Tut mir leid, mehr als die bekannten Gesichter habe ich hier in letzter Zeit nicht gesehen und soweit ich weiß sind diese auch die Einzigen, die das Lager regelmäßig verlassen.
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_GardistenInfos_D_15_02"); //Danke, wir sehen uns.
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_D_13_03"); //Bestimmt.

	Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_GardistenInfos);

	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Die Torwache des Sumpflagers hat niemand Ungewöhnlichen gesehen.");
};

FUNC VOID Info_Mod_Torwache_Sekte_01_GardistenInfos_C()
{
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_GardistenInfos_C_15_00"); //Das geht dich nichts an.
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_C_13_01"); //Na dann weiterhin viel Spaß bei dem, was mich nichts angeht, aber dir viel Sorgen bereitet. (lacht)

	Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_GardistenInfos);
};

FUNC VOID Info_Mod_Torwache_Sekte_01_GardistenInfos_B()
{
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_GardistenInfos_B_15_00"); //Mich haben auf dem Weg hierher ein paar Gardisten angefallen, doch kann ich mir kaum vorstellen, warum sie das tun sollten.
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_B_13_01"); //Diese Mistkerle brauchen keinen Grund jemanden zu überfallen. Auf jeden Fall die Meisten von ihnen. Was haben sie dir abgenommen?

	Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_GardistenInfos);
	
	Info_AddChoice	(Info_Mod_Torwache_Sekte_01_GardistenInfos, "Nichts. Bei ihren Leichen hatte ich aber auch nicht viel gefunden.", Info_Mod_Torwache_Sekte_01_GardistenInfos_F);
	Info_AddChoice	(Info_Mod_Torwache_Sekte_01_GardistenInfos, "Alles, was ich dabei hatte, diese miesen ...", Info_Mod_Torwache_Sekte_01_GardistenInfos_E);
};

FUNC VOID Info_Mod_Torwache_Sekte_01_GardistenInfos_F()
{
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_GardistenInfos_F_15_00"); //Nichts. Bei ihren Leichen hatte ich aber auch nicht viel gefunden.
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_F_13_01"); //Ein ganz Harter also. Dann hör zu: Geh damit bloß nicht zum Alten Lager! Wenn du Pech hast, machen die dich dafür im Nachhinein einen Kopf kürzer.
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_GardistenInfos_F_15_02"); //Danke für den Tipp.
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_F_13_03"); //Ist umsonst.

	Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_GardistenInfos);

	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Die Torwache des Sumpflagers hat niemand Ungewöhnlichen gesehen. Er gab mir den Tipp, deswegen nicht zum alten Lager zu gehen.");
};

FUNC VOID Info_Mod_Torwache_Sekte_01_GardistenInfos_E()
{
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_GardistenInfos_E_15_00"); //Alles, was ich dabei hatte, diese miesen ...
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_E_13_01"); //Oh, das tut mir leid. Möchtest du nen Stängel?

	Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_GardistenInfos);
	
	Info_AddChoice	(Info_Mod_Torwache_Sekte_01_GardistenInfos, "Nein danke, jetzt nicht.", Info_Mod_Torwache_Sekte_01_GardistenInfos_H);
	Info_AddChoice	(Info_Mod_Torwache_Sekte_01_GardistenInfos, "Oh, ja, danke.", Info_Mod_Torwache_Sekte_01_GardistenInfos_G);
};

FUNC VOID Info_Mod_Torwache_Sekte_01_GardistenInfos_I()
{
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_I_13_00"); //Wo waren wir stehen geblieben? Ach ja. An deiner Stelle würde ich deswegen nicht zum Alten Lager gehen. Mehr als Hohn und Gelächter wirst du als Antwort wohl nicht bekommen.
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_I_13_01"); //Diejenigen, die hier von ihnen normalerweise vorbeikommen haben aber zumeist auch andere Sachen im Kopf, als jemanden zu überfallen.

	Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_GardistenInfos);

	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Die Torwache des Sumpflagers hat niemand Ungewöhnlichen gesehen. Er gab mir den Tipp, deswegen nicht zum alten Lager zu gehen.");
};

FUNC VOID Info_Mod_Torwache_Sekte_01_GardistenInfos_H()
{
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_GardistenInfos_H_15_00"); //Nein danke, jetzt nicht.

	Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_GardistenInfos);
	
	Info_Mod_Torwache_Sekte_01_GardistenInfos_I();
};

FUNC VOID Info_Mod_Torwache_Sekte_01_GardistenInfos_G()
{
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_GardistenInfos_G_15_00"); //Oh, ja, danke.

	CreateInvItems	(self, ItMi_Joint, 2);
	B_GiveInvItems	(self, hero, ItMi_Joint, 1);

	B_UseItem	(hero, ItMi_Joint);
	B_UseItem	(self, ItMi_Joint);

	Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_GardistenInfos);
	
	Info_Mod_Torwache_Sekte_01_GardistenInfos_I();
};

FUNC VOID Info_Mod_Torwache_Sekte_01_GardistenInfos_A()
{
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_GardistenInfos_A_15_00"); //Die Waldläufer hatten einige Probleme mit ihnen gehabt und möchten mehr über diese Vorfälle wissen.
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_A_13_01"); //Ach? Das ist ja interessant. Kein Wunder bei diesen Mistkerlen. Die müssen sich ja überall wie die Könige aufführen.
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_A_13_02"); //Bis auf die bekannten Gesichter in ihrem gewohnten trott ist hier aber niemand aufgetaucht.
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_A_13_03"); //Frag vielleicht mal im Neuen Lager nach, ich könnte mir vorstellen wenn etwas vorgefallen ist, dann werden die bestimmt was darüber wissen.
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_GardistenInfos_A_15_04"); //Danke. Ich muss dann weiter.
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_GardistenInfos_A_13_05"); //Viel Glück.


	Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_GardistenInfos);

	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Die Torwache des Sumpflagers hat niemand Ungewöhnlichen gesehen. Er meinte, ich solle mal im neuen Lager nachfragen.");
};

INSTANCE Info_Mod_Torwache_Sekte_01_ZuGuru (C_INFO)
{
	npc		= Mod_1222_TPL_Templer_MT;
	nr		= 1;
	condition	= Info_Mod_Torwache_Sekte_01_ZuGuru_Condition;
	information	= Info_Mod_Torwache_Sekte_01_ZuGuru_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Torwache_Sekte_01_ZuGuru_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Hi))
	{
		return 1;
	};
};

var int Mod_SektenKorbKram;

FUNC VOID Info_Mod_Torwache_Sekte_01_ZuGuru_Info()
{
	if (Guru_Dabei == TRUE)
	|| (Templer_Dabei == TRUE)
	|| (Npc_KnowsInfo(hero, Info_Mod_Namib_Hi))
	{
		AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_ZuGuru_13_00"); //Aha. Du schon wieder.
		AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_ZuGuru_15_01"); //Ja. Habe hier noch was zu erledigen.
		AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_ZuGuru_13_02"); //Gut. Wir kennen dich. Du kannst passieren.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_ZuGuru_13_03"); //Halt! Parole!
		AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_ZuGuru_15_04"); //Aber wir kennen uns doch. War doch unlängst hier.
		AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_ZuGuru_13_05"); //Schon. Aber da wolltest du nur was wissen.
		AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_ZuGuru_15_06"); //Heute muss ich aber rein.
		AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_ZuGuru_13_07"); //Hier kommt nur rein, wer sich uns anschließen will ...
		AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_ZuGuru_15_08"); //Deswegen komme ich doch! Will mich euch anschliessen.
		AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_ZuGuru_13_09"); //... und ein Empfehlungsschreiben vorweisen kann.
		AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_ZuGuru_15_10"); //Habe ich leider verlegt.
		AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_ZuGuru_13_11"); //Dann such es. Vorher geht nichts.
		AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_ZuGuru_15_12"); //Willst du 'nen Stängel?
		AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_ZuGuru_13_13"); //Spinnst du? Wir haben hier mehr als genug.
		AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_ZuGuru_15_14"); //Ich hätte hier etwas Gold übrig ...
		AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_ZuGuru_13_15"); //Auch 'ne alte Masche. Wir brauchen hier kein Gold.
		AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_ZuGuru_15_16"); //Jeder kann Gold brauchen.
		AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_ZuGuru_13_17"); //(laut) Vergiss es!
		AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_ZuGuru_15_18"); //Hör zu. Ich muss dringend einen eurer Gurus sprechen. Im Tal ist Gefahr in Verzug. Cyrco schickt mich.
		AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_ZuGuru_13_19"); //Cyrco, der Druide?
		AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_ZuGuru_15_20"); //Genau der!
		AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_ZuGuru_13_21"); //Hmmm. Nun gut. Du lässt deine Waffen, Rüstung und dein Inventar hier. Dann lass ich dich passieren.
		AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_ZuGuru_15_22"); //In Unterhosen?
		AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_ZuGuru_13_23"); //Genau. Da hinten steht Talas. Er soll dir 'ne Besucherrobe geben und dir weiterhelfen.

		B_TransferInventory_All (hero, PC_Itemholder);

		Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_ZuGuru);
	
		Info_AddChoice	(Info_Mod_Torwache_Sekte_01_ZuGuru, "Gut so?", Info_Mod_Torwache_Sekte_01_ZuGuru_A);

		AI_Teleport	(Mod_2012_PSINOV_Talas_MT, "PSI_BRIDGE_1");
		B_StartOtherRoutine	(Mod_2012_PSINOV_Talas_MT, "BEINAMIB");
		
		Mod_SektenKorbKram = TRUE;
	};
};

FUNC VOID Info_Mod_Torwache_Sekte_01_ZuGuru_A()
{
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_ZuGuru_A_15_00"); //Gut so?
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_ZuGuru_A_13_01"); //(grinst ) Ja. Sag, ist deine Waschfrau in Urlaub?
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_ZuGuru_A_15_02"); //(errötet) Spassvogel.

	Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_ZuGuru);

	if (Npc_HasItems(PC_Itemholder, ItWr_MagicPaper) > 0)
	{
		CreateInvItems	(hero, ItWr_MagicPaper, Npc_HasItems(PC_Itemholder, ItWr_MagicPaper));
		Npc_RemoveInvItems	(PC_Itemholder, ItWr_MagicPaper, Npc_HasItems(PC_Itemholder, ItWr_MagicPaper));
	};

	Mob_CreateItems	("SEKTENTORTRUHE", ItSe_HeroPocket, 1);
};

INSTANCE Info_Mod_Torwache_Sekte_01_VonGuru (C_INFO)
{
	npc		= Mod_1222_TPL_Templer_MT;
	nr		= 1;
	condition	= Info_Mod_Torwache_Sekte_01_VonGuru_Condition;
	information	= Info_Mod_Torwache_Sekte_01_VonGuru_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ein Akt.";
};

FUNC INT Info_Mod_Torwache_Sekte_01_VonGuru_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torwache_Sekte_01_ZuGuru))
	&& (Guru_Dabei == FALSE)
	&& (Templer_Dabei == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Orun_Cyrco))
	&& (Mod_SektenKorbKram)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torwache_Sekte_01_VonGuru_Info()
{
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_VonGuru_15_00"); //(laut) Was ein Akt.
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_VonGuru_13_01"); //Nicht so laut. Bin doch nicht schwerhörig.
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_VonGuru_15_02"); //Ach so. Noch alles komplett? Goldbeutel nicht berührt?
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_VonGuru_13_03"); //Gar nichts berührt. Beim Schläfer. Hier hast du den Schlüssel für den Korb.

	B_GiveInvItems	(self, hero, ItKe_SektenTorKorb, 1);

	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_VonGuru_15_04"); //Schläfer? Du glaubst an diesen alten Zauber?
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_VonGuru_13_05"); //Manche Gurus sagen, eines Tages kommt er wieder.
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_VonGuru_15_06"); //Das glaubst du wirklich?
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_VonGuru_13_07"); //Na ja ...

	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Die spinnen, die Sumpfis. Immerhin hatte der Guru eine Vision von einer Höhle. In der Nähe eines Zettels. Nun ... den Zettel hatte der Bandit vor der Alten Mine ... also ...");
};

INSTANCE Info_Mod_Torwache_Sekte_01_Hi (C_INFO)
{
	npc		= Mod_1222_TPL_Templer_MT;
	nr		= 1;
	condition	= Info_Mod_Torwache_Sekte_01_Hi_Condition;
	information	= Info_Mod_Torwache_Sekte_01_Hi_Info;
	permanent	= 1;
	important	= 0;
	description	= "Gibts was neues?";
};

FUNC INT Info_Mod_Torwache_Sekte_01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Torwache_Sekte_01_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Torwache_Sekte_01_Hi_15_00"); //Gibts was neues?
	AI_Output(self, hero, "Info_Mod_Torwache_Sekte_01_Hi_13_01"); //Nein, in letzter Zeit ist alles ruhig.
};

INSTANCE Info_Mod_Torwache_Sekte_01_Pickpocket (C_INFO)
{
	npc		= Mod_1222_TPL_Templer_MT;
	nr		= 1;
	condition	= Info_Mod_Torwache_Sekte_01_Pickpocket_Condition;
	information	= Info_Mod_Torwache_Sekte_01_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Torwache_Sekte_01_Pickpocket_Condition()
{
	C_Beklauen	(91, ItMi_Gold, 40);
};

FUNC VOID Info_Mod_Torwache_Sekte_01_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_Pickpocket);

	Info_AddChoice	(Info_Mod_Torwache_Sekte_01_Pickpocket, DIALOG_BACK, Info_Mod_Torwache_Sekte_01_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Torwache_Sekte_01_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Torwache_Sekte_01_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Torwache_Sekte_01_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_Pickpocket);
};

FUNC VOID Info_Mod_Torwache_Sekte_01_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Torwache_Sekte_01_Pickpocket);
};

INSTANCE Info_Mod_Torwache_Sekte_01_EXIT (C_INFO)
{
	npc		= Mod_1222_TPL_Templer_MT;
	nr		= 1;
	condition	= Info_Mod_Torwache_Sekte_01_EXIT_Condition;
	information	= Info_Mod_Torwache_Sekte_01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Torwache_Sekte_01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Torwache_Sekte_01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};