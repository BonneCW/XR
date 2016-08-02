INSTANCE Info_Mod_Skip_Hi (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Hi_Condition;
	information	= Info_Mod_Skip_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Skip_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Skip_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Skip_Hi_08_01"); //Ich bin Skip.
	AI_Output(self, hero, "Info_Mod_Skip_Hi_08_02"); //Solltest du irgendwelche Waren brauchen, dann kannst du zu mir kommen.
	AI_Output(self, hero, "Info_Mod_Skip_Hi_08_03"); //Waffen gibt es aber nur bei Garrett.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PIRATEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PIRATEN, "Skip handelt mit allem möglichen außer mit Waffen.");
};

INSTANCE Info_Mod_Skip_Malcom (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Malcom_Condition;
	information	= Info_Mod_Skip_Malcom_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dann kannst du sicher dafür sorgen, dass der Malcom draußen was zu Essen bekommt.";
};

FUNC INT Info_Mod_Skip_Malcom_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malcom_AW_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Malcom_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Malcom_15_00"); //Dann kannst du sicher dafür sorgen, dass der Malcom draußen was zu Essen bekommt.
	AI_Output(self, hero, "Info_Mod_Skip_Malcom_08_01"); //Ich werde dafür sorgen, dass er was bekommt. Immerhin ist der einer der Fleißigsten vom Lager.
	AI_Output(self, hero, "Info_Mod_Skip_Malcom_08_02"); //Die meisten gammeln eh nur hier rum. Willst du vielleicht ...?
	AI_Output(hero, self, "Info_Mod_Skip_Malcom_15_03"); //Tut mir leid. Ich will auch Pirat werden und muss mich um meine Aufnahme kümmern.
	AI_Output(self, hero, "Info_Mod_Skip_Malcom_08_04"); //Da wirst du wohl einiges zu tun bekommen. Lass dich nicht aufhalten.
	AI_Output(self, hero, "Info_Mod_Skip_Malcom_08_05"); //Ich schaff das schon.

	B_GivePlayerXP	(50);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_PIRATEN_MALCOM, LOG_SUCCESS);
};

INSTANCE Info_Mod_Skip_Francis (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Francis_Condition;
	information	= Info_Mod_Skip_Francis_Info;
	permanent	= 0;
	important	= 0;
	description	= "Francis schickt mich.";
};

FUNC INT Info_Mod_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Francis_Entertrupp))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Francis_Info()
{
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_00"); //Ahoi Landratte. Stimmt es, dass es einen Weg nach Khorinis gibt. Henry labert sowas.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_01"); //Ja, im Nu ist man drüben.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_02"); //Das trifft sich gut. Mit dem Boot brauch ich jedesmal 'nen halben Tag.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_03"); //Und das auch nur, wenn der Wind günstig steht.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_04"); //Francis hat mir gesagt, dass du nicht mehr mit seinem Entertrupp handelst.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_05"); //Beim Klabautermann! Diese Stroche haben doch meine Paddel verheizt. Zu faul, um Feuerholz zu besorgen.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_06"); //Und ohne Paddel lauf ich nicht aus. Was soll ich denn bei Windstille machen, eh?
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_07"); //Kann ich das irgendwie wieder gut machen?
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_08"); //Du könntest jetzt die Lieferung übernehmen, dann würde ich wieder mit Francis und seinen Jungs handeln.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_09"); //Na gut, was soll ich machen?
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_10"); //Bring dieses Paket voller Rum nach Khorinis. Der Wirt in der Kneipe des Hafenviertels wartet bereits darauf.

	B_GiveInvItems	(self, hero, Mod_RumPaket, 1);

	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_11"); //Dieses Paket Grog bringst du zu einem der Söldner, der auf Onars Hof stationiert ist.
	
	B_GiveInvItems	(self, hero, Mod_GrogPaket, 1);

	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_12"); //Und dieses Paket mit verschiednen Sachen bringst du zu Lehmar, dem Geldleiher.

	B_GiveInvItems	(self, hero, Mod_KleinodPaket, 1);

	if (Assassinen_Dabei)
	{
		AI_Output(hero, self, "Info_Mod_Skip_Francis_15_13"); //Lehmar werde ich nichts mehr bringen können, der ist tot.
		AI_Output(self, hero, "Info_Mod_Skip_Francis_08_14"); //Dann lass dir was einfallen, wie du an sein Gold kommst.
	};

	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_15"); //Du bringst mir insgesamt 1500 Goldstücke zurück, was die Leute mehr bezahlen gehört dir.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_16"); //Du kennst diese ganzen Leute?
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_17"); //Gewiss. Bin doch regelmäßig mit dem Boot in Khorinis gewesen. Verkleidet natürlich.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_18"); //Hier gibt's doch nichts außer Fleisch und Wasser.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_19"); //Und eure Schäpse ...
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_20"); //Auch beigeschafft. Oder siehst du hier irgendwo ein Zuckerrohrfeld oder einen Kartoffelacker?
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_21"); //Hast recht.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_08_22"); //Bin schon wieder so gut wie zurück.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_23"); //Moment! Vielleicht kannst du mir in der Stadt ein paar neue Paddel besorgen.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_24"); //Will sehen, was ich tun kann.

	Log_CreateTopic	(TOPIC_MOD_SKIP_PADDEL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SKIP_PADDEL, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_FRANCIS_ENTERTRUPP, TOPIC_MOD_SKIP_PADDEL, "Ich soll für Skip ein paar Sachen ausliefern: Ein Paket mit Rum für den Wirt im Hafenviertel von Khorinis, ein Paket voller Grog für einen der Söldner auf Onars Hof und ein Paket mit allen möglichen Sachen für Lehmar, den Geldverleiher.", "Ich soll Skip neue Paddel besorgen. Hm ... wer könnte sowas haben? Jemand im Hafen ...");
};

