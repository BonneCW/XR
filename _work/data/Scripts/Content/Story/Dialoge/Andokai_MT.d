INSTANCE Info_Mod_Andokai_Hi (C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_Hi_Condition;
	information	= Info_Mod_Andokai_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andokai_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Andokai_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_12_00"); //(tonlos) Was suchst du hier?

	Info_ClearChoices	(Info_Mod_Andokai_Hi);

	Info_AddChoice	(Info_Mod_Andokai_Hi, "Ich wollte mich nur mal umschauen.", Info_Mod_Andokai_Hi_B);
	Info_AddChoice	(Info_Mod_Andokai_Hi, "Xardas hat mich an dich verwiesen.", Info_Mod_Andokai_Hi_A);
};

FUNC VOID Info_Mod_Andokai_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Andokai_Hi_B_15_00"); //Ich wollte mich nur mal umschauen.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_B_12_01"); //(freudlos) Du bist ja ein lustiges Kerlchen. Sei froh, dass wir unliebsame Besucher nicht mehr ... aus dem Weg räumen.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_B_12_02"); //Wenn du dich nicht bei uns bewerben willst, sieh zu, dass du Land gewinnst.
};

FUNC VOID Info_Mod_Andokai_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Andokai_Hi_A_15_00"); //Xardas hat mich an dich verwiesen. Ich will mich euch anschließen.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_01"); //Xardas? So, so. Und du willst Novize werden? Du siehst schwächlich aus.
	AI_Output(hero, self, "Info_Mod_Andokai_Hi_A_15_02"); //Ich war mal stärker.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_03"); //Wie schön für dich. Wenn Xardas dich für geeignet hält, muss ja was an dir dran sein.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_04"); //Aber ich werde dich nicht aufnehmen, wenn du mir nicht bewiesen hast, wie du uns nützlich sein kannst.
	AI_Output(hero, self, "Info_Mod_Andokai_Hi_A_15_05"); //Was soll ich tun?
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_06"); //Als Erstes musst du mich von deiner Gesinnung überzeugen.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_07"); //Auf Khorinis gibt es ein Kloster der Feuermagier - unserer erbitterten Feinde, wie du sicher weißt.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_08"); //Es kann nicht schaden, wenn du ihnen ein wenig schadest - als Vertrauensbeweis für mich.
	AI_Output(hero, self, "Info_Mod_Andokai_Hi_A_15_09"); //Wie soll ich das anstellen?
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_10"); //Die Magier bunkern in den Tiefen ihrer Gewölbe eine Reliquie, die sie wie ihren Augapfel hüten - den Heiligen Hammer.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_11"); //Würden sie nun feststellen, dass er verschwunden wäre - nun, das wäre sehr spaßig.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_12"); //Du wirst dich also in das Kloster begeben und diesen Hammer stehlen.
	AI_Output(hero, self, "Info_Mod_Andokai_Hi_A_15_13"); //Alles klar. Werde ich denn einfach so ins Kloster gelassen?
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_14"); //Nein. Nur Innosgläubige können das Eingangstor passieren. Es gibt aber rechts neben dem Eingang eine niedrige Mauer, über die du ins Klosterinnere kommst.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_15"); //Um aber nicht aufzufallen, musst du eine Novizenrobe tragen. Wir haben ein grobes Imitat, mit dem du kaum jemanden beeindrucken wirst.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_16"); //Aber die alten Augen von Gorax werden keinen Unterschied feststellen.

	CreateInvItems	(self, ITAR_FAKE_NOV_L, 1);
	B_GiveInvItems	(self, hero, ITAR_FAKE_NOV_L, 1);

	AI_Output(hero, self, "Info_Mod_Andokai_Hi_A_15_17"); //Und wie komme ich an den Hammer? Wird der nicht beschützt?
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_18"); //Natürlich wird er das. Du wirst dir etwas einfallen lassen müssen.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_19"); //Wenn du nicht weiter weißt, frag Bodo in der Stadt. Der hat selbst letztens eine ähnliche Aufgabe erfüllen müssen.
	AI_Output(hero, self, "Info_Mod_Andokai_Hi_A_15_20"); //Dann mache ich mich mal auf den Weg.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_21"); //Warte! Wenn du eh schon im Kloster bist, kannst du auch gleich noch etwas anderes erledigen. Dort ist nämlich Gorax verantwortlich für die Weinproduktion.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_22"); //Wein ist gut, wir brauchen ihn nicht nur für unsere Rituale, sondern auch, weil er ausgezeichnet schmeckt - das muss man den roten Furzknoten lassen.
	AI_Output(self, hero, "Info_Mod_Andokai_Hi_A_12_23"); //Erwirb das Vertrauen von Gorax. Biete ihm an, einen Botengang durchzuführen. Dann nimm den Wein und kehre zurück. Bring ihn Myxir.

	Info_ClearChoices	(Info_Mod_Andokai_Hi);

	Log_CreateTopic	(TOPIC_MOD_ANDOKAI_WEIN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ANDOKAI_WEIN, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_DAEMONENBESCHWOERER, TOPIC_MOD_ANDOKAI_WEIN, "Mein erster Auftrag besteht darin, den Heiligen Hammer zu stehlen, den die Feuermagier irgendwo in den Gewölben ihres Klosters in Khorinis versteckt haben.", "Ich soll mich ins Kloster der Feuermagier begeben und dort Gorax davon überzeugen, mir eine Weinlieferung auszuhändigen, die ich dann zu Myxir bringe.");
	B_LogEntry_NS	(TOPIC_MOD_ANDOKAI_WEIN, "Ich falle im Kloster nicht auf, wenn ich eine Novizenrobe trage. Außerdem muss ich über die Mauer rechts neben dem Eingangstor zum Kloster klettern, um in den Innenhof gelangen zu können.");
	B_LogEntry_NS	(TOPIC_MOD_DAEMONENBESCHWOERER, "Ich falle im Kloster nicht auf, wenn ich eine Novizenrobe trage. Außerdem muss ich über die Mauer rechts neben dem Eingangstor zum Kloster klettern, um in den Innenhof gelangen zu können. Wie ich den Hammer stehle, ohne dass es bemerkt wird, kann mir vielleicht Bodo in der Stadt sagen.");
};

