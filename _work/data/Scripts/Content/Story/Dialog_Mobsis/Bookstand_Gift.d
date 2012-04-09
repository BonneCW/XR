var int Gift_01;
var int Gift_02;
var int Gift_03;
var int Gift_04;
var int Gift_05;
var int Gift_06;

FUNC VOID Use_Bookstand_Gift_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		if (Gift_01 == 0)
		{
			GiftCounter += 1;

			Gift_01 = GiftCounter;

			B_GivePlayerXP	(XP_Bookstand);

			Log_CreateTopic	(TOPIC_MOD_GIFT, LOG_NOTE);

			if (GiftCounter == 1)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "... in den Körper gelangen und ihre schädliche Wirkung entfalten. Die Gesundheit erleidet dabei über eine gewisse Zeitdauer konstanten Schaden, bis das Gift vom Organismus neutralisiert oder ausgeschieden wurde.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Die Gifte unterteilen sich in verschiedene Gruppen. Gewächse kennzeichnen eine davon. Ob giftige Pilze oder Pflanzen wirken sie beim Verzehr mit einer gewissen Verzögerung, da sie erst allmählich aufgenommen werden.");
			}
			else if (GiftCounter == 2)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Gelangen sie jedoch direkt in den Blutkreislauf, ist ihre Wirkung unmittelbar. Sie wirken ungleich stärker, dafür jedoch auch kürzer. Es wird berichtet, dass einige Menschen und andere vernunftbegabte Wesen ihre Waffen bewusst damit benetzen, um Widersacher im Kampf zu vergiften.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Übersteht ein Mensch jedoch mehrere Vergiftungen, so erlangt er zunehmende Resistenz. Der Körper erlernt das spezielle Gift schneller abzubauen, bis er nach zahlreichen Vergiftungen völlig immun wird. Zudem reduziert sich die schädliche Wirkung auch anderer Gewächsgifte, da sie ähnlich zusammengesetzt sind.");
			}
			else if (GiftCounter == 3)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Eine andere Gruppe von Giften entstammt dem Tierreich. Meist durch Insekten übertragen, gelangen sie durch Stacheln und Zangen des Getiers sofort in den Blutkreislauf. Die Wirkung ist meist kürzer, dafür etwas intensiver, als bei Gewächsgiften. Auf den Klingen von Waffen finden sich Tiergifte ungleich seltener, da die Beschaffung aufwändiger ist.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Auch hier können sich mit steigender Anzahl von Vergiftungen wachsende Resistenzen zeigen. Ähnlich, wie bei den Pflanzengiften, nimmt die Wirkungsdauer bei einem bestimmten Tiergift bis zur völligen Immunität ab. Gleichzeitig lässt der schädliche Effekt aller Tiergifte nach, da sie auf ähnliche Mechanismen beruhen und der Organismus ihrer Wirkung besser entgegenzuwirken lernt.");
			}
			else if (GiftCounter == 4)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Als letzte wichtige Gruppe zu nennen sind giftige Dämpfe. Ihr Effekt ist äußert unmittelbar und heftig, wenn auch meist nur auf wenige Sekunden beschränkt. Zwar kann auch hier der Körper mit der Zeit Resistenzen erlangen, jedoch haben die Dämpfe zusätzlich eine ätzende Wirkung und rauben dem Betroffenen die Luft zum atmen, sodass man nie völlig schadlos davonkommt.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Ganz gleich jedoch, welcher Form von Giften der Körper ausgesetzt war, steigt die Erfahrung darum, die Chance Vergiftungen jeder Art zu entgehen.");
			}
			else if (GiftCounter == 5)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Ist jedoch einmal eine Vergiftung eingetreten, ist es mit einer simplen Heilpflanze nicht getan, da das Gift im Körper verbleibt.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Von einer Pflanze namens Heilknospe wird jedoch berichtet, dass sie den Effekt jeder Vergiftung schlagartig aufzuheben vermag.");
			}
			else if (GiftCounter == 6)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Auch kundige Alchemisten sind in der Lage Gegengifte herzustellen, welche bestehende Vergiftungen nicht nur aufheben, sondern auch noch eine kurze Zeit nachwirken und Schutz vor weiteren Vergiftungen bieten.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Stehen jedoch diese Mittel nicht zur Verfügung, so kann zumindest die Zufuhr von reichlich Flüssigkeit dabei helfen, das Gift schneller aus dem Körper zu spülen ...");
			};
		};

		B_ShowGiftText (Gift_01);
	};
};

