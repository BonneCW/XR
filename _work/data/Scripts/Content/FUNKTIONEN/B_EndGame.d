FUNC VOID B_EndGame()
{
	if (Offline_Modus == FALSE)
	{
		CURL_Send(ConcatStrings("http://www.teutonicteam.de/gomon/tauschen/goOffline.php?name=", username));
		CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/gomon/tauschen/actualizePlaytime.php?name=", username), "&game=4&time="), IntToString(online_playtime)));
	};

	//B_Autosave();
};

FUNC VOID B_OpenInventory()
{
	Inventory_Open = TRUE;
};

FUNC VOID B_CloseInventory()
{
	Inventory_Open = FALSE;
};