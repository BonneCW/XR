INSTANCE Info_Mod_Cronos_AW_Artefakt_01 (C_INFO)
{
	npc		= Mod_9001_KDW_Cronos_AW;
	nr		= 1;
	condition	= Info_Mod_Cronos_AW_Artefakt_01_Condition;
	information	= Info_Mod_Cronos_AW_Artefakt_01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe gehört, ihr wäret einem Artefakt auf der Spur ...";
};

FUNC INT Info_Mod_Cronos_AW_Artefakt_01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_05))
	&& (Mod_Cronos_Artefakt == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_01_Info()
{
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_01_15_00"); //Ich habe gehört, ihr wäret einem Artefakt auf der Spur ...
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_04_01"); //Ahh, Saturas hat dir davon berichtet ... Nun, es sind eher Vermutungen, leise Hoffnungen, als echte Spuren.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_04_02"); //Ach, es ist eigentlich sehr unwahrscheinlich, fast töricht ernsthaft in Erwägung zu ziehen, dass etwas dran sein könnte.

	Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_01);

	Info_AddChoice	(Info_Mod_Cronos_AW_Artefakt_01, "Meine Neugier wurde geweckt.", Info_Mod_Cronos_AW_Artefakt_01_B);
	Info_AddChoice	(Info_Mod_Cronos_AW_Artefakt_01, "Verstehe. Dann gehe ich mal weiter meinen Pflichten nach.", Info_Mod_Cronos_AW_Artefakt_01_A);
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_01_D()
{
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_00"); //Die Umschreibungen über dieses Untier erinnerten mich an Geschehnisse, die bereits mehr als 200 Jahre zurückliegen.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_01"); //Die Überlieferungen geben preis, dass damals ein mächtiges Artefakt – der Kristall der Absorption - in einem Adanostempel auf der Insel Khorinis gelagert gewesen sein soll.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_02"); //Doch ein trügerischer und gieriger Novize bemächtigte sich der Schätze des Tempels, brachte den Hüter dieser Heiligtümer um und verscharrte seinen Leichnam in der Wildnis.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_03"); //Als die anderen Adanosmagier nun den Raub der Schätze bemerkten und das Verschwinden ihres Hüters, kamen viele zu der Vermutung, dass er es war, der den Schatz raubte und dann floh.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_04"); //Doch einem der Wassermagier sandte Adanos einen Traum, in welchem der Ermordete sein Schicksal beklagte: dass er von einem Diener Adanos gemeuchelt und seine sterblichen Überreste dem Verzehr von wilden Tieren preisgegeben worden waren.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_05"); //Infolge dessen leitete man eine Untersuchung ein, in welcher sich die Hinweise auf den schändlichen Novizen verdichteten.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_06"); //Als man diesen nun verhörte, schwor er, nichts von allem zu wissen und beschwor offen Adanos, er möge doch Zeugnis von seinem reinen Wesen abgeben.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_07"); //Adanos soll durch das frevelhafte Verhalten des Novizen so erzürnt gewesen sein, dass er ihn im gleichen Augenblick vor den Augen aller in die blutrünstige Bestie verwandelte, die seinem Wesen entsprach.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_08"); //Die Magier richteten erschrocken ihre Magie gegen das Untier, was jedoch keine Wirkung zu haben schien.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_09"); //Fauchend nahm es Reißaus und entfloh in die umliegenden Wälder. Dort soll es noch einige Male Jägern begegnet sein, deren Waffen ebenfalls wirkungslos blieben.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_10"); //Unter den Sachen des Novizen fanden die Magier indessen einige der geraubten Schätze, jedoch nicht das bedeutsame Artefakt.
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_01_D_15_11"); //Folglich muss es sich noch im Besitz des Novizen, ähh, Untiers befinden?
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_12"); //Ja, so die Vermutung. Nur verschwand das Untier nach einigen Jahren spurlos.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_13"); //Und jetzt, nach so vielen Jahrzehnten, der erste mögliche Hinweis, obwohl doch so unwahrscheinlich.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_14"); //Das Wesen könnte ja einen völlig anderen Ursprung haben, und selbst wenn es dem der Überlieferungen entsprechen sollte, wäre es immer noch fraglich, ob das Artefakt sich noch in seinem Besitz befindet.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_D_04_15"); //Abgesehen davon, dass der göttliche Schutzzauber verhindert, seiner elenden Existenz ein Ende zu bereiten ...
	
	Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_01);

	Info_AddChoice	(Info_Mod_Cronos_AW_Artefakt_01, "Und selbst wenn die Wahrscheinlichkeit noch so gering scheint (...)", Info_Mod_Cronos_AW_Artefakt_01_F);
	Info_AddChoice	(Info_Mod_Cronos_AW_Artefakt_01, "Dann sollte man sich lieber den anderen Dingen widmen (...)", Info_Mod_Cronos_AW_Artefakt_01_E);
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_01_B()
{
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_01_B_15_00"); //Meine Neugier wurde geweckt. Was ist das für ein geheimnisvoller Sachverhalt, der dich beschäftigt?
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_B_04_01"); //Nun, zuerst waren es nur Gerüchte, die von einer blutrünstigen Bestie berichteten, welche mit einem unbändigen Appetit auf Fleisch über das Land ziehen soll.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_B_04_02"); //Es wurde berichtet, sie würde weder durch gewöhnliche Waffen noch durch von Menschen gewirkte Magie Schaden erleiden.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_B_04_03"); //Ich schenkte diesen Berichten zunächst nicht viel Beachtung, hielt es für Hirngespinste und Flunkereien einfacher Leute.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_B_04_04"); //Aber in letzter Zeit häuften sich solche Meldungen und sogar Bauernhöfe rund um die Stadt und Onars Hof sollen schon von der Bestie überfallen worden sein.

	Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_01);

	Info_AddChoice	(Info_Mod_Cronos_AW_Artefakt_01, "(weiter)", Info_Mod_Cronos_AW_Artefakt_01_D);
	Info_AddChoice	(Info_Mod_Cronos_AW_Artefakt_01, "Aber was hat das nun alles mit einem Artefakt zu tun?", Info_Mod_Cronos_AW_Artefakt_01_C);
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_01_C()
{
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_01_C_15_00"); //Aber was hat das nun alles mit einem Artefakt zu tun?
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_C_04_01"); //So hab doch ein wenig Geduld. Ich wollte gerade darauf zu sprechen kommen.
	
	Info_Mod_Cronos_AW_Artefakt_01_D();
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_01_A()
{
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_01_A_15_00"); //Verstehe. Dann gehe ich mal weiter meinen Pflichten nach.

	Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_01);

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_NOVIZE, LOG_FAILED);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_01_F()
{
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_01_F_15_00"); //Und selbst wenn die Wahrscheinlichkeit noch so gering scheint: für ein Artefakt, das dazu verhelfen kann, den Willen unseres Herrn Adanos zu wirken, müssen auch Risiken und Mühen aufgeboten werden. Ich werde mich auf die Suche danach begeben.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_F_04_01"); //(erfreut) Im Stillen hatte ich gehofft, dass du dich dazu bereit erklären würdest. Aber setze dich bei deiner Suche um Adanos willen keinen unnötigen Risiken aus.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_F_04_02"); //Versuch zunächst bei den kleineren Bauernhöfen und den Jägern der Umgebung mehr in Erfahrung zu bringen.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_F_04_03"); //Vielleicht stellt sich ja dann schon heraus, ob überhaupt etwas an der Sache dran ist, oder nicht. Aber falls doch ... hier hast du einige Spruchrollen und Tränke, die dir auf der Suche bestimmt nützlich sein werden.

	B_ShowGivenThings ("10 Tränke und 7 Spruchrollen erhalten");

	CreateInvItems	(hero, ItPo_Mana_01, 7);
	CreateInvItems	(hero, ItPo_Speed, 3);
	CreateInvItems	(hero, ItSc_Icecube, 4);
	CreateInvItems	(hero, ItSc_LightHeal, 3);

	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_F_04_04"); //Und vergiss nicht, dieses Wesen soll jeder Art von Menschenhand gewirkter Magie und geführter Waffen standhalten können.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_F_04_05"); //Deine Wassermagie wird ihm also – wenn überhaupt - nur kurze Zeit Einhalt gebieten können ...
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_F_04_06"); //Und nun wünsche ich dir viel Erfolg. Adanos möge dich auf deinen Wegen behüten.
	
	Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_01);

	Mod_Cronos_Artefakt = 1;

	B_LogEntry	(TOPIC_MOD_ADANOS_NOVIZE, "Ich soll mich auf den Bauernhöfen der Umgebung und den Jägern umhören, um so vielleicht auf die Spur eines Untieres zu stoßen, das gegen Magie und gewöhnliche Waffen resistent sein soll, um ihm den Kristall der Absorption zu entreißen – sofern es ihn noch bei sich trägt.");
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_01_E()
{
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_01_E_15_00"); //Dann sollte man sich lieber den anderen Dingen widmen, die unsere Aufmerksamkeit und Hingabe erfordern.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_01_E_04_01"); //(enttäuscht) Ja, du hast wohl Recht, es ist vernünftiger ...
	
	Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_01);

	AI_StopProcessInfos	(self);

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_NOVIZE, LOG_FAILED);
};

