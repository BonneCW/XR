var int Mod_Ritualplatz_Used;

INSTANCE ItWr_BookForFaris (C_ITEM)
{
	name 					=	"Altes Buch";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	5000;

	visual 					=	"ItWr_Book_02_03.3ds";  					
	material 				=	MAT_LEATHER;

	description				= 	"";
	
	TEXT[2] 				=  "Ein altes Buch";
	TEXT[3] 				=  "Es ist magisch verschlossen";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

INSTANCE Mod_XardasBriefAnKarras (C_ITEM)
{
	name		=	"Xardas' Botschaft";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_02.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_XardasBriefAnKarras_Versiegelt;
	scemeName	=	"MAPSEALED";
	description	=	name;
	TEXT[2]		=	"Diese Botschaft wurde sorgfältig versiegelt.";
};
var int Use_XardasBriefAnKarras_OneTime;
FUNC VOID Use_XardasBriefAnKarras()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, "Werter Karras,"	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLines	( nDocID, 0, "Ich habe es tatsächlich geschafft. Der Zauber, den wir in dem Buch gefunden haben hat den Bezwinger des Schläfers das Leben gerettet.");
		Doc_PrintLines	( nDocID, 0, "Er lebt und wird dir diese Nachricht überbringen. Gib ihm das Buch und schicke ihn damit zu mir. Aber vergiss nicht das Buch zu versiegeln.");
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLine	( nDocID, 0, "Xardas"		);
		Doc_Show	( nDocID );

	if (Use_XardasBriefAnKarras_OneTime	==	FALSE)
	{
		Use_XardasBriefAnKarras_OneTime	=	TRUE;
	};
};

FUNC VOID Use_XardasBriefAnKarras_Versiegelt()
{
	CreateInvItems	(self, Mod_XardasBriefAnKarras_Geoeffnet, 1);
	XardasBriefAnKarrasOpened	=	TRUE;
	Use_XardasBriefAnKarras();
};

INSTANCE ItWr_OleForAndre (C_ITEM)
{
	name		=	"Oles Brief an Lord Andre";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_02.3DS";
	material	=	MAT_LEATHER;
	description	=	name;
	TEXT[2]		=	"Diese Botschaft wurde sorgfältig versiegelt.";
};

INSTANCE ItWr_NamibForBeliar (C_ITEM)
{
	name		=	"Namib's Brief";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_02.3DS";
	material	=	MAT_LEATHER;
	description	=	name;
	TEXT[2]		=	"Diese Botschaft wurde sorgfältig versiegelt.";
};

