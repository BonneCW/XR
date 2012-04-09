var int Beliarkloster_1_permanent;
var int Beliarkloster_2_permanent;
var int Beliarkloster_3_permanent;
var int Beliarkloster_4_permanent;

FUNC VOID BOOKSTAND_BELIARKLOSTER_01_S1()		//Buchständer in der Magierbibliothek
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

					Doc_PrintLines	( nDocID,  0, "Niederschrift des Kriegsherrn Ur GarShock"					);
					Doc_PrintLine	( nDocID,  0, "-------------------------"					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "Der Menschenkönig wurde von Beliar selbst geholt. Die letzte Schlacht, und somit der Krieg, waren vorbei. Und dies gelang nur durch Beliar selbst, der Blitze regnen ließ, damit wir vorstoßen konnten.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Beliar der du da bist,"); 
					Doc_PrintLines	( nDocID,  1, "unser Herr und Schöpfer"); 
					Doc_PrintLines	( nDocID,  1, "alles Bösen,"); 
					Doc_PrintLines	( nDocID,  1, "alles Schlechten,"); 
					Doc_PrintLines	( nDocID,  1, "dessen Reich das prächtigste"); 
					Doc_PrintLines	( nDocID,  1, "und größte ist."); 
					Doc_PrintLines	( nDocID,  1, "Nur durch deine Macht"); 
					Doc_PrintLines	( nDocID,  1, "werden wir siegreich sein,"); 
					Doc_PrintLines	( nDocID,  1, "um alle zu peinigen,"); 
					Doc_PrintLines	( nDocID,  1, "die sich gegen deine Untertanen wenden."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_Show		( nDocID );
					
					if (Beliarkloster_1_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);

						Beliarkloster_1_permanent = TRUE;
					};
	};
};

FUNC VOID BOOKSTAND_BELIARKLOSTER_02_S1()		//Buchständer in der Magierbibliothek
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

					Doc_PrintLines	( nDocID,  0, "Niederschrift des Propheten Gosh Tar-Wog"					);
					Doc_PrintLine	( nDocID,  0, "-------------------------"					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "Beliar offenbarte sich heute allen Anängern, doch manche waren skeptisch gegenüber der Macht ihres Herrn. Sie wollten ein Zeichen, doch dann tauchte ein mit Nebel umgebener Dämon auf und Sprach: 'Ein Reich, das gegen sich selbst kämpft, ist dem Untergang geweiht, darum zweifelt nicht an der Macht Beliars, sondern findet und tötel all diejenigen, die sich gegen den wahren Glauben Beliars wenden.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLines	( nDocID,  1, "Das Böse annehmen"					);
					Doc_PrintLine	( nDocID,  1, "-----------------"					);
					Doc_PrintLine	( nDocID,  1, ""					);
				
					
					Doc_PrintLines	( nDocID,  1, "Niemand nimmt das Haupt seines Feindes mit, um es dann im Verborgenen aufzubewaren oder Niemandem zu zeigen. Das Haupt wird auf einen Speer gespießt, damit jeder es Sehen kann, sowohl Verbündeter als auch Feind. Dein Hass ist der Schlüssel zur reinen Boshaftigkeit. Darum geh und hasse alle deine Feinde bis aufs Blut und bekämpfe sie. Wenn du von Hass erfüllt bist und kein Heller Fleck mehr in dir ist, dann wirst du in Beliars Reich einfahren."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_Show		( nDocID );
					
					if (Beliarkloster_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);

						Beliarkloster_2_permanent = TRUE;
					};
	};
};

FUNC VOID BOOKSTAND_BELIARKLOSTER_03_S1()		//Buchständer in der Magierbibliothek
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

					Doc_PrintLines	( nDocID,  0, "Das Gleichnis des Bösen in euch"					);
					Doc_PrintLine	( nDocID,  0, "-------------------------"					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "Ein Mann hatte einen Bauernhof, verpachtete ihn an andere Bauern und ging für einige Monate weg. Als es zur Ernte kam schickte er einen Knecht, um die Pacht einzuholen. Dieser wurde von den Bauern verprügelt und geschlagen. Der Bauer schickte nun einen weiteren, doch mit ihm geschah das Selbe. Nun schickte der Bauer seinen Sohn. Doch die Bauern erkannten ihre Chance und nutzten sie. Denn auf der Welt herrscht nur das Gesetz des Stärkeren.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLines	( nDocID,  1, "Beliar reinigt den Tempel"					);
					Doc_PrintLine	( nDocID,  1, "-------------------------"					);
					Doc_PrintLine	( nDocID,  1, ""					);
				
					
					Doc_PrintLines	( nDocID,  1, "Liebe Brüder und Schwestern, vergesst nicht, wie vor langer Zeit Beliar unseren Vorfahren dieses prächtige Kloster mitten im Meer gab, damit wir seinen einzig und wahren Glauben verbreiten können. Er führte uns durch das Meer und gab uns all das, was wir zm Leben brauchten. Doch all diese Novizen wollten nicht ihre alten Götter abschwören. Deshalb kamen alle durch Beliars Hand um."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_Show		( nDocID );
					
					if (Beliarkloster_3_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);

						Beliarkloster_3_permanent = TRUE;
					};
	};
};

FUNC VOID BOOKSTAND_BELIARKLOSTER_04_S1()		//Buchständer in der Magierbibliothek
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

					Doc_PrintLines	( nDocID,  0, "Niederschrift des Schwarzmagiers Thernus"					);
					Doc_PrintLine	( nDocID,  0, "-------------------------"					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "Ich und meine Schwarzmagierbrüder hatten diese Narren davor gewarnt, dass Beliar sie holen und verdammen würde, wenn sie nicht ihren alten Göttern abschworen. Es war förmlich ein Blutbad. So zornig war Beliar seit der Niederlage gegen Innos nicht mehr.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLines	( nDocID,  1, "Beliar tötet 200.000 Paladine"					);
					Doc_PrintLine	( nDocID,  1, "-------------------------"					);
					Doc_PrintLine	( nDocID,  1, ""					);
				
					
					Doc_PrintLines	( nDocID,  1, "Da rief Beliar seine Diener auf das Schlachtfeld. Und sie kamen alle. Skelette, Orks, Dämonen, Untote, Suchende und Schwarze Novizen. Die Paladine hatten die Streitkraft Beliars im Griff, bis plötzlich Beliar selbst in das Geschehen eingriff und alles Vernichtete. Es regnete Feuer und Blitze. Selbst ein Großteil seiner Armee wurde dahingestreckt, doch der Sieg war eindeutig."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_Show		( nDocID );
					
					if (Beliarkloster_4_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);

						Beliarkloster_4_permanent = TRUE;
					};
	};
};