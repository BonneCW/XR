var int Krankheit_01;
var int Krankheit_02;
var int Krankheit_03;
var int Krankheit_04;
var int Krankheit_05;
var int Krankheit_06;

FUNC VOID Use_Bookstand_Krankheit_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		if (Krankheit_01 == 0)
		{
			KrankheitCounter += 1;

			Krankheit_01 = KrankheitCounter;

			B_GivePlayerXP	(XP_Bookstand);

			Log_CreateTopic	(TOPIC_MOD_KRANKHEIT, LOG_NOTE);

			if (KrankheitCounter == 1)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "... so schwächen sie den Organismus und zehren ihn aus.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Es gibt leichte Formen, worunter die wohl jedem bekannte Erkältung fällt. Sie tritt auf, wenn der Körper unzureichend geschützt kalter Witterung ausgesetzt ist. Ihr Verlauf ist relativ sanft und gleichmäßig, Vitalität, Körperkraft und die anderen Fähigkeiten lassen über ihre Zeitdauer etwas nach. Hat der Körper jedoch in kurzen Zeitabständen mehrere Erkältungen überstanden, so härtet er sich gegen weitere ab.");
			}
			else if (KrankheitCounter == 2)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Schlimmer sind da schon Krankheiten, die durch das Zufügen von Wunden in Verbindung mit Schmutz und Unrat entstehen. Die Bisse von Fleisch fressenden Tieren und schmutzige, rostige Waffen können das Blut des Betroffenen vergiften.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Dauer der Erkrankung ist zwar etwas kürzer und ihr Ausbruch unscheinbarer. Jedoch wird sie im weiteren Verlauf zunehmend stärker und die Einbußen an Fähigkeiten größer.");
			}
			else if (KrankheitCounter == 3)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Noch ungleich boshafter sind Krankheiten, welche in verwesenden Kadavern entstehen. Der faulige Biss eines Warans oder der Kontakt mit untotem Fleisch können verheerend sein. Auch hier ist zwar der Beginn noch vergleichsweise sanft, der Übergang zu einem heftigen, langwierigen Verlauf jedoch kurz.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Selbst die Gesundheit eines vitalen, starken Menschen wird schwer leiden. Überflüssig zu erwähnen, dass unbehandelt häufig der Tod den Betroffenen erwartet.");
			}
			else if (KrankheitCounter == 4)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Behandlung eines erkrankten Organismus sollte dabei ansetzen, ihn mit Speis und Trank zu kräftigen. Von stark alkoholischen Getränken sollte dabei abgesehen werden, während frisches Obst und Gemüse besonders vorteilhaft wirkt. Die Dauer, besonders der schweren Phasen, kann dadurch erheblich gesenkt werden.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Auch reichlich Schlaf kann dem Körper beim Überwinden einer Erkrankung helfen, da er dem leidenden Körper Erholung verschafft. Dabei sollte jedoch nicht übersehen werden, dass auch während des Schlafes die Erkrankung fortschreitet.");
			}
			else if (KrankheitCounter == 5)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Der Betroffene kann von einer schweren Phase im Schlaf überrascht werden und sterben, falls die Behandlung nicht mit Mitteln von Außen unterstützt wurde.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Zu den probatesten unter diesen gehören Pflanzen mit heilender Wirkung und die die daraus gebrauten Tränke, welche jeder kundige Alchemist feilbietet.");
			}
			else if (KrankheitCounter == 6)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Übersteht ein Mensch mehrere durch Kreaturen übertragene Erkrankungen, so erlangt er zunehmende Resistenz. Der Körper erlernt die spezielle Erkrankung besser zu bekämpfen und somit ihre Folgen zu mindern.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Wahrscheinlichkeit, die selbe Krankheit erneut zu bekommen, sinkt. Da der Körper außerdem auf den Umgang mit Krankheiten trainiert wird, kann er schneller reagieren. Die Dauer aller Erkrankungen sinkt.");
			};
		};

		B_ShowKrankheitText (Krankheit_01);
	};
};