INSTANCE ItWr_GDG_Almanach (C_ITEM)
{
	name 					=	"Altes Buch";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	5000;

	visual 					=	"ItWr_Book_02_03.3ds";  					
	material 				=	MAT_LEATHER;

	description				= 	"";
	
	TEXT[2] 				=  "Ein altes Buch";
	TEXT[3] 				=  "Es ist magisch verschlossen";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

INSTANCE ItWr_GDG_Almanach_Offen (C_ITEM)
{
	name 					=	"Altes Buch";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	5000;

	visual 					=	"ItWr_Book_02_03.3ds";  					
	material 				=	MAT_LEATHER;

	on_state[0]	=	Use_GDGAlmanach;
	scemeName	=	"MAP";

	description				= 	"";
	
	TEXT[2] 				=  "Ein altes Buch";
	TEXT[3] 				=  "Es ist magisch verschlossen";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

FUNC VOID Use_GDGAlmanach()
{
	var int nDocID;

	if (Mod_Gilde == 3)
	{
		nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, "Verbesserung einer Rüstung"	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLines	( nDocID, 0, "Um die Rüstung eines Paladins weiter zu verbessern muss man drei weiße Tigerfelle und eine Paladinrüstung an einem Amboss verbinden.");
		Doc_PrintLines	( nDocID, 0, "");
		Doc_PrintLines	( nDocID, 0, ""			);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLine	( nDocID, 0, "");
		Doc_Show	( nDocID );
	}
	else if (Mod_Gilde == 5)
	{
		nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, "Verbesserung einer Rüstung"	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLines	( nDocID, 0, "Um die Rüstung eines Drachenjägers weiter zu verbessern muss man drei silberne Trollfelle und eine Schwere Drachenjägerüstung an einem Amboss verbinden.");
		Doc_PrintLines	( nDocID, 0, "");
		Doc_PrintLines	( nDocID, 0, ""			);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLine	( nDocID, 0, "");
		Doc_Show	( nDocID );
	}
	else if (Mod_Gilde == 8)
	{
		nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, "Verbesserung einer Robe"	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLines	( nDocID, 0, "Um die Robe eines Ordenspriester weiter zu verbessern muss man drei weiße Tigerfelle und eine Ordenspriesterrobe an einem Runentisch verbinden.");
		Doc_PrintLines	( nDocID, 0, "");
		Doc_PrintLines	( nDocID, 0, ""			);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLine	( nDocID, 0, "");
		Doc_Show	( nDocID );
	}
	else if (Mod_Gilde == 11)
	{
		nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, "Verbesserung einer Robe"	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLines	( nDocID, 0, "Um die Robe eines Richters weiter zu verbessern muss man drei Wasserorkfelle und eine Richterrobe an einem Runentisch verbinden.");
		Doc_PrintLines	( nDocID, 0, "");
		Doc_PrintLines	( nDocID, 0, ""			);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLine	( nDocID, 0, "");
		Doc_Show	( nDocID );
	}
	else if (Mod_Gilde == 14)
	{
		nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, "Verbesserung einer Robe"	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLines	( nDocID, 0, "Um die Robe eines Dämonenbeschwörers weiter zu verbessern muss man drei Lindwurmhäute und eine Dämonenbeschwörerrobe an einem Runentisch verbinden.");
		Doc_PrintLines	( nDocID, 0, "");
		Doc_PrintLines	( nDocID, 0, ""			);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLine	( nDocID, 0, "");
		Doc_Show	( nDocID );
	}
	else if (Mod_Gilde == 16)
	{
		nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, "Verbesserung einer Rüstung"	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLines	( nDocID, 0, "Um die Rüstung eines Dämonenritters weiter zu verbessern muss man drei Lindwurmhäute und eine Dämonenritterrüstung an einem Amboss verbinden.");
		Doc_PrintLines	( nDocID, 0, "");
		Doc_PrintLines	( nDocID, 0, ""			);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLine	( nDocID, 0, "");
		Doc_Show	( nDocID );
	}
	else if (Mod_Gilde == 18)
	{
		nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, "Verbesserung einer Rüstung"	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLines	( nDocID, 0, "Um die Rüstung eines Hüters weiter zu verbessern muss man drei Wasserorkfelle und eine Hüterrüstung an einem Amboss verbinden.");
		Doc_PrintLines	( nDocID, 0, "");
		Doc_PrintLines	( nDocID, 0, ""			);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLine	( nDocID, 0, "");
		Doc_Show	( nDocID );
	};

	Mod_Almanach_Geheimnis_Gelesen = 1;
};

INSTANCE ItWr_ZombieToHuman (C_ITEM)
{
	name 					=	"Altes Buch";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	500;

	visual 					=	"ItWr_Book_02_03.3ds";  					
	material 				=	MAT_LEATHER;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	on_state[0]	=	Use_ZombieToHuman;
	scemeName	=	"MAP";

	description				= 	"";
	
	TEXT[2] 				=  "Macht antiker Kriegsführung";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

var int ZombieToHuman;

FUNC VOID Use_ZombieToHuman()
{
	var int nDocID;

	
		nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

		Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
		Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga

		//1.Seite
		Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
		Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
		Doc_PrintLines	( nDocID,  0, "Aura-Zauber"	);
		Doc_PrintLine	( nDocID,  0, "---------");
		Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
		Doc_PrintLines	( nDocID,  0, "Alte Überlieferungen künden von einer Kunst Magie zu wirken, die bereits bei einfacher Anwendung ganze Armeen mit übernatürlicher Widerstandsfähigkeit und Macht auszustatten vermochte. So sollen  einige der Zauber über einen kurzen Zeitraum den Betroffenen Resistenz gegen Magie, Feuer oder Waffen verliehen, ihre Bewegungen um ein vielfaches beschleunigt und gekräftigt, oder sogar die Macht verliehen haben, die Umgebung durch ihre bloße Präsenz mit Feuer und Eis zu versehen."					);
					
		//2.Seite
		Doc_SetMargins	( nDocID,  1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
		Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
		Doc_PrintLines	( nDocID,  1, "Konvertieren magischer Energie von Artefakt auf Träger"					);
		Doc_PrintLine	( nDocID,  1, "---------");
		Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
		Doc_PrintLines	( nDocID,  1, "Eine weitere Methode der machtvollen Kriegsführung soll in dem Transfer magischer Energie von Artefakten auf ihre Träger gelegen haben. Schwerter und Rüstungen aus magischem Erz sollen mit Runen gekoppelt worden sein, die den Trägern damit unglaubliche Widerstandskraft und Stärke im Kampf verliehen haben. So ließ der einfache Ausspruch der Formel 'atoic onectos' alle Wunden des Trägers schließen, wenn er eine Heilungsrune an Waffe oder Rüstung trug.");
		Doc_Show		( nDocID );

	if (ZombieToHuman == FALSE)
	{
		CreateInvItems	(hero, ItWr_OTZauberformel, 1);

		B_LogEntry	(TOPIC_MOD_ANFANG, "Das ist interessant. Scheinbar lassen sich Rüstungen aus magischem Erz durch Ausspruch einer Zauberformel mit einer Heilrune koppeln, um dem Träger Heilung zu verschaffen.");

		ZombieToHuman = TRUE;
	};

};

INSTANCE Mod_XardasBriefAnKarras_Geoeffnet (C_ITEM)
{
	name		=	"Xardas' Botschaft (geöffnet)";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_XardasBriefAnKarras;
	scemeName	=	"MAP";
	description	=	name;
	TEXT[2]		=	"Xardas' Brief an Karras";
};

INSTANCE Mod_MattheusBotschaft (C_ITEM)
{
	name		=	"Botschaft von Pyrokar";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION|ITEM_SHOW;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_MattheusBotschaft;
	scemeName	=	"MAP";
	description	=	name;
	TEXT[2]		=	"Botschaft";
};

FUNC VOID Use_MattheusBotschaft()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, "Sehr geehrter Paladin Hagen,"	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLines	( nDocID, 0, "Wie ihr vielleicht wisst, bereiten uns die Anhänger Beliars immer noch großes Kopfzerbrechen.");
		Doc_PrintLines	( nDocID, 0, "Es wurde uns nun auch noch unser Heiliger Hammer gestohlen. Ebenfalls wurde Gorax eine Lieferung Wein gestohlen und dadurch haben wir weitere Einnahmen verloren.");
		Doc_PrintLines	( nDocID, 0, "Ich schreibe euch diesen Brief um euch zu bitten mir ein paar Wachen zur Verfügung zu stellen."			);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLine	( nDocID, 0, "Innos Schütze euch, Pyrokar");
		Doc_Show	( nDocID );
};

INSTANCE ItWr_CantharZettel_Valentino (C_ITEM)
{
	name		=	"Zettel";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_CantharZettel_Valentino;
	scemeName	=	"MAP";
	description	=	name;
	TEXT[2]		=	"aus dem Zelt, in dem Valentino war";
};

var int Knows_CantharZettel_Valentino;

FUNC VOID Use_CantharZettel_Valentino()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLines	( nDocID, 0, "Wenn ihr ihn habt, bringt ihn in das Haus, in dem früher Kuno gewohnt hat. Dort wird ihn dann einer meiner Schüler 'befragen', bis ich zurück bin. Mit Valentino könnt ihr verfahren, wie ihr wünscht, Hauptsache, er kann sein Maul danach nicht mehr so weit aufreißen."			);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLine	( nDocID, 0, "C.");
		Doc_Show	( nDocID );

	if (Knows_CantharZettel_Valentino == FALSE)
	{
		Knows_CantharZettel_Valentino = TRUE;

		B_LogEntry	(TOPIC_MOD_CANTHAR_GESCHAEFTE, "Canthars Gefolgschaft hat im ehemaligen Haus Kunos beim Pass zum Minental Unterschlupf gefunden. Das Räubernest sollte ich ausräuchern.");

		Wld_InsertNpc	(Mod_7033_OUT_Allievo_NW, "TAVERNE");
	};
};

INSTANCE ItWr_TofuRezept (C_ITEM)
{
	name		=	"Rezept";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_TofuRezept;
	scemeName	=	"MAP";
	description	=	name;
	TEXT[2]		=	"Rezept für To-Fu";
};

FUNC VOID Use_TofuRezept()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLine	( nDocID, 0, "To-Fu-Rezept"		);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLines	( nDocID, 0, "Für normale Portion man sammeln 30 Schoten von So-Ja-Pflanze. Aus den Schoten man nehmen die Bohnen heraus und tun sie kurz in Wasser, dann alles auspressen. In den ausgepressten Saft man schütten Salz, dann in So-Ja-Presse pressen. So man erhalten To-Fu."			);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_Show	( nDocID );
};

INSTANCE ItWr_SoerensPBrief (C_ITEM)
{
	name		=	"Zettel";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION|ITEM_SHOW;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_SoerensPBrief;
	scemeName	=	"MAP";
	description	=	name;
	TEXT[2]		=	"von Sören";
};

var int Knows_SoerensPBrief;

FUNC VOID Use_SoerensPBrief()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLines	( nDocID, 0, "Nachdem  Lorforn kläglich gescheitert ist, bringe ich nun dich auf den Plan. Tugettso muss untergehen. Am besten, du versuchst, dich bei einem der Oberhäupter einzuschmeicheln. Denk dir etwas aus. Wenn du ihr Vertrauen genießt, versuche mit allen Mitteln, sie gegeneinander aufzuhetzen. Und versuche ein Exemplar dieser seltenen Heilpflanze, die nur dort wächst, zu ergattern."			);
		Doc_PrintLines	( nDocID, 0, "Ach ja, wenn du diesen aufgeblasenen Schwachkopf findest, der Lorforn fertig gemacht hat, beseitige ihn."		);
		Doc_PrintLine	( nDocID, 0, "");
		Doc_PrintLine	( nDocID, 0, "P.");
		Doc_Show	( nDocID );

	if (Mod_VMG_FaiceGifty_Gift == 7)
	{
		Mod_VMG_FaiceGifty_Gift = 8;

		B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Ich musste Sören niederstrecken und habe herausgefunden, dass er auch für diesen 'P.' arbeitet, genau wie Lorforn. Ich sollte das Genn erzählen.");
	};
};

