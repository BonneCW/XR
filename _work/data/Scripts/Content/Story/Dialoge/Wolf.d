INSTANCE Info_Mod_Wolf_Hi (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_Hi_Condition;
	information	= Info_Mod_Wolf_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wolf_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wolf_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Wolf_Hi_31_00"); //Hey, du lebst ja noch. Hätte nicht gedacht, dass wir uns noch mal sehen.
	AI_Output(self, hero, "Info_Mod_Wolf_Hi_31_01"); //Die Minecrawlerrüstung scheint ja ganz schön stabil gewesen zu sein.
	AI_Output(hero, self, "Info_Mod_Wolf_Hi_15_02"); //Ja, da hast du ganze Arbeit geleistet.
	AI_Output(self, hero, "Info_Mod_Wolf_Hi_31_03"); //Stimmt ... wirklich zwei Prachtstücke, die ich da zusammengebastelt hatte.
	AI_Output(hero, self, "Info_Mod_Wolf_Hi_15_04"); //Zwei? Wo ist die andere?
	AI_Output(self, hero, "Info_Mod_Wolf_Hi_31_05"); //Ich hab sie meinem alten Kumpel Gestath gegeben, mit dem ich am Rande der Barriere Handel trieb.
	AI_Output(self, hero, "Info_Mod_Wolf_Hi_31_06"); //Er hat mir die Dinge besorgt, die es vor allem außerhalb unseres Gefängnisses gab, und ich habe ihm dafür einige spezielle Gegenstände gegeben, welche die Kolonie hervorgebracht hatte.
	AI_Output(self, hero, "Info_Mod_Wolf_Hi_31_07"); //Er wollte dann in irgendeine unwirtliche Gegend, die von wilden Bestien bewohnt wird ... ein Paradies für Jäger, wie er jedenfalls meinte.
	AI_Output(self, hero, "Info_Mod_Wolf_Hi_31_08"); //Habe ihn nach dem Fall der Barriere auf jeden Fall nicht wieder zu Gesicht bekommen.
	AI_Output(hero, self, "Info_Mod_Wolf_Hi_15_09"); //Kannst du mir noch mal so eine Rüstung basteln?
	AI_Output(self, hero, "Info_Mod_Wolf_Hi_31_10"); //Könnte ich schon. Aber dazu bräuchte ich eben die nötigen Rohstoffe. Weißt du denn noch, wie man den Biestern die Platten abzieht?
	AI_Output(hero, self, "Info_Mod_Wolf_Hi_15_11"); //Also ... ich habe so einiges Vergessen ...
	AI_Output(self, hero, "Info_Mod_Wolf_Hi_31_12"); //Nun gut, ich könnte es dir noch mal zeigen. Aber ohne Crawlerkrieger brächte uns auch das nichts.
	AI_Output(hero, self, "Info_Mod_Wolf_Hi_15_13"); //Wo werde ich welche finden?
	AI_Output(self, hero, "Info_Mod_Wolf_Hi_31_14"); //Ich weiß nicht ... in der Nähe würde mir eigentlich nichts in den Sinn kommen ... höchstens im Süden.
	AI_Output(self, hero, "Info_Mod_Wolf_Hi_31_15"); //Gorn hatte nämlich irgendetwas von einer verfluchten Festung in den Bergen erzählt, die er einnehmen wollte. Auf jeden Fall noch nicht erschlossen.
	AI_Output(self, hero, "Info_Mod_Wolf_Hi_31_16"); //Womöglich gibt es da Höhlen mit den Viechern ... keine Ahnung.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_SÖLDNER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_SÖLDNER, "Wolf kann mir wieder zeigen, wie ich an Crawlerplatten komme.");
};

INSTANCE Info_Mod_Wolf_MinecrawlerRuestung (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_MinecrawlerRuestung_Condition;
	information	= Info_Mod_Wolf_MinecrawlerRuestung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe einige Crawlerplatten.";
};

