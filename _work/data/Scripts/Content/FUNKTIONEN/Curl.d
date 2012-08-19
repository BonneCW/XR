//******************************
//  Verwendung der LibCurl
//******************************

// Sendet an übergebene URL
// gibt 0 bei Erfolg zurück, alles andere ist Fehler

FUNC VOID FreeLibrary (var int ptr)
{
	var int freelib;
	freelib = FindKernelDllFunction("FreeLibrary");

	if (!freelib)
	{
		return;
	};

	CALL_PtrParam(ptr);
	CALL__stdcall(freelib);
};

FUNC INT GetTickCount ()
{
	var int gettickcount;
	gettickcount = FindKernelDllFunction("GetTickCount");

	if (!gettickcount)
	{
		return -1;
	};

	CALL__stdcall(gettickcount);

	return CALL_RetValAsInt();
};

func int CURL_Send(var string url) {
	var int libcurl; libcurl = LoadLibrary("LIBCURL.DLL");

	if(!libcurl) { return -1; };

	var int curl_init;      curl_init      = GetProcAddress(libcurl, "curl_easy_init");
	var int curl_setopt;    curl_setopt    = GetProcAddress(libcurl, "curl_easy_setopt");
	var int curl_perform;   curl_perform   = GetProcAddress(libcurl, "curl_easy_perform");
	var int curl_cleanup;   curl_cleanup   = GetProcAddress(libcurl, "curl_easy_cleanup");

	if((!!curl_init)+(!!curl_setopt)+(!!curl_perform)+(!!curl_cleanup) < 4)
	{
		FreeLibrary(libcurl);

		return -1;
	};

	var int CURL;  CURL  = 0;
	var int res;

	CALL__stdcall(curl_init);
	CURL = CALL_RetValAsPtr();

	CALL_cStringPtrParam(url);
	CALL_IntParam(10002);
	CALL_PtrParam(CURL);
	CALL__cdecl(curl_setopt);

	CALL_PtrParam(CURL);
	CALL__cdecl(curl_perform);
	res = CALL_RetValAsInt();

	CALL_PtrParam(CURL);
	CALL__cdecl(curl_cleanup);

	FreeLibrary(libcurl);

	return res;
};

func string CURL_Get(var string url) {
	var int libcurl; libcurl = LoadLibrary("CURL_Receive.DLL");

	var int lasterror;
	lasterror = FindKernelDllFunction("GetLastError");

	if(!libcurl)
	{ 
		return "AMARSCH";
	};

	var int curl_receive;      curl_receive	= GetProcAddress(libcurl, "?CURL_Receive@@YAXPBDPAD@Z");

	if (!curl_receive)
	{
		FreeLibrary(libcurl);
		return "AMARSCH";
	};

	const string STR_BUFFER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1ABCDEFGHIJKLMNOPQRSTUVWXYZ2ABCDEFGHIJKLMNOPQRSTUVWXYZ3ABCDEFGHIJKLMNOPQRSTUVWXYZ4ABCDEFGHIJKLMNOPQRSTUVWXYZ5ABCDEFGHIJKLMNOPQRSTUVWXYZ6ABCDEFGHIJKLMNOPQRSTUVWXYZ7ABCDEFGHIJKLMNOPQRSTUVWXYZ8ABCDEFGHIJKLMNOPQRSTUVWXYZ9ABCDEFGHIJKLMNOPQRSTUVWXYZ10ABCDEFGHIJKLMNOPQRSTUVWXYZ10ABCDEFGHIJKLMNOPQRSTUVWXYZ10ABCDEFGHIJKLMNOPQRSTUVWXYZ10ABCDEFGHIJKLMNOPQRSTUVWXYZ10ABCDEFGHIJKLMNOPQRSTUVWXYZ10ABCDEFGHIJKLMNOPQRSTUVWXYZ10";

	CALL_cStringPtrParam(STR_BUFFER);
	CALL_cStringPtrParam(url);
	CALL__cdecl(curl_receive);

	FreeLibrary(libcurl);

	return STR_BUFFER;
};