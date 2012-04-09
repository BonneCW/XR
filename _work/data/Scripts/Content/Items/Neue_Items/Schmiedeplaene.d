INSTANCE ItWr_Bauplan_Erzschwert_Wasser		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_Erzschwert_Wasser;
	scemeName			=	"MAP";
	description			= 	"Bauplan: Erzschwert des Wasserhiebes";
};

func void UseBauplan_Erzschwert_Wasser ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Erzschwert des Wasserhiebes"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Ein kundiger Schmied in der Verarbeitung magischen Erzes kann eine Nahkampfwaffe mit einer dünnen Schicht Erz überziehen und oberhalb des Griffes eine Wasserfaustrune anbringen. Er benötigt dazu je nach Größe der Waffe 10 oder 15 Erzbrocken und natürlich die Rune. Eine auf diese Art aufgebesserte Waffe führt im Nahkampf  (Text verwittert) ..."					);

					Doc_Show		( nDocID );

		Smith_Erzschwert_Wasser = TRUE;
};

INSTANCE ItWr_Bauplan_Erzschwert_Feuer		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_Erzschwert_Feuer;
	scemeName			=	"MAP";
	description			= 	"Bauplan: Erzschwert des Versengens";
};

func void UseBauplan_Erzschwert_Feuer ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Erzschwert des Versengens"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Ein kundiger Schmied in der Verarbeitung magischen Erzes kann eine Nahkampfwaffe mit einer dünnen Schicht Erz überziehen und oberhalb des Griffes eine Feuerballrune – in Erz eingebettet -  anbringen, gleiches an Armbrust, oder Bogen. Ist die Rune im Ganzen zu groß, kann man sie zerteilen, wobei dir Teilstücke immer durch magisches Erz verbunden bleiben müssen. Er benötigt dazu je nach Größe der Waffe 10 oder 15 Erzbrocken und natürlich die Rune."					);

					Doc_Show		( nDocID );

		Smith_Erzschwert_Feuer = TRUE;
};