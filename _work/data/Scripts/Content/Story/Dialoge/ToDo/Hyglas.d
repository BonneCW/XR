INSTANCE Info_Mod_Hyglas_Hi (C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_Hi_Condition;
	information	= Info_Mod_Hyglas_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hyglas_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hyglas_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Hyglas_Hi_14_00"); //Ah, ein neues Gesicht. Ich bin Hyglas und lehre allen hier im Kloster den Umgang mit Runen.
};

INSTANCE Info_Mod_Hyglas_FeuerGegenEis (C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_FeuerGegenEis_Condition;
	information	= Info_Mod_Hyglas_FeuerGegenEis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hyglas_FeuerGegenEis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_FeuerGegenEis))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hyglas_FeuerGegenEis_Info()
{
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis_14_00"); //Dieser Teleportzauber wird uns beide direkt vor Orlans Taverne bef�rdern, wo die anderen auf uns warten.
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis_14_01"); //Dort besprechen wir das weitere Vorgehen im Detail.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_924_RIT_Sergio_NW, "ATSEE");
	B_SetAivar	(Mod_924_RIT_Sergio_NW, AIV_INVINCIBLE, TRUE);

	Wld_InsertNpc	(IceGolem_FeuerGegenEis_01,	"NW_BIGFARM_LAKE_07");

	B_KillNpc	(IceGolem_FeuerGegenEis_01);

	Wld_InsertNpc	(Mod_7786_NOV_Novize_NW, "TAVERNE");

	B_KillNpc	(Mod_7786_NOV_Novize_NW);

	Wld_InsertNpc	(IceGolem_FeuerGegenEis_05,	"WP_EISHOEHLE_05");
	Wld_InsertNpc	(IceGolem_FeuerGegenEis_06,	"WP_EISHOEHLE_06");

	Wld_InsertNpc	(IceGolem_FeuerGegenEis_07,	"WP_EISHOEHLE_04");

	Wld_InsertNpc	(IceGolem_FeuerGegenEis_08,	"NW_BIGFARM_ALLEE_07");
	Wld_InsertNpc	(IceGolem_FeuerGegenEis_09,	"NW_BIGFARM_FARM4_PATH_05");

	Wld_InsertNpc	(Eislaeufer_FGE,	"FP_SPAWN_STONEGUARDIAN_STEINKREIS_05");
	Wld_InsertNpc	(Eislaeufer_FGE,	"NW_BIGFARM_FARM4_PATH_07");
	Wld_InsertNpc	(Eislaeufer_FGE,	"NW_BIGFARM_CROSS");
	Wld_InsertNpc	(Eislaeufer_FGE,	"NW_BIGFARM_CROSS");
	Wld_InsertNpc	(Eislaeufer_FGE,	"WP_SLD_DRACHENJAGD_01");
	Wld_InsertNpc	(Eislaeufer_FGE,	"FP_ROAM_NW_BIGFARM_LAKE_MONSTER_05_03");
	Wld_InsertNpc	(Eislaeufer_FGE,	"FP_ROAM_NW_BIGFARM_LAKE_MONSTER_05_03");
	Wld_InsertNpc	(Eislaeufer_FGE,	"NW_LAKE__WATER_02");
	Wld_InsertNpc	(Eislaeufer_FGE,	"NW_LAKE__WATER_02");
};

