INSTANCE Info_Mod_Nick_Hi (C_INFO)
{
	npc		= Mod_7050_ZOM_Nick_MT;
	nr		= 1;
	condition	= Info_Mod_Nick_Hi_Condition;
	information	= Info_Mod_Nick_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Nick_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nick_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Nick_Hi_04_00"); //Du bist keins von diesen Tieren, was machst du hier?
	
	Info_ClearChoices	(Info_Mod_Nick_Hi);

	Info_AddChoice	(Info_Mod_Nick_Hi, "Du kannst sprechen?", Info_Mod_Nick_Hi_C);
	Info_AddChoice	(Info_Mod_Nick_Hi, "Ich bin hier, um dich zu töten.", Info_Mod_Nick_Hi_B);
	Info_AddChoice	(Info_Mod_Nick_Hi, "Ich möchte wissen, warum du all diese Tiere umbringst.", Info_Mod_Nick_Hi_A);
};

FUNC VOID Info_Mod_Nick_Hi_E()
{
	AI_Output(self, hero, "Info_Mod_Nick_Hi_E_04_00"); //Eins von diesen Biestern hat meinen Kopf gefressen und ist abgehauen!
	AI_Output(self, hero, "Info_Mod_Nick_Hi_E_04_01"); //Ich kann 	nicht genau sagen, wie es aussah, aber ich bin mir sicher, dass es zwei Beine und keine Arme hatte.
	AI_Output(self, hero, "Info_Mod_Nick_Hi_E_04_02"); //Mittlerweile glaube ich aber nicht mehr, dass es hier ist.
	AI_Output(hero, self, "Info_Mod_Nick_Hi_E_15_03"); //Soll ich dir deinen Kopf zurückbringen?
	AI_Output(self, hero, "Info_Mod_Nick_Hi_E_04_04"); //Das wäre wunderbar.
	AI_Output(self, hero, "Info_Mod_Nick_Hi_E_04_05"); //Das Letzte, woran ich mich erinnere ist, dass ich an der Kreuzung einer alten Ruine und einer alten ... hm ... vielleicht Bibliothek von zweibeinigen Tieren angefallen wurde.
	AI_Output(self, hero, "Info_Mod_Nick_Hi_E_04_06"); //Am besten suchst du dort zuerst.
	AI_Output(hero, self, "Info_Mod_Nick_Hi_E_15_07"); //Ich werde dort suchen. Bis später.
	AI_Output(self, hero, "Info_Mod_Nick_Hi_E_04_08"); //Ich freue mich schon auf unser Wiedersehen. Ich verspreche, bis dahin keines dieser Tiere mehr zu töten.

	B_LogEntry	(TOPIC_MOD_ANOR_NICK, "An der Kreuzung des Kastells und der Felsenfestung ist Nick von Scavengern oder womöglich von Snappern angefallen worden. Ich werde mich dort mal umsehen.");

	Wld_InsertNpc	(Mod_10016_MIN_Brad_MT, "CASTLE");

	Wld_InsertNpc	(Snapper,	"FP_ROAM_BLOODHOUND_PLATEAU3");
	Wld_InsertNpc	(Snapper,	"FP_ROAM_BLOODHOUND_PLATEAU4");
	Wld_InsertNpc	(Snapper,	"FP_ROAM_BLOODHOUND_PLATEAU5");
	Wld_InsertNpc	(Snapper,	"FP_ROAM_BLOODHOUND_PLATEAU6");
	Wld_InsertNpc	(Snapper,	"PLATEAU_ROUND03");
	Wld_InsertNpc	(Snapper,	"PLATEAU_ROUND03");
	Wld_InsertNpc	(Snapper,	"PLATEAU_ROUND03");
	Wld_InsertNpc	(Snapper,	"PATH_TO_PLATEAU04_BRIDGE");
	Wld_InsertNpc	(Snapper,	"PATH_TO_PLATEAU04_BRIDGE");
	Wld_InsertNpc	(Snapper,	"PATH_TO_PLATEAU04_BRIDGE");

	Info_ClearChoices	(Info_Mod_Nick_Hi);
};

FUNC VOID Info_Mod_Nick_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Nick_Hi_C_15_00"); //Du kannst sprechen?
	AI_Output(self, hero, "Info_Mod_Nick_Hi_C_04_01"); //Ich brauche keine Stimmbänder und keinen Mund. Außerdem bin ich Bauchredner.

	Info_ClearChoices	(Info_Mod_Nick_Hi);

	Info_AddChoice	(Info_Mod_Nick_Hi, "Ich bin hier, um dich zu töten.", Info_Mod_Nick_Hi_B);
	Info_AddChoice	(Info_Mod_Nick_Hi, "Ich möchte wissen, warum du all diese Tiere umbringst.", Info_Mod_Nick_Hi_A);
};

