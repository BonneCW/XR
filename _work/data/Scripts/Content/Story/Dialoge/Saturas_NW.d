INSTANCE Info_Mod_Saturas_NW_Hi (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Hi_Condition;
	information	= Info_Mod_Saturas_NW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Saturas_NW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_00"); //Was machst du hier? Augenblick mal ... du!?

	B_ReadySpell	(self, SPL_Icecube, SPL_Cost_IceCube);

	AI_Output(hero, self, "Info_Mod_Saturas_NW_Hi_15_01"); //Ähh, ich ...
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_02"); //Nach dem, was du dir im neuen Lager geleistet hast, wagst du dich tatsächlich her?!
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_03"); //Sei froh, dass Milten für dich gebürgt hat und du ein Vertrauter von Xardas bist, dem höchsten Priester Beliars.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_04"); //Und würden die Umstände vom Fall der Barriere für uns nicht im Dunkeln liegen und somit deine Einflussnahme darauf auch nicht völlig ausschließen, ...
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_05"); //... dann solltest du noch in diesem Augenblick zu Eis erstarren und von Blitzen in tausend Stücke zersprengt werden.

	AI_RemoveWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_06"); //Pass also von nun an gut auf, was du machst!
};

INSTANCE Info_Mod_Saturas_NW_Soeldner (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Soeldner_Condition;
	information	= Info_Mod_Saturas_NW_Soeldner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich gehöre zu den Söldnern.";
};

FUNC INT Info_Mod_Saturas_NW_Soeldner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Hi))
	&& (Mod_Gilde == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Soeldner_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Soeldner_15_00"); //Ich gehöre zu den Söldnern.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Soeldner_14_01"); //Dann seh' dich hier ruhig um, aber mach keinen Unfug.
};

INSTANCE Info_Mod_Saturas_NW_RDW (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_RDW_Condition;
	information	= Info_Mod_Saturas_NW_RDW_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich gehöre zum Ring des Wassers.";
};

FUNC INT Info_Mod_Saturas_NW_RDW_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Hi))
	&& (Mod_Gilde == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_RDW_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_RDW_15_00"); //Ich gehöre zum Ring des Wassers.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_RDW_14_01"); //Du hast dich also uns angeschlossen. Ich hoffe du machst keinen Unfug.
};

INSTANCE Info_Mod_Saturas_NW_Brief (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Brief_Condition;
	information	= Info_Mod_Saturas_NW_Brief_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab einen Brief von Xardas für dich.";
};

FUNC INT Info_Mod_Saturas_NW_Brief_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Hi))
	&& (Mod_PortalLance == TRUE)
	&& (Npc_HasItems(hero, XardasLetterForSaturas_Geoeffnet) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Brief_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Brief_15_00"); //Ich hab hier einen Brief von Xardas für dich.

	B_GiveInvItems	(hero, self, XardasLetterForSaturas_Geoeffnet, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Saturas_NW_Brief_14_01"); //Sehr interessant. Gut, du kannst hier bleiben, solltest du jedoch Unfug machen werde ich dich töten.
};

INSTANCE Info_Mod_Saturas_NW_Portal (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Portal_Condition;
	information	= Info_Mod_Saturas_NW_Portal_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe von einem Portal gehört.";
};

FUNC INT Info_Mod_Saturas_NW_Portal_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_InGilde))
	&& (Mod_PortalLance == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Portal_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Portal_15_00"); //Ich habe von einem Portal gehört.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Portal_14_01"); //Das ist richtig, wir haben bei unseren Ausgrabungen ein Portal gefunden.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Portal_14_02"); //Allerdings ist es verschlossen und wir haben noch keinen Weg gefunden es zu öffnen.

	Log_CreateTopic	(TOPIC_MOD_PORTAL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PORTAL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PORTAL, "Saturas hat das Gerücht um ein Portal bestätigt und gesagt, das sie noch keinen Weg gefunden haben das Portal zu öffnen.");
};

INSTANCE Info_Mod_Saturas_NW_DurchsPortal (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_DurchsPortal_Condition;
	information	= Info_Mod_Saturas_NW_DurchsPortal_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich auch durchs Portal gehen wenn es geöffnet ist?";
};

FUNC INT Info_Mod_Saturas_NW_DurchsPortal_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Portal))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_DurchsPortal_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_DurchsPortal_15_00"); //Kann ich auch durchs Portal gehen wenn es geöffnet ist?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_DurchsPortal_14_01"); //Du kannst mitkommen, aber du solltest aufpassen. Wir wissen nicht was uns dort erwartet.

	B_LogEntry	(TOPIC_MOD_PORTAL, "Saturas hat mir gestattet mit durchs Portal zu gehen sobald es geöffnet ist.");
};

INSTANCE Info_Mod_Saturas_NW_WieOeffnen (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_WieOeffnen_Condition;
	information	= Info_Mod_Saturas_NW_WieOeffnen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was können wir tun um das Tor zu öffnen?";
};

FUNC INT Info_Mod_Saturas_NW_WieOeffnen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Portal))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_WieOeffnen_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_WieOeffnen_15_00"); //Was können wir tun um das Tor zu öffnen?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_WieOeffnen_14_01"); //Geh mal zu Nefarius, er ist gerade dabei die Inschriften in den Wänden zu übersetzen.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_WieOeffnen_14_02"); //Vielleicht hat er inzwischen etwas Neues herausgefunden.

	B_LogEntry	(TOPIC_MOD_PORTAL, "Saturas hat mich zu Nefarius geschickt. Ich soll mich bei ihm erkundigen ob es was neues gibt.");
};

INSTANCE Info_Mod_Saturas_NW_Argez (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Argez_Condition;
	information	= Info_Mod_Saturas_NW_Argez_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Argez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_WieOeffnen))
	&& (Mod_Argez == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Argez_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_00"); //Ah, da wäre noch eine Sache, bei der du uns helfen kannst.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_01"); //Dafür, dass ich dich so enttäuscht habe, hast du jetzt ganz schön viel zu tun für mich.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_02"); //Sieh es als Wiedergutmachung.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_03"); //Nun aber zur Sache: Vor kurzem hat es vor den Stadtmauern Khorinis' eine schwere magische Anomalie gegeben.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_04"); //Sie war so stark, dass die Mächtigsten unter den Magiern von jähen Visionen heimgesucht wurden.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_05"); //Wodurch wurde diese Anomalie ausgelöst?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_06"); //Das herauszufinden wird deine Aufgabe sein. Aber ich befürchte das Schlimmste.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_07"); //Die Art der Magie fühlte sich ... dunkel an, auch wenn ich Vergleichbares noch nie gespürt habe.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_08"); //Zusammen mit der Intensität vermute ich, dass sich zu jenem Zeitpunkt einer unserer stärksten Feinde kurz vor der Stadt aufgehalten hat.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_09"); //Sollte es sich bestätigen, wären die Menschen dort nicht mehr sicher.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_10"); //Woher weißt du, dass die Anomalie vor den Stadtmauern von Khorinis aufgetreten ist?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_11"); //Ich war einer derjenigen, die von der Vision überrascht wurden.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_12"); //Sie war zu undeutlich, um sie genau lokalisieren zu können, aber ich erkannte deutlich die Stadtmauern in nur wenigen Metern Entfernung.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_13"); //Du musst herausfinden, wer oder was diese Anomalie ausgelöst hat!
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_14"); //(ironisch) Kein Problem. Ich schätze, ich frage mal rum, wer dort in letzter Zeit schwarze Magie angewandt hat.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_15"); //Ein wenig mehr Ernst, bitte.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_16"); //Es gibt ein einfaches Mittel zum Aufspüren von magischen Anomalien. Ich habe es in diesem Tempel gefunden.

	B_GiveInvItems	(self, hero, ItAm_Anomalie, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_17"); //Ich will das Amulett zurück haben, also verkaufe es bloß nicht und pass darauf auf!
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_18"); //Um es zu benutzen, musst du es lediglich anlegen. Sobald du dich der Stelle näherst, an der die Anomalie ausgelöst wurde, wirst du eine Vision des Hergangs erhalten.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_19"); //Diese ist hoffentlich eindeutiger als die, die wir Magier erlebt haben.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_20"); //Kein Problem. Ich laufe also mit dem Ding hier einfach die Stadtmauer von Khorinis ab?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_21"); //Das sollte genügen, ja. Je früher du dich darum kümmerst, desto besser.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_22"); //Schon verstanden.

	Log_CreateTopic	(TOPIC_MOD_DUNKLEMAGIE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DUNKLEMAGIE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DUNKLEMAGIE, "Irgendwo vor den Stadtmauern von Khorinis hat es eine schwere magische Anomalie gegeben. Saturas hat mir aufgetragen, die Stadtmauern von außen abzulaufen. Um die Anomalie orten zu können, muss ich das Amulett des Unsichtbaren tragen. Sobald ich am richtigen Ort stehe, wird es dafür sorgen, dass ich einen kurzen Blick in die Vergangenheit werfen kann.");
};

INSTANCE Info_Mod_Saturas_NW_Argez2 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Argez2_Condition;
	information	= Info_Mod_Saturas_NW_Argez2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe herausgefunden, wer für die Anomalie verantwortlich ist.";
};

