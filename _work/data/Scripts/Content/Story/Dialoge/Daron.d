INSTANCE Info_Mod_Daron_Hi (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_Hi_Condition;
	information	= Info_Mod_Daron_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Daron_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Daron_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Daron_Hi_10_01"); //Ich bin der Feuermagier Daron. Was kann ich für dich tun, Fremder?
};

INSTANCE Info_Mod_Daron_ZugangZumKloster (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_ZugangZumKloster_Condition;
	information	= Info_Mod_Daron_ZugangZumKloster_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir Zugang zum Kloster gewähren?";
};

FUNC INT Info_Mod_Daron_ZugangZumKloster_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daron_Hi))
	&& (Mod_Gilde	==	0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Daron_ZugangZumKloster_Info()
{
	AI_Output(hero, self, "Info_Mod_Daron_ZugangZumKloster_15_00"); //Kannst du mir Zugang zum Kloster gewähren?
	AI_Output(self, hero, "Info_Mod_Daron_ZugangZumKloster_10_01"); //Was willst du in unserem Kloster?

	Info_ClearChoices	(Info_Mod_Daron_ZugangZumKloster);
	
	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andokai_Hammer))
	{
		Info_AddChoice	(Info_Mod_Daron_ZugangZumKloster, "Ich soll für die Dämonenbeschwörer den Heiligen Hammer stehlen.", Info_Mod_Daron_ZugangZumKloster_Witz);
	};
	Info_AddChoice	(Info_Mod_Daron_ZugangZumKloster, "Ich will ein Feuer Novize werden.", Info_Mod_Daron_ZugangZumKloster_Novize);
};

FUNC VOID Info_Mod_Daron_ZugangZumKloster_Witz()
{
	AI_Output(hero, self, "Info_Mod_Daron_ZugangZumKloster_Witz_15_00"); //Ich soll für die Dämonenbeschwörer den Heiligen Hammer stehlen.
	AI_Output(self, hero, "Info_Mod_Daron_ZugangZumKloster_Witz_10_01"); //Wie ich sehe hast du Humor. Aber wir Magier sind ernste Leute und wollen nicht lachen.
	AI_Output(self, hero, "Info_Mod_Daron_ZugangZumKloster_Witz_10_02"); //Nun sage mir weshalb du Einlass in unser Kloster erbittest.
};

FUNC VOID Info_Mod_Daron_ZugangZumKloster_Novize()
{
	AI_Output(hero, self, "Info_Mod_Daron_ZugangZumKloster_Novize_15_00"); //Ich will ein Feuer Novize werden.
	AI_Output(self, hero, "Info_Mod_Daron_ZugangZumKloster_Novize_10_01"); //Wenn dies wirklich dein begehren ist, dann sollst du deine Bitte gewährt bekommen.
	AI_Output(self, hero, "Info_Mod_Daron_ZugangZumKloster_Novize_10_02"); //Doch werde ich dir erst den Schlüssel zu unseren heiligen Pforte erst übergeben, wenn du mir einen Gefallen getan hast.

	B_LogEntry	(TOPIC_MOD_FEUERMAGIER, "Um ein Feuer Novize zu werden muss ich zuerst Zugang zum Kloster bekommen. Daron wird mir den Schlüssel geben, wenn ich ihm einen Gefallen tue.");

	Info_ClearChoices	(Info_Mod_Daron_ZugangZumKloster);

	Info_AddChoice	(Info_Mod_Daron_ZugangZumKloster, "Was soll ich für dich machen?", Info_Mod_Daron_ZugangZumKloster_Gefallen);
};