INSTANCE Info_Mod_Cronos_AW_Artefakt_02 (C_INFO)
{
	npc		= Mod_9001_KDW_Cronos_AW;
	nr		= 1;
	condition	= Info_Mod_Cronos_AW_Artefakt_02_Condition;
	information	= Info_Mod_Cronos_AW_Artefakt_02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Artefakt.";
};

FUNC INT Info_Mod_Cronos_AW_Artefakt_02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_01))
	&& (Mod_Cronos_Artefakt == 2)
	&& (Mod_AbsorbKristall == 1)
	&& (Npc_HasItems(hero, ItMi_AbsorbKristall) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_02_Info()
{
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_02_15_00"); //Ich habe das Artefakt.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_02_04_01"); //(ungläubig) Was?! Du willst mich doch auf den Arm nehmen ...

	B_GiveInvItems	(hero, self, ItMi_AbsorbKristall, 1);

	Npc_RemoveInvItems	(self, ItMi_AbsorbKristall, 1);

	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_02_04_02"); //Nicht möglich ... wo, wie ...
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_02_15_03"); //Zwischen viel Unrat und Schmutz.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_02_04_04"); //Ich weiß nicht, was ich sagen soll. Den Wert dieses Dienstes, den du der Gemeinschaft Adanos' erwiesen hast, kann ich kaum in Worte fassen.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_02_04_05"); //Ich muss mich darüber mit meinen Brüdern beraten. Komm morgen wieder.

	B_GivePlayerXP	(400);

	Mod_Cronos_Artefakt = 3;

	Mod_Cronos_AbsorberTest = Wld_GetDay();

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_NOVIZE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Cronos_AW_Artefakt_03 (C_INFO)
{
	npc		= Mod_9001_KDW_Cronos_AW;
	nr		= 1;
	condition	= Info_Mod_Cronos_AW_Artefakt_03_Condition;
	information	= Info_Mod_Cronos_AW_Artefakt_03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cronos_AW_Artefakt_03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_02))
	&& (Wld_GetDay() > Mod_Cronos_AbsorberTest)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_03_Info()
{
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_03_04_00"); //Wie wir feststellen mussten, hat der Kristall zwar leider mittlerweile seine Kraft eingebüßt.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_03_04_01"); //Aber die Möglichkeiten, ihm wieder seine Kraft zu schenken, haben wir noch kaum ergründet.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_03_04_02"); //Nun aber zu deiner mehr als verdienten Belohnung. Myxir hat zuletzt einige alte Schriften übersetzt und daraus diese Anleitung zum Schmieden eines magischen Ringes unseres Herrn gewonnen.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_03_04_03"); //Hier, du sollst der Erste sein, dem die Macht dieses Ringes zuteil wird.

	B_GiveInvItems	(self, hero, ItWr_Bauplan_AdanosRing, 1);

	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_03_04_04"); //Ansonsten überlasse ich dir noch als würdigen Diener Adanos’ einige unserer wertvollen Spruchrollen und Tränke. Nutze sie weise.

	CreateInvItems	(hero, ItPo_Mana_01, 5);
	CreateInvItems	(hero, ItPo_Mana_02, 5);
	CreateInvItems	(hero, ItPo_Mana_03, 5);
	CreateInvItems	(hero, ItSc_IceCube, 3);
	CreateInvItems	(hero, ItSc_IceWave, 2);
	CreateInvItems	(hero, ItSc_IceRain, 1);
	CreateInvItems	(hero, ItSc_Thunderball, 3);

	B_ShowGivenThings ("15 Tränke und 9 Spruchrollen erhalten");

	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_03_04_05"); //Achso, wie töricht von mir, bei aller Aufregung um den Kristall unseres Herrn vergaß ich ganz, mich nach dem Schicksal des verfluchten Novizen zu erkundigen.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_03_04_06"); //So berichte: Wie steht es um die verwünschte Kreatur.

	if (Mod_Untier_Tot == FALSE)
	{
		AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_03_15_07"); //Sie fristet ihr Dasein in einer Höhle auf einem Berg im Nordosten von Khorinis.
		AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_03_04_08"); //Hmm, ich will hoffen, dass sie die Umgebung in Zukunft nicht zu sehr verheeren wird ...
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_03_15_09"); //Sie wird kein Unheil mehr anrichten.
		AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_03_04_10"); //Du willst doch damit nicht etwas sagen, dass du sie bezwingen konntest?
		AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_03_15_11"); //Nicht allen Mitteln vermochte der Schutzzauber zu widerstehen.
		AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_03_04_12"); //Erneut macht mich deine Kühnheit fast sprachlos. Damit hast du ganz Khornis einen großen Dienst erwiesen.
		AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_03_04_13"); //Hier, nimm diesen Trank und eine Rune deiner Wahl als Belohnung.

		B_GivePlayerXP	(350);

		B_GiveInvItems	(self, hero, ItPo_Perm_Mana, 1);

		Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_03);

		Info_AddChoice	(Info_Mod_Cronos_AW_Artefakt_03, "Eislanze", Info_Mod_Cronos_AW_Artefakt_03_H);
		Info_AddChoice	(Info_Mod_Cronos_AW_Artefakt_03, "Eisball", Info_Mod_Cronos_AW_Artefakt_03_G);
		Info_AddChoice	(Info_Mod_Cronos_AW_Artefakt_03, "Leichte Wunden heilen", Info_Mod_Cronos_AW_Artefakt_03_E);
		Info_AddChoice	(Info_Mod_Cronos_AW_Artefakt_03, "Wolf rufen", Info_Mod_Cronos_AW_Artefakt_03_D);
		Info_AddChoice	(Info_Mod_Cronos_AW_Artefakt_03, "Blitz", Info_Mod_Cronos_AW_Artefakt_03_B);
		Info_AddChoice	(Info_Mod_Cronos_AW_Artefakt_03, "Licht", Info_Mod_Cronos_AW_Artefakt_03_A);
	};

	B_Göttergefallen(2, 2);
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_03_H()
{
	B_GiveInvItems	(self, hero, ItRu_Icelance, 1);

	Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_03);
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_03_G()
{
	B_GiveInvItems	(self, hero, ItRu_InstantIceball, 1);

	Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_03);
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_03_F()
{
	B_GiveInvItems	(self, hero, ItRu_SumGobEis, 1);

	Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_03);
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_03_E()
{
	B_GiveInvItems	(self, hero, ItRu_LightHeal, 1);

	Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_03);
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_03_D()
{
	B_GiveInvItems	(self, hero, ItRu_SumWolf, 1);

	Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_03);
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_03_C()
{
	B_GiveInvItems	(self, hero, ItRu_Icebolt, 1);

	Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_03);
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_03_B()
{
	B_GiveInvItems	(self, hero, ItRu_Zap, 1);

	Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_03);
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_03_A()
{
	B_GiveInvItems	(self, hero, ItRu_Light, 1);

	Info_ClearChoices	(Info_Mod_Cronos_AW_Artefakt_03);
};

