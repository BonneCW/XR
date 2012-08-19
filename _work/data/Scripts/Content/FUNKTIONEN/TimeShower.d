var int TimeCounter_Sek;
var int TimeCounter_Min;
var int TimeCounter_H;

FUNC VOID TimeShower()
{
	TimeCounter_Sek += 1;
	TimeCounter_Real += 1;

	if (TimeCounter_Sek == 60)
	{
		TimeCounter_Min += 1;

		TimeCounter_Sek = 0;
	};

	if (TimeCounter_Min == 60)
	{
		TimeCounter_H += 1;

		TimeCounter_Min = 0;
	};	

	if (TimeAn == TRUE)
	{
		var string Time;

		var string Time_H;
		var string Time_Min;
		var string Time_Sek;

		if (TimeCounter_H < 10)
		{
			Time_H = ConcatStrings("0", IntToString(TimeCounter_H));
		}
		else
		{
			Time_H = IntToString(TimeCounter_H);
		};
		if (TimeCounter_Min < 10)
		{
			Time_Min = ConcatStrings("0", IntToString(TimeCounter_Min));
		}
		else
		{
			Time_Min = IntToString(TimeCounter_Min);
		};
		if (TimeCounter_Sek < 10)
		{
			Time_Sek = ConcatStrings("0", IntToString(TimeCounter_Sek));
		}
		else
		{
			Time_Sek = IntToString(TimeCounter_Sek);
		};

		Time = ConcatStrings(Time_H, ":");
		Time = ConcatStrings(Time, Time_Min);
		Time = ConcatStrings(Time, ":");
		Time = ConcatStrings(Time, Time_Sek);

		View_DeleteText	(View_Time);
		View_AddText	(View_Time, 0, 0, Time, FONT_Screen);
	};
};