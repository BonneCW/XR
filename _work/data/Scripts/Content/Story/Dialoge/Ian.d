INSTANCE Info_Mod_Ian_Hi (C_INFO)
{
	npc		= Mod_1902_STT_Ian_MT;
	nr		= 1;
	condition	= Info_Mod_Ian_Hi_Condition;
	information	= Info_Mod_Ian_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ian_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ian_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Ian_Hi_13_00"); //Du lebst noch? Dass ich dich wiedersehen würde, hätte ich nicht gedacht.
	AI_Output(hero, self, "Info_Mod_Ian_Hi_15_01"); //Gleichfalls. Du hast den Einsturz der Mine also überlebt?
	AI_Output(self, hero, "Info_Mod_Ian_Hi_13_02"); //(lacht freudlos) Es gab keinen Einsturz.
};

INSTANCE Info_Mod_Ian_AlteMine (C_INFO)
{
	npc		= Mod_1902_STT_Ian_MT;
	nr		= 1;
	condition	= Info_Mod_Ian_AlteMine_Condition;
	information	= Info_Mod_Ian_AlteMine_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist in der Alten Mine passiert?";
};

FUNC INT Info_Mod_Ian_AlteMine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ian_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ian_AlteMine_Info()
{
	AI_Output(hero, self, "Info_Mod_Ian_AlteMine_15_00"); //Was ist in der Alten Mine passiert?
	AI_Output(self, hero, "Info_Mod_Ian_AlteMine_13_01"); //Wir wurden überfallen. Und zwar nicht von den Bastarden aus dem Neuen Lager, sondern von schwarzen Kriegern und Magiern.

	var C_ITEM arm;
	
	arm = Npc_GetEquippedArmor(hero);

	if (Hlp_IsItem(arm, ItAr_DMB_S) == TRUE)
	|| (Hlp_IsItem(arm, ItAr_XARDAS) == TRUE)
	|| (Hlp_IsItem(arm, ItAr_RAVEN_ADDON) == TRUE)
	|| (Hlp_IsItem(arm, ItAr_SMK_L) == TRUE)
	|| (Hlp_IsItem(arm, Schwarzmagierrobe) == TRUE)
	|| (Hlp_IsItem(arm, ItAr_NOV_DMB_01) == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Ian_AlteMine_13_02"); //(misstrauisch) Manche von ihnen trugen genau so eine Rüstung, wie du es tust.
	};

	AI_Output(hero, self, "Info_Mod_Ian_AlteMine_15_03"); //Die Beliaranhänger haben die Mine übernommen?
	AI_Output(self, hero, "Info_Mod_Ian_AlteMine_13_04"); //Kann man wohl sagen. Unsere Leute wurden wie die Wanzen niedergemetzelt.
};

INSTANCE Info_Mod_Ian_AlteMine2 (C_INFO)
{
	npc		= Mod_1902_STT_Ian_MT;
	nr		= 1;
	condition	= Info_Mod_Ian_AlteMine2_Condition;
	information	= Info_Mod_Ian_AlteMine2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie konntest du überleben?";
};

FUNC INT Info_Mod_Ian_AlteMine2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ian_AlteMine))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ian_AlteMine2_Info()
{
	AI_Output(hero, self, "Info_Mod_Ian_AlteMine2_15_00"); //Wie konntest du überleben?
	AI_Output(self, hero, "Info_Mod_Ian_AlteMine2_13_01"); //Ich befand mich gerade unter der Plattform zum Eingang der Mine, als ich von oben Schreie und Waffengeklirr hörte.
	AI_Output(self, hero, "Info_Mod_Ian_AlteMine2_13_02"); //Im nächsten Moment schon fiel mir Drake vor die Füße, von einem Zauber über die Brüstung geschleudert.
	AI_Output(self, hero, "Info_Mod_Ian_AlteMine2_13_03"); //Ich habe Alarm geschlagen, die Beine in die Hände genommen und mir ein sicheres Versteck gesucht.
	AI_Output(self, hero, "Info_Mod_Ian_AlteMine2_13_04"); //Aber da ging meine Odyssee erst los. Erst musste ich mit anhören, wie einer nach dem hingeschlachtet wurde, und dann durfte ich mich tagelang kaum rühren.
	AI_Output(self, hero, "Info_Mod_Ian_AlteMine2_13_05"); //Überlebt habe ich nur, weil ich Wasser von der Minenwand lecken konnte. Mir ist es in meinem ganzen Leben noch nicht so dreckig gegangen.
	AI_Output(self, hero, "Info_Mod_Ian_AlteMine2_13_06"); //Natürlich habe ich Pläne zur Flucht geschmiedet. Und dann habe ich eine Wachablösung am Tor genutzt, um mich aus dem Staub zu machen.
};