INSTANCE Info_Mod_Andokai_Hammer (C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_Hammer_Condition;
	information	= Info_Mod_Andokai_Hammer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier ist der Hammer.";
};

FUNC INT Info_Mod_Andokai_Hammer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hi))
	&& (Npc_HasItems(hero, ITAR_FAKE_NOV_L) == 1)
	&& (Npc_HasItems(hero, Holy_Hammer_MIS) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andokai_Hammer_Info()
{
	AI_Output(hero, self, "Info_Mod_Andokai_Hammer_15_00"); //Hier ist der Hammer.

	B_GiveInvItems	(hero, self, Holy_Hammer_MIS, 1);

	AI_Output(self, hero, "Info_Mod_Andokai_Hammer_12_01"); //Na gut. Du scheinst kein Problem damit zu haben, gegen die Feuermagier zu arbeiten.
	AI_Output(self, hero, "Info_Mod_Andokai_Hammer_12_02"); //Das ist erfreulich, wenn auch nur eine Grundvoraussetzung.
	AI_Output(self, hero, "Info_Mod_Andokai_Hammer_12_03"); //Die nächste Aufgabe wird dein Durchhaltevermögen, deine Auffassungsgabe und deine Kampfkraft auf die Probe stellen.
	AI_Output(self, hero, "Info_Mod_Andokai_Hammer_12_04"); //Du sollst die Bibliothek dieser Festung finden.
	AI_Output(hero, self, "Info_Mod_Andokai_Hammer_15_05"); //Äh...?
	AI_Output(self, hero, "Info_Mod_Andokai_Hammer_12_06"); //Unter mir befindet sich ein Tor. Dieses Tor führt in einen Irrgarten. Und irgendwo hinter dem Irrgarten ist die Bibliothek.
	AI_Output(self, hero, "Info_Mod_Andokai_Hammer_12_07"); //Ich will wissen, wie man dahin kommt. Du wirst diesen Weg finden.

	Npc_RemoveInvItems	(hero, ITAR_FAKE_NOV_L, 1);

	B_GivePlayerXP	(150);

	B_Göttergefallen(3, 1);

	B_LogEntry	(TOPIC_MOD_DAEMONENBESCHWOERER, "Hinter dem großen Tor auf dem Platz der Festung der Beliaranhänger verbirgt sich ein Irrgarten, der zu einer Bibliothek führen soll. Und ich muss den Weg finden.");
};

INSTANCE Info_Mod_Andokai_WarInBib (C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_WarInBib_Condition;
	information	= Info_Mod_Andokai_WarInBib_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe die Bibliothek gefunden.";
};

FUNC INT Info_Mod_Andokai_WarInBib_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hammer))
	&& (Mod_BibEntdeckt)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andokai_WarInBib_Info()
{
	AI_Output(hero, self, "Info_Mod_Andokai_WarInBib_15_00"); //Ich habe die Bibliothek gefunden.
	AI_Output(self, hero, "Info_Mod_Andokai_WarInBib_12_01"); //Hast du dir auch den Weg gemerkt?

	if (Mod_BeliarStatue_Bibliothek_Dabei)
	{
		AI_Output(hero, self, "Info_Mod_Andokai_WarInBib_15_02"); //Ich habe eine Beliarstatue dort an das Teleportnetz angeschlossen.
		AI_Output(self, hero, "Info_Mod_Andokai_WarInBib_12_03"); //Jemand, der mitdenkt. Du überzeugst mich immer mehr.

		B_GivePlayerXP	(300);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Andokai_WarInBib_15_04"); //Ja. Die richtigen Gänge sind alle geöffnet.
		AI_Output(self, hero, "Info_Mod_Andokai_WarInBib_12_05"); //Das bedeutet, dass es uns nun leichter fallen wird, durch das Labyrinth zu finden.

		B_GivePlayerXP	(200);
	};

	AI_Output(self, hero, "Info_Mod_Andokai_WarInBib_12_06"); //Ich werde meine Magier anweisen, die Bibliothek gründlich zu erforschen.
	AI_Output(self, hero, "Info_Mod_Andokai_WarInBib_12_07"); //Ich wäre bereit, dich als Novize aufzunehmen. Jetzt brauche ich nur noch Xardas' Zustimmung. Er will sich jeden neuen Rekruten ansehen.
	AI_Output(hero, self, "Info_Mod_Andokai_WarInBib_15_08"); //Muss das sein? Ich kenne Xardas doch schon länger.
	AI_Output(self, hero, "Info_Mod_Andokai_WarInBib_12_09"); //Dann wird es ja vielleicht einfacher sein, ihn zu überzeugen.

	B_Göttergefallen(3, 1);

	B_LogEntry	(TOPIC_MOD_DAEMONENBESCHWOERER, "Wenn Xardas sein Einverständnis erklärt, will Andokai mich als Novizen aufnehmen.");

	Wld_InsertNpc	(Mod_7755_KDS_SchwarzerMagier_MT, "LABYRINTH_98");
	Wld_InsertNpc	(Mod_7756_KDS_SchwarzerMagier_MT, "LABYRINTH_98");
	Wld_InsertNpc	(Mod_7757_KDS_SchwarzerMagier_MT, "LABYRINTH_98");
	Wld_InsertNpc	(Mod_7758_KDS_SchwarzerMagier_MT, "LABYRINTH_98");
	Wld_InsertNpc	(Mod_7759_KDS_SchwarzerMagier_MT, "LABYRINTH_98");
};