INSTANCE Info_Mod_Hyglas_FeuerGegenEis2 (C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_FeuerGegenEis2_Condition;
	information	= Info_Mod_Hyglas_FeuerGegenEis2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hyglas_FeuerGegenEis2_Condition()
{
	if (Mod_FM_FeuerEis == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hyglas_FeuerGegenEis2_Info()
{
	var c_npc Hyglas; Hyglas = Hlp_GetNpc(Mod_918_KDF_Hyglas_NW);
	var c_npc Orlan; Orlan = Hlp_GetNpc(Mod_776_NONE_Orlan_NW);

	TRIA_Invite(Orlan);
	TRIA_Start();

	TRIA_Next(Hyglas);

	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis2_14_00"); //Da sind wir ... aber, wo sind die anderen?

	TRIA_Next(Orlan);

	AI_TurnToNpc	(Orlan, Hyglas);

	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis2_05_01"); //(aufgeregt) Vor kurzem kam eine Gruppe dieser Eiswesen den Weg hoch.

	AI_TurnToNpc	(Hyglas, Orlan);

	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis2_05_02"); //Eure Jungs aus dem Kloster haben sofort den Kampf aufgenommen und sie zur�ckgedr�ngt.
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis2_05_03"); //Es kamen jedoch unaufh�rlich neue Monster nach, sodass sie sich mittlerweile bis zum See nach unten gek�mpft haben.
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis2_05_04"); //Ich bef�rchte aber, ohne weitere Unterst�tzung sieht es schlecht f�r sie aus, bei den ganzen Viechern.

	TRIA_Next(Hyglas);

	AI_TurnToNpc	(Hyglas, hero);

	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis2_14_05"); //Hast du das geh�rt Novize? Es bleibt keine Zeit zu verlieren. Wir m�ssen den anderen sofort zu Hilfe eilen.

	TRIA_Finish();

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_FM_FEUEREIS, "Da steh ich also mit Hyglas. Von Sekobs Hof aus str�men durch ein mysteri�ses Portal immer mehr Eiswesen nach Khorinis und unsere Jungs sind am See mit ihnen in K�mpfe verwickelt. Es bleibt keine Zeit zu verlieren ihnen zu Hilfe zu eilen.");

	self.aivar[AIV_Partymember] = TRUE;

	B_StartOtherRoutine	(self, "ZUSERGIO");
	B_StartOtherRoutine	(Orlan, "START");
};

INSTANCE Info_Mod_Hyglas_FeuerGegenEis3 (C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_FeuerGegenEis3_Condition;
	information	= Info_Mod_Hyglas_FeuerGegenEis3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hyglas_FeuerGegenEis3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sergio_FeuerGegenEis))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hyglas_FeuerGegenEis3_Info()
{
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis3_14_00"); //Mach dir keine Vorw�rfe ... du hast tapfer gek�mpft und dein M�glichstes gegeben.
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis3_14_01"); //Au�erdem ist jetzt nicht der Rechte Zeitpunkt f�r Selbstvorw�rfe. Kurier deine Wunden und pass auf, dass keine dieser Wesen in die Umgebung entkommen.
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis3_14_02"); //Ich werde derweil mit dem Novizen zum Steinkreis gehen und versuchen das Portal zu verschlie�en. Innos sei mit dir.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ZUSEKOB");

	B_LogEntry	(TOPIC_MOD_FM_FEUEREIS, "Keine Zeit zu rasten. Wir m�ssen weiter zum Portal auf Sekobs Hof, um es zu verschlie�en.");
};