INSTANCE Info_Mod_Cronos_AW_Artefakt_04 (C_INFO)
{
	npc		= Mod_9001_KDW_Cronos_AW;
	nr		= 1;
	condition	= Info_Mod_Cronos_AW_Artefakt_04_Condition;
	information	= Info_Mod_Cronos_AW_Artefakt_04_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich könnte deinen Rat gebrauchen.";
};

FUNC INT Info_Mod_Cronos_AW_Artefakt_04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_03))
	&& (Mod_WM_ArtefaktSammler == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_04_Info()
{
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_04_15_00"); //Ich könnte deinen Rat gebrauchen.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_04_04_01"); //Worum geht es?
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_04_15_02"); //Den Kristall der Absorption. Saturas berichtete mir, dass nur ein göttlicher Bote dazu in der Lage wäre, seine Macht wieder herzustellen.
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_04_15_03"); //Was hat es mit diesem göttlichen Boten auf sich und wo kann ich einen solchen finden?
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_04_04_04"); //Das dürfte ein schweres Unterfangen werden. Die letzte Spur eines göttlichen Boten weist nach Jharkendar. Es scheint viele Jahrhunderte zurückzuliegen, vor dem Untergang der alten Kultur.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_04_04_05"); //Ich konnte aus ihren alten Schriften entnehmen, dass ein mächtiger Gott – welcher, konnte ich nicht entziffern - einst seinen Blick auf die Erde schweifen ließ und Ausschau nach jemandem hielt, der würdig sein konnte, das Gleichgewicht auf der Erde zu erhalten.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_04_04_06"); //Er musste jedoch feststellen, dass jeder der einen oder anderen Seite mehr zugeneigt war. Doch dann fiel sein Blick und seine Gunst auf jemanden, den er zu seinem Diener erwählte und einen Teil seiner göttlichen Macht zukommen ließ.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_04_04_07"); //Leider sind an dieser Stelle die Schriften stark verwittert. Das Symbol könnte für ein Landlebewesen stehen, vermutlich ein Tier, welches vielleicht eine Art Wappentier seines erwählten Dieners sein könnte.
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_04_15_08"); //Und gegeben der Fall, ich wollte diesen göttlichen Boten dennoch finden. Wie müsste ich vorgehen?
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_04_04_09"); //Hmm, du müsstest dazu einen Opferaltar des alten Volkes ausfindig machen und ein Opferritual ausführen. Ich habe ein altes Rezept zu Teilen entschlüsseln können, das dazu diente, übernatürliche Wesen und Geister herbeizurufen.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_04_04_10"); //Leider konnte ich die letzte Zutat nicht entziffern. Aber es sollte sich um etwas Essbares handeln. Du müsstest schon etwas herumprobieren und darauf hoffen, keine bösen Geister und dämonischen Wesen auf den Plan zu rufen.

	B_GiveInvItems	(self, hero, ItWr_CronosAbsorbKristall, 1);

	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_04_04_11"); //Aber falls du es wirklich versuchen solltest, übergebe ich dir hiermit den Kristall. Gib gut auf ihn acht.

	B_GiveInvItems	(self, hero, ItMi_AbsorbKristall, 1);

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Von Cronos habe ich den Kristall der Absorption erhalten, sowie ein Rezept, mit dessen Hilfe ich einen göttlichen Boten herbeirufen kann. Das Ritual muss an einem Opferaltar der alten Kultur erfolgen, wobei die letzte Zutat unbekannt ist, wohl aber etwas Essbares sein wird. Cronos meinte, dass für den göttlichen Boten das Symbol für ein Landlebewesen abgebildet wurde, welches seiner Vermutung nach ein Wappentier sein könnte.");
};

