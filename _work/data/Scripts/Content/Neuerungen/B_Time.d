FUNC INT B_GetHour()
{
        var int h;
   	h = divf(MEM_WorldTimer.worldTime, mkf(4167));
    	h = divf(h, mkf(60));
    	return truncf(h);
};

FUNC INT B_GetTime()
{
	var int timeh;
	var int timemin;

	var int time;

	// Stunde ermitteln

	timeh = B_GetHour();

	// Minute ermitteln
	
    	 timemin = divf(MEM_WorldTimer.worldTime, mkf(4167));
   	 timemin = truncf(timemin);
   	 timemin = timemin%60;

	// Zeit berechnen in Minuten

	time = timeh * 60 + timemin;

	return time;
};
