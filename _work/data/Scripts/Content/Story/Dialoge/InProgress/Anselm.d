INSTANCE Info_Mod_Anselm_Hi (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Hi_Condition;
	information	= Info_Mod_Anselm_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Anselm_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anselm_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Anselm_Hi_16_00"); //Ich bin der Stadthalter von Khorata!
	AI_Output(hero, self, "Info_Mod_Anselm_Hi_15_01"); //Der Statthalter? Wer ist denn dein Vorgesetzter?
	AI_Output(self, hero, "Info_Mod_Anselm_Hi_16_02"); //Nein, das verstehst du falsch. Ich bin der Stadthalter. Ich halte die Stadt in Schuss, aber ich diene niemandem.
	AI_Output(self, hero, "Info_Mod_Anselm_Hi_16_03"); //Aber was für eine glückliche Fügung, dass mir das Schicksal dich beschert hat!
	AI_Output(self, hero, "Info_Mod_Anselm_Hi_16_04"); //Ich habe doch glatt gerade eben die Idee gehabt, Khorata und Umgebung vermessen zu lassen, damit ich endlich weiß, wie groß mein Reich ist.
};

INSTANCE Info_Mod_Anselm_Landvermessung (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Landvermessung_Condition;
	information	= Info_Mod_Anselm_Landvermessung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du benötigst meine Hilfe?";
};

FUNC INT Info_Mod_Anselm_Landvermessung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Landvermessung_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Landvermessung_15_00"); //Du benötigst meine Hilfe?
	AI_Output(self, hero, "Info_Mod_Anselm_Landvermessung_16_01"); //Genau richtig! Ich scheine ja einen richtigen Schnelldenker erwischt zu haben!
	AI_Output(self, hero, "Info_Mod_Anselm_Landvermessung_16_02"); //Als Erstes gehst du also zu Vincent, das ist der Jäger vor der Stadt.
	AI_Output(self, hero, "Info_Mod_Anselm_Landvermessung_16_03"); //Er jagt überall, also wird er auch wissen, wie groß das Umland von Khorata ist.
	AI_Output(self, hero, "Info_Mod_Anselm_Landvermessung_16_04"); //Wenn du das erledigt hast, brauchen wir nur noch die Fläche von Khorata in Erfahrung zu bringen. Brillant!

	Log_CreateTopic	(TOPIC_MOD_KHORATA_LANDVERMESSUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_LANDVERMESSUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_LANDVERMESSUNG, "Anselm, der ausdrücklich Stadthalter von Khorata genannt werden möchte, will Khorata und Umland vermessen lassen. Dazu soll ich zu Vincent, einem Jäger außerhalb der Stadt, gehen und ihn um eine Schätzung bitten.");
};

INSTANCE Info_Mod_Anselm_LandvermessungVincent (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_LandvermessungVincent_Condition;
	information	= Info_Mod_Anselm_LandvermessungVincent_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Neuigkeiten.";
};

FUNC INT Info_Mod_Anselm_LandvermessungVincent_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vincent_Landvermessung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_LandvermessungVincent_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_LandvermessungVincent_15_00"); //Ich habe Neuigkeiten. Das Umland von Khorata hat eine Fläche von fünf Quadratmeilen. Sagt Vincent.
	AI_Output(self, hero, "Info_Mod_Anselm_LandvermessungVincent_16_01"); //Perfekt! Sogar noch mehr, als ich mir erhofft habe.
	AI_Output(self, hero, "Info_Mod_Anselm_LandvermessungVincent_16_02"); //Nun fehlt uns noch die Fläche der Stadt. Da fragst du am besten Hubert.
	AI_Output(self, hero, "Info_Mod_Anselm_LandvermessungVincent_16_03"); //Der läuft berufsbedingt viel in Khorata herum und kennt sich aus wie kein zweiter.

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_KHORATA_LANDVERMESSUNG, "Nun soll ich noch einen gewissen Hubert nach der Fläche Khoratas fragen ...");

	B_StartOtherRoutine	(Mod_7380_OUT_Hubert_REL, "STREUNER");
};

INSTANCE Info_Mod_Anselm_LandvermessungHubert (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_LandvermessungHubert_Condition;
	information	= Info_Mod_Anselm_LandvermessungHubert_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe mit Hubert gesprochen.";
};

FUNC INT Info_Mod_Anselm_LandvermessungHubert_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hubert_LandvermessungAlk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_LandvermessungHubert_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_LandvermessungHubert_15_00"); //Ich habe mit Hubert gesprochen.
	AI_Output(self, hero, "Info_Mod_Anselm_LandvermessungHubert_16_01"); //Was sagt er?
	AI_Output(hero, self, "Info_Mod_Anselm_LandvermessungHubert_15_02"); //Khorata sei so groß wie sieben Stoppelfelder.
	AI_Output(self, hero, "Info_Mod_Anselm_LandvermessungHubert_16_03"); //Ja? Wirklich? Das hätte ich nämlich auch geschätzt.
	AI_Output(self, hero, "Info_Mod_Anselm_LandvermessungHubert_16_04"); //Das hast du ganz toll gemacht. (pathetisch) Ich stehe tief in deiner Schuld. Ganz Khorata wird dir auf ewig dankbar sein.

	B_GivePlayerXP	(150);

	B_LogEntry	(TOPIC_MOD_KHORATA_LANDVERMESSUNG, "Jetzt habe ich also diesen komischen Auftrag beendet. Den Göttern sei Dank!");
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_LANDVERMESSUNG, LOG_SUCCESS);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;
};

INSTANCE Info_Mod_Anselm_LandvermessungVerarsche (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_LandvermessungVerarsche_Condition;
	information	= Info_Mod_Anselm_LandvermessungVerarsche_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sag mal ...";
};

FUNC INT Info_Mod_Anselm_LandvermessungVerarsche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_LandvermessungHubert))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_LandvermessungVerarsche_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_LandvermessungVerarsche_15_00"); //Sag mal ...
	AI_Output(self, hero, "Info_Mod_Anselm_LandvermessungVerarsche_16_01"); //Was gibt es denn noch?
	AI_Output(hero, self, "Info_Mod_Anselm_LandvermessungVerarsche_15_02"); //Kann es vielleicht sein, dass du mich verarschst?
	AI_Output(self, hero, "Info_Mod_Anselm_LandvermessungVerarsche_16_03"); //(entrüstet) Ich?!
	AI_Output(hero, self, "Info_Mod_Anselm_LandvermessungVerarsche_15_04"); //Genau.
	AI_Output(self, hero, "Info_Mod_Anselm_LandvermessungVerarsche_16_05"); //Nichts steht mir ferner!
	AI_Output(hero, self, "Info_Mod_Anselm_LandvermessungVerarsche_15_06"); //Der Jäger lacht mich aus, ich soll einen Alkoholiker befragen und du bist mit jedem Schwachsinn als Antwort zufrieden.
	AI_Output(self, hero, "Info_Mod_Anselm_LandvermessungVerarsche_16_07"); //Hey! So darfst du das nicht sehen!

	Info_ClearChoices	(Info_Mod_Anselm_LandvermessungVerarsche);

	Info_AddChoice	(Info_Mod_Anselm_LandvermessungVerarsche, "Na gut ...", Info_Mod_Anselm_LandvermessungVerarsche_B);
	Info_AddChoice	(Info_Mod_Anselm_LandvermessungVerarsche, "Ich glaube, es ist Zeit für eine Tracht Prügel (...)", Info_Mod_Anselm_LandvermessungVerarsche_A);
};