FUNC VOID Info_Mod_Daron_ZugangZumKloster_Gefallen()
{
	AI_Output(hero, self, "Info_Mod_Daron_ZugangZumKloster_Gefallen_15_00"); //Was soll ich für dich machen?
	AI_Output(self, hero, "Info_Mod_Daron_ZugangZumKloster_Gefallen_10_01"); //Pyrokar, der oberste Feuermagier, hat mich in die Stadt geschickt, damit ich ein Mittel gegen eine Krankheit, die schon einige unserer Novizen befallen hat, besorge.
	AI_Output(self, hero, "Info_Mod_Daron_ZugangZumKloster_Gefallen_10_02"); //Diese Krankheit hat ein starkes Fieber ausgelöst, das unsere Magie nicht zu heilen vermag.
	AI_Output(self, hero, "Info_Mod_Daron_ZugangZumKloster_Gefallen_10_03"); //Ein Heilmittel dafür gibt es beim Wassermagier Vatras, der an seinem kleinen Tempel hier in der Stadt seine Predigten hält.
	AI_Output(self, hero, "Info_Mod_Daron_ZugangZumKloster_Gefallen_10_04"); //Doch mein Stolz als Feuermagier lässt es nicht zu, dass ich einen Wassermagier um Hilfe bitte.
	AI_Output(self, hero, "Info_Mod_Daron_ZugangZumKloster_Gefallen_10_05"); //Du würdest mir wirklich einen Gefallen tun, wenn du die Medizin von ihm abholen würdest.

	Log_CreateTopic	(TOPIC_MOD_DARONSGEFALLEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DARONSGEFALLEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DARONSGEFALLEN, "Ich soll für Daron eine Medizin vom Wassermagier Vatras besorgen.");

	Info_ClearChoices	(Info_Mod_Daron_ZugangZumKloster);

	B_StartOtherRoutine	(Mod_915_NOV_Dyrian_NW, "KRANK");
	B_StartOtherRoutine	(Mod_913_NOV_Agon_NW, "KRANK");
	B_StartOtherRoutine	(Mod_919_NOV_Igaraz_NW, "KRANK");
	B_StartOtherRoutine	(Mod_1192_NOV_Novize_NW, "KRANK");
	B_StartOtherRoutine	(Mod_1194_NOV_Novize_NW, "KRANK");
	B_StartOtherRoutine	(Mod_1195_NOV_Novize_NW, "KRANK");
};

INSTANCE Info_Mod_Daron_HabTrank (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_HabTrank_Condition;
	information	= Info_Mod_Daron_HabTrank_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab den Trank von Vatras (Trank geben)";
};

