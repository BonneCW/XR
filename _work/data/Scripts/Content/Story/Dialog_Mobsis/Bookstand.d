//##########################################################################
//##
//##	Hier stehen alle Buchständermobsiscripte
//##
//##########################################################################


//*************************************
//	Buchständer in der Klosterbibliothek
//*************************************

FUNC VOID Use_Bookstand_01_S1()		//Buchständer in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
	if  (hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE; //für die Prüfung des Feuers 
			
			Log_CreateTopic (TOPIC_FireContest,LOG_MISSION);
			B_SetTopicStatus	(TOPIC_FireContest,LOG_RUNNING);
			B_LogEntry (TOPIC_FireContest,"Als Novize habe ich das Recht die Prüfung des Feuers zu fordern. Dabei wird mir jeder der drei Magier aus dem hohen Rat eine Prüfung stellen. Wenn ich sie bestehe, werde ich in den Kreis des Feuers aufgenommen.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Die Prüfung des Feuers"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "So ein Novize nicht erwählt ist, mag es sein, das er trotzdem die Bereitschaft verspürt sich der Prüfung der Magie zu unterwerfen. Wenn er diesen Entschluß reiflich überlegt hat und er darauf besteht, ist es ihm gewährt, die Prüfung zu verlangen und kein Magier darf sie ihm verweigern. Doch nicht nur die Prüfung der Magie wird ihm auferlegt, sondern er soll durch das Feuer seine Erleuchtung finden. Wenn er vor dem hohen Rat darauf besteht, so soll ihm die PRÜFUNG DES FEUERS gewährt werden.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "In dieser Prüfung soll gleichermaßen die Klugheit, Stärke und das Geschick des Novizen gefordert werden. So soll er drei Prüfungen erfüllen, jede empfangen durch einen der Magier des hohen Rates, bevor er den Eid der Flamme schwört und den Bund mit dem Feuer eingehen kann. "); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "So ist es Innos Wille und so soll es geschehen. "					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Der hohe Rat"					);
					Doc_Show		( nDocID );

			
	};
};

FUNC VOID BOOKSTAND_HEILMAGIER_01_S1()		//Buchständer in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLines	( nDocID,  0, "Entstehung des Ordens der Heilmagier"					);
					Doc_PrintLine	( nDocID,  0, "-------------------------"					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "Der Orden der Heilmagier entstand durch die Idee des weniger bekannten Magiers Kamaros. Es ist überliefert, dass er aus Myrthana stammte, wo er längere Zeit die neutrale Magie studierte. Doch eines Tages, so sagt man, schickte Adanos eine Vision zu ihm. Adanos war der Herr des Lebens und er trug Kamaros auf, es zu schützen und zu bewahren.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "So lehrte er ihm die Kunst der Heilmagie. So zog er nun aus, um weitere Magier zu finden, die ihm bei seiner Mission helfen sollten. Die Namen dieser Magier sind nicht bekannt, allerdings gelten sie als die Begründer der Heilmagie."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_Show		( nDocID );
					
					if (Heilmagier_1_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);

						Heilmagier_1_permanent = TRUE;
					};
	};
};

FUNC VOID BOOKSTAND_HEILMAGIER_02_S1()		//Buchständer in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLines	( nDocID,  0, "Die Heilmagie heute"					);
					Doc_PrintLine	( nDocID,  0, "-------------------"					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "Zu den Aufgaben der heutigen Heilmagier zählen nach wie vor das Heilen und Stärken der Menschen. Allerdings legt man neben der magischen Heilung auch wert auf Heil- und Stärkungstränke. Auch heute sind die Heilmagier nicht sehr weit verbreitet, sondern nur in kleineren Gruppen zusammengeschlossen.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Die meisten Heilmagier sind ehemalige Wassermagier, die Adanos mit nicht kriegerischen Mitteln dienen wollen. Im Gegensatz zu den Wassermagiern versuchen sie nicht die stärkere Seite zu schädigen, sondern die schwächere zu unterstützen."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_Show		( nDocID );
					
					if (Heilmagier_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);

						Heilmagier_2_permanent = TRUE;
					};
			
	};
};

FUNC VOID BOOKSTAND_HEILMAGIER_03_S1()		//Buchständer in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLines	( nDocID,  0, "Das Leben des Heilmagiers"					);
					Doc_PrintLine	( nDocID,  0, "-------------------------"					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "Die Heilmagier sind weniger streng gegliedert, als die anderen Magiezweige. Die Heilmagier kümmern sich im Prinzip nicht um politische Belange. Auch pflegen die Heilmagier kaum Kontakt zu den anderen Magierzweigen, da schon im Buch der Grundregeln der Heilmagie, das von Kamaros verfasst wurde steht:");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "'So ist es einzig die Pflicht des Magiers der Heilung, nicht in die Auseinadersetzung zwischen den Göttern in größerer Weise einzugreifen, sondern den Benachteiligten Hilfe zu gewährleisten und ihnen Unterstützung gegen ihre Gegner zu sichern, die allerdings nicht kriegerischer Natur sein darf.'"); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_Show		( nDocID );
					
					if (Heilmagier_3_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);

						Heilmagier_3_permanent = TRUE;
					};
			
	};
};

