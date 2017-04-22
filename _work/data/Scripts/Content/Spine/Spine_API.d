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
	SPINE_SHOWACHIEVEMENTS = TRUE;
	
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
			
			MEM_Info("Spine: Loading updateAchievementProgress function");
			Spine_UpdateAchievementProgressFunc = GetProcAddress(Spine_Dll, "updateAchievementProgress");
			
			if (!Spine_UpdateAchievementProgressFunc) {
				MEM_Info("Spine: updateAchievementProgress function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading getAchievementProgress function");
			Spine_GetAchievementProgressFunc = GetProcAddress(Spine_Dll, "getAchievementProgress");
			
			if (!Spine_GetAchievementProgressFunc) {
				MEM_Info("Spine: getAchievementProgress function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading getAchievementMaxProgress function");
			Spine_GetAchievementMaxProgressFunc = GetProcAddress(Spine_Dll, "getAchievementMaxProgress");
			
			if (!Spine_GetAchievementMaxProgressFunc) {
				MEM_Info("Spine: getAchievementMaxProgress function not found");
				FreeLibrary(Spine_Dll);
				return FALSE;
			};
			
			MEM_Info("Spine: Loading getShowAchievements function");
			Spine_GetShowAchievementsFunc = GetProcAddress(Spine_Dll, "getShowAchievements");
			
			if (!Spine_GetShowAchievementsFunc) {
				MEM_Info("Spine: getShowAchievements function not found");
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
		
		CALL__cdecl(Spine_GetShowAchievementsFunc);
		SPINE_SHOWACHIEVEMENTS = CALL_RetValAsInt();
		
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