INSTANCE Info_Mod_Andokai_Skinner (C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_Skinner_Condition;
	information	= Info_Mod_Andokai_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier etwas Sumpfkraut.";
};

FUNC INT Info_Mod_Andokai_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	&& (Npc_HasItems(hero, ItMi_Traumruf) >= 2)
	&& (Npc_HasItems(hero, ItMi_Addon_Joint_02) >= 12)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andokai_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Andokai_Skinner_15_00"); //Ich habe hier etwas Sumpfkraut, Meister der sphärischen Manifestation.
	AI_Output(self, hero, "Info_Mod_Andokai_Skinner_12_01"); //Ausgezeichnet. Damit werde ich mein Wissen um Beliar und die dunkle Magie bestimmt steigern können. Was hast du anzubieten?
	AI_Output(self, hero, "Info_Mod_Andokai_Skinner_12_02"); //Ich nehme zwei Traumrufe, sowie die zwölf schwarze Weise.

	Npc_RemoveInvItems	(hero, ItMi_Traumruf, 2);
	Npc_RemoveInvItems	(hero, ItMi_Addon_Joint_02, 12);

	B_ShowGivenThings	("Sumpfkrautstengel gegeben");

	AI_Output(self, hero, "Info_Mod_Andokai_Skinner_12_03"); //Ich denke, das sollte deine Ausgaben decken.

	CreateInvItems	(self, ItMi_Gold, 750);
	B_GiveInvItems	(self, hero, ItMi_Gold, 750);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "Andokai hat mich für das Sumpfkraut großzügig entlohnt.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Andokai_Moorhexe (C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_Moorhexe_Condition;
	information	= Info_Mod_Andokai_Moorhexe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hörte, dass ihr im Besitz von Verwandlungszaubern seid.";
};