var int XardasLetterForHeroOT;

INSTANCE ItWr_XardasLetterForHeroOT (C_ITEM)
{
	name		=	"Botschaft von Xardas";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_XardasLetterForHeroOT;
	scemeName	=	"MAP";
	description	=	name;
	TEXT[2]		=	"Botschaft";
};

FUNC VOID Use_XardasLetterForHeroOT()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLines	( nDocID, 0, "Der Schläfer scheint verbannt, doch ich kann auch nach mehreren Tagen unter den Trümmern dieses Ortes kein Leben mehr spüren. Daher muss ich annehmen, dass du entgegen aller Erwartungen und Prophezeiungen den Tod gefunden hast. Für alle Fälle lasse ich diese Teleportspruchrolle hier, die dich sicher zu meinem Turm bringen wird, sollten meine Diener dich lebend aus den Trümmern bergen. Da der Teleport über eine relativ große Distanz erfolgt, solltest du nicht zuviel Ballast  mit dir tragen."			);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLine	( nDocID, 0, "Xardas");
		Doc_Show	( nDocID );

	if (XardasLetterForHeroOT == FALSE)
	{
		B_LogEntry	(TOPIC_MOD_ANFANG, "Xardas hat den Tempel wieder verlassen, nachdem er von meinem Tod ausgehen musste. Für alle Fälle hinterließ er jedoch eine Teleportspruchrolle, die mich – mit nicht zu viel Gepäck – zu ihm befördern sollte.");

		XardasLetterForHeroOT = TRUE;
	};
};

