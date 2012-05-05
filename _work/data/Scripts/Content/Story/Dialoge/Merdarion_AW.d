INSTANCE Info_Mod_Merdarion_AW_Hi (C_INFO)
{
	npc		= Mod_9004_KDW_Merdarion_AW;
	nr		= 1;
	condition	= Info_Mod_Merdarion_AW_Hi_Condition;
	information	= Info_Mod_Merdarion_AW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Merdarion_AW_Hi_Condition()
{
	if (Wld_IsTime(00,00,06,05))
	&& (LEAVE_PORTALTEMPEL_FIRSTTIME_ONETIME == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Merdarion_AW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Merdarion_AW_Hi_06_00"); //Adanos sei Dank, du bist endlich aufgewacht.
	AI_Output(hero, self, "Info_Mod_Merdarion_AW_Hi_15_01"); //(verwirrt) Aber ... aufgewacht? Was ist geschehen?
	AI_Output(self, hero, "Info_Mod_Merdarion_AW_Hi_06_02"); //Wir fanden dich bewusstlos auf der anderen Seite des Portales vor. Du musst einem Schutzzauber zum Opfer gefallen sein.
	AI_Output(hero, self, "Info_Mod_Merdarion_AW_Hi_15_03"); //Schutzzauber?!
	AI_Output(self, hero, "Info_Mod_Merdarion_AW_Hi_06_04"); //Ja, vermutlich wollten die Erbauer damit einst mögliche Eindringlinge betäuben.
	AI_Output(self, hero, "Info_Mod_Merdarion_AW_Hi_06_05"); //Vielleicht war der Mechanismsus aber früher auch tödlich, hat jedoch über die Jahrhunderte einen großen Teil seiner Magie eingebüßt.
	AI_Output(hero, self, "Info_Mod_Merdarion_AW_Hi_15_06"); //Sehr beruhigend ...
	AI_Output(self, hero, "Info_Mod_Merdarion_AW_Hi_06_07"); //Achja, sprich am besten gleich mit Saturas. Er hat etwas neues herausgefunden.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Merdarion_AW_Nefarius (C_INFO)
{
	npc		= Mod_9004_KDW_Merdarion_AW;
	nr		= 1;
	condition	= Info_Mod_Merdarion_AW_Nefarius_Condition;
	information	= Info_Mod_Merdarion_AW_Nefarius_Info;
	permanent	= 0;
	important	= 0;
	description	= "Saturas schickt mich.";
};

FUNC INT Info_Mod_Merdarion_AW_Nefarius_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Merdarion_AW_Nefarius_Info()
{
	AI_Output(hero, self, "Info_Mod_Merdarion_AW_Nefarius_15_00"); //Saturas schickt mich. Er hat mir aufgetragen die Böden In Khorinis zu reinigen.
	AI_Output(self, hero, "Info_Mod_Merdarion_AW_Nefarius_06_01"); //Ahh, sehr gut. Das wird die Dämonenmagier hoffentlich von weiteren Dummheiten abhalten.
	AI_Output(self, hero, "Info_Mod_Merdarion_AW_Nefarius_06_02"); //Hier hast du sechs magische Wasserperlen und eine Karte, auf welcher die betroffenen Gebiete markiert sind.

	CreateInvItems	(hero, ItMi_Wasserperle, 6);
	CreateInvItems	(hero, ItWr_Map_Perlenkram, 1);

	B_ShowGivenThings	("6 Wasserperlen und Karte erhalten");

	AI_Output(self, hero, "Info_Mod_Merdarion_AW_Nefarius_06_03"); //Möge Adanos dich schützen.

	B_LogEntry	(TOPIC_MOD_ADANOS_BOEDEN, "So, jetzt muss ich nur noch den Markierungen auf der Karte folgen und die Wasserperlen an den entsprechenden Stellen fallen lassen.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Merdarion_AW_Perlen_02 (C_INFO)
{
	npc		= Mod_9004_KDW_Merdarion_AW;
	nr		= 1;
	condition	= Info_Mod_Merdarion_AW_Perlen_02_Condition;
	information	= Info_Mod_Merdarion_AW_Perlen_02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Merdarion_AW_Perlen_02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_06))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Merdarion_AW_Perlen_02_Info()
{
	AI_Output(self, hero, "Info_Mod_Merdarion_AW_Perlen_02_06_00"); //Ahh, ich wurde bereits informiert und habe alles nötige für dich beisammen.
	
	CreateInvItems	(hero, ItMi_Wasserperle, 3);
	CreateInvItems	(hero, ItWr_Map_Perlenkram_02, 1);

	B_ShowGivenThings	("3 Wasserperlen und Karte erhalten");

	AI_Output(hero, self, "Info_Mod_Merdarion_AW_Perlen_02_15_01"); //Ja, es scheint langsam zur Routine zu werden ...

	B_LogEntry	(TOPIC_MOD_ADANOS_BOEDEN, "So, jetzt wieder den Markierungen auf der Karte folgen.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Merdarion_AW_Zeremoniendolch (C_INFO)
{
	npc		= Mod_9004_KDW_Merdarion_AW;
	nr		= 1;
	condition	= Info_Mod_Merdarion_AW_Zeremoniendolch_Condition;
	information	= Info_Mod_Merdarion_AW_Zeremoniendolch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Adanos zum Gruß. Ich möchte etwas über einen Zeremoniendolch wissen.";
};

FUNC INT Info_Mod_Merdarion_AW_Zeremoniendolch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Zeremoniendolch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Merdarion_AW_Zeremoniendolch_Info()
{
	AI_Output(hero, self, "Info_Mod_Merdarion_Zeremoniendolch_15_00"); //Adanos zum Gruß. Ich möchte etwas über einen Zeremoniendolch wissen.
	AI_Output(self, hero, "Info_Mod_Merdarion_Zeremoniendolch_06_01"); //Dann geh zu Riordian. Er hat neue Inschriften entziffern können.
	AI_Output(self, hero, "Info_Mod_Merdarion_Zeremoniendolch_06_02"); //Danke, Meister.
};

INSTANCE Info_Mod_Merdarion_AW_CavalornZuVatras (C_INFO)
{
	npc		= Mod_9004_KDW_Merdarion_AW;
	nr		= 1;
	condition	= Info_Mod_Merdarion_AW_CavalornZuVatras_Condition;
	information	= Info_Mod_Merdarion_AW_CavalornZuVatras_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Cavalon in die Stadt geschickt. Vatras braucht ihn.";
};

FUNC INT Info_Mod_Merdarion_AW_CavalornZuVatras_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_Zeremoniendolch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Merdarion_AW_CavalornZuVatras_Info()
{
	AI_Output(hero, self, "Info_Mod_Merdarion_CavalornZuVatras_15_00"); //Ich habe Cavalon in die Stadt geschickt. Vatras braucht ihn.
	AI_Output(self, hero, "Info_Mod_Merdarion_CavalornZuVatras_06_01"); //Ist in Ordnung.

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Merdarion_AW_NefariusKey (C_INFO)
{
	npc		= Mod_9004_KDW_Merdarion_AW;
	nr		= 1;
	condition	= Info_Mod_Merdarion_AW_NefariusKey_Condition;
	information	= Info_Mod_Merdarion_AW_NefariusKey_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nefarius schickt mich.";
};

FUNC INT Info_Mod_Merdarion_AW_NefariusKey_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_Saturas))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Merdarion_Nefarius))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Merdarion_AW_NefariusKey_Info()
{
	AI_Output(hero, self, "Info_Mod_Merdarion_Nefarius_15_00"); //Nefarius schickt mich. Ich soll bei dir vorbeischauen.
	AI_Output(self, hero, "Info_Mod_Merdarion_Nefarius_06_01"); //Gut, dass du gekommen bist. Es gibt in den Ruinen auf Khorinis einen Teleporter. Mit diesem Schlüssel kommt du durch die Tür.

	B_GiveInvItems	(self, hero, ItKe_PORTALTEMPELWALKTHROUGH_ADDON, 1);

	AI_Output(self, hero, "Info_Mod_Merdarion_Nefarius_06_02"); //Dann gibt es noch einen weiteren Teleporter in der Nähe der Taverne "Zur toten Harpie". Auch dieser Teleporter ist durch eine Tür geschützt.
	AI_Output(self, hero, "Info_Mod_Merdarion_Nefarius_06_03"); //Mit diesem Schlüssel kannst du die Tür öffnen.

	B_GiveInvItems	(self, hero, ITKE_ORLAN_TELEPORTSTATION, 1);

	AI_Output(self, hero, "Info_Mod_Merdarion_Nefarius_06_04"); //Und nun beeile dich.
};

INSTANCE Info_Mod_Merdarion_AW_Gast (C_INFO)
{
	npc		= Mod_9004_KDW_Merdarion_AW;
	nr		= 1;
	condition	= Info_Mod_Merdarion_AW_Gast_Condition;
	information	= Info_Mod_Merdarion_AW_Gast_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum bist du überhaupt mitgekommen?";
};

FUNC INT Info_Mod_Merdarion_AW_Gast_Condition()
{
	if (Mod_Saturas_Gast == 1)
	{
		Info_Mod_Merdarion_AW_Gast.description = "Kannst du mir bei der Suche nach dem Dieb helfen?";
	}
	else
	{
		Info_Mod_Merdarion_AW_Gast.description = "Hast du heute Nacht etwas Ungewöhnliches gesehen?";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_UngebeterBesucher))
	&& (Mod_Saturas_Gast_Fortschritt == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Merdarion_AW_Gast_Info()
{
	if (Mod_Saturas_Gast == 1)
	{
		AI_Output(hero, self, "Info_Mod_Merdarion_AW_Gast_15_00"); //Kannst du mir bei der Suche nach dem Dieb helfen?
		AI_Output(self, hero, "Info_Mod_Merdarion_AW_Gast_06_01"); //Vielleicht. Vielleicht auch nicht.
		AI_Output(self, hero, "Info_Mod_Merdarion_AW_Gast_06_02"); //Als ich vor ein paar Stunden meinen Blick schweifen ließ, beobachtete ich aus den Augenwinkeln eine Bewegung dort drüben bei den Ruinen.
		AI_Output(self, hero, "Info_Mod_Merdarion_AW_Gast_06_03"); //Wahrscheinlich handelte es sich um irgendein Tier.

		B_LogEntry	(TOPIC_MOD_SATURAS_TAGGAST, "Merdarion hat eine Bewegung zwischen den Ruinen wahrgenommen. Könnte also sein, dass ich dort eine Spur finde.");

		Mod_Saturas_Gast_Fortschritt = 1;

		B_StartOtherRoutine	(Mod_115_NONE_Eremit_AW, "ATWMS");
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Merdarion_AW_Gast_15_04"); //Hast du heute Nacht etwas Ungewöhnliches gesehen?
		AI_Output(self, hero, "Info_Mod_Merdarion_AW_Gast_06_05"); //(verärgert) Ja, allerdings! Ich habe gerade von vielen schönen Frauen geträumt, bevor du mich geweckt hast!
		AI_Output(hero, self, "Info_Mod_Merdarion_AW_Gast_15_06"); //Jemand hat euch bestohlen.
		AI_Output(self, hero, "Info_Mod_Merdarion_AW_Gast_06_07"); //Das interessiert mich im Moment herzlich wenig. Gute Nacht!
	};
};

INSTANCE Info_Mod_Merdarion_AW_EXIT (C_INFO)
{
	npc		= Mod_9004_KDW_Merdarion_AW;
	nr		= 1;
	condition	= Info_Mod_Merdarion_AW_EXIT_Condition;
	information	= Info_Mod_Merdarion_AW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Merdarion_AW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Merdarion_AW_EXIT_Info()
{
	AI_Output(self, hero, "Info_Mod_Merdarion_AW_EXIT_06_00"); //Möge für immer das Gleichgewicht gegeben sein!

	AI_StopProcessInfos	(self);
};