FUNC VOID Use_Bookstand_Krankheit_02_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		if (Krankheit_02 == 0)
		{
			KrankheitCounter += 1;

			Krankheit_02 = KrankheitCounter;

			B_GivePlayerXP	(XP_Bookstand);

			Log_CreateTopic	(TOPIC_MOD_KRANKHEIT, LOG_NOTE);

			if (KrankheitCounter == 1)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "... so schwächen sie den Organismus und zehren ihn aus.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Es gibt leichte Formen, worunter die wohl jedem bekannte Erkältung fällt. Sie tritt auf, wenn der Körper unzureichend geschützt kalter Witterung ausgesetzt ist. Ihr Verlauf ist relativ sanft und gleichmäßig, Vitalität, Körperkraft und die anderen Fähigkeiten lassen über ihre Zeitdauer etwas nach. Hat der Körper jedoch in kurzen Zeitabständen mehrere Erkältungen überstanden, so härtet er sich gegen weitere ab.");
			}
			else if (KrankheitCounter == 2)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Schlimmer sind da schon Krankheiten, die durch das Zufügen von Wunden in Verbindung mit Schmutz und Unrat entstehen. Die Bisse von Fleisch fressenden Tieren und schmutzige, rostige Waffen können das Blut des Betroffenen vergiften.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Dauer der Erkrankung ist zwar etwas kürzer und ihr Ausbruch unscheinbarer. Jedoch wird sie im weiteren Verlauf zunehmend stärker und die Einbußen an Fähigkeiten größer.");
			}
			else if (KrankheitCounter == 3)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Noch ungleich boshafter sind Krankheiten, welche in verwesenden Kadavern entstehen. Der faulige Biss eines Warans oder der Kontakt mit untotem Fleisch können verheerend sein. Auch hier ist zwar der Beginn noch vergleichsweise sanft, der Übergang zu einem heftigen, langwierigen Verlauf jedoch kurz.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Selbst die Gesundheit eines vitalen, starken Menschen wird schwer leiden. Überflüssig zu erwähnen, dass unbehandelt häufig der Tod den Betroffenen erwartet.");
			}
			else if (KrankheitCounter == 4)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Behandlung eines erkrankten Organismus sollte dabei ansetzen, ihn mit Speis und Trank zu kräftigen. Von stark alkoholischen Getränken sollte dabei abgesehen werden, während frisches Obst und Gemüse besonders vorteilhaft wirkt. Die Dauer, besonders der schweren Phasen, kann dadurch erheblich gesenkt werden.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Auch reichlich Schlaf kann dem Körper beim Überwinden einer Erkrankung helfen, da er dem leidenden Körper Erholung verschafft. Dabei sollte jedoch nicht übersehen werden, dass auch während des Schlafes die Erkrankung fortschreitet.");
			}
			else if (KrankheitCounter == 5)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Der Betroffene kann von einer schweren Phase im Schlaf überrascht werden und sterben, falls die Behandlung nicht mit Mitteln von Außen unterstützt wurde.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Zu den probatesten unter diesen gehören Pflanzen mit heilender Wirkung und die die daraus gebrauten Tränke, welche jeder kundige Alchemist feilbietet.");
			}
			else if (KrankheitCounter == 6)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Übersteht ein Mensch mehrere durch Kreaturen übertragene Erkrankungen, so erlangt er zunehmende Resistenz. Der Körper erlernt die spezielle Erkrankung besser zu bekämpfen und somit ihre Folgen zu mindern.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Wahrscheinlichkeit, die selbe Krankheit erneut zu bekommen, sinkt. Da der Körper außerdem auf den Umgang mit Krankheiten trainiert wird, kann er schneller reagieren. Die Dauer aller Erkrankungen sinkt.");
			};
		};

		B_ShowKrankheitText (Krankheit_02);
	};
};