INSTANCE ItWr_OTZauberformel (C_ITEM)
{
	name		=	"Formel";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_OTZauberformel;
	scemeName	=	"MAPSEALED";
	description	=	name;
};

FUNC VOID Use_OTZauberformel()
{
	if (Npc_HasItems(hero, Erzrüstung) == 1)
	&& (Npc_HasItems(hero, ItRu_LightHeal) == 1)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",  hero, hero, 0, 0, 0, FALSE );

		Npc_RemoveInvItems	(hero, ItWr_OTZauberformel, 1);

		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, Erzrüstung, 1);
		Npc_RemoveInvItems	(hero, ItRu_LightHeal, 1);

		B_SetHeroNormalStart();

		HeroIstKeinZombie = TRUE;

		B_LogEntry	(TOPIC_MOD_ANFANG, "Es hat geklappt! Ich bin tatsächlich wieder unter den Lebenden! Der Prozess hat bei meinem verwesten Körper jedoch soviel magische Energie verschlungen, dass sie Rüstung zerfallen ist und viele Dinge, die ich bei mir trug, verloren sind.");

		B_InitMonsterAttitudes();

		HeroLook();

		B_RemoveNpc	(Monster_11055_Skelett_OT);
		B_RemoveNpc	(Monster_11056_Skelett_OT);

		Autosave_Counter = Mod_Autosave*600;
	}
	else
	{
		CreateInvItems	(hero, ItWr_OTZauberformel, 1);
	};
};

INSTANCE ItWr_HymirsLetterForHagen (C_ITEM)
{
	name		=	"Hymir's Nachricht";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_02.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_HymirsLetterForHagen;
	scemeName	=	"MAP";
	description	=	name;
};

FUNC VOID Use_HymirsLetterForHagen()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, "Sehr geehrter Lord Hagen,"	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLines	( nDocID, 0, "Ich habe es geschafft die verlassene Mine wieder in Betrieb zu nehmen. Der Bote, der dir diese Nachricht überbringt, war daran nicht unbeteiligt. Er wird für uns noch Spitzhacken besorgen, damit wir das Erz auch abbauen können. Wir werden das Erz sobald wie möglich in die Stadt bringen.");
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLine	( nDocID, 0, "Hymir"		);
		Doc_Show	( nDocID );
};

INSTANCE Mod_SamuelsGrogRezept (C_ITEM)
{
	name		=	"Notiz";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_SamuelsGrogRezept;
	scemeName	=	"MAP";
	description	=	name;
	TEXT[2]		=	"";
};

FUNC VOID Use_SamuelsGrogRezept()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, ""	);
		Doc_PrintLine	( nDocID, 0, "Aus Rum muss man’s Brauen"			);
		Doc_PrintLine	( nDocID, 0, "und Zucker dazu haun’");
		Doc_PrintLine	( nDocID, 0, "mit Wasser zusammen wird’s gebrannt");
		Doc_PrintLine	( nDocID, 0, "danach wird es Grog genannt."			);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLine	( nDocID, 0, "");
		Doc_Show	( nDocID );

	Mod_PCKenntGrogRezept = 1;
};

INSTANCE ItWr_AL_GebrandtDokumente (C_ITEM)
{
	name		=	"Dokument";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_ItWr_AL_GebrandtDokumente;
	scemeName	=	"MAP";
	description	=	name;
	TEXT[2]		=	"von Gebrandt";
};

FUNC VOID Use_ItWr_AL_GebrandtDokumente()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, ""	);
		Doc_PrintLine	( nDocID, 0, "Mitgliederliste:"			);
		Doc_PrintLines	( nDocID, 0, "Gerbrandt, Valentino, Fernando, Cornelius");
		Doc_PrintLine	( nDocID, 0, "");
		Doc_PrintLine	( nDocID, 0, "Aufzeichnungen der Gruppe:"			);
		Doc_PrintLine	( nDocID, 0, "Diego wurde beseitigt"		);
		Doc_PrintLine	( nDocID, 0, "Morgahard wurde beseitigt");
		Doc_PrintLines	( nDocID, 0, "Leon musste getötet werden, er hätte zu viele Informationen weitergeben können");
		Doc_Show	( nDocID );
};

INSTANCE ItWr_Ritualplatz (C_ITEM)
{
	name		=	"Notiz";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_Ritualplatz;
	scemeName	=	"MAP";
	description	=	name;
	TEXT[2]		=	"Enthält die Formel zum Öffnen des Ritualplatzes";
};

FUNC VOID Use_Ritualplatz()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, ""	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLine	( nDocID, 0, "Aperires Meo");
		Doc_PrintLine	( nDocID, 0, "");
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLine	( nDocID, 0, "");
		Doc_Show	( nDocID );

		if (Npc_GetDistToWP(hero, "WIL_LAGERER_22") < 300)
		&& (Mod_Ritualplatz_Used == FALSE)
		{
			Wld_SendTrigger	("RITUAL");

			Npc_RemoveInvItems	(hero, ItWr_Ritualplatz, 1);

			Mod_Ritualplatz_Used = TRUE;
		};
};

INSTANCE Mod_DiegosRaubListe (C_ITEM)
{
	name		=	"Liste von Diego";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_DiegosRaubListe;
	scemeName	=	"MAP";
	description	=	name;
	TEXT[2]		=	"Liste von Diego";
};