FUNC INT Info_Mod_Daron_HabTrank_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daron_ZugangZumKloster))
	&& (Npc_HasItems(hero, VatrasNovizenTrunk) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Daron_HabTrank_Info()
{
	AI_Output(hero, self, "Info_Mod_Daron_HabTrank_15_00"); //Ich hab den Trank von Vatras.

	B_GiveInvItems	(hero, self, VatrasNovizenTrunk, 1);

	AI_Output(self, hero, "Info_Mod_Daron_HabTrank_10_01"); //Danke. Wenn du willst, kann ich dich jetzt zum Kloster geleiten.
	AI_Output(self, hero, "Info_Mod_Daron_HabTrank_10_02"); //Eine Sache gibt es jedoch noch, die mich am Aufbruch hindert.
	AI_Output(self, hero, "Info_Mod_Daron_HabTrank_10_03"); //Der Novize Akahasch ist seit einigen Tagen verschwunden.
	AI_Output(self, hero, "Info_Mod_Daron_HabTrank_10_04"); //Zuletzt wurde er im Hafenviertel in der Taverne gesehen ... man könnte dort vielleicht Informationen über seinen Verbleib bekommen ... ich selbst würde mich ungern dorthin begeben wenn du verstehst.
	AI_Output(self, hero, "Info_Mod_Daron_HabTrank_10_05"); //Wenn du also ...
	AI_Output(hero, self, "Info_Mod_Daron_HabTrank_15_06"); //(die Augen verdrehend) Ja, ich verstehe schon. Ich werde mich umhören.
	AI_Output(self, hero, "Info_Mod_Daron_HabTrank_10_07"); //Sehr gut. Sobald du ihn gefunden hast, bring ihn zu mir.

	B_GivePlayerXP	(50);

	Log_CreateTopic	(TOPIC_MOD_ASS_AUFNAHME, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_AUFNAHME, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_DARONSGEFALLEN, TOPIC_MOD_ASS_AUFNAHME, "Ich habe Daron den Trank gegeben.", "Damit Daron mich zum Kloster begleitet, muss ich erst den Verbleib des Novizen Akahasch in Erfahrung bringen. Zuletzt wurde er bei der Taverne im Hafenviertel gesehen. Sobald ich ihn gefunden habe, soll ich ihn zu Daron geleiten.");

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Daron_Akahasch (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_Akahasch_Condition;
	information	= Info_Mod_Daron_Akahasch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Akahasch gefunden.";
};

FUNC INT Info_Mod_Daron_Akahasch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daron_HabTrank))
	&& (Npc_KnowsInfo(hero, Info_Mod_Nagur_Hi))
	&& ((Npc_KnowsInfo(hero, Info_Mod_Akahasch_Hi))
	|| (Npc_IsDead(Mod_4016_NOV_Akahasch_NW)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Daron_Akahasch_Info()
{
	AI_Output(hero, self, "Info_Mod_Daron_Akahasch_15_00"); //Ich habe Akahasch gefunden.

	if (Mod_Akahasch_Guiding == 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Akahasch_AtKloster))
	{
		AI_Output(self, hero, "Info_Mod_Daron_Akahasch_10_01"); //Ahh, wie ich sehe ist er bei dir. Lass uns gleich zum Kloster gehen, den Rest können wird dort besprechen.
	}
	else if (Mod_Akahasch_Guiding == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Akahasch_AtKloster))
	{
		AI_Output(hero, self, "Info_Mod_Daron_Akahasch_15_02"); //Ich habe ihn wieder ins Kloster gebracht.
		AI_Output(self, hero, "Info_Mod_Daron_Akahasch_10_03"); //Ja? Das ist gut. Dann können wir ja sofort aufbrechen.
	}
	else if (Mod_Akahasch_Guiding == 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Akahasch_AtKloster))
	{
		AI_Output(self, hero, "Info_Mod_Daron_Akahasch_10_04"); //Wo ist er?
		AI_Output(hero, self, "Info_Mod_Daron_Akahasch_15_05"); //Er lag tot in der Nähe des Leuchtturmes ... wilde Tiere müssen ihn erwischt haben.
		AI_Output(self, hero, "Info_Mod_Daron_Akahasch_10_06"); //Was sagst du? Innos sei seiner Seele gnädig. Aber was hatte er auch mitten in der Wildnis verloren?
		AI_Output(self, hero, "Info_Mod_Daron_Akahasch_10_07"); //Wie dem auch sei, nun hält mich nichts mehr in der Stadt. Brechen wir also zum Kloster auf.
	};

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_ASS_AUFNAHME, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Daron_KlosterGuide (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_KlosterGuide_Condition;
	information	= Info_Mod_Daron_KlosterGuide_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bring mich zum Kloster.";
};

FUNC INT Info_Mod_Daron_KlosterGuide_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daron_Akahasch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Daron_KlosterGuide_Info()
{
	AI_Output(hero, self, "Info_Mod_Daron_KlosterGuide_15_00"); //Bring mich zum Kloster.
	AI_Output(self, hero, "Info_Mod_Daron_KlosterGuide_10_01"); //Gut, folge mir.

	self.aivar[AIV_PARTYMEMBER] = TRUE;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETOKLOSTER");
};

