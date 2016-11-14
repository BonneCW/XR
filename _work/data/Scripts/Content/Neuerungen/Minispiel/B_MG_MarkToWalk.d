FUNC VOID B_MG_MarkToWalk()
{
	var int i; i = 0;
	var int ptr; ptr = MEM_StackPos.position;

	if (i < 5)
	{
		var int field; field = -1;
		if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_TROLL)
		{
			field = Hero_Troll.field;
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Minecrawlerqueen)
		{
			field = Hero_Minecrawlerqueen.field;
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Schaf)
		{
			field = Hero_Schaf.field;
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Hase)
		{
			field = Hero_Hase.field;
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Balrog)
		{
			field = Hero_Balrog.field;
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Meatbug)
		{
			field = Hero_Meatbug.field;
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Snapper)
		{
			field = Hero_Snapper.field;
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Stoneguardian)
		{
			field = Hero_Stoneguardian.field;
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Goblin)
		{
			field = Hero_Goblin.field;
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Bloodfly)
		{
			field = Hero_Bloodfly.field;
		};
		if (field != -1) {
			var int viewPtr;
			viewPtr = MEM_ReadStatArr(MG_Spielfeld_Texturen, field);

			View_SetTexture (viewPtr, "MG_SPIELFELD_TOWALK.TGA");
		};
	
		i += 1;

		MEM_StackPos.position = ptr;
	};
};