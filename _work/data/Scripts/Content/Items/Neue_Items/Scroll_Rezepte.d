const int Value_Scroll_Firebolt		= 50;
const int Value_Scroll_Icebolt 		= 50;
const int Value_Scroll_Zap 		= 50;
const int Value_Scroll_SumWolf		= 50;
const int Value_Scroll_SumGobSkel	= 100;
const int Value_Scroll_SumSkel		= 200;
const int Value_Scroll_SummonGuardian	= 200;
const int Value_Scroll_SummonZombie	= 300;
const int Value_Scroll_SumGol		= 300;
const int Value_Scroll_SumDemon		= 400;
const int Value_Scroll_ArmyOfDarkness	= 500;
const int Value_Scroll_InstantIceball	= 100;
const int Value_Scroll_Icelance		= 100;
const int Value_Scroll_Geyser		= 200;
const int Value_Scroll_Icecube		= 200;
const int Value_Scroll_Waterfist	= 300;
const int Value_Scroll_Icewave		= 400;
const int Value_Scroll_Icerain		= 500;
const int Value_Scroll_InstantFireball	= 100;
const int Value_Scroll_Firestorm	= 200;
const int Value_Scroll_ChargeFireball	= 300;
const int Value_Scroll_Pyrokinesis	= 400;
const int Value_Scroll_Firerain		= 500;
const int Value_Scroll_Thunderstorm	= 200;
const int Value_Scroll_Thunderball	= 200;
const int Value_Scroll_LightningFlash	= 300;
const int Value_Scroll_SuckEnergy	= 50;
const int Value_Scroll_Zerfleischen	= 200;
const int Value_Scroll_BeliarsRage	= 200;
const int Value_Scroll_Skull		= 400;
const int Value_Scroll_BreathOfDeath	= 500;
const int Value_Scroll_LightHeal	= 50;
const int Value_Scroll_MediumHeal	= 200;
const int Value_Scroll_FullHeal		= 400;
const int Value_Scroll_Light		= 50;
const int Value_Scroll_Shrink		= 500;
const int Value_Scroll_HarmUndead	= 500;

INSTANCE ItWr_Scroll_Firebolt		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Firebolt;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Firebolt;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Feuerpfeil";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Firebolt ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Feuerpfeil - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Schwefel"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_FIREBOLT] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´FEUERPFEIL´: 1 Schwefel");

			PLAYER_TALENT_SCROLLS[SCROLL_FIREBOLT] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Icebolt		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Icebolt;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Icebolt;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Eispfeil";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Icebolt ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Eispfeil - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Gletscher Quarz"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_ICEBOLT] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´EISPFEIL´: 1 Gletscher Quarz");

			PLAYER_TALENT_SCROLLS[SCROLL_ICEBOLT] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Zap		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Zap;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Zap;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Blitz";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Zap ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Blitz - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Bergkristall"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_ZAP] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´BLITZ´: 1 Bergkristall");

			PLAYER_TALENT_SCROLLS[SCROLL_ZAP] = TRUE;
		};
};

INSTANCE ItWr_Scroll_SumWolf		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_SumWolf;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_SumWolf;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Wolf rufen";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_SumWolf ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Wolf rufen - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Wolfsfell"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_SUMWOLF] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´WOLF RUFEN´: 1 Wolfsfell");

			PLAYER_TALENT_SCROLLS[SCROLL_SUMWOLF] = TRUE;
		};
};

INSTANCE ItWr_Scroll_SumGobSkel		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_SumGobSkel;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_SumGobskel;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Goblin - Skelett erschaffen";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_SumGobSkel ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Goblin - Skelett erschaffen - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Goblinknochen"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_SUMGOBSKEL] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´GOBLINSKELETT ERSCHAFFEN´: 1 Goblinknochen");

			PLAYER_TALENT_SCROLLS[SCROLL_SUMGOBSKEL] = TRUE;
		};
};

INSTANCE ItWr_Scroll_SumSkel		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_SumSkel;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_SumSkel;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Skelett beschwören";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_SumSkel ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Skelett beschwören - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Skelettknochen"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_SUMSKEL] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´SKELET BESCHWÖREN´: 1 Skelettknochen");

			PLAYER_TALENT_SCROLLS[SCROLL_SUMSKEL] = TRUE;
		};
};

INSTANCE ItWr_Scroll_SummonGuardian		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_SummonGuardian;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_SummonGuardian;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Wächter erschaffen";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_SummonGuardian ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Wächter erschaffen - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x alte Münze"					);
					Doc_PrintLines	( nDocID,  0, "1x Bergkristall"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_SUMMONGUARDIAN] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´WÄCHTER BESCHWÖREN´: 1 alte Münze und 1 Bergkristall");

			PLAYER_TALENT_SCROLLS[SCROLL_SUMMONGUARDIAN] = TRUE;
		};
};

