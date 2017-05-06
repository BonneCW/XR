INSTANCE Info_Mod_Leonhard_Hi (C_INFO)
{
	npc		= Mod_7419_OUT_Leonhard_REL;
	nr		= 1;
	condition	= Info_Mod_Leonhard_Hi_Condition;
	information	= Info_Mod_Leonhard_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Leonhard_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Leonhard_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Leonhard_Hi_36_00"); //(erschrocken) Hey! Was schleichst du hier herum? Willst mich wohl erschrecken?
};

INSTANCE Info_Mod_Leonhard_Aufgabe (C_INFO)
{
	npc		= Mod_7419_OUT_Leonhard_REL;
	nr		= 1;
	condition	= Info_Mod_Leonhard_Aufgabe_Condition;
	information	= Info_Mod_Leonhard_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_Leonhard_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Leonhard_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Leonhard_Aufgabe_Info()
{
	B_Say	(hero, self, "$WASMACHSTDUHIER");

	AI_Output(self, hero, "Info_Mod_Leonhard_Aufgabe_36_01"); //Ich warte, um Leuten wie dir ein gutes Angebot zu machen. Ein Angebot zu deinem und meinem Vorteil.
	AI_Output(self, hero, "Info_Mod_Leonhard_Aufgabe_36_02"); //Bin nur gerade kurz eingenickt. Ich warte ja schon etwas länger.

	Info_ClearChoices	(Info_Mod_Leonhard_Aufgabe);

	Info_AddChoice	(Info_Mod_Leonhard_Aufgabe, "Damit will ich nichts zu tun haben!", Info_Mod_Leonhard_Aufgabe_B);
	Info_AddChoice	(Info_Mod_Leonhard_Aufgabe, "Was ist das für ein Angebot?", Info_Mod_Leonhard_Aufgabe_A);
};

FUNC VOID Info_Mod_Leonhard_Aufgabe_B()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Aufgabe_B_15_00"); //Damit will ich nichts zu tun haben!

	Info_ClearChoices	(Info_Mod_Leonhard_Aufgabe);
};

FUNC VOID Info_Mod_Leonhard_Aufgabe_A()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Aufgabe_A_15_00"); //Was ist das für ein Angebot?
	AI_Output(self, hero, "Info_Mod_Leonhard_Aufgabe_A_36_01"); //Zwei Kumpel von mir sind im Gefängnis gelandet, völlig unrechtmäßig.
	AI_Output(self, hero, "Info_Mod_Leonhard_Aufgabe_A_36_02"); //Und jetzt will ich dem Richter die Gelegenheit geben, seinen Fehler wieder gut zu machen.
	AI_Output(self, hero, "Info_Mod_Leonhard_Aufgabe_A_36_03"); //Dafür sollst du ihm einfach nur eine Nachricht übermitteln, klar?
	AI_Output(self, hero, "Info_Mod_Leonhard_Aufgabe_A_36_04"); //Pass auf, dass niemand anderes sie liest, und guck selbst auch nicht rein. Steht eh nichts Spannendes drin.
	AI_Output(self, hero, "Info_Mod_Leonhard_Aufgabe_A_36_05"); //Eine Aufwandsentschädigung für dich ist natürlich auch drin.

	Info_ClearChoices	(Info_Mod_Leonhard_Aufgabe);

	Info_AddChoice	(Info_Mod_Leonhard_Aufgabe, "Ich werde mich darum kümmern.", Info_Mod_Leonhard_Aufgabe_D);
	Info_AddChoice	(Info_Mod_Leonhard_Aufgabe, "Warum übergibst du die Botschaft nicht selbst?", Info_Mod_Leonhard_Aufgabe_C);
};

FUNC VOID Info_Mod_Leonhard_Aufgabe_D()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Aufgabe_D_15_00"); //Ich werde mich darum kümmern.

	B_GiveInvItems	(self, hero, ItWr_LeonhardRichter, 1);

	Log_CreateTopic	(TOPIC_MOD_KHORATA_UNFRIEDEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_UNFRIEDEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_UNFRIEDEN, "Leonhard hat mich beauftragt, dem Richter in Khorata eine Botschaft zukommen zu lassen ... und nur dem Richter!");

	Info_ClearChoices	(Info_Mod_Leonhard_Aufgabe);
};

