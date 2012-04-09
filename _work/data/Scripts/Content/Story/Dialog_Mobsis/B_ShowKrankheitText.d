FUNC VOID B_ShowKrankheitText(var int pos)
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
			Doc_PrintLines	( StPl_nDocID,  0, "... so schwächen sie den Organismus und zehren ihn aus.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Es gibt leichte Formen, worunter die wohl jedem bekannte Erkältung fällt. Sie tritt auf, wenn der Körper unzureichend geschützt kalter Witterung ausgesetzt ist."						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Ihr Verlauf ist relativ sanft und gleichmäßig, Vitalität, Körperkraft und die anderen Fähigkeiten lassen über ihre Zeitdauer etwas nach. Hat der Körper jedoch in kurzen Zeitabständen mehrere Erkältungen überstanden, so härtet er sich gegen weitere ab."		);     
	}
	else if (pos == 2)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Schlimmer sind da schon Krankheiten, die durch das Zufügen von Wunden in Verbindung mit Schmutz und Unrat entstehen. Die Bisse von Fleisch fressenden Tieren und schmutzige, rostige Waffen können das Blut des Betroffenen vergiften.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Die Dauer der Erkrankung ist zwar etwas kürzer und ihr Ausbruch unscheinbarer. Jedoch wird sie im weiteren Verlauf zunehmend stärker und die Einbußen an Fähigkeiten größer."		);     
	}
	else if (pos == 3)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Noch ungleich boshafter sind Krankheiten, welche in verwesenden Kadavern entstehen. Der faulige Biss eines Warans oder der Kontakt mit untotem Fleisch können verheerend sein. Auch hier ist zwar der Beginn noch vergleichsweise sanft, der Übergang zu einem heftigen, langwierigen Verlauf jedoch kurz.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Selbst die Gesundheit eines vitalen, starken Menschen wird schwer leiden. Überflüssig zu erwähnen, dass unbehandelt häufig der Tod den Betroffenen erwartet."		);     
	}
	else if (pos == 4)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Die Behandlung eines erkrankten Organismus sollte dabei ansetzen, ihn mit Speis und Trank zu kräftigen. Von stark alkoholischen Getränken sollte dabei abgesehen werden, während frisches Obst und Gemüse besonders vorteilhaft wirkt. Die Dauer, besonders der schweren Phasen, kann dadurch erheblich gesenkt werden.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Auch reichlich Schlaf kann dem Körper beim Überwinden einer Erkrankung helfen, da er dem leidenden Körper Erholung verschafft. Dabei sollte jedoch nicht übersehen werden, dass auch während des Schlafes die Erkrankung fortschreitet."		);     
	}
	else if (pos == 5)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Der Betroffene kann von einer schweren Phase im Schlaf überrascht werden und sterben, falls die Behandlung nicht mit Mitteln von Außen unterstützt wurde.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Zu den probatesten unter diesen gehören Pflanzen mit heilender Wirkung und die die daraus gebrauten Tränke, welche jeder kundige Alchemist feilbietet."		);     
	}
	else if (pos == 6)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Übersteht ein Mensch mehrere durch Kreaturen übertragene Erkrankungen, so erlangt er zunehmende Resistenz. Der Körper erlernt die spezielle Erkrankung besser zu bekämpfen und somit ihre Folgen zu mindern.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Die Wahrscheinlichkeit, die selbe Krankheit erneut zu bekommen, sinkt. Da der Körper außerdem auf den Umgang mit Krankheiten trainiert wird, kann er schneller reagieren. Die Dauer aller Erkrankungen sinkt."		);     
	};

	Doc_Show		( StPl_nDocID );
};