FUNC VOID Use_Bookstand_Gift_02_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		if (Gift_02 == 0)
		{
			GiftCounter += 1;

			Gift_02 = GiftCounter;

			B_GivePlayerXP	(XP_Bookstand);

			Log_CreateTopic	(TOPIC_MOD_GIFT, LOG_NOTE);

			if (GiftCounter == 1)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "... in den Körper gelangen und ihre schädliche Wirkung entfalten. Die Gesundheit erleidet dabei über eine gewisse Zeitdauer konstanten Schaden, bis das Gift vom Organismus neutralisiert oder ausgeschieden wurde.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Die Gifte unterteilen sich in verschiedene Gruppen. Gewächse kennzeichnen eine davon. Ob giftige Pilze oder Pflanzen wirken sie beim Verzehr mit einer gewissen Verzögerung, da sie erst allmählich aufgenommen werden.");
			}
			else if (GiftCounter == 2)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Gelangen sie jedoch direkt in den Blutkreislauf, ist ihre Wirkung unmittelbar. Sie wirken ungleich stärker, dafür jedoch auch kürzer. Es wird berichtet, dass einige Menschen und andere vernunftbegabte Wesen ihre Waffen bewusst damit benetzen, um Widersacher im Kampf zu vergiften.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Übersteht ein Mensch jedoch mehrere Vergiftungen, so erlangt er zunehmende Resistenz. Der Körper erlernt das spezielle Gift schneller abzubauen, bis er nach zahlreichen Vergiftungen völlig immun wird. Zudem reduziert sich die schädliche Wirkung auch anderer Gewächsgifte, da sie ähnlich zusammengesetzt sind.");
			}
			else if (GiftCounter == 3)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Eine andere Gruppe von Giften entstammt dem Tierreich. Meist durch Insekten übertragen, gelangen sie durch Stacheln und Zangen des Getiers sofort in den Blutkreislauf. Die Wirkung ist meist kürzer, dafür etwas intensiver, als bei Gewächsgiften. Auf den Klingen von Waffen finden sich Tiergifte ungleich seltener, da die Beschaffung aufwändiger ist.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Auch hier können sich mit steigender Anzahl von Vergiftungen wachsende Resistenzen zeigen. Ähnlich, wie bei den Pflanzengiften, nimmt die Wirkungsdauer bei einem bestimmten Tiergift bis zur völligen Immunität ab. Gleichzeitig lässt der schädliche Effekt aller Tiergifte nach, da sie auf ähnliche Mechanismen beruhen und der Organismus ihrer Wirkung besser entgegenzuwirken lernt.");
			}
			else if (GiftCounter == 4)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Als letzte wichtige Gruppe zu nennen sind giftige Dämpfe. Ihr Effekt ist äußert unmittelbar und heftig, wenn auch meist nur auf wenige Sekunden beschränkt. Zwar kann auch hier der Körper mit der Zeit Resistenzen erlangen, jedoch haben die Dämpfe zusätzlich eine ätzende Wirkung und rauben dem Betroffenen die Luft zum atmen, sodass man nie völlig schadlos davonkommt.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Ganz gleich jedoch, welcher Form von Giften der Körper ausgesetzt war, steigt die Erfahrung darum, die Chance Vergiftungen jeder Art zu entgehen.");
			}
			else if (GiftCounter == 5)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Ist jedoch einmal eine Vergiftung eingetreten, ist es mit einer simplen Heilpflanze nicht getan, da das Gift im Körper verbleibt.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Von einer Pflanze namens Heilknospe wird jedoch berichtet, dass sie den Effekt jeder Vergiftung schlagartig aufzuheben vermag.");
			}
			else if (GiftCounter == 6)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Auch kundige Alchemisten sind in der Lage Gegengifte herzustellen, welche bestehende Vergiftungen nicht nur aufheben, sondern auch noch eine kurze Zeit nachwirken und Schutz vor weiteren Vergiftungen bieten.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Stehen jedoch diese Mittel nicht zur Verfügung, so kann zumindest die Zufuhr von reichlich Flüssigkeit dabei helfen, das Gift schneller aus dem Körper zu spülen ...");
			};
		};

		B_ShowGiftText (Gift_02);
	};
};