INSTANCE Info_Mod_Hyglas_FeuerGegenEis4 (C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_FeuerGegenEis4_Condition;
	information	= Info_Mod_Hyglas_FeuerGegenEis4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hyglas_FeuerGegenEis4_Condition()
{
	if (Npc_GetDistToWP(self, "WP_STEINKREIS_05") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hyglas_FeuerGegenEis4_Info()
{
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis4_14_00"); //Beunruhigend ... das Portal ist mittlerweile sichtbar. Ich muss es mir n�her ansehen.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Hyglas_FeuerGegenEis5 (C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_FeuerGegenEis5_Condition;
	information	= Info_Mod_Hyglas_FeuerGegenEis5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hyglas_FeuerGegenEis5_Condition()
{
	if (Mod_FM_FeuerEis == 2)
	&& (Npc_IsDead(IceGolem_FeuerGegenEis_02))
	&& (Npc_IsDead(IceGolem_FeuerGegenEis_03))
	&& (Npc_IsDead(IceGolem_FeuerGegenEis_04))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hyglas_FeuerGegenEis5_Info()
{
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis5_14_00"); //Bei Innos, es scheint unaufh�rlich zu wachsen. Wenn wir es nicht schnell verschlie�en, wird bald ganz Khorinis ein Hort des Eises sein.
	AI_Output(hero, self, "Info_Mod_Hyglas_FeuerGegenEis5_15_01"); //Was ist zu tun?
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis5_14_02"); //Ich werde versuchen das magische Gef�ge des Portals mit einem Feuersturm zu destabilisieren.
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis5_14_03"); //Mit etwas Gl�ck, wird es dann in sich zusammenfallen ... hoffentlich.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Hyglas_FeuerGegenEis6 (C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_FeuerGegenEis6_Condition;
	information	= Info_Mod_Hyglas_FeuerGegenEis6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hyglas_FeuerGegenEis6_Condition()
{
	if (Mod_FM_FeuerEis == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hyglas_FeuerGegenEis6_Info()
{
	AI_Output(hero, self, "Info_Mod_Hyglas_FeuerGegenEis6_15_00"); //Verdammt, was ist geschehen.
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis6_14_01"); //Die ... die magische Entladung hat das Portal nicht verschlossen ... sondern es noch gest�rkt ... und scheinbar wurden wir dadurch auf die andere Seite gezogen.
	AI_Output(hero, self, "Info_Mod_Hyglas_FeuerGegenEis6_15_02"); //Und was sollen wir jetzt tun?
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis6_14_03"); //Wir m�ssen uns rasch hier umsehen. Vielleicht finden wir Anhaltspunkte �ber die Quelle des Portals.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "EISHOEHLE2");

	B_LogEntry	(TOPIC_MOD_FM_FEUEREIS, "Na toll! Anstatt das Portal zu versiegeln, sind wir jetzt in einer eiseigen H�hle auf der anderen Seite gelandet.");
};

INSTANCE Info_Mod_Hyglas_FeuerGegenEis7 (C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_FeuerGegenEis7_Condition;
	information	= Info_Mod_Hyglas_FeuerGegenEis7_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hyglas_FeuerGegenEis7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_FeuerGegenEis6))
	&& (Npc_GetDistToWP(hero, "WP_EISHOEHLE_04") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hyglas_FeuerGegenEis7_Info()
{
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis7_14_00"); //Da! Von diesem Konstrukt geht gro�e magische Energie aus. Zweifelsfrei wird dadurch das Portal gespeist.
	AI_Output(hero, self, "Info_Mod_Hyglas_FeuerGegenEis7_15_01"); //Dann m�ssen wir es also zerst�ren?
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis7_14_02"); //Ja ... Allerdings ...
	AI_Output(hero, self, "Info_Mod_Hyglas_FeuerGegenEis7_15_03"); //Allerdings was?
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis7_14_04"); //Allerdings w�rde dann das Portal in sich zusammenfallen und uns den R�ckweg versperren.
	AI_Output(hero, self, "Info_Mod_Hyglas_FeuerGegenEis7_15_05"); //Na toll! Dann k�nnen wir nichts machen?

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis7_14_06"); //(nachdenklich) Hmm, doch ...

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis7_14_07"); //(bestimmend zum Helden) Du wirst zur�ck durch das Portal nach Khorinis gehen ... und ich werde zur�ckbleiben und die H�hle mit einer gewaltigen Feuersbrunst zum Einsturz bringen.
	AI_Output(hero, self, "Info_Mod_Hyglas_FeuerGegenEis7_15_08"); //Aber ... das w�re dein sicheres Verderben.
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis7_14_09"); //Eine andere Wahl haben wir nicht, wenn wir Khorinis vor weiterem Unheil bewahren wollen.
	AI_Output(hero, self, "Info_Mod_Hyglas_FeuerGegenEis7_15_10"); //Also gut ... Es war eine Ehre an deiner Seite gek�mpft zu haben.
	AI_Output(self, hero, "Info_Mod_Hyglas_FeuerGegenEis7_14_11"); //Ebenso ... (dr�ngend) Und nun geh ... jede weitere Minute, die das Portal existiert, ist eine zuviel. Innos sei mit dir!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_551_KDF_Pyrokar_NW, "ATBETT");
	B_StartOtherRoutine	(Mod_552_KDF_Serpentes_NW, "ATBETT");
	B_StartOtherRoutine	(Mod_553_KDF_Ulthar_NW, "ATBETT");

	B_LogEntry	(TOPIC_MOD_FM_FEUEREIS, "Ich soll durch das Portal zur�ck nach Khorinis gehen, w�hrend Hyglas hier die Quelle der magischen Energie vernichten will.");
	
	Wld_SendTrigger("ENABLEICETEMPLETELEPORT");
};

INSTANCE Info_Mod_Hyglas_BackInKhorinis (C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_BackInKhorinis_Condition;
	information	= Info_Mod_Hyglas_BackInKhorinis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hyglas_BackInKhorinis_Condition()
{
	if (Mod_FM_Hyglas_Eisgebiet == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hyglas_BackInKhorinis_Info()
{
	AI_Output(self, hero, "Info_Mod_Hyglas_BackInKhorinis_14_00"); //Ahh, mein Retter.
	AI_Output(hero, self, "Info_Mod_Hyglas_BackInKhorinis_15_01"); //Du bist jetzt Prediger?
	AI_Output(self, hero, "Info_Mod_Hyglas_BackInKhorinis_14_02"); //Ja, ich will den Armen und Not leidenden das w�rmende Wort von Innos n�her bringen.
	AI_Output(self, hero, "Info_Mod_Hyglas_BackInKhorinis_14_03"); //Ich habe selbst viele Wochen Hunger und K�lte gelitten und sehe die vergangenen Ereignisse als eine Weisung von Innos.
	AI_Output(self, hero, "Info_Mod_Hyglas_BackInKhorinis_14_04"); //Mein Leben werde ich von nun an der Unterst�tzung und Speisung jener Menschen zu widmen, denen das Schicksal eben nicht so viele Privilegien und Reichtum geschenkt hat.
	AI_Output(self, hero, "Info_Mod_Hyglas_BackInKhorinis_14_05"); //Daher ben�tige ich diese Spruchrollen und Runen f�r den Kampf nicht mehr und gebe sie an dich weiter.

	B_ShowGivenThings	("Spruchrollen Feuersturm und Feuerregen und Runen Feuersturm und gro�er Feuerball erhalten");

	CreateInvItems	(hero, ItSc_Firerain, 1);
	CreateInvItems	(hero, ItSc_Pyrokinesis, 1);
	CreateInvItems	(hero, ItRu_Pyrokinesis, 1);
	CreateInvItems	(hero, ItRu_ChargeFireball, 1);

	AI_Output(self, hero, "Info_Mod_Hyglas_BackInKhorinis_14_06"); //Bei dir kann ich mir sicher sein, dass sie einem rechten Zweck dienen werden. Innos sei mit dir.

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Hyglas_Leichengase (C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_Leichengase_Condition;
	information	= Info_Mod_Hyglas_Leichengase_Info;
	permanent	= 0;
	important	= 0;
	description	= "Milten hat gesagt, du k�nntest mir bei einem Problem helfen.";
};

FUNC INT Info_Mod_Hyglas_Leichengase_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Leichengase))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Lobart_Leichengase2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Dragomir_Leichengase))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hyglas_Leichengase_Info()
{
	AI_Output(hero, self, "Info_Mod_Hyglas_Leichengase_15_00"); //Milten hat gesagt, du k�nntest mir bei einem Problem helfen.
	AI_Output(self, hero, "Info_Mod_Hyglas_Leichengase_14_01"); //Achja? Worum geht�s denn?
	AI_Output(hero, self, "Info_Mod_Hyglas_Leichengase_15_02"); //Ich muss einen Troll dazu bringen, dieses Paket Kr�uter hier zu fressen.

	if (hero.guild == GIL_VLK)
	{
		B_GiveInvItems	(hero, self, ItMi_Sumpfkraeuter, 1);

		AI_Output(self, hero, "Info_Mod_Hyglas_Leichengase_14_03"); //Da kann ich dir tats�chlich helfen. Komm morgen wieder.

		Mod_Leichengase_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Hyglas_Leichengase_14_04"); //Da kann ich dir tats�chlich helfen, allerdings kostet das.
		AI_Output(hero, self, "Info_Mod_Hyglas_Leichengase_15_05"); //Wieviel?
		AI_Output(self, hero, "Info_Mod_Hyglas_Leichengase_14_06"); //500 Goldst�cke.
	};
};

INSTANCE Info_Mod_Hyglas_Leichengase2 (C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_Leichengase2_Condition;
	information	= Info_Mod_Hyglas_Leichengase2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na gut. (500 Gold)";
};

FUNC INT Info_Mod_Hyglas_Leichengase2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_Leichengase))
	&& (hero.guild != GIL_VLK)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hyglas_Leichengase2_Info()
{
	AI_Output(hero, self, "Info_Mod_Hyglas_Leichengase2_15_00"); //Na gut.

	Npc_RemoveInvItems	(hero, ItMi_Gold, 500);
	Npc_RemoveInvItems	(hero, ItMi_Sumpfkraeuter, 1);

	B_ShowGivenThings	("500 Gold und Beutel mit Sumpfkr�utern gegeben");

	AI_Output(self, hero, "Info_Mod_Hyglas_Leichengase2_14_01"); //Gut, komm morgen wieder.

	Mod_Leichengase_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Hyglas_Leichengase3 (C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_Leichengase3_Condition;
	information	= Info_Mod_Hyglas_Leichengase3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hyglas_Leichengase3_Condition()
{
	if (Wld_GetDay() <= Mod_Leichengase_Day)
	{
		return 0;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_Leichengase))
	&& (hero.guild == GIL_VLK)
	{
		return 1;
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_Leichengase2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hyglas_Leichengase3_Info()
{
	AI_Output(self, hero, "Info_Mod_Hyglas_Leichengase3_14_00"); //Hier. Wenn du jetzt bei Trollen ein Schaf beschw�rst, und sie es fressen, haben sie automatisch auch die Kr�uter gefressen.

	B_GiveInvItems	(self, hero, ItSc_SumKrautschaf, 1);

	AI_Output(self, hero, "Info_Mod_Hyglas_Leichengase3_14_01"); //Jetzt geh.

	Mod_Leichengase_Kraut = 3;

	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Ich habe eine spezielle Spruchrolle f�r den Troll. Jetzt sollte ich zur Trollschlucht im Minental gehen, um die Kr�uter zu den Trollen zu bringen.");

	B_GivePlayerXP	(150);
};

instance Info_Mod_Hyglas_Runen	(C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_Runen_Condition;
	information	= Info_Mod_Hyglas_Runen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Unterweise mich (Runen erschaffen)";
};

func int Info_Mod_Hyglas_Runen_Condition ()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_Hi))
	&& ((Mod_Gilde == 6)
	|| (Mod_Gilde == 7)
	|| (Mod_Gilde == 8))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Hyglas_BackInKhorinis))
	{
		return 1;
	};
};

func void Info_Mod_Hyglas_Runen_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(hero, self, "Info_Mod_Hyglas_Runen_15_00"); //Unterweise mich.
	
	Info_ClearChoices 	(Info_Mod_Hyglas_Runen);
	Info_AddChoice		(Info_Mod_Hyglas_Runen, DIALOG_BACK, Info_Mod_Hyglas_Runen_BACK);
	
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) >= 6)
	{
		if (PLAYER_TALENT_RUNES [SPL_MasterOfDisaster] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Hyglas_Runen, B_BuildLearnString (NAME_SPL_MasterOfDisaster, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MasterOfDisaster)) ,Info_Mod_Hyglas_Runen_MasterOfDisaster);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Hyglas_Runen, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,Info_Mod_Hyglas_Runen_Shrink);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Hyglas_Runen, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,Info_Mod_Hyglas_Runen_Firerain);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 5)
	{
		if (PLAYER_TALENT_RUNES [SPL_Pyrokinesis] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Hyglas_Runen, B_BuildLearnString (NAME_SPL_Pyrokinesis, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Pyrokinesis)), Info_Mod_Hyglas_Runen_Pyrokinesis);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Pyrokinesis_g1] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Hyglas_Runen, B_BuildLearnString ("Pyrokinese", B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Pyrokinesis_g1)), Info_Mod_Hyglas_Runen_Pyrokinesis_g1);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_FullHeal] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Hyglas_Runen, B_BuildLearnString (NAME_SPL_FullHeal, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_FullHeal)), Info_Mod_Hyglas_Runen_FullHeal);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 4)
	{
		if (PLAYER_TALENT_RUNES [SPL_ChargeFireball] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Hyglas_Runen, B_BuildLearnString (NAME_SPL_ChargeFireball, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_ChargeFireball)), Info_Mod_Hyglas_Runen_ChargeFireball);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_DestroyUndead] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Hyglas_Runen, B_BuildLearnString (NAME_SPL_DestroyUndead, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_DestroyUndead)), Info_Mod_Hyglas_Runen_DestroyUndead);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 3)
	{
		if (PLAYER_TALENT_RUNES [SPL_MediumHeal] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Hyglas_Runen, B_BuildLearnString (NAME_SPL_MediumHeal, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_MediumHeal)), Info_Mod_Hyglas_Runen_MediumHeal);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Firestorm] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Hyglas_Runen, B_BuildLearnString (NAME_SPL_Firestorm, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Firestorm)), Info_Mod_Hyglas_Runen_Firestorm);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 2)
	{
		if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Hyglas_Runen, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_InstantFireball)), Info_Mod_Hyglas_Runen_InstantFireball);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	{
		if (PLAYER_TALENT_RUNES [SPL_Light] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Hyglas_Runen, B_BuildLearnString (NAME_SPL_Light, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Light)), Info_Mod_Hyglas_Runen_Light);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_LightHeal] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Hyglas_Runen, B_BuildLearnString (NAME_SPL_LightHeal, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_LightHeal)), Info_Mod_Hyglas_Runen_LightHeal);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Hyglas_Runen, B_BuildLearnString (NAME_SPL_Firebolt, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Firebolt)), Info_Mod_Hyglas_Runen_Firebolt);
			abletolearn = (abletolearn +1);
		};
	};

	if (abletolearn < 1)
	{
		AI_Output (self, other, "Info_Mod_Hyglas_Runen_14_01"); //Es gibt nichts mehr, das ich dir beibringen k�nnte.
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_BACK()
{
	Info_ClearChoices 	(Info_Mod_Hyglas_Runen);
};

FUNC VOID Info_Mod_Hyglas_Runen_Light()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Light);

	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_Light) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_Light, 1);
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_SummonFireGolem()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonFireGolem);

	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_SumFireGol) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_SumFireGol, 1);
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_SummonWolf()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonWolf);

	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_SumWolf) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_SumWolf, 1);
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_SummonGoblinKrieger()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonGoblinKrieger);

	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_SumGobKrieger) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_SumGobKrieger, 1);
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_SummonDragon()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonDragon);
};