FUNC VOID BOOKSTAND_HEILMAGIER_04_S1()		//Buchständer in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLines	( nDocID,  0, "Verteidigung gegen Angreifer"					);
					Doc_PrintLine	( nDocID,  0, "-------------------------"					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "Sollte es doch in eine Situation kommen, in der sich der Heilmagier zur Wehr setzen muss, ist er mit einem magischen Kampfstab ausgerüstet, der den Gegner für längere Zeit einschläfert. Auch kann er Magie verwenden, die den Feind bewusstlos macht oder ihn auf andere Art außer Gefecht setzt. Allerdings verstösst es gegen die Gebote des Heilmagiers seinen Feind zu töten.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_Show		( nDocID );
					
					if (Heilmagier_4_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);

						Heilmagier_4_permanent = TRUE;
					};
			
	};
};

//*************************************
//	Buchständer in der Geheimen Bibliothek
//*************************************
//--------------------------------------
var int FinalDragonEquipment_Once;
//--------------------------------------

FUNC VOID Use_FINALDRAGONEQUIPMENT_S1()		//Buchständer in der geheimen Bibliothek 
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
	
		var int nDocID;
		
		nDocID = 		Doc_Create		()			  ;							
						Doc_SetPages	( nDocID,  2 );                         
						Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0); 
						Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0);
					
						Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
						Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  	
	
						Doc_PrintLine	( nDocID,  0, "");
						Doc_PrintLines	( nDocID,  0, "...Ich hoffe, dass die Kuppel das Erz vor dem Zugriff Beliars zu schützen vermag. Der König ist einfältig genug zu glauben, dass wir die Kuppel zum Schutz vor Ausbrüchen errichten, doch solange wir mit diesen Ratschlagen unsere höheren Zeile erreichen, soll es uns recht sein. Ich hoffe, das uns genug Zeit bleibt uns auf den Kampf vorzubereiten. Sobald die Kuppel um das Minental erschaffen ist, werde ich mit all meiner mir zur Verfügung stehenden Macht versuchen in den bevorstehenden Kampf einzugreifen. ");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´Heiliges Geschoss´: 1 geweihtes Wasser, aber keine Spruchrolle");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "...ich habe, genau nach Anleitung einfach Innos geweihtes Wasser auf einen Runenrohling geträufelt und am Runentisch zusammengeführt. Der Runenstein ist zerstört, ich glaube, dieser Spruch ist wirklich nur dem Einen zugänglich."); 
						Doc_PrintLines	( nDocID,  1, "Die Heilige Aura Innos habe ich dem Klosterschtz übergeben. Sie wird von nun an, vom Klostervorsteher aufbewahrt, bis zu dem Tag, an dem sich der Eine offenbart."	);
						Doc_PrintLines	( nDocID,  1, "Die Tränen Innos mögen in dem bevorstehenden Kampf eine Rolle spielen. Doch ist es wohl zu gefährlich sie offen aufzubewahren. Ich werde sie hier in der Bibliothek lassen."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"Um eine Rune zu erschaffen, benötige ich für jede Rune unterschiedliche Zutaten. Mit diesen Zutaten und einem Runenrohling kann ich dann die gewünschte Rune am Runentisch erschaffen.");
			B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´Geheimer Teleport´: 1 Geweihtes Wasser");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Um in den geheimen Ort zu gelangen muss man eine Teleportrune bauen. Dazu benötigst du einen Runenrohling und eine kleines Fläschchen geweihtes Wasser. Mit der erstellten Runen kannst du dich in den Raum teleporteiren."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Ich bin nun sehr sicher, dass es die Tränen Innos waren, mit den die Paladine aus der vorderen Zeit, die längst vergessene Hohe Schwertweihe abgehalten haben. Es sollte also möglich sein, mit dem von mir entdeckten Fläschchen eine geweihten Waffe zusaätzliche Kraft zu geben."	);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_Show		( nDocID );
		}
		else
		{
			PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] 	= TRUE;	
			PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] 	= TRUE;	
			
			PrintScreen			(PRINT_LearnSmith, -1, -1, FONT_Screen, 2);
			Npc_SetTalentSkill 	(self, NPC_TALENT_SMITH, 1);
			Log_CreateTopic (TOPIC_TalentSmith,LOG_NOTE);
			B_LogEntry (TOPIC_TalentSmith,"Um eine Waffe zu schmiede, brauche ich zunächst ein Stück Rohstahl. An einem Schmiedefeuer muss ich den Stahl erhitzen und anschließend an einem Amboss in die gewünschte Form bringen. Für hochwertigere Waffe benötigt man häufig noch Substanzen, welche der Waffe besondere Eigenschaften verleihen.");
			B_LogEntry (TOPIC_TalentSmith,"Wenn ich 4 Erz und 5 Drachenblut hinzugebe, kann ich mir einen ´ERZ-DRACHENTÖTER´ schmieden.");
			B_LogEntry (TOPIC_TalentSmith,"Wenn ich 5 Erz und 5 Drachenblut hinzugebe, kann ich mir einen ´GROßEN ERZ-DRACHENTÖTER´ schmieden.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Aus den Waffen des Dracheherren."); 
						Doc_PrintLines	( nDocID,  1, "´Um einem Panzer aus Drachenschuppen die höchste Härte zu verleihen, so kann man die Schuppen mit dem Erz überzeihen, welches in dem Tal der Insel Karynis gefördert wird."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Um eine dem Drachenherren würdige Klinge zu erhalten, muss man die Klinge in Drachenblut tränken. Schon die Beigabe einer Menge von 5 kleinen Phiolen verleiht dem Stahl eine Härte und Schärfe, der nichts entgegen zu setzten ist."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Anmerkung: Mit Karynis ist zeifelsfrei das heutige Khorinis gemeint.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			//B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

var int Blutkult_1_permanent;

FUNC VOID BOOKSTAND_BLUTKULT_01_S1()		//Buchständer in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
				Doc_SetPages	( nDocID,  2 );                         
				Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
				Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
				Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
				Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

				Doc_PrintLines	( nDocID,  0, "Verwendung göttlicher Magie für Zwecke der Beschwörung"					);
				Doc_PrintLine	( nDocID,  0, "-------------------------"					);
				Doc_PrintLine	( nDocID,  0, ""					);
				
				Doc_PrintLines	( nDocID,  0, "Wenn ein Magier lernt die Macht Innos’ oder Adanos’ für sich zu nutzen, so kann er, falls er die Grundlagen der sphärischen Manifestation der Magie Beliars’ beherrscht, Diener erzeugen, die aus dem Element geschaffen sind, für welches die jeweilige Gottheit steht.");
			
				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLines	( nDocID,  1, "Um eine solche Rune zu kreieren, dient als Grundlage eine herkömmliche Golemrune, welche an einem Runentisch mit dem Herzen eines Eis- oder Feuergolems verbunden wird.");
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_Show		( nDocID );
					
				if (Blutkult_1_permanent == FALSE)
				{
					B_GivePlayerXP (XP_Bookstand);

					Blutkult_1_permanent = TRUE;
				};

				if (hero.lp >= 3)
				&& (Rune_Eisgolem == FALSE)
				{
					hero.lp -= 3;

					Rune_Eisgolem = 1;

					PrintScreen	("Gelernt: Erschaffung einer Eisgolemrune", -1, -1, FONT_Screen, 2);
				}
				else
				{
					PrintScreen	(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
				};
	};
};