INSTANCE Info_Mod_Skip_Geld (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Geld_Condition;
	information	= Info_Mod_Skip_Geld_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier ist das Gold.";
};

FUNC INT Info_Mod_Skip_Geld_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 1500)
	&& (Npc_HasItems(hero, ItMi_Paddel) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Geld_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Geld_15_00"); //Hier ist das Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 1500);

	AI_Output(self, hero, "Info_Mod_Skip_Geld_08_01"); //Sehr gut, Jungchen! Damit ist der Streit mit Francis wieder vergessen.
	AI_Output(self, hero, "Info_Mod_Skip_Geld_08_02"); //Und die Paddel hast du auch.

	B_GiveInvItems	(hero, self, ItMi_Paddel, 2);

	AI_Output(self, hero, "Info_Mod_Skip_Geld_08_03"); //Dann kann ich ja wieder in See stechen. Was schulde ich dir?
	AI_Output(hero, self, "Info_Mod_Skip_Geld_15_04"); //Ich habe 200 dafür bezahlt. Und du könntest mich mal auf euer Schiff bringen ...
	AI_Output(self, hero, "Info_Mod_Skip_Geld_08_05"); //Hmm. Da musst du den Käpt'n fragen. Hier, dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	B_LogEntry	(TOPIC_MOD_FRANCIS_ENTERTRUPP, "Skip ist zufrieden und wird jetzt wieder mit Francis und dessen Entertrupp handeln.");
	B_SetTopicStatus	(TOPIC_MOD_SKIP_PADDEL, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Skip_Schatzsuche (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Schatzsuche_Condition;
	information	= Info_Mod_Skip_Schatzsuche_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg schickt mich.";
};

FUNC INT Info_Mod_Skip_Schatzsuche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Karte))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Schatzsuche_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Schatzsuche_15_00"); //Greg schickt mich. Er will demnächst auslaufen. Kann ich dir irgendwie helfen?
	AI_Output(self, hero, "Info_Mod_Skip_Schatzsuche_08_01"); //Ja, unsre Fleischvorräte gehen langsam zur Neige.
	AI_Output(self, hero, "Info_Mod_Skip_Schatzsuche_08_02"); //Bring mir 30 Stücke rohes Fleisch, Beisser oder Ratte.
	AI_Output(self, hero, "Info_Mod_Skip_Schatzsuche_08_03"); //Kein Razorfleisch. Das ist zäh und lässt sich schlecht pökeln.
	AI_Output(hero, self, "Info_Mod_Skip_Schatzsuche_15_04"); //Bin schon unterwegs.

	Log_CreateTopic	(TOPIC_MOD_SKIP_VORRÄTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SKIP_VORRÄTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Ich soll Skip 30 Stück rohes Fleisch bringen.");
};