FUNC VOID Info_Mod_Anselm_LandvermessungVerarsche_B()
{
	AI_Output(hero, self, "Info_Mod_Anselm_LandvermessungVerarsche_B_15_00"); //Na gut ...

	Info_ClearChoices	(Info_Mod_Anselm_LandvermessungVerarsche);
};

FUNC VOID Info_Mod_Anselm_LandvermessungVerarsche_A()
{
	AI_Output(hero, self, "Info_Mod_Anselm_LandvermessungVerarsche_A_15_00"); //Ich glaube, es ist Zeit für eine Tracht Prügel, meinst du nicht auch?
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Anselm_LandvermessungVerarsche);

	AI_StopProcessInfos	(hero);

	AI_Wait	(self, 3);

	self.flags = 0;

	B_Attack	(self, hero, AR_None, 2);
};

INSTANCE Info_Mod_Anselm_Ornament (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Ornament_Condition;
	information	= Info_Mod_Anselm_Ornament_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du etwas über ein Ornamentstück?";
};

FUNC INT Info_Mod_Anselm_Ornament_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Larius_Ornament))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Ornament_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Ornament_15_00"); //Weißt du etwas über ein Ornamentstück?
	AI_Output(self, hero, "Info_Mod_Anselm_Ornament_16_01"); //(verdutzt) Über ein was? Meinst du was Altes?
	AI_Output(hero, self, "Info_Mod_Anselm_Ornament_15_02"); //Es ist das Bruchstück eines Ringes, welches der Gründer der Stadt bei sich gehabt haben müsste.
	AI_Output(self, hero, "Info_Mod_Anselm_Ornament_16_03"); //Ah, jetzt weiß ich, was du meinst: Die Sage von der Entstehung Khoratas. Sprich doch nicht so geschwollen zu mir!
	AI_Output(hero, self, "Info_Mod_Anselm_Ornament_15_04"); //Kann ich das Bruchstück haben? Es ist wichtig.
	AI_Output(self, hero, "Info_Mod_Anselm_Ornament_16_05"); //Wofür brauchst du es denn?
	AI_Output(hero, self, "Info_Mod_Anselm_Ornament_15_06"); //Die Wassermagier haben ein Portal in die Heimatwelt des Gründers gefunden.
	AI_Output(hero, self, "Info_Mod_Anselm_Ornament_15_07"); //Es lässt sich jedoch nur mit einem Portalring öffnen, und ein Teil davon soll in Relendel zu finden sein.
	AI_Output(self, hero, "Info_Mod_Anselm_Ornament_16_08"); //Klingt ja wichtig, mein Junge. Leider habe ich dieses Bruchstück nicht selbst, aber ich könnte dir sagen, wo du es der Sage nach finden müsstest.
	AI_Output(hero, self, "Info_Mod_Anselm_Ornament_15_09"); //Wo denn?
	AI_Output(self, hero, "Info_Mod_Anselm_Ornament_16_10"); //Wenn du ein Bürger Khoratas wärst, würde ich es dir sofort erzählen, sonst kostet die Information 2000 Goldmünzen.

	B_LogEntry	(TOPIC_MOD_PORTAL, "Anselm sagt mir erst etwas über den Verbleib des Ornamentes, wenn ich Bürger Khoratas bin oder 2000 Goldmünzen gezahlt habe.");
};

INSTANCE Info_Mod_Anselm_Ornament2 (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Ornament2_Condition;
	information	= Info_Mod_Anselm_Ornament2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Über das Ornament sprechen ...";
};

FUNC INT Info_Mod_Anselm_Ornament2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Ornament))
	&& (Mod_Anselm_Ornament == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Ornament2_Info()
{
	Info_ClearChoices	(Info_Mod_Anselm_Ornament2);

	Info_AddChoice	(Info_Mod_Anselm_Ornament2, DIALOG_BACK, Info_Mod_Anselm_Ornament2_BACK);

	if (Mod_REL_Buerger == 1)
	{
		Info_AddChoice(Info_Mod_Anselm_Ornament2, "Ich bin ein Bürger Khoratas.", Info_Mod_Anselm_Ornament2_C);
	};
	if (Npc_HasItems(hero, ItMi_Gold) >= 2000)
	{
		Info_AddChoice(Info_Mod_Anselm_Ornament2, "2000 Gold ... hier.", Info_Mod_Anselm_Ornament2_B);
	};
	if (Npc_HasItems(hero, ItMi_Gold) >= 1000)
	&& (Mod_Verhandlungsgeschick > 0)
	{
		Info_AddChoice(Info_Mod_Anselm_Ornament2, "(Feilschen) 1000 Gold müssten doch auch reichen.", Info_Mod_Anselm_Ornament2_A);
	};
};

FUNC VOID Info_Mod_Anselm_Ornament2_D()
{
	AI_Output(self, hero, "Info_Mod_Anselm_Ornament2_D_16_00"); //Sehr gut ... Den Überlieferungen nach war ein Flüchtling aus Jharkendar Mitbegründer unserer Dynastie.
	AI_Output(self, hero, "Info_Mod_Anselm_Ornament2_D_16_01"); //Er hauste in einem Lager westlich von Khorata, das zu einer Siedlung heranwuchs, jedoch von einem Feuer vernichtet wurde.
	AI_Output(self, hero, "Info_Mod_Anselm_Ornament2_D_16_02"); //Vom Pass aus musst du dem Weg nach links folgen, dann kannst du die Ruine gar nicht verfehlen.
	AI_Output(self, hero, "Info_Mod_Anselm_Ornament2_D_16_03"); //Wenn der Flüchtling einen Teil des Portalrings mit sich führte, dann findest du ihn sicher dort.
	AI_Output(hero, self, "Info_Mod_Anselm_Ornament2_D_15_04"); //Ich mache mich sofort auf den Weg.

	B_LogEntry	(TOPIC_MOD_PORTAL, "Anselm hat mir gesagt, dass das Ornamentstück in der Ruine westlich von Khorata zu finden sein könnte. Vom Pass aus müsste ich dazu dem Weg nach links folgen ...");

	Wld_InsertItem	(ItMi_Ornament_Priester, "FP_ITEM_ORNAMENT_PRIESTER");

	Mod_Anselm_Ornament = 1;

	Info_ClearChoices	(Info_Mod_Anselm_Ornament2);
};

FUNC VOID Info_Mod_Anselm_Ornament2_BACK()
{
	Info_ClearChoices	(Info_Mod_Anselm_Ornament2);
};

FUNC VOID Info_Mod_Anselm_Ornament2_C()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Ornament2_C_15_00"); //Ich bin ein Bürger Khoratas.

	Info_Mod_Anselm_Ornament2_D();
};