INSTANCE ItWr_Scroll_SumGol		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_SumGol;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_SumGol;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Golem erschaffen";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_SumGol ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Golem erschaffen - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x alte Münze"					);
					Doc_PrintLines	( nDocID,  0, "1x Bergkristall"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_SUMGOL] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´GOLEM ERSCHAFFEN´: 1 Steingolemherz");

			PLAYER_TALENT_SCROLLS[SCROLL_SUMGOL] = TRUE;
		};
};

INSTANCE ItWr_Scroll_SummonZombie		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_SummonZombie;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_SummonZombie;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Zombie beschwören";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_SummonZombie ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Zombie beschwören - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Zombiefleisch"					);
					Doc_PrintLines	( nDocID,  0, "1x Skelettknochen"					);
					Doc_PrintLines	( nDocID,  0, "2x Menschenblut"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_SUMMONZOMBIE] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´ZOMBIE BESCHWÖREN´: 1 Zombiefleisch, 1 Knochen und 2 Fläschchen Menschenblut");

			PLAYER_TALENT_SCROLLS[SCROLL_SUMMONZOMBIE] = TRUE;
		};
};

INSTANCE ItWr_Scroll_SumDemon		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_SumDemon;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_SumDemon;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Dämon beschwören";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_SumDemon ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Dämon beschwören - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Dämonenherz"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_SUMDEMON] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´DÄMON BESCHWÖREN´: 1 Dämonenherz");

			PLAYER_TALENT_SCROLLS[SCROLL_SUMDEMON] = TRUE;
		};
};

INSTANCE ItWr_Scroll_ArmyOfDarkness		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_ArmyOfDarkness;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_ArmyOfDarkness;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Armee der Finsternis";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_ArmyOfDarkness ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Armee der Finsternis - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Dämonenherz"					);
					Doc_PrintLines	( nDocID,  0, "1x Skelettknochen"					);
					Doc_PrintLines	( nDocID,  0, "1x Steigolemherz"					);
					Doc_PrintLines	( nDocID,  0, "1x schwarze Perle"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_ARMYOFDARKNESS] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´ARMEE DER FINSTERNIS´: 1 Skelettknochen, 1 schwarze Perle, 1 Herz eines Steingolems und 1 Dämonenherz");

			PLAYER_TALENT_SCROLLS[SCROLL_ARMYOFDARKNESS] = TRUE;
		};
};

INSTANCE ItWr_Scroll_InstantIceball		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_InstantIceball;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_InstantIceball;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Eisball";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_InstantIceball ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Eisball - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Pech"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_INSTANTICEBALL] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´EISBALL´: 1 Pech");

			PLAYER_TALENT_SCROLLS[SCROLL_INSTANTICEBALL] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Icelance		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Icelance;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Icelance;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Eislanze";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Icelance ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Eislanze - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Pech"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_ICELANCE] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´EISLANZE´: 1 Pech");

			PLAYER_TALENT_SCROLLS[SCROLL_ICELANCE] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Geyser		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Geyser;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Geyser;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Geysir";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Geyser ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Geysir - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Aquamarin"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_GEYSER] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´GEYSIR´: 1 Aquamarin");

			PLAYER_TALENT_SCROLLS[SCROLL_GEYSER] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Icecube		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Icecube;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Icecube;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Eisblock";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Icecube ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Eisblock - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Aquamarin"					);
					Doc_PrintLines	( nDocID,  0, "1x Gletscher Quartz"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_ICECUBE] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´EISBLOCK´: 1 Gletscher Quartz und 1 Aquamarin");

			PLAYER_TALENT_SCROLLS[SCROLL_ICECUBE] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Waterfist		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Waterfist;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Waterfist;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Wasserfaust";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Waterfist ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Wasserfaust - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Aquamarin"					);
					Doc_PrintLines	( nDocID,  0, "1x Bergkristall"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_WATERFIST] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´WASSERFAUST´: 1 Aquamarin und 1 Bergkristall");

			PLAYER_TALENT_SCROLLS[SCROLL_WATERFIST] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Icewave		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Icewave;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Icewave;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Eiswelle";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Icewave ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Eiswelle - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Gletscher Quartz"					);
					Doc_PrintLines	( nDocID,  0, "1x Aquamarin"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_ICEWAVE] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´EISWELLE´: 1 Gletscher Quartz und 1 Aquamarin");

			PLAYER_TALENT_SCROLLS[SCROLL_ICEWAVE] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Icerain		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Icerain;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Icerain;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Eisregen";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Icerain ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Eisregen - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Pech"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_ICERAIN] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´EISREGEN´: 1 Pech");

			PLAYER_TALENT_SCROLLS[SCROLL_ICERAIN] = TRUE;
		};
};