FUNC VOID Use_Bookstand_Krankheit_03_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		if (Krankheit_03 == 0)
		{
			KrankheitCounter += 1;

			Krankheit_03 = KrankheitCounter;

			B_GivePlayerXP	(XP_Bookstand);

			Log_CreateTopic	(TOPIC_MOD_KRANKHEIT, LOG_NOTE);

			if (KrankheitCounter == 1)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "... so schwächen sie den Organismus und zehren ihn aus.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Es gibt leichte Formen, worunter die wohl jedem bekannte Erkältung fällt. Sie tritt auf, wenn der Körper unzureichend geschützt kalter Witterung ausgesetzt ist. Ihr Verlauf ist relativ sanft und gleichmäßig, Vitalität, Körperkraft und die anderen Fähigkeiten lassen über ihre Zeitdauer etwas nach. Hat der Körper jedoch in kurzen Zeitabständen mehrere Erkältungen überstanden, so härtet er sich gegen weitere ab.");
			}
			else if (KrankheitCounter == 2)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Schlimmer sind da schon Krankheiten, die durch das Zufügen von Wunden in Verbindung mit Schmutz und Unrat entstehen. Die Bisse von Fleisch fressenden Tieren und schmutzige, rostige Waffen können das Blut des Betroffenen vergiften.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Dauer der Erkrankung ist zwar etwas kürzer und ihr Ausbruch unscheinbarer. Jedoch wird sie im weiteren Verlauf zunehmend stärker und die Einbußen an Fähigkeiten größer.");
			}
			else if (KrankheitCounter == 3)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Noch ungleich boshafter sind Krankheiten, welche in verwesenden Kadavern entstehen. Der faulige Biss eines Warans oder der Kontakt mit untotem Fleisch können verheerend sein. Auch hier ist zwar der Beginn noch vergleichsweise sanft, der Übergang zu einem heftigen, langwierigen Verlauf jedoch kurz.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Selbst die Gesundheit eines vitalen, starken Menschen wird schwer leiden. Überflüssig zu erwähnen, dass unbehandelt häufig der Tod den Betroffenen erwartet.");
			}
			else if (KrankheitCounter == 4)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Behandlung eines erkrankten Organismus sollte dabei ansetzen, ihn mit Speis und Trank zu kräftigen. Von stark alkoholischen Getränken sollte dabei abgesehen werden, während frisches Obst und Gemüse besonders vorteilhaft wirkt. Die Dauer, besonders der schweren Phasen, kann dadurch erheblich gesenkt werden.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Auch reichlich Schlaf kann dem Körper beim Überwinden einer Erkrankung helfen, da er dem leidenden Körper Erholung verschafft. Dabei sollte jedoch nicht übersehen werden, dass auch während des Schlafes die Erkrankung fortschreitet.");
			}
			else if (KrankheitCounter == 5)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Der Betroffene kann von einer schweren Phase im Schlaf überrascht werden und sterben, falls die Behandlung nicht mit Mitteln von Außen unterstützt wurde.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Zu den probatesten unter diesen gehören Pflanzen mit heilender Wirkung und die die daraus gebrauten Tränke, welche jeder kundige Alchemist feilbietet.");
			}
			else if (KrankheitCounter == 6)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Übersteht ein Mensch mehrere durch Kreaturen übertragene Erkrankungen, so erlangt er zunehmende Resistenz. Der Körper erlernt die spezielle Erkrankung besser zu bekämpfen und somit ihre Folgen zu mindern.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Wahrscheinlichkeit, die selbe Krankheit erneut zu bekommen, sinkt. Da der Körper außerdem auf den Umgang mit Krankheiten trainiert wird, kann er schneller reagieren. Die Dauer aller Erkrankungen sinkt.");
			};
		};

		B_ShowKrankheitText (Krankheit_03);
	};
};

FUNC VOID Use_Bookstand_Krankheit_04_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		if (Krankheit_04 == 0)
		{
			KrankheitCounter += 1;

			Krankheit_04 = KrankheitCounter;

			B_GivePlayerXP	(XP_Bookstand);

			Log_CreateTopic	(TOPIC_MOD_KRANKHEIT, LOG_NOTE);

			if (KrankheitCounter == 1)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "... so schwächen sie den Organismus und zehren ihn aus.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Es gibt leichte Formen, worunter die wohl jedem bekannte Erkältung fällt. Sie tritt auf, wenn der Körper unzureichend geschützt kalter Witterung ausgesetzt ist. Ihr Verlauf ist relativ sanft und gleichmäßig, Vitalität, Körperkraft und die anderen Fähigkeiten lassen über ihre Zeitdauer etwas nach. Hat der Körper jedoch in kurzen Zeitabständen mehrere Erkältungen überstanden, so härtet er sich gegen weitere ab.");
			}
			else if (KrankheitCounter == 2)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Schlimmer sind da schon Krankheiten, die durch das Zufügen von Wunden in Verbindung mit Schmutz und Unrat entstehen. Die Bisse von Fleisch fressenden Tieren und schmutzige, rostige Waffen können das Blut des Betroffenen vergiften.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Dauer der Erkrankung ist zwar etwas kürzer und ihr Ausbruch unscheinbarer. Jedoch wird sie im weiteren Verlauf zunehmend stärker und die Einbußen an Fähigkeiten größer.");
			}
			else if (KrankheitCounter == 3)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Noch ungleich boshafter sind Krankheiten, welche in verwesenden Kadavern entstehen. Der faulige Biss eines Warans oder der Kontakt mit untotem Fleisch können verheerend sein. Auch hier ist zwar der Beginn noch vergleichsweise sanft, der Übergang zu einem heftigen, langwierigen Verlauf jedoch kurz.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Selbst die Gesundheit eines vitalen, starken Menschen wird schwer leiden. Überflüssig zu erwähnen, dass unbehandelt häufig der Tod den Betroffenen erwartet.");
			}
			else if (KrankheitCounter == 4)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Behandlung eines erkrankten Organismus sollte dabei ansetzen, ihn mit Speis und Trank zu kräftigen. Von stark alkoholischen Getränken sollte dabei abgesehen werden, während frisches Obst und Gemüse besonders vorteilhaft wirkt. Die Dauer, besonders der schweren Phasen, kann dadurch erheblich gesenkt werden.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Auch reichlich Schlaf kann dem Körper beim Überwinden einer Erkrankung helfen, da er dem leidenden Körper Erholung verschafft. Dabei sollte jedoch nicht übersehen werden, dass auch während des Schlafes die Erkrankung fortschreitet.");
			}
			else if (KrankheitCounter == 5)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Der Betroffene kann von einer schweren Phase im Schlaf überrascht werden und sterben, falls die Behandlung nicht mit Mitteln von Außen unterstützt wurde.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Zu den probatesten unter diesen gehören Pflanzen mit heilender Wirkung und die die daraus gebrauten Tränke, welche jeder kundige Alchemist feilbietet.");
			}
			else if (KrankheitCounter == 6)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Übersteht ein Mensch mehrere durch Kreaturen übertragene Erkrankungen, so erlangt er zunehmende Resistenz. Der Körper erlernt die spezielle Erkrankung besser zu bekämpfen und somit ihre Folgen zu mindern.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Wahrscheinlichkeit, die selbe Krankheit erneut zu bekommen, sinkt. Da der Körper außerdem auf den Umgang mit Krankheiten trainiert wird, kann er schneller reagieren. Die Dauer aller Erkrankungen sinkt.");
			};
		};

		B_ShowKrankheitText (Krankheit_04);
	};
};