FUNC INT Info_Mod_Saturas_NW_Argez2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Argez))
	&& (Mod_Argez == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Argez2_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_00"); //Ich habe herausgefunden, wer für die Anomalie verantwortlich ist.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_01"); //Tatsächlich? Wer ist es?
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_02"); //Sein Name ist Argez. Ich habe ihn vor Khorinis getroffen und ihm geholfen, in die Stadt zu gelangen.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_03"); //An der Stelle der Anomalie stand plötzlich ein Zombie, der uns angriff, und er verteidigte uns mit diesem Zauber.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_04"); //Du hast ihm in die Stadt geholfen?
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_05"); //Er gab vor, sein Gedächtnis verloren zu haben. Ich habe nichts Böses in ihm erkannt, im Gegenteil.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_06"); //Hmm, eine verdächtige Persönlichkeit allemal.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_07"); //(überlegt) Meinst du, du schaffst es, ihn zu mir zu bringen? Ich würde mich zu gern mit ihm unterhalten.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_08"); //Ich glaube nicht, dass das ein Problem wäre.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_09"); //Ach, bevor du gehst, hätte ich gern mein Amulett zurück.

	if (Npc_HasItems(hero, ItAm_Anomalie) == 1)
	{
		AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_10"); //Hier ist es.

		B_GiveInvItems	(hero, self, ItAm_Anomalie, 1);

		AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_11"); //Danke. Bis später.

		B_GivePlayerXP	(250);

		Mod_AnomalieAmulett = 0;
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_12"); //Tut mir Leid, ich habe es nicht mehr.
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_13"); //(wütend) Bei Beliar, wie konnte ich dir nur vertrauen? Du kannst dir sicher sein, dass dies das letzte Mal war!

		B_GivePlayerXP	(200);
	};

	B_SetTopicStatus	(TOPIC_MOD_DUNKLEMAGIE, LOG_SUCCESS);

	B_LogEntry	(TOPIC_MOD_ARGEZ, "Saturas will sich nun Argez wegen der Anomalie vorknöpfen. Ich soll ihn bitten, den Wassermagier aufzusuchen.");
};

INSTANCE Info_Mod_Saturas_NW_Argez3 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Argez3_Condition;
	information	= Info_Mod_Saturas_NW_Argez3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Argez3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_NW_LosZuSaturas))
	&& (Npc_GetDistToNpc(PC_Friend_NW, hero) < 1500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Argez3_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez3_14_00"); //Du schon wieder. Aber du bringst diesen Argez mit.

	B_GivePlayerXP	(100);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TALKWITHARGEZ");
	B_StartOtherRoutine	(PC_Friend_NW, "ATSATURAS");

	B_SetTopicStatus	(TOPIC_MOD_ARGEZ, LOG_SUCCESS);
};

INSTANCE Info_Mod_Saturas_NW_Argez4 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Argez4_Condition;
	information	= Info_Mod_Saturas_NW_Argez4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Argez4_Condition()
{
	if (Mod_Argez == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Argez4_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez4_14_00"); //Nefarius hat nach dir gefragt. Er meinte, du könntest ihm vielleicht weiterhelfen.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez4_15_01"); //Dann werde ich ihn mal besuchen.
};

INSTANCE Info_Mod_Saturas_NW_Gefangen (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Gefangen_Condition;
	information	= Info_Mod_Saturas_NW_Gefangen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alles in Ordnung?";
};

FUNC INT Info_Mod_Saturas_NW_Gefangen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Riordian_TempelDicht4))
	&& (Npc_IsDead(GardeInnos_4098_Danae))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Gefangen_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_00"); //Alles in Ordnung?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_01"); //Ja, es geht. Danke, dass du uns gerettet hast. Wir stehen tief in deiner Schuld.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_02"); //Was war mit der Garde Innos?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_03"); //Als sie uns überwältigt hatten gingen vier der Gardisten durch das Portal um eine mächtige Waffe zu bergen.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_04"); //Wie lange ist das her?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_05"); //Etwa zwei Stunden.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_06"); //Ich muss die Garde aufhalten bevor sie das Schwert bergen.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_07"); //Dann solltest du dich beeilen, denn die Gardisten waren gut organisiert.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_08"); //Ich werde sofort ducrh das Portal gehen.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_09"); //Viel Glück.
};

INSTANCE Info_Mod_Saturas_NW_Goetter (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Goetter_Condition;
	information	= Info_Mod_Saturas_NW_Goetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was weißt du über die Götterwaffen?";
};

FUNC INT Info_Mod_Saturas_NW_Goetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_UrizielKaputt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Goetter_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Goetter_15_00"); //Was weißt du über die Götterwaffen?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Goetter_14_01"); //Den alten Überlieferungen zufolge soll es drei dieser Artefakte geben. Für jeden Gott eine.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Goetter_14_02"); //Diese Waffen sollen auf die drei Gebiete von Khorinis verteilt worden sein. Diesen Teil, das Minental und Jharkendar.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Goetter_14_03"); //Wir haben von Jharkendar noch nicht viel erforscht, aber in den Inschriften ist die Rede von einem Tempel Adanos'. Dort wirst du sicher eine dieser Waffen finden.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Goetter_14_04"); //Bei der anderen Waffe handelt es sich wohl um den Heiligen Hammer der Feuermagier. Dieser befindet sich zum Glück bereits in unserem Besitz.

	B_LogEntry	(TOPIC_MOD_URIZIEL, "Jede der Götterwaffen ist einem Gott zuzuorden. Die Waffe Beliars habe ich bereits in meinem Besitz. Die Waffe Innos' ist der heilige Hammer der Feuermagier. Und die Waffe Adanos' soll in Jharkendar in einem Tempel Adanos' zu finden sein.");
};

INSTANCE Info_Mod_Saturas_AW_Member_08 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_08_Condition;
	information	= Info_Mod_Saturas_AW_Member_08_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_08_Condition()
{
	if (Mod_WM_Boeden == 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_08_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_00"); //Ich spüre eine starke Erschütterung des Kräftegleichgewichtes und werde von schlimmen Vorahnungen geplagt.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_01"); //Mach dich bitte auf den Weg und versuche herauszufinden, was auf dem Weidenplateau und der Umgebung geschehen ist.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_02"); //Und hör dich am besten auch in der Taverne um, bestimmt gibt es dort auch Informationen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_03"); //Doch bevor du dich auf diese weitere Mission begibst, erscheint es mir an der rechten Zeit, dich in unsere Reihen aufzunehmen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_04"); //Du hast viel für unsere Gemeinschaft getan und dich als würdig erwiesen ein Magier des Wassers du werden.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_05"); //Auch soll es dir dazu verhelfen deine weiteren Prüfungen im Sinne Adanos bestehen zu können.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_06"); //Es steht dir aber natürlich frei den Weg des Wasserkriegers zu beschreiten, um mit Magie und Schwert gleichermaßen zu streiten ...

	Mod_WM_Boeden = 12;

	Log_CreateTopic	(TOPIC_MOD_ADANOS_UNHEIL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ADANOS_UNHEIL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Saturas wird von dunklen Vorahnungen geplagt. Ich soll auf Weidenplateau und Umgebung auskundschaften, was geschehen ist. Auch in der Taverne könnte es Informationen geben.");

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_08);

	Info_AddChoice	(Info_Mod_Saturas_AW_Member_08, "Ich wähle den Weg des Kriegers.", Info_Mod_Saturas_AW_Member_08_B);
	Info_AddChoice	(Info_Mod_Saturas_AW_Member_08, "Ich wähle den Weg der Magiers.", Info_Mod_Saturas_AW_Member_08_A);
};

FUNC VOID Info_Mod_Saturas_AW_Member_08_B()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_B_15_00"); //Ich wähle den Weg des Kriegers.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_B_14_01"); //Wenn das dein Wunsch ist, so wende dich an Ethan. Er wird die weiteren Schritte mit dir begehen.

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_08);
};

FUNC VOID Info_Mod_Saturas_AW_Member_08_A()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_A_15_00"); //Ich wähle den Weg der Magiers.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_01"); //So sei es. Dann leiste nun das Zeugnis zur Verbundenheit mit dem Wasser und sprich die Worte des Eides:
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_02"); //Ich schwöre bei den Mächten der Götter ... und bei der Kraft des heiligen Wassers ...
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_A_15_03"); //Ich schwöre bei den Mächten der Götter ... und bei der Kraft des heiligen Wassers ...
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_04"); //... dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei ...
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_A_15_05"); //... dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei ...
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_06"); //... bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_A_15_07"); //... bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_08"); //Es ist vollbracht. Von nun an wirst du als Magier des Wassers unserer Gemeinschaft dienen und dem Willen Adanos folgen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_09"); //Hier, ich übergebe dir deine Robe des Wassers und den Stab eines Magiers.

	CreateInvItems	(self, ItAr_KDW_L_Addon, 1);
	B_GiveInvItems	(self, hero, ItAr_KDW_L_Addon, 1);
	CreateInvItems	(hero, ItMW_Addon_Stab03, 1);

	Snd_Play ("LEVELUP");

	B_GivePlayerXP	(1000);

	B_Göttergefallen(2, 5);

	Mod_Gilde = 10;

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_10"); //Möge Adanos dich jederzeit geleiten und dir den rechten Weg weisen das Gleichgewicht zu wahren.

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_08);
};