INSTANCE Info_Mod_Daron_InsKloster (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_InsKloster_Condition;
	information	= Info_Mod_Daron_InsKloster_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Daron_InsKloster_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daron_KlosterGuide))
	&& (Npc_GetDistToWP(self, "NW_MONASTERY_ENTRY_01") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Daron_InsKloster_Info()
{
	AI_Output(self, hero, "Info_Mod_Daron_InsKloster_10_00"); //Hier ist das Kloster. Du wirst allerdings nicht ohne weiteres hineinkommen.
	AI_Output(self, hero, "Info_Mod_Daron_InsKloster_10_01"); //Ich werde die Flammen für dich einfrieren, damit du das Tor durchschreiten kannst. Solange du Innos treu bleibst kannst du dieses Tor immer durchschreiten, auch wenn du nicht zu uns gehörst. 
	AI_Output(self, hero, "Info_Mod_Daron_InsKloster_10_02"); //Komm weiter.

	Npc_ExchangeRoutine	(self, "GUIDEINKLOSTER");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Daron_Akahasch2 (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_Akahasch2_Condition;
	information	= Info_Mod_Daron_Akahasch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Daron_Akahasch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daron_InsKloster))
	&& ((Npc_KnowsInfo(hero, Info_Mod_Akahasch_AtKloster))
	|| ((Mod_Akahasch_Guiding == 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Akahasch_AtKloster))))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Daron_Akahasch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Daron_Akahasch2_10_00"); //Nun würde mich noch interessieren, was Akahasch in der Wildnis verloren hatte?

	Info_ClearChoices	(Info_Mod_Daron_Akahasch2);

	Info_AddChoice	(Info_Mod_Daron_Akahasch2, "Ein paar Verrückte in der Stadt und stellten ihm nach.", Info_Mod_Daron_Akahasch2_B);
	Info_AddChoice	(Info_Mod_Daron_Akahasch2, "Er hatte Wettschulden und ist abgehauen.", Info_Mod_Daron_Akahasch2_A);
};

FUNC VOID Info_Mod_Daron_Akahasch2_B()
{
	AI_Output(hero, self, "Info_Mod_Daron_Akahasch2_B_15_00"); //Ein paar Verrückte in der Stadt und stellten ihm nach.
	AI_Output(self, hero, "Info_Mod_Daron_Akahasch2_B_10_01"); //Ja?! Hmm ... bisweilen müssen die ehrwürdigen Diener des höchsten der Götter Anfeindungen Unwürdiger trotzen.
	AI_Output(self, hero, "Info_Mod_Daron_Akahasch2_B_10_02"); //Akahasch hat die ihm auferlegten Prüfung ertragen und soll die nächsten Wochen im Kloster zur Erholung von Körper und Geist nutzen.

	Info_ClearChoices	(Info_Mod_Daron_Akahasch2);

	B_StartOtherRoutine	(Mod_4016_NOV_Akahasch_NW, "KLOSTER2");
};

FUNC VOID Info_Mod_Daron_Akahasch2_A()
{
	AI_Output(hero, self, "Info_Mod_Daron_Akahasch2_A_15_00"); //Er hatte Wettschulden und ist abgehauen, als ihm der Boden unter den Füßen heiß wurde.
	AI_Output(self, hero, "Info_Mod_Daron_Akahasch2_A_10_01"); //(erbost) So ist das?! Dann wird harte Arbeit für ein paar Wochen ihn bestimmt von weiteren Sperenzchen abhalten.
	AI_Output(self, hero, "Info_Mod_Daron_Akahasch2_A_10_02"); //Der soll mich kennenlernen ...

	Info_ClearChoices	(Info_Mod_Daron_Akahasch2);

	B_StartOtherRoutine	(Mod_4016_NOV_Akahasch_NW, "KLOSTER2");

	Mod_DaronAkahasch_Day = Wld_GetDay();

	Mod_DaronAkahasch = 1;
};