FUNC VOID Info_Mod_Nick_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Nick_Hi_A_15_00"); //Ich möchte wissen, warum du all diese Tiere umbringst.
	AI_Output(self, hero, "Info_Mod_Nick_Hi_A_04_01"); //Warum?

	Info_Mod_Nick_Hi_E();
};

FUNC VOID Info_Mod_Nick_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Nick_Hi_B_15_00"); //Ich bin hier, um dich zu töten.
	AI_Output(self, hero, "Info_Mod_Nick_Hi_B_04_01"); //Du willst mich töten? Du kannst mich nicht töten. Ich bin nämlich schon tot. (Lacht leise) Warum willst du mich denn loswerden?

	Info_ClearChoices	(Info_Mod_Nick_Hi);

	Info_AddChoice	(Info_Mod_Nick_Hi, "Das ist mein Auftrag.", Info_Mod_Nick_Hi_F);
	Info_AddChoice	(Info_Mod_Nick_Hi, "Ich will nicht, dass unschuldige Tiere sterben.", Info_Mod_Nick_Hi_D);
};

FUNC VOID Info_Mod_Nick_Hi_F()
{
	AI_Output(hero, self, "Info_Mod_Nick_Hi_F_15_00"); //Das ist mein Auftrag.
	AI_Output(self, hero, "Info_Mod_Nick_Hi_F_04_01"); //Vergiss es. Du wirst mich nur los, wenn du mir hilfst.
	AI_Output(hero, self, "Info_Mod_Nick_Hi_F_15_02"); //Wie kann ich dir helfen?

	Info_Mod_Nick_Hi_E();
};

FUNC VOID Info_Mod_Nick_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Nick_Hi_D_15_00"); //Ich will nicht, dass unschuldige Tiere sterben.

	Info_Mod_Nick_Hi_E();
};

