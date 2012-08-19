FUNC INT B_GetHour()
{
	if (Wld_IsTime(00,00,00,59))
	{
		return 0;
	}
	else if (Wld_IsTime(01,00,01,59))
	{
		return 1;
	}
	else if (Wld_IsTime(02,00,02,59))
	{
		return 2;
	}
	else if (Wld_IsTime(03,00,03,59))
	{
		return 3;
	}
	else if (Wld_IsTime(04,00,04,59))
	{
		return 4;
	}
	else if (Wld_IsTime(05,00,05,59))
	{
		return 5;
	}
	else if (Wld_IsTime(06,00,06,59))
	{
		return 6;
	}
	else if (Wld_IsTime(07,00,07,59))
	{
		return 7;
	}
	else if (Wld_IsTime(08,00,08,59))
	{
		return 8;
	}
	else if (Wld_IsTime(09,00,09,59))
	{
		return 9;
	}
	else if (Wld_IsTime(10,00,10,59))
	{
		return 10;
	}
	else if (Wld_IsTime(11,00,11,59))
	{
		return 11;
	}
	else if (Wld_IsTime(12,00,12,59))
	{
		return 12;
	}
	else if (Wld_IsTime(13,00,13,59))
	{
		return 13;
	}
	else if (Wld_IsTime(14,00,14,59))
	{
		return 14;
	}
	else if (Wld_IsTime(15,00,15,59))
	{
		return 15;
	}
	else if (Wld_IsTime(16,00,16,59))
	{
		return 16;
	}
	else if (Wld_IsTime(17,00,17,59))
	{
		return 17;
	}
	else if (Wld_IsTime(18,00,18,59))
	{
		return 18;
	}
	else if (Wld_IsTime(19,00,19,59))
	{
		return 19;
	}
	else if (Wld_IsTime(20,00,20,59))
	{
		return 20;
	}
	else if (Wld_IsTime(21,00,21,59))
	{
		return 21;
	}
	else if (Wld_IsTime(22,00,22,59))
	{
		return 22;
	}
	else if (Wld_IsTime(23,00,23,59))
	{
		return 23;
	};
};