INSTANCE Info_Mod_Saturas_AW_Member_09 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_09_Condition;
	information	= Info_Mod_Saturas_AW_Member_09_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Toten erheben sich aus ihren Gräbern.";
};

FUNC INT Info_Mod_Saturas_AW_Member_09_Condition()
{
	if (Mod_WM_Boeden == 12)
	&& (Mod_WM_SawGraveOne == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_09_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_09_15_00"); //Die Toten erheben sich aus ihren Gräbern. Unter ihnen scheinen sich Kreaturen zu bewegen, die sie anführen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_09_14_01"); //Was sagst du da?! Welche üblen Dämonen treiben da ihr Unwesen …? Versuch unbedingt mehr herauszufinden. Wir forschen indes in den Schriften.

	Mod_WM_DaySave = Wld_GetDay();

	Npc_SetRefuseTalk	(self, 360);

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_10))
	{
		Mod_WM_Boeden = 13;

		Wld_InsertItem	(ItMi_EffektMarker2, "FP_ITEM_ELENASTRUHE");

		Wld_InsertNpc	(Mod_7198_HEX_AttraktiveFrau_NW, "TAVERNE");
	};
};

INSTANCE Info_Mod_Saturas_AW_Member_10 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_10_Condition;
	information	= Info_Mod_Saturas_AW_Member_10_Info;
	permanent	= 0;
	important	= 0;
	description	= "Auf dem Weidenplateau stehen gigantische Kreaturen (...)";
};

FUNC INT Info_Mod_Saturas_AW_Member_10_Condition()
{
	if (Mod_WM_Boeden == 12)
	&& (Mod_WM_SawBigOne == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_10_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_10_15_00"); //Auf dem Weidenplateau stehen gigantische Kreaturen, die von Horden kleinerer dämonischer Geschöpfe umgeben werden, welche ihnen untertan scheinen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_10_14_01"); //Um Adanos Willen! Was du berichtest ist in höchstem Ausmaße beunruhigend. Denn auch diese Kreaturen werden vermutlich ihren Meister haben ...
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_10_14_02"); //Versuch dich auf den Bauernhöfen in der Umgebung des Plateaus umzuhören. Wir brauchen unbedingt noch mehr Hinweise.

	Mod_WM_DaySave = Wld_GetDay();

	Npc_SetRefuseTalk	(self, 360);

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_09))
	{
		Mod_WM_Boeden = 13;

		Wld_InsertItem	(ItMi_EffektMarker2, "FP_ITEM_ELENASTRUHE");

		Wld_InsertNpc	(Mod_7198_HEX_AttraktiveFrau_NW, "TAVERNE");
	};
};

INSTANCE Info_Mod_Saturas_AW_Member_11 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_11_Condition;
	information	= Info_Mod_Saturas_AW_Member_11_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_11_Condition()
{
	if (Mod_WM_Boeden == 13)
	&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_09))
	&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_10))
	&& ((Wld_GetDay() > Mod_WM_DaySave)
	|| (Npc_RefuseTalk(self) == FALSE))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_11_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_00"); //Im Rahmen unserer Nachforschungen haben wir sehr beunruhigendes herausgefunden. Es hatte mich bereits bei der Reinigung der Böden überrascht, dass so wenige Kreaturen entstanden.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_01"); //Es scheint so, als hätte eine uns bis jetzt noch unbekannte Macht, sowohl die Magie Beliars, als auch – und das würde die Stärke dieser Kreaturen erklären – die Macht Innos aufgenommen, vereint und für dieses abscheuliche Werk eingesetzt.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_11_15_02"); //Wie ist nun vorzugehen?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_03"); //Wie bereits erwähnt haben wohl auch diese Kreaturen ihre Meister, die sie herbeiriefen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_04"); //Um Kontrolle über solch mächtige Geschöpfe ausüben zu können, dürften sich die Urheber nicht zu weit von diesen fortbewegen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_05"); //Höre und schaue dich aufmerksam in der Nähe des Weidenplateaus und den Bauernhöfen um. Es muss irgendwelche Anhaltspunkte geben.

	Mod_WM_Boeden = 14;
};

INSTANCE Info_Mod_Saturas_AW_Member_12 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_12_Condition;
	information	= Info_Mod_Saturas_AW_Member_12_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_12_Condition()
{
	if (Mod_WM_Verflucht == 1)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_12_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_12_14_00"); //Du siehst aber gar nicht gut aus. Ein schwarzer Schatten scheint auf dir zu liegen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_12_14_01"); //Geh erst ins Kloster, beschaffe dir Heilung bei Pyrokar und komm dann wieder zu mir, um mir zu berichten, was vorgefallen war.

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Saturas_AW_HexenTalk()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_00"); //Nun, es sind magisch begabte Frauen, die mit den dunklen Mächten verbunden sind.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_01"); //Im Gegensatz zu gewöhnlichen Dämonen-Magiern, die sich nur der Macht  ihres Gottes Beliar bedienen, sind sie viel stärker mit den Sphären des dämonischen verbunden.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_02"); //Sie haben die Existenz gewöhnlicher Menschen hinter sich gelassen und gingen eine feste, dauerhafte Bindung mit dämonischen Mächten ein.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_03"); //Wobei der Grad dieser Verbundenheit von dem jeweiligen Hexenclan abhängt.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_HexenTalk_15_04"); //Es gibt mehrere Clans?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_05"); //Ja, einige Quellen berichten davon.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_06"); //Während manche sich lediglich hin und wieder der  Verwandlungszauber bedienen um ihre menschliche Form  zu wandeln, oder in Tiergestalt Schaden anzurichten, verweilen andere einen großen Teil ihrer Existenz in einer Gestalt, die nicht der menschlichen entspricht.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_07"); //Allen gemein ist jedoch, dass sie lange Zeit über unerkannt unter normalen Menschen leben können, diese beeinflussen, sogar kurzzeitig fast völlige Kontrolle über sie ausüben können und Schadenszauber in ihrer Umgebung wirken.

	Mod_WM_Hexeninfos = 2;

	B_StartOtherRoutine	(Mod_7198_HEX_AttraktiveFrau_NW, "TOT");
};

INSTANCE Info_Mod_Saturas_AW_Member_13 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_13_Condition;
	information	= Info_Mod_Saturas_AW_Member_13_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe etwas herausgefunden.";
};

FUNC INT Info_Mod_Saturas_AW_Member_13_Condition()
{
	if (Mod_WM_Hexeninfos == 1)
	&& (Mod_WM_Verflucht == 0)
	&& (Mod_GenugBauernHinweise == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_13_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_13_15_00"); //Ich habe etwas herausgefunden.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_13_14_01"); //Ja? Berichte.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_13_15_02"); //Auf Khorinis scheint es Frauen zu geben, die der dunklen Magie mächtig sind. Ich glaube es handelt sich um Hexen. So meinte zumindest Pyrokar ...
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_13_14_03"); //Hexen?! Auf Khorinis?! Das ist in der Tat sehr beunruhigend.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_13_15_04"); //Um was für Wesen handelt es sich genau?

	Info_Mod_Saturas_AW_HexenTalk();

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Saturas_AW_Member_14 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_14_Condition;
	information	= Info_Mod_Saturas_AW_Member_14_Info;
	permanent	= 0;
	important	= 0;
	description	= "Könnten sie für das jüngste Unheil verantwortlich sein?";
};

FUNC INT Info_Mod_Saturas_AW_Member_14_Condition()
{
	if (Mod_WM_Hexeninfos == 2)
	&& (Mod_WM_HexenTot == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_14_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_14_15_00"); //Könnten sie für das jüngste Unheil verantwortlich sein?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_01"); //Hmm, schwer zu bestimmen. Einerseits sind sie Meister darin andere Wesen zu kontrollieren.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_02"); //Dass sie jedoch auch dazu in der Lage sein sollten Geschöpfe solcher Macht zu erschaffen ... ich weiß es nicht.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_03"); //Es wäre unter allen Umständen sehr ungewöhnlich, da sie zwar die sphärische Manifestation in Zügen beherrschen, jedoch normalerweise in engen Grenzen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_04"); //Du musst unbedingt weiter nachforschen. Es muss noch Dinge geben, die uns bisher verborgen geblieben sind.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_05"); //Wenn du jedoch auf die Hexen stößt wäre es bestimmt nicht von Nachteil ihrem Treiben ein Ende zu setzen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_06"); //Aber nimm dich in Acht. Es sind mächtige magische Wesen.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Saturas war sich nicht sicher, ob die Hexen für das jüngste Unheil verantwortlich sind. Er wies mich jedoch an ihrer Existenz ein Ende zu setzen, falls ich sie aufspüre.");
};

INSTANCE Info_Mod_Saturas_AW_Member_15 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_15_Condition;
	information	= Info_Mod_Saturas_AW_Member_15_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe neue Informationen.";
};

