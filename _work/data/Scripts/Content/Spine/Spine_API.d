// a maximum of 11 (1 active + 10 waiting in queue) achievements can be unlocked at once
// should be enough, otherwise I'll increase the amount
var int SPINE_ACHIEVEMENTSQUEUE[10];
var int Spine_AchievementView;
var int Spine_AchievementImageView;

func void FreeLibrary (var int ptr) {
	var int freelib;
	freelib = FindKernelDllFunction("FreeLibrary");

	if (!freelib) {
		return;
	};

	CALL_PtrParam(ptr);
	CALL__stdcall(freelib);
};

var string Spine_FirstStart;
var int Spine_Initialized;
var int Spine_Dll;
var int Spine_InitFunc;
var int Spine_GetUsernameFunc;
var int Spine_UpdateScoreFunc;
var int Spine_GetUserScoreFunc;
var int Spine_GetUserRankFunc;
var int Spine_GetScoreForRankFunc;
var int Spine_GetUsernameForRankFunc;
var int Spine_UnlockAchievementFunc;
var int Spine_IsAchievementUnlockedFunc;
var int Spine_SearchMatchFunc;
var int Spine_IsInMatchFunc;
var int Spine_CreateMessageFunc;
var int Spine_SendMessageFunc;
var int Spine_ReceiveMessageFunc;
var int Spine_GetPlayerCountFunc;
var int Spine_GetPlayerUsernameFunc;

