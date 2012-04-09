//****************************
// 	EVT_MONASTERY_SECRETLIBRARY_FUNC (Funktion, die bei öffnen der Geheimtür zur geheimen Bibliothek ausgeführt wird. normalerweise Kapitel 5)
//****************************
func void EVT_MONASTERY_SECRETLIBRARY_S1 ()
{
	if (SecretLibraryIsOpen == FALSE)
	{
		B_GivePlayerXP (XP_OpenSecretLibrary);
		SecretLibraryIsOpen = TRUE;

		
	};
	

	PrintScreen ("", -1, -1, FONT_Screen, 0);

};