FUNC VOID Info_Mod_Leonhard_Aufgabe_C()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Aufgabe_C_15_00"); //Warum übergibst du die Botschaft nicht selbst?
	AI_Output(self, hero, "Info_Mod_Leonhard_Aufgabe_C_36_01"); //Der Richter und ich ... wir sind nicht die besten Freunde.
	AI_Output(self, hero, "Info_Mod_Leonhard_Aufgabe_C_36_02"); //Ich hoffe, das reicht dir an Erklärung. Wie steht's nun?

	Info_ClearChoices	(Info_Mod_Leonhard_Aufgabe);

	Info_AddChoice	(Info_Mod_Leonhard_Aufgabe, "Ich werde mich darum kümmern.", Info_Mod_Leonhard_Aufgabe_D);
	Info_AddChoice	(Info_Mod_Leonhard_Aufgabe, "Nein, das sieht mir nicht nach sauberer Arbeit aus.", Info_Mod_Leonhard_Aufgabe_E);
};

FUNC VOID Info_Mod_Leonhard_Aufgabe_E()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Aufgabe_E_15_00"); //Nein, das sieht mir nicht nach sauberer Arbeit aus.

	Info_ClearChoices	(Info_Mod_Leonhard_Aufgabe);
};

INSTANCE Info_Mod_Leonhard_Unfrieden (C_INFO)
{
	npc		= Mod_7419_OUT_Leonhard_REL;
	nr		= 1;
	condition	= Info_Mod_Leonhard_Unfrieden_Condition;
	information	= Info_Mod_Leonhard_Unfrieden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich möchte mir meine Belohnung abholen.";
};

FUNC INT Info_Mod_Leonhard_Unfrieden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Richter_Unfrieden))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Leonhard_Unfrieden_Info()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Unfrieden_15_00"); //Ich möchte mir meine Belohnung abholen.
	AI_Output(self, hero, "Info_Mod_Leonhard_Unfrieden_36_01"); //Ja, deine Belohnung ... Mit der Belohnung gibt's noch ein kleines Problem.
	AI_Output(self, hero, "Info_Mod_Leonhard_Unfrieden_36_02"); //Die hat nämlich jemand anderes. Aber wir müssen sie nur noch gemeinsam beschaffen gehen.

	Info_ClearChoices	(Info_Mod_Leonhard_Unfrieden);

	Info_AddChoice	(Info_Mod_Leonhard_Unfrieden, "Du meinst wohl klauen? Da mach ich nicht mit.", Info_Mod_Leonhard_Unfrieden_B);
	Info_AddChoice	(Info_Mod_Leonhard_Unfrieden, "Wie kommen wir an das Gold?", Info_Mod_Leonhard_Unfrieden_A);
};

FUNC VOID Info_Mod_Leonhard_Unfrieden_B()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Unfrieden_B_15_00"); //Du meinst wohl klauen? Da mach ich nicht mit.
	AI_Output(self, hero, "Info_Mod_Leonhard_Unfrieden_B_36_01"); //Du solltest es dir wirklich noch mal anders überlegen.

	Info_ClearChoices	(Info_Mod_Leonhard_Unfrieden);

	Info_AddChoice	(Info_Mod_Leonhard_Unfrieden, "Das ist nichts für mich.", Info_Mod_Leonhard_Unfrieden_D);
	Info_AddChoice	(Info_Mod_Leonhard_Unfrieden, "Wie kommen wir an das Gold?", Info_Mod_Leonhard_Unfrieden_A);
};

