var int Spine_OverallSaveSetStringFunc;
var int Spine_OverallSaveGetStringFunc;

// saves a string value for the given key
// can be retrieved again using Spine_OverallSaveGetString(var string key)
func void Spine_OverallSaveSetString(var string key, var string value) {
	if (Spine_Initialized && Spine_OverallSaveSetStringFunc) {
		CALL_cStringPtrParam(value);
		CALL_cStringPtrParam(key);
		CALL__cdecl(Spine_OverallSaveSetStringFunc);		
		return;
	};
	return;
};

// saves an integer value for the given key
// can be retrieved again using Spine_OverallSaveGetInt(var string key)
func void Spine_OverallSaveSetInt(var string key, var int value) {
	if (Spine_Initialized && Spine_OverallSaveSetStringFunc) {
		Spine_OverallSaveSetString(key, IntToString(value));		
		return;
	};
	return;
};

// returns an empty string if not initialized or key not found, otherwise the value stored for the key
func string Spine_OverallSaveGetString(var string key) {
	if (Spine_Initialized && Spine_OverallSaveGetStringFunc) {
		const string STR_BUFFER = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";

		CALL_cStringPtrParam(key);
		CALL__cdecl(Spine_OverallSaveGetStringFunc);
		
		return STR_BUFFER;
	};
	return "";
};

// returns -1 if not initialized or key not found, otherwise the value stored for the key
func int Spine_OverallSaveGetInt(var string key) {
	if (Spine_Initialized && Spine_OverallSaveGetStringFunc) {
		var string value; value = Spine_OverallSaveGetString(key);
		return STR_ToInt(value);
	};
	return -1;
};