INSTANCE Info_Mod_Ian_AlteMine3 (C_INFO)
{
	npc		= Mod_1902_STT_Ian_MT;
	nr		= 1;
	condition	= Info_Mod_Ian_AlteMine3_Condition;
	information	= Info_Mod_Ian_AlteMine3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hättest die Mine verteidigen müssen!";
};

FUNC INT Info_Mod_Ian_AlteMine3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ian_AlteMine2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ian_AlteMine3_Info()
{
	AI_Output(hero, self, "Info_Mod_Ian_AlteMine3_15_00"); //Du hättest die Mine verteidigen müssen!
	AI_Output(self, hero, "Info_Mod_Ian_AlteMine3_13_01"); //(verächtlich) Tu nicht so, als würdest du etwas davon verstehen. Mit den paar verstreuten Gardisten und Templern hätte ich keine koordinierte Gegenwehr leisten können.
	AI_Output(self, hero, "Info_Mod_Ian_AlteMine3_13_02"); //Wir waren dem Untergang geweiht.
	AI_Output(hero, self, "Info_Mod_Ian_AlteMine3_15_03"); //Gibt es denn noch andere Überlebende?
	AI_Output(self, hero, "Info_Mod_Ian_AlteMine3_13_04"); //Nicht dass ich wüsste.
};

INSTANCE Info_Mod_Ian_AlteMine4 (C_INFO)
{
	npc		= Mod_1902_STT_Ian_MT;
	nr		= 1;
	condition	= Info_Mod_Ian_AlteMine4_Condition;
	information	= Info_Mod_Ian_AlteMine4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich sehe hier gar keinen Trupp, der unterwegs ist, die Mine zurückzuerobern.";
};

FUNC INT Info_Mod_Ian_AlteMine4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ian_AlteMine2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ian_AlteMine4_Info()
{
	AI_Output(hero, self, "Info_Mod_Ian_AlteMine4_15_00"); //Ich sehe hier gar keinen Trupp, der unterwegs ist, die Mine zurückzuerobern.
	AI_Output(self, hero, "Info_Mod_Ian_AlteMine4_13_01"); //Thorus hält die Mine momentan für verzichtbar. Ohne seine Unterstützung werde ich nicht losziehen.
};

INSTANCE Info_Mod_Ian_SLDSpy (C_INFO)
{
	npc		= Mod_1902_STT_Ian_MT;
	nr		= 1;
	condition	= Info_Mod_Ian_SLDSpy_Condition;
	information	= Info_Mod_Ian_SLDSpy_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was gibt es Neues zu berichten?";
};