INSTANCE ItWr_Scroll_InstantFireball		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_InstantFireball;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_InstantFireball;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Feuerball";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_InstantFireball ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Feuerball - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Pech"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_INSTANTFIREBALL] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´FEUERBALL´: 1 Pech");

			PLAYER_TALENT_SCROLLS[SCROLL_INSTANTFIREBALL] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Firestorm		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Firestorm;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Firestorm;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Kleiner Feuersturm";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Firestorm ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Kleiner Feuersturm - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Pech"					);
					Doc_PrintLines	( nDocID,  0, "1x Schwefel"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_FIRESTORM] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´KLEINER FEUERSTURM´: 1 Pech und 1 Schwefel");

			PLAYER_TALENT_SCROLLS[SCROLL_FIRESTORM] = TRUE;
		};
};

INSTANCE ItWr_Scroll_ChargeFireball		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_ChargeFireball;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_ChargeFireball;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Großer Feuerball";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_ChargeFireball ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Großer Feuerball - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Pech"					);
					Doc_PrintLines	( nDocID,  0, "1x Schwefel"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_CHARGEFIREBALL] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´GROßER FEUERBALL´: 1 Pech und 1 Schwefel");

			PLAYER_TALENT_SCROLLS[SCROLL_CHARGEFIREBALL] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Pyrokinesis		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Pyrokinesis;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Pyrokinesis;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Großer Feuersturm";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Pyrokinesis ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Großer Feuersturm - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Schwefel"					);
					Doc_PrintLines	( nDocID,  0, "1x Zunge eines Feuerwarans"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_PYROKINESIS] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´GROßER FEUERSTURM´: 1 Schwefel und 1 Zunge eines Feuerwarans");

			PLAYER_TALENT_SCROLLS[SCROLL_PYROKINESIS] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Firerain		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Firerain;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Firerain;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Feuerregen";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Firerain ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Feuerregen - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Pech"					);
					Doc_PrintLines	( nDocID,  0, "1x Zunge eines Feuerwarans"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_FIRERAIN] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´FEUERREGEN´: 1 Pech und 1 Zunge eines Feuerwarans");

			PLAYER_TALENT_SCROLLS[SCROLL_FIRERAIN] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Thunderstorm		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Thunderstorm;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Thunderstorm;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Unwetter";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Thunderstorm ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Unwetter - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Gletscher Quartz"					);
					Doc_PrintLines	( nDocID,  0, "1x Flügel"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_THUNDERSTORM] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´UNWETTER´: 1 Gletscher Quartz und 1 Flügel");

			PLAYER_TALENT_SCROLLS[SCROLL_THUNDERSTORM] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Thunderball		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Thunderball;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Thunderball;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Kugelblitz";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Thunderball ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Kugelblitz - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Schwefel"					);
					Doc_PrintLines	( nDocID,  0, "1x Bergkristall"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_THUNDERBALL] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´KUGELBLITZ´: 1 Schwefel und 1 Bergkristall");

			PLAYER_TALENT_SCROLLS[SCROLL_THUNDERBALL] = TRUE;
		};
};

INSTANCE ItWr_Scroll_LightningFlash		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_LightningFlash;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_LightningFlash;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Blitzschlag";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_LightningFlash ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Blitzschlag - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Gletscher Quartz"					);
					Doc_PrintLines	( nDocID,  0, "1x Bergkristall"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_LIGHTNINGFLASH] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´BLITZSCHLAG´: 1 Gletscher Quartz und 1 Bergkristall");

			PLAYER_TALENT_SCROLLS[SCROLL_LIGHTNINGFLASH] = TRUE;
		};
};

INSTANCE ItWr_Scroll_SuckEnergy		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_SuckEnergy;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_SuckEnergy;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Energie stehlen";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_SuckEnergy ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Energie stehlen - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Menschenblut"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_SUCKENERGY] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´ENERGIE STEHLEN´: 1 Menschenblut");

			PLAYER_TALENT_SCROLLS[SCROLL_SUCKENERGY] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Zerfleischen		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Zerfleischen;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Zerfleischen;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Zerfleischen";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Zerfleischen ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Zerfleischen - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Pech"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_ZERFLEISCHEN] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´ZERFLEISCHEN´: 1 Pech");

			PLAYER_TALENT_SCROLLS[SCROLL_ZERFLEISCHEN] = TRUE;
		};
};