FUNC VOID Use_DiegosRaubListe()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, "Folgende Gegenstände sollen besorgt werden:"	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLine	( nDocID, 0, "3 Goldkelche");
		Doc_PrintLine	( nDocID, 0, "3000 Goldmünzen");
		Doc_PrintLine	( nDocID, 0, "1 Ring der Geschicklichkeit"			);
		Doc_PrintLine	( nDocID, 0, "2 Meisterdegen"		);
		Doc_Show	( nDocID );
};

INSTANCE Mod_BillsRumRezept (C_ITEM)
{
	name		=	"Notiz";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_BillsRumRezept;
	scemeName	=	"MAP";
	description	=	name;
	TEXT[2]		=	"";
};

FUNC VOID Use_BillsRumRezept()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, ""	);
		Doc_PrintLines	( nDocID, 0, "Es ist wichtig, dass du alles an Melasse aufkaufst, damit der neue nichts mehr von dem Zeug bekommt. Ich hab keine Lust auf diese Schatzsuche, da wir bei der letzten fast draufgegegangen sind. Wenn du willst, kannst du dir dann aus der Melasse Rum brauen. Dazu mischt du die Melasse mit Wasser, so dass auf ein Glas Melasse zwei Flaschen Wasser kommen. Das ganze dann erhitzen und wieder abkühlen lassen und du hast deinen Rum.");
		Doc_PrintLine	( nDocID, 0, "");
		Doc_PrintLine	( nDocID, 0, "Bill"			);
		Doc_PrintLine	( nDocID, 0, ""		);
		Doc_PrintLine	( nDocID, 0, "");
		Doc_Show	( nDocID );

	Mod_BillsRezeptGelesen = 1;
};

INSTANCE XardasLetterForSaturas (C_ITEM)
{
	name		=	"Xardas' Botschaft";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_02.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_XardasLetterForSaturas_Versiegelt;
	scemeName	=	"MAPSEALED";
	description	=	name;
	TEXT[2]		=	"Diese Botschaft wurde sorgfältig versiegelt.";
};
var int Use_XardasLetterForSaturas_OneTime;
FUNC VOID Use_XardasLetterForSaturas()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, "An Saturas, den obersten Wassermagier"	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLines	( nDocID, 0, "Ich schicke dir einen Boten um dir etwas wichtiges mitzuteilen. Ich fürchte das es eine neue Bedrohung gibt. Sie wird schlimmer sein als der Schläfer und nur mein Bote kann die Gefahr bannen. Du musst ihm unbedingt Zugang zum Portal gewähren.");
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLine	( nDocID, 0, "Xardas"		);
		Doc_Show	( nDocID );

	if (Use_XardasLetterForSaturas_OneTime	==	FALSE)
	{
		Use_XardasLetterForSaturas_OneTime	=	TRUE;
	};
};

FUNC VOID Use_XardasLetterForSaturas_Versiegelt()
{
	CreateInvItems	(self, XardasLetterForSaturas_Geoeffnet, 1);
	XardasLetterForSaturasOpened	=	TRUE;
	Use_XardasLetterForSaturas();
};

INSTANCE XardasLetterForSaturas_Geoeffnet (C_ITEM)
{
	name		=	"Xardas' Botschaft (geöffnet)";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_XardasLetterForSaturas;
	scemeName	=	"MAP";
	description	=	name;
	TEXT[2]		=	"Xardas' Brief an Saturas";
};

INSTANCE Mod_Sklavenliste_DMR (C_ITEM)
{
	name		=	"Eine Liste mit Namen";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_Sklavenliste;
	scemeName	=	"MAP";
	description	=	name;
	TEXT[2]		=	"Eine Liste mit Namen";
};

var int Sklavenliste_OneTime;

FUNC VOID Use_Sklavenliste()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, "Liste der Sklaven:"	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLines	( nDocID, 0, "Fred    (X)"	);
		Doc_PrintLines	( nDocID, 0, "Jorgen  (X)"	);
		Doc_PrintLine	( nDocID, 0, "Draal   (X)"			);
		Doc_PrintLine	( nDocID, 0, "Elvrich ( )"		);
		Doc_Show	( nDocID );

	if (Sklavenliste_OneTime	==	FALSE)
	{
		B_LogEntry	(TOPIC_MOD_VERMISSTE, "Ich hab in der Nähe von Freds Hütte eine Liste mit Namen gefunden. Fred war der erste. Es scheint eine Liste derer zu sein, die von den unbekannten gefangen werden. Als nächster ist Elvrich an der Reihe. Ich sollte Vatras Bericht erstatten.");

		Sklavenliste_OneTime	=	TRUE;
	};
};

INSTANCE MatteoFlugblaetter (C_ITEM)
{
	name		=	"Matteos Flugblatt";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION|ITEM_MULTI;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_MatteoFlugblatt;
	scemeName	=	"MAP";
	description	=	name;
};

FUNC VOID Use_MatteoFlugblatt()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA" , 0	);
		Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1	);
		Doc_PrintLine	( nDocID, 0, "Du hast Hunger und nicht viel Geld."	);
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLines	( nDocID, 0, "Dann geh zu Matteo, dem besten Händler für Lebensmittel, den man in der Stadt finden kann.");
		Doc_PrintLines	( nDocID, 0, "Egal was du brauchst, ob Milch oder Brot, bei Matteo kannst du alles kaufen, was du zum Überleben brauchst.");
		Doc_PrintLine	( nDocID, 0, ""			);
		Doc_PrintLine	( nDocID, 0, "Nur für kurze Zeit im Angebot: Käse"		);
		Doc_Show	( nDocID );
	
		if (Mod_AngebotMatteo	==	0)
		{
			Mod_AngebotMatteo	=	1;
		};
};