func int Spine_Init(var int modules) {
	if (Hlp_IsValidHandle(Spine_AchievementView)) {
		View_Close(Spine_AchievementView);
		Spine_AchievementView = 0;
	};
	if (Hlp_IsValidHandle(Spine_AchievementImageView)) {
		View_Close(Spine_AchievementImageView);
		Spine_AchievementImageView = 0;
	};
	SPINE_ACHIEVEMENTSQUEUE[0] = -1;
	SPINE_ACHIEVEMENTSQUEUE[1] = -1;
	SPINE_ACHIEVEMENTSQUEUE[2] = -1;
	SPINE_ACHIEVEMENTSQUEUE[3] = -1;
	SPINE_ACHIEVEMENTSQUEUE[4] = -1;
	SPINE_ACHIEVEMENTSQUEUE[5] = -1;
	SPINE_ACHIEVEMENTSQUEUE[6] = -1;
	SPINE_ACHIEVEMENTSQUEUE[7] = -1;
	SPINE_ACHIEVEMENTSQUEUE[8] = -1;
	SPINE_ACHIEVEMENTSQUEUE[9] = -1;
	
	MEM_Info("Spine: Initializing");
	if (STR_Len(Spine_FirstStart) == 0) {
		Spine_Initialized = FALSE;
		Spine_FirstStart = "Initialized";
		
		MEM_Info("Spine: Loading SpineAPI.dll");
		Spine_Dll = LoadLibrary("SpineAPI.dll");
		
		if (!Spine_Dll) {
			MEM_Info("Spine: SpineAPI.dll couldn't be loaded");
			return FALSE;
		};
		
		MEM_Info("Spine: Loading init function");
		Spine_InitFunc = GetProcAddress(Spine_Dll, "init");
		
		if (!Spine_InitFunc) {
			MEM_Info("Spine: init function not found");
			FreeLibrary(Spine_Dll);
			return FALSE;
		};
		
		if (modules & SPINE_MODULE_GETCURRENTUSERNAME) {
			MEM_Info("Spine: Loading getUsername function");
			Spine_GetUsernameFunc = GetProcAddress(Spine_Dll, "getUsername");
			
			if (!Spine_GetUsernameFunc) {
				MEM_Info("Spine: getUsername function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
		} else {
			Spine_GetUsernameFunc = 0;
		};
		
		if (modules & SPINE_MODULE_SCORES) {
			MEM_Info("Spine: Loading updateScore function");
			Spine_UpdateScoreFunc = GetProcAddress(Spine_Dll, "updateScore");
			
			if (!Spine_UpdateScoreFunc) {
				MEM_Info("Spine: updateScore function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading getUserScore function");
			Spine_GetUserScoreFunc = GetProcAddress(Spine_Dll, "getUserScore");
			
			if (!Spine_GetUserScoreFunc) {
				MEM_Info("Spine: getUserScore function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading getUserRank function");
			Spine_GetUserRankFunc = GetProcAddress(Spine_Dll, "getUserRank");
			
			if (!Spine_GetUserRankFunc) {
				MEM_Info("Spine: getUserRank function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading getScoreForRank function");
			Spine_GetScoreForRankFunc = GetProcAddress(Spine_Dll, "getScoreForRank");
			
			if (!Spine_GetScoreForRankFunc) {
				MEM_Info("Spine: getScoreForRank function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading getUsernameForRank function");
			Spine_GetUsernameForRankFunc = GetProcAddress(Spine_Dll, "getUsernameForRank");
			
			if (!Spine_GetUsernameForRankFunc) {
				MEM_Info("Spine: getUsernameForRank function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
		} else {
			Spine_UpdateScoreFunc = 0;
			Spine_GetUserScoreFunc = 0;
			Spine_GetUserRankFunc = 0;
			Spine_GetScoreForRankFunc = 0;
			Spine_GetUsernameForRankFunc = 0;
		};
		
		if (modules & SPINE_MODULE_ACHIEVEMENTS) {
			if (!(_LeGo_Flags & LeGo_FrameFunctions) || !(_LeGo_Flags & LeGo_View)) {
				MEM_ErrorBox("For Spine Achievement Module you need to initialize LeGo with both FrameFunctions and View");
			};
			MEM_Info("Spine: Loading unlockAchievement function");
			Spine_UnlockAchievementFunc = GetProcAddress(Spine_Dll, "unlockAchievement");
			
			if (!Spine_UnlockAchievementFunc) {
				MEM_Info("Spine: unlockAchievement function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading isAchievementUnlocked function");
			Spine_IsAchievementUnlockedFunc = GetProcAddress(Spine_Dll, "isAchievementUnlocked");
			
			if (!Spine_IsAchievementUnlockedFunc) {
				MEM_Info("Spine: isAchievementUnlocked function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
		} else {
			Spine_UnlockAchievementFunc = 0;
			Spine_IsAchievementUnlockedFunc = 0;
		};
		
		if (modules & SPINE_MODULE_MULTIPLAYER) {
			MEM_Info("Spine: Loading createMessage function");
			Spine_CreateMessageFunc = GetProcAddress(Spine_Dll, "createMessage");
			
			if (!Spine_CreateMessageFunc) {
				MEM_Info("Spine: createMessage function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading sendMessage function");
			Spine_SendMessageFunc = GetProcAddress(Spine_Dll, "sendMessage");
			
			if (!Spine_SendMessageFunc) {
				MEM_Info("Spine: sendMessage function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading receiveMessage function");
			Spine_ReceiveMessageFunc = GetProcAddress(Spine_Dll, "receiveMessage");
			
			if (!Spine_ReceiveMessageFunc) {
				MEM_Info("Spine: receiveMessage function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading searchMatch function");
			Spine_SearchMatchFunc = GetProcAddress(Spine_Dll, "searchMatch");
			
			if (!Spine_SearchMatchFunc) {
				MEM_Info("Spine: searchMatch function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading isInMatch function");
			Spine_IsInMatchFunc = GetProcAddress(Spine_Dll, "isInMatch");
			
			if (!Spine_IsInMatchFunc) {
				MEM_Info("Spine: isInMatch function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading getPlayerCount function");
			Spine_GetPlayerCountFunc = GetProcAddress(Spine_Dll, "getPlayerCount");
			
			if (!Spine_GetPlayerCountFunc) {
				MEM_Info("Spine: getPlayerCount function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading getPlayerUsername function");
			Spine_GetPlayerUsernameFunc = GetProcAddress(Spine_Dll, "getPlayerUsername");
			
			if (!Spine_GetPlayerUsernameFunc) {
				MEM_Info("Spine: getPlayerUsername function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
		} else {
			Spine_CreateMessageFunc = 0;
			Spine_SendMessageFunc = 0;
			Spine_ReceiveMessageFunc = 0;
			Spine_SearchMatchFunc = 0;
			Spine_IsInMatchFunc = 0;
			Spine_GetPlayerCountFunc = 0;
			Spine_GetPlayerUsernameFunc = 0;
		};
		
		if (modules & SPINE_MODULE_OVERALLSAVE) {
			MEM_Info("Spine: Loading setOverallSaveValue function");
			Spine_OverallSaveSetStringFunc = GetProcAddress(Spine_Dll, "setOverallSaveValue");
			
			if (!Spine_OverallSaveSetStringFunc) {
				MEM_Info("Spine: setOverallSaveValue function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading getOverallSaveValue function");
			Spine_OverallSaveGetStringFunc = GetProcAddress(Spine_Dll, "getOverallSaveValue");
			
			if (!Spine_OverallSaveGetStringFunc) {
				MEM_Info("Spine: getOverallSaveValue function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
		} else {
			Spine_OverallSaveSetStringFunc = 0;
			Spine_OverallSaveGetStringFunc = 0;
		};
		
		MEM_Info("Spine: Calling init function");
		CALL_IntParam(modules);
		CALL__cdecl(Spine_InitFunc);
		Spine_Initialized = CALL_RetValAsInt();
		
		if (!Spine_Initialized) {
			MEM_Info("Spine: init function failed");
			FreeLibrary(Spine_Dll);
			return FALSE;
		};
		
		return Spine_Initialized;
	};
	return Spine_Initialized;
};

// returns the username of the user currently logged in
// if played without account/login, empty string is returned
func string Spine_GetCurrentUsername() {
	if (Spine_Initialized && Spine_GetUsernameFunc) {
		const string STR_BUFFER = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";

		CALL_cStringPtrParam(STR_BUFFER);
		CALL__cdecl(Spine_GetUsernameFunc);
		
		MEM_Info(ConcatStrings("Spine: Username is ", STR_BUFFER));
		
		return STR_BUFFER;
	};
	return "";
};

// return TRUE or FALSE whether the achievement for the given id is already unlocked or not
func int Spine_IsAchievementUnlocked(var int identifier) {
	if (Spine_Initialized && Spine_IsAchievementUnlockedFunc) {
		CALL_IntParam(identifier);
		CALL__cdecl(Spine_IsAchievementUnlockedFunc);
		return CALL_RetValAsInt();
	};
	return FALSE;
};

// unlocks achievement for this mod for given id
// contact Bonne to get your achievements on the server
// will also automatically create a view informing about unlocking the achievement
// unless it is disabled via setting SPINE_SHOWACHIEVEMENTS = FALSE
// place on the screen can be changed setting SPINE_ACHIEVEMENTORIENTATION
func void Spine_UnlockAchievement(var int identifier) {
	if (Spine_Initialized && Spine_UnlockAchievementFunc) {
		if (!Spine_IsAchievementUnlocked(identifier)) {
			CALL_IntParam(identifier);
			CALL__cdecl(Spine_UnlockAchievementFunc);
			
			if (Spine_AchievementView == 0) {
				var int startPosX;
				var int startPosY;
				var zCView screen; screen = _^(MEM_Game._zCSession_viewport);
				if (SPINE_ACHIEVEMENTORIENTATION == SPINE_TOPLEFT) {
					startPosX = 0;
					startPosY = 0;
				} else if (SPINE_ACHIEVEMENTORIENTATION == SPINE_TOPRIGHT) {
					startPosX = screen.psizex - SPINE_ACHIEVEMENT_WIDTH;
					startPosY = 0;
				} else if (SPINE_ACHIEVEMENTORIENTATION == SPINE_BOTTOMLEFT) {
					startPosX = 0;
					startPosY = screen.psizey - SPINE_ACHIEVEMENT_HEIGHT;
				} else if (SPINE_ACHIEVEMENTORIENTATION == SPINE_BOTTOMRIGHT) {
					startPosX = screen.psizex - SPINE_ACHIEVEMENT_WIDTH;
					startPosY = screen.psizey - SPINE_ACHIEVEMENT_HEIGHT;
				};
				Spine_AchievementView = View_CreatePxl(startPosX, startPosY, startPosX + SPINE_ACHIEVEMENT_WIDTH, startPosY + SPINE_ACHIEVEMENT_HEIGHT);
				View_SetTexture(Spine_AchievementView, "ACHIEVEMENT_BACKGROUND.TGA");
				View_Open(Spine_AchievementView);
				
				var int imageStartPosX;
				var int imageStartPosY;
				var int imageOffset;
				imageOffset = (SPINE_ACHIEVEMENT_HEIGHT - SPINE_ACHIEVEMENT_IMAGE_HEIGHT) / 2;
				imageStartPosX = startPosX + imageOffset;
				imageStartPosY = startPosY + imageOffset;
				Spine_AchievementImageView = View_CreatePxl(imageStartPosX, imageStartPosY, imageStartPosX + SPINE_ACHIEVEMENT_IMAGE_WIDTH, imageStartPosY + SPINE_ACHIEVEMENT_IMAGE_HEIGHT);
				var string achievementTexture;
				achievementTexture = MEM_ReadStatStringArr(SPINE_ACHIEVEMENT_TEXTURES, identifier);
				View_SetTexture(Spine_AchievementImageView, achievementTexture);
				View_Open(Spine_AchievementImageView);
				
				var string achievementName;
				achievementName = MEM_ReadStatStringArr(SPINE_ACHIEVEMENT_NAMES, identifier);
				View_AddText(Spine_AchievementView, Print_ToVirtual(SPINE_ACHIEVEMENT_IMAGE_WIDTH + imageOffset * 2, SPINE_ACHIEVEMENT_WIDTH), Print_ToVirtual(imageOffset, SPINE_ACHIEVEMENT_HEIGHT), achievementName, FONT_SCREENSMALL);
				
				FF_ApplyOnceExt(Spine_RemoveAchievementView, SPINE_ACHIEVEMENT_DISPLAY_TIME, 1);
			} else {
				var int i; i = 0;
				var int pos; pos = MEM_StackPos.position;
	
				var int hndl; hndl = MEM_ReadStatArr(SPINE_ACHIEVEMENTSQUEUE, i);
				
				if (hndl == -1) {
					MEM_WriteStatArr(SPINE_ACHIEVEMENTSQUEUE, i, identifier);
				} else {
					i += 1;
					if (i < 10) {
						MEM_StackPos.position = pos;
					};
				};
			};
		};
	};
};

// adds a score for a specific identifier
// contact Bonne to get your rankings on the server
func void Spine_UpdateScore(var int identifier, var int score) {
	if (Spine_Initialized && Spine_UpdateScoreFunc) {
		CALL_IntParam(score);
		CALL_IntParam(identifier);
		CALL__cdecl(Spine_UpdateScoreFunc);
	};
};

// returns the score for the given identifier
// if no score exists for the player/identifier combination, 0 is returned
func int Spine_GetUserScore(var int identifier) {
	if (Spine_Initialized && Spine_GetUserScoreFunc) {
		CALL_IntParam(identifier);
		CALL__cdecl(Spine_GetUserScoreFunc);
		return CALL_RetValAsInt();
	};
	return 0;
};

// returns the rank for the given identifier
// if no score exists for the player/identifier combination, 0 is returned
func int Spine_GetUserRank(var int identifier) {
	if (Spine_Initialized && Spine_GetUserRankFunc) {
		CALL_IntParam(identifier);
		CALL__cdecl(Spine_GetUserRankFunc);
		return CALL_RetValAsInt();
	};
	return -1;
};

// returns the score for the given identifier and rank
// if no score exists for the rank/identifier combination, 0 is returned
func int Spine_GetScoreForRank(var int identifier, var int rank) {
	if (Spine_Initialized && Spine_GetScoreForRankFunc) {
		CALL_IntParam(rank);
		CALL_IntParam(identifier);
		CALL__cdecl(Spine_GetScoreForRankFunc);
		return CALL_RetValAsInt();
	};
	return -1;
};

// returns the username for the given identifier and rank
// if no score exists for the rank/identifier combination, empty string is returned
func string Spine_GetUsernameForRank(var int identifier, var int rank) {
	if (Spine_Initialized && Spine_GetUsernameForRankFunc) {
		const string STR_BUFFER = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
		
		CALL_cStringPtrParam(STR_BUFFER);
		CALL_IntParam(rank);
		CALL_IntParam(identifier);
		CALL__cdecl(Spine_GetUsernameForRankFunc);
		return STR_BUFFER;
	};
	return "";
};

func void Spine_RemoveAchievementView() {
	if (Hlp_IsValidHandle(Spine_AchievementView)) {
		View_Close(Spine_AchievementView);
		Spine_AchievementView = 0;
	};
	if (Hlp_IsValidHandle(Spine_AchievementImageView)) {
		View_Close(Spine_AchievementImageView);
		Spine_AchievementImageView = 0;
	};
	if (SPINE_ACHIEVEMENTSQUEUE[0] != -1) {
		var int identifier;
		identifier = SPINE_ACHIEVEMENTSQUEUE[0];
		var int i; i = 0;
		var int pos; pos = MEM_StackPos.position;

		var int hndl; hndl = MEM_ReadStatArr(SPINE_ACHIEVEMENTSQUEUE, i);
		
		if (hndl == -1) {
			MEM_WriteStatArr(SPINE_ACHIEVEMENTSQUEUE, i, MEM_ReadStatArr(SPINE_ACHIEVEMENTSQUEUE, i + 1));
		} else {
			i += 1;
			if (i < 9) {
				MEM_StackPos.position = pos;
			};
		};
		MEM_WriteStatArr(SPINE_ACHIEVEMENTSQUEUE, i, -1);
		Spine_UnlockAchievement(identifier);
	};
};