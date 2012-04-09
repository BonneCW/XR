FUNC VOID StartRain()
{
	//MEM_InitGlobalInst();
    
	MEM_SkyController.rainFX_timeStartRain = FLOATNULL;

	MEM_SkyController.rainFX_timeStopRain = FLOATEINS;
};

FUNC VOID StopRain()
{
	//MEM_InitGlobalInst();
    
	MEM_SkyController.rainFX_timeStartRain = FLOATNULL;

	MEM_SkyController.rainFX_timeStopRain = FLOATNULL;
};

FUNC VOID StartRain_Slow()
{
	var int starttime;
	var int stoptime;

	var int time;

	var int timef;
	var int maxtimef;

	time = B_GetTime();

	//time += 20;

	timef = mkf(time);

	maxtimef = mkf(24*60);

	time += 120;

	starttime = divf(timef, maxtimef);

	timef = mkf(time);

	stoptime = divf(timef, maxtimef);

	printf(starttime);
	printf(stoptime);

	MEM_SkyController.rainFX_timeStartRain = starttime;

	MEM_SkyController.rainFX_timeStopRain = stoptime;
};

FUNC VOID StopRain_Slow()
{
	var int stoptime;

	var int time;

	var int timef;
	var int maxtimef;

	time = B_GetTime();

	time -= 20;

	timef = mkf(time);

	maxtimef = mkf(24*60);

	stoptime = divf(timef, maxtimef);

	printf(stoptime);

	MEM_SkyController.rainFX_timeStartRain = FLOATNULL;

	MEM_SkyController.rainFX_timeStopRain = stoptime;
};