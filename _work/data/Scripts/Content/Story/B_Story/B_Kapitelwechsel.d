// **************
// Kapitelwechsel
// **************

FUNC VOID B_Kapitelwechsel (VAR INT neues_Kapitel, VAR INT aktuelles_Level_Zen)
{
	Kapitel = neues_Kapitel;

	Mod_Kardif_Info = 0;

	var string sendText;

	sendText = ConcatStrings("http://www.teutonicteam.de/gomon/tauschen/kapitel_XR.php?name=", username);
	sendText = ConcatStrings(sendText, "&kapitel=");
	sendText = ConcatStrings(sendText, IntToString(neues_Kapitel));
	sendText = ConcatStrings(sendText, "&level=");
	sendText = ConcatStrings(sendText, IntToString(hero.level));
	sendText = ConcatStrings(sendText, "&str=");
	sendText = ConcatStrings(sendText, IntToString(hero.attribute[ATR_STRENGTH]));
	sendText = ConcatStrings(sendText, "&dex=");
	sendText = ConcatStrings(sendText, IntToString(hero.attribute[ATR_DEXTERITY]));
	sendText = ConcatStrings(sendText, "&mana=");
	sendText = ConcatStrings(sendText, IntToString(hero.attribute[ATR_MANA_MAX]));
	sendText = ConcatStrings(sendText, "&hp=");
	sendText = ConcatStrings(sendText, IntToString(hero.attribute[ATR_HITPOINTS_MAX]));
	sendText = ConcatStrings(sendText, "&1h=");
	sendText = ConcatStrings(sendText, IntToString(hero.hitChance[NPC_TALENT_1H]));
	sendText = ConcatStrings(sendText, "&2h=");
	sendText = ConcatStrings(sendText, IntToString(hero.hitChance[NPC_TALENT_2H]));
	sendText = ConcatStrings(sendText, "&bow=");
	sendText = ConcatStrings(sendText, IntToString(hero.hitChance[NPC_TALENT_BOW]));
	sendText = ConcatStrings(sendText, "&cbow=");
	sendText = ConcatStrings(sendText, IntToString(hero.hitChance[NPC_TALENT_CROSSBOW]));

	if (!Offline_Modus)
	{
		CURL_Send(sendText);
	};
	
	//***************************************************************************
	//	KAPITEL 1
	//***************************************************************************
	if (neues_Kapitel == 1)
	{
		// ------ Bild einblenden ------
		IntroduceChapter (KapWechsel_1,"Die Bedrohung","chapter1.tga","chapter_01.wav", 6000);

		Kapitel01_Inventar	= HeroInventarWert();
		Kapitel01_Gold		= Npc_HasItems(hero, ItMi_Gold);
		Kapitel01_Erfahrung	= hero.exp;
		Kapitel01_Level		= hero.level;
		Kapitel01_Zeit		= TimeCounter_Real;
	}
	
	//***************************************************************************
	//	KAPITEL 2
	//***************************************************************************
	else if	(neues_Kapitel == 2)
	{
		// ------ Bild einblenden ------
		IntroduceChapter (KapWechsel_2,"Die Foki","chapter2.tga","chapter_01.wav", 6000);

		Kapitel02_Inventar	= HeroInventarWert();
		Kapitel02_Gold		= Npc_HasItems(hero, ItMi_Gold);
		Kapitel02_Erfahrung	= hero.exp;
		Kapitel02_Level		= hero.level;
		Kapitel02_Zeit		= TimeCounter_Real;
	}
	
	//***************************************************************************
	//	KAPITEL 3
	//***************************************************************************
	else if (neues_Kapitel == 3)
	{	
		// ------ Bild einblenden ------
		IntroduceChapter (KapWechsel_3,"Xeres","chapter3.tga","chapter_01.wav", 6000);

		Kapitel03_Inventar	= HeroInventarWert();
		Kapitel03_Gold		= Npc_HasItems(hero, ItMi_Gold);
		Kapitel03_Erfahrung	= hero.exp;
		Kapitel03_Level		= hero.level;
		Kapitel03_Zeit		= TimeCounter_Real;
	}
	
	//***************************************************************************
	//	KAPITEL 4
	//***************************************************************************
	else if (neues_Kapitel == 4)
	{
		// ------ Bild einblenden ------
		IntroduceChapter (KapWechsel_4,"Die Macht der 3 Götter","chapter4.tga","chapter_01.wav", 6000);

		Kapitel04_Inventar	= HeroInventarWert();
		Kapitel04_Gold		= Npc_HasItems(hero, ItMi_Gold);
		Kapitel04_Erfahrung	= hero.exp;
		Kapitel04_Level		= hero.level;
		Kapitel04_Zeit		= TimeCounter_Real;
	}
	
	//***************************************************************************
	//	KAPITEL 5
	//***************************************************************************
	else if (neues_Kapitel == 5)
	{		
		// ------ Bild einblenden ------
		IntroduceChapter (KapWechsel_5,"Uriziel","chapter5.tga","chapter_01.wav", 6000);

		Kapitel05_Inventar	= HeroInventarWert();
		Kapitel05_Gold		= Npc_HasItems(hero, ItMi_Gold);
		Kapitel05_Erfahrung	= hero.exp;
		Kapitel05_Level		= hero.level;
		Kapitel05_Zeit		= TimeCounter_Real;
	}
	
	//***************************************************************************
	//	KAPITEL 6
	//***************************************************************************
	else if (neues_Kapitel == 6)
	{
		// ------ Bild einblenden ------
		IntroduceChapter (KapWechsel_6,"???","chapter6.tga","chapter_01.wav", 6000);

		Kapitel06_Inventar	= HeroInventarWert();
		Kapitel06_Gold		= Npc_HasItems(hero, ItMi_Gold);
		Kapitel06_Erfahrung	= hero.exp;
		Kapitel06_Level		= hero.level;
		Kapitel06_Zeit		= TimeCounter_Real;
	};
	
	//***************************************************************************
	//	SONSTIGE
	//***************************************************************************
 
 	B_CheckLog ();
};