FUNC VOID Use_Bookstand_Krankheit_05_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		if (Krankheit_05 == 0)
		{
			KrankheitCounter += 1;

			Krankheit_05 = KrankheitCounter;

			B_GivePlayerXP	(XP_Bookstand);

			Log_CreateTopic	(TOPIC_MOD_KRANKHEIT, LOG_NOTE);

			if (KrankheitCounter == 1)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "... so schwächen sie den Organismus und zehren ihn aus.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Es gibt leichte Formen, worunter die wohl jedem bekannte Erkältung fällt. Sie tritt auf, wenn der Körper unzureichend geschützt kalter Witterung ausgesetzt ist. Ihr Verlauf ist relativ sanft und gleichmäßig, Vitalität, Körperkraft und die anderen Fähigkeiten lassen über ihre Zeitdauer etwas nach. Hat der Körper jedoch in kurzen Zeitabständen mehrere Erkältungen überstanden, so härtet er sich gegen weitere ab.");
			}
			else if (KrankheitCounter == 2)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Schlimmer sind da schon Krankheiten, die durch das Zufügen von Wunden in Verbindung mit Schmutz und Unrat entstehen. Die Bisse von Fleisch fressenden Tieren und schmutzige, rostige Waffen können das Blut des Betroffenen vergiften.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Dauer der Erkrankung ist zwar etwas kürzer und ihr Ausbruch unscheinbarer. Jedoch wird sie im weiteren Verlauf zunehmend stärker und die Einbußen an Fähigkeiten größer.");
			}
			else if (KrankheitCounter == 3)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Noch ungleich boshafter sind Krankheiten, welche in verwesenden Kadavern entstehen. Der faulige Biss eines Warans oder der Kontakt mit untotem Fleisch können verheerend sein. Auch hier ist zwar der Beginn noch vergleichsweise sanft, der Übergang zu einem heftigen, langwierigen Verlauf jedoch kurz.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Selbst die Gesundheit eines vitalen, starken Menschen wird schwer leiden. Überflüssig zu erwähnen, dass unbehandelt häufig der Tod den Betroffenen erwartet.");
			}
			else if (KrankheitCounter == 4)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Behandlung eines erkrankten Organismus sollte dabei ansetzen, ihn mit Speis und Trank zu kräftigen. Von stark alkoholischen Getränken sollte dabei abgesehen werden, während frisches Obst und Gemüse besonders vorteilhaft wirkt. Die Dauer, besonders der schweren Phasen, kann dadurch erheblich gesenkt werden.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Auch reichlich Schlaf kann dem Körper beim Überwinden einer Erkrankung helfen, da er dem leidenden Körper Erholung verschafft. Dabei sollte jedoch nicht übersehen werden, dass auch während des Schlafes die Erkrankung fortschreitet.");
			}
			else if (KrankheitCounter == 5)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Der Betroffene kann von einer schweren Phase im Schlaf überrascht werden und sterben, falls die Behandlung nicht mit Mitteln von Außen unterstützt wurde.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Zu den probatesten unter diesen gehören Pflanzen mit heilender Wirkung und die die daraus gebrauten Tränke, welche jeder kundige Alchemist feilbietet.");
			}
			else if (KrankheitCounter == 6)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Übersteht ein Mensch mehrere durch Kreaturen übertragene Erkrankungen, so erlangt er zunehmende Resistenz. Der Körper erlernt die spezielle Erkrankung besser zu bekämpfen und somit ihre Folgen zu mindern.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Wahrscheinlichkeit, die selbe Krankheit erneut zu bekommen, sinkt. Da der Körper außerdem auf den Umgang mit Krankheiten trainiert wird, kann er schneller reagieren. Die Dauer aller Erkrankungen sinkt.");
			};
		};

		B_ShowKrankheitText (Krankheit_05);
	};
};