FUNC VOID Info_Mod_Anselm_Ornament2_B()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Ornament2_B_15_00"); //2000 Gold ... hier.

	B_GiveInvItems	(hero, self, ItMi_Gold, 2000);

	Info_Mod_Anselm_Ornament2_D();
};

FUNC VOID Info_Mod_Anselm_Ornament2_A()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Ornament2_A_15_00"); //1000 Gold müssten doch auch reichen.

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Anselm_Ornament2_A_16_01"); //Selbstverständlich. Eigentlich könnte ich dir die Information auch schenken, aber ich habe ja auch meine Ausgaben, die gedeckt werden wollen.

		B_GiveInvItems	(hero, self, ItMi_Gold, 1000);
	
		B_GivePlayerXP	(10);

		B_RaiseHandelsgeschick (2);

		Info_Mod_Anselm_Ornament2_D();
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Anselm_Ornament2_A_16_02"); //Hmm, du solltest jetzt nicht versuchen, meinen guten Willen heute auszunutzen. Sei froh, dass ich überhaupt anbiete, dir die Informationen zu verkaufen.
	};
};

INSTANCE Info_Mod_Anselm_AnnaBefreit (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_AnnaBefreit_Condition;
	information	= Info_Mod_Anselm_AnnaBefreit_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anselm_AnnaBefreit_Condition()
{
	if (Mod_AnnaQuest == 9)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_AnnaBefreit_Info()
{
	AI_Output(self, hero, "Info_Mod_Anselm_AnnaBefreit_16_00"); //Mir ist zu Ohren gekommen, dass du mitverantwortlich für den Tod meiner Justizmänner bist.
	AI_Output(self, hero, "Info_Mod_Anselm_AnnaBefreit_16_01"); //Ich hätte mir wirklich etwas mehr Fingerspitzengefühl von dir erhofft. (seufzt)
	AI_Output(self, hero, "Info_Mod_Anselm_AnnaBefreit_16_02"); //Ich will es bei einer kleinen Strafe belassen. 500 Goldmünzen, jetzt.

	B_GiveInvItems	(hero, self, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Anselm_AnnaBefreit_16_03"); //Und nächstes Mal passt du besser auf, in welche Geschäfte du dich einmischst, ja? Das ist nämlich ein Geschäft für Erwachsene.
};

INSTANCE Info_Mod_Anselm_UlrichKO (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_UlrichKO_Condition;
	information	= Info_Mod_Anselm_UlrichKO_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anselm_UlrichKO_Condition()
{
	if (Mod_AnnaQuest == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_UlrichKO_Info()
{
	AI_Output(self, hero, "Info_Mod_Anselm_UlrichKO_16_00"); //Da bist du ja. Der Richter hat mir alles erzählt. Du hast dich tapfer geschlagen.
	AI_Output(self, hero, "Info_Mod_Anselm_UlrichKO_16_01"); //Khorata kann stolz sein, einen Helden wie dich zu besitzen.
	AI_Output(self, hero, "Info_Mod_Anselm_UlrichKO_16_02"); //Ach ja, deine Belohnung. Hier, nimm.

	CreateInvItems	(hero, ItMi_Gold, 800);
	CreateInvItems	(hero, ItMI_Freudenspender, 5);

	B_ShowGivenThings	("800 Gold und 5 Fläschchen Freudenspender erhalten");

	AI_Output(self, hero, "Info_Mod_Anselm_UlrichKO_16_03"); //Versüß dir damit den Tag, Süßer.
};

INSTANCE Info_Mod_Anselm_Unfrieden (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Unfrieden_Condition;
	information	= Info_Mod_Anselm_Unfrieden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe eine zwielichtige Angelegenheit zu melden.";
};

FUNC INT Info_Mod_Anselm_Unfrieden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Leonhard_Aufgabe))
	&& (Npc_HasItems(hero, ItWr_LeonhardRichter) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Unfrieden_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Unfrieden_15_00"); //Ich habe eine zwielichtige Angelegenheit zu melden.
	AI_Output(self, hero, "Info_Mod_Anselm_Unfrieden_16_01"); //Oho! Bist ein guter Mann! Worum handelt es sich?
	AI_Output(hero, self, "Info_Mod_Anselm_Unfrieden_15_02"); //Diesen Brief soll ich dem Richter in Leonhards Namen übergeben.

	B_GiveInvItems	(hero, self, ItWr_LeonhardRichter, 1);

	B_UseFakeScroll ();

	B_GiveInvItems	(self, hero, ItWr_LeonhardRichter, 1);

	AI_Output(self, hero, "Info_Mod_Anselm_Unfrieden_16_03"); //Du erlaubst dir aber Späße! Wahllos Buchstaben auf einen Zettel kritzeln und mich dann glauben machen, dass ein Sinn dahinter steckt.
	AI_Output(self, hero, "Info_Mod_Anselm_Unfrieden_16_04"); //(belustigt) Aus dem Alter bin ich raus, mein Junge.
};

INSTANCE Info_Mod_Anselm_RuprechtRing (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_RuprechtRing_Condition;
	information	= Info_Mod_Anselm_RuprechtRing_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anselm_RuprechtRing_Condition()
{
	if (Mod_LeonhardRuprecht == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_RuprechtRing_Info()
{
	AI_Output(self, hero, "Info_Mod_Anselm_RuprechtRing_16_00"); //Wie mir zu Ohren gekommen ist, wolltest du einen angesehenen Fremden bestehlen.
	AI_Output(self, hero, "Info_Mod_Anselm_RuprechtRing_16_01"); //Das darf ich leider nicht unbestraft lassen, du verstehst?
	AI_Output(self, hero, "Info_Mod_Anselm_RuprechtRing_16_02"); //Deine Aufgabe wird es also sein, dem Gemeinnutz zu dienen.
	AI_Output(self, hero, "Info_Mod_Anselm_RuprechtRing_16_03"); //Und wie es der Zufall will, habe ich gerade ein Rundschreiben an die Bürger Khoratas verfasst.
	AI_Output(self, hero, "Info_Mod_Anselm_RuprechtRing_16_04"); //30 Schreiben habe ich bereits kopieren lassen, die bekommst du mit.

	B_GiveInvItems	(self, hero, ItWr_AnselmRundschreiben, 30);

	AI_Output(self, hero, "Info_Mod_Anselm_RuprechtRing_16_05"); //Die wirst du innerhalb kürzester Zeit an Khoratas ehrbare Bewohner verteilen.
	AI_Output(self, hero, "Info_Mod_Anselm_RuprechtRing_16_06"); //Um den Rest wird sich jemand anderes kümmern.
};

INSTANCE Info_Mod_Anselm_FrazerPakete (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_FrazerPakete_Condition;
	information	= Info_Mod_Anselm_FrazerPakete_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier einige Erzpakete.";
};

FUNC INT Info_Mod_Anselm_FrazerPakete_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Frazer_Hi))
	&& (Npc_HasItems(hero, ItMi_ErzPaketFrazer) == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_FrazerPakete_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_FrazerPakete_15_00"); //Ich habe hier einige Erzpakete.

	B_GiveInvItems	(hero, self, ItMi_ErzPaketFrazer, 10);

	AI_Output(self, hero, "Info_Mod_Anselm_FrazerPakete_16_01"); //Die hast du ganz allein getragen? Respekt! Dafür sollst du fürstlich entlohnt werden!

	B_GiveInvItems	(self, hero, ItMi_Gold, 20);

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_KHORATA_ERZPAKETE, "Ich habe das Erz abgeliefert und bin 'fürstlich' entlohnt worden.");
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_ERZPAKETE, LOG_SUCCESS);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;
};

INSTANCE Info_Mod_Anselm_Endres (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Endres_Condition;
	information	= Info_Mod_Anselm_Endres_Info;
	permanent	= 1;
	important	= 0;
	description	= "Du sollst Frazer Bescheid geben, dass mir zu trauen ist.";
};

FUNC INT Info_Mod_Anselm_Endres_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Frazer_Endres02))
	&& (Npc_HasItems(hero, ItWr_AnselmForFrazer) == 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Frazer_Endres03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Endres_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Endres_15_00"); //Du sollst Frazer Bescheid geben, dass mir zu trauen ist.
	AI_Output(self, hero, "Info_Mod_Anselm_Endres_16_01"); //Aha! Das wäre ja fix erledigt, so ein Schreiben. Aber hast du mir im Gegenzug schon einmal geholfen?

	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_LandvermessungHubert))
	{
		AI_Output(hero, self, "Info_Mod_Anselm_Endres_15_02"); //Ja, ich war dir bei der "Vermessung" Khoratas behilflich.
		AI_Output(self, hero, "Info_Mod_Anselm_Endres_16_03"); //Du hast Recht, dafür schulde ich dir auch einen Gefallen! (singt) Nimm und geh!

		B_GiveInvItems	(self, hero, ItWr_AnselmForFrazer, 1);

		B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Ich sollte nun mit dem Schreiben zu Frazer zurückkehren.");
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Anselm_Endres_15_04"); //Bestimmt ...
		AI_Output(self, hero, "Info_Mod_Anselm_Endres_16_05"); //Komm wieder, wenn du dich konkret erinnerst!

		B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Ich werde die Versicherung Anselms erst erhalten, nachdem ich ihm geholfen habe.");
	};
};