FUNC INT Info_Mod_Saturas_AW_Member_15_Condition()
{
	if (Mod_WM_Hexeninfos == 1)
	&& (Mod_WM_Verflucht == 0)
	&& (Mod_GenugBauernHinweise == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_15_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_00"); //Ich habe neue Informationen. Auf den Bauernhöfen sind in letzter Zeit recht viele ungewöhnliche Dinge geschehen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_15_14_01"); //Ja? Berichte.

	if (Npc_KnowsInfo(hero, Info_Mod_Rosi_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_02"); //Rosi hat sich über ungünstige Wetterverhältnisse und Hagelschauer seit Beginn der Saison beklagt.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Babera_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_03"); //Babera hat starke Rückenschmerzen seit einiger Zeit.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Balthasar_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_04"); //Balthasars Schafe lahmen.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Bobo_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_05"); //Von Bobo erfuhr ich, dass ein Rudel schwarzer Wölfe seit einiger Zeit in der Nähe des Hofes sein Unwesen treibt.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Gunnar_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_06"); //Gunnar berichtete von Hagelschauern, sauerer Schafsmilch und gesundheitlichen Beschwerden auf dem Hof in dieser Saison.
	};

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_15_14_07"); //In der Tat, diese Häufung solcher Ereignisse ist sehr verdächtig. Verdächtig nach Hexenwerk.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_08"); //Hexen?! Um was für Wesen handelt es sich genau?

	Info_Mod_Saturas_AW_HexenTalk();

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Saturas_AW_Member_16 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_16_Condition;
	information	= Info_Mod_Saturas_AW_Member_16_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe diese seltsame Spruchrolle gefunden.";
};

FUNC INT Info_Mod_Saturas_AW_Member_16_Condition()
{
	if (Mod_HasBerserkScroll == 1)
	&& (Npc_HasItems(hero, ItSc_AuraBerserker) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_16_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_16_15_00"); //Ich habe diese seltsame Spruchrolle gefunden.

	B_GiveInvItems	(hero, self, ItSc_AuraBerserker, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_01"); //Lass mal sehen. Hmm, diese Art von Spruchrollen ist mir nicht bekannt. Aber ... einen Augenblick mal ...
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_02"); //Die Schriftzeichen darauf scheinen denen der alten Kultur zu entsprechen.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_03"); //Unglaublich.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_16_15_04"); //Ja, was ist?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_05"); //Wenn mich nicht alles täuscht, ist dass eine Spruchrolle der Untergegangenen Kultur, mit der ein mächtiger Aurazauber gewirkt werden kann.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_06"); //Sie könnte unsere Kampfkraft außerordentlich steigern ...

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Saturas_AW_Member_17 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_17_Condition;
	information	= Info_Mod_Saturas_AW_Member_17_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe diese Spruchrollen hier gefunden.";
};

FUNC INT Info_Mod_Saturas_AW_Member_17_Condition()
{
	if (Mod_HasHexenScroll == 1)
	&& (Npc_HasItems(hero, ItSc_Verfluchen) > 0)
	&& (Npc_HasItems(hero, ItSc_TrfWoman) > 0)
	&& (Npc_HasItems(hero, ItSc_TrfWomanBack) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_17_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_17_15_00"); //Ich habe diese Spruchrollen hier gefunden.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_17_14_01"); //Lass mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_17_14_02"); //Hmm, interessant.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_17_15_03"); //Was ist damit?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_17_14_04"); //Es sind ganz typische Hexenspruchrollen, Schadenszauber und Verwandlungszauber.

	if (Mod_WM_Hexeninfos < 2)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_17_14_05"); //Damit ist also klar, dass sich Hexen in der Umgebung befinden.
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_17_15_06"); //Hexen?! Um was für Wesen handelt es sich genau?
	
		Info_Mod_Saturas_AW_HexenTalk();

		B_GivePlayerXP	(250);
	};
};

INSTANCE Info_Mod_Saturas_AW_Member_18 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_18_Condition;
	information	= Info_Mod_Saturas_AW_Member_18_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich die Verwandlung irgendwie anwenden?";
};

FUNC INT Info_Mod_Saturas_AW_Member_18_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_17))
	&& (Npc_HasItems(hero, ItSc_TrfWoman) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_18_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_18_15_00"); //Kann ich die Verwandlung irgendwie anwenden?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_18_14_01"); //Sie anwenden?! Ich vermag nicht zu sagen, was geschehen würde, wenn du den Verwandlungszauber auf dich anwendest.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_18_14_02"); //Du müsstest den Prozess der Anwendung auch erst modifizieren, da sie speziell auf weibliche Nutzer zugeschnitten ist.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_18_15_03"); //Es würde mir einen Vorteil gegenüber Hexen verschaffen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_18_14_04"); //Nun gut. Eigentlich solltest du den Effekt auf dich anwenden können, indem du einen Runenrohling zum Transfer des Zaubers auf dich heranziehst.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_18_14_05"); //Ich hoffe nur, du machst damit keine Dummheiten.
};

INSTANCE Info_Mod_Saturas_AW_Member_19 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_19_Condition;
	information	= Info_Mod_Saturas_AW_Member_19_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich konnte die Hexen bezwingen.";
};

FUNC INT Info_Mod_Saturas_AW_Member_19_Condition()
{
	if (Mod_WM_HexenTot == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_19_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_19_15_00"); //Ich konnte die Hexen bezwingen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_01"); //Das ist gut, eine Sorge weniger. Meine Kundschafter haben mir berichtet, dass die Wesen sich zwar verstreut haben – außer die bei Orlan - aber an Macht fast nichts eingebüßt haben.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_02"); //Damit ist klar, dass die Hexen die Wesen lediglich kontrollierten, ihre eigentlichen Urheber aber noch existieren. Versuch noch mehr herauszufinden.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_03"); //Dass du die Hexen beseitigt hast könnte die Erschaffer der Wesen vielleicht etwas aus ihrer Deckung gelockt haben.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_04"); //Schau dich also nach Hinweisen um.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_05"); //Vielleicht wirst du in der Nähe der Kreaturen bei Orlan etwas finden können, da sie wie erwähnt unverändert verharren, wo sie standen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_06"); //Du musst die Urheber finden. Wenn es dir nicht gelingen sollte, wären wir wohl alle dem Untergang geweiht, da nur noch die Macht längst verlorener göttlicher Artefakte in der Lage wäre diesen Ungetümen Einhalt zu gebieten.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_19_15_07"); //Göttliche Artefakte?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_08"); //Ja, Gegenstände uralter Macht. Einer von ihnen war der Kristall der Absorption, welcher in der Lage war frei gewordene Energien, die diesen Wesen eben ihre Macht liefern, in sich zu bannen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_09"); //Es soll noch andere Artefakte, wie auch Zauber auf Khornins gegeben haben, die in der Lage gewesen sein sollen den Träger oder Magier mit großer Macht auszustatteten, indem sie eine übermächtige Aura erzeugten, oder sogar einen Teil göttlicher Macht verliehen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_10"); //Aber diese Gegenstände, wie auch das Wissen um die Magie, gelten seit langem als verschollen.

	Mod_WM_ArtefaktSammler = 1;

	B_GivePlayerXP	(600);

	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Amulett))
	{
		B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Hmm, vielleicht wird uns das Amulett der Extension im Kampf gegen die Ungetüme helfen können.");
	};

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Die Hexen scheinen nicht die eigentlichen Urheber der Kreaturen gewesen zu sein, sondern nur Kontrolle auf diese ausgeübt zu haben, da die Wesen sich nach deren Ableben verstreut haben, außer bei Orlan. Daher könnte ich dort vielleicht auf weitere Hinweise stoßen. Saturas meinte, dass ich nach der Vernichtung der Hexen nun bessere Chancen haben sollte, die Wurzel des Übels zu finden.");
};

INSTANCE Info_Mod_Saturas_AW_Member_20 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_20_Condition;
	information	= Info_Mod_Saturas_AW_Member_20_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe in Erfahrung gebracht, dass der so genannte Blutkult (...)";
};