var int Blutkult_2_permanent;

FUNC VOID BOOKSTAND_BLUTKULT_02_S1()		//Buchständer in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
				Doc_SetPages	( nDocID,  2 );                         
				Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
				Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
				Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
				Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

				Doc_PrintLines	( nDocID,  0, "Grundlagen der sphärischen Manifestation"					);
				Doc_PrintLine	( nDocID,  0, "-------------------------"					);
				Doc_PrintLine	( nDocID,  0, ""					);
				
				Doc_PrintLines	( nDocID,  0, "Der Magier richte seine volle Aufmerksamkeit und Konzentration auf die Materie, die zu einem Geschöpf erstehen soll.");
			
				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLines	( nDocID,  1, "Nachdem er kurzzeitig eine geistige Verbindung zu dem entstehenden Geschöpf eingeht und ihm einen Teil seiner magischen Energie zukommen lässt, löst er diese Verbindung wieder, sodass das Wesen ausgestattet mit eigenem Teilwillen, aber doch an seinen Schöpfer gebunden, diesem folgt und ihn im Kampf unterstützt.");
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_Show		( nDocID );
					
				if (Blutkult_2_permanent == FALSE)
				{
					B_GivePlayerXP (XP_Bookstand);

					Blutkult_2_permanent = TRUE;
				};

				if (hero.lp >= 3)
				&& (Spheric_Manifestion == FALSE)
				{
					hero.lp -= 3;

					Spheric_Manifestion = 1;

					PrintScreen	("Gelernt: Spährische Manifestation", -1, -1, FONT_Screen, 2);
				}
				else
				{
					PrintScreen	(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
				};
	};
};

FUNC VOID Use_BookstandXardasRaetselOW_S1()		//Buchständer in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
				Doc_SetPages	( nDocID,  2 );                         
				Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
				Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
				Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
				Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

				Doc_PrintLines	( nDocID,  0, "Auch ein Würdiger weiß nicht alles."				);
				Doc_Show		( nDocID );
	};
};