FUNC INT Info_Mod_Wolf_MinecrawlerRuestung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wolf_Hi))
	&& (Npc_HasItems(hero, ItAt_CrawlerPlate) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wolf_MinecrawlerRuestung_Info()
{
	AI_Output(hero, self, "Info_Mod_Wolf_MinecrawlerRuestung_15_00"); //Ich habe einige Crawlerplatten.
	AI_Output(self, hero, "Info_Mod_Wolf_MinecrawlerRuestung_31_01"); //Tatsächlich?

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Wolf_MinecrawlerRuestung_31_02"); //(zu sich selbst) Es gibt hier also doch Crawlerkrieger ... das ist gut.

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Wolf_MinecrawlerRuestung_31_03"); //(zum Helden) Wenn du mir mindestens 15 Stück davon besorgst, kann ich dir eine neue Rüstung basteln.
	AI_Output(hero, self, "Info_Mod_Wolf_MinecrawlerRuestung_15_04"); //15 Stück diesmal?!
	AI_Output(self, hero, "Info_Mod_Wolf_MinecrawlerRuestung_31_05"); //Hey, du hast doch selbst zugegeben, dass dir deine Minecrawlerrüstung damals im Minental das Leben gerettet hat.
	AI_Output(self, hero, "Info_Mod_Wolf_MinecrawlerRuestung_31_06"); //Daher halte ich es nur für angemessen, wenn ich dieses Mal einen etwas größeren Profit davon habe.
	AI_Output(self, hero, "Info_Mod_Wolf_MinecrawlerRuestung_31_07"); //Und es ist auch nicht meine Schuld, dass du deine alte Rüstung verloren hast.
	AI_Output(self, hero, "Info_Mod_Wolf_MinecrawlerRuestung_31_08"); //Außerdem sollten die paar Crawler mehr oder weniger auch keinen Unterschied für dich machen, nachdem du es mit Orks, Untoten und Dämonen aufgenommen hast.
	AI_Output(self, hero, "Info_Mod_Wolf_MinecrawlerRuestung_31_09"); //Also, wie gesagt, 15 Platten und jeder ist fein raus.
};

INSTANCE Info_Mod_Wolf_MinecrawlerRuestung2 (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_MinecrawlerRuestung2_Condition;
	information	= Info_Mod_Wolf_MinecrawlerRuestung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier 15 Minecrawlerplatten.";
};

FUNC INT Info_Mod_Wolf_MinecrawlerRuestung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wolf_MinecrawlerRuestung))
	&& (Npc_HasItems(hero, ItAt_CrawlerPlate) >= 15)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wolf_MinecrawlerRuestung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Wolf_MinecrawlerRuestung2_15_00"); //Ich habe hier 15 Minecrawlerplatten.

	B_GiveInvItems	(hero, self, ItAt_CrawlerPlate, 15);

	Npc_RemoveInvItems	(self, ItAt_CrawlerPlate, 15);

	AI_Output(self, hero, "Info_Mod_Wolf_MinecrawlerRuestung2_31_01"); //Spitze! Ich mach mich gleich an die Arbeit. Komm in paar Tagen wieder vorbei.

	Mod_Wolf_MinecrawlerRuestung_Day = Wld_GetDay();

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Wolf_MinecrawlerRuestung3 (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_MinecrawlerRuestung3_Condition;
	information	= Info_Mod_Wolf_MinecrawlerRuestung3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie ich sehe ist die Crawlerrüstung fertig.";
};