FUNC INT Info_Mod_Saturas_AW_Member_20_Condition()
{
	if (Mod_WM_Blutkultinfos == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_20_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_15_00"); //Ich habe in Erfahrung gebracht, dass der so genannte Blutkult für das Erscheinen dieser Wesen verantwortlich sein soll.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_01"); //Bei Adanos, der Blutkult also.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_15_02"); //Was ist der Blutkult genau?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_03"); //Das lässt sich nicht mit wenigen Worten sagen. Es handelt sich um eine uralte Bruderschaft die fast genauso lange zu bestehen scheint, wie die Götter selbst.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_04"); //Als Innos, Adanos und Beliar die Welt betraten, erwählte und erschaffte sie sich jeder Stellvertreter, die in ihrem Willen handeln sollten, jedoch über eigenen Verstand und Willen verfügten.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_05"); //Aber auch diese – ausgestattet mit großer Macht – erwählten wiederum Diener, sodass über die Jahrhunderte ganze Beziehungsgeflechte verschiedenster Geschöpfe entstanden.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_06"); //Manche gaben sich auch nicht mit den Mitteln zufrieden, die ihnen von ihrer Gottheit geschenkt wurden und begannen sich auch der Macht der anderen Götter zu bedienen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_07"); //Wiederum andere begannen ihren ganz eigenen Interessen zu folgen. Der Blutkult jedoch, so scheint es, hat zu keiner Zeit in irgendeiner Form von Beziehung zu einer der drei Gottheiten gestanden.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_15_08"); //Woher beziehen sie dann ihre Macht?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_09"); //Es sind parasitäre Geschöpfe, die keinem Gott dienen und jede frei gewordene Energie aufnehmen und bündeln können.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_10"); //Sie scheinen Geschöpfen genannt Vampire verwandt, nehmen jedoch die gesamte Energie getöteter Wesen auf.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_15_11"); //Wie ist es möglich, dass sie so lange unentdeckt blieben?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_12"); //Sie können Jahrzehnte versteckt unter der Erde ruhen, bis sie eine Erschütterung des Gleichgewichtes wahrnehmen und ihre Chance gekommen sehen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_13"); //Sie streben immer eine Störung dieses Gleichgewichtes an, da ganz gleich, ob Innos, oder Beliar triumphiert, immer viele Kreaturen in Folge dessen den Untergang finden, was ihre Macht wachsen lässt.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_14"); //Sie sind damit unsere natürlichen Widersacher und würden dich auf der Stelle angreifen, wenn sie dich als Diener Adanos’ erkennen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_15"); //Die Geschöpfe, die sie jetzt aussandten, ausgestattet mit der Macht beider Gottheiten, Innos und Beliar, werden wir nicht ohne weiteres bannen können.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_16"); //Du musst, wenn möglich, die Wurzel des Übels finden, den Blutkult, und sie alle vernichten.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Saturas hat bestätigt, dass wohl der Blutkult für das Auftauchen der Kreaturen verantwortlich ist. Ich soll seine Anhänger ausfindig machen und vernichten.");

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_20);

	Info_AddChoice	(Info_Mod_Saturas_AW_Member_20, "Ich mache mich dann gleich auf den Weg, den Unholden den Garaus zu machen.", Info_Mod_Saturas_AW_Member_20_A);
};

FUNC VOID Info_Mod_Saturas_AW_Member_20_A()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_A_15_00"); //Ich mache mich dann gleich auf den Weg, den Unholden den Garaus zu machen.

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_20);
};

INSTANCE Info_Mod_Saturas_AW_Member_21 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_21_Condition;
	information	= Info_Mod_Saturas_AW_Member_21_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann man die Macht des Kristalls nicht wieder herstellen?";
};

FUNC INT Info_Mod_Saturas_AW_Member_21_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_19))
	&& (Mod_WM_ArtefaktSammler == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_21_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_21_15_00"); //Kann man die Macht des Kristalls nicht wieder herstellen?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_21_14_01"); //Ich befürchte, dass es uns an den Mitteln fehlt. Nur ein göttlicher Bote wäre dazu in der Lage.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_21_14_02"); //Erkundige dich am besten bei Cronos darüber. Er kann dir mehr dazu sagen.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Von Saturas habe ich erfahren, dass der Kristall der Absorption in der Lage wäre die Macht der Kreaturen einzudämmen, wenn man ihm seine Kraft wiedergeben würde. Cronos kann mir mehr dazu sagen.");
};

INSTANCE Info_Mod_Saturas_AW_Member_22 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_22_Condition;
	information	= Info_Mod_Saturas_AW_Member_22_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe dieses Amulett hier.";
};

FUNC INT Info_Mod_Saturas_AW_Member_22_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_21))
	&& (Mod_WM_ArtefaktSammler == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Albert_Hexen))
	&& (Npc_HasItems(hero, ItAm_MegaAmulett2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_22_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_22_15_00"); //Ich habe dieses Amulett hier.

	B_GiveInvItems	(hero, self, ItAm_MegaAmulett2, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_22_14_01"); //Höchst interessant. Dieses Amulett scheint von uralter Macht zu sein. Es erinnert mich an ein Artefakt aus einem Buch, dass uns vor einiger Zeit entwendet wurde.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_22_15_02"); //Das Artefakt wurde euch entwendet?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_22_14_03"); //(genervt) Nein, das Buch meine ich. Irgendein Frevler hat sich dreist an unseren Schriften bedient. Adanos möge ihn strafen. Aber ... wo war ich gerade ... achja, das Amulett. (schaut es sich an)
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_22_14_04"); //Tatsächlich, fantastisch, wenn mich meine Erinnerung nicht trügt hat dieses Amulett die Macht, die Wirkung eines jeden Zaubers, den der Träger auf sich wirkt, auf alle befreundeten Mitstreiter auszudehnen. Ein machtvolles Werkzeug ...

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Saturas_AW_Member_23 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_23_Condition;
	information	= Info_Mod_Saturas_AW_Member_23_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was kannst du mir zu dieser Rune sagen?";
};

FUNC INT Info_Mod_Saturas_AW_Member_23_Condition()
{
	if (Mod_WM_HasRune == 1)
	&& (Npc_HasItems(hero, ItRu_Kontrolle) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_23_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_23_15_00"); //Was kannst du mir zu dieser Rune sagen?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_01"); //Hmm, lass mich sehen ... Bei Adanos ...
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_23_15_02"); //Ja, was ist damit?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_03"); //Hierbei handelt es sich um eine Kontrollrune, die die Funktion besitzt telepathischen und energetischen Kontakt zu mächtigen Dienerkreaturen über längere Distanz - durchaus einige 100 Meter – aufrechtzuerhalten.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_04"); //Sie dient auch zur gegenseitigen Erkennung der Kreaturen und verhindert, dass die Geschöpfe, welche diese Rune mit sich führen, sich gegenseitig angreifen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_05"); //Ich darf recht in der Annahme gehen, dass du sie einem der höheren Geschöpfe entrissen hast, die die Umgebung heimsuchten.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_23_15_06"); //Ja, das stimmt.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_07"); //Ausgezeichnet, vielleicht wird dir ja dieser Gegenstand bei deiner Suche behilflich sein.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_08"); //Versuche sie anzuwenden bevor du auf die Kreaturen triffst.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Saturas meint, die Rune würde die Kreaturen unter anderem davon abhalten sich gegenseitig anzugreifen. Wenn ich sie benutze, könnte sie mir dabei behilflich sein die Missetäter zu finden.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Saturas_AW_Member_24 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_24_Condition;
	information	= Info_Mod_Saturas_AW_Member_24_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_24_Condition()
{
	if (Mod_WM_HexenTot == 1)
	&& (Mod_WM_Hexeninfos < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_24_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_24_14_01"); //Meine Kundschafter haben auf den Bauernhöfen Erkundigungen eingezogen und der Schluss liegt nahe, dass Hexen in der Umgebung sind.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_24_15_00"); //Hexen?! Um was für Wesen handelt es sich genau?
	
	Info_Mod_Saturas_AW_HexenTalk();
};

INSTANCE Info_Mod_Saturas_AW_Member_25 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_25_Condition;
	information	= Info_Mod_Saturas_AW_Member_25_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Blutkult war einmal. Ich habe sie alle vernichtet.";
};

FUNC INT Info_Mod_Saturas_AW_Member_25_Condition()
{
	if (Mod_WM_BlutkultTot == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_25_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_25_15_00"); //Der Blutkult war einmal. Ich habe sie alle vernichtet.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_01"); //Tatsächlich? Das sind großartige Neuigkeiten. Möge dieses Übel auf Ewig von dem Antlitz dieser Erde getilgt sein. Du hast uns einen Dienst von unschätzbarem Wert erwiesen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_02"); //Wie dem auch sei, die Wesen auf dem Weidenplateau sollten nun so geschwächt sein, nach dem Ableben ihrer Schöpfer, dass wir einen Angriff mit vereinten Kräften wagen können.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_03"); //Cronos wird mit einigen Wasserkriegern aufbrechen und bei Orlans Taverne auf dich warten.

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_22))
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_04"); //Er hat das Amulett, das du uns gegeben hast und wird es im Kampf anwenden.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_16))
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_05"); //Er hat die Spruchrolle, die du uns gegeben hast und wird sie im Kampf anwenden.
	};

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_06"); //Du kannst noch versuchen unsere Mitbrüder in der Stadt zu mobilisieren. Adanos möge euch behüten.
	
	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Der Moment, gegen die Ungetüme auf dem Weidenplateau loszuschlagen, scheint gekommen. Cronos und einige Wasserkrieger werden bei Orlan auf mich warten.");

	B_GivePlayerXP	(1000);

	Mod_WM_HexenTot = 2;

	Mod_WM_CronosAttack = 1;

	B_StartOtherRoutine	(Mod_1538_WKR_Wasserkrieger_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1530_WKR_Everaldo_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1539_WKR_Wasserkrieger_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1533_WKR_Salvador_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1537_WKR_Vanas_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1536_WKR_Roka_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1535_WKR_Wasserkrieger_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1534_WKR_Wasserkrieger_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1532_HTR_Ethan_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_758_KDW_Cronos_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_588_WNOV_Joe_NW, "SAMMELN");
};