INSTANCE Info_Mod_Daron_ImKloster (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_ImKloster_Condition;
	information	= Info_Mod_Daron_ImKloster_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Daron_ImKloster_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daron_InsKloster))
	&& (Npc_GetDistToWP(self, "NW_MONASTERY_PLACE_03") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Daron_ImKloster_Info()
{
	AI_Output(self, hero, "Info_Mod_Daron_ImKloster_10_00"); //So, da sind wir. Bring Pyrokar die Medizin.
	
	B_GiveInvItems	(self, hero, VatrasNovizenTrunk, 1);

	AI_Output(self, hero, "Info_Mod_Daron_ImKloster_10_01"); //Ich werde nun meiner Arbeit nachgehen.

	B_LogEntry	(TOPIC_MOD_DARONSGEFALLEN, "Daron hat mich zum Kloster gebracht, ich soll die Medizin nun zu Pyrokar bringen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "LIFEKLOSTER");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Daron_FeuerGegenEis (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_FeuerGegenEis_Condition;
	information	= Info_Mod_Daron_FeuerGegenEis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Daron_FeuerGegenEis_Condition()
{
	if (hero.guild == GIL_VLK)
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Daron_FeuerGegenEis_Info()
{
	AI_Output(self, hero, "Info_Mod_Daron_FeuerGegenEis_10_00"); //Gut, dass du kommst. Du musst sofort mit Pyrokar sprechen. Begib dich ohne Verzug zu ihm.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Daron_Drachen (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_Drachen_Condition;
	information	= Info_Mod_Daron_Drachen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist dir in letzter Zeit Ungewöhnliches aufgefallen?";
};

FUNC INT Info_Mod_Daron_Drachen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daron_ImKloster))
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Dragon_Kloster))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Daron_Drachen_Info()
{
	AI_Output(hero, self, "Info_Mod_Daron_Drachen_15_00"); //Ist dir in letzter Zeit Ungewöhnliches aufgefallen?
	AI_Output(self, hero, "Info_Mod_Daron_Drachen_10_01"); //Das will ich meinen. Jede Nacht wird auf dem Gebirge westlich vom Kloster immer wieder ein helles Lodern erkennbar.
	AI_Output(self, hero, "Info_Mod_Daron_Drachen_10_02"); //(nachdenklich) Was mag da nur vor sich gehen ...

	B_LogEntry	(TOPIC_MOD_DARONSGEFALLEN, "Daron erzählte von hellem Lodern auf den Gebirgen westlich vom Kloster.");
};

