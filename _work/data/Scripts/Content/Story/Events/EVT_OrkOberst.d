
//****************************
// 	EVT_ORKOBERST 
//****************************

var int EVT_ORKOBERST_OneTime;
func void EVT_ORKOBERST ()
{
	if (EVT_ORKOBERST_OneTime == FALSE)
	{
		EVT_ORKOBERST_OneTime = TRUE;
	};
	

	PrintScreen ("", -1, -1, FONT_Screen, 0);

};
