// *********************************************************************
// CREDITS_03ions menu
// *********************************************************************

INSTANCE MENU_CREDITS_03(C_MENU_DEF)
{
	backpic		= MENU_BACK_PIC;

	items[0]	= "MENUITEM_CREDITS_03_HEADING";

	items[1]	= "MENUITEM_CREDITS_03_THECAMPER";
	items[2]	= "MENUITEM_CREDITS_03_THIELHATER";
	items[3]	= "MENUITEM_CREDITS_03_ZIRROR";

	items[15]	= "MENUITEM_CREDITS_03_LAST";
	items[16]	= "MENUITEM_CREDITS_03_BACK";
	items[17]	= "MENUITEM_CREDITS_03_NEXT";

	flags = flags | MENU_SHOW_INFO;
};


const int MENU_CREDITS_03_DY 		=  600;
const int MENU_CREDITS_03_START_Y	= 2000;

INSTANCE MENUITEM_CREDITS_03_HEADING(C_MENU_ITEM_DEF)
{
	text[0]		=	"MATERIAL - SEITE 3";
	type		=	MENU_ITEM_TEXT;
	// Position und Dimension
	posx		=	0;		posy		=	MENU_TITLE_Y;
	dimx		=	8192;

	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_THECAMPER(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "The_Camper²";
	text[1]		= "für die Verwandlungsmagier-, die hohe Feuermagier- und Wassermagier-, sowie die Heilmagierrobe und die Kettenrüstung";  // Kommentar

	// Position und Dimension
	posx		= 0;		posy		= MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*0;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_03";

	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_THIELHATER(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "ThielHater";
	text[1]		= "für seinen Texturenpatch";  // Kommentar

	// Position und Dimension
	posx		= 0;		posy		= MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*1;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_03";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_ZIRROR(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Zirror";
	text[1]		= "für die Lurkerrüstung";  // Kommentar

	// Position und Dimension
	posx		= 0;		posy		= MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*2;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_03";

	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CREDITS_03_CEEX(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		=	"CeeX";
	text[1]		=	"für die Rüstungen und einige Items und Waffen aus 'Dunkle Brut'";  // Kommentar

	// Position und Dimension
	posx		= 0;		posy		= MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*3;
	dimx		= 4096;		dimy		= 750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_03";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_CROSSHEAD(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Crosshead";
	text[1]		= "für einige Rüstungstexturen";  // Kommentar

	// Position und Dimension
	posx		= 0;		posy		= MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*4;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_03";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_ELVEON(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "elveon";
	text[1]		= "für seinen Texturenpatch";  // Kommentar

	// Position und Dimension
	posx		= 0;		posy		= MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*5;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_03";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_FIZZBAN(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Fizzban";
	text[1]		= "für seinen Scriptpatch";  // Kommentar

	// Position und Dimension
	posx		= 0;		posy		= MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*6;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_03";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_FREDDY(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Freddy";
	text[1]		= "für die Wassertropfen aus Khorana, den Wald-Scavenger und seinen G1 Texturenpatch";  // Kommentar

	// Position und Dimension
	posx		= 4096;		posy		= MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*0;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_03";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_GARRIKLORAN(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Garrik Loran";
	text[1]		= "für einige Gegenstände aus 'Trails of Darkness'";  // Kommentar

	// Position und Dimension
	posx		= 4096;		posy		= MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*1;
	dimx		= 4096;		dimy		= 800;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_03";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_GOLDENAGE (C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Golden Age";
	text[1]		= "für die Edelpilz-Textur und den Sarg";  // Kommentar

	// Position und Dimension
	posx		= 4096;		posy		= MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*2;
	dimx		= 4096;		dimy		= 800;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_03";
	
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
	flags 			= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_GOTHIC2005(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Gothic2005";
	text[1]		= "für sein Pflanzenwirkungssystem";  // Kommentar

	// Position und Dimension
	posx		= 4096;		posy		= MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*3;
	dimx		= 4096;		dimy		= 800;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_03";
	
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
	flags 			= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_GOTHICFAN359(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "gothicfan359";
	text[1]		= "für den Paladinkristall";  // Kommentar

	// Position und Dimension
	posx		= 4096;		posy		= MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*4;
	dimx		= 4096;		dimy		= 800;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_03";
	
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
	flags 			= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_GOTHIC_MODER(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "gothic-moder";
	text[1]		= "für ein paar Gebäude aus der MDB";  // Kommentar

	// Position und Dimension
	posx		= 4096;		posy		= MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*5;
	dimx		= 4096;		dimy		= 800;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_03";
	
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
	flags 			= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_HAGELNACHT(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Hagelnacht";
	text[1]		= "für seine Fliegenpilz-Textur und die Quest von Liselotte";  // Kommentar

	// Position und Dimension
	posx		= 4096;		posy		= MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*6;
	dimx		= 4096;		dimy		= 800;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_CREDITS_03";
	
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
	flags 			= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_LAST(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Vorherige";
	// Position und Dimension
	posx		=	0;		posy		=	MENU_CREDITS_02_START_Y + MENU_CREDITS_02_DY*8;
	dimx		=	4096;		dimy		=	800;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;
	//onSelAction_S[0] = "MENU_MAIN";
	// Weitere Eigenschaften
	flags			= flags |IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_BACK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Zurück";
	// Position und Dimension
	posx		=	0;		posy		=	MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*8;
	dimx		=	8192;		dimy		=	800;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;
	onSelAction_S[0] = "MENU_MAIN";
	// Weitere Eigenschaften
	flags			= flags |IT_TXT_CENTER;
};

INSTANCE MENUITEM_CREDITS_03_NEXT(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Nächste";
	// Position und Dimension
	posx		=	4096;		posy		=	MENU_CREDITS_03_START_Y + MENU_CREDITS_03_DY*8;
	dimx		=	4096;		dimy		=	800;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_BACK;
	onSelAction[1]	= SEL_ACTION_STARTMENU;
	onSelAction_S[1] = "MENU_CREDITS_04";
	// Weitere Eigenschaften
	flags			= flags |IT_TXT_CENTER;
};