INSTANCE Info_Mod_Anselm_Endres02 (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Endres02_Condition;
	information	= Info_Mod_Anselm_Endres02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anselm_Endres02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Richter_Endres02))
	&& (Mod_EndresIndizien == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Endres02_Info()
{
	AI_Output(self, hero, "Info_Mod_Anselm_Endres02_16_00"); //Respekt. Hinter dem Heiler hätte ich als letztes einen kaltblütigen Mörder vermutet.
	AI_Output(self, hero, "Info_Mod_Anselm_Endres02_16_01"); //Danke, dass du den Jungs und mir Arbeit abgenommen hast.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);
};

INSTANCE Info_Mod_Anselm_Dorn (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Dorn_Condition;
	information	= Info_Mod_Anselm_Dorn_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anselm_Dorn_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elvira_Dorn))
	&& (Mod_REL_IdricoDorn == 2)
	&& (Npc_IsDead(Mod_7499_KDF_Elvira_REL))
	&& (Npc_IsDead(Mod_7425_KDF_Fuego_REL))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Dorn_Info()
{
	AI_Output(self, hero, "Info_Mod_Anselm_Dorn_16_00"); //Wie ich hört, warst du in einen Mordfall verwickelt. Was sagst du dazu?
	AI_Output(hero, self, "Info_Mod_Anselm_Dorn_15_01"); //Es geschah nach Adanos' Willen!
	AI_Output(self, hero, "Info_Mod_Anselm_Dorn_16_02"); //(lacht) Du kleiner Spaßvogel.
	AI_Output(self, hero, "Info_Mod_Anselm_Dorn_16_03"); //Aber unter uns, den Feuermagiern weint niemand eine Träne nach. Mit ein bisschen Glück bleiben sie jetzt weg.
};

INSTANCE Info_Mod_Anselm_Dorn2 (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Dorn2_Condition;
	information	= Info_Mod_Anselm_Dorn2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich bin auf deine Hilfe angewiesen.";
};

FUNC INT Info_Mod_Anselm_Dorn2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elvira_Dorn))
	&& (Mod_REL_IdricoDorn == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Dorn2_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Dorn2_15_00"); //Ich bin auf deine Hilfe angewiesen.
	AI_Output(self, hero, "Info_Mod_Anselm_Dorn2_16_01"); //Das freut mich! Wo drückt denn der Schuh?
	AI_Output(hero, self, "Info_Mod_Anselm_Dorn2_15_02"); //Idrico versucht, die Feuermagier aus der Stadt zu treiben.
	AI_Output(self, hero, "Info_Mod_Anselm_Dorn2_16_03"); //Und wo genau liegt jetzt das Problem?

	Info_ClearChoices	(Info_Mod_Anselm_Dorn2);

	Info_AddChoice	(Info_Mod_Anselm_Dorn2, "Siehst du das nicht, Mann?!", Info_Mod_Anselm_Dorn2_B);
	Info_AddChoice	(Info_Mod_Anselm_Dorn2, "Ich fürchte, Idricos Geist ist vernebelt.", Info_Mod_Anselm_Dorn2_A);
};

FUNC VOID Info_Mod_Anselm_Dorn2_B()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Dorn2_B_15_00"); //Siehst du das nicht, Mann?!
	AI_Output(self, hero, "Info_Mod_Anselm_Dorn2_B_16_01"); //Nicht in diesem Ton, Freundchen.
	AI_Output(self, hero, "Info_Mod_Anselm_Dorn2_B_16_02"); //Sei froh, dass ich gut gelaunt bin, sonst würde ich dir eine Lektion erteilen.

	Info_ClearChoices	(Info_Mod_Anselm_Dorn2);
};

FUNC VOID Info_Mod_Anselm_Dorn2_A()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Dorn2_A_15_00"); //Ich fürchte, Idricos Geist ist vernebelt.
	AI_Output(self, hero, "Info_Mod_Anselm_Dorn2_A_16_01"); //Ich gebe zu, er ist ein bisschen kauzig. Aber was kann ich dagegen tun?
	AI_Output(hero, self, "Info_Mod_Anselm_Dorn2_A_15_02"); //Da wirst du schon deine Helferlein haben.
	AI_Output(self, hero, "Info_Mod_Anselm_Dorn2_A_16_03"); //(unschlüssig) Und was habe ich davon, wenn ich es mir mit einem einflussreichen Klatschverbreiter verscherze?
	AI_Output(hero, self, "Info_Mod_Anselm_Dorn2_A_15_04"); //Such dir was aus.
	AI_Output(self, hero, "Info_Mod_Anselm_Dorn2_A_16_05"); //Hmm, ja, eine Tributzahlung der Feuermagier würde mich sicherlich in eine gnädigere Stimmung versetzen.
	AI_Output(hero, self, "Info_Mod_Anselm_Dorn2_A_15_06"); //Ich kümmere mich darum.

	Info_ClearChoices	(Info_Mod_Anselm_Dorn2);

	Mod_REL_IdricoDorn = 4;

	B_LogEntry	(TOPIC_MOD_KHORATA_DORN, "Anselm hilft mir nur, wenn er eine Tributzahlung der Feuermagier erhält.");
};

