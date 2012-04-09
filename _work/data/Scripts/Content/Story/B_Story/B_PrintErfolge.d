// **************
// B_GivePlayerXP
// **************

func void B_PrintErfolg (var string ErfolgName)
{
	var string newText;

	newText = ConcatStrings("Erfolg erreicht: ", ErfolgName);

	PrintScreen (newText, -1, YPOS_LevelUp+25, FONT_Screen, 2);
};

