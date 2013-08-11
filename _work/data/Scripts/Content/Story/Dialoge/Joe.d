INSTANCE Info_Mod_Joe_Hi (C_INFO)
{
	npc		= Mod_588_WNOV_Joe_NW;
	nr		= 1;
	condition	= Info_Mod_Joe_Hi_Condition;
	information	= Info_Mod_Joe_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Joe_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Joe_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Joe_Hi_10_01"); //Ich bin Joe.
};

INSTANCE Info_Mod_Joe_Flugblaetter (C_INFO)
{
	npc		= Mod_588_WNOV_Joe_NW;
	nr		= 1;
	condition	= Info_Mod_Joe_Flugblaetter_Condition;
	information	= Info_Mod_Joe_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Joe_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Joe_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joe_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Joe_Flugblaetter_10_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Joe_Flugblaetter_10_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Joe_Diego (C_INFO)
{
	npc		= Mod_588_WNOV_Joe_NW;
	nr		= 1;
	condition	= Info_Mod_Joe_Diego_Condition;
	information	= Info_Mod_Joe_Diego_Info;
	permanent	= 0;
	important	= 0;
	description	= "Diego braucht eine Ablösung.";
};

FUNC INT Info_Mod_Joe_Diego_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joe_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Diego_Kristall))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joe_Diego_Info()
{
	AI_Output(hero, self, "Info_Mod_Joe_Diego_15_00"); //Diego braucht eine Ablösung.
	AI_Output(self, hero, "Info_Mod_Joe_Diego_10_01"); //Gut, ich mach mich sofort auf den Weg.

	B_LogEntry	(TOPIC_MOD_DIEGO_KRISTALL, "Joe wird Diego ablösen, bis dieser den Kristall geborgen hat.");

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "DIEGO");
};

