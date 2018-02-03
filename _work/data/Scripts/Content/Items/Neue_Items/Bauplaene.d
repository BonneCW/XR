const int Value_Bauplan = 100;

INSTANCE ItWr_Bauplan_Snapperring		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_Snapperring;
	scemeName			=	"MAPSEALED";
	description			= 	"Bauplan: Snapperkraftring";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_Snapperring ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Snapperkraftring"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Metallblock"					);
					Doc_PrintLines	( nDocID,  0, "4x Krallen"					);

					Doc_Show		( nDocID );

		Snapperring = TRUE;

	Log_CreateTopic	(TOPIC_MOD_SCHMUCK, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_SCHMUCK, "Snapperkraftring: 1x Metallblock, 4x Krallen");
};

INSTANCE ItWr_Bauplan_Wolfsring_Ruestung		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_Wolfsring_Ruestung;
	scemeName			=	"MAPSEALED";
	description			= 	"Bauplan: Wolfsring der R¸stung";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_Wolfsring_Ruestung ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Wolfsring der R¸stung"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Metallblock"					);
					Doc_PrintLines	( nDocID,  0, "4x Wolfsfell"					);

					Doc_Show		( nDocID );

		Wolfsring_Ruestung = TRUE;

	Log_CreateTopic	(TOPIC_MOD_SCHMUCK, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_SCHMUCK, "Wolfsring der R¸stung: 1x Metallblock, 4x Wolfsfell");
};

INSTANCE ItWr_Bauplan_Wolfsring_Leben		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_Wolfsring_Leben;
	scemeName			=	"MAPSEALED";
	description			= 	"Bauplan: Wolfsring des Lebens";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_Wolfsring_Leben ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Wolfsring des Lebens"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Metallblock"					);
					Doc_PrintLines	( nDocID,  0, "4x Z‰hne"					);

					Doc_Show		( nDocID );

		Wolfsring_Leben = TRUE;

	Log_CreateTopic	(TOPIC_MOD_SCHMUCK, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_SCHMUCK, "Wolfsring des Lebens: 1x Metallblock, 4x Z‰hne");
};

INSTANCE ItWr_Bauplan_Wolfsamulett		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_Wolfsamulett;
	scemeName			=	"MAPSEALED";
	description			= 	"Bauplan: Amulett des Wolfes";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_Wolfsamulett ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Amulett des Wolfes"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Metallblock"					);
					Doc_PrintLines	( nDocID,  0, "3x Z‰hne"					);
					Doc_PrintLines	( nDocID,  0, "3x Wolfsfell"					);
					Doc_PrintLines	( nDocID,  0, "1x Spruchrolle 'Wolf beschwˆren'"					);

					Doc_Show		( nDocID );

		Wolfsamulett = TRUE;

	Log_CreateTopic	(TOPIC_MOD_SCHMUCK, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_SCHMUCK, "Amulett des Wolfes: 1x Metallblock, 3x Z‰hne, 3x Wolfsfell, 1x Spruchrolle 'Wolf beschwˆren'");
};

INSTANCE ItWr_Bauplan_AdanosRing		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_AdanosRing;
	scemeName			=	"MAPSEALED";
	description			= 	"Bauplan: Adanos' Ring des Wassers";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_AdanosRing ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Adanos' Ring des Wassers"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Metallblock"					);
					Doc_PrintLines	( nDocID,  0, "1x Erzbrocken"					);
					Doc_PrintLines	( nDocID,  0, "2x Aquamarin"					);
					Doc_PrintLines	( nDocID,  0, "1x Herz eines Eisgolems"					);

					Doc_Show		( nDocID );

		AdanosRing = TRUE;

	Log_CreateTopic	(TOPIC_MOD_SCHMUCK, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_SCHMUCK, "Adanos' Ring des Wassers: 1x Metallblock, 1x Erzbrocken, 2x Aquamarin, 1x Herz eines Eisgolems");
};