FUNC INT Info_Mod_Andokai_Moorhexe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Moorhexe))
	&& (Knows_MagicSecretsBand6 == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andokai_Moorhexe_Info()
{
	AI_Output(hero, self, "Info_Mod_Andokai_Moorhexe_15_00"); //Ich hörte, dass ihr im Besitz von Verwandlungszaubern seid. Könnte ich vielleicht einige von ihnen erstehen?
	AI_Output(self, hero, "Info_Mod_Andokai_Moorhexe_12_01"); //(abwertend) Ha, da hört sich doch alles auf. Du willst Material, das für unsere unbezahlbaren Forschungen gedacht ist?
	AI_Output(self, hero, "Info_Mod_Andokai_Moorhexe_12_02"); //Du als einfacher Söldner kannst doch bestimmt nicht einmal eine simple Feuerpfeilspruchrolle wirken.
	AI_Output(hero, self, "Info_Mod_Andokai_Moorhexe_15_03"); //Nun, ich war zumindest begabt genug, mir über die Schreine Zutritt zu eurem Kloster zu verschaffen und mich durch ganz Khorinis zu teleportieren.
	AI_Output(hero, self, "Info_Mod_Andokai_Moorhexe_15_04"); //Ich bin gerne bereit, den Nachweis für meinen Umgang mit Runen und Spruchrollen zu erbringen.
	AI_Output(self, hero, "Info_Mod_Andokai_Moorhexe_12_05"); //(Erbost) Was erdreistest du dich, meiner zu spotten?!
	AI_Output(self, hero, "Info_Mod_Andokai_Moorhexe_12_06"); //Ich ... (hält plötzlich inne) Aber warte mal, lass mich nachdenken ... ich habe eine kleine Aufgabe, die zeigen wird, ob du überaus begabt, oder ein völliger Narr bist.
	AI_Output(self, hero, "Info_Mod_Andokai_Moorhexe_12_07"); //Dem Innoskloster wurde bei einem Überfall durch dämonische Kreaturen eine wertvolle Reliquie geraubt, der goldene Stab Pyrmans.
	AI_Output(self, hero, "Info_Mod_Andokai_Moorhexe_12_08"); //Wenn es dir gelingt, mir diesen zu bringen, hast du mich überzeugt.

	Log_CreateTopic	(TOPIC_MOD_NL_STAB, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NL_STAB, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NL_STAB, "Andokai wollte mir nur unter der Bedingung Verwandlungsspruchrollen überlassen,  wenn ich ihm den 'Stab Pyrmans' besorge. Dieser wurde bei dem Überfall dem Kloster der Feuermagier geraubt.");

	B_StartOtherRoutine	(Kobold_11010_NW, "TOT");
};

INSTANCE Info_Mod_Andokai_PyrmansStab (C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_PyrmansStab_Condition;
	information	= Info_Mod_Andokai_PyrmansStab_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andokai_PyrmansStab_Condition()
{
	if (Npc_HasItems(hero, ItMw_PyrmansStab) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andokai_PyrmansStab_Info()
{
	AI_Output(self, hero, "Info_Mod_Andokai_PyrmansStab_12_00"); //(böse) Was willst du hier wieder?! Solange du nicht den Stab hast, brauchst du mir ...
	AI_Output(hero, self, "Info_Mod_Andokai_PyrmansStab_15_01"); //(unterbricht) Ich habe den Stab.
	AI_Output(self, hero, "Info_Mod_Andokai_PyrmansStab_12_02"); //Was?! Du willst mich wohl zum Narren halten. Ich muss dich wohl ...

	B_GiveInvItems	(hero, self, ItMw_PyrmansStab, 1);

	AI_Output(self, hero, "Info_Mod_Andokai_PyrmansStab_12_03"); //... ohh ... wahrhaftig. Ich weiß nicht, was ich sagen soll ... (verlegen) Ähh, das ändert die Sachlage natürlich ...
	AI_Output(self, hero, "Info_Mod_Andokai_PyrmansStab_12_04"); //Hier, nimm diese leicht beschädigte Kaninchenrune.

	B_GiveInvItems	(self, hero, ItRu_TrfRabbit, 1);

	AI_Output(self, hero, "Info_Mod_Andokai_PyrmansStab_12_05"); //Sie ist zwar nicht vollwertig, benötigt dafür aber auch keine magischen Kreise als Grundlage, sie anzuwenden.

	B_GivePlayerXP	(500);

	B_SetTopicStatus	(TOPIC_MOD_NL_STAB, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Andokai_UngeheuerInBib (C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_UngeheuerInBib_Condition;
	information	= Info_Mod_Andokai_UngeheuerInBib_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andokai_UngeheuerInBib_Condition()
{
	if (Mod_BeliarBibScene == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andokai_UngeheuerInBib_Info()
{
	AI_Output(self, hero, "Info_Mod_Andokai_UngeheuerInBib_12_00"); //(zum Helden) Würdest du mitgehen? Ich gebe nicht viel auf diesen Schwächling.

	Info_ClearChoices	(Info_Mod_Andokai_UngeheuerInBib);

	Info_AddChoice	(Info_Mod_Andokai_UngeheuerInBib, "Lass ihn allein gehen.", Info_Mod_Andokai_UngeheuerInBib_B);
	Info_AddChoice	(Info_Mod_Andokai_UngeheuerInBib, "Kein Problem.", Info_Mod_Andokai_UngeheuerInBib_A);
};

FUNC VOID Info_Mod_Andokai_UngeheuerInBib_C()
{
	AI_Output(self, hero, "Info_Mod_Andokai_UngeheuerInBib_C_12_00"); //Dann ist es beschlossen. Ich werde mich nun wieder wichtigen Dingen zuwenden.

	Info_ClearChoices	(Info_Mod_Andokai_UngeheuerInBib);
};

FUNC VOID Info_Mod_Andokai_UngeheuerInBib_B()
{
	AI_Output(hero, self, "Info_Mod_Andokai_UngeheuerInBib_B_15_00"); //Lass ihn allein gehen.

	B_StartOtherRoutine	(Mod_7756_KDS_SchwarzerMagier_MT, "START");

	Info_Mod_Andokai_UngeheuerInBib_C();
};

FUNC VOID Info_Mod_Andokai_UngeheuerInBib_A()
{
	AI_Output(hero, self, "Info_Mod_Andokai_UngeheuerInBib_A_15_00"); //Kein Problem.

	Mod_BeliarBibScene = 3;

	Log_CreateTopic	(TOPIC_MOD_BELIAR_UNGEHEUER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BELIAR_UNGEHEUER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BELIAR_UNGEHEUER, "Ich habe mich bereit erklärt, zusammen mit einem Magier in der Bibliothek nach dem Rechten zu sehen. Dort ist anscheinend etwas Seltsames vorgefallen.");

	Info_Mod_Andokai_UngeheuerInBib_C();
};

INSTANCE Info_Mod_Andokai_UngeheuerInBib2 (C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_UngeheuerInBib2_Condition;
	information	= Info_Mod_Andokai_UngeheuerInBib2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Bibliothek ist wieder sauber.";
};

FUNC INT Info_Mod_Andokai_UngeheuerInBib2_Condition()
{
	if (Mod_BeliarBibScene == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andokai_UngeheuerInBib2_Info()
{
	AI_Output(hero, self, "Info_Mod_Andokai_UngeheuerInBib2_15_00"); //Die Bibliothek ist wieder sauber.
	AI_Output(self, hero, "Info_Mod_Andokai_UngeheuerInBib2_12_01"); //Gute Arbeit. Was hat der Novize angerichtet?
	AI_Output(hero, self, "Info_Mod_Andokai_UngeheuerInBib2_15_02"); //Er hat ein paar sehr alte Kreaturen freigelassen. Aber die sind alle tot.
	AI_Output(self, hero, "Info_Mod_Andokai_UngeheuerInBib2_12_03"); //Ich gebe mir schon so viel Mühe bei der Auswahl der Novizen. Wieso werde ich trotzdem mit solchen Dummköpfen gestraft?
	AI_Output(hero, self, "Info_Mod_Andokai_UngeheuerInBib2_15_04"); //Das weiß allein Beliar.
	AI_Output(self, hero, "Info_Mod_Andokai_UngeheuerInBib2_12_05"); //Recht hast du. Ich werde die Aufnahmebedingungen verschärfen.

	B_GivePlayerXP	(400);

	B_SetTopicStatus	(TOPIC_MOD_BELIAR_UNGEHEUER, LOG_SUCCESS);

	B_StartOtherRoutine	(Mod_7755_KDS_SchwarzerMagier_MT, "START");
	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Andokai_Bibliothek1 (C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_Bibliothek1_Condition;
	information	= Info_Mod_Andokai_Bibliothek1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Woher weißt du von der Bibliothek?";
};

FUNC INT Info_Mod_Andokai_Bibliothek1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hammer))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andokai_WarInBib))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andokai_Bibliothek1_Info()
{
	AI_Output(hero, self, "Info_Mod_Andokai_Bibliothek1_15_00"); //Woher weißt du von der Bibliothek?
	AI_Output(self, hero, "Info_Mod_Andokai_Bibliothek1_12_01"); //Die beiden Bewohner der Festung erzählten uns davon, als wir herkamen. Aber selbst auf der Folter wollten sie uns nicht den Weg durch den Irrgarten verraten.
	AI_Output(self, hero, "Info_Mod_Andokai_Bibliothek1_12_02"); //Seitdem haben wir schon einige Novizenanwärter hinein geschickt, doch entweder kamen sie gar nicht zurück oder erfolglos.
	AI_Output(self, hero, "Info_Mod_Andokai_Bibliothek1_12_03"); //Das Labyrinth scheint mehr zu beinhalten als nur ein paar Sackgassen.
};

INSTANCE Info_Mod_Andokai_Bibliothek2 (C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_Bibliothek2_Condition;
	information	= Info_Mod_Andokai_Bibliothek2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was willst du dort?";
};

FUNC INT Info_Mod_Andokai_Bibliothek2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hammer))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andokai_WarInBib))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andokai_Bibliothek2_Info()
{
	AI_Output(hero, self, "Info_Mod_Andokai_Bibliothek2_15_00"); //Was willst du dort?
	AI_Output(self, hero, "Info_Mod_Andokai_Bibliothek2_12_01"); //Die Bibliothek soll riesig sein. Wer weiß, was sich dort für alte Schätze und Weisheiten verbergen.
	AI_Output(self, hero, "Info_Mod_Andokai_Bibliothek2_12_02"); //Was man so aufwändig verstecken muss, wird ein wenig Ausdauer wert sein.
};

INSTANCE Info_Mod_Andokai_Infos (C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_Infos_Condition;
	information	= Info_Mod_Andokai_Infos_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe noch ein paar allgemeinere Fragen...";
};

FUNC INT Info_Mod_Andokai_Infos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andokai_Infos_Info()
{
	AI_Output(hero, self, "Info_Mod_Andokai_Infos_15_00"); //Ich habe noch ein paar allgemeinere Fragen...
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_12_01"); //Was gibt's?

	Info_ClearChoices	(Info_Mod_Andokai_Infos);

	Info_AddChoice	(Info_Mod_Andokai_Infos, DIALOG_BACK, Info_Mod_Andokai_Infos_BACK);

	Info_AddChoice	(Info_Mod_Andokai_Infos, "Erzähl mir etwas über Beliar.", Info_Mod_Andokai_Infos_C);
	Info_AddChoice	(Info_Mod_Andokai_Infos, "Erzähl mir etwas über die Festung.", Info_Mod_Andokai_Infos_B);
	Info_AddChoice	(Info_Mod_Andokai_Infos, "Erzähl mir etwas über die Schwarzmagier.", Info_Mod_Andokai_Infos_A);
};

FUNC VOID Info_Mod_Andokai_Infos_BACK()
{
	Info_ClearChoices	(Info_Mod_Andokai_Infos);
};

FUNC VOID Info_Mod_Andokai_Infos_C()
{
	AI_Output(hero, self, "Info_Mod_Andokai_Infos_C_15_00"); //Erzähl mir etwas über Beliar.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_C_12_01"); //Beliar ist der Gott des Chaos und im ewigen Krieg mit Innos, dem Gott der Korinthenkackerei.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_C_12_02"); //Beliar fördert schrankenloses Denken und hält nichts von verkalkten Traditionen, die ohne Sinn und Verstand heruntergeleiert werden.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_C_12_03"); //Seine Anhänger sind deshalb größtenteils Freigeister und Mutige, die sich keine Gesetze auferlegen lassen.

	Info_ClearChoices	(Info_Mod_Andokai_Infos);
};

FUNC VOID Info_Mod_Andokai_Infos_B()
{
	AI_Output(hero, self, "Info_Mod_Andokai_Infos_B_15_00"); //Erzähl mir etwas über die Festung.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_B_12_01"); //Die Festung hat früher einmal Partisanen im Kampf gegen die Orks Schutz geboten.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_B_12_02"); //Nach dem Ende des Kriegs wurde der hier ansässige Anführer geadelt und durfte sie behalten.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_B_12_03"); //Als wir sie fanden, wurde sie gerade mal von zwei alten Leuten bewohnt, einem heruntergekommenen Nachfahren des Anführers und seinem Diener.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_B_12_04"); //Die beiden waren zu schwach, um vor uns wegzulaufen. Also nahmen wir die Festung in Besitz.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_B_12_05"); //Seitdem sind schon Jahre vergangen. Doch dieses Gemäuer hat noch längst nicht alle seine Geheimnisse gelüftet.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_B_12_06"); //Immerhin bietet es alles, was wir brauchen, im Übermaß.

	Info_ClearChoices	(Info_Mod_Andokai_Infos);
};

FUNC VOID Info_Mod_Andokai_Infos_A()
{
	AI_Output(hero, self, "Info_Mod_Andokai_Infos_A_15_00"); //Erzähl mir etwas über die Schwarzmagier.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_A_12_01"); //Unserer gibt es viele, aber wir bleiben üblicherweise im Verborgenen.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_A_12_02"); //Du findest uns in hohen Ämtern wie auch als unbescholtene Bürger, und du könntest unsere Häuser durchsuchen und würdest nichts von unserer Gesinnung bemerken.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_A_12_03"); //Wir haben gelernt, unauffällig zu leben. Ich beispielsweise wurde nur in die Barriere geworfen, weil ich mich einem Arbeiterprotest angeschlossen hatte.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_A_12_04"); //Was zuerst wie ein harter Schicksalsschlag aussah, erwies sich als das größte Glück meines Lebens.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_A_12_05"); //Zusammen mit anderen Genossen fand ich diese alte Festung, wo wir unseren Glauben zum ersten Mal offen ausleben konnten.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_A_12_06"); //Durch den Fall der Barriere ist es nicht ganz so besinnlich ruhig geblieben.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_A_12_07"); //Xardas hat uns ein paar verirrte Seelen aus dem Alten Lager gebracht, deren Hirne wir nach unseren Vorstellungen formen konnten, nachdem ihr Gedächtnis gelöscht worden war.
	AI_Output(self, hero, "Info_Mod_Andokai_Infos_A_12_08"); //Dadurch sind wir mittlerweile zu einer stattlichen Truppe herangewachsen.

	Info_ClearChoices	(Info_Mod_Andokai_Infos);
};

INSTANCE Info_Mod_Andokai_WoKloster (C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_WoKloster_Condition;
	information	= Info_Mod_Andokai_WoKloster_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo finde ich das Kloster?";
};

FUNC INT Info_Mod_Andokai_WoKloster_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andokai_WoKloster_Info()
{
	AI_Output(hero, self, "Info_Mod_Andokai_WoKloster_15_00"); //Wo finde ich das Kloster?
	AI_Output(self, hero, "Info_Mod_Andokai_WoKloster_12_01"); //Mach dich auf den Weg nach Khorinis. Vom nördlichen Stadttor aus wende dich Richtung Taverne Zur toten Harpie. Von dort führt ein Pfad direkt zum Kloster.
	AI_Output(self, hero, "Info_Mod_Andokai_WoKloster_12_02"); //Vielleicht findest du ja in Khorinis auch einen Trottel, der dich hinführt.
};

instance Info_Mod_Andokai_Runen	(C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_Runen_Condition;
	information	= Info_Mod_Andokai_Runen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Unterweise mich (Runen erschaffen)";
};

func int Info_Mod_Andokai_Runen_Condition ()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hi))
	&& ((Mod_Gilde == 12)
	|| (Mod_Gilde == 13)
	|| (Mod_Gilde == 14))
	{
		return 1;
	};
};

func void Info_Mod_Andokai_Runen_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "Info_Mod_Andokai_Runen_15_00"); //Unterweise mich.
	
	Info_ClearChoices 	(Info_Mod_Andokai_Runen);
	Info_AddChoice		(Info_Mod_Andokai_Runen, DIALOG_BACK, Info_Mod_Andokai_Runen_BACK);
	
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) >= 6)
	{
		if (PLAYER_TALENT_RUNES [SPL_Skull] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_Skull, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Skull)), Info_Mod_Andokai_Runen_Skull);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,Info_Mod_Andokai_Runen_ArmyOfDarkness);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 5)
	{
		if (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_SummonDemon, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_SummonDemon)), Info_Mod_Andokai_Runen_SummonDemon);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_BreathOfDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_BreathOfDeath)) ,Info_Mod_Andokai_Runen_BreathOfDeath);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_FullHeal] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_FullHeal, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_FullHeal)), Info_Mod_Andokai_Runen_FullHeal);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 4)
	{
		if (PLAYER_TALENT_RUNES [SPL_SummonZombie] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_SummonZombie, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_SummonZombie)), Info_Mod_Andokai_Runen_SummonZombie);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_SummonGolem, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_SummonGolem)), Info_Mod_Andokai_Runen_SummonGolem);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_DestroyUndead] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_DestroyUndead, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_DestroyUndead)), Info_Mod_Andokai_Runen_DestroyUndead);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 3)
	{
		if (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_SummonSkeleton, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_SummonSkeleton)), Info_Mod_Andokai_Runen_SummonSkeleton);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_MediumHeal] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_MediumHeal, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_MediumHeal)), Info_Mod_Andokai_Runen_MediumHeal);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_SummonGuardian] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_SummonGuardian, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_SummonGuardian)), Info_Mod_Andokai_Runen_SummonGuardian);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_EnergyBall] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_BeliarsRage, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_EnergyBall)), Info_Mod_Andokai_Runen_BeliarsRage);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 2)
	{
		if (PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)), Info_Mod_Andokai_Runen_SummonGoblinSkeleton);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	{
		if (PLAYER_TALENT_RUNES [SPL_Light] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_Light, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Light)), Info_Mod_Andokai_Runen_Light);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_LightHeal] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_LightHeal, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_LightHeal)), Info_Mod_Andokai_Runen_LightHeal);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_SummonWolf, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_SummonWolf)), Info_Mod_Andokai_Runen_SummonWolf);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_SuckEnergy] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Andokai_Runen, B_BuildLearnString (NAME_SPL_SuckEnergy, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_SuckEnergy)), Info_Mod_Andokai_Runen_SuckEnergy);
			abletolearn = (abletolearn +1);
		};
	};

	if (abletolearn < 1)
	{
		AI_Output (self, other, "Info_Mod_Andokai_Runen_12_01"); //Es gibt nichts mehr, das ich dir beibringen könnte.
	};
};