INSTANCE Info_Mod_Cronos_AW_Artefakt_05 (C_INFO)
{
	npc		= Mod_9001_KDW_Cronos_AW;
	nr		= 1;
	condition	= Info_Mod_Cronos_AW_Artefakt_05_Condition;
	information	= Info_Mod_Cronos_AW_Artefakt_05_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Macht des Kristalles ist wiederhergestellt.";
};

FUNC INT Info_Mod_Cronos_AW_Artefakt_05_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AdanosDog_Kristall))
	&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cronos_AW_Artefakt_05_Info()
{
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Artefakt_05_15_00"); //Die Macht des Kristalles ist wiederhergestellt.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Artefakt_05_04_01"); //Was?! Nicht möglich ... Bring ihn schnell zu Satruras. Er kann eine mächtige waffe im kampf gegen die Ungetüme sein.
};

INSTANCE Info_Mod_Cronos_AW_Zeremoniendolch (C_INFO)
{
	npc		= Mod_9001_KDW_Cronos_AW;
	nr		= 1;
	condition	= Info_Mod_Cronos_AW_Zeremoniendolch_Condition;
	information	= Info_Mod_Cronos_AW_Zeremoniendolch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, dieser Beutel ist von Vatras.";
};

FUNC INT Info_Mod_Cronos_AW_Zeremoniendolch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Zeremoniendolch))
	&& (Npc_HasItems(hero, ItMi_CronosBeutel) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cronos_AW_Zeremoniendolch_Info()
{
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Zeremoniendolch_15_00"); //Hier, dieser Beutel ist von Vatras.

	B_GiveInvItems	(hero, self, ItMi_CronosBeutel, 1);

	Npc_RemoveInvItems	(self, ItMi_CronosBeutel, 1);

	AI_Output(self, hero, "Info_Mod_Cronos_AW_Zeremoniendolch_04_01"); //Adanos sei Dank! Uns geht die Verpflegung aus.
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Zeremoniendolch_15_02"); //Vatras wird sicher bald mehr schicken können.
	AI_Output(self, hero, "Info_Mod_Cronos_AW_Zeremoniendolch_04_03"); //Das ist gut, danke.
	AI_Output(hero, self, "Info_Mod_Cronos_AW_Zeremoniendolch_15_04"); //Keine Ursache.

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Cronos_AW_Gast (C_INFO)
{
	npc		= Mod_9001_KDW_Cronos_AW;
	nr		= 1;
	condition	= Info_Mod_Cronos_AW_Gast_Condition;
	information	= Info_Mod_Cronos_AW_Gast_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum bist du überhaupt mitgekommen?";
};

FUNC INT Info_Mod_Cronos_AW_Gast_Condition()
{
	if (Mod_Saturas_Gast == 1)
	{
		Info_Mod_Cronos_AW_Gast.description = "Hast du etwas vom Diebstahl mitbekommen?";
	}
	else
	{
		Info_Mod_Cronos_AW_Gast.description = "Ist dir heute Nacht etwas aufgefallen?";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_UngebeterBesucher))
	&& (Mod_Saturas_Gast_Fortschritt == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cronos_AW_Gast_Info()
{
	if (Mod_Saturas_Gast == 1)
	{
		AI_Output(hero, self, "Info_Mod_Cronos_AW_Gast_15_00"); //Hast du etwas vom Diebstahl mitbekommen?
		AI_Output(self, hero, "Info_Mod_Cronos_AW_Gast_04_01"); //Nein, aber ich bin erbost über die Dreistigkeit, mit der uns vor unseren Augen wichtiges Material entwendet wird.
		AI_Output(self, hero, "Info_Mod_Cronos_AW_Gast_04_02"); //Ohne die Laborwasserflaschen kann ich nicht arbeiten!
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Cronos_AW_Gast_15_03"); //Ist dir heute Nacht etwas aufgefallen? Ein Dieb hat euch beklaut.
		AI_Output(self, hero, "Info_Mod_Cronos_AW_Gast_04_04"); //Beklaut? Hier? Aber ich habe tatsächlich etwas gesehen.
		AI_Output(self, hero, "Info_Mod_Cronos_AW_Gast_04_05"); //Ich konnte die ganze Nacht schlecht schlafen.
		AI_Output(self, hero, "Info_Mod_Cronos_AW_Gast_04_06"); //Merdarion schnarcht wie verrückt und Riordian grunzt und stöhnt.
		AI_Output(self, hero, "Info_Mod_Cronos_AW_Gast_04_07"); //Einmal meinte ich ein leises Rascheln zu hören, also habe ich mich umgedreht und eine Bewegung dort hinten in den Ruinen gesehen.
		AI_Output(self, hero, "Info_Mod_Cronos_AW_Gast_04_08"); //Wenn das der Dieb war, kann er was erleben!

		B_LogEntry	(TOPIC_MOD_SATURAS_NACHTGAST, "Cronos hat eine Bewegung in den Ruinen wahrgenommen. Vielleicht findet sich dort ein Anhaltspunkt für den Dieb.");

		Mod_Saturas_Gast_Fortschritt = 1;

		B_StartOtherRoutine	(Mod_115_NONE_Eremit_AW, "ATWMS");
	};
};

INSTANCE Info_Mod_Cronos_Pickpocket (C_INFO)
{
	npc		= Mod_9001_KDW_Cronos_AW;
	nr		= 1;
	condition	= Info_Mod_Cronos_Pickpocket_Condition;
	information	= Info_Mod_Cronos_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Cronos_Pickpocket_Condition()
{
	C_Beklauen	(145, ItSc_IceRain, 2);
};

FUNC VOID Info_Mod_Cronos_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Cronos_Pickpocket);

	Info_AddChoice	(Info_Mod_Cronos_Pickpocket, DIALOG_BACK, Info_Mod_Cronos_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Cronos_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Cronos_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Cronos_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Cronos_Pickpocket);
};

FUNC VOID Info_Mod_Cronos_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Cronos_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Cronos_Pickpocket);

		Info_AddChoice	(Info_Mod_Cronos_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Cronos_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Cronos_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Cronos_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Cronos_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Cronos_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Cronos_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Cronos_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Cronos_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Cronos_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Cronos_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Cronos_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Cronos_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};