INSTANCE Info_Mod_Anselm_Dorn3 (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Dorn3_Condition;
	information	= Info_Mod_Anselm_Dorn3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier sind 50 Goldmünzen von den Feuermagiern.";
};

FUNC INT Info_Mod_Anselm_Dorn3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elvira_Dorn2))
	&& (Mod_REL_IdricoDorn == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 50)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Dorn3_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Dorn3_15_00"); //Hier sind 50 Goldmünzen von den Feuermagiern.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Anselm_Dorn3_16_01"); //Die Angelegenheit scheint ja nicht sehr dringend zu sein.
	AI_Output(self, hero, "Info_Mod_Anselm_Dorn3_16_02"); //50 Gold für meine Hilfe finde ich doch leicht beleidigend.
	AI_Output(self, hero, "Info_Mod_Anselm_Dorn3_16_03"); //Ich glaube nicht, dass wir so ins Geschäft kommen.

	Mod_REL_IdricoDorn = 5;

	B_SetTopicStatus	(TOPIC_MOD_KHORATA_DORN, LOG_FAILED);
};

INSTANCE Info_Mod_Anselm_Dorn4 (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Dorn4_Condition;
	information	= Info_Mod_Anselm_Dorn4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier sind die 500 Gold der Feuermagier.";
};

FUNC INT Info_Mod_Anselm_Dorn4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elvira_Dorn2))
	&& (Mod_REL_IdricoDorn == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Dorn4_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Dorn4_15_00"); //Hier sind die 500 Gold der Feuermagier.

	B_GiveInvItems	(hero, self, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Anselm_Dorn4_16_01"); //Eine stattliche Summe! In Ordnung, Idrico wird seine Lektion erleben.
	AI_Output(self, hero, "Info_Mod_Anselm_Dorn4_16_02"); //Und dann das Maul halten.

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_KHORATA_DORN, "Anselm will dafür sorgen, dass Idrico Ruhe gibt.");

	Mod_REL_IdricoDorn = 6;
};

INSTANCE Info_Mod_Anselm_Wettstreit (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Wettstreit_Condition;
	information	= Info_Mod_Anselm_Wettstreit_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anselm_Wettstreit_Condition()
{
	if (Mod_REL_Wettstreit == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Wettstreit_Info()
{
	AI_Output(self, hero, "Info_Mod_Anselm_Wettstreit_16_00"); //(feierlich) Du bist der große Held der diesjährigen Rattenjagd.
	AI_Output(self, hero, "Info_Mod_Anselm_Wettstreit_16_01"); //Für deine Verdienste möchte ich dir einen Orden schenken. Trage ihn mit Stolz.

	B_GiveInvItems	(self, hero, ItAm_HalskettederEhre, 1);
};

INSTANCE Info_Mod_Anselm_Buerger (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Buerger_Condition;
	information	= Info_Mod_Anselm_Buerger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich auch ein Bürger Khoratas werden?";
};

FUNC INT Info_Mod_Anselm_Buerger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Buerger_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger_15_00"); //Kann ich auch ein Bürger Khoratas werden?
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger_16_01"); //Hmm, was? Du willst dir wohl ein paar Privilegien abzwacken? Abgezocktes Bürschchen.
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger_16_02"); //Aber ... ja, es sollte schon möglich sein, dass du die Stadtsbürgerschaft erhältst.
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger_16_03"); //Da du allerdings der Erste bist, der darum bittet, muss ich mir erst noch ein Verfahren ausdenken, mit dem ich sicher stelle, dass du zu uns passt.
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger_16_04"); //Du kannst dich in der Zwischenzeit einleben.
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger_16_05"); //Wenn ich mit der Arbeit fertig bin, und sehe, dass du dich engagierst, werde ich dich ansprechen.
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger_16_06"); //Also, worauf wartest du?

	Log_CreateTopic	(TOPIC_MOD_KHORATA_BUERGER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_BUERGER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_BUERGER, "Ich habe bei Anselm die Bürgerschaft für Khorata beantragt. Er braucht noch Zeit, um ein geeignetes Verfahren für mich zu finden. So lange soll ich mich nützlich machen.");
};

INSTANCE Info_Mod_Anselm_Buerger2 (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Buerger2_Condition;
	information	= Info_Mod_Anselm_Buerger2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anselm_Buerger2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Buerger))
	&& (Mod_REL_QuestCounter >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Buerger2_Info()
{
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger2_16_00"); //Da bist du ja! Ich habe gesehen, dass du nicht untätig warst und dir ein paar Freunde gemacht hast.
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger2_16_01"); //Deswegen bekommst du nun diesen Fragebogen. Diese Fragen musst du beantworten können, wenn wir uns das nächste Mal sehen.
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger2_16_02"); //Die Lösungen findest du alle innerhalb der Stadtmauern Khoratas. Oder in der Nähe.
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger2_16_03"); //(pathetisch) Frage und forsche, und du wirst fündig.

	B_GiveInvItems	(self, hero, ItWr_Fragebogen, 1);

	B_LogEntry	(TOPIC_MOD_KHORATA_BUERGER, "Anselm hat mir nun einen Fragebogen ausgehändigt. Die Antworten auf die Fragen will er in einem persönlichen Gespräch von mir erfahren. Ich sollte mir also gut merken, was ich herausfinde.");
};

INSTANCE Info_Mod_Anselm_Buerger3 (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Buerger3_Condition;
	information	= Info_Mod_Anselm_Buerger3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich fühle mich für die Prüfung bereit.";
};

FUNC INT Info_Mod_Anselm_Buerger3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Buerger2))
	&& (Mod_REL_Buerger == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Buerger3_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_15_00"); //Ich fühle mich für die Prüfung bereit.
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger3_16_01"); //Sehr gut! Lass uns gleich beginnen. Eine Frage falsch beantwortet, und die Prüfung gilt als nicht bestanden.
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger3_16_02"); //Erste Frage: In welchem Gebäude befindet sich der einzige Abort Khoratas?

	Info_ClearChoices	(Info_Mod_Anselm_Buerger3);

	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "In Margarethes Haus.", Info_Mod_Anselm_Buerger3_A5);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "In Friedels Haus.", Info_Mod_Anselm_Buerger3_A4);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Im Haus der Feuermagier.", Info_Mod_Anselm_Buerger3_A3);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Im Haus des Heilers.", Info_Mod_Anselm_Buerger3_A2);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Im Wirtshaus.", Info_Mod_Anselm_Buerger3_A1);
};

FUNC VOID Info_Mod_Anselm_Buerger3_A()
{
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger3_A_16_00"); //Zweite Frage: Wie hießen meine drei Ratten?

	Info_ClearChoices	(Info_Mod_Anselm_Buerger3);

	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Oleg, Pinky und Fievel.", Info_Mod_Anselm_Buerger3_B5);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Rémy, Fievel und Oleg.", Info_Mod_Anselm_Buerger3_B4);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Fievel, Pinky und Rémy.", Info_Mod_Anselm_Buerger3_B3);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Rémy, Feivel und Pinky.", Info_Mod_Anselm_Buerger3_B2);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Oleg, Rémy und Pinky.", Info_Mod_Anselm_Buerger3_B1);
};