INSTANCE Info_Mod_Saturas_AW_Member_26 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_26_Condition;
	information	= Info_Mod_Saturas_AW_Member_26_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_26_Condition()
{
	if (Mod_WM_CronosAttack >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_Info()
{
	if (Mod_WM_CronosAttack == 3)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_00"); //Unglaublich. Die Bedrohung ist tatsächlich gebannt. Monstern und Ungetümen hast du getrotzt und die Stirn geboten.
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_01"); //Sogar deine Taten bei der Fokussuche verblassen gegen diese Leistung.
	}
	else if (Mod_WM_CronosAttack == 4)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_02"); //Unglaublich, wie ich hörte hast du die Kreaturen auf dem Plateau alleine bezwungen.
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_03"); //Erstaunlich, obgleich ich dich dieser unnötigen Risiken auch tadeln muss.
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_04"); //Blinde Eitelkeit sollte angesichts der Gefahr, die über allem schwebt, nicht das Leitmotiv sein.
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_05"); //Es steht zu viel auf dem Spiel. Vergiss das nicht ...
	};

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_06"); //Hier, nimm dieses Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_07"); //Selbstverständlich kann es nicht deine Taten aufwiegen. Daher soll auch der Gürtel unseres Herrn Adanos, welcher in dieser Bauanleitung umschrieben ist, deinen Leib zieren.

	B_GiveInvItems	(self, hero, ItWr_Bauplan_AdanosBelt, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_08"); //Zudem darfst du dir einen der folgenden Gegenstände aussuchen.

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_26);

	Info_AddChoice	(Info_Mod_Saturas_AW_Member_26, "Zwei Spruchrollen Eisregen", Info_Mod_Saturas_AW_Member_26_D);
	Info_AddChoice	(Info_Mod_Saturas_AW_Member_26, "Kugelblitzrune", Info_Mod_Saturas_AW_Member_26_C);
	Info_AddChoice	(Info_Mod_Saturas_AW_Member_26, "Trank des Geistes", Info_Mod_Saturas_AW_Member_26_B);
	Info_AddChoice	(Info_Mod_Saturas_AW_Member_26, "Trank des Wissens", Info_Mod_Saturas_AW_Member_26_A);
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_E()
{
	var int Mod_WM_NewTruppen;
	Mod_WM_NewTruppen = 10 - (Mod_WM_Truppe_01 + Mod_WM_Truppe_02 + Mod_WM_Truppe_03 + Mod_WM_Truppe_04 + Mod_WM_Truppe_05 + Mod_WM_Truppe_06 + Mod_WM_Truppe_07 + Mod_WM_Truppe_08 + Mod_WM_Truppe_09 + Mod_WM_Truppe_10);

	if (Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
	{
		if (Mod_WM_NewTruppen == 0)
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_00"); //So aber sprich: Wo bleiben unsere Mitbrüder, die dir beim Kampf zur Seite standen?
			AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_26_E_15_01"); //Öhhm, nun ... sie sind leider alle gefallen.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_02"); //Was?! Sie sind alle tot?! Adanos legt uns wirklich eine schwere Prüfung auf.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_03"); //Ja, das Gleichgewicht ist ein hohes Gut, dessen Erhaltung leider bisweilen Opfer erfordert.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_04"); //Aber um sich von dem Verlust so vieler unserer geschätzten Mitbrüder zu erholen, wird es sehr viel Zeit brauchen.

			B_GivePlayerXP	(1000);
		}
		else if (Mod_WM_TruppenLeft == Mod_WM_NewTruppen)
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_05"); //Genauso erfreulich, wie die Vernichtung der Ungetüme ist es, dass jeder deiner Mitstreiter unversehrt zurückkam.

			B_GivePlayerXP	(4000);

			hero.attribute[ATR_MANA_MAX] += 10;
			hero.attribute[ATR_MANA] += 10;

			PrintScreen	("Mana + 10", -1, -1, FONT_SCREEN, 2);
		}
		else if ((Mod_WM_TruppenLeft-4) < Mod_WM_NewTruppen)
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_06"); //Betrübt stimmt mich hingegen, dass es Tote unter unseren Mitbrüder gab, wenn auch wenige.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_07"); //Möge es uns immer im Bewusstsein bleiben, dass das Gleichgewicht ein hohes Gut ist und dessen Erhaltung leider bisweilen Opfer erfordert.

			B_GivePlayerXP	(3000);

			hero.attribute[ATR_MANA_MAX] += 5;
			hero.attribute[ATR_MANA] += 5;

			PrintScreen	("Mana + 5", -1, -1, FONT_SCREEN, 2);
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_08"); //Äußerst betrüblich ist jedoch das Dahinscheiden vieler unserer Mitbrüder im Kampf gegen die monströsen Ungetüme. Lange wird es dauern, bis unsere Gemeinschaft sich davon erholt hat.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_07"); //Möge es uns immer im Bewusstsein bleiben, dass das Gleichgewicht ein hohes Gut ist und dessen Erhaltung leider bisweilen Opfer erfordert.

			B_GivePlayerXP	(2000);

			hero.attribute[ATR_MANA_MAX] += 2;
			hero.attribute[ATR_MANA] += 2;

			PrintScreen	("Mana + 2", -1, -1, FONT_SCREEN, 2);
		};
	};

	if (Mod_WM_NewTruppen > 0)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_09"); //Der Segen unseres Herrn Adanos möge auf ewig mit dir sein.
	};

	if (!Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
	{
		B_GivePlayerXP	(5000);

		hero.attribute[ATR_MANA_MAX] += 10;
		hero.attribute[ATR_MANA] += 10;

		if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_22))
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_11"); //Achja, hier hast du das Amulett zurück. Es war uns wahrlich von großem Nutzen. Ich habe es noch etwas begutachtet. Ein sehr interessantes Stück ...

			B_GiveInvItems	(self, hero, ItAm_MegaAmulett2, 1);
		};
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_22))
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_12"); //Achja, hier hast du noch das Amulett zurück, welches Cronos auf dem Plateau bei sich trug. Ich habe es noch etwas begutachtet. Ein sehr interessantes Stück ...

			B_GiveInvItems	(self, hero, ItAm_MegaAmulett2, 1);
		};
	};

	if (Mod_HSWM_RatProblem == 1)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_10"); //Ich werde nun zum Rat aufbrechen.

		B_StartOtherRoutine	(self, "RAT");
		B_StartOtherRoutine	(Mod_527_SLD_Torlof_NW, "RAT");

		Mod_HSWM_RatProblem = 0;
	};

	Mod_WM_UnheilFertig_Day = Wld_GetDay();
	Mod_WM_UnheilFertig = 1;

	Mod_BengarsHofLeer = 1;

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_UNHEIL, LOG_SUCCESS);

	Mod_TillChange = 1;

	Mod_TillChange_Day = Wld_GetDay();

	B_Göttergefallen(2, 1);

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_26);
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_D()
{
	B_GiveInvItems	(self, hero, ItSc_IceRain, 2);

	Info_Mod_Saturas_AW_Member_26_E();
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_C()
{
	B_GiveInvItems	(self, hero, ItRu_Thunderball, 1);

	Info_Mod_Saturas_AW_Member_26_E();
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_B()
{
	B_GiveInvItems	(self, hero, ItPo_Geist, 1);

	Info_Mod_Saturas_AW_Member_26_E();
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_A()
{
	B_GiveInvItems	(self, hero, ItPo_Wissen, 1);

	Info_Mod_Saturas_AW_Member_26_E();
};

INSTANCE Info_Mod_Saturas_AW_Member_27 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_27_Condition;
	information	= Info_Mod_Saturas_AW_Member_27_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Kristall hat seine ursprüngliche Kraft wiedererlangt.";
};

FUNC INT Info_Mod_Saturas_AW_Member_27_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AdanosDog_Kristall))
	&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_27_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_27_15_00"); //Der Kristall hat seine ursprüngliche Kraft wiedererlangt.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_01"); //Unglaublich! Ja, ich spüre wie er durchdrungen ist von göttlicher Macht.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_02"); //Damit hast du unserer Gemeinschaft nicht nur einen großen Dienst erwiesen und uns ein Werkzeug zugeführt, die Erhaltung des Gleichgewichts zu sichern.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_03"); //Er wird auch in der Lage sein die Bedrohung auf dem Weidenplateau aufzuhalten und ganz Khorinis so vor einem schweren Schicksal bewahren.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_04"); //Er sollte die Ungetüme nun in so weit schwächen, dass wir einen Angriff mit vereinten Kräften wagen können.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_05"); //Ja, ich spüre wie der Kristall sogar über diese große Entfernung seine Wirkung hinterlässt.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_06"); //Cronos wird ihn an sich nehmen und ihn auf dem Plateau nutzen, wo er mit den Kriegern auf dich wartet. Es wird Zeit dieses Übel endgültug zu tilgen.

	B_GivePlayerXP	(1000);
};

INSTANCE Info_Mod_Saturas_AW_Member_28 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_28_Condition;
	information	= Info_Mod_Saturas_AW_Member_28_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du den Kristall.";
};

FUNC INT Info_Mod_Saturas_AW_Member_28_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
	&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_28_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_28_15_00"); //Hier hast du den Kristall.

	B_GiveInvItems	(hero, self, ItMi_AbsorbKristall2, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_28_14_01"); //Kaum zu glauben, dass sich dieses Werkzeug Adanos’ nun im Besitz unserer Gemeinschaft befindet.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_28_14_02"); //Der Segen unseres Herrn soll dich auch weiterhin auf allen deinen Wegen begleiten.

	B_GivePlayerXP	(1500);

	hero.attribute[ATR_MANA_MAX] += 5;
	hero.attribute[ATR_MANA] += 5;
};