FUNC VOID Use_Bookstand_Gift_03_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		if (Gift_03 == 0)
		{
			GiftCounter += 1;

			Gift_03 = GiftCounter;

			B_GivePlayerXP	(XP_Bookstand);

			Log_CreateTopic	(TOPIC_MOD_GIFT, LOG_NOTE);

			if (GiftCounter == 1)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "... in den Körper gelangen und ihre schädliche Wirkung entfalten. Die Gesundheit erleidet dabei über eine gewisse Zeitdauer konstanten Schaden, bis das Gift vom Organismus neutralisiert oder ausgeschieden wurde.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Die Gifte unterteilen sich in verschiedene Gruppen. Gewächse kennzeichnen eine davon. Ob giftige Pilze oder Pflanzen wirken sie beim Verzehr mit einer gewissen Verzögerung, da sie erst allmählich aufgenommen werden.");
			}
			else if (GiftCounter == 2)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Gelangen sie jedoch direkt in den Blutkreislauf, ist ihre Wirkung unmittelbar. Sie wirken ungleich stärker, dafür jedoch auch kürzer. Es wird berichtet, dass einige Menschen und andere vernunftbegabte Wesen ihre Waffen bewusst damit benetzen, um Widersacher im Kampf zu vergiften.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Übersteht ein Mensch jedoch mehrere Vergiftungen, so erlangt er zunehmende Resistenz. Der Körper erlernt das spezielle Gift schneller abzubauen, bis er nach zahlreichen Vergiftungen völlig immun wird. Zudem reduziert sich die schädliche Wirkung auch anderer Gewächsgifte, da sie ähnlich zusammengesetzt sind.");
			}
			else if (GiftCounter == 3)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Eine andere Gruppe von Giften entstammt dem Tierreich. Meist durch Insekten übertragen, gelangen sie durch Stacheln und Zangen des Getiers sofort in den Blutkreislauf. Die Wirkung ist meist kürzer, dafür etwas intensiver, als bei Gewächsgiften. Auf den Klingen von Waffen finden sich Tiergifte ungleich seltener, da die Beschaffung aufwändiger ist.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Auch hier können sich mit steigender Anzahl von Vergiftungen wachsende Resistenzen zeigen. Ähnlich, wie bei den Pflanzengiften, nimmt die Wirkungsdauer bei einem bestimmten Tiergift bis zur völligen Immunität ab. Gleichzeitig lässt der schädliche Effekt aller Tiergifte nach, da sie auf ähnliche Mechanismen beruhen und der Organismus ihrer Wirkung besser entgegenzuwirken lernt.");
			}
			else if (GiftCounter == 4)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Als letzte wichtige Gruppe zu nennen sind giftige Dämpfe. Ihr Effekt ist äußert unmittelbar und heftig, wenn auch meist nur auf wenige Sekunden beschränkt. Zwar kann auch hier der Körper mit der Zeit Resistenzen erlangen, jedoch haben die Dämpfe zusätzlich eine ätzende Wirkung und rauben dem Betroffenen die Luft zum atmen, sodass man nie völlig schadlos davonkommt.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Ganz gleich jedoch, welcher Form von Giften der Körper ausgesetzt war, steigt die Erfahrung darum, die Chance Vergiftungen jeder Art zu entgehen.");
			}
			else if (GiftCounter == 5)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Ist jedoch einmal eine Vergiftung eingetreten, ist es mit einer simplen Heilpflanze nicht getan, da das Gift im Körper verbleibt.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Von einer Pflanze namens Heilknospe wird jedoch berichtet, dass sie den Effekt jeder Vergiftung schlagartig aufzuheben vermag.");
			}
			else if (GiftCounter == 6)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Auch kundige Alchemisten sind in der Lage Gegengifte herzustellen, welche bestehende Vergiftungen nicht nur aufheben, sondern auch noch eine kurze Zeit nachwirken und Schutz vor weiteren Vergiftungen bieten.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Stehen jedoch diese Mittel nicht zur Verfügung, so kann zumindest die Zufuhr von reichlich Flüssigkeit dabei helfen, das Gift schneller aus dem Körper zu spülen ...");
			};
		};

		B_ShowGiftText (Gift_03);
	};
};

