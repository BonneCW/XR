
//****************************
// 	EVT_OPEN_DOOR_LIBRARY (Funktion, die bei öffnen der abgeschlossenen Tür zur geheimen Bibliothek ausgeführt wird. Kapitel 5)
//****************************
var int EVT_OPEN_DOOR_LIBRARY_S1_OneTime;
func void EVT_OPEN_DOOR_LIBRARY_S1 ()
{
	if(EVT_OPEN_DOOR_LIBRARY_S1_OneTime == FALSE)
	{
		EVT_OPEN_DOOR_LIBRARY_S1_OneTime = TRUE;
	};
};
