// *********************************************************************
// CREDITS_06ions menu
// *********************************************************************

INSTANCE MENU_CREDITS_06(C_MENU_DEF)
{
	backpic		= MENU_BACK_PIC;

	items[0]	= "MENUITEM_CREDITS_06_HEADING";


	items[15]	= "MENUITEM_CREDITS_06_LAST";
	items[16]	= "MENUITEM_CREDITS_06_BACK";
	items[17]	= "MENUITEM_CREDITS_06_NEXT";

	flags = flags | MENU_SHOW_INFO;
};


const int MENU_CREDITS_06_DY 		=  600;
const int MENU_CREDITS_06_START_Y	= 2000;

INSTANCE MENUITEM_CREDITS_06_HEADING(C_MENU_ITEM_DEF)
{
	text[0]		=	"SPRECHER - SEITE 1";
	type		=	MENU_ITEM_TEXT;
	// Position und Dimension
	posx		=	0;		posy		=	MENU_TITLE_Y;
	dimx		=	8192;

	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_KENSUYOKU(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Ken Suyoku";
	text[1]		= "für den Holzhaufen aus der MDB und den Eisscavenger";  // Kommentar

	// Position und Dimension
	posx		= 0;		posy		= MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*0;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_06";

	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_KUSHELBAER(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "kushel_baer";
	text[1]		= "für den Blutscavenger aus 'PDB - Die Vorgeschichte'";  // Kommentar

	// Position und Dimension
	posx		= 0;		posy		= MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*1;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_06";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_MAGNUSKORPIUS(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Magnus_Korpius";
	text[1]		= "für die Variationen der Buddlerrüstungen";  // Kommentar

	// Position und Dimension
	posx		= 0;		posy		= MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*2;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_06";

	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDITS_06_MICHADD(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		=	"MichaDD, DerAlte, EvilTwin und Neok";
	text[1]		=	"für die Staffelei inklusive Animation";  // Kommentar

	// Position und Dimension
	posx		= 0;		posy		= MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*3;
	dimx		= 4096;		dimy		= 750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_06";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_MILGO(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Milgo und Rabe";
	text[1]		= "für die GDG-Insel";  // Kommentar

	// Position und Dimension
	posx		= 0;		posy		= MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*4;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_06";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_PLAYER140(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Player140";
	text[1]		= "für eine Gras-Textur";  // Kommentar

	// Position und Dimension
	posx		= 0;		posy		= MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*5;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_06";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_PRAIDEN(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Praiden";
	text[1]		= "für das Schütterschwert";  // Kommentar

	// Position und Dimension
	posx		= 0;		posy		= MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*6;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_06";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_RAMMON(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Rammon";
	text[1]		= "für die Höhle aus seiner 'Insel mit Dungeon' aus der MDB";  // Kommentar

	// Position und Dimension
	posx		= 4096;		posy		= MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*0;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_06";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_ROXTAR(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "roXtar";
	text[1]		= "für die Schläfermaske und die Sensen";  // Kommentar

	// Position und Dimension
	posx		= 4096;		posy		= MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*1;
	dimx		= 4096;		dimy		= 800;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_06";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_SEKTENSPINNER (C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Sektenspinner und Schattenlord34";
	text[1]		= "für die Lederrüstung aus Velaya";  // Kommentar

	// Position und Dimension
	posx		= 4096;		posy		= MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*2;
	dimx		= 4096;		dimy		= 800;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_06";
	
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
	flags 			= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_SILVESTRO(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Silvestro";
	text[1]		= "für den Dungeon bei der alten Mine";  // Kommentar

	// Position und Dimension
	posx		= 4096;		posy		= MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*3;
	dimx		= 4096;		dimy		= 800;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_06";
	
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
	flags 			= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_SUMPFKRAUTJUNKIE(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Sumpfkrautjunkie";
	text[1]		= "für seinen Balken und die Moorblase";  // Kommentar

	// Position und Dimension
	posx		= 4096;		posy		= MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*4;
	dimx		= 4096;		dimy		= 800;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_06";
	
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
	flags 			= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_SWEIL(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Sweil";
	text[1]		= "für die Lurker-Texturen aus 'Das Bündnis der Götter'";  // Kommentar

	// Position und Dimension
	posx		= 4096;		posy		= MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*5;
	dimx		= 4096;		dimy		= 800;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_06";
	
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
	flags 			= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_TENAX(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Tenax";
	text[1]		= "für zwei Monstertexturen";  // Kommentar

	// Position und Dimension
	posx		= 4096;		posy		= MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*6;
	dimx		= 4096;		dimy		= 800;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_06";
	
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
	flags 			= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_LAST(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Vorherige";
	// Position und Dimension
	posx		=	0;		posy		=	MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*8;
	dimx		=	4096;		dimy		=	800;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;
	//onSelAction_S[0] = "MENU_MAIN";
	// Weitere Eigenschaften
	flags			= flags |IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_BACK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Zurück";
	// Position und Dimension
	posx		=	0;		posy		=	MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*8;
	dimx		=	8192;		dimy		=	800;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;
	onSelAction_S[0] = "MENU_MAIN";
	// Weitere Eigenschaften
	flags			= flags |IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_06_NEXT(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Nächste";
	// Position und Dimension
	posx		=	4096;		posy		=	MENU_CREDITS_06_START_Y + MENU_CREDITS_06_DY*8;
	dimx		=	4096;		dimy		=	800;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	onSelAction_S[0] = "MENU_CREDITS_03";
	// Weitere Eigenschaften
	flags			= flags |IT_TXT_CENTER;
};