FUNC INT Info_Mod_Wolf_MinecrawlerRuestung3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wolf_MinecrawlerRuestung2))
	&& (Mod_Wolf_MinecrawlerRuestung == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wolf_MinecrawlerRuestung3_Info()
{
	AI_Output(hero, self, "Info_Mod_Wolf_MinecrawlerRuestung3_15_00"); //Wie ich sehe, ist die Crawlerrüstung fertig.
	AI_Output(self, hero, "Info_Mod_Wolf_MinecrawlerRuestung3_31_01"); //Ja ... meine. Für deine brauche ich noch ein paar Tage.

	Mod_Wolf_MinecrawlerRuestung_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Wolf_MinecrawlerRuestung4 (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_MinecrawlerRuestung4_Condition;
	information	= Info_Mod_Wolf_MinecrawlerRuestung4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wolf_MinecrawlerRuestung4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wolf_MinecrawlerRuestung3))
	&& (Wld_GetDay()-2 > Mod_Wolf_MinecrawlerRuestung_Day)
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wolf_MinecrawlerRuestung4_Info()
{
	AI_Output(self, hero, "Info_Mod_Wolf_MinecrawlerRuestung4_31_00"); //Du brauchst gar nicht zu fragen. Hier ist deine schöne neue Crawlerplattenrüstung.

	CreateInvItems	(hero, ITAR_DJG_Crawler, 1);

	B_ShowGivenThings	("Rüstung aus Crawlerplatten erhalten");

	AI_Output(self, hero, "Info_Mod_Wolf_MinecrawlerRuestung4_31_01"); //Viel Spaß damit.

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Wolf_MinecrawlerRuestung5 (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_MinecrawlerRuestung5_Condition;
	information	= Info_Mod_Wolf_MinecrawlerRuestung5_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ist die Rüstung schon fertig?";
};

FUNC INT Info_Mod_Wolf_MinecrawlerRuestung5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wolf_MinecrawlerRuestung3))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Wolf_MinecrawlerRuestung4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wolf_MinecrawlerRuestung5_Info()
{
	AI_Output(hero, self, "Info_Mod_Wolf_MinecrawlerRuestung5_15_00"); //Ist die Rüstung schon fertig?
	AI_Output(self, hero, "Info_Mod_Wolf_MinecrawlerRuestung5_31_01"); //Nein, ich brauche noch etwas Zeit.
};

INSTANCE Info_Mod_Wolf_Snapperbogen (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_Snapperbogen_Condition;
	information	= Info_Mod_Wolf_Snapperbogen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wolf_Snapperbogen_Condition()
{
	var C_ITEM rwp;
	rwp = Npc_GetEquippedMeleeWeapon(hero);

	if (Hlp_IsItem(rwp, ItRw_Snapperbogen) == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wolf_Snapperbogen_Info()
{
	AI_Output(self, hero, "Info_Mod_Wolf_Snapperbogen_31_00"); //Warte mal. Was ist das für ein merkwürdiger Bogen auf deinem Rücken?
	AI_Output(hero, self, "Info_Mod_Wolf_Snapperbogen_15_01"); //Ein Snapperbogen. Schon mal einen gesehen?
	AI_Output(self, hero, "Info_Mod_Wolf_Snapperbogen_31_02"); //Zeig mal.

	B_GiveInvItems	(hero, self, ItRw_Snapperbogen, 1);

	EquipItem	(self, ItRw_Snapperbogen);

	AI_ReadyRangedWeapon	(self);

	AI_PlayAni	(self, "T_1HINSPECT");

	AI_DrawWeapon	(self);

	AI_UnequipWeapons	(self);

	B_GiveInvItems	(self, hero, ItRw_Snapperbogen, 1);

	AI_Output(self, hero, "Info_Mod_Wolf_Snapperbogen_31_03"); //Hmm, irgendwie habe ich das Gefühl, so einen Bogen schon mal irgendwo gesehen zu haben ... hmm.
	AI_Output(self, hero, "Info_Mod_Wolf_Snapperbogen_31_04"); //Aber warte mal ... der ist ja erstaunlich leicht zu handhaben ... ideal für die Jagd nach Wildtieren.
	AI_Output(self, hero, "Info_Mod_Wolf_Snapperbogen_31_05"); //Verkaufst du ihn mir? Ich würde dir glatt ... 800 Goldstücke dafür geben.
};

INSTANCE Info_Mod_Wolf_Snapperbogen2 (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_Snapperbogen2_Condition;
	information	= Info_Mod_Wolf_Snapperbogen2_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Snapperbogen für 800 Goldstücke verkaufen)";
};

FUNC INT Info_Mod_Wolf_Snapperbogen2_Condition()
{
	if (Npc_HasItems(hero, ItRw_Snapperbogen) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wolf_Snapperbogen2_Info()
{
	B_GiveInvItems	(hero, self, ItRw_Snapperbogen, 1);

	AI_Output(self, hero, "Info_Mod_Wolf_Snapperbogen2_31_00"); //Hat mich gefreut mit dir Geschäfte gemacht zu haben.

	B_GiveInvItems	(self, hero, ItMi_Gold, 800);

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Wolf_Snapperbogen2_31_01"); //(zu sich selbst) Und jetzt schau ich mir das Ding mal genau an ... wäre doch gelacht, wenn ich nicht auch solche Bögen herstellen könnte.

	B_GivePlayerXP	(400);
};

INSTANCE Info_Mod_Wolf_Lehrer (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_Lehrer_Condition;
	information	= Info_Mod_Wolf_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Wolf_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wolf_Hi))
	&& ((Mod_Gilde == 5)
	|| (Mod_Gilde == 4)
	|| (Mod_Gilde == 19))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wolf_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	if (Mod_Schwierigkeit != 4)
	{
		AI_Output(self, hero, "Info_Mod_Wolf_Lehrer_31_01"); //Ich kann dir helfen geschickter zu werden und ich kann dir den Umgang mit einem Bogen beibringen.
		AI_Output(self, hero, "Info_Mod_Wolf_Lehrer_31_02"); //Ich kann dir auch zeigen, wie du Pfeile herstellst.

		Log_CreateTopic	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, "Wolf kann mir helfen geschickter zu werden, den Umgang mit einem Bogen beibringen und zeigen, wie ich Pfeile herstelle.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Wolf_Lehrer_31_03"); //Ich kann dir zeigen, wie du Pfeile herstellst.

		Log_CreateTopic	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, "Wolf kann mir zeigen, wie ich Pfeile herstelle.");
	};
};

