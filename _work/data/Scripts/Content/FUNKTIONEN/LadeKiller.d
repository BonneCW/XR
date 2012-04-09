//######################################################
//
//	INTERNAS - Ändern auf eigene Gefahr
//
//######################################################

/* Benötigte Konstante */
const INT IT_ONLY_OUT_GAME		= 256;

/* Funktion für den Nutzer, die AllowLoading auswertet und umsetzt */
instance talentMenuItem (zCMenuItem);

func void EnforceLoadingPolicy() {
	
	//--------------------------------------
	// Menüitem holen:
	//--------------------------------------
	
	var int talentMenuItemPtr;
	talentMenuItemPtr = MEM_GetMenuItemByString ("MENU_ITEM_STATUS_HEADING");
	
	if (!talentMenuItemPtr) {
		//wtf?
		var string err; err = "EnforceLoadingPolicy: MENU_ITEM_STATUS_HEADING not found!?";
		Print (err); PrintDebug (err);
		return;
	};
	
	MEM_AssignInst (talentMenuItem, talentMenuItemPtr);
	
	//--------------------------------------
	// Der eigentliche Code:
	//--------------------------------------

	MEM_WriteString(talentMenuItem.m_listLines_array, "TEST");
};