FUNC INT Info_Mod_Ian_SLDSpy_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ian_Hi))
	&& (Mod_SLD_STT_Mordrag == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Lee_GotoSylvio))
	&& (Mod_SLD_Spy == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ian_SLDSpy_Info()
{
	AI_Output(hero, self, "Info_Mod_Ian_SLDSpy_15_00"); //Was gibt es Neues zu berichten?
	AI_Output(self, hero, "Info_Mod_Ian_SLDSpy_13_01"); //Hey, ich wusste gar nicht, dass du jetzt wieder Schatten bei uns bist.

	Info_ClearChoices	(Info_Mod_Ian_SLDSpy);

	Info_AddChoice	(Info_Mod_Ian_SLDSpy, "Bin ich auch nicht. Ich spioniere hier für das Neue Lager.", Info_Mod_Ian_SLDSpy_B);
	Info_AddChoice	(Info_Mod_Ian_SLDSpy, "Ich war einige Zeit bei den Sumpfspinnern um zu spionieren.", Info_Mod_Ian_SLDSpy_A);
};

FUNC VOID Info_Mod_Ian_SLDSpy_C()
{
	AI_Output(self, hero, "Info_Mod_Ian_SLDSpy_C_13_00"); //Naja, wo waren wir stehen geblieben? Achja, was gibt’s so Neues. Ich hörte, dass Bullit angeblich von einem Typen aus dem Neuen Lager kalt gemacht worden sein soll.
	AI_Output(self, hero, "Info_Mod_Ian_SLDSpy_C_13_01"); //Thorus soll ziemlich außer sich, wegen der Sache sein. Na, wenn das mal nicht nach Rache riecht.

	B_LogEntry	(TOPIC_MOD_SLD_SPY, "Ian hat mir erzählt, dass der Gardist Bullit von jemandem aus dem Neuen Lager ermordet worden sein soll. Thorus könnte eine Racheaktion in Erwägung ziehen.");

	Info_ClearChoices	(Info_Mod_Ian_SLDSpy);
};

FUNC VOID Info_Mod_Ian_SLDSpy_B()
{
	AI_Output(hero, self, "Info_Mod_Ian_SLDSpy_B_15_00"); //Bin ich auch nicht. Ich spioniere hier für das Neue Lager.
	AI_Output(self, hero, "Info_Mod_Ian_SLDSpy_B_13_01"); //(lacht) Du Scherzbold. Du bist in Ordnung.

	Info_Mod_Ian_SLDSpy_C();
};

FUNC VOID Info_Mod_Ian_SLDSpy_A()
{
	AI_Output(hero, self, "Info_Mod_Ian_SLDSpy_A_15_00"); //Ich war einige Zeit bei den Sumpfspinnern um zu spionieren. Hier, nimm einen Stängel.

	B_ShowGivenThings	("Stängel Sumpfkraut gegeben");

	CreateInvItems	(self, ItMi_Joint, 1);

	B_UseItem	(self, ItMi_Joint);

	AI_Output(self, hero, "Info_Mod_Ian_SLDSpy_A_13_01"); //Ahh, Sumpfkraut Du bist ok.

	Info_Mod_Ian_SLDSpy_C();
};

INSTANCE Info_Mod_Ian_CutterBad (C_INFO)
{
	npc		= Mod_1902_STT_Ian_MT;
	nr		= 1;
	condition	= Info_Mod_Ian_CutterBad_Condition;
	information	= Info_Mod_Ian_CutterBad_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, da ist mir was eingefallen, als du von dem Mord an Bullit erzählt hast.";
};

FUNC INT Info_Mod_Ian_CutterBad_Condition()
{
	if (Mod_SLD_Spy == 5)
	&& (Mob_HasItems("CUTTERSTRUHE", ItMw_BloodySword) == 1)
	&& (Mob_HasItems("CUTTERSTRUHE", ItWr_SentenzaForCutter) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ian_CutterBad_Info()
{
	AI_Output(hero, self, "Info_Mod_Ian_CutterBad_15_00"); //Hey, da ist mir was eingefallen, als du von dem Mord an Bullit erzählt hast.
	AI_Output(self, hero, "Info_Mod_Ian_CutterBad_13_01"); //Ja?
	AI_Output(hero, self, "Info_Mod_Ian_CutterBad_15_02"); //Ich habe Cutter nachts mit einem ganzen Haufen von Bullits Krempel durch das Lager gehen sehen.
	AI_Output(self, hero, "Info_Mod_Ian_CutterBad_13_03"); //Das ist ja interessant. (zu sich selbst) Wird bestimmt einige der Gardisten interessieren.

	Mod_SLD_Spy = 6;

	B_LogEntry	(TOPIC_MOD_SLD_SPY, "So, das wäre erledigt. Jetzt sollten die Gardisten bald in Cutter’s Truhe schauen.");
};

INSTANCE Info_Mod_Ian_Woher (C_INFO)
{
	npc		= Mod_1902_STT_Ian_MT;
	nr		= 1;
	condition	= Info_Mod_Ian_Woher_Condition;
	information	= Info_Mod_Ian_Woher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wieso hast du dich dem alten Lager angeschlossen?";
};

FUNC INT Info_Mod_Ian_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ian_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ian_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Ian_Woher_15_00"); //Wieso hast du dich dem alten Lager angeschlossen?
	AI_Output(self, hero, "Info_Mod_Ian_Woher_13_01"); //Früher lebte ich in Varant. Als der König Varant besetzt hat und dort seine Männer eingesetzt hat, hab ich den Statthalter angegriffen.
	AI_Output(self, hero, "Info_Mod_Ian_Woher_13_02"); //Dafür haben sie mich natürlich in die Kolonie geworfen. Ich bin dann ins alte Lager und hab dort als Buddler gearbeitet, aber die Erzbarone haben bald gemerkt, dass ich zu mehr Tauge und mich als Aufseher der alten Mine eingesetzt.
};

INSTANCE Info_Mod_Ian_PruefungDesVertrauens (C_INFO)
{
	npc		= Mod_1902_STT_Ian_MT;
	nr		= 1;
	condition	= Info_Mod_Ian_PruefungDesVertrauens_Condition;
	information	= Info_Mod_Ian_PruefungDesVertrauens_Info;
	permanent	= 1;
	important	= 0;
	description	= "Was war deine Prüfung des Vertrauens?";
};

FUNC INT Info_Mod_Ian_PruefungDesVertrauens_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ian_Woher))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ian_PruefungDesVertrauens_Info()
{
	AI_Output(hero, self, "Info_Mod_Ian_PruefungDesVertrauens_15_00"); //Was war deine Prüfung des Vertrauens?
	AI_Output(self, hero, "Info_Mod_Ian_PruefungDesVertrauens_13_01"); //Ich musste einen Ork fangen, als Sklaven für die Mine. War nicht gerade leicht.
};