FUNC VOID Info_Mod_Anselm_Buerger3_A5()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_A5_15_00"); //In Margarethes Haus.

	Info_Mod_Anselm_Buerger3_A();
};

FUNC VOID Info_Mod_Anselm_Buerger3_A4()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_A4_15_00"); //In Friedels Haus.

	Info_Mod_Anselm_Buerger3_A();
};

FUNC VOID Info_Mod_Anselm_Buerger3_A3()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_A3_15_00"); //Im Haus der Feuermagier.

	Mod_REL_BuergerFragen += 1;

	Info_Mod_Anselm_Buerger3_A();
};

FUNC VOID Info_Mod_Anselm_Buerger3_A2()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_A2_15_00"); //Im Haus des Heilers.

	Info_Mod_Anselm_Buerger3_A();
};

FUNC VOID Info_Mod_Anselm_Buerger3_A1()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_A1_15_00"); //Im Wirtshaus.

	Info_Mod_Anselm_Buerger3_A();
};

FUNC VOID Info_Mod_Anselm_Buerger3_B()
{
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger3_B_16_00"); //Dritte Frage: Warum trennten sich die Hofstaatler damals von der restlichen Gemeinschaft?

	Info_ClearChoices	(Info_Mod_Anselm_Buerger3);

	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Ein Fanatiker verführte sie, mit ihm zu kommen.", Info_Mod_Anselm_Buerger3_C5);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Sie waren die einzigen, die Freudenspender anbauen wollten.", Info_Mod_Anselm_Buerger3_C4);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Sie kamen in der Gemeinschaft nicht zurecht.", Info_Mod_Anselm_Buerger3_C3);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Sie wollten der Beobachtung Beliars entgehen.", Info_Mod_Anselm_Buerger3_C2);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Sie wurden bei einer Naturkatastrophe voneinander getrennt.", Info_Mod_Anselm_Buerger3_C1);
};

FUNC VOID Info_Mod_Anselm_Buerger3_B5()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_B5_15_00"); //Oleg, Pinky und Fievel.

	Mod_REL_BuergerFragen += 1;

	Info_Mod_Anselm_Buerger3_B();
};

FUNC VOID Info_Mod_Anselm_Buerger3_B4()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_B4_15_00"); //Rémy, Fievel und Oleg.

	Info_Mod_Anselm_Buerger3_B();
};

FUNC VOID Info_Mod_Anselm_Buerger3_B3()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_B3_15_00"); //Fievel, Pinky und Rémy.

	Info_Mod_Anselm_Buerger3_B();
};

FUNC VOID Info_Mod_Anselm_Buerger3_B2()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_B2_15_00"); //Rémy, Feivel und Pinky.

	Info_Mod_Anselm_Buerger3_B();
};

FUNC VOID Info_Mod_Anselm_Buerger3_B1()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_B1_15_00"); //Oleg, Rémy und Pinky.

	Info_Mod_Anselm_Buerger3_B();
};

FUNC VOID Info_Mod_Anselm_Buerger3_C()
{
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger3_C_16_00"); //Vierte Frage: Wie viele Händler haben ihren Stand am Marktplatz von Khorata?

	Info_ClearChoices	(Info_Mod_Anselm_Buerger3);

	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Sieben.", Info_Mod_Anselm_Buerger3_D5);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Sechs.", Info_Mod_Anselm_Buerger3_D4);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Fünf.", Info_Mod_Anselm_Buerger3_D3);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Vier.", Info_Mod_Anselm_Buerger3_D2);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Drei.", Info_Mod_Anselm_Buerger3_D1);
};

FUNC VOID Info_Mod_Anselm_Buerger3_C5()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_C5_15_00"); //Ein Fanatiker verführte sie, mit ihm zu kommen.

	Info_Mod_Anselm_Buerger3_C();
};

FUNC VOID Info_Mod_Anselm_Buerger3_C4()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_C4_15_00"); //Sie waren die einzigen, die Freudenspender anbauen wollten.

	Info_Mod_Anselm_Buerger3_C();
};

FUNC VOID Info_Mod_Anselm_Buerger3_C3()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_C3_15_00"); //Sie kamen in der Gemeinschaft nicht zurecht.

	Info_Mod_Anselm_Buerger3_C();
};

FUNC VOID Info_Mod_Anselm_Buerger3_C2()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_C2_15_00"); //Sie wollten der Beobachtung Beliars entgehen.

	Mod_REL_BuergerFragen += 1;

	Info_Mod_Anselm_Buerger3_C();
};

FUNC VOID Info_Mod_Anselm_Buerger3_C1()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_C1_15_00"); //Sie wurden bei einer Naturkatastrophe voneinander getrennt.

	Info_Mod_Anselm_Buerger3_C();
};

FUNC VOID Info_Mod_Anselm_Buerger3_D()
{
	AI_Output(self, hero, "Info_Mod_Anselm_Buerger3_D_16_00"); //Fünfte Frage: Wer hat dafür zu sorgen, dass die Wasserversorgung reibungslos läuft?

	Info_ClearChoices	(Info_Mod_Anselm_Buerger3);

	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Idrico.", Info_Mod_Anselm_Buerger3_E5);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Hubert.", Info_Mod_Anselm_Buerger3_E4);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Friedel.", Info_Mod_Anselm_Buerger3_E3);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Lukas.", Info_Mod_Anselm_Buerger3_E2);
	Info_AddChoice	(Info_Mod_Anselm_Buerger3, "Wendel.", Info_Mod_Anselm_Buerger3_E1);
};

FUNC VOID Info_Mod_Anselm_Buerger3_D5()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_D5_15_00"); //Sieben.

	Info_Mod_Anselm_Buerger3_D();
};

FUNC VOID Info_Mod_Anselm_Buerger3_D4()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_D4_15_00"); //Sechs.

	Info_Mod_Anselm_Buerger3_D();
};

FUNC VOID Info_Mod_Anselm_Buerger3_D3()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_D3_15_00"); //Fünf.

	Mod_REL_BuergerFragen += 1;

	Info_Mod_Anselm_Buerger3_D();
};

FUNC VOID Info_Mod_Anselm_Buerger3_D2()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_D2_15_00"); //Vier.

	Info_Mod_Anselm_Buerger3_D();
};

FUNC VOID Info_Mod_Anselm_Buerger3_D1()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_D1_15_00"); //Drei.

	Info_Mod_Anselm_Buerger3_D();
};