FUNC VOID Use_Bookstand_Gift_04_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		if (Gift_04 == 0)
		{
			GiftCounter += 1;

			Gift_04 = GiftCounter;

			B_GivePlayerXP	(XP_Bookstand);

			Log_CreateTopic	(TOPIC_MOD_GIFT, LOG_NOTE);

			if (GiftCounter == 1)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "... in den Körper gelangen und ihre schädliche Wirkung entfalten. Die Gesundheit erleidet dabei über eine gewisse Zeitdauer konstanten Schaden, bis das Gift vom Organismus neutralisiert oder ausgeschieden wurde.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Die Gifte unterteilen sich in verschiedene Gruppen. Gewächse kennzeichnen eine davon. Ob giftige Pilze oder Pflanzen wirken sie beim Verzehr mit einer gewissen Verzögerung, da sie erst allmählich aufgenommen werden.");
			}
			else if (GiftCounter == 2)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Gelangen sie jedoch direkt in den Blutkreislauf, ist ihre Wirkung unmittelbar. Sie wirken ungleich stärker, dafür jedoch auch kürzer. Es wird berichtet, dass einige Menschen und andere vernunftbegabte Wesen ihre Waffen bewusst damit benetzen, um Widersacher im Kampf zu vergiften.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Übersteht ein Mensch jedoch mehrere Vergiftungen, so erlangt er zunehmende Resistenz. Der Körper erlernt das spezielle Gift schneller abzubauen, bis er nach zahlreichen Vergiftungen völlig immun wird. Zudem reduziert sich die schädliche Wirkung auch anderer Gewächsgifte, da sie ähnlich zusammengesetzt sind.");
			}
			else if (GiftCounter == 3)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Eine andere Gruppe von Giften entstammt dem Tierreich. Meist durch Insekten übertragen, gelangen sie durch Stacheln und Zangen des Getiers sofort in den Blutkreislauf. Die Wirkung ist meist kürzer, dafür etwas intensiver, als bei Gewächsgiften. Auf den Klingen von Waffen finden sich Tiergifte ungleich seltener, da die Beschaffung aufwändiger ist.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Auch hier können sich mit steigender Anzahl von Vergiftungen wachsende Resistenzen zeigen. Ähnlich, wie bei den Pflanzengiften, nimmt die Wirkungsdauer bei einem bestimmten Tiergift bis zur völligen Immunität ab. Gleichzeitig lässt der schädliche Effekt aller Tiergifte nach, da sie auf ähnliche Mechanismen beruhen und der Organismus ihrer Wirkung besser entgegenzuwirken lernt.");
			}
			else if (GiftCounter == 4)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Als letzte wichtige Gruppe zu nennen sind giftige Dämpfe. Ihr Effekt ist äußert unmittelbar und heftig, wenn auch meist nur auf wenige Sekunden beschränkt. Zwar kann auch hier der Körper mit der Zeit Resistenzen erlangen, jedoch haben die Dämpfe zusätzlich eine ätzende Wirkung und rauben dem Betroffenen die Luft zum atmen, sodass man nie völlig schadlos davonkommt.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Ganz gleich jedoch, welcher Form von Giften der Körper ausgesetzt war, steigt die Erfahrung darum, die Chance Vergiftungen jeder Art zu entgehen.");
			}
			else if (GiftCounter == 5)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Ist jedoch einmal eine Vergiftung eingetreten, ist es mit einer simplen Heilpflanze nicht getan, da das Gift im Körper verbleibt.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Von einer Pflanze namens Heilknospe wird jedoch berichtet, dass sie den Effekt jeder Vergiftung schlagartig aufzuheben vermag.");
			}
			else if (GiftCounter == 6)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Auch kundige Alchemisten sind in der Lage Gegengifte herzustellen, welche bestehende Vergiftungen nicht nur aufheben, sondern auch noch eine kurze Zeit nachwirken und Schutz vor weiteren Vergiftungen bieten.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Stehen jedoch diese Mittel nicht zur Verfügung, so kann zumindest die Zufuhr von reichlich Flüssigkeit dabei helfen, das Gift schneller aus dem Körper zu spülen ...");
			};
		};

		B_ShowGiftText (Gift_04);
	};
};