FUNC VOID Info_Mod_Leonhard_Unfrieden_A()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Unfrieden_A_15_00"); //Wie kommen wir an das Gold?
	AI_Output(self, hero, "Info_Mod_Leonhard_Unfrieden_A_36_01"); //In der Gaststätte hat sich Ruprecht, ein ... Verbrecher, eingenistet.
	AI_Output(self, hero, "Info_Mod_Leonhard_Unfrieden_A_36_02"); //Er schläft in einem der Betten im ersten Stock.
	AI_Output(self, hero, "Info_Mod_Leonhard_Unfrieden_A_36_03"); //Neben seinem Bett hortet er sein erbeutetes Gold in einer Truhe.
	AI_Output(self, hero, "Info_Mod_Leonhard_Unfrieden_A_36_04"); //Die musst du tagsüber in einem unbeobachteten Moment ausräumen und uns den Inhalt bringen.
	AI_Output(self, hero, "Info_Mod_Leonhard_Unfrieden_A_36_05"); //Dann erhältst du deinen gerechten Anteil.

	Info_ClearChoices	(Info_Mod_Leonhard_Unfrieden);

	Info_AddChoice	(Info_Mod_Leonhard_Unfrieden, "Das ist nichts für mich.", Info_Mod_Leonhard_Unfrieden_D);
	Info_AddChoice	(Info_Mod_Leonhard_Unfrieden, "Wird erledigt.", Info_Mod_Leonhard_Unfrieden_C);
};

FUNC VOID Info_Mod_Leonhard_Unfrieden_D()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Unfrieden_D_15_00"); //Das ist nichts für mich.
	AI_Output(self, hero, "Info_Mod_Leonhard_Unfrieden_D_36_01"); //Dann wird auch nichts aus der Belohnung. Überleg's dir.

	Info_ClearChoices	(Info_Mod_Leonhard_Unfrieden);

	B_SetTopicStatus	(TOPIC_MOD_KHORATA_UNFRIEDEN, LOG_SUCCESS);
};

FUNC VOID Info_Mod_Leonhard_Unfrieden_C()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Unfrieden_C_15_00"); //Wird erledigt.

	B_LogEntry	(TOPIC_MOD_KHORATA_UNFRIEDEN, "Ich soll die Truhe Ruprechts, der momentan in der Gaststätte im ersten Stock schläft, ausrauben, um an meine Belohnung zu kommen.");

	Mod_LeonhardRuprecht = 1;

	Info_ClearChoices	(Info_Mod_Leonhard_Unfrieden);
};

INSTANCE Info_Mod_Leonhard_RuprechtsTruhe (C_INFO)
{
	npc		= Mod_7419_OUT_Leonhard_REL;
	nr		= 1;
	condition	= Info_Mod_Leonhard_RuprechtsTruhe_Condition;
	information	= Info_Mod_Leonhard_RuprechtsTruhe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier ist Ruprechts Gold.";
};

FUNC INT Info_Mod_Leonhard_RuprechtsTruhe_Condition()
{
	if ((Mod_LeonhardRuprecht == 2)
	|| (Mod_LeonhardRuprecht == 3))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Leonhard_RuprechtsTruhe_Info()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_RuprechtsTruhe_15_00"); //Hier ist Ruprechts Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 1000);

	AI_Output(self, hero, "Info_Mod_Leonhard_RuprechtsTruhe_36_01"); //Das ist nicht so viel, wie ich erwartet habe. (überlegt) Ich glaube, das ziehe ich dir vom Lohn ab. Wir schulden dir nichts.
	AI_Output(hero, self, "Info_Mod_Leonhard_RuprechtsTruhe_15_02"); //Das ist nicht dein Ernst.
	AI_Output(self, hero, "Info_Mod_Leonhard_RuprechtsTruhe_36_03"); //Verpiss dich!
	AI_Output(hero, self, "Info_Mod_Leonhard_RuprechtsTruhe_15_04"); //Dann hole ich es mir eben selbst wieder!

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_KHORATA_UNFRIEDEN, "Leonhard wollte mir meine Belohnung nicht geben, weshalb ich ihn 'überreden' musste.");
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_UNFRIEDEN, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;
};