FUNC VOID Info_Mod_Anselm_Buerger3_E()
{
	if (Mod_REL_BuergerFragen == 5)
	{
		AI_Output(self, hero, "Info_Mod_Anselm_Buerger3_E_16_00"); //Ja, das hast du gut gemacht. Du hast alle Fragen richtig beantwortet.
		AI_Output(self, hero, "Info_Mod_Anselm_Buerger3_E_16_01"); //Tja, gut. Du darfst dich jetzt Bürger Khoratas nennen und alles mit Freudenspender machen, was du willst.
		AI_Output(self, hero, "Info_Mod_Anselm_Buerger3_E_16_02"); //Das ist doch was, oder?
		AI_Output(self, hero, "Info_Mod_Anselm_Buerger3_E_16_03"); //Du solltest auch mal bei Friedel vorbeischauen. Ich lasse ihm ausrichten, dass er dir etwas Startkapital aushändigen soll.

		Mod_REL_Buerger = 1;

		B_GivePlayerXP	(200);

		B_LogEntry	(TOPIC_MOD_KHORATA_BUERGER, "Ich bin nun ein Bürger Khoratas.");
		B_SetTopicStatus	(TOPIC_MOD_KHORATA_BUERGER, LOG_SUCCESS);
		
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_21);

		CurrentNQ += 1;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Anselm_Buerger3_E_16_04"); //Schade, mindestens eine der Antworten war nicht richtig.
		AI_Output(self, hero, "Info_Mod_Anselm_Buerger3_E_16_05"); //Aber in meiner unendlichen Gutmütigkeit will ich dir noch eine Chance einräumen.
		AI_Output(self, hero, "Info_Mod_Anselm_Buerger3_E_16_06"); //Komm wieder, wenn du meinst, den Aufgaben gewachsen zu sein.
	};

	Mod_REL_BuergerFragen = 0;

	Info_ClearChoices	(Info_Mod_Anselm_Buerger3);
};

FUNC VOID Info_Mod_Anselm_Buerger3_E5()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_E5_15_00"); //Idrico.

	Info_Mod_Anselm_Buerger3_E();
};

FUNC VOID Info_Mod_Anselm_Buerger3_E4()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_E4_15_00"); //Hubert.

	Info_Mod_Anselm_Buerger3_E();
};

FUNC VOID Info_Mod_Anselm_Buerger3_E3()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_E3_15_00"); //Friedel.

	Info_Mod_Anselm_Buerger3_E();
};

FUNC VOID Info_Mod_Anselm_Buerger3_E2()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_E2_15_00"); //Lukas.

	Info_Mod_Anselm_Buerger3_E();
};

FUNC VOID Info_Mod_Anselm_Buerger3_E1()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Buerger3_E1_15_00"); //Wendel.

	Mod_REL_BuergerFragen += 1;

	Info_Mod_Anselm_Buerger3_E();
};

INSTANCE Info_Mod_Anselm_Bierhexen (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Bierhexen_Condition;
	information	= Info_Mod_Anselm_Bierhexen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich möchte von einem Verbrechen berichten.";
};

FUNC INT Info_Mod_Anselm_Bierhexen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen6))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_Bierhexen_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Bierhexen_15_00"); //Ich möchte von einem Verbrechen berichten.
	AI_Output(self, hero, "Info_Mod_Anselm_Bierhexen_16_01"); //Na, immer her damit! Mein Tag war bisher langweilig genug.
	AI_Output(hero, self, "Info_Mod_Anselm_Bierhexen_15_02"); //Leonhard gibt zu, dass er des Nachts das Bier des Braumeisters getrunken und in seine Gerste uriniert hat.
	AI_Output(self, hero, "Info_Mod_Anselm_Bierhexen_16_03"); //(Pause) Hmm, das war es schon? So ein Dummer-Junge-Streich?

	Info_ClearChoices	(Info_Mod_Anselm_Bierhexen);

	Info_AddChoice	(Info_Mod_Anselm_Bierhexen, "So etwas muss bestraft werden!", Info_Mod_Anselm_Bierhexen_C);
	Info_AddChoice	(Info_Mod_Anselm_Bierhexen, "Wegen Leonhard gibt es seit Wochen kein frisches Bier mehr!", Info_Mod_Anselm_Bierhexen_B);
	Info_AddChoice	(Info_Mod_Anselm_Bierhexen, "Der Braumeister hat seit diesem Vorfall einen seelischen Schaden.", Info_Mod_Anselm_Bierhexen_A);
};

FUNC VOID Info_Mod_Anselm_Bierhexen_C()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Bierhexen_C_15_00"); //So etwas muss bestraft werden!
	AI_Output(self, hero, "Info_Mod_Anselm_Bierhexen_C_16_01"); //Gut, dass du nicht die Gesetze von Khorata zu beaufsichtigen hast.
	AI_Output(self, hero, "Info_Mod_Anselm_Bierhexen_C_16_02"); //Manche Menschen brauchen eben etwas mehr Freiraum als andere, das kann ich ihnen doch nicht verwehren.
};

FUNC VOID Info_Mod_Anselm_Bierhexen_B()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Bierhexen_B_15_00"); //Wegen Leonhard gibt es seit Wochen kein frisches Bier mehr!
	AI_Output(self, hero, "Info_Mod_Anselm_Bierhexen_B_16_01"); //(nachdenklich) Daran habe ich ja noch gar nicht gedacht.
	AI_Output(self, hero, "Info_Mod_Anselm_Bierhexen_B_16_02"); //Ein nicht unerheblicher Schaden an der heimischen Wirtschaft also.
	AI_Output(hero, self, "Info_Mod_Anselm_Bierhexen_B_15_03"); //Die Vorräte sollen schon knapp werden.
	AI_Output(self, hero, "Info_Mod_Anselm_Bierhexen_B_16_04"); //(schockiert) Das kann doch nicht wahr sein! Was fällt diesem Lümmel eigentlich ein?
	AI_Output(hero, self, "Info_Mod_Anselm_Bierhexen_B_15_05"); //Es muss möglichst schnell für neue Gerste gesorgt werden.
	AI_Output(self, hero, "Info_Mod_Anselm_Bierhexen_B_16_06"); //Vollkommen richtig! Und ich weiß auch, wer die Gerste eigenhändig ernten und in die Stadt tragen wird!
	AI_Output(hero, self, "Info_Mod_Anselm_Bierhexen_B_15_07"); //Gute Idee. Mehr wollte ich auch gar nicht.
	AI_Output(self, hero, "Info_Mod_Anselm_Bierhexen_B_16_08"); //Aber bleib mir ab jetzt mit solchen Horrormeldungen fort!

	Info_ClearChoices	(Info_Mod_Anselm_Bierhexen);

	B_GivePlayerXP	(250);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_KHORATA_BIERHEXEN, LOG_SUCCESS);

	B_StartOtherRoutine	(Mod_7419_OUT_Leonhard_REL, "STRAFE");
	B_StartOtherRoutine	(Mod_7420_OUT_Michael_REL, "STRAFE");
	B_StartOtherRoutine	(Mod_7421_OUT_Philipp_REL, "STRAFE");
};

FUNC VOID Info_Mod_Anselm_Bierhexen_A()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Bierhexen_A_15_00"); //Der Braumeister hat seit diesem Vorfall einen seelischen Schaden.
	AI_Output(self, hero, "Info_Mod_Anselm_Bierhexen_A_16_01"); //(ironisch) Wie dramatisch! Ein seelischer Schaden!
	AI_Output(self, hero, "Info_Mod_Anselm_Bierhexen_A_16_02"); //Wir können ihn ja zum Heiler bringen, der bohrt dann sein Gehirn an und stellt wieder Ordnung her.
};