INSTANCE Mod_ConstantinosZutatenliste (C_ITEM)
{
	name		=	"Constantino's Zutatenliste";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION|ITEM_MULTI;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_ConstantinosZutatenliste;
	scemeName	=	"MAPSEALED";
	description	=	name;
	TEXT[2]		=	"Diese Zutaten braucht man für einen neuen Trank";
};

FUNC VOID Use_ConstantinosZutatenliste()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA", 0);
		Doc_SetFont	( nDocID, -1, FONT_Book);
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1);
		Doc_PrintLine	( nDocID, 0, "Zutatenliste für den 'Trank der Macht'");
		Doc_PrintLine	( nDocID, 0, "--------------------------------------");
		Doc_PrintLine	( nDocID, 0, "");
		Doc_PrintLine	( nDocID, 0, "Starkes Minecrawler-Sekret (2x)");
		Doc_PrintLine	( nDocID, 0, "Zwillingsdorn (1x)");
		Doc_PrintLine	( nDocID, 0, "Sumpfkrautpflanze (4x)");
		Doc_PrintLine	( nDocID, 0, "Blutfliegenstachel (1x)");
		Doc_Show	( nDocID );

	if (Mod_MinecrawlerEi	==	0)
	{
		Mod_MinecrawlerEi	=	1;

		B_LogEntry	(TOPIC_MOD_CONSTANTINOSZUTATEN, "Constantino braucht: 2x starkes Minecrawler-Sekret, 1x Zwillingsdorn, 4x Sumpfkraut und 1x Blutfliegenstachel.");
	};
};

INSTANCE ItWr_ConstantinosZauberwasserliste (C_ITEM)
{
	name		=	"Constantino's Zutatenliste";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION|ITEM_MULTI;

	value		=	0;

	visual		=	"ItWr_Scroll_01.3DS";
	material	=	MAT_LEATHER;
	on_state[0]	=	Use_ConstantinosZauberwasserliste;
	scemeName	=	"MAP";
	description	=	name;
	TEXT[2]		=	"Diese Zutaten braucht man für Zauberwasser";
};

FUNC VOID Use_ConstantinosZauberwasserliste()
{
	var int nDocID;
	nDocID	=	Doc_Create();
		Doc_SetPages	( nDocID, 1);
		Doc_SetPage	( nDocID, 0, "letters.TGA", 0);
		Doc_SetFont	( nDocID, -1, FONT_Book);
		Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1);
		Doc_PrintLine	( nDocID, 0, "Zutatenliste für Zauberwasser");
		Doc_PrintLine	( nDocID, 0, "-----------------------------");
		Doc_PrintLine	( nDocID, 0, "");
		Doc_PrintLine	( nDocID, 0, "Wasser (10x)");
		Doc_PrintLine	( nDocID, 0, "Salzwasser (2x)");
		Doc_PrintLine	( nDocID, 0, "Feuernesseln (5x)");
		Doc_PrintLine	( nDocID, 0, "Heilpflanzen (5x)");
		Doc_PrintLine	( nDocID, 0, "Blauflieder (3x)");
		Doc_PrintLine	( nDocID, 0, "Feldknöterich (1x)");
		Doc_Show	( nDocID );
};

INSTANCE Mod_XardasZauberbuch (C_ITEM)
{
	name		=	"Altes Buch";

	mainflag	=	ITEM_KAT_DOCS;
	flags		=	ITEM_MISSION;

	value		=	0;
	
	visual		=	"ItWr_Book_02_05.3ds";
	material	=	MAT_LEATHER;

	description	=	name;
	TEXT[2]		=	"Dieses Buch ist sehr alt.";
	TEXT[3]		=	"Es scheint magisch zu sein.";
};

var int riddle1;
var int riddle2;
var int riddle3;
var int riddle4;
var int riddle5;
var int riddle6;

INSTANCE theriddle1(C_Item)
{	
	name 					=	"Altes Buch";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION|ITEM_SHOW;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle1;
};

	FUNC VOID Usetheriddle1()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
   					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Der, der gewillt ist allen irdischen Lastern zu entsagen und auf den Pfaden der Rechtschaffenen wandelt, soll wissen wo der Quell meiner Macht verborgen liegt. Auf daß er es nutzen möge die Ketten dieser Welt zu sprengen und sich als würdig zu erweisen, Chromanin zu empfangen.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Der Weise fängt an dem Ort an, von dem er zur Suche aufgebrochen ist.");
					Doc_Show		( nDocID );
				
					if (riddle1 == FALSE)
					{
						Log_CreateTopic		(TOPIC_MOD_THERIDDLE,		LOG_MISSION);
						B_SetTopicStatus	(TOPIC_MOD_THERIDDLE,		LOG_RUNNING);
						B_LogEntry			(TOPIC_MOD_THERIDDLE,		"Ich habe dem Skelett Magier im Nebelturm ein sehr seltsames Buch abgenommen. Chromanin! Es scheint sich um ein Rätsel zu handeln, das ein geheimnisvoller Fremder dieser Welt gestellt hat: ...Der Weise fängt an dem Ort an, von dem er zur Suche aufgebrochen ist ... Mmmh! Ob er auch meinen Aufsbruchsort meint? Ich sollte mal zur Bergfestung gehen ..."); 
						//Wld_InsertItem			(theriddle2,"FP_FELSENFESTUNG_CHROMANIN_BAND_2");
					
						riddle1 = TRUE;

						if (Mod_Import_Fremde)
						{
							B_Say (hero, NULL, "$KNOWSRIDDLER");
						};
					
					};
	};