INSTANCE Info_Mod_Leonhard_Endres (C_INFO)
{
	npc		= Mod_7419_OUT_Leonhard_REL;
	nr		= 1;
	condition	= Info_Mod_Leonhard_Endres_Condition;
	information	= Info_Mod_Leonhard_Endres_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Leonhard_Endres_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Frazer_Endres03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Leonhard_Endres_Info()
{
	AI_Output(self, hero, "Info_Mod_Leonhard_Endres_36_00"); //Ey, haste mal 'nen Augenblick Zeit?
	AI_Output(hero, self, "Info_Mod_Leonhard_Endres_15_01"); //Worum geht's?
	AI_Output(self, hero, "Info_Mod_Leonhard_Endres_36_02"); //Hab gehört, du ermittelst in dem komplizierten Fall, wer Endres umgelegt hat.
	AI_Output(hero, self, "Info_Mod_Leonhard_Endres_15_03"); //Könnte sein.
	AI_Output(self, hero, "Info_Mod_Leonhard_Endres_36_04"); //Da wollt ich dir nur mitteilen, dass einem meiner Informanten ein Erpresserbrief vom Heiler an Juliana ... in die Hände gefallen ist.
	AI_Output(self, hero, "Info_Mod_Leonhard_Endres_36_05"); //Wahrscheinlich erpresst er sie mit Endres' Leiche, rückt sie erst gegen Bezahlung raus oder so.
	AI_Output(self, hero, "Info_Mod_Leonhard_Endres_36_06"); //Du weißt ja, arm ist Juliana nicht.
	AI_Output(hero, self, "Info_Mod_Leonhard_Endres_15_07"); //Wieso hat Juliana die Erpressung nicht gemeldet?
	AI_Output(self, hero, "Info_Mod_Leonhard_Endres_36_08"); //Tja, bei einer Erpressung hat man normalerweise was gegen die erpresste Person in der Hand, ne?
	AI_Output(self, hero, "Info_Mod_Leonhard_Endres_36_09"); //Das wird sich der Heiler schon genau überlegt haben, ob er ein ausreichendes Druckmittel hat.
	AI_Output(self, hero, "Info_Mod_Leonhard_Endres_36_10"); //Na ja, wollt's nur gesagt haben. Also Dreck haben die beide am Stecken, so viel ist sicher.
	AI_Output(hero, self, "Info_Mod_Leonhard_Endres_15_11"); //Danke für die Informationen. Aber wieso erzählst du mir davon?
	AI_Output(self, hero, "Info_Mod_Leonhard_Endres_36_12"); //Ich bin immerhin ein anständiger Bürger, oder nicht? Und gibt's nicht für solche Hinweise 'ne kleine Belohnung?
	AI_Output(hero, self, "Info_Mod_Leonhard_Endres_15_13"); //Wenn du richtig liegst, bestimmt.
	AI_Output(self, hero, "Info_Mod_Leonhard_Endres_36_14"); //Dann hören wir noch voneinander.

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Leonhard will gehört haben, dass der Heiler Juliana mit Endres' Leiche erpresst hat. Mit den beiden habe ich also auch noch Gesprächsbedarf.");

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Leonhard_Endres02 (C_INFO)
{
	npc		= Mod_7419_OUT_Leonhard_REL;
	nr		= 1;
	condition	= Info_Mod_Leonhard_Endres02_Condition;
	information	= Info_Mod_Leonhard_Endres02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Leonhard_Endres02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Richter_Endres02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Leonhard_Endres02_Info()
{
	AI_Output(self, hero, "Info_Mod_Leonhard_Endres02_36_00"); //Na, hab gehört, mein Tipp hat dir 'ne ganze Ecke weitergeholfen.
	AI_Output(hero, self, "Info_Mod_Leonhard_Endres02_15_01"); //Das lässt sich nicht leugnen.
	AI_Output(self, hero, "Info_Mod_Leonhard_Endres02_36_02"); //Kann ich mit einer Belohnung rechnen?

	Info_ClearChoices	(Info_Mod_Leonhard_Endres02);

	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		Info_AddChoice	(Info_Mod_Leonhard_Endres02, "Da lasse ich mich nicht lumpen. (100 Gold geben)", Info_Mod_Leonhard_Endres02_C);
	};
	if (Npc_HasItems(hero, ItMi_Gold) >= 10)
	{
		Info_AddChoice	(Info_Mod_Leonhard_Endres02, "Hier hast du eine Kleinigkeit. (10 Gold geben)", Info_Mod_Leonhard_Endres02_B);
	};
	Info_AddChoice	(Info_Mod_Leonhard_Endres02, "Vergiss es.", Info_Mod_Leonhard_Endres02_A);
};

FUNC VOID Info_Mod_Leonhard_Endres02_C()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Endres02_C_15_00"); //Da lasse ich mich nicht lumpen.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Leonhard_Endres02_C_36_01"); //Oha, Mann, danke! Weißte was, dafür darfst du in Zukunft Wertsachen bei mir loswerden. Gegen Gold, versteht sich.

	Info_ClearChoices	(Info_Mod_Leonhard_Endres02);
};

