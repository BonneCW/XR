INSTANCE ItWr_GolemBook1(C_Item)
{	
	name 					=	"Arkanum Golum - Band I";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"NewBook_V1_3.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseGolemBook1;
};

	FUNC VOID UseGolemBook1()
	{   
		var int nDocID;
		
		nDocID =
		Doc_Create		()			  ;							// DocManager 
		Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
		Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga"  , 0 		); 
		Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga" , 0		);
		Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	// -1 -> all pages 
		
		//1.Seite
		Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
		Doc_PrintLine	( nDocID,  0, "ARKANUM GOLUM - Band I");
		Doc_PrintLine	( nDocID,  0, "=====================");
		Doc_PrintLines	( nDocID,  0, "(Magie der Golems)");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "Nur wer schon einmal einem dieser aus den Elementen erschaffenen Kreaturen begegnet ist, wird wirklich verstehen, welchen Respekt diese magieschen Wesen einem abenteuerlustigen Wanderer einflößen können.");
		Doc_PrintLine	( nDocID,  0, "");

		//2.Seite
		Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
		Doc_PrintLine	( nDocID,  1, "Steingolem");
		Doc_PrintLine	( nDocID,  1, "------------");
		Doc_PrintLines	( nDocID,  1, "Diese steinernen Kolosse sind im Kampf fast unverwundbar. Schwerter, Äxte und Bögen scheinen diesen Monstren nichts anhaben zu können.");
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLines	( nDocID,  1, "Der einzige glaubhafte Bericht von der Bezwingung eines solchen Leviathans stammt von einem Söldner. Er schrieb davon, wie der stumpfe Aufprall seines Kriegshammers Risse in den Golem trieb, bis dieser schlußendlich zerbarst.");

		Doc_Show		( nDocID );
	};

INSTANCE ItWr_GolemBook2(C_Item)
{	
	name 					=	"Arkanum Golum - Band II";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"NewBook_V1_4.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseGolemBook2;
};

	FUNC VOID UseGolemBook2()
	{   
		var int nDocID;
		
		nDocID =
		Doc_Create		()			  ;							// DocManager 
		Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

		Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga"  , 0 		); 
		Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga" , 0		);
		Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	// -1 -> all pages 

		//1. Seite
		Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
		Doc_PrintLine	( nDocID,  0, "ARKANUM GOLUM - Band II");
		Doc_PrintLine	( nDocID,  0, "======================");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLine	( nDocID,  0, "Eisgolem");
		Doc_PrintLine	( nDocID,  0, "---------");
		Doc_PrintLines	( nDocID,  0, "Den Steingolems verwandt sind die Eisgolems, deren physische Substanz jedoch völlig aus gefrorenem Wasser zu bestehen scheint. Jede uns bekannte Waffe scheint an der glatten Oberfläche dieser eisigen Wesen abzugleiten.");
		Doc_PrintLines	( nDocID,  0, "Auch sei der abenteuerlustige Wanderer gewarnt vor dem Eisatem dieser Kreatur, schließt sie doch jeden Ahnungslosen im Nu in einer Säule aus Eis ein.");

		//2.Seite
		Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
		Doc_PrintLines	( nDocID,  1, "Einst berichtete ein Feuermagier von der Begegnung mit einem solchen Geschöpf, doch schien er keine ernste Bedrohung darin erkannt zu haben.");
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLine	( nDocID,  1, "Feuergolem");
		Doc_PrintLine	( nDocID,  1, "------------");
		Doc_PrintLines	( nDocID,  1, "Berichten zufolge können diese feurigen Geschöpfe ihre Opfer mit nur einer Berührung in ein Flammenmeer verwandeln.");
		Doc_PrintLines	( nDocID,  1, "Erst im letzten Jahr stieß eine Jagdgruppe im Hochland auf solch einen wandelnden Gluthaufen. Der Ausgang ist unklar, doch soll Eis die Höllenkreatur gestoppt haben.");
		Doc_Show		( nDocID );
	};