INSTANCE Info_Mod_Saturas_AW_KhorataPlage_01 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_KhorataPlage_01_Condition;
	information	= Info_Mod_Saturas_AW_KhorataPlage_01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_KhorataPlage_01_Condition()
{
	if (Wld_GetDay()-2 > Mod_WM_UnheilFertig_Day)
	&& (Mod_WM_UnheilFertig == 1)
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_KhorataPlage_01_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_00"); //Die große Gefahr, die Khorinis drohte, ist verbannt. Doch gibt es immer noch Vorkommnisse und Berichte, die unsere Aufmerksamkeit erfordern.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_01"); //Das Anliegen, mit welchem ich dich jetzt betraue, spielt sich im Norden ab, dem Teil der Insel, der den Namen Relendel trägt. Du hast bereits davon gehört?
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_01_15_02"); //Ja, nicht zuletzt auf der Suche nach den Bruchstücken verschlug es mich dahin.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_03"); //Gut, deine Kenntnis um diese Gegend macht die Sache zumindest etwas einfacher.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_04"); //Um mein Anliegen zu konkretisieren: ich hörte von Plagen, die in letzter Zeit gehäuft Relendel heimsuchten.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_05"); //Solange die Ursachen, oder die Urheber des ganzen nicht feststehen, besteht Grund zur Beunruhigung.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_01_15_06"); //Was sollen das für Plagen sein?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_07"); //Wesen, die viele Menschen für gewöhnlich als Schädlinge bezeichnen würden, Kaninchen, Ratten, Insekten.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_08"); //Wir als Wassermagier und Erhalter des Gleichgewichtes wissen natürlich, dass auch sie ihren Platz im Gefüge der Welt haben.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_09"); //Aber die plötzlich auftretenden Auswüchse der Population sind mehr als ungewöhnlich.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_01_15_10"); //Das hört sich aber eher nach einem Thema für die Waldläufer an.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_11"); //Nein, es besteht Grund zu der Annahme, das sie nicht natürlichen Ursprunges sind, Magie dahinter steckt, womit es uns obliegt, die Sache zu ergründen.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_01_15_12"); //In Ordnung, dann mache ich mich auf den Weg.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_13"); //Danke. Adanos möge dich begleiten.

	Log_CreateTopic	(TOPIC_MOD_ADANOS_PLAGE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ADANOS_PLAGE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ADANOS_PLAGE, "Saturas gab mir diesmal die Aufgabe einigen Plagen in Relendel auf den Grund zu gehen. Allerlei Bodensatz an Tieren – Ratten, Kaninchen, Insekten - soll sich dort in unnatürlichem Tempo vermehrt haben.");
};

INSTANCE Info_Mod_Saturas_AW_KhorataPlage_02 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_KhorataPlage_02_Condition;
	information	= Info_Mod_Saturas_AW_KhorataPlage_02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe herausgefunden, was es mit den Plagen auf sich hat.";
};

FUNC INT Info_Mod_Saturas_AW_KhorataPlage_02_Condition()
{
	if (Mod_WM_UnheilFertig == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_KhorataPlage_02_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_00"); //Ich habe herausgefunden, was es mit den Plagen auf sich hat.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_02_14_01"); //(erwartungsvoll) Ja, berichte.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_02"); //Sie alle haben unterschiedliche Ursprünge.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_03"); //Die Ratten entstammen einem Volk von Rattenmenschen aus der Eiswelt.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_04"); //Bei der Kaninchenplage haben die Dämonenmagier ihre Finger im Spiel. Sie erproben Plagenzauber.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_05"); //Und die Heimsuchung durch die Insekten zu guter letzt, beruht auf einem göttlichen Fluch.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_02_14_06"); //(erstaunt) Unglaublich! Das, was du zu berichten hast zerschlägt nicht nur meine Sorgen um eine böse Macht, die hinter all dem Stecken könnte.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_02_14_07"); //Es stellt zudem noch einen wahren Schatz des Wissens dar, der unser Verständnis um die Schöpfung Adanos’ erweitert ...
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_02_14_08"); //Hier, nimm diese magischen Artefakte zum Dank. Der Segen Adanos möge allzeit auf dir ruhen.

	B_ShowGivenThings	("6 Tränke, Runenstein, 5 Spruchrollen und Herz eines Eisgolems erhalten");

	CreateInvItems	(hero, ItPo_Geist, 1);
	CreateInvItems	(hero, ItPo_Mana_03, 5);
	CreateInvItems	(hero, ItMi_Runeblank, 1);
	CreateInvItems	(hero, ItSc_Thunderstorm, 3);
	CreateInvItems	(hero, ItSc_IceRain, 2);
	CreateInvItems	(hero, ItAt_IceGolemHeart, 1);

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_PLAGE, LOG_SUCCESS);

	B_GivePlayerXP	(800);

	B_Göttergefallen (2, 2);
};

INSTANCE Info_Mod_Saturas_NW_JGScroll (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_JGScroll_Condition;
	information	= Info_Mod_Saturas_NW_JGScroll_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier eine Rolle und eine Nachricht, die ich nicht lesen kann.";
};

FUNC INT Info_Mod_Saturas_NW_JGScroll_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Key2))
	&& (Npc_HasItems(hero, ItWr_TruhenNotizJG) == 1)
	&& (Npc_HasItems(hero, ItWr_TruhenScrollJG) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_JGScroll_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_JGScroll_15_00"); //Ich habe hier eine Rolle und eine Nachricht, die ich nicht lesen kann.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_JGScroll_14_01"); //Zeig mal her.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Saturas_NW_JGScroll_14_02"); //Ah ja. Die alte Schrift. Frag Riordian, er hat sich darauf spezialisiert.
};

INSTANCE Info_Mod_Saturas_NW_Rasend (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Rasend_Condition;
	information	= Info_Mod_Saturas_NW_Rasend_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Rasend_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daron_Rasend))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Rasend_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_00"); //Bei Adanos, da bist du ja. Wie du siehst ist hier etwas Schreckliches vorgefallen ...
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend_15_01"); //Ja, ich weiß bereits bescheid. Die Stadt und das Kloster haben dasselbe Schicksal erlitten.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_02"); //Das Kloster auch ...?! Von der Stadt hatte uns bereits Diego berichtet.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_03"); //Aber wenn sogar das Kloster angegriffen wurde ... (überlegt) das alles lässt doch ein deutliches Muster erkennen ...
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_04"); //Paladine, Feuermagier ... und wir ... Der Dämon scheint gezielt die Diener Innos und Adanos anzugreifen.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend_15_05"); //Nun, ein übler Dämon, eine Kreatur der Finsternis ... so abwegig erscheint das eigentlich nicht.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend_15_06"); //Hmm, welchen Weg hat die Kreatur nach ihrem Unwesen hier eingeschlagen?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_07"); //Er überflog die Gebirge Richtung Relendel.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend_15_08"); //Dann werde ich mal die Verfolgung aufnehmen.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_09"); //Sei aber um Adanos’ Willen vorsichtig. Dieses Geschöpf ist unheimlich mächtig.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_10"); //Außerdem solltest du dich vielleicht bei Zeiten auch bei Xardas erkundigen.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_11"); //Als ein Diener Beliar’s wird er dir bestimmt auch manch Nützliches offen legen können ...
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_12"); //Adanos möge dich behüten.

	B_LogEntry	(TOPIC_MOD_ADANOS_RASEND, "Auch die Ausgrabungsstätte blieb von den Angriffen des Dämons nicht verschont. Dieser hat sich anschließend nach Relendel begeben. Saturas riet mir dazu, Xardas aufzusuchen, um vielleicht mehr über dieses finstere Geschöpf zu erfahren.");
};

INSTANCE Info_Mod_Saturas_NW_Rasend02 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Rasend02_Condition;
	information	= Info_Mod_Saturas_NW_Rasend02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Rasend02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Shivar_DemonsDead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Rasend02_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_00"); //Ich kann spüren, dass die Gefahr gebannt ist und dass du hier unversehrt erscheinst liefert mir die Bestätigung.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_01"); //Wie ist dir das nur wieder gelungen ...
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend02_15_02"); //Das willst du glaube ich gar nicht wissen ...
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_03"); //Du hast auf jeden Fall ganz Khorinis zum wiederholten Male einen unschätzbaren Dienst erwiesen.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_04"); //Es steht außer Frage, dass du erwählt bist zu den höchsten Würdenträgern unter den Dienern Adanos zu gehören.

	if (Mod_Gilde == 10)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_05"); //Fühlst du dich dazu bereit, der Gemeinschaft als Richter des Wassers zu dienen?
		AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend02_15_06"); //Ja, mein Wunsch ist es ein Richter des Wassers zu werden.
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_07"); //Dann nimm diese Robe und den Segen Adanos.
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_08"); //Möge das Gleichgewicht durch dein Wirken auch weiterhin Bestand haben.

		CreateInvItems	(self, ITAR_KDW_H, 1);
		B_GiveInvItems	(self, hero, ITAR_KDW_H, 1);

		Snd_Play ("LEVELUP");

		B_GivePlayerXP	(1000);

		B_Göttergefallen(2, 5);

		Mod_Gilde = 11;
	}
	else if (Mod_Gilde == 17)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_09"); //Begib dich am besten gleich zu Ethan.

		B_GivePlayerXP	(600);
	};

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_RASEND, LOG_SUCCESS);

	B_StartOtherRoutine	(self, "RAT");
};