FUNC VOID Info_Mod_Leonhard_Endres02_B()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Endres02_B_15_00"); //Hier hast du eine Kleinigkeit.

	B_GiveInvItems	(hero, self, ItMi_Gold, 10);

	AI_Output(self, hero, "Info_Mod_Leonhard_Endres02_B_36_01"); //Damit kann ich mich gerade noch zufrieden geben.

	Info_ClearChoices	(Info_Mod_Leonhard_Endres02);
};

FUNC VOID Info_Mod_Leonhard_Endres02_A()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Endres02_A_15_00"); //Vergiss es.
	AI_Output(self, hero, "Info_Mod_Leonhard_Endres02_A_36_01"); //Puh, das ist ein Genickschlag, du Arsch.

	Info_ClearChoices	(Info_Mod_Leonhard_Endres02);
};

INSTANCE Info_Mod_Leonhard_Bierhexen (C_INFO)
{
	npc		= Mod_7419_OUT_Leonhard_REL;
	nr		= 1;
	condition	= Info_Mod_Leonhard_Bierhexen_Condition;
	information	= Info_Mod_Leonhard_Bierhexen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hast auf die Gerste des Braumeisters uriniert.";
};

FUNC INT Info_Mod_Leonhard_Bierhexen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Melvin_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Leonhard_Bierhexen_Info()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Bierhexen_15_00"); //Du hast auf die Gerste des Braumeisters uriniert.
	AI_Output(self, hero, "Info_Mod_Leonhard_Bierhexen_36_01"); //Na und?
	AI_Output(hero, self, "Info_Mod_Leonhard_Bierhexen_15_02"); //Wieso?
	AI_Output(self, hero, "Info_Mod_Leonhard_Bierhexen_36_03"); //Weil ich voll war. Wir hatten mitbekommen, dass der Braumeister sein erstes Bier fertig hatte, und haben ihm nachts einen Besuch abgestattet.
	AI_Output(self, hero, "Info_Mod_Leonhard_Bierhexen_36_04"); //War echt geil, muss man schon sagen, für das Bier würde ich beinahe was zahlen.
	AI_Output(self, hero, "Info_Mod_Leonhard_Bierhexen_36_05"); //Haben ordentlich Spaß gehabt.
	AI_Output(self, hero, "Info_Mod_Leonhard_Bierhexen_36_06"); //Aber wie das so ist, macht sich irgendwann die Blase bemerkbar.
	AI_Output(self, hero, "Info_Mod_Leonhard_Bierhexen_36_07"); //Wir wollten nicht offensichtlich in die Ecke machen, deshalb hat einer einen Sack aufgehalten und die anderen haben sich erleichtert.
	AI_Output(self, hero, "Info_Mod_Leonhard_Bierhexen_36_08"); //An den Rest des Abends kann ich mich nicht erinnern, aber komisch, dass dem Braumeister nie aufgefallen ist, dass wir sein ganzes Bier gesoffen haben, oder? (lacht)

	B_LogEntry	(TOPIC_MOD_KHORATA_BIERHEXEN, "Leonhard hat zugegeben, dass er der Übeltäter ist. Er ist sich aber sicher, dass er ohne Konsequenzen aus der Sache gehen wird.");

	Mod_Bierhexen = 4;

	Info_ClearChoices	(Info_Mod_Leonhard_Bierhexen);

	Info_AddChoice	(Info_Mod_Leonhard_Bierhexen, "Das wird Konsequenzen haben!", Info_Mod_Leonhard_Bierhexen_B);
	Info_AddChoice	(Info_Mod_Leonhard_Bierhexen, "Was gibst du mir dafür, dass ich es dem Braumeister nicht sage?", Info_Mod_Leonhard_Bierhexen_A);
};

FUNC VOID Info_Mod_Leonhard_Bierhexen_B()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Bierhexen_B_15_00"); //Das wird Konsequenzen haben!
	AI_Output(self, hero, "Info_Mod_Leonhard_Bierhexen_B_36_01"); //(höhnisch) Ja, ja, glaub ich aber auch.

	Info_ClearChoices	(Info_Mod_Leonhard_Bierhexen);
};