INSTANCE ItWr_Bauplan_AdanosBelt		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_AdanosBelt;
	scemeName			=	"MAPSEALED";
	description			= 	"Bauplan: Adanos' G¸rtel des Frostes";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_AdanosBelt ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Adanos' G¸rtel des Frostes"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Metallblock"					);
					Doc_PrintLines	( nDocID,  0, "2x Reptilienhaut"					);
					Doc_PrintLines	( nDocID,  0, "1x Erzbrocken"					);
					Doc_PrintLines	( nDocID,  0, "1x Bergkristall"					);
					Doc_PrintLines	( nDocID,  0, "1x Spruchrolle 'Eisblock'"					);

					Doc_Show		( nDocID );

		AdanosBelt = TRUE;

	Log_CreateTopic	(TOPIC_MOD_SCHMUCK, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_SCHMUCK, "Adanos' G¸rtel des Frostes: 1x Metallblock, 2x Reptilienhaut, 1x Erzbrocken, 1x Bergkristall, 1x Spruchrolle 'Eisblock'");
};

INSTANCE ItWr_Bauplan_AdanosAmulett		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_AdanosAmulett;
	scemeName			=	"MAPSEALED";
	description			= 	"Bauplan: Adanos' Amulett des Nebels";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_AdanosAmulett ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Adanos' Amulett des Nebels"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Metallblock"					);
					Doc_PrintLines	( nDocID,  0, "1x Goldbrocken"					);
					Doc_PrintLines	( nDocID,  0, "1x Erzbrocken"					);
					Doc_PrintLines	( nDocID,  0, "2x Aquamarin"					);
					Doc_PrintLines	( nDocID,  0, "1x Spruchrolle 'Eiswelle'"					);

					Doc_Show		( nDocID );

		AdanosAmulett = TRUE;

	Log_CreateTopic	(TOPIC_MOD_SCHMUCK, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_SCHMUCK, "Adanos' Amulett des Nebels: 1x Metallblock, 1x Goldbrocken, 1x Erzbrocken, 2x Aquamarin, 1x Spruchrolle 'Eiswelle'");
};

INSTANCE ItWr_Bauplan_DJG_M		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_DJG_M;
	scemeName			=	"MAPSEALED";
	description			= 	"Bauplan: Leichte Drachenj‰gerr¸stung verbessern";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_DJG_M ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Leichte Drachenj‰gerr¸stung verbessern"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "9x Drachenschnuppen"					);
					Doc_PrintLines	( nDocID,  0, "20x Erzbrocken"					);

					Doc_Show		( nDocID );
};

INSTANCE ItWr_Bauplan_DJG_H		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_DJG_H;
	scemeName			=	"MAPSEALED";
	description			= 	"Bauplan: Mittlere Drachenj‰gerr¸stung verbessern";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_DJG_H ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Mittlere Drachenj‰gerr¸stung verbessern"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "7x Drachenschnuppen"					);
					Doc_PrintLines	( nDocID,  0, "16x Erzbrocken"					);
					Doc_PrintLines	( nDocID,  0, "4x Drachenblut"					);

					Doc_Show		( nDocID );
};

INSTANCE ItWr_Bauplan_ChemischeKeule		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_ChemischeKeule;
	scemeName			=	"MAP";
	description			= 	"Bauplan: Chemische Keule";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_ChemischeKeule ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Chemische Keule"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "8x magisches Erz"					);
					Doc_PrintLines	( nDocID,  0, "2x Weihwasser"					);
					Doc_PrintLines	( nDocID,  0, "1x Goldbrocken"					);
					Doc_PrintLines	( nDocID,  0, "1x Schwefel"					);
					Doc_PrintLines	( nDocID,  0, "1x Reptilienhaut"					);
					Doc_PrintLines	( nDocID,  0, "2x starker Tabak"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Alles auf die Trefferfl‰che einer Keule schmieden und die chemische Keule an einem Schrein Innos weihen."					);

					Doc_Show		( nDocID );
};

