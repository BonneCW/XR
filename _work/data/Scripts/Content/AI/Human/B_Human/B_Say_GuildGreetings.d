// ********************
// B_Say_GuildGreetings
// ********************

func void B_Say_GuildGreetings (var C_NPC slf, var C_NPC oth)
{

	B_Vergiftet (self);

	if (slf.guild == GIL_VLK)
	&& ( (oth.guild == GIL_VLK) || (oth.guild == GIL_PAL) )
	{
		B_Say_Overlay (slf, oth, "$PALGREETINGS");
		return;
	};
	
	if (slf.guild == GIL_PAL)
	&& ((oth.guild == GIL_PAL) || (oth.guild == GIL_VLK))
	{
		B_Say_Overlay (slf, oth, "$MILGREETINGS");
		return;
	};
	
	if (slf.guild == GIL_KDF)
	&& (oth.guild == GIL_KDF)
	{
		B_Say_Overlay (slf, oth, "$BELGREETINGS");
		return;
	};
	
	if (slf.guild == GIL_NOV)
	&& (oth.guild == GIL_NOV)
	{
		B_Say_Overlay (slf, oth, "$ADANOSGREETINGS");
		return;
	};
		
	var int zufall; zufall = Hlp_Random (100); 
	
	if (zufall <= 10)
	&& Wld_IsRaining()
	{
		B_Say_Overlay (slf, oth, "$WEATHER"); //So ein Mistwetter!
		return;
		
	};
};