FUNC VOID Use_Bookstand_Gift_05_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		if (Gift_05 == 0)
		{
			GiftCounter += 1;

			Gift_05 = GiftCounter;

			B_GivePlayerXP	(XP_Bookstand);

			Log_CreateTopic	(TOPIC_MOD_GIFT, LOG_NOTE);

			if (GiftCounter == 1)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "... in den Körper gelangen und ihre schädliche Wirkung entfalten. Die Gesundheit erleidet dabei über eine gewisse Zeitdauer konstanten Schaden, bis das Gift vom Organismus neutralisiert oder ausgeschieden wurde.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Die Gifte unterteilen sich in verschiedene Gruppen. Gewächse kennzeichnen eine davon. Ob giftige Pilze oder Pflanzen wirken sie beim Verzehr mit einer gewissen Verzögerung, da sie erst allmählich aufgenommen werden.");
			}
			else if (GiftCounter == 2)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Gelangen sie jedoch direkt in den Blutkreislauf, ist ihre Wirkung unmittelbar. Sie wirken ungleich stärker, dafür jedoch auch kürzer. Es wird berichtet, dass einige Menschen und andere vernunftbegabte Wesen ihre Waffen bewusst damit benetzen, um Widersacher im Kampf zu vergiften.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Übersteht ein Mensch jedoch mehrere Vergiftungen, so erlangt er zunehmende Resistenz. Der Körper erlernt das spezielle Gift schneller abzubauen, bis er nach zahlreichen Vergiftungen völlig immun wird. Zudem reduziert sich die schädliche Wirkung auch anderer Gewächsgifte, da sie ähnlich zusammengesetzt sind.");
			}
			else if (GiftCounter == 3)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Eine andere Gruppe von Giften entstammt dem Tierreich. Meist durch Insekten übertragen, gelangen sie durch Stacheln und Zangen des Getiers sofort in den Blutkreislauf. Die Wirkung ist meist kürzer, dafür etwas intensiver, als bei Gewächsgiften. Auf den Klingen von Waffen finden sich Tiergifte ungleich seltener, da die Beschaffung aufwändiger ist.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Auch hier können sich mit steigender Anzahl von Vergiftungen wachsende Resistenzen zeigen. Ähnlich, wie bei den Pflanzengiften, nimmt die Wirkungsdauer bei einem bestimmten Tiergift bis zur völligen Immunität ab. Gleichzeitig lässt der schädliche Effekt aller Tiergifte nach, da sie auf ähnliche Mechanismen beruhen und der Organismus ihrer Wirkung besser entgegenzuwirken lernt.");
			}
			else if (GiftCounter == 4)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Als letzte wichtige Gruppe zu nennen sind giftige Dämpfe. Ihr Effekt ist äußert unmittelbar und heftig, wenn auch meist nur auf wenige Sekunden beschränkt. Zwar kann auch hier der Körper mit der Zeit Resistenzen erlangen, jedoch haben die Dämpfe zusätzlich eine ätzende Wirkung und rauben dem Betroffenen die Luft zum atmen, sodass man nie völlig schadlos davonkommt.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Ganz gleich jedoch, welcher Form von Giften der Körper ausgesetzt war, steigt die Erfahrung darum, die Chance Vergiftungen jeder Art zu entgehen.");
			}
			else if (GiftCounter == 5)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Ist jedoch einmal eine Vergiftung eingetreten, ist es mit einer simplen Heilpflanze nicht getan, da das Gift im Körper verbleibt.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Von einer Pflanze namens Heilknospe wird jedoch berichtet, dass sie den Effekt jeder Vergiftung schlagartig aufzuheben vermag.");
			}
			else if (GiftCounter == 6)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Auch kundige Alchemisten sind in der Lage Gegengifte herzustellen, welche bestehende Vergiftungen nicht nur aufheben, sondern auch noch eine kurze Zeit nachwirken und Schutz vor weiteren Vergiftungen bieten.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Stehen jedoch diese Mittel nicht zur Verfügung, so kann zumindest die Zufuhr von reichlich Flüssigkeit dabei helfen, das Gift schneller aus dem Körper zu spülen ...");
			};
		};

		B_ShowGiftText (Gift_05);
	};
};