INSTANCE ItWr_Bauplan_RingGewandtheit		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_RingGewandtheit;
	scemeName			=	"MAPSEALED";
	description			= 	"Bauplan: Rechter Ring der Gewandtheit";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_RingGewandtheit ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Rechter Ring der Gewandtheit"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Metallblock"					);
					Doc_PrintLines	( nDocID,  0, "1x Horn eines Drachensnappers"					);
					Doc_PrintLines	( nDocID,  0, "2x Knochen eines Goblins"					);

					Doc_Show		( nDocID );

		RingGewandtheit = TRUE;

	Log_CreateTopic	(TOPIC_MOD_SCHMUCK, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_SCHMUCK, "Rechter Ring der Gewandtheit: 1x Metallblock, 1x Horn eines Drachensnappers, 2x Knochen eines Goblins");
};

INSTANCE ItWr_Bauplan_RingAusdauer		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_RingAusdauer;
	scemeName			=	"MAPSEALED";
	description			= 	"Bauplan: Linker Ring der Ausdauer";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_RingAusdauer ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Linker Ring der Ausdauer"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Metallblock"					);
					Doc_PrintLines	( nDocID,  0, "1x Trank der Geschwindigkeit"					);
					Doc_PrintLines	( nDocID,  0, "2x Fl¸gel"					);

					Doc_Show		( nDocID );

		RingAusdauer = TRUE;

	Log_CreateTopic	(TOPIC_MOD_SCHMUCK, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_SCHMUCK, "Linker Ring der Ausdauer: 1x Metallblock, 1x Trank der Geschwindigkeit, 2x Fl¸gel");
};

INSTANCE ItWr_Bauplan_RingStaerke		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_RingStaerke;
	scemeName			=	"MAPSEALED";
	description			= 	"Bauplan: Rechter Ring der St‰rke";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_RingStaerke ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Rechter Ring der St‰rke"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Metallblock"					);
					Doc_PrintLines	( nDocID,  0, "1x Horn eines Drachensnappers"					);
					Doc_PrintLines	( nDocID,  0, "2x Knochen eines Goblins"					);

					Doc_Show		( nDocID );

		RingStaerke = TRUE;

	Log_CreateTopic	(TOPIC_MOD_SCHMUCK, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_SCHMUCK, "Rechter Ring der St‰rke: 1x Metallblock, 1x Horn eines Drachensnappers, 2x Knochen eines Goblins");
};

INSTANCE ItWr_Bauplan_RingHiebe		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_RingHiebe;
	scemeName			=	"MAPSEALED";
	description			= 	"Bauplan: Linker Ring der Hiebe";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_RingHiebe ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Linker Ring der Hiebe"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Metallblock"					);
					Doc_PrintLines	( nDocID,  0, "1x Trank der Geschwindigkeit"					);
					Doc_PrintLines	( nDocID,  0, "2x Lurkerklaue"					);

					Doc_Show		( nDocID );

		RingHiebe = TRUE;

	Log_CreateTopic	(TOPIC_MOD_SCHMUCK, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_SCHMUCK, "Linker Ring der Hiebe: 1x Metallblock, 1x Trank der Geschwindigkeit, 2x Lurkerklaue");
};

INSTANCE ItWr_Bauplan_Snapperbogen		(C_Item)
{
	name 				=	"Bauplan";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Bauplan*3;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBauplan_Snapperbogen;
	scemeName			=	"MAPSEALED";
	description			= 	"Bauplan: Snapperbogen";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseBauplan_Snapperbogen ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Snapperbogen"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1 x Jagdbogen"					);
					Doc_PrintLines	( nDocID,  0, "3 x Ast"					);
					Doc_PrintLines	( nDocID,  0, "2 x Drachensnapperhorn"					);
					Doc_PrintLines	( nDocID,  0, "1 x Drachensnappersehne"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Hinweis: Dieser Bogen zeichnet sich durch groﬂe Reichweite und einfache Handhabung aus."					);

					Doc_Show		( nDocID );

		if (Snapperbogen == FALSE)
		{
			Snapperbogen = TRUE;

			AI_Output(hero, NULL, "Info_Mod_Snapperbogen_15_00"); //Ich sollte in Erfahrung bringen, woher ich eine Drachensnappersehne bekomme.
		};
};