INSTANCE Info_Mod_Wolf_Lernen (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_Lernen_Condition;
	information	= Info_Mod_Wolf_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir was bei.";
};

FUNC INT Info_Mod_Wolf_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wolf_Lehrer))
	&& ((Mod_Gilde == 5)
	|| (Mod_Gilde == 4)
	|| (Mod_Gilde == 19))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wolf_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Wolf_Lernen_15_00"); //Bring mir was bei.
	AI_Output(self, hero, "Info_Mod_Wolf_Lernen_31_01"); //Was willst du lernen?

	Info_ClearChoices	(Info_Mod_Wolf_Lernen);

	Info_AddChoice 		(Info_Mod_Wolf_Lernen, DIALOG_BACK, Info_Mod_Wolf_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Wolf_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Wolf_Lernen_Geschick_5);
	Info_AddChoice		(Info_Mod_Wolf_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Wolf_Lernen_Geschick_1);
};

FUNC VOID Info_Mod_Wolf_Lernen_BACK()
{
	Info_ClearChoices (Info_Mod_Wolf_Lernen);
};

FUNC VOID Info_Mod_Wolf_Lernen_Geschick_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_DEXTERITY, 5, 140);
	
	Info_ClearChoices	(Info_Mod_Wolf_Lernen);

	Info_AddChoice 		(Info_Mod_Wolf_Lernen, DIALOG_BACK, Info_Mod_Wolf_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Wolf_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Wolf_Lernen_Geschick_5);
	Info_AddChoice		(Info_Mod_Wolf_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Wolf_Lernen_Geschick_1);
};

FUNC VOID Info_Mod_Wolf_Lernen_Geschick_1()
{
	B_TeachAttributePoints (self, hero, ATR_DEXTERITY, 1, 140);
	
	Info_ClearChoices	(Info_Mod_Wolf_Lernen);

	Info_AddChoice 		(Info_Mod_Wolf_Lernen, DIALOG_BACK, Info_Mod_Wolf_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Wolf_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Wolf_Lernen_Geschick_5);
	Info_AddChoice		(Info_Mod_Wolf_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Wolf_Lernen_Geschick_1);
};

INSTANCE Info_Mod_Wolf_Lernen_Bogen (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_Lernen_Bogen_Condition;
	information	= Info_Mod_Wolf_Lernen_Bogen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir Bogenschießen bei.";
};

