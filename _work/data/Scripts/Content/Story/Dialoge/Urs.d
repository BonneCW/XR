INSTANCE Info_Mod_Urs_Hi (C_INFO)
{
	npc		= Mod_7649_OUT_Urs_MT;
	nr		= 1;
	condition	= Info_Mod_Urs_Hi_Condition;
	information	= Info_Mod_Urs_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Urs_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Urs_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_00"); //(zu sich selbst) Ohh, welch Unglück, er ist fortgelaufen.
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_01"); //Was ist los?
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_02"); //(erschrocken) Hä, wer da?
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_03"); //Nur ein Besucher des Tales.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_04"); //Ohh, Innos sei dank. Ich dachte schon, du seiest ein weiterer Bandit. Das hätte mir gerade noch gefehlt.
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_05"); //Wieso, was ist los?
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_06"); //Ach, siehst du diese zwei Banditen da hinten? Voller Bosheit haben die mir ein Rudel Scavenger vor den Karren gejagt.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_07"); //Daraufhin ist mein Wally ausgerissen und hinter ihnen her. Jetzt steh ich hier und kann nicht weg.
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_08"); //Wer ist Wally?
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_09"); //Mein treuer zahmer Freund. Er zieht mir meinen Karren, da es meine eigenen Kräfte nicht mehr zulassen.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_10"); //Außerdem hält er manch einen Halunken davon ab, mir Ärger zu machen.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_11"); //So, wie das letzte Mal, als ich im Minental Geschäfte gemacht hatte.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_12"); //Da haben die beiden Halsabschneider sich auch schon ganz gierig meinen wertvollen Waren genähert.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_13"); //Als aber mein Wally sie grimmig anknurrte, da hat der Mut die beiden doch verlassen und sie überlegten es sich anders.
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_14"); //Ahh, Wally ist dein Hund. Na, da sind mir die beiden Banditen aber Helden.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_15"); //Hund ... ähh, na ja, irgendwie schon. Er ist ein Orkhund.
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_16"); //Ein Orkhund? Aber ...
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_17"); //Ach, das ist eine Geschichte, die lange zurückliegt.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_18"); //Damals habe ich einige Paladine auf dem Festland nahe Faring begleitet, als sie einen Trupp Orks entdeckten.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_19"); //Die Streiter Innos nahmen den Kampf sofort auf und erschlugen mit dem Vorteil der Überraschung alle Orks samt ihren Tieren.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_20"); //Als nun der Staub der Schlacht sich gelegt hatte, hörte ich ein jämmerliches Wimmern.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_21"); //Dicht an einen toten Orkhund gedrängt entdeckte ich einen zappelnden, hilflosen Welpen.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_22"); //Ich brachte es nicht übers Herz, ihn sich selbst zu überlassen, nahm ihn mit und zog ihn mit der Hand auf.
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_23"); //Achso, nun verstehe ich natürlich. Dein Freund und Begleiter ist fort und die Banditen warten nur darauf deine Waren an sich zu nehmen.
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_24"); //Hmm, soll ich die beiden Schurken zurechtstutzen?
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_25"); //Ach, was würde das bringen. In den Bergen haben die ihr Lager und wenn die beiden Hilfe holen, dann habe ich erst richtig Ärger.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_26"); //In Schach halten kann ich sie ja noch gerade alleine, aber den Karren ...
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_27"); //(unterbricht) Das verstehe ich nicht. Du kannst keinen Karren ziehen, aber Banditen davon abhalten deine Waren zu plündern?
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_28"); //Nun, nachdem mein Wally weglief und die beiden Schurken sich auf meine Waren stürzen wollten, nutzte ich die Macht Innos, um sie ein weiteres Mal in ihre Schranken zu weisen.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_29"); //Als ich den Ball des Feuers in meinen Händen auflud ...
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_30"); //(unterbricht) Einen Feuerball? Aber ...
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_31"); //Ja, du bringst einen auch dazu, alle unglücklichen Details des Vergangenen preiszugeben.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_32"); //Denn einst war ich Magier des Feuers, der ersten drei Kreise mächtig.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_33"); //Ich begann aber mich tiefer mit den göttlichen Mächten auseinanderzusetzen, mit ihrer Wirkung ... und der Beeinflussung und Ausstattung von Gegenständen mit deren Macht.
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_34"); //Du meinst, Verzauberung?
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_35"); //Ja, verzaubern und segnen. Normalerweise ist dies nur in ganz seltenen Fällen gestattet, zum Beispiel, bei der heiligen Weihe eines Paladinschwertes.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_36"); //Ich verstieß nun gegen dieses Gebot, als ich auch einfache Gegenstände mit der feurigen Magie Innos’ verzauberte und sie an einfache Menschen weitergab.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_37"); //Der oberste Magier des Feuers erfuhr davon und drohte mir mit der Exkommunikation, im Falle eines weiteren Verstoßes.
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_38"); //Und wie kam es dann dazu? Hast du trotzdem weitergemacht?
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_39"); //Nein, ich fügte mich der Anordnung.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_40"); //Aber ... aber dann wurde ich vor eine Entscheidung gestellt ... ich konnte mich einfach nicht im Sinne Innos entscheiden ... oder das, was der Orden des Feuers als solchen ansah.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_41"); //Ich hatte dir ja bereits von den Umständen erzählt, wie Wally in mein Leben trat.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_42"); //Aber dass es unter höchster Strafe verboten war, Kontakte zu finsteren Geschöpfen zu unterhalten – denn als solche sieht der Orden Orks und ihre Geschöpfe an - oder diese gar zu beherbergen, das hatte ich verschwiegen.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_43"); //Ich zog ihn zwar in einer Hütte außerhalb der Stadt auf, aber nach einigen Monaten, als er allmählich größer wurde und ich häufiger mit ihm im Wald unterwegs war, fielen wir doch auf.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_44"); //Man stellte mich vor die Wahl, mich dieser Kreatur zu entledigen ... oder den Orden und die Stadt für immer zu verlassen.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_45"); //Welche Wahl ich traf, muss ich wohl kaum erwähnen. Er war mir zu sehr ans Herz gewachsen.
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_46"); //Hmm, ja eine ergreifende Geschichte. Aber was hast du jetzt vor?
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_47"); //Ach ich weiß nicht. Ewig ausharren kann ich hier ja nicht.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_48"); //Aber fort genauso wenig, und damit meine Waren, und vor allem Wally zurücklassen.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_49"); //Er wird bestimmt zurückkommen, wenn er das Federvieh etwas herumgescheucht hat.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_50"); //Andererseits könnte er auf Gardisten oder Söldner treffen, die ihm bestimmt nicht wohl gesonnen wären.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_51"); //Daher sollte ich ihn vielleicht doch suchen gehen.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_52"); //Hmm, lass mich nachdenken ... Könntest du nicht die Waren für mich ausliefern?
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_53"); //Dann könnte ich während dessen Wally wieder finden.
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_54"); //Ja, warum nicht.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_55"); //Vielen Dank. Also ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_56"); //Dann hätte ich hier zunächst einen feurigen Hammer für den Schmied Thofeistos, im Neuen Lager.

	B_GiveInvItems	(self, hero, ItMw_FeurigerHammer, 1);

	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_57"); //Du findest ihn in der großen Wohnhöhle. Er wird das gute Stück schon sehnsüchtig erwarten. Gewiss wird er 20 Brocken Erz dafür zahlen.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_58"); //Hmm, und von dort aus wirst du am leichtesten das Lager der Waldläufer finden, welches du auch noch aufsuchen musst.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_59"); //Folge einfach weiter dem Weg Richtung alte Mine. Dort ist ein Durchgang hinter dem ihr Lager liegt.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_60"); //Für den Jäger Zelar habe ich diese Ladung magisch verzauberter Pfeile.

	B_GiveInvItems	(self, hero, ItMi_PfeilpaketZelar, 1);

	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_61"); //Die wollten sie haben, falls sich mal wieder Irrlichter ihrem Lager nähren. Denn mit normalen Waffen ist denen kaum beizukommen.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_62"); //Jedenfalls bekommst du einige wertvolle Felle dafür.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_63"); //Dann als nächstes wäre da diese lodernde Pfanne für Omid. Er ist der Koch im Haus der Erzbarone.

	B_GiveInvItems	(self, hero, ItMi_MagischePfanne, 1);

	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_64"); //Augenblick mal, eine magische Pfanne für den Koch?
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_65"); //Ja, einige der Erzbarone mögen ihre Speisen immer besonders knusprig durchgebraten.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_66"); //Und der zufriedene Gaumen eines Erzbarons ist in Gold kaum aufzuwiegen. 400 Münzen solltest du dafür gewiss bekommen.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_67"); //So, dann noch dieses kleine Päckchen gesegneter Rohlinge für den Schmied Darrion, aus dem Sumpflager.

	B_GiveInvItems	(self, hero, ItMi_ErzpaketDarrion, 1);

	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_68"); //Die daraus geschmiedeten Klingen sollten im Besonderen gegen dämonische Geschöpfe mehr Wirkung zeigen.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_69"); //Die im Sumpflager hatten nämlich mal früher Ärger mit einem Erzdämon, oder so.
	AI_Output(hero, self, "Info_Mod_Urs_Hi_15_70"); //Hmm, kommt mir bekannt vor.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_71"); //Jedenfalls bekommst du ein feines Paket Sumpfkraut dafür.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_72"); //So, jetzt noch die Lager, die erst vor kurzem entstanden sind.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_73"); //An die Magier in der Klosterruine noch dieser Ring, der das Licht Innos' in sich trägt.

	B_GiveInvItems	(self, hero, ItRi_Licht, 1);

	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_74"); //Wird er angelegt, erhellt er dem Träger für einige Zeit die Umgebung.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_75"); //Einer der Verwandlungsmagier wollte den haben, um auch noch spät nachts seine Forschungen ohne Einschnitte fortsetzen zu können.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_76"); //Falls du noch nicht weißt wo du sie findest: Folge einfach diesem Fluss Stromabwärts, bis er sich in zwei Läufe trennt.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_77"); //Links davon liegt die Klosterruine. Du wirst den Ring bei der Torwache Ferco abgeben und dafür eine Zauberrune bekommen.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_78"); //Den Rest verkauf ich ein andermal, wenn weniger Ärger in der Luft liegt.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_79"); //Sobald du dann alles zusammenhast, wirst du mich  hier finden.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_80"); //Zur Belohnung sollst du eines meiner besten Stücke bekommen. Du wirst gewiss zufrieden sein.
	AI_Output(self, hero, "Info_Mod_Urs_Hi_12_81"); //Lass dir aber bitte nicht zu viel Zeit. Ewig kann ich hier nicht ausharren.

	Log_CreateTopic	(TOPIC_MOD_URS_HUND, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_URS_HUND, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_URS_HUND, "Dem Händler Urs ist unterhalb des Passes sein Orkhund Wally ausgerissen. Da die Banditen in der nähe sind und er seinen Wally schnell wieder finden will, werde ich derweil seine wichtigsten Waren an den Mann bringen. Im Neuen Lager erwartet der Schmied Thofeistos einen feurigen Hammer, für welchen ich Erz bekomme. In der Nähe der alten Mine treffe ich auf die Waldläufer. Für mehrere gesegnete Pfeile bekomme ich einige wertvolle Felle. Im Alten Lager soll ich dem Koch der Erzbarone Omid eine lodernde Pfanne übergeben, für welche einige Goldmünzen herausspringen. Schmied Darrion im Sumpflager wartet auf einige gesegnete Rohlinge, wofür ich ein Packet Sumpfkraut bekomme. Dem Flusslauf unterhalb des Passes folgend, werde ich links eine Klosterruine finden, in welcher Verwandlungsmagier wohnhaft sind. Der Torwache Ferco übergebe ich einen Ring des Lichtes und bekomme im Gegenzug eine Rune. Wenn ich alles zusammenhabe, soll ich es Urs bringen, wofür er mir eine zufrieden stellende Belohnung versprochen hat. Ich sollte mich aber beeilen, da er nicht ewig an Ort und Stelle bleiben kann.");
};

