// *********************************************************************
// game options menu - extensions
// *********************************************************************


INSTANCE MENU_NEWGAME(C_MENU_DEF)
{
	backpic			= MENU_BACK_PIC;
	
	items[0]		= "MENUITEM_NEWGAME_HEADLINE";
				
	items[1]		= "MENUITEM_NEWGAME_DIFFICULTY";	
	items[2]		= "MENUITEM_NEWGAME_DIFFICULTY_CHOICE";
	
	items[3]		= "MENUITEM_NEWGAME_START";
	items[4]		= "MENUITEM_NEWGAME_BACK";
	
	flags = flags | MENU_SHOW_INFO;
};


INSTANCE MENUITEM_NEWGAME_HEADLINE(C_MENU_ITEM_DEF) 
{
	text[0]		=	"NEUES SPIEL STARTEN";
	type		=	MENU_ITEM_TEXT;
	// Position und Dimension	
	posx		=	0;		posy		=	MENU_TITLE_Y-500;
	dimx		=	8100;
	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;	
};


//
// Difficulty
//

INSTANCE MENUITEM_NEWGAME_DIFFICULTY(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Schwierigkeit";
	text[1]		= 	"Schwierigkeitsgrad (Einfach, Normal, Schwer)"; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*1;
	dimx		=	6192;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags		= flags | IT_EFFECTS_NEXT | IT_TXT_CENTER;
};

instance MENUITEM_NEWGAME_DIFFICULTY_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	"Einfach|Normal|Schwer";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 1000;		posy		=	MENU_START_Y + MENU_DY*2;
	dimx = 6192;	dimy 		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption		= "difficulty";
	onChgSetOptionSection 	= "XERES";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};




INSTANCE MENUITEM_NEWGAME_START(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Starten";
	// Position und Dimension	
	posx		=	1000;		posy		=	MENU_START_Y + MENU_DY*3;
	dimx		=	6192;		dimy		=	MENU_DY;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_CLOSE;
	onSelAction_S[0]= "NEW_GAME";
	
	// Weitere Eigenschaften
	flags			= flags |IT_TXT_CENTER;
};

INSTANCE MENUITEM_NEWGAME_BACK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Zurück";
	// Position und Dimension
	posx		=	1000;		posy		=	MENU_BACK_Y;
	dimx		=	6192;		dimy		=	MENU_DY;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;
	//onSelAction_S[0] = "MENU_MAIN";
	// Weitere Eigenschaften
	flags			= flags |IT_TXT_CENTER;
};