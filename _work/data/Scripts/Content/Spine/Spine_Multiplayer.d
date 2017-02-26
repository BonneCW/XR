// searches for a multiplayer match
// numPlayers specifies the amount of players for this match
// identifier is the identifier for the mode/level or anything else specific for the modification
func void Spine_SearchMatch(var int numPlayers, var int identifier) {
	if (Spine_Initialized && Spine_SearchMatchFunc) {
		CALL_IntParam(identifier);
		CALL_IntParam(numPlayers);
		CALL__cdecl(Spine_SearchMatchFunc);
	};
};

// returns TRUE in case SearchMatch was called and a match was found, otherwise FALSE
func int Spine_IsInMatch() {
	if (Spine_Initialized && Spine_IsInMatchFunc) {
		CALL__cdecl(Spine_IsInMatchFunc);
		
		return CALL_RetValAsInt();
	};
	return FALSE;
};

// creates a new message. See Spine_Message.d for possible messages
// messageType is one of the entries in Spine_Constants.d
func int Spine_CreateMessage(var int messageType) {
	if (Spine_Initialized && Spine_CreateMessageFunc) {
		CALL_IntParam(messageType);
		CALL__cdecl(Spine_CreateMessageFunc);
		
		return CALL_RetValAsPtr();
	};
	return 0;
};

// sends a message created with Spine_CreateMessage to all connected players
func void Spine_SendMessage(var int messagePtr) {
	if (Spine_Initialized && Spine_SendMessageFunc) {
		CALL_PtrParam(messagePtr);
		CALL__cdecl(Spine_SendMessageFunc);
	};
};

// returns a message from message buffer if one is available, otherwise returns 0
func int Spine_ReceiveMessage() {
	if (Spine_Initialized && Spine_ReceiveMessageFunc) {
		CALL__cdecl(Spine_ReceiveMessageFunc);
		return CALL_RetValAsPtr();
	};
	return 0;
};

// returns amount of players in current match
func int Spine_GetPlayerCount() {
	if (Spine_Initialized && Spine_GetPlayerCountFunc) {
		CALL__cdecl(Spine_GetPlayerCountFunc);
		
		return CALL_RetValAsInt();
	};
	return FALSE;
};

// returns the username of the player at position position
func string Spine_GetPlayerUsername(var int position) {
	if (Spine_Initialized && Spine_GetPlayerUsernameFunc) {
		const string STR_BUFFER = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";

		CALL_cStringPtrParam(STR_BUFFER);
		CALL_IntParam(position);
		CALL__cdecl(Spine_GetPlayerUsernameFunc);
		
		return STR_BUFFER;
	};
	return "";
};