INSTANCE ItWr_Scroll_BeliarsRage		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_BeliarsRage;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_BeliarsRage;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Beliars Zorn";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_BeliarsRage ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Beliars Zorn - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Schwarze Perle"					);
					Doc_PrintLines	( nDocID,  0, "2x Kohle"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_BELIARSRAGE] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´BELIARS ZORN´: 1 Schwarze Perle und 2 Kohle");

			PLAYER_TALENT_SCROLLS[SCROLL_BELIARSRAGE] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Skull		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Skull;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Skull;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Schrei der Toten";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Skull ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Schrei der Toten - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "2x Menschenblut"					);
					Doc_PrintLines	( nDocID,  0, "3x Zombiefleisch"					);
					Doc_PrintLines	( nDocID,  0, "2x Skelettknochen"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_SKULL] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´SCHREI DER TOTEN´: 2 Menschenblut, 3 Zombiefleisch und 2 Skelettknochen");

			PLAYER_TALENT_SCROLLS[SCROLL_SKULL] = TRUE;
		};
};

INSTANCE ItWr_Scroll_BreathOfDeath		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_BreathOfDeath;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_BreathOfDeath;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Todeshauch";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_BreathOfDeath ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Todeshauch - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Schwarze Perle"					);
					Doc_PrintLines	( nDocID,  0, "1x Kohle"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_BREATHOFDEATH] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´TODESHAUCH´: 1 Schwarze Perle und 1 Kohle");

			PLAYER_TALENT_SCROLLS[SCROLL_BREATHOFDEATH] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Light		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Light;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Light;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Licht";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Light ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Licht - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Goldmünze"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_LIGHT] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´LICHT´: 1 Goldmünze");

			PLAYER_TALENT_SCROLLS[SCROLL_LIGHT] = TRUE;
		};
};

INSTANCE ItWr_Scroll_Shrink		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_Shrink;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_Shrink;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Monster schrumpfen";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_Shrink ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Monster schrumpfen - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Goblinknochen"					);
					Doc_PrintLines	( nDocID,  0, "1x Trollzahn"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_SHRINK] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´MONSTER SCHRUMPFEN´: 1 Goblinknochen und 1 Trollzahn");

			PLAYER_TALENT_SCROLLS[SCROLL_SHRINK] = TRUE;
		};
};

INSTANCE ItWr_Scroll_HarmUndead		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_HarmUndead;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_HarmUndead;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Untote vernichten";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_HarmUndead ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Untote vernichten - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Heiliges Wasser"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_HARMUNDEAD] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´UNTOTE VERNICHTEN´: 1 Heiliges Wasser");

			PLAYER_TALENT_SCROLLS[SCROLL_HARMUNDEAD] = TRUE;
		};
};

INSTANCE ItWr_Scroll_LightHeal		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_LightHeal;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_LightHeal;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Leichte Wunden heilen";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_LightHeal ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Leichte Wunden heilen - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Heilpflanze"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_LIGHTHEAL] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´LEICHTE WUNDEN HEILEN´: 1 Heilpflanze");

			PLAYER_TALENT_SCROLLS[SCROLL_LIGHTHEAL] = TRUE;
		};
};

INSTANCE ItWr_Scroll_MediumHeal		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_MediumHeal;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_MediumHeal;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Mittlere Wunden heilen";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_MediumHeal ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Mittlere Wunden heilen - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Heilkraut"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_MEDIUMHEAL] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´MITTLERE WUNDEN HEILEN´: 1 Heilkraut");

			PLAYER_TALENT_SCROLLS[SCROLL_MEDIUMHEAL] = TRUE;
		};
};

INSTANCE ItWr_Scroll_FullHeal		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Scroll_FullHeal;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseScroll_FullHeal;
	scemeName			=	"MAPSEALED";
	description			= 	"Rezept: Schwere Wunden heilen";
	TEXT[5]	= NAME_Value;
	Count[5] = value;
};

func void UseScroll_FullHeal ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Schwere Wunden heilen - Spruchrolle"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "1x Heilwurzel"					);

					Doc_Show		( nDocID );

		if (PLAYER_TALENT_SCROLLS[SCROLL_FULLHEAL] == FALSE)
		{
			B_LogEntry	(TOPIC_TalentScrolls, "Zutaten für die Spruchrolle ´SCHWERE WUNDEN HEILEN´: 1 Heilwurzel");

			PLAYER_TALENT_SCROLLS[SCROLL_FULLHEAL] = TRUE;
		};
};