FUNC VOID Info_Mod_Hyglas_Runen_LightHeal()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_LightHeal);

	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_LightHeal) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_LightHeal, 1);
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_Firebolt()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Firebolt);

	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_Firebolt) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_Firebolt, 1);
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_InstantFireball()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_InstantFireball);
	
	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_InstantFireball) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_InstantFireball, 1);
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_DestroyUndead()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_DestroyUndead);

	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_HarmUndead) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_HarmUndead, 1);
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_Firestorm()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Firestorm);

	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_Firestorm) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_Firestorm, 1);
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_MediumHeal()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_MediumHeal);

	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_MediumHeal) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_MediumHeal, 1);
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_ChargeFireball()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_ChargeFireball);

	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_ChargeFireball) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_ChargeFireball, 1);
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_Pyrokinesis()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Pyrokinesis);

	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_Pyrokinesis) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_Pyrokinesis, 1);
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_Pyrokinesis_g1()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Pyrokinesis_g1);
};

FUNC VOID Info_Mod_Hyglas_Runen_MasterOfDisaster()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_MasterOfDisaster);
};

FUNC VOID Info_Mod_Hyglas_Runen_Shrink()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Shrink);

	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_Shrink) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_Shrink, 1);
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_FullHeal()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_FullHeal);

	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_FullHeal) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_FullHeal, 1);
	};
};