INSTANCE Info_Mod_Skip_Fleisch (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Fleisch_Condition;
	information	= Info_Mod_Skip_Fleisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, ich hab dein Fleisch.";
};

FUNC INT Info_Mod_Skip_Fleisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Schatzsuche))
	&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 30)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Fleisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Fleisch_15_00"); //Hier, ich hab dein Fleisch.
	AI_Output(self, hero, "Info_Mod_Skip_Fleisch_08_01"); //Bring's zu Samuel. Er soll es Pökeln. Und sich beeilen.
	AI_Output(hero, self, "Info_Mod_Skip_Fleisch_15_02"); //Mach ich doch.

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Nun soll ich das Fleisch zu Samuel bringen, welcher es pökeln wird.");
};

INSTANCE Info_Mod_Skip_Fleisch2 (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Fleisch2_Condition;
	information	= Info_Mod_Skip_Fleisch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier dein Proviant. Du sollst es noch trocknen lassen.";
};

FUNC INT Info_Mod_Skip_Fleisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Fleisch))
	&& (Npc_HasItems(hero, ItFo_Poekelfleisch_Skip) >= 30)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Fleisch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Fleisch2_15_00"); //Hier dein Proviant. Du sollst es noch trocknen lassen

	B_GiveInvItems	(hero, self, ItFo_Poekelfleisch_Skip, 30);

	Npc_RemoveInvItems	(self, ItFo_Poekelfleisch_Skip, 30);

	AI_Output(self, hero, "Info_Mod_Skip_Fleisch2_08_01"); //Schon gut. Weiß Bescheid.

	Mod_PiratenVorbereitungen += 1;

	B_SetTopicStatus	(TOPIC_MOD_SKIP_VORRÄTE, LOG_SUCCESS);

	B_LogEntry	(TOPIC_MOD_PIRATEN_SCHATZSUCHE, "Ich habe für Skip einige Vorräte besorgt.");

	B_GivePlayerXP	(200);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Skip_AllesFertig (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_AllesFertig_Condition;
	information	= Info_Mod_Skip_AllesFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg will wissen, ob alles an Bord ist.";
};

FUNC INT Info_Mod_Skip_AllesFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Saebel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_AllesFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_AllesFertig_15_00"); //Greg will wissen, ob alles an Bord ist.
	AI_Output(self, hero, "Info_Mod_Skip_AllesFertig_08_01"); //Ich denke schon. Alles bis auf die Mannschaft.
};