INSTANCE theriddle2(C_Item)
{	
	name 					=	"Altes Buch";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION|ITEM_SHOW;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 2";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle2;
};

	FUNC VOID Usetheriddle2()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Getragen von den Gezeiten, haben Chromanins Visionen der Zukunft mir die Augen geöffnet. Kein Preis ist hoch genug, den Glauben daran wieder aufzugeben. Viel zu stark hat es mich bewegt.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Fast voll Wasser und doch noch Luft zum atmen.");
					Doc_Show		( nDocID );
					
					if (riddle2 == FALSE)
					{					
						B_GivePlayerXP (300);
						B_LogEntry			(TOPIC_MOD_THERIDDLE,		"Ich habe ein zweites Buch gefunden, das den Namen Chromanin trägt. Und wieder gibt es mir ein Rätsel auf...Fast voll Wasser und doch noch Luft zum atmen....."); 
						Snd_Play 		("FoundRiddlersBook");
						Wld_InsertItem			(theriddle3,"FP_ALTESLAGERHOEHLE_CHROMANIN_BAND_3");
					
						riddle2  =  TRUE;
					
					};
	
	};
INSTANCE theriddle3(C_Item)
{	
	name 					=	"Altes Buch";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION|ITEM_SHOW;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 3";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle3;
};

	FUNC VOID Usetheriddle3()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
   					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Oh, ihr Götter der alten Zeiten. Kann es sein, das ein Mensch, wie ich, der nur einfach gestrickt und unwürdig, solch großes Vermächtnis erlangen darf. Die Angst ist groß, alles zu verlieren durch ein kleines Wort des Schwankens.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Ein kluger Fischer fischt nicht dort.");
					Doc_Show		( nDocID );



					if (riddle3 == FALSE)
					{		
						B_GivePlayerXP (500);
						B_LogEntry			(TOPIC_MOD_THERIDDLE,		"Ich habe das dritte Buch gefunden. Ich glaube so langsam verstehe ich, wie das abläuft ... Ein kluger Fischer fischt nicht dort ..."); 
						Snd_Play 		("FoundRiddlersBook");

						if (hero.guild == GIL_MIL)
						{
							Mod_NL_UDS_Spawn = 1;
						}
						else
						{
							Wld_InsertItem			(theriddle4, "FP_SUMPF_CHROMANIN_BAND_4");
						};
						
						riddle3   =  TRUE;
					
					};
					
					
	};
				
				
INSTANCE theriddle4(C_Item)
{	
	name 					=	"Altes Buch";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION|ITEM_SHOW;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 4";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle4;
};

	FUNC VOID Usetheriddle4()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Ich wage nicht zu hoffen eines Tages Chromanin selbst zu erleben. Vorbei sind die Tage der Verschwendung und des Klangens. So leicht wird es sein, die völlige Vollendung zu erreichen. Ich bin nicht mehr weit davon entfernt.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Vergessen sind die Taten jener, die sich einst an Bord befanden.");
					Doc_Show		( nDocID );
					

					if (riddle4 == FALSE)
					{	
						if (CurrentLevel == MINENTAL_ZEN)
						{				
							B_GivePlayerXP (700);
							B_LogEntry			(TOPIC_MOD_THERIDDLE,		"Nummer vier. Ich frag mich langsam, warum ich mich von diesem Typ an der Nase herumführen lasse....Vergessen sind die Taten jener, die sich einst an Bord befanden..."); 
							Snd_Play 		("FoundRiddlersBook");					
							//Wld_InsertItem			(theriddle5,"FP_ITEM_THERIDDLE_05");

							Wld_InsertNpc	(Monster_11059_Kobold_MT,	"OW_PATH_201");
					
					
							riddle4 = TRUE;
						};
					
					};
					
					
					
	};
								
INSTANCE theriddle5(C_Item)
{	
	name 					=	"Altes Buch";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION|ITEM_SHOW;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 5";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle5;
};

	FUNC VOID Usetheriddle5()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Doch soll ich nicht alleine diesen Weg beschreiten. Diese Ehre sei mir vergönnt. Ich muß mich fügen und die Kraft, die in mir wohnt, muß ich teilen mit den Würdigen, die da kommen werden, mich zu finden. Hoffentlich kommen sie bald...");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Dort, wo alles begann, sollst du mich finden.");
					Doc_Show		( nDocID );




					if (riddle5 == FALSE)
					{
						B_GivePlayerXP (850);
						B_LogEntry			(TOPIC_MOD_THERIDDLE,		"Dies scheint das letzte zu sein. Bin gespannt zu erfahren, wem ich gegenüber stehen werde ... Dort, wo alles begann, sollst du mich finden ..."); 
						Snd_Play 		("FoundRiddlersBook");				
						Wld_InsertNpc				(Bau_989_Riddler,"");
						var C_NPC riddler; riddler = Hlp_GetNpc(Bau_989_Riddler);
						Npc_ChangeAttribute	(riddler, ATR_HITPOINTS, -riddler.attribute[ATR_HITPOINTS_MAX]);

						riddle5  =  TRUE;
					
					};
	};