INSTANCE Info_Mod_Joe_Wassersnapper (C_INFO)
{
	npc		= Mod_588_WNOV_Joe_NW;
	nr		= 1;
	condition	= Info_Mod_Joe_Wassersnapper_Condition;
	information	= Info_Mod_Joe_Wassersnapper_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Joe_Wassersnapper_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joe_Hi))
	&& (Mod_WM_Boeden >= 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joe_Wassersnapper_Info()
{
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_00"); //Sei gegrüßt. Was gibt es neues von dort draußen zu hören?
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_01"); //Mir kam zu Ohren, dass es auf dem Weidenplateau einiges Unheil gab ...
	AI_Output(hero, self, "Info_Mod_Joe_Wassersnapper_15_02"); //Ja, die Mächte der Finsternis sind stark Zurzeit. Die Gemeinschaft des Wassers hat alle Hände voll zu tun das Gleichgewicht zu erhalten.
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_03"); //Wohl war, ich spüre die Unruhe und Besorgnis in unseren Reihen.
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_04"); //Wie gerne würde auch ich meinen Teil dazu beitragen ... aber als einfacher Novize stehen mir solche Aufgaben leider noch nicht offen.
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_05"); //Und die Prüfung, die mir für eine schnelle Aufnahme bei den Wasserkriegern auferlegt wurde, lähmt mich vor Angst, ich könnte versagen.
	AI_Output(hero, self, "Info_Mod_Joe_Wassersnapper_15_06"); //Worum geht es?
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_07"); //Ach, meine Aufgabe ist es, die Snapper des Wassers sicher nach Relendel zu geleiten.
	AI_Output(hero, self, "Info_Mod_Joe_Wassersnapper_15_08"); //Ein Rudel blutrünstiger Snapper begleiten? Da kann ich deine Besorgnis verstehen ...
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_09"); //Nein, darum geht es nicht. Es sind an und für sich friedliche Tiere, die mich umso weniger angreifen würden, da ich ihrem Schöpfer diene.
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_10"); //Alle 10 Jahre zu dieser Zeit erscheinen diese heiligen Geschöpfe am See zwischen Ausgrabungsstätte und schwarzem Troll.
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_11"); //Sie verweilen dort einige Zeit, lassen dem Ort ihre segnende Aura zuteil werden  und begeben sich dann auf den Weg zum See in Relendel.
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_12"); //Und mir wurde die Aufgabe zu Teil die dorthin sicher zu geleiten.
	AI_Output(hero, self, "Info_Mod_Joe_Wassersnapper_15_13"); //Und was ist das Problem bei der Sache?
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_14"); //Nun, nachdem mir diese Prüfung auferlegt wurde, kamen mir Gerüchte zu Ohren, dass sich Wilderer hier herumtreiben sollen.
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_15"); //Sichtungen von geschossenem Wild, welche die Waldläufern gemacht haben, bestätigen dies und ein Händler in der Stadt soll erst vor kurzem Felle von seltenen und schwer zu jagenden Tieren erstanden haben.
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_16"); //Nun habe ich die Sorge, dass den Snappern  unterwegs etwas zustoßen könnte und ich nicht dazu in der Lage wäre, sie dann zu beschützen.
	AI_Output(hero, self, "Info_Mod_Joe_Wassersnapper_15_17"); //Dann werde ich es mir zu Aufgabe machen, den Erfolg deiner Mission sicherzustellen.
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_18"); //Wirklich?! Damit würdest du mir einen unschätzbaren Dienst erweisen.
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper_10_19"); //Nun kann ich mich beruhigt an den See begeben und dort auf dich warten. Hab vielen Dank.

	self.aivar[AIV_Partymember] = TRUE;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SNAPPER");

	Log_CreateTopic	(TOPIC_MOD_JOE_WASSERSNAPPER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JOE_WASSERSNAPPER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JOE_WASSERSNAPPER, "Joe hat die Aufgabe, einige Wassersnapper sicher nach Relendel zu geleiten. Da sich Zurzeit wahrscheinlich Wilderer in der Gegend herumtreiben, werde ich ihn lieber begleiten und ihn dazu an dem See nahe des Relendelpasses treffen.");
};

INSTANCE Info_Mod_Joe_Wassersnapper2 (C_INFO)
{
	npc		= Mod_588_WNOV_Joe_NW;
	nr		= 1;
	condition	= Info_Mod_Joe_Wassersnapper2_Condition;
	information	= Info_Mod_Joe_Wassersnapper2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Joe_Wassersnapper2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joe_Wassersnapper))
	&& (Npc_GetDistToWP(self, "NW_TROLLAREA_PATH_76") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joe_Wassersnapper2_Info()
{
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper2_10_00"); //Ahh, da bist du ja.
	AI_Output(hero, self, "Info_Mod_Joe_Wassersnapper2_15_01"); //Wie sieht es aus?
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper2_10_02"); //Bislang ist alles ruhig. Vielleicht wird es doch alles ohne Komplikationen ablaufen.
	AI_Output(hero, self, "Info_Mod_Joe_Wassersnapper2_15_03"); //Dann mal auf zum Pass.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDE");

	Wld_InsertNpc	(Wassersnapper_Joe_01,	"NW_TROLLAREA_PATH_76");
	Wld_InsertNpc	(Wassersnapper_Joe_02,	"NW_TROLLAREA_PATH_76");
	Wld_InsertNpc	(Wassersnapper_Joe_03,	"NW_TROLLAREA_PATH_76");

	Wld_InsertNpc	(Mod_7586_OUT_Wilderer_NW,	"NW_TROLLAREA_PATH_13");
	Wld_InsertNpc	(Mod_7587_OUT_Wilderer_NW,	"NW_TROLLAREA_PATH_13");
	Wld_InsertNpc	(Mod_7588_OUT_Wilderer_NW,	"NW_TROLLAREA_PATH_13");
};

INSTANCE Info_Mod_Joe_Wassersnapper3 (C_INFO)
{
	npc		= Mod_588_WNOV_Joe_NW;
	nr		= 1;
	condition	= Info_Mod_Joe_Wassersnapper3_Condition;
	information	= Info_Mod_Joe_Wassersnapper3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Joe_Wassersnapper3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joe_Wassersnapper2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Wilderer_Hi))
	&& (Npc_IsDead(Mod_7586_OUT_Wilderer_NW))
	&& (Npc_IsDead(Mod_7587_OUT_Wilderer_NW))
	&& (Npc_IsDead(Mod_7588_OUT_Wilderer_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joe_Wassersnapper3_Info()
{
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper3_10_00"); //Was für Frevler. Nur Dank deiner Unterstützung wurde schlimmeres abgewendet.
	AI_Output(hero, self, "Info_Mod_Joe_Wassersnapper3_15_01"); //Ja, das Los, welches ihnen zustand, haben sie auch bekommen. Lass uns weitergehen.
};

INSTANCE Info_Mod_Joe_Wassersnapper4 (C_INFO)
{
	npc		= Mod_588_WNOV_Joe_NW;
	nr		= 1;
	condition	= Info_Mod_Joe_Wassersnapper4_Condition;
	information	= Info_Mod_Joe_Wassersnapper4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Joe_Wassersnapper4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joe_Wassersnapper3))
	&& (Npc_GetDistToWP(self, "NW_TROLLAREA_PLANE_02") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joe_Wassersnapper4_Info()
{
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper4_10_00"); //Da sind wir. Wir haben es tatsächlich geschafft. Ohne deine Hilfe wäre es niemals möglich gewesen. Ich weiß nicht, wie ich dir danken soll.
	AI_Output(hero, self, "Info_Mod_Joe_Wassersnapper4_15_01"); //Passt schon. Ich denke ... was passiert ... mir ...

	Wld_PlayEffect("spellFX_INCOVATION_BLUE",  Wassersnapper_Joe_01, Wassersnapper_Joe_01, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",  Wassersnapper_Joe_02, Wassersnapper_Joe_02, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",  Wassersnapper_Joe_03, Wassersnapper_Joe_03, 0, 0, 0, FALSE );

	AI_Output(hero, self, "Info_Mod_Joe_Wassersnapper4_15_02"); //Was ist geschehen?
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper4_10_03"); //Ich ... mir scheint, die Snapper haben uns einen Teil ihrer Aura zukommen lassen.
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper4_10_04"); //Ich spüre, wie das Wissen und die magische Kraft in mir gewachsen sind.
	AI_Output(hero, self, "Info_Mod_Joe_Wassersnapper4_15_05"); //Sie sind verschwunden.
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper4_10_06"); //Ja, zu einem anderen Ort, welchem sie Adanos Segen zukommen lassen ... bis sie in zehn Jahren ihr Weg wieder hierher führt.
	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper4_10_07"); //Und dies ist vor allem dir zu Verdanken. Achja, hier mein Dankeschön an dich.

	B_ShowGivenThings	("Kronstöckl und 2 Mana Elixiere erhalten");

	CreateInvItems	(hero, ItPl_Perm_Herb, 1);
	CreateInvItems	(hero, ItPo_Mana_03, 2);

	AI_Output(self, hero, "Info_Mod_Joe_Wassersnapper4_10_08"); //Ich hoffe, du kannst es nutzen, auch, wenn es den wahren Wert deines Dienstes selbstverständlich nicht widerspiegeln kann.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	self.aivar[AIV_Partymember] = FALSE;

	B_RemoveNpc	(Wassersnapper_Joe_01);
	B_RemoveNpc	(Wassersnapper_Joe_02);
	B_RemoveNpc	(Wassersnapper_Joe_03);

	hero.attribute[ATR_MANA_MAX] += 20;
	hero.attribute[ATR_MANA] += 20;

	B_GivePlayerXP	(2000);

	B_SetTopicStatus	(TOPIC_MOD_JOE_WASSERSNAPPER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Joe_Pickpocket (C_INFO)
{
	npc		= Mod_588_WNOV_Joe_NW;
	nr		= 1;
	condition	= Info_Mod_Joe_Pickpocket_Condition;
	information	= Info_Mod_Joe_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Joe_Pickpocket_Condition()
{
	C_Beklauen	(47, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_Joe_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Joe_Pickpocket);

	Info_AddChoice	(Info_Mod_Joe_Pickpocket, DIALOG_BACK, Info_Mod_Joe_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Joe_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Joe_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Joe_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Joe_Pickpocket);
};

FUNC VOID Info_Mod_Joe_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Joe_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Joe_Pickpocket);

		Info_AddChoice	(Info_Mod_Joe_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Joe_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Joe_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Joe_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Joe_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Joe_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Joe_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Joe_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Joe_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Joe_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Joe_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Joe_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Joe_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Joe_EXIT (C_INFO)
{
	npc		= Mod_588_WNOV_Joe_NW;
	nr		= 1;
	condition	= Info_Mod_Joe_EXIT_Condition;
	information	= Info_Mod_Joe_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Joe_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Joe_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};