FUNC INT B_GetTime()
{
	var int timeh;
	var int timemin;

	var int time;

	// Stunde ermitteln

	timeh = B_GetHour();

	// Minute ermitteln

	if (Wld_IsTime(timeh,00,timeh,01))
	{
		timemin = 0;
	}
	else if (Wld_IsTime(timeh,01,timeh,02))
	{
		timemin = 1;
	}
	else if (Wld_IsTime(timeh,02,timeh,03))
	{
		timemin = 2;
	}
	else if (Wld_IsTime(timeh,03,timeh,04))
	{
		timemin = 3;
	}
	else if (Wld_IsTime(timeh,04,timeh,05))
	{
		timemin = 4;
	}
	else if (Wld_IsTime(timeh,05,timeh,06))
	{
		timemin = 5;
	}
	else if (Wld_IsTime(timeh,06,timeh,07))
	{
		timemin = 6;
	}
	else if (Wld_IsTime(timeh,07,timeh,08))
	{
		timemin = 7;
	}
	else if (Wld_IsTime(timeh,08,timeh,09))
	{
		timemin = 8;
	}
	else if (Wld_IsTime(timeh,09,timeh,10))
	{
		timemin = 9;
	}
	else if (Wld_IsTime(timeh,10,timeh,11))
	{
		timemin = 10;
	}
	else if (Wld_IsTime(timeh,11,timeh,12))
	{
		timemin = 11;
	}
	else if (Wld_IsTime(timeh,12,timeh,13))
	{
		timemin = 12;
	}
	else if (Wld_IsTime(timeh,13,timeh,14))
	{
		timemin = 13;
	}
	else if (Wld_IsTime(timeh,14,timeh,15))
	{
		timemin = 14;
	}
	else if (Wld_IsTime(timeh,15,timeh,16))
	{
		timemin = 15;
	}
	else if (Wld_IsTime(timeh,16,timeh,17))
	{
		timemin = 16;
	}
	else if (Wld_IsTime(timeh,17,timeh,18))
	{
		timemin = 17;
	}
	else if (Wld_IsTime(timeh,18,timeh,19))
	{
		timemin = 18;
	}
	else if (Wld_IsTime(timeh,19,timeh,20))
	{
		timemin = 19;
	}
	else if (Wld_IsTime(timeh,20,timeh,21))
	{
		timemin = 20;
	}
	else if (Wld_IsTime(timeh,21,timeh,22))
	{
		timemin = 21;
	}
	else if (Wld_IsTime(timeh,22,timeh,23))
	{
		timemin = 22;
	}
	else if (Wld_IsTime(timeh,23,timeh,24))
	{
		timemin = 23;
	}
	else if (Wld_IsTime(timeh,24,timeh,25))
	{
		timemin = 24;
	}
	else if (Wld_IsTime(timeh,25,timeh,26))
	{
		timemin = 25;
	}
	else if (Wld_IsTime(timeh,26,timeh,27))
	{
		timemin = 26;
	}
	else if (Wld_IsTime(timeh,27,timeh,28))
	{
		timemin = 27;
	}
	else if (Wld_IsTime(timeh,28,timeh,29))
	{
		timemin = 28;
	}
	else if (Wld_IsTime(timeh,29,timeh,30))
	{
		timemin = 29;
	}
	else if (Wld_IsTime(timeh,30,timeh,31))
	{
		timemin = 30;
	}
	else if (Wld_IsTime(timeh,31,timeh,32))
	{
		timemin = 31;
	}
	else if (Wld_IsTime(timeh,32,timeh,33))
	{
		timemin = 32;
	}
	else if (Wld_IsTime(timeh,33,timeh,34))
	{
		timemin = 33;
	}
	else if (Wld_IsTime(timeh,34,timeh,35))
	{
		timemin = 34;
	}
	else if (Wld_IsTime(timeh,35,timeh,36))
	{
		timemin = 35;
	}
	else if (Wld_IsTime(timeh,36,timeh,37))
	{
		timemin = 36;
	}
	else if (Wld_IsTime(timeh,37,timeh,38))
	{
		timemin = 37;
	}
	else if (Wld_IsTime(timeh,38,timeh,39))
	{
		timemin = 38;
	}
	else if (Wld_IsTime(timeh,39,timeh,40))
	{
		timemin = 39;
	}
	else if (Wld_IsTime(timeh,40,timeh,41))
	{
		timemin = 40;
	}
	else if (Wld_IsTime(timeh,41,timeh,42))
	{
		timemin = 41;
	}
	else if (Wld_IsTime(timeh,42,timeh,43))
	{
		timemin = 42;
	}
	else if (Wld_IsTime(timeh,43,timeh,44))
	{
		timemin = 43;
	}
	else if (Wld_IsTime(timeh,44,timeh,45))
	{
		timemin = 44;
	}
	else if (Wld_IsTime(timeh,45,timeh,46))
	{
		timemin = 45;
	}
	else if (Wld_IsTime(timeh,46,timeh,47))
	{
		timemin = 46;
	}
	else if (Wld_IsTime(timeh,47,timeh,48))
	{
		timemin = 47;
	}
	else if (Wld_IsTime(timeh,48,timeh,49))
	{
		timemin = 48;
	}
	else if (Wld_IsTime(timeh,49,timeh,50))
	{
		timemin = 49;
	}
	else if (Wld_IsTime(timeh,50,timeh,51))
	{
		timemin = 50;
	}
	else if (Wld_IsTime(timeh,51,timeh,52))
	{
		timemin = 51;
	}
	else if (Wld_IsTime(timeh,52,timeh,53))
	{
		timemin = 52;
	}
	else if (Wld_IsTime(timeh,53,timeh,54))
	{
		timemin = 53;
	}
	else if (Wld_IsTime(timeh,54,timeh,55))
	{
		timemin = 54;
	}
	else if (Wld_IsTime(timeh,55,timeh,56))
	{
		timemin = 55;
	}
	else if (Wld_IsTime(timeh,56,timeh,57))
	{
		timemin = 56;
	}
	else if (Wld_IsTime(timeh,57,timeh,58))
	{
		timemin = 57;
	}
	else if (Wld_IsTime(timeh,58,timeh,59))
	{
		timemin = 58;
	}
	else if (Wld_IsTime(timeh,59,timeh,60))
	{
		timemin = 59;
	};

	// Zeit berechnen in Minuten

	time = timeh*60 + timemin;

	return time;
};