INSTANCE theriddle6(C_Item)
{	
	name 					=	"Altes Buch";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION|ITEM_SHOW;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 6";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle6;
};

	FUNC VOID Usetheriddle6()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "");
				
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_Show		( nDocID );

					if (riddle6 == FALSE)
					{
						B_GivePlayerXP (1000);
						B_LogEntry			(TOPIC_MOD_THERIDDLE,		"Der geheimnisvolle Fremde ist tot. Diese Dämonen haben ihn getötet. Irgendetwas scheint ihn mit diesen Geschöpfen der Hölle verbunden zu haben. Sonst wäre er sicher nicht an diesen gottverlassenen Ort zurückgekehrt. Das Geheimnis, das er mit mir teilen wollte, hat er mit ins Grab genommen."); 
						B_SetTopicStatus	(TOPIC_MOD_THERIDDLE,		LOG_SUCCESS);
						Snd_Play 		("FoundRiddler");					
						AI_Teleport	(Bau_989_Riddler, "OW_FOGDUNGEON_36_MOVEMENT");
						Npc_ChangeAttribute	(Bau_989_Riddler, ATR_HITPOINTS, +Bau_989_Riddler.attribute[ATR_HITPOINTS_MAX]);

						riddle6 = TRUE;
					
					};
	};

INSTANCE TondralsBuch_01(C_Item)
{	
	name 					=	"Die Schande der Götter - Teil I";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= name;
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseTondralsBuch01;
};

	FUNC VOID UseTondralsBuch01()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
   					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Die Schande der Götter"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Sagt mir, welche Götter sind es, die uns nur geschaffen haben, um uns im Krieg in den Tod zu schicken. Wie kann sich Innos als Gott der Gerechtigkeit bezeichnen, wenn ihm doch nur wichtig ist, die Anhänger Beliars zu vernichten? Was ist Adanos Gleichgewicht wert, wenn es nur daraus besteht, dieses ewige Blutbad aufrecht zu erhalten und das Volk zu vernichten, das im Vorteil ist?");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Welchen Nutzen erfüllt Beliar, der nichts als Zerstörung und Chaos anrichtet und sich daran ergötzt. Der die Orks erschaffen hat, die die Menschen jagen und abschlachten? Wir alle sind doch nur Schachfiguren für jene Wesen, die sich selbst als Götter bezeichnen, jedoch nichts anderes als sadistische Kriegstreiber sind. Die uns ausnutzen um ihre Ziele zu erreichen und denen unser Leben nichts wert ist. Die Verlangen, von uns angebetet zu werden, dafür, dass sie uns wie ihre Spielfiguren ausnutzen.");
					Doc_Show		( nDocID );
	};

INSTANCE TondralsBuch_02(C_Item)
{	
	name 					=	"Die Schande der Götter - Teil II";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= name;
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseTondralsBuch02;
};

	FUNC VOID UseTondralsBuch02()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
   					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Wer sind schon der König, die Magier und die Paladine? Nichts als Marionetten, die den Willen ihrer sogenannten Götter ausführen. Die, die im Namen dieser dreckigen Kriegstreiber sich das Recht nehmen über uns zu bestimmen! Daher sage ich, kämpft gegen die Götter, verbrennt ihre Tempel, zerstört ihre Statuen und tötet ihre Anhänger, für ein Leben, dass nicht durch den sinnlosen Krieg von Innos, Beliar und Adanos bestimmt wird!");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "");
					Doc_Show		( nDocID );
	};

INSTANCE ItWr_HeiligeWaffen (C_Item)
{	
	name 					=	"Heilige Waffen";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= name;
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseItWr_HeiligeWaffen;
};

	FUNC VOID UseItWr_HeiligeWaffen()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
   					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Heilige Waffen"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Heilige Waffen gibt es in verschiedener Form ... ob gesegnete Klinge, Magie, oder Tinktur. Sie richten sich gezielt gegen dämonische Geschöpfe und untote Wesen, welche durch dämonische Magie gelenkt werden.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Im Besonderen ist es die Macht Innos’, der diese Waffen entspringen. Die Klingen seine Streiter sind häufig gesegnet und besonders wirkungsvoll gegen Dämonen und Untote, gleichermaßen die Magie, welche ihnen verliehen wurde ... so der heilige Pfeil und mächtigere Zauber. Es heißt sogar, dass bereits die bloßen Strahlen eines heiligen Lichtes die Widerstandskraft finsterer Wesen mindern können ...");
					Doc_Show		( nDocID );
	};

INSTANCE ItWr_Flueche (C_Item)
{	
	name 					=	"Flüche";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= name;
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseItWr_Flueche;
};

	FUNC VOID UseItWr_Flueche()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
   					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Flüche"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Flüche entspringen der Magie des dunklen Gottes und dämonischer Wesen. Sie können ein einzelnes Geschöpf, oder gar ganze Gruppen von Wesen beeinflussen und in Händen eines kundigen Magiers große Macht entfalten.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Es wird berichtet von solchen, die Opfer lähmen, ihnen die Lebenskraft entziehen, oder ihre Widerstandskraft senken. Meist in Form von magischen Sprüchen ist in Überlieferungen auch von Schwertern die Rede, deren Klinge ein getroffenes Wesen mit einem Fluch belegen kann.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Untote Wesen jedoch, selbst von dunkler Magie gelenkt, werden nicht mehr in vollem Umfang von Flüchen beeinflusst, während dämonische Wesen gar jeden Fluches auf einen Bruchteil seines Effektes reduzieren können.");
					Doc_Show		( nDocID );
	};