FUNC VOID Info_Mod_Leonhard_Bierhexen_A()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Bierhexen_A_15_00"); //Was gibst du mir dafür, dass ich es dem Braumeister nicht erzähle?
	AI_Output(self, hero, "Info_Mod_Leonhard_Bierhexen_A_36_01"); //Hast du 'nen Knall? Was denkste, warum ich es jedem erzähle?
	AI_Output(self, hero, "Info_Mod_Leonhard_Bierhexen_A_36_02"); //Weil es mir schnurz ist, ob der Braumeister davon weiß oder nicht. Der kann mir nichts.
	AI_Output(hero, self, "Info_Mod_Leonhard_Bierhexen_A_15_03"); //Das werden wir ja sehen.

	Info_ClearChoices	(Info_Mod_Leonhard_Bierhexen);
};

INSTANCE Info_Mod_Leonhard_Bierhexen2 (C_INFO)
{
	npc		= Mod_7419_OUT_Leonhard_REL;
	nr		= 1;
	condition	= Info_Mod_Leonhard_Bierhexen2_Condition;
	information	= Info_Mod_Leonhard_Bierhexen2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Leonhard_Bierhexen2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Leonhard_Bierhexen2_Info()
{
	AI_Output(self, hero, "Info_Mod_Leonhard_Bierhexen2_36_00"); //Was glotzt du so? Noch nie einen Menschen bei ehrlicher Arbeit gesehen?
	AI_Output(hero, self, "Info_Mod_Leonhard_Bierhexen2_15_01"); //Sieht bei dir ein wenig ungewöhnlich aus, ja.
	AI_Output(self, hero, "Info_Mod_Leonhard_Bierhexen2_36_02"); //Schnauze halten!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Leonhard_Freudenspender (C_INFO)
{
	npc		= Mod_7419_OUT_Leonhard_REL;
	nr		= 1;
	condition	= Info_Mod_Leonhard_Freudenspender_Condition;
	information	= Info_Mod_Leonhard_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Du siehst aus, als könntest du Freudenspender gebrauchen.";
};

FUNC INT Info_Mod_Leonhard_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Leonhard_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Leonhard_Freudenspender_15_00"); //Du siehst aus, als könntest du Freudenspender gebrauchen.
	AI_Output(self, hero, "Info_Mod_Leonhard_Freudenspender_36_01"); //Wie teuer?
	AI_Output(hero, self, "Info_Mod_Leonhard_Freudenspender_15_02"); //10 Goldmünzen.
	AI_Output(self, hero, "Info_Mod_Leonhard_Freudenspender_36_03"); //Her damit!

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 1);

	B_GiveInvItems	(self, hero, ItMi_Gold, 10);

	Mod_Freudenspender	+= 1;
};

INSTANCE Info_Mod_Leonhard_Pickpocket (C_INFO)
{
	npc		= Mod_7419_OUT_Leonhard_REL;
	nr		= 1;
	condition	= Info_Mod_Leonhard_Pickpocket_Condition;
	information	= Info_Mod_Leonhard_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Leonhard_Pickpocket_Condition()
{
	C_Beklauen	(65, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Leonhard_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Leonhard_Pickpocket);

	Info_AddChoice	(Info_Mod_Leonhard_Pickpocket, DIALOG_BACK, Info_Mod_Leonhard_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Leonhard_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Leonhard_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Leonhard_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Leonhard_Pickpocket);
};

FUNC VOID Info_Mod_Leonhard_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Leonhard_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Leonhard_Pickpocket);

		Info_AddChoice	(Info_Mod_Leonhard_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Leonhard_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Leonhard_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Leonhard_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Leonhard_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Leonhard_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Leonhard_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Leonhard_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Leonhard_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Leonhard_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Leonhard_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Leonhard_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Leonhard_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Leonhard_EXIT (C_INFO)
{
	npc		= Mod_7419_OUT_Leonhard_REL;
	nr		= 1;
	condition	= Info_Mod_Leonhard_EXIT_Condition;
	information	= Info_Mod_Leonhard_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Leonhard_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Leonhard_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};