FUNC INT Info_Mod_Wolf_Lernen_Bogen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wolf_Lehrer))
	&& (hero.hitchance[NPC_TALENT_BOW] < 100)
	&& ((Mod_Gilde == 5)
	|| (Mod_Gilde == 4)
	|| (Mod_Gilde == 19))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wolf_Lernen_Bogen_Info()
{
	AI_Output(hero, self, "Info_Mod_Wolf_Lernen_Bogen_15_00"); //Bring mir Bogenschießen bei.

	Info_ClearChoices	(Info_Mod_Wolf_Lernen_Bogen);
	
	Info_AddChoice	(Info_Mod_Wolf_Lernen_Bogen, "Zurück.", Info_Mod_Wolf_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Wolf_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Wolf_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Wolf_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Wolf_Lernen_Bogen_1);
};

FUNC VOID Info_Mod_Wolf_Lernen_Bogen_BACK()
{
	Info_ClearChoices	(Info_Mod_Wolf_Lernen_Bogen);
};

FUNC VOID Info_Mod_Wolf_Lernen_Bogen_5()
{
	B_TeachFightTalentPercent_New (self, hero, NPC_TALENT_BOW, 5, 100);

	Info_AddChoice	(Info_Mod_Wolf_Lernen_Bogen, "Zurück.", Info_Mod_Wolf_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Wolf_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Wolf_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Wolf_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Wolf_Lernen_Bogen_1);
};

FUNC VOID Info_Mod_Wolf_Lernen_Bogen_1()
{
	B_TeachFightTalentPercent (self, hero, NPC_TALENT_BOW, 1, 100);

	Info_AddChoice	(Info_Mod_Wolf_Lernen_Bogen, "Zurück.", Info_Mod_Wolf_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Wolf_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Wolf_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Wolf_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Wolf_Lernen_Bogen_1);
};

INSTANCE Info_Mod_Wolf_Schnitzen (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_Schnitzen_Condition;
	information	= Info_Mod_Wolf_Schnitzen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir bei Pfeile zu schnitzen (2 LP)";
};

