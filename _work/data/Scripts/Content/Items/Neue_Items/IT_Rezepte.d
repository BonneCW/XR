const int Value_Rezept = 100;

INSTANCE ItWr_Rezept_Fischragout		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Rezept;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRezept_Fischragout;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Fischragout";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseRezept_Fischragout ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Fischragout"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "2x Fisch"					);
					Doc_PrintLines	( nDocID,  0, "1x Waldbeere"					);

					Doc_Show		( nDocID );

	if (!Rezept_Fischragout)
	{
		Rezept_Fischragout = TRUE;

		Log_CreateTopic	(TOPIC_MOD_KOCHREZEPTE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_KOCHREZEPTE, "Fischragout: 2x Fisch, 1x Waldbeere");
	};
};

INSTANCE ItWr_Rezept_Fischsuppe		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Rezept;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRezept_Fischsuppe;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Fischsuppe";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseRezept_Fischsuppe ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Fischsuppe"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Fisch"					);

					Doc_Show		( nDocID );

	if (!Rezept_Fischsuppe)
	{
		Rezept_Fischsuppe = TRUE;

		Log_CreateTopic	(TOPIC_MOD_KOCHREZEPTE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_KOCHREZEPTE, "Fischsuppe: 1x Fisch");
	};
};

INSTANCE ItWr_Rezept_Fleischwanzenragout		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Rezept;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRezept_Fleischwanzenragout;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Fleischwanzenragout";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseRezept_Fleischwanzenragout ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Fleischwanzenragout"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "2x Dunkelpilz"					);
					Doc_PrintLines	( nDocID,  0, "1x Wanzenfleisch"					);

					Doc_Show		( nDocID );

	if (!Rezept_Fleischwanzenragout)
	{
		Rezept_Fleischwanzenragout = TRUE;

		Log_CreateTopic	(TOPIC_MOD_KOCHREZEPTE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_KOCHREZEPTE, "Fleischwanzenragout: 2x Dunkelpilz, 1x Wanzenfleisch");
	};
};

INSTANCE ItWr_Rezept_Pilzsuppe		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Rezept;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRezept_Pilzsuppe;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Pilzsuppe";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseRezept_Pilzsuppe ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Pilzsuppe"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "2x Dunkelpilz"					);
					Doc_PrintLines	( nDocID,  0, "1x Buddlerfleisch"					);

					Doc_Show		( nDocID );

	if (!Rezept_Pilzsuppe)
	{
		Rezept_Pilzsuppe = TRUE;

		Log_CreateTopic	(TOPIC_MOD_KOCHREZEPTE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_KOCHREZEPTE, "Pilzsuppe: 2x Dunkelpilz, 1x Buddlerfleisch");
	};
};

INSTANCE ItWr_Rezept_Fleischeintopf		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Rezept;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRezept_Fleischeintopf;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Fleischeintopf";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseRezept_Fleischeintopf ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Fleischeintopf"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "2x rohes Fleisch"					);
					Doc_PrintLines	( nDocID,  0, "1x Feldr¸be"					);
					Doc_PrintLines	( nDocID,  0, "1x Waldbeere"					);

					Doc_Show		( nDocID );

	if (!Rezept_Fleischeintopf)
	{
		Rezept_Fleischeintopf = TRUE;

		Log_CreateTopic	(TOPIC_MOD_KOCHREZEPTE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_KOCHREZEPTE, "Fleischeintopf: 2x rohes Fleisch, 1x Feldr¸be, 1x Waldbeere");
	};
};

INSTANCE ItWr_Rezept_Orkbier		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Rezept;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRezept_Orkbier;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Orkbier";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseRezept_Orkbier ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Orkbier"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Bier"					);
					Doc_PrintLines	( nDocID,  0, "1x Wacholder"					);
					Doc_PrintLines	( nDocID,  0, "1x Buddlerfleisch"					);

					Doc_Show		( nDocID );

	if (!Rezept_Orkbier)
	{
		Rezept_Orkbier = TRUE;

		Log_CreateTopic	(TOPIC_MOD_KOCHREZEPTE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_KOCHREZEPTE, "Orkbier: 1x Bier, 1x Wacholder, 1x Buddlerfleisch");
	};
};

INSTANCE ItWr_Rezept_Fangheuschreckensuppe		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Rezept;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRezept_Fangheuschreckensuppe;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Fangheuschreckensuppe";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseRezept_Fangheuschreckensuppe ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Fangheuschreckensuppe"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Fangheuschreckenkopf"					);
					Doc_PrintLines	( nDocID,  0, "2x Wasser"					);
					Doc_PrintLines	( nDocID,  0, "1x Fisch"					);

					Doc_Show		( nDocID );

	if (!Rezept_Fangheuschreckensuppe)
	{
		Rezept_Fangheuschreckensuppe = TRUE;

		Log_CreateTopic	(TOPIC_MOD_KOCHREZEPTE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_KOCHREZEPTE, "Fangheuschreckensuppe: 1x Fisch, 1x Wasser, 1x Fangheuschreckenkopf");
	};
};