INSTANCE Info_Mod_Nick_Kopf (C_INFO)
{
	npc		= Mod_7050_ZOM_Nick_MT;
	nr		= 1;
	condition	= Info_Mod_Nick_Kopf_Condition;
	information	= Info_Mod_Nick_Kopf_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Nick_Kopf_Condition()
{
	if (Npc_HasItems(hero, ItMi_NicksKopf) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nick_Kopf_Info()
{
	AI_Output(self, hero, "Info_Mod_Nick_Kopf_04_00"); //Und? Wie ist es dir auf der Suche ergangen?
	AI_Output(hero, self, "Info_Mod_Nick_Kopf_15_01"); //Es waren Snapper, die dir den Kopf abgebissen haben. Anscheinend hat ein Minotaurus sie umgebracht und den Kopf an sich gebracht. Ich habe den Kopf jedoch inzwischen.
	AI_Output(self, hero, "Info_Mod_Nick_Kopf_04_02"); //Gibst du ihn mir dann wieder?
	
	Info_ClearChoices	(Info_Mod_Nick_Kopf);

	Info_AddChoice	(Info_Mod_Nick_Kopf, "Was bekomme ich dafür?", Info_Mod_Nick_Kopf_B);
	Info_AddChoice	(Info_Mod_Nick_Kopf, "Natürlich. Hier hast du ihn ihn.", Info_Mod_Nick_Kopf_A);
};

FUNC VOID Info_Mod_Nick_Kopf_A()
{
	AI_Output(hero, self, "Info_Mod_Nick_Kopf_A_15_00"); //Natürlich. Hier hast du ihn ihn.

	B_GiveInvItems	(hero, self, ItMi_NicksKopf, 1);
	Npc_RemoveInvItems	(self, ItMi_NicksKopf, 1);

	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"ZOM_HEAD", 0,  		DEFAULT,	ITAR_Pir_Zombie);

	AI_Output(self, hero, "Info_Mod_Nick_Kopf_A_04_01"); //Vielen Dank, Fremder! Hier hast du mein letztes Gold, ich brauche es jetzt sowieso nicht mehr.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	B_LogEntry	(TOPIC_MOD_ANOR_NICK, "Nick ist endlich erlöst. Ich sollte zurück zu Anor gehen und ihm Bericht erstatten, dass das Tiersterben aufgehört hat.");

	Info_ClearChoices	(Info_Mod_Nick_Kopf);
};

FUNC VOID Info_Mod_Nick_Kopf_G()
{
	AI_Output(self, hero, "Info_Mod_Nick_Kopf_G_04_00"); //Vielen Dank, Fremder!

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	B_LogEntry	(TOPIC_MOD_ANOR_NICK, "Nick ist endlich erlöst. Ich sollte zurück zu Anor gehen und ihm Bericht erstatten, dass das Tiersterben aufgehört hat.");

	Info_ClearChoices	(Info_Mod_Nick_Kopf);
};

FUNC VOID Info_Mod_Nick_Kopf_B()
{
	AI_Output(hero, self, "Info_Mod_Nick_Kopf_B_15_00"); //Was bekomme ich dafür?
	AI_Output(self, hero, "Info_Mod_Nick_Kopf_B_04_01"); //Ich werde aufhören, unschuldige Tiere zu töten. Außerdem müsste ich auch viele Menschen auf der Suche nach dir umbringen.
	AI_Output(self, hero, "Info_Mod_Nick_Kopf_B_04_02"); //Und du kannst Gold haben. Ich brauche es nicht mehr, wenn ich meinen Kopf zurück habe.

	Info_ClearChoices	(Info_Mod_Nick_Kopf);

	Info_AddChoice	(Info_Mod_Nick_Kopf, "Das reicht mir nicht.", Info_Mod_Nick_Kopf_F);
	Info_AddChoice	(Info_Mod_Nick_Kopf, "Alles klar, hier hast du deinen Kopf.", Info_Mod_Nick_Kopf_D);
};

FUNC VOID Info_Mod_Nick_Kopf_F()
{
	AI_Output(hero, self, "Info_Mod_Nick_Kopf_F_15_00"); //Das reicht mir nicht.
	AI_Output(self, hero, "Info_Mod_Nick_Kopf_F_04_01"); //Ich kann dir nicht mehr geben.
	AI_Output(hero, self, "Info_Mod_Nick_Kopf_F_15_02"); //Wie kann ich dir helfen?

	Info_ClearChoices	(Info_Mod_Nick_Kopf);

	Info_AddChoice	(Info_Mod_Nick_Kopf, "Dann bekommst du halt deinen Kopf nicht zurück.", Info_Mod_Nick_Kopf_E);
	Info_AddChoice	(Info_Mod_Nick_Kopf, "Dann ist hier der Kopf.", Info_Mod_Nick_Kopf_C);
};

FUNC VOID Info_Mod_Nick_Kopf_D()
{
	AI_Output(hero, self, "Info_Mod_Nick_Kopf_D_15_00"); //Alles klar, hier hast du deinen Kopf.

	B_GiveInvItems	(hero, self, ItMi_NicksKopf, 1);
	Npc_RemoveInvItems	(self, ItMi_NicksKopf, 1);

	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"ZOM_HEAD", 0,  		DEFAULT,	ITAR_Pir_Zombie);

	Info_Mod_Nick_Kopf_G();
};

FUNC VOID Info_Mod_Nick_Kopf_E()
{
	AI_Output(hero, self, "Info_Mod_Nick_Kopf_E_15_00"); //Dann bekommst du halt deinen Kopf nicht zurück.
	AI_Output(self, hero, "Info_Mod_Nick_Kopf_E_04_01"); //Na gut Fremder. Ich gebe dir auch noch ein paar Erzbrocken.
	AI_Output(hero, self, "Info_Mod_Nick_Kopf_E_15_02"); //Hier hast du den Kopf.

	B_GiveInvItems	(hero, self, ItMi_NicksKopf, 1);
	Npc_RemoveInvItems	(self, ItMi_NicksKopf, 1);

	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"ZOM_HEAD", 0,  		DEFAULT,	ITAR_Pir_Zombie);

	AI_Output(self, hero, "Info_Mod_Nick_Kopf_E_04_03"); //Danke. Endlich Ruhe.

	CreateInvItems	(hero, ItMi_Gold, 250);
	CreateInvItems	(hero, ItMi_Nugget, 5);

	B_ShowGivenThings	("250 Gold und 5 Erzbrocken erhalten");

	B_LogEntry	(TOPIC_MOD_ANOR_NICK, "Nick ist endlich erlöst. Ich sollte zurück zu Anor gehen und ihm Bericht erstatten, dass das Tiersterben aufgehört hat.");

	Info_ClearChoices	(Info_Mod_Nick_Kopf);
};

FUNC VOID Info_Mod_Nick_Kopf_C()
{
	AI_Output(hero, self, "Info_Mod_Nick_Kopf_C_15_00"); //Dann ist hier der Kopf.

	B_GiveInvItems	(hero, self, ItMi_NicksKopf, 1);
	Npc_RemoveInvItems	(self, ItMi_NicksKopf, 1);

	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"ZOM_HEAD", 0,  		DEFAULT,	ITAR_Pir_Zombie);

	Info_Mod_Nick_Kopf_G();
};

INSTANCE Info_Mod_Nick_EXIT (C_INFO)
{
	npc		= Mod_7050_ZOM_Nick_MT;
	nr		= 1;
	condition	= Info_Mod_Nick_EXIT_Condition;
	information	= Info_Mod_Nick_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Nick_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nick_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};