FUNC VOID Use_Bookstand_Gift_06_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		if (Gift_06 == 0)
		{
			GiftCounter += 1;

			Gift_06 = GiftCounter;

			B_GivePlayerXP	(XP_Bookstand);

			Log_CreateTopic	(TOPIC_MOD_GIFT, LOG_NOTE);

			if (GiftCounter == 1)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "... in den Körper gelangen und ihre schädliche Wirkung entfalten. Die Gesundheit erleidet dabei über eine gewisse Zeitdauer konstanten Schaden, bis das Gift vom Organismus neutralisiert oder ausgeschieden wurde.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Die Gifte unterteilen sich in verschiedene Gruppen. Gewächse kennzeichnen eine davon. Ob giftige Pilze oder Pflanzen wirken sie beim Verzehr mit einer gewissen Verzögerung, da sie erst allmählich aufgenommen werden.");
			}
			else if (GiftCounter == 2)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Gelangen sie jedoch direkt in den Blutkreislauf, ist ihre Wirkung unmittelbar. Sie wirken ungleich stärker, dafür jedoch auch kürzer. Es wird berichtet, dass einige Menschen und andere vernunftbegabte Wesen ihre Waffen bewusst damit benetzen, um Widersacher im Kampf zu vergiften.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Übersteht ein Mensch jedoch mehrere Vergiftungen, so erlangt er zunehmende Resistenz. Der Körper erlernt das spezielle Gift schneller abzubauen, bis er nach zahlreichen Vergiftungen völlig immun wird. Zudem reduziert sich die schädliche Wirkung auch anderer Gewächsgifte, da sie ähnlich zusammengesetzt sind.");
			}
			else if (GiftCounter == 3)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Eine andere Gruppe von Giften entstammt dem Tierreich. Meist durch Insekten übertragen, gelangen sie durch Stacheln und Zangen des Getiers sofort in den Blutkreislauf. Die Wirkung ist meist kürzer, dafür etwas intensiver, als bei Gewächsgiften. Auf den Klingen von Waffen finden sich Tiergifte ungleich seltener, da die Beschaffung aufwändiger ist.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Auch hier können sich mit steigender Anzahl von Vergiftungen wachsende Resistenzen zeigen. Ähnlich, wie bei den Pflanzengiften, nimmt die Wirkungsdauer bei einem bestimmten Tiergift bis zur völligen Immunität ab. Gleichzeitig lässt der schädliche Effekt aller Tiergifte nach, da sie auf ähnliche Mechanismen beruhen und der Organismus ihrer Wirkung besser entgegenzuwirken lernt.");
			}
			else if (GiftCounter == 4)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Als letzte wichtige Gruppe zu nennen sind giftige Dämpfe. Ihr Effekt ist äußert unmittelbar und heftig, wenn auch meist nur auf wenige Sekunden beschränkt. Zwar kann auch hier der Körper mit der Zeit Resistenzen erlangen, jedoch haben die Dämpfe zusätzlich eine ätzende Wirkung und rauben dem Betroffenen die Luft zum atmen, sodass man nie völlig schadlos davonkommt.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Ganz gleich jedoch, welcher Form von Giften der Körper ausgesetzt war, steigt die Erfahrung darum, die Chance Vergiftungen jeder Art zu entgehen.");
			}
			else if (GiftCounter == 5)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Ist jedoch einmal eine Vergiftung eingetreten, ist es mit einer simplen Heilpflanze nicht getan, da das Gift im Körper verbleibt.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Von einer Pflanze namens Heilknospe wird jedoch berichtet, dass sie den Effekt jeder Vergiftung schlagartig aufzuheben vermag.");
			}
			else if (GiftCounter == 6)
			{
				B_LogEntry	(TOPIC_MOD_GIFT, "Auch kundige Alchemisten sind in der Lage Gegengifte herzustellen, welche bestehende Vergiftungen nicht nur aufheben, sondern auch noch eine kurze Zeit nachwirken und Schutz vor weiteren Vergiftungen bieten.");
				B_LogEntry	(TOPIC_MOD_GIFT, "Stehen jedoch diese Mittel nicht zur Verfügung, so kann zumindest die Zufuhr von reichlich Flüssigkeit dabei helfen, das Gift schneller aus dem Körper zu spülen ...");
			};
		};

		B_ShowGiftText (Gift_06);
	};
};