FUNC VOID Info_Mod_Hyglas_Runen_Firerain()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Firerain);

	if (Npc_HasItems(Mod_917_KDF_Gorax_NW, ItSc_Firerain) == 0)
	{
		CreateInvItems	(Mod_917_KDF_Gorax_NW, ItSc_Firerain, 1);
	};
};

INSTANCE Info_Mod_Hyglas_Pickpocket (C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_Pickpocket_Condition;
	information	= Info_Mod_Hyglas_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Hyglas_Pickpocket_Condition()
{
	C_Beklauen	(98, ItMi_Gold, 37);
};

FUNC VOID Info_Mod_Hyglas_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hyglas_Pickpocket);

	Info_AddChoice	(Info_Mod_Hyglas_Pickpocket, DIALOG_BACK, Info_Mod_Hyglas_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hyglas_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hyglas_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hyglas_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hyglas_Pickpocket);
};

FUNC VOID Info_Mod_Hyglas_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Hyglas_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Hyglas_Pickpocket);

		Info_AddChoice	(Info_Mod_Hyglas_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Hyglas_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Hyglas_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Hyglas_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Hyglas_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Hyglas_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Hyglas_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Hyglas_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Hyglas_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Hyglas_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Hyglas_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Hyglas_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Hyglas_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Hyglas_EXIT (C_INFO)
{
	npc		= Mod_918_KDF_Hyglas_NW;
	nr		= 1;
	condition	= Info_Mod_Hyglas_EXIT_Condition;
	information	= Info_Mod_Hyglas_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hyglas_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hyglas_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};