INSTANCE Info_Mod_Ian_Mine (C_INFO)
{
	npc		= Mod_1902_STT_Ian_MT;
	nr		= 1;
	condition	= Info_Mod_Ian_Mine_Condition;
	information	= Info_Mod_Ian_Mine_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wieso bist du eigentlich nicht mehr in der Mine?";
};

FUNC INT Info_Mod_Ian_Mine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ian_Woher))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ian_Mine_Info()
{
	AI_Output(hero, self, "Info_Mod_Ian_Mine_15_00"); //Wieso bist du eigentlich nicht mehr in der Mine?
	AI_Output(self, hero, "Info_Mod_Ian_Mine_13_01"); //Nachdem Xardas mit seinen Dämonen die Mine überfallen hatte wurde ich, wie fast alle, festgenommen.
	AI_Output(self, hero, "Info_Mod_Ian_Mine_13_02"); //Doch irgendwann hab ich es geschafft zu fliehen und habe Thorus, der zu dem Zeitpunkt Erzbaron war, alles berichtet.
};

INSTANCE Info_Mod_Ian_Pickpocket (C_INFO)
{
	npc		= Mod_1902_STT_Ian_MT;
	nr		= 1;
	condition	= Info_Mod_Ian_Pickpocket_Condition;
	information	= Info_Mod_Ian_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Ian_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Nugget, 13);
};

FUNC VOID Info_Mod_Ian_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ian_Pickpocket);

	Info_AddChoice	(Info_Mod_Ian_Pickpocket, DIALOG_BACK, Info_Mod_Ian_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ian_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ian_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ian_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ian_Pickpocket);
};

FUNC VOID Info_Mod_Ian_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Ian_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Ian_Pickpocket);

		Info_AddChoice	(Info_Mod_Ian_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Ian_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Ian_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Ian_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Ian_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Ian_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Ian_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Ian_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Ian_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Ian_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Ian_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Ian_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Ian_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Ian_EXIT (C_INFO)
{
	npc		= Mod_1902_STT_Ian_MT;
	nr		= 1;
	condition	= Info_Mod_Ian_EXIT_Condition;
	information	= Info_Mod_Ian_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ian_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ian_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};