FUNC VOID Info_Mod_Andokai_Runen_BACK()
{
	Info_ClearChoices 	(Info_Mod_Andokai_Runen);
};

FUNC VOID Info_Mod_Andokai_Runen_Light()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Light);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_Light) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_Light, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_LightHeal()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_LightHeal);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_LightHeal) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_LightHeal, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_SummonWolf()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonWolf);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_SumWolf) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_SumWolf, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_SuckEnergy()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SuckEnergy);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_SuckEnergy) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_SuckEnergy, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_Zerfleischen()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Zerfleischen);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_Zerfleischen) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_Zerfleischen, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_SummonGoblinSkeleton()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonGoblinSkeleton);
	
	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_SumGobSkel) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_SumGobSkel, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_SummonGuardian()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonGuardian);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_SummonGuardian) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_SummonGuardian, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_SummonZombie()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonZombie);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_SummonZombie) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_SummonZombie, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_SummonGolem()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonGolem);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_SumGol) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_SumGol, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_DestroyUndead()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_DestroyUndead);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_HarmUndead) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_HarmUndead, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_BeliarsRage()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_EnergyBall);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_BeliarsRage) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_BeliarsRage, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_MediumHeal()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_MediumHeal);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_MediumHeal) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_MediumHeal, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_SummonSkeleton()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonSkeleton);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_SumSkel) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_SumSkel, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_SummonDemon()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonDemon);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_SumDemon) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_SumDemon, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_BreathOfDeath()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_BreathOfDeath);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_BreathOfDeath) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_BreathOfDeath, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_Skull()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Skull);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_Skull) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_Skull, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_FullHeal()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_FullHeal);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_FullHeal) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_FullHeal, 1);
	};
};