INSTANCE ItWr_Rezept_Rumtopf		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Rezept;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRezept_Rumtopf;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Rumtopf";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseRezept_Rumtopf ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Rumtopf"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Rum"					);
					Doc_PrintLines	( nDocID,  0, "1x Zucker"					);
					Doc_PrintLines	( nDocID,  0, "3x Waldbeere"					);

					Doc_Show		( nDocID );

	if (!Rezept_Rumtopf)
	{
		Rezept_Rumtopf = TRUE;

		Log_CreateTopic	(TOPIC_MOD_KOCHREZEPTE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_KOCHREZEPTE, "Rumtopf: 1x Rum, 1x Zucker, 3x Waldbeere");
	};
};

INSTANCE ItWr_Rezept_Blutkult		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Rezept;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRezept_Blutkult;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: D‰moneneintopf der Verdammnis";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseRezept_Blutkult ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "D‰moneneintopf der Verdammnis"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x D‰monenherz"					);
					Doc_PrintLines	( nDocID,  0, "2x Feuerzunge"					);
					Doc_PrintLines	( nDocID,  0, "3x Fliegenpilz"					);
					Doc_PrintLines	( nDocID,  0, "2x Zombiefleisch"					);
					Doc_PrintLines	( nDocID,  0, "4x Blut"					);

					Doc_Show		( nDocID );

	if (!Rezept_Blutkult)
	{
		Rezept_Blutkult = TRUE;

		Log_CreateTopic	(TOPIC_MOD_KOCHREZEPTE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_KOCHREZEPTE, "D‰moneneintopf der Verdammnis: 1x D‰monenherz, 2x Feuerzunge, 3x Fliegenpilz, 2x Zombiefleisch, 4x Blut");
	};
};

INSTANCE ItWr_Rezept_Iwan		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Rezept;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRezept_Iwan;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Heilige Geschosse";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseRezept_Iwan ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Heilige Geschosse"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Man lˆse 2 silberne Ringe in einem Fl‰schchen Salpeters‰ure auf, und mische eine Flasche Weihwasser hinzu. Klingen und Pfeile, die man mit dieser Tinktur benetzt, kˆnnen untote und d‰monische Geschˆpfe schwer versehren."					);

					Doc_Show		( nDocID );

		if (!Rezept_Iwan)
		{
			Rezept_Iwan = TRUE;

			Log_CreateTopic	(TOPIC_MOD_PFEILE, LOG_NOTE);
			B_LogEntry	(TOPIC_MOD_PFEILE, "Ich kann meine Pfeile an einem Alchemietisch mit Weihwasser segnen. Sie verursachen dann mehr Schaden gegen Kreaturen des Bˆsen. F¸r die Tinktur benˆtige ich zwei silberne Ringe und normales Weihwasser.");
		};
};

INSTANCE ItWr_DrachensudManaverbrennung		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Rezept;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseDrachensudManaverbrennung;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Drachensud der Manaverbrennung";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseDrachensudManaverbrennung ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Drachensud der Manaverbrennung"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "4x Drachenei");
					Doc_PrintLines	( nDocID,  0, "1x Drachenwurzel");
					Doc_PrintLines	( nDocID,  0, "2x Drachenblut");
					Doc_PrintLines	( nDocID,  0, "1x zerriebene Drachenschuppe");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Kˆcheln, bis sich ein z‰her Sud daraus gebildet hat.");

					Doc_Show		( nDocID );

	if (!DrachensudManaverbrennung)
	{
		DrachensudManaverbrennung = TRUE;

		Log_CreateTopic	(TOPIC_MOD_KOCHREZEPTE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_KOCHREZEPTE, "Drachensud der Manaverbrennung: 4x Drachenei, 1x Drachenwurzel, 2x Drachenblut, 1x zerriebene Drachenschuppe");
	};
};

INSTANCE ItWr_Weisenchronik		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Rezept;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseWeisenchronik;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Weisenchronik";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseWeisenchronik ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Weisenchronik"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Das Kraut eines schwarzen Weisen und eines Traumrufes in starken Alkohol mischen, das ganze 5min in geschlossener Flasche erhitzen.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Am besten vor dem Schlafengehen zu genieﬂen.");

					Doc_Show		( nDocID );

		Weisenchronik = TRUE;
};

INSTANCE ItWr_Rezept_FolgsamkeitSnapper		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Rezept;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseFolgsamkeitSnapper;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Folgsamkeit des Snappers";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UseFolgsamkeitSnapper ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Folgsamkeit des Snappers"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1 Menschenblut");
					Doc_PrintLines	( nDocID,  0, "1 Hexenblut");
					Doc_PrintLines	( nDocID,  0, "1 Drachensnapperhorn");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Das Horn zerreiben und alle Ingredienzien am Labortisch zu einem Trank vereinen. Er besitzt nicht nur die Eigenschaft Snapper zu Kampfgenossen zu machen ... (zerrissen)");

					Doc_Show		( nDocID );

		FolgsamkeitSnapper = TRUE;
};

INSTANCE ItWr_Rezept_Purpurmond		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Rezept;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseFolgsamkeitSnapper;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Purpurmond";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;
};

func void UsePurpurmond ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Purpurmond"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Einen Fliegenpilz und das Kraut zweier St‰ngels 10min in Milch aufkochen.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Am besten vor dem Schlafengehen zu genieﬂen.");

					Doc_Show		( nDocID );

		Purpurmond = TRUE;
};