INSTANCE Info_Mod_Urs_Hund (C_INFO)
{
	npc		= Mod_7649_OUT_Urs_MT;
	nr		= 1;
	condition	= Info_Mod_Urs_Hund_Condition;
	information	= Info_Mod_Urs_Hund_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Urs_Hund_Condition()
{
	if (Mod_Urs_Hund == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Urs_Hund_Info()
{
	AI_Output(self, hero, "Info_Mod_Urs_Hund_12_00"); //(erfreut) Ahh, da bist du ja.
	AI_Output(hero, self, "Info_Mod_Urs_Hund_15_01"); //Ich hab deinen Zettel gelesen. Aber wie ich sehe hast du Wally immer noch nicht gefunden.
	AI_Output(self, hero, "Info_Mod_Urs_Hund_12_02"); //(betrübt) Nein, leider auch hier nicht. (nachdenklich) Jetzt gibt es noch eine letzte Möglichkeit. Ja, natürlich, dort wird er sein.
	AI_Output(hero, self, "Info_Mod_Urs_Hund_15_03"); //Ja?
	AI_Output(self, hero, "Info_Mod_Urs_Hund_12_04"); //Das Orkgebiet. Wahrscheinlich haben ihn seine Instinkte und Erinnerungen dorthin geführt. Da werde ich ihn finden.
	AI_Output(hero, self, "Info_Mod_Urs_Hund_15_05"); //Ins Orkgebiet? Das ist doch glatter Selbstmord ... selbst mit deiner Magie.
	AI_Output(self, hero, "Info_Mod_Urs_Hund_12_06"); //(nachdenklich) Nein, nicht unbedingt. Es wird nicht die Flamme Innos sein, die mir dort sicherer Passage gewährt.
	AI_Output(hero, self, "Info_Mod_Urs_Hund_15_07"); //Was meinst du?
	AI_Output(self, hero, "Info_Mod_Urs_Hund_12_08"); //Nun, ein kleines Ritual.
	AI_Output(self, hero, "Info_Mod_Urs_Hund_12_09"); //Das wirst du dann schon sehen… aber dazu benötige ich die Sachen, die du zum Tausch für meine Waren bekommst.
	AI_Output(self, hero, "Info_Mod_Urs_Hund_12_10"); //Hast du vielleicht schon alles?
};

INSTANCE Info_Mod_Urs_Hund2 (C_INFO)
{
	npc		= Mod_7649_OUT_Urs_MT;
	nr		= 1;
	condition	= Info_Mod_Urs_Hund2_Condition;
	information	= Info_Mod_Urs_Hund2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab alles.";
};

FUNC INT Info_Mod_Urs_Hund2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Urs_Hund))
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 20)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 400)
	&& (Npc_HasItems(hero, ItMi_HerbPaket) >= 1)
	&& (Npc_HasItems(hero, ItRu_TrfMolerat) == 1)
	&& (Npc_HasItems(hero, ItAt_WargFur) >= 2)
	&& (Npc_HasItems(hero, ItAt_ShadowFur) >= 2)
	&& (Npc_HasItems(hero, ItAt_TrollFur) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Urs_Hund2_Info()
{
	AI_Output(hero, self, "Info_Mod_Urs_Hund2_15_00"); //Ich hab alles.

	B_ShowGivenThings	("Urs Waren gegeben");

	Npc_RemoveInvItems	(hero, ItMi_Nugget, 20);
	Npc_RemoveInvItems	(hero, ItMi_HerbPaket, 1);
	Npc_RemoveInvItems	(hero, ItRu_TrfMolerat, 1);
	Npc_RemoveInvItems	(hero, ItAt_WargFur, 2);
	Npc_RemoveInvItems	(hero, ItAt_ShadowFur, 2);
	Npc_RemoveInvItems	(hero, ItAt_TrollFur, 1);

	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_01"); //Ausgezeichnet. Das hast du wirklich vortrefflich gemacht.
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_02"); //Das Gold sollst du ruhig behalten, ich brauche es nicht ... und, achja, hier deine eigentliche Belohnung.

	B_GiveInvItems	(self, hero, ItRi_Versengung, 1);

	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_03"); //Dieser Ring wird deine Angriffe mit etwas Feuer und Magie verstärken.
	AI_Output(hero, self, "Info_Mod_Urs_Hund2_15_04"); //Gut, danke. Und was jetzt weiter?
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_05"); //Nun, um dieses Ritual zu vollführen, benötige ich einen mystischen, magischen Ort.
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_06"); //Nicht weit von hier habe ich in einem Waldstück einen Steinkreis gesehen.
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_07"); //Während meiner Zeit als Feuermagier hatte ich mich mal mit den Relikten alter Kulturen befasst.
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_08"); //Es hieß, dass diese Kreise einst dazu in der Lage gewesen seien, Schranken von Magie, Raum und Zeit zu überwinden.
	AI_Output(hero, self, "Info_Mod_Urs_Hund2_15_09"); //Das klingt aber nach sehr machtvollen Riten.
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_10"); //Ja, in der Tat. Die Magier früherer Kulturen, mussten in eine Art magischen, meditativen Zustand verfallen und ihre Kräfte vereinen oder starke äußere Quellen magischer Energie nutzen.
	AI_Output(hero, self, "Info_Mod_Urs_Hund2_15_11"); //Magische Quelle? Du meinst das magische ...
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_12"); //Genau, das magische Erz. Und ein Päckchen Sumpfkraut sollte mehr als genug sein, um für einen meditationsähnlichen Zustand zu sorgen.
	AI_Output(hero, self, "Info_Mod_Urs_Hund2_15_13"); //Nun gut, aber was für ein Ritual willst du eigentlich vornehmen?
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_14"); //Ich gedenke die Kraft eines etwas stärkeren Tieres auf die Verwandlungsrune zu übertragen.
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_15"); //Als Molerat würde ich im Orkgebiet wohl nicht allzu weit kommen, sondern schnell als Mittagshappen für die ganzen wilden Kreaturen enden.
	AI_Output(hero, self, "Info_Mod_Urs_Hund2_15_16"); //Ahh, das hat es also mit dem Ritual auf sich.
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_17"); //Genau. Gut, die nötigen Sachen habe ich ja.
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_18"); //Nun muss ich aber noch die ganzen magischen Kreaturen beim Steinkreis überwinden.
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_19"); //Es sollte durchaus in meine Macht stehen, und ich weiß, dass du bereits viel für mich getan hast.
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_20"); //Ich wäre dir jedoch sehr dankbar, wenn du mir ein weiters mal helfen würdest, indem du mir gegen die Wesen beim Stenkreis beistehst.
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_21"); //Wenn du den Ring anlegst, wirst du sogar Irrlichtern, die gegen gewöhnliche Waffen größtenteils gefeit sind, schaden können.
	AI_Output(self, hero, "Info_Mod_Urs_Hund2_12_22"); //Nun gut, dann mal auf zum Steinkreis.

	B_LogEntry	(TOPIC_MOD_URS_HUND, "Urs wird sich jetzt zum Steinkreis begeben, um eine neue Verwandlungsrune zu kreieren. Er will damit Wally finden, der vermutlich im Orkgebiet unterwegs ist. Ich sollte Urs dabei unterstützen, die Kreaturen beim Steinkreis klein zu kriegen. Ich könnte den neuen Ring bei der Gelegenheit gleich anlegen und erproben.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ZUSTEINKREIS");

	self.aivar[AIV_Partymember] = TRUE;

	B_GivePlayerXP	(600);

	Wld_InsertNpc	(Wisp,	"OW_PATH_WARAN01_SPAWN02");
	Wld_InsertNpc	(Wisp,	"FP_ROAM_OW_BLOODFLY_WALD_OC4");
	Wld_InsertNpc	(Wisp,	"FP_ROAM_OW_BLOODFLY_WALD_OC2");
};

INSTANCE Info_Mod_Urs_Hund3 (C_INFO)
{
	npc		= Mod_7649_OUT_Urs_MT;
	nr		= 1;
	condition	= Info_Mod_Urs_Hund3_Condition;
	information	= Info_Mod_Urs_Hund3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Urs_Hund3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Urs_Hund2))
	&& (Npc_GetDistToWP(hero, "OW_FOREST_EAST_UMWEG_02") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Urs_Hund3_Info()
{
	AI_Output(self, hero, "Info_Mod_Urs_Hund3_12_00"); //So, nun kann es beginnen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATSTEINKREIS");

	self.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Urs_Hund4 (C_INFO)
{
	npc		= Mod_7649_OUT_Urs_MT;
	nr		= 1;
	condition	= Info_Mod_Urs_Hund4_Condition;
	information	= Info_Mod_Urs_Hund4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Urs_Hund4_Condition()
{
	if (Mod_Urs_Hund == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Urs_Hund4_Info()
{
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_00"); //Du hier?
	AI_Output(hero, self, "Info_Mod_Urs_Hund4_15_01"); //Nur zu Besuch bei alten Bekannten. Und ich bin auch überrascht dich hier anzutreffen ... wie ich sehe mit Wally.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_02"); //Ja, das war vielleicht ein Abenteuer, das glaubst du nicht.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_03"); //Nachdem ich in die Gestalt eines Wargs geschlüpft war, wollte ich geradewegs ins Orkgebiet.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_04"); //Nur hatte ich vergessen, dass die meisten Menschen nicht sonderlich erfreut sind über das Erscheinen eines solchen Geschöpfes ... es hätte nicht viel Gefehlt, und der Bolzen eines Gardisten hätte mich erwischt.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_05"); //Naja, als ich mich dessen entsonnen hatte, habe ich natürlich schnell Fersengeld gegeben, um mich dann – zuerst ganz ungewohnter Weise – mitten unter Orkhunden in Sicherheit zu bringen.
	AI_Output(hero, self, "Info_Mod_Urs_Hund4_15_06"); //Und wie konntest du unter den ganzen Vierbeinern Wally finden?
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_07"); //Gar nicht. Er hat mich gefunden. Allerdings musste ich dazu erst eine ganze Weile durchs Orkgebiet streifen.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_08"); //Nach einem Tag fühlte ich mich unter den ganzen Orks und Vierbeinern schon fast etwas heimisch.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_09"); //Und als der Hunger kam, ertappte mich sogar dabei, wie ich instinktiv einem Scavenger nachjagte, der sich ins Orkgebiet verlaufen hatte.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_10"); //Na ja, das alles aber jetzt nur im Kurzen.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_11"); //Jedenfalls kam ich nach einiger Zeit auch nahe einem Turm vorbei, wo ein Rudel Orkhunde kampierte.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_12"); //Auch hier, so schien es  zunächst, war ich nicht richtig und ich wollte schon weiterlaufen, als ich plötzlich ein lautes Bellen aus dem verlassenen Gebäude vernahm.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_13"); //Als ich mich umdrehte, sah ich, wie Wally herausgestürmt kam.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_14"); //Er hatte mich wohl zunächst nur gewittert und blieb irritiert vor mir, in der ungewohnten Gestalt, stehen.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_15"); //Als ich mich gerade schon zurückverwandeln wollte, entsann ich mich des nahen Rudels Orkhunde und schritt erst einige Meter weiter, worauf Wally mir nach einigem Zögern vorsichtig folgte.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_16"); //Als ich dann endlich in meiner normalen Gestalt vor ihm stand, war die Wiedersehensfreude natürlich groß.
	AI_Output(hero, self, "Info_Mod_Urs_Hund4_15_17"); //Nun, war auch nicht gerade unaufwendig. Hmm, und Wally konnte sich einfach wieder so von seinen Artgenossen lösen?
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_18"); //Nun, seine Instinkte lassen Wally natürlich schon zu dem Umfeld seiner frühen Welpenzeit streben.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_19"); //Aber letztendlich hat er wohl zu lange unter Menschen gelebt und sich an mich gewöhnt ... so wie ich mich an ihn, als treuen Freund und Begleiter.
	AI_Output(hero, self, "Info_Mod_Urs_Hund4_15_20"); //Ja, so leicht lasst ihr beide euch wohl nicht trennen. Und dann seid ihr weiter zusammen durchs Orkgebiet gestreift?
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_21"); //Ja, denn an den Ausgängen zum Orkgebiet saßen Orks auf Warg auf Gardisten zu dicht nahe beieinander, sodass wir nicht hätten vorbeikönnen, ohne zwischen dir Fronten zu geraten ... ganz gleich, ob als Mensch, als Warg oder Mensch in Begleitung eines Orkhundes.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_22"); //Das wäre nicht gut gegangen.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_23"); //So suchten wir einen anderen Ausweg und trafen nach einiger Zeit auf die verlassene Bergfestung, mit diesen freundlich gesonnenen Orks.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_24"); //Unglaublich, oder?
	AI_Output(hero, self, "Info_Mod_Urs_Hund4_15_25"); //Ach, so manches ist möglich ...
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_26"); //Ja, was es nicht alles gibt. Einige engstirnige Innosdiener würden das für ein Ding der Unmöglichkeit erklären.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_27"); //Die Welt ist eben doch nicht so einfach in Finsternis und Licht, Gut und Böse geteilt, wie manch scheinheiliger Pfaffe es darstellen möchte.
	AI_Output(hero, self, "Info_Mod_Urs_Hund4_15_28"); //Ja, da ist was Wahres dran. Und was habt ihr beide nun weiter vor?
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_29"); //Das wissen wir noch nicht so genau.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_30"); //Aber wie ich zumindest von den Orks hier erfahren habe, gibt es gleich in der Nähe einen schmalen Pfad der aus dem Orkgebiet führt und nicht von Gardisten bewacht wird.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_31"); //Den werden wir nehmen ... und dann weiterschauen.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_32"); //Hmm, jedenfalls irgendwohin, wo man wegen seines besten Freundes nicht gleich aus der Stadt gejagt wird oder Schwachköpfe sofort das Schwert gegen ihn zücken.
	AI_Output(hero, self, "Info_Mod_Urs_Hund4_15_33"); //Dann viel Glück noch.
	AI_Output(self, hero, "Info_Mod_Urs_Hund4_12_34"); //Danke, dir ebenfalls. Bestimmt sehen wir uns mal wieder.

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Urs_EXIT (C_INFO)
{
	npc		= Mod_7649_OUT_Urs_MT;
	nr		= 1;
	condition	= Info_Mod_Urs_EXIT_Condition;
	information	= Info_Mod_Urs_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Urs_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Urs_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};