INSTANCE Info_Mod_Saturas_NW_Sweetwater (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Sweetwater_Condition;
	information	= Info_Mod_Saturas_NW_Sweetwater_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du brauchst meine Hilfe?";
};

FUNC INT Info_Mod_Saturas_NW_Sweetwater_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Sweetwater))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Sweetwater_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater_15_00"); //Du brauchst meine Hilfe?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater_14_01"); //Ja. Ich wüsste sonst niemanden.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater_15_02"); //Also gut. Was liegt an?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater_14_03"); //Die Piraten brauchen Unterstützung. Einen tüchtigen Jäger. Das bist du doch?
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater_15_04"); //Wohl wahr. Ich wurde sogar zum Waldläufer ernannt.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater_14_05"); //Genau der richtige Mann, scheint mir. Nun mach hin. Melde dich bei den Piraten.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater_15_06"); //Bin schon unterwegs.

	B_LogEntry	(TOPIC_MOD_JG_SWEETWATER, "Saturas schickt mich zu den Piraten. Mal sehen, was die für mich zu tun haben ...");
};

INSTANCE Info_Mod_Saturas_NW_Sweetwater2 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Sweetwater2_Condition;
	information	= Info_Mod_Saturas_NW_Sweetwater2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Sweetwater2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AlligatorJack_Sweetwater2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Sweetwater2_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater2_14_00"); //Was war los?
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater2_15_01"); //Die hatten eine Alligatorenplage am See. Ist jetzt erledigt.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater2_14_02"); //Habe ich nicht anders erwartet. Ich lasse Vatras Bescheid geben. Du hast sicher noch im Minental zu tun.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater2_15_03"); //Das kann man sagen. Bis später.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater2_14_04"); //Adanos sei mit dir.

	B_SetTopicStatus	(TOPIC_MOD_JG_SWEETWATER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Saturas_PMSchulden (C_INFO)
{
	npc         	= Mod_774_KDW_Saturas_NW;
	nr          	= 1;
	condition   	= Info_Mod_Saturas_PMSchulden_Condition;
	information 	= Info_Mod_Saturas_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Saturas_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Saturas_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Saturas_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Saturas_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_00"); //Bist du gekommen, um deine Strafe zu zahlen?

	if (B_GetTotalPetzCounter(self) > Saturas_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_01"); //Ich hatte mich schon gefragt, ob du es überhaupt noch wagst, hierher zu kommen!
		AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_02"); //Anscheinend ist es nicht bei den letzten Anschuldigungen geblieben!

		if (Saturas_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_03"); //Ich hatte dich gewarnt! Die Strafe, die du jetzt zahlen musst, ist höher!
			AI_Output (hero, self, "Info_Mod_Saturas_PMAdd_15_00"); //Wieviel?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Saturas_LastPetzCounter);
		
			if (diff > 0)
			{
				Saturas_Schulden = Saturas_Schulden + (diff * 50);
			};
		
			if (Saturas_Schulden > 1000)	{	Saturas_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Saturas_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_04"); //Du hast mich schwer enttäuscht!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Saturas_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_05"); //Es haben sich einige neue Dinge ergeben.
		
		if (Saturas_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_06"); //Plötzlich gibt es niemanden mehr, der dich des Mordes bezichtigt.
		};
		
		if (Saturas_LastPetzCrime == CRIME_THEFT)
		|| ( (Saturas_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_07"); //Niemand erinnert sich mehr, dich bei einem Diebstahl gesehen zu haben.
		};
		
		if (Saturas_LastPetzCrime == CRIME_ATTACK)
		|| ( (Saturas_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_08"); //Es gibt keine Zeugen mehr dafür, dass du jemals in eine Schlägerei verwickelt warst.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_09"); //Anscheinend haben sich alle Anklagen gegen dich in Wohlgefallen aufgelöst.
		};
		
		AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_10"); //Ich weiß nicht, was da gelaufen ist, aber ich warne dich: Spiel keine Spielchen mit mir.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_11"); //Ich habe mich jedenfalls entschieden, dir deine Schulden zu erlassen.
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_12"); //Sieh zu, dass du nicht wieder in Schwierigkeiten kommst.
	
			Saturas_Schulden			= 0;
			Saturas_LastPetzCounter 	= 0;
			Saturas_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_13"); //Damit eins klar ist: Deine Strafe musst du trotzdem in voller Höhe zahlen.
			B_Say_Gold (self, hero, Saturas_Schulden);
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_14"); //Also, was ist?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Saturas_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Saturas_PETZMASTER);
		Info_AddChoice		(Info_Mod_Saturas_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Saturas_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Saturas_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Saturas_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Saturas_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Saturas_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Saturas_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Saturas_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Saturas_PMSchulden_HowMuchAgain_15_00"); //Wie viel war es noch mal?
	B_Say_Gold (self, hero, Saturas_Schulden);

	Info_ClearChoices  	(Info_Mod_Saturas_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Saturas_PETZMASTER);
	Info_AddChoice		(Info_Mod_Saturas_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Saturas_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Saturas_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Saturas_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Saturas_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Saturas_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Saturas_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Saturas_PETZMASTER   (C_INFO)
{
	npc         	= Mod_774_KDW_Saturas_NW;
	nr          	= 1;
	condition   	= Info_Mod_Saturas_PETZMASTER_Condition;
	information 	= Info_Mod_Saturas_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Saturas_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Saturas_PETZMASTER_Info()
{
	Saturas_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_01"); //Gut, dass du zu mir kommst, bevor alles noch schlimmer für dich wird.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_02"); //Mord ist ein schweres Vergehen!

		Saturas_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Saturas_Schulden = Saturas_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_03"); //Ganz zu schweigen von den anderen Sachen, die du angerichtet hast.
		};

		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_06"); //Ich habe kein Interesse daran, dich an den Galgen zu bringen. Wir sind im Krieg und wir brauchen jeden Mann.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_07"); //Aber es wird nicht leicht sein, die Leute wieder gnädig zu stimmen.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_08"); //Du könntest deine Reue zeigen, indem du eine Strafe zahlst - natürlich muss die Strafe angemessen hoch sein.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_09"); //Gut, dass du kommst! Du wirst des Diebstahls bezichtigt! Es gibt Zeugen!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_10"); //Von den anderen Dingen, die mir zu Ohren gekommen sind, will ich gar nicht erst reden.
		};

		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_11"); //Ich werde so ein Verhalten bei uns nicht dulden!
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_12"); //Du wirst eine Strafe zahlen müssen, um dein Verbrechen wieder gutzumachen!
		
		Saturas_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_13"); //Wenn du dich mit dem Gesindel im Hafen herumprügelst, ist das eine Sache ...
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_14"); //Aber wenn du unsere Leute angreifst, muss ich dich zur Rechenschaft ziehen.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_15"); //Und die Sache mit den Schafen musste wohl auch nicht sein.
		};

		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_16"); //Wenn ich dir das durchgehen lasse, macht hier bald jeder, was er will.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_17"); //Also wirst du eine angemessene Strafe zahlen - und die Sache ist vergessen.
		
		Saturas_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_18"); //Mir ist zu Ohren gekommen, du hättest dich an unseren Schafen vergriffen.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_19"); //Dir ist klar, dass ich das nicht durchgehen lassen kann.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_20"); //Du wirst eine Entschädigung zahlen müssen!
		
		Saturas_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Saturas_PETZMASTER_15_21"); //Wie viel?
	
	if (Saturas_Schulden > 1000)	{	Saturas_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Saturas_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Saturas_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Saturas_PETZMASTER);
	Info_AddChoice		(Info_Mod_Saturas_PETZMASTER,"Ich habe nicht genug Gold!",Info_Mod_Saturas_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Saturas_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Saturas_PETZMASTER,"Ich will die Strafe zahlen.",Info_Mod_Saturas_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Saturas_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Saturas_PETZMASTER_PayNow_15_00"); //Ich will die Strafe zahlen!
	B_GiveInvItems (hero, self, itmi_gold, Saturas_Schulden);
	AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_PayNow_14_01"); //Gut! Ich werde dafür sorgen, dass es jeder von uns erfährt - damit wäre dein Ruf einigermaßen wiederhergestellt.

	B_GrantAbsolution (LOC_WMCAMP);
	
	Saturas_Schulden			= 0;
	Saturas_LastPetzCounter 	= 0;
	Saturas_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Saturas_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Saturas_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Saturas_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Saturas_PETZMASTER_PayLater_15_00"); //Ich habe nicht genug Gold!
	AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_PayLater_14_01"); //Dann sieh zu, dass du das Gold so schnell wie möglich beschaffst.
	AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_PayLater_14_02"); //Und ich warne dich: Wenn du dir noch was zu schulden kommen lässt, wird die Sache noch schlimmer für dich!
	
	Saturas_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Saturas_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Saturas_NW_EXIT (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_EXIT_Condition;
	information	= Info_Mod_Saturas_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Saturas_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Saturas_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};