INSTANCE Info_Mod_Daron_KlosterAngegriffen (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_KlosterAngegriffen_Condition;
	information	= Info_Mod_Daron_KlosterAngegriffen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Daron_KlosterAngegriffen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragon_Kloster))
	&& (Mod_NL_DragonKloster == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Daron_KlosterAngegriffen_Info()
{
	AI_Output(self, hero, "Info_Mod_Daron_KlosterAngegriffen_10_00"); //Bei Innos, was für ein Alptraum.
	AI_Output(hero, self, "Info_Mod_Daron_KlosterAngegriffen_15_01"); //Hallo, gibt es was Neues?
	AI_Output(self, hero, "Info_Mod_Daron_KlosterAngegriffen_10_02"); //(erzürnt) Ob es etwas Neues gibt?! Bei Anbruch der Nacht überfielen Horden feuriger Dämonen unser Kloster.
	AI_Output(self, hero, "Info_Mod_Daron_KlosterAngegriffen_10_03"); //Es passierte so plötzlich, dass wir gar nicht wussten, wie uns geschah.
	AI_Output(self, hero, "Info_Mod_Daron_KlosterAngegriffen_10_04"); //Nach kurzem Kampf mussten wir uns der Übermacht geschlagen geben und flüchteten in die inneren Räume.
	AI_Output(self, hero, "Info_Mod_Daron_KlosterAngegriffen_10_05"); //Wir waren zuerst überrascht und glücklich zu sehen, dass wir alle mit dem Leben davongekommen waren, was sicher auch auf unsere Erfahrung im Umgang mit Feuer zurückzuführen ist.
	AI_Output(self, hero, "Info_Mod_Daron_KlosterAngegriffen_10_06"); //(Außer sich) Am nächsten morgen mussten wir jedoch feststellen, dass die Bastarde den größten Teil unserer Reichtümer und Vorräte gestohlen hatten.
	AI_Output(self, hero, "Info_Mod_Daron_KlosterAngegriffen_10_07"); //Frevler, Untiere, Ausgeburten ...
	AI_Output(hero, self, "Info_Mod_Daron_KlosterAngegriffen_15_08"); //(halblaut) Ja, dann will ich dich mal nicht weiter stören.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Daron_Katar (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_Katar_Condition;
	information	= Info_Mod_Daron_Katar_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Daron_Katar_Condition()
{
	if (Mod_Sekte_Karras >= 1)
	&& (Mod_Sekte_Joseppe < 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Karras_NamibHabBuch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Daron_Katar_Info()
{
	AI_TurnToNpc	(self, Mod_1190_NOV_Katar_NW);

	AI_Output(self, hero, "Info_Mod_Daron_Katar_10_00"); //Was soll denn das? Auch Innos kann nicht immer vergeben! Das bedeutet Strafarbeit.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Daron_Rasend (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_Rasend_Condition;
	information	= Info_Mod_Daron_Rasend_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Daron_Rasend_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Martin_Rasend))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Daron_Rasend_Info()
{
	AI_Output(self, hero, "Info_Mod_Daron_Rasend_10_00"); //(bestürzt) So, viele Brüder sehe ich hier vor mir liegen. Hinweggerafft durch die Hand eines verfluchten Dämonen.
	AI_Output(hero, self, "Info_Mod_Daron_Rasend_15_01"); //Was ist geschehen? Schon wieder der Dämon?
	AI_Output(self, hero, "Info_Mod_Daron_Rasend_10_02"); //Ja, dasselbe abscheuliche Untier, das für das Blutbad in der Stadt verantwortlich ist.
	AI_Output(self, hero, "Info_Mod_Daron_Rasend_10_03"); //Er kam aus dem nichts und hatte – ehe jemand begriff, was eigentlich vor sich ging – schon viele meiner Brüder erschlagen.
	AI_Output(self, hero, "Info_Mod_Daron_Rasend_10_04"); //Sie hatten keine Chance ...
	AI_Output(hero, self, "Info_Mod_Daron_Rasend_15_05"); //Und wo befindet sich der Dämon jetzt, wohin ist er danach verschwunden?
	AI_Output(self, hero, "Info_Mod_Daron_Rasend_10_06"); //Als er seine Gier nach Töten endlich gestillt hatte, erhob er sich wieder in die Luft und flog in die selbe Richtung weiter, die er von der Stadt aus zu uns genommen hatte, nach Osten.
	AI_Output(hero, self, "Info_Mod_Daron_Rasend_15_07"); //Nach Osten ... Aber damit würde er ja genau ... die Ausgrabungsstätte der Wassermagier! Ich muss unbedingt weiter.

	B_LogEntry	(TOPIC_MOD_ADANOS_RASEND, "Auch im Kloster hat der Dämon wie ein Berserker gewütet. Was mich aber vor allem mehr als beunruhigt ist die Tatsache, dass er nach Osten weitergeflogen ist… ziemlich genau in die Richtung, der Ausgrabungsstätte.");

	B_KillNpc	(Mod_1535_WKR_Wasserkrieger_NW);
	B_KillNpc	(Mod_1534_WKR_Wasserkrieger_NW);

	B_StartOtherRoutine	(Mod_774_KDW_Saturas_NW, "RASEND");
	B_StartOtherRoutine	(Mod_538_RDW_Diego_NW, "RASEND");
};

INSTANCE Info_Mod_Daron_Pickpocket (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_Pickpocket_Condition;
	information	= Info_Mod_Daron_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Daron_Pickpocket_Condition()
{
	C_Beklauen	(68, ItMi_InnosStatue, 1);
};

FUNC VOID Info_Mod_Daron_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Daron_Pickpocket);

	Info_AddChoice	(Info_Mod_Daron_Pickpocket, DIALOG_BACK, Info_Mod_Daron_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Daron_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Daron_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Daron_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Daron_Pickpocket);
};

FUNC VOID Info_Mod_Daron_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Daron_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Daron_Pickpocket);

		Info_AddChoice	(Info_Mod_Daron_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Daron_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Daron_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Daron_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Daron_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Daron_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Daron_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Daron_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Daron_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Daron_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Daron_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Daron_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Daron_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Daron_EXIT (C_INFO)
{
	npc		= Mod_523_KDF_Daron_NW;
	nr		= 1;
	condition	= Info_Mod_Daron_EXIT_Condition;
	information	= Info_Mod_Daron_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Daron_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Daron_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};