FUNC VOID Use_Bookstand_Krankheit_06_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		if (Krankheit_06 == 0)
		{
			KrankheitCounter += 1;

			Krankheit_06 = KrankheitCounter;

			B_GivePlayerXP	(XP_Bookstand);

			Log_CreateTopic	(TOPIC_MOD_KRANKHEIT, LOG_NOTE);

			if (KrankheitCounter == 1)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "... so schwächen sie den Organismus und zehren ihn aus.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Es gibt leichte Formen, worunter die wohl jedem bekannte Erkältung fällt. Sie tritt auf, wenn der Körper unzureichend geschützt kalter Witterung ausgesetzt ist. Ihr Verlauf ist relativ sanft und gleichmäßig, Vitalität, Körperkraft und die anderen Fähigkeiten lassen über ihre Zeitdauer etwas nach. Hat der Körper jedoch in kurzen Zeitabständen mehrere Erkältungen überstanden, so härtet er sich gegen weitere ab.");
			}
			else if (KrankheitCounter == 2)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Schlimmer sind da schon Krankheiten, die durch das Zufügen von Wunden in Verbindung mit Schmutz und Unrat entstehen. Die Bisse von Fleisch fressenden Tieren und schmutzige, rostige Waffen können das Blut des Betroffenen vergiften.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Dauer der Erkrankung ist zwar etwas kürzer und ihr Ausbruch unscheinbarer. Jedoch wird sie im weiteren Verlauf zunehmend stärker und die Einbußen an Fähigkeiten größer.");
			}
			else if (KrankheitCounter == 3)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Noch ungleich boshafter sind Krankheiten, welche in verwesenden Kadavern entstehen. Der faulige Biss eines Warans oder der Kontakt mit untotem Fleisch können verheerend sein. Auch hier ist zwar der Beginn noch vergleichsweise sanft, der Übergang zu einem heftigen, langwierigen Verlauf jedoch kurz.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Selbst die Gesundheit eines vitalen, starken Menschen wird schwer leiden. Überflüssig zu erwähnen, dass unbehandelt häufig der Tod den Betroffenen erwartet.");
			}
			else if (KrankheitCounter == 4)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Behandlung eines erkrankten Organismus sollte dabei ansetzen, ihn mit Speis und Trank zu kräftigen. Von stark alkoholischen Getränken sollte dabei abgesehen werden, während frisches Obst und Gemüse besonders vorteilhaft wirkt. Die Dauer, besonders der schweren Phasen, kann dadurch erheblich gesenkt werden.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Auch reichlich Schlaf kann dem Körper beim Überwinden einer Erkrankung helfen, da er dem leidenden Körper Erholung verschafft. Dabei sollte jedoch nicht übersehen werden, dass auch während des Schlafes die Erkrankung fortschreitet.");
			}
			else if (KrankheitCounter == 5)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Der Betroffene kann von einer schweren Phase im Schlaf überrascht werden und sterben, falls die Behandlung nicht mit Mitteln von Außen unterstützt wurde.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Zu den probatesten unter diesen gehören Pflanzen mit heilender Wirkung und die die daraus gebrauten Tränke, welche jeder kundige Alchemist feilbietet.");
			}
			else if (KrankheitCounter == 6)
			{
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Übersteht ein Mensch mehrere durch Kreaturen übertragene Erkrankungen, so erlangt er zunehmende Resistenz. Der Körper erlernt die spezielle Erkrankung besser zu bekämpfen und somit ihre Folgen zu mindern.");
				B_LogEntry	(TOPIC_MOD_KRANKHEIT, "Die Wahrscheinlichkeit, die selbe Krankheit erneut zu bekommen, sinkt. Da der Körper außerdem auf den Umgang mit Krankheiten trainiert wird, kann er schneller reagieren. Die Dauer aller Erkrankungen sinkt.");
			};
		};

		B_ShowKrankheitText (Krankheit_06);
	};
};