FUNC VOID B_ShowGiftText(var int pos)
{
	StPl_nDocID = Doc_Create		() ;							// DocManager
	Doc_SetPages	( StPl_nDocID,  2 );                         
	Doc_SetPage 	( StPl_nDocID,  0, "Book_Brown_L.tga", 	0 	);  
	Doc_SetPage 	( StPl_nDocID,  1, "Book_Brown_R.tga",	0	);
	Doc_SetFont 	( StPl_nDocID, -1, FONT_Book	   				); 	
	Doc_SetMargins	( StPl_nDocID,  0,  275, 20, 30, 20, 1   	);

	if (pos == 1)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "... in den Körper gelangen und ihre schädliche Wirkung entfalten. Die Gesundheit erleidet dabei über eine gewisse Zeitdauer konstanten Schaden, bis das Gift vom Organismus neutralisiert oder ausgeschieden wurde.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Die Gifte unterteilen sich in verschiedene Gruppen. Gewächse kennzeichnen eine davon. Ob giftige Pilze oder Pflanzen wirken sie beim Verzehr mit einer gewissen Verzögerung, da sie erst allmählich aufgenommen werden."		);     
	}
	else if (pos == 2)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Gelangen sie jedoch direkt in den Blutkreislauf, ist ihre Wirkung unmittelbar. Sie wirken ungleich stärker, dafür jedoch auch kürzer. Es wird berichtet, dass einige Menschen und andere vernunftbegabte Wesen ihre Waffen bewusst damit benetzen, um Widersacher im Kampf zu vergiften.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Übersteht ein Mensch jedoch mehrere Vergiftungen, so erlangt er zunehmende Resistenz. Der Körper erlernt das spezielle Gift schneller abzubauen, bis er nach zahlreichen Vergiftungen völlig immun wird. Zudem reduziert sich die schädliche Wirkung auch anderer Gewächsgifte, da sie ähnlich zusammengesetzt sind."		);     
	}
	else if (pos == 3)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Eine andere Gruppe von Giften entstammt dem Tierreich. Meist durch Insekten übertragen, gelangen sie durch Stacheln und Zangen des Getiers sofort in den Blutkreislauf. Die Wirkung ist meist kürzer, dafür etwas intensiver, als bei Gewächsgiften. Auf den Klingen von Waffen finden sich Tiergifte ungleich seltener, da die Beschaffung aufwändiger ist.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Auch hier können sich mit steigender Anzahl von Vergiftungen wachsende Resistenzen zeigen. Ähnlich, wie bei den Pflanzengiften, nimmt die Wirkungsdauer bei einem bestimmten Tiergift bis zur völligen Immunität ab. Gleichzeitig lässt der schädliche Effekt aller Tiergifte nach, da sie auf ähnliche Mechanismen beruhen und der Organismus ihrer Wirkung besser entgegenzuwirken lernt."		);     
	}
	else if (pos == 4)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Als letzte wichtige Gruppe zu nennen sind giftige Dämpfe. Ihr Effekt ist äußert unmittelbar und heftig, wenn auch meist nur auf wenige Sekunden beschränkt. Zwar kann auch hier der Körper mit der Zeit Resistenzen erlangen, jedoch haben die Dämpfe zusätzlich eine ätzende Wirkung und rauben dem Betroffenen die Luft zum atmen, sodass man nie völlig schadlos davonkommt.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Ganz gleich jedoch, welcher Form von Giften der Körper ausgesetzt war, steigt die Erfahrung darum, die Chance Vergiftungen jeder Art zu entgehen."		);     
	}
	else if (pos == 5)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Ist jedoch einmal eine Vergiftung eingetreten, ist es mit einer simplen Heilpflanze nicht getan, da das Gift im Körper verbleibt.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Von einer Pflanze namens Heilknospe wird jedoch berichtet, dass sie den Effekt jeder Vergiftung schlagartig aufzuheben vermag."		);     
	}
	else if (pos == 6)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Auch kundige Alchemisten sind in der Lage Gegengifte herzustellen, welche bestehende Vergiftungen nicht nur aufheben, sondern auch noch eine kurze Zeit nachwirken und Schutz vor weiteren Vergiftungen bieten.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Stehen jedoch diese Mittel nicht zur Verfügung, so kann zumindest die Zufuhr von reichlich Flüssigkeit dabei helfen, das Gift schneller aus dem Körper zu spülen ..."		);     
	};

	Doc_Show		( StPl_nDocID );
};