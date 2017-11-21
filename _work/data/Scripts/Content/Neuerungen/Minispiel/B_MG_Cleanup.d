FUNC VOID B_MG_Cleanup() {
	var int i; i = 0;
	var int ptr; ptr = MEM_StackPos.position;

	if (i < 80) {
		var int hndl;

		hndl = MEM_ReadStatArr(MG_Spielfeld_Texturen, i);

		View_Delete(hndl);

		if (i < 10) {
			hndl = MEM_ReadStatArr(MG_EigeneFiguren3, i);

			if (Hlp_IsValidHandle(hndl)) {
				delete(hndl);

				MEM_WriteStatArr(MG_EigeneFiguren3, i, 0);
			};

			MEM_WriteStatArr(MG_EigeneFiguren2, i, 0);

			hndl = MEM_ReadStatArr(MG_GegnerFiguren3, i);

			if (Hlp_IsValidHandle(hndl)) {
				delete(hndl);

				MEM_WriteStatArr(MG_GegnerFiguren3, i, 0);
			};

			MEM_WriteStatArr(MG_GegnerFiguren2, i, 0);
		};

		i += 1;

		MEM_StackPos.position = ptr;
	};

	View_Delete(MG_Spielbrett);
	
	Button_DeleteMouseover();

	Cursor_Hide();
};