INSTANCE Info_Mod_Skip_AufbruchSchatzsuche (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_AufbruchSchatzsuche_Condition;
	information	= Info_Mod_Skip_AufbruchSchatzsuche_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Skip_AufbruchSchatzsuche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Kompass))
	&& (Kapitel >= 4)
	&& (Mod_Piraten_Aufbruch == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_AufbruchSchatzsuche_Info()
{
	AI_Output(self, hero, "Info_Mod_Skip_AufbruchSchatzsuche_08_00"); //Wir warten auf dich. Die Anderen sind schon an Bord.

	AI_StopProcessInfos	(self);

	Mod_VorbereitungenFertig = 5;
};

INSTANCE Info_Mod_Skip_Schatzaufteilung (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Schatzaufteilung_Condition;
	information	= Info_Mod_Skip_Schatzaufteilung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Skip_Schatzaufteilung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_DI_ZumSchiff_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Schatzaufteilung_Info()
{
	AI_Output(self, hero, "Info_Mod_Skip_Schatzaufteilung_08_00"); //Hey, du bist ja aufgewacht. Greg erwartet dich, geh zu ihm!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_963_PIR_Malcom_NW,	"START");
	B_StartOtherRoutine	(Mod_928_PIR_AlligatorJack_AW,	"START");
	B_StartOtherRoutine	(Mod_929_PIR_Bill_AW,	"START");
	B_StartOtherRoutine	(Mod_930_PIR_Bones_AW,	"START");
	B_StartOtherRoutine	(Mod_931_PIR_Brandon_AW,	"START");
	B_StartOtherRoutine	(Mod_932_PIR_Francis_AW,	"START");
	B_StartOtherRoutine	(Mod_933_PIR_Garett_AW,	"START");
	B_StartOtherRoutine	(Mod_934_PIR_Henry_AW,	"START");
	B_StartOtherRoutine	(Mod_935_PIR_Malcom_AW,	"START");
	B_StartOtherRoutine	(Mod_936_PIR_Matt_AW,	"START");
	B_StartOtherRoutine	(Mod_938_PIR_Morgan_AW,	"START");
	B_StartOtherRoutine	(Mod_939_PIR_Owen_AW,	"START");
	B_StartOtherRoutine	(Mod_940_PIR_Samuel_AW,	"START");
	B_StartOtherRoutine	(Mod_941_PIR_Angus_AW,	"START");
	B_StartOtherRoutine	(Mod_942_PIR_Hank_AW,	"START");
};

INSTANCE Info_Mod_Skip_Befreiung (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Befreiung_Condition;
	information	= Info_Mod_Skip_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alles in Ordnung?";
};

FUNC INT Info_Mod_Skip_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung_15_00"); //Alles in Ordnung?
	AI_Output(self, hero, "Info_Mod_Skip_Befreiung_08_01"); //(stöhnt) Nein. Beim Kamf wurde ich von einem Feurball getroffen, was eine schlimme Fleischwunde ausgelöst hat. Ich weiß nicht, wie lange ich noch durchalte.
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung_15_02"); //Wie kann ich dir helfen?
	AI_Output(self, hero, "Info_Mod_Skip_Befreiung_08_03"); //Geh' zu Samuel. Er kann vielleicht helfen.
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung_15_04"); //Alles klar, ich werde mich beeilen.

	AI_StopProcessInfos	(self);

	Log_CreateTopic	(TOPIC_MOD_BEL_PIRSKIP, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRSKIP, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_PIRSKIP, "Skip liegt schwer verwundet in seiner Hütte. Ein Feuerball hat ihn während des Kampfes getroffen. Nun soll ich zu Samuel und sehen, ob er helfen kann.");
};

INSTANCE Info_Mod_Skip_Befreiung2 (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Befreiung2_Condition;
	information	= Info_Mod_Skip_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Trink das.";
};

FUNC INT Info_Mod_Skip_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Befreiung))
	&& (Npc_HasItems(hero, ItPo_AdanosWohltat) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung2_15_00"); //Trink das. Dieser Trank wird dir helfen.

	B_GiveInvItems	(hero, self, ItPo_AdanosWohltat, 1);
	B_UseItem	(self, ItPo_AdanosWohltat);

	AI_Output(self, hero, "Info_Mod_Skip_Befreiung2_08_01"); //Danke. Dieses Zeug hat mir echt geholfen.
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung2_15_02"); //Also bist du wieder fit?
	AI_Output(self, hero, "Info_Mod_Skip_Befreiung2_08_03"); //Ja, hab mich nie besser gefühlt. Nimm das als Zeichen meiner Dankbarkeit.

	CreateInvItems	(self, ItMi_Gold, 300);
	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	AI_Output(hero, self, "Info_Mod_Skip_Befreiung2_15_04"); //Danke. Ich geh dann mal.
	AI_Output(self, hero, "Info_Mod_Skip_Befreiung2_08_05"); //Man sieht sich.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "PRESTART");

	B_LogEntry_More	(TOPIC_MOD_BEL_PIRSKIP, TOPIC_MOD_BEL_PIRATENLAGER, "Skip ist dank des Trankes wieder fit.", "Skip ist wieder fit.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRSKIP, LOG_SUCCESS);

	Mod_Piratenbefreiung += 1;

	B_GivePlayerXP	(450);
};

INSTANCE Info_Mod_Skip_Trade (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Trade_Condition;
	information	= Info_Mod_Skip_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Skip_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Skip_Pickpocket (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Pickpocket_Condition;
	information	= Info_Mod_Skip_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Skip_Pickpocket_Condition()
{
	C_Beklauen	(100, ItFo_Addon_Grog, 3);
};

FUNC VOID Info_Mod_Skip_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

	Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_BACK, Info_Mod_Skip_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Skip_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Skip_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Skip_Pickpocket);
};

FUNC VOID Info_Mod_Skip_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

		Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Skip_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Skip_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Skip_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Skip_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Skip_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Skip_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Skip_EXIT (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_EXIT_Condition;
	information	= Info_Mod_Skip_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Skip_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Skip_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};