INSTANCE Info_Mod_Anselm_DickeLuft (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_DickeLuft_Condition;
	information	= Info_Mod_Anselm_DickeLuft_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anselm_DickeLuft_Condition()
{
	if (Mod_IstSchaf == 1)
	&& (Mod_Kneipe_Ditmar == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_DickeLuft_Info()
{
	var c_npc Anselm; Anselm = Hlp_GetNpc(Mod_7241_OUT_Anselm_REL);
	var c_npc Hedwig; Hedwig = Hlp_GetNpc(Mod_7723_OUT_Hedwig_REL);

	TRIA_Invite(Hedwig);

	TRIA_Start();

	TRIA_Next(Anselm);

	AI_TurnToNpc	(Anselm, Hedwig);
	AI_TurnToNpc	(Hedwig, Anselm);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_16_00"); //Na, na! Wieso störst du meine wichtigen Geschäfte? Wolltest du nicht bei Ditmar ausharren, bis ... äh, was war das noch gleich?

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_21_01"); //(lautstark) Bis du Nichtsnutz endlich mal anfängst, mir bei der Hausarbeit unter die Arme zu greifen.

	TRIA_Next(Anselm);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_16_02"); //(murmelt) Dir greif ich nirgendwo mehr hin.

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_21_03"); //Und, wie sieht es aus? Hast du langsam deine Meinung geändert?

	TRIA_Next(Anselm);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_16_04"); //Innos verhüte das! Geh nur wieder zurück ins Gasthaus und streike dort.

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_21_05"); //Es macht dir wohl gar nichts aus, dass ich dort jeden störe?

	TRIA_Next(Anselm);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_16_06"); //(tut, als würde er überlegen) Damit komme ich schon klar.

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_21_07"); //Schön. Dann werde ich mir ein neues Druckmittel ausdenken müssen.
	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_21_08"); //Wie wär's damit: Ich setze mich genau hier hin.

	AI_UseMob	(self, "THRONE", 1);

	AI_TurnToNpc	(Anselm, self);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_21_09"); //Und niemand wird mich hier weg kriegen, solange du zu Hause keinen Finger krümmst!

	TRIA_Next(Anselm);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_16_10"); //(seufzt) Wenn's dir Spaß macht.

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_21_11"); //Oh ja!

	TRIA_Next(Anselm);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_16_12"); //Was macht eigentlich das Schaf hier drin? Sollte das nicht besser zum Metzger?

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_21_13"); //(erbost) Ich warne dich!

	TRIA_Next(Anselm);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft_16_14"); //(ruft) Jim! Komm doch mal her!

	TRIA_Finish();

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Anselm_DickeLuft2 (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_DickeLuft2_Condition;
	information	= Info_Mod_Anselm_DickeLuft2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anselm_DickeLuft2_Condition()
{
	if (Mod_IstSchaf == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Anselm_DickeLuft))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anselm_DickeLuft2_Info()
{
	var c_npc Anselm; Anselm = Hlp_GetNpc(Mod_7241_OUT_Anselm_REL);
	var c_npc Hedwig; Hedwig = Hlp_GetNpc(Mod_7723_OUT_Hedwig_REL);

	TRIA_Invite(Hedwig);

	TRIA_Start();

	TRIA_Next(Anselm);

	AI_TurnToNpc	(Anselm, Hedwig);
	AI_TurnToNpc	(Hedwig, Anselm);

	AI_Output(hero, self, "Info_Mod_Anselm_DickeLuft2_15_00"); //Kümmert euch gar nicht um mich.

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft2_21_01"); //Aber...!

	TRIA_Next(Anselm);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft2_16_02"); //(schmalzig) Du wurdest ausgetrickst, Liebste, Teuerste. Aber jetzt bist du ja bei mir, und ich werde dich beschützen.

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft2_21_03"); //Das könnte dir so passen! Ich gehe jetzt und schließe mich ein, jawohl!
	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft2_21_04"); //Ich will niemanden von euch mehr sehen!

	TRIA_Next(Anselm);

	AI_Output(self, hero, "Info_Mod_Anselm_DickeLuft2_16_05"); //(erleichtert) Danke für deine Hilfe. Jetzt kann ich abends endlich wieder was trinken gehen.

	TRIA_Finish();

	AI_StopProcessInfos	(self);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_DITMAR_DICKELUFT, "Ich habe Hedwig zu Anselm gelockt und es gab eine Aussprache. Na ja, so eine Art. Jedenfalls sollte sie jetzt nicht mehr ins Gasthaus zurückkehren. Das wird Irmgard und Ditmar sicher freuen zu erfahren.");
};

INSTANCE Info_Mod_Anselm_WoHubert (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_WoHubert_Condition;
	information	= Info_Mod_Anselm_WoHubert_Info;
	permanent	= 1;
	important	= 0;
	description 	= "Wo finde ich Hubert genau?";
};                       

FUNC INT Info_Mod_Anselm_WoHubert_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_LandvermessungVincent))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Anselm_LandvermessungHubert))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Anselm_WoHubert_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_WoHubert_15_00"); //Wo finde ich Hubert genau?
	AI_Output(self, hero, "Info_Mod_Anselm_WoHubert_16_01"); //Unterschiedlich, aber niemals weit weg von seinem Lebenselixier. Manchmal lungert er am Tor rum, aber meistens ist er in der Nähe des Gasthauses oder der Brauerei zu finden.
};

INSTANCE Info_Mod_Anselm_Freudenspender (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Freudenspender_Condition;
	information	= Info_Mod_Anselm_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Freudenspender für den großartigen Stadthalter?";
};                       

FUNC INT Info_Mod_Anselm_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Anselm_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Anselm_Freudenspender_15_00"); //Freudenspender für den großartigen Stadthalter?
	AI_Output(self, hero, "Info_Mod_Anselm_Freudenspender_16_01"); //Oh, ein vortreffliches Angebot, das ich schlecht ablehnen kann.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 1);

	B_GiveInvItems	(self, hero, ItMi_Gold, 10);

	Mod_Freudenspender	+= 1;
};

INSTANCE Info_Mod_Anselm_Pickpocket (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_Pickpocket_Condition;
	information	= Info_Mod_Anselm_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Anselm_Pickpocket_Condition()
{
	C_Beklauen	(102, ItMi_Gold, 37);
};

FUNC VOID Info_Mod_Anselm_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Anselm_Pickpocket);

	Info_AddChoice	(Info_Mod_Anselm_Pickpocket, DIALOG_BACK, Info_Mod_Anselm_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Anselm_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Anselm_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Anselm_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Anselm_Pickpocket);
};

FUNC VOID Info_Mod_Anselm_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Anselm_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Anselm_Pickpocket);

		Info_AddChoice	(Info_Mod_Anselm_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Anselm_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Anselm_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Anselm_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Anselm_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Anselm_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Anselm_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Anselm_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Anselm_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Anselm_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Anselm_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Anselm_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Anselm_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Anselm_EXIT (C_INFO)
{
	npc		= Mod_7241_OUT_Anselm_REL;
	nr		= 1;
	condition	= Info_Mod_Anselm_EXIT_Condition;
	information	= Info_Mod_Anselm_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Anselm_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anselm_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};