FUNC INT Info_Mod_Wolf_Schnitzen_Condition()
{
	if (Mod_Schwierigkeit == 4)
	{
		Info_Mod_Wolf_Schnitzen.description = "Bring mir bei Pfeile zu schnitzen (200 Gold)";
	}
	else
	{
		Info_Mod_Wolf_Schnitzen.description = "Bring mir bei Pfeile zu schnitzen (2 LP)";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Wolf_Lehrer))
	&& (Mod_PfeileSchnitzen	== 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wolf_Schnitzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Wolf_Schnitzen_15_00"); //Bring mir bei Pfeile zu schnitzen.

	if ((Mod_Schwierigkeit == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 200))
	|| ((Mod_Schwierigkeit != 4)
	&& (hero.lp >= 2))
	{
		AI_Output(self, hero, "Info_Mod_Wolf_Schnitzen_31_01"); //Ok. Zuerst solltest du dir ein Holzstück bei Thorben kaufen. Dieses nimmst du dann mit an eine Baumsäge und schnitzt es zu etwa 10 Pfeilen.
		AI_Output(self, hero, "Info_Mod_Wolf_Schnitzen_31_02"); //Dann fügst du den Pfeil mit einer Pfeilspitze an einem Amboss zusammen und fertig ist dein Pfeil.

		Mod_PfeileSchnitzen = 1;

		Log_CreateTopic	(TOPIC_MOD_PFEILE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_PFEILE, "Um Pfeile herzustellen, benötige ich Pfeilstäbe. Diese kann ich mir aus Ästen zurechtsägen.");

		if (Mod_Schwierigkeit == 4)
		{
			Npc_RemoveInvItems	(hero, ItMi_Gold, 200);
		}
		else
		{
			hero.lp -= 2;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Wolf_Schnitzen_31_03"); //Komm wieder, wenn du bereit bist.
	};
};

INSTANCE Info_Mod_Wolf_Spitzen (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_Spitzen_Condition;
	information	= Info_Mod_Wolf_Spitzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bring mir bei Pfeilspitzen zu schmieden (2 LP)";
};

FUNC INT Info_Mod_Wolf_Spitzen_Condition()
{
	if (Mod_Schwierigkeit == 4)
	{
		Info_Mod_Wolf_Spitzen.description = "Bring mir bei, Pfeilspitzen zu schmieden (200 Gold)";
	}
	else
	{
		Info_Mod_Wolf_Spitzen.description = "Bring mir bei, Pfeilspitzen zu schmieden (2 LP)";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Wolf_Lehrer))
	&& (Mod_PfeileSpitzen == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wolf_Spitzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Wolf_Spitzen_15_00"); //Bring mir bei, Pfeilspitzen zu schmieden.

	if ((Mod_Schwierigkeit == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 200))
	|| ((Mod_Schwierigkeit != 4)
	&& (hero.lp >= 2))
	{
		AI_Output(self, hero, "Info_Mod_Wolf_Spitzen_31_01"); //Nimm ein Stück Rohstahl und geh an einen Amboss. Aus einem Stück Rohstahl bekommst du ungefähr 10 Pfeilspitzen.

		Mod_PfeileSpitzen = 1;

		Log_CreateTopic	(TOPIC_MOD_PFEILE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_PFEILE, "Um Pfeile herzustellen, benötige ich Pfeilspitzen. Diese kann ich an einem Amboss aus Rohstahl gewinnen.");

		if (Mod_Schwierigkeit == 4)
		{
			Npc_RemoveInvItems	(hero, ItMi_Gold, 200);
		}
		else
		{
			hero.lp -= 2;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Wolf_Spitzen_31_02"); //Komm wieder, wenn du bereit bist.
	};
};

INSTANCE Info_Mod_Wolf_PlattenNehmen (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_PlattenNehmen_Condition;
	information	= Info_Mod_Wolf_PlattenNehmen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wie bekomme ich diese Platten von den Biestern ab? (5 LP)";
};

FUNC INT Info_Mod_Wolf_PlattenNehmen_Condition()
{
	Info_Mod_Wolf_PlattenNehmen.description = B_BuildLearnString("Wie bekomme ich diese Platten von den Biestern ab?", B_GetLearnCostTalent(hero, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate));

	if (Npc_KnowsInfo(hero, Info_Mod_Wolf_Hi))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wolf_PlattenNehmen_Info()
{
	AI_Output(hero, self, "Info_Mod_Wolf_PlattenNehmen_15_00"); //Wie bekomme ich diese Platten von den Biestern ab?

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_CrawlerPlate))
	{
		AI_Output(self, hero, "Info_Mod_Wolf_PlattenNehmen_31_01"); //Das ist relativ einfach. Die Rückenplatten sind nur an deren Rändern mit dem Körper verwachsen.
		AI_Output(self, hero, "Info_Mod_Wolf_PlattenNehmen_31_02"); //Nimm einfach ein Rasiermesser und schneide halbschräg an den Rändern entlang.
	};
};

INSTANCE Info_Mod_Wolf_Pickpocket (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_Pickpocket_Condition;
	information	= Info_Mod_Wolf_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Wolf_Pickpocket_Condition()
{
	C_Beklauen	(137, ItRw_Arrow, 45);
};

FUNC VOID Info_Mod_Wolf_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Wolf_Pickpocket);

	Info_AddChoice	(Info_Mod_Wolf_Pickpocket, DIALOG_BACK, Info_Mod_Wolf_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Wolf_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Wolf_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Wolf_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Wolf_Pickpocket);
};

FUNC VOID Info_Mod_Wolf_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Wolf_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Wolf_Pickpocket);

		Info_AddChoice	(Info_Mod_Wolf_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Wolf_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Wolf_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Wolf_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Wolf_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Wolf_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Wolf_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Wolf_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Wolf_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Wolf_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Wolf_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Wolf_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Wolf_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Wolf_EXIT (C_INFO)
{
	npc		= Mod_798_SLD_Wolf_NW;
	nr		= 1;
	condition	= Info_Mod_Wolf_EXIT_Condition;
	information	= Info_Mod_Wolf_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Wolf_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wolf_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};