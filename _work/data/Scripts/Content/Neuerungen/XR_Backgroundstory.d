var int backgroundview;

FUNC VOID XR_Backgroundstory (var int param)
{
	if (param == 6)
	{
		View_Close(backgroundview);
		View_Delete(backgroundview);

		return;
	};

	if (!Hlp_IsValidHandle(backgroundview))
	{
		Print_GetScreenSize();

		backgroundview = View_CreatePxl(0, 0, Print_Screen[PS_X], Print_Screen[PS_Y]);

		View_Open(backgroundview);
	};

	View_SetTexture (backgroundview, ConcatStrings(ConcatStrings("XR_BACKGROUNDSTORY_0", IntToString(param)), ".TGA"));
};