FUNC VOID Info_Mod_Andokai_Runen_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_ArmyOfDarkness);

	if (Npc_HasItems(Mod_515_KDS_Myxir_MT, ItSc_ArmyOfDarkness) == 0)
	{
		CreateInvItems	(Mod_515_KDS_Myxir_MT, ItSc_ArmyOfDarkness, 1);
	};
};

INSTANCE Info_Mod_Andokai_Pickpocket (C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_Pickpocket_Condition;
	information	= Info_Mod_Andokai_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Andokai_Pickpocket_Condition()
{
	C_Beklauen	(170, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Andokai_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Andokai_Pickpocket);

	Info_AddChoice	(Info_Mod_Andokai_Pickpocket, DIALOG_BACK, Info_Mod_Andokai_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Andokai_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Andokai_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Andokai_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Andokai_Pickpocket);
};

FUNC VOID Info_Mod_Andokai_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Andokai_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Andokai_Pickpocket);

		Info_AddChoice	(Info_Mod_Andokai_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Andokai_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Andokai_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Andokai_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Andokai_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Andokai_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Andokai_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Andokai_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Andokai_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Andokai_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Andokai_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Andokai_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Andokai_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Andokai_EXIT (C_INFO)
{
	npc		= Mod_473_DMB_Andokai_MT;
	nr		= 1;
	condition	= Info_Mod_Andokai_EXIT_Condition;
	information	= Info_Mod_Andokai_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Andokai_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Andokai_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};