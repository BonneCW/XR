// ***************
// B_Preach_Vatras
// ***************

func void B_Announce_Richter_Anna (var int satz)
{
	AI_TurnToNpc	(self, Mod_7376_OUT_Anna_REL);

	if (satz == 0) 	
	{	
		AI_Output (self, self, "Info_Announce_Richter_Anna_10_00"); //Nach reichlicher Überlegung und Erwägung sind Wir zu folgendem Urteil gekommen:
	};
	if (satz == 1) 	
	{	
		AI_Output (self, self, "Info_Announce_Richter_Anna_10_01"); //Die Angeklagte Anna Weinschmäckerin wird für 26 Verbrechen der schwarzen Magie schuldig befunden.
	};
	if (satz == 2)
	{	
		AI_Output (self, self, "Info_Announce_Richter_Anna_10_02"); //Während der Anwendung des dritten Foltergrades gestand die Angeklagte die von den Zeugen angezeigten abscheulichen Verbrechen.
	};
	if (satz == 3)
	{	
		AI_Output (self, self, "Info_Announce_Richter_Anna_10_03"); //Diese umfassen im Einzelnen:
	};
	if (satz == 4)
	{	
		AI_Output (self, self, "Info_Announce_Richter_Anna_10_04"); //Die Vergiftung des städtischen Sees, das Ausgraben von toten Kindern und das Verzehren ebendieser, Huldigung Beliars, Anwendung von Zaubersalbe zum Flug mit dem Besen, absichtliche falsche Rezepturen und böse Blicke, die zu Erkrankung und Tod geführt haben.
	};
	if (satz == 5)
	{	
		AI_Output (self, self, "Info_Announce_Richter_Anna_10_05"); //Die Vereidung der Zeugen sowie das umfassende Geständnis genügen als Beweis zur Verurteilung der Angeklagten.
	};
	if (satz == 6)
	{	
		AI_Output (self, self, "Info_Announce_Richter_Anna_10_06"); //Zum Schutze unserer Gesellschaft und blabla, Wir kürzen das mal etwas ab, entscheiden Wir, eingesetzt vom erhabenen Stadthalter Khoratas und bewilligt von Adanos, dem Gott der Gerechtigkeit, dass Anna Weinschmäckerin heute Nachmittag öffentlich dem Feuer übergeben werden soll.
	};
	if (satz == 7)
	{	
		AI_Output (self, self, "Info_Announce_Richter_Anna_10_07"); //Da die Angeklagte Reue zeigt und Buße getan hat, so verfügen Wir in Unserer unendlichen Gnade, dass sie vor der Verbrennung bis zum Tode stranguliert werden soll.
	};
	if (satz == 8)
	{	
		AI_Output (self, self, "Info_Announce_Richter_Anna_10_08"); //Adanos möge ihre Seele behüten.
	};
	if (satz == 9)
	{		
		AI_Output (self, self, "Info_Announce_Richter_Anna_10_09"); //Die Verhandlung ist hiermit geschlossen. Gibt's jetzt was zu essen?

		Mod_AnnaQuest = 8;

		B_Attack	(Mod_7370_OUT_Ulrich_REL, Mod_7373_OUT_Schoeppe_REL, AR_NONE, 0);
	};
};
