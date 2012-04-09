// *********************
// Standard	Voice Module
// *********************

CLASS C_SVM
{
	// ------ B_Say_GuildGreetings ------
	var string MILGreetings;				//Miliz grüßt Miliz oer Paladin
	var string PALGreetings;				//Paladin grüßt Paladin oder Magier
	var string BELGreetings;				//Belianer grüßt Belianer
	var string AdanosGreetings;				//Adanos grüßt Adanos
	var string Weather;						//So ein Mistwetter!
	
	// ------ B_Say_AttackReason ------
	var string IGetYouStill;				//Upset-NSC sieht Spieler währned seiner Angry-Time wieder. Greift mit altem AttackReason an.
	var string DieEnemy;					//Feind wird angegriffen
	var string DieMonster;					//gefährliches Monster wird angegriffen
	var string Addon_DieMonster;
	var string Addon_DieMonster2;
	var string DirtyThief;					//Dieb wird angegriffen
	var string HandsOff;					//SC fummelt an Objekt rum
	var string SheepKiller;					//Mensch greift Schaf an
	var string SheepKillerMonster;			//Monster greift Schaf an
	var string YouMurderer;					//Mensch hat Menschen umgebracht (kein Feind)
	var string DieStupidBeast;				//Torwachen schlagen ungefähliches Monster tot, das versucht durchs Tor zu gehen	
	var string YouDareHitMe;				//SC hat NSC geschlagen
	var	string YouAskedForIt;				//SC hat trotz Aufforderung seine Waffe NICHT weggesteckt
	var string ThenIBeatYouOutOfHere;		//SC hat trotz Aufforderung Raum NICHT verlassen 
	var string WhatDidYouDoInThere;			//Wache sieht SC aus einem verbotenen Raum rauskommen und greift an
	var string WillYouStopFighting;			//Wache beendet Kampf, greift Täter an
	
	// ------ B_Say_AttackEND ------
	var string KillEnemy;					//Finishing-Move
	var string EnemyKilled;					//NSC hat Feind getötet
	var string MonsterKilled;				//NSC hat gefährliches Monster getötet
	var string Addon_MonsterKilled;			
	var string Addon_MonsterKilled2;	
	var string ThiefDown;					//NSC hat Item-Dieb niedergeschlagen
	var string RumfummlerDown;				//NSC hat verbotenes-MOBSI-Benutzer niedergeschlagen
	var string SheepAttackerDown;			//NSC hat human SheepAttacker oder SheepKiller umgehauen
	var string KillMurderer;				//Mörder finishen
	var string StupidBeastKilled;			//GateGuards töten neutrales Monster, das vorbeikam
	var string NeverHitMeAgain;				//NSC hat jemand niedergeschlagen, der ihn angegriffen hat
	var string YouBetterShouldHaveListened;	//NSC hat jemed niedergeschlagen, der die Waffe nicht weggesteckt hat
	var string GetUpAndBeGone;				//NSC hat einen Eindringling im Portalraum niedergeschlagen
	var string NeverEnterRoomAgain;			//NSC hat Spieler, der aus verbotenem Portalraum kam niedergeschlagen
	var string ThereIsNoFightingHere;		//Wache hat Täter einer Schlägerei (derjenige, der angefangen hat) niedergeschlagen

	var string Berzerk;

	// ------ C_WantToFlee ------ 
	var string RunAway;						//Scheiße! Nichts wie weg!		

	// ------ C_WantToCallGuardsForFight ------
	var	string Alarm;						//Wache ruft Wache
	var string Guards;						//Harter Bursche ruft Wache
	var string Help;						//Bürger ruft Hilfe
		
	// ------ B_AssessMurder ------
	var string GoodMonsterKill;				//Monster getötet - NSC findet das toll
	var string GoodKill;					//Mensch getötet - NSC findet das toll (war sein Feind)
	
	// ------ B_AssessTalk ------
	var string NOTNOW;						//wenn RefuseTalk Counter aktiv
	
	// ------ ZS_Attack ------
	var string RunCoward;					//Gegner flieht
	
	// ------ ZS_ClearRoom ------
	var string GetOutOfHere;				//Spieler in verbotenem Raum. Harter Bursche: Raus hier!
	var string WhyAreYouInHere;				//Spieler in verbotenem Raum. Weicher Bursche: Was willst du hier?
	var string YesGoOutOfHere;				//Spieler verläßt verboten Raum artig wieder

	// ------ ZS_ObservePlayer ------
	var string WhatsThisSupposedToBe;		//NSC sieht Spieler schleichen
	var	string YouDisturbedMySlumber;		//NSC wurde von SC durch QuietSound geweckt

	// ------ ZS_RansackBody ------
	var string ITookYourGold;			 
	var string ShitNoGold;				
	var string ITakeYourWeapon;	

	// ------ ZS_ReactToDamage ------
	VAR	string WhatAreYouDoing;				//NSC wird von einem FRIENDLY-SC/NSC geschlagen
	
	// ------ ZS_ReactToWeapon ------
	var string LookingForTroubleAgain;		//SC hat Kampf verloren "Willst du nochmal was aufs Maul?"
	var string StopMagic;					
	var string ISaidStopMagic;				
	var string WeaponDown;	
	var string ISaidWeaponDown;
	VAR	string WiseMove;					//Spieler hat Waffe/Spruch weggesteckt
	
	// ------ ZS_Unconscious ------
	var string NextTimeYoureInForIt;		//Harter Bursche steht auf, nachdem er niedergeschlagen wurde (murmelt zu sich selbst)
	var string OhMyHead;					//Weicher Bursche steht auf, nachdem er niedergeschlagen wurde (murmelt zu sich selbst)
	
	// ------ ZS_WatchFight ------
	var	string TheresAFight;				//NSC entdeckt einen Kampf, und findet das toll
	var string OhMyGodItsAFight;			//NSC entdeckt einen Kampf, und findet das bestützend (Bürger)
	var string GoodVictory;					//Dem Sieger zujubeln
	var string NotBad;						//'Nicht schlecht...' - Kampfende - Freund wurde von Nicht-Freund besiegt
	var string OhMyGodHesDown;				//Bestürzung über brutales Niederschlagen
	var string CheerFriend01;				//Freund landet	einen Treffer. 'Immer in die Fresse!'
	var string CheerFriend02;
	var string CheerFriend03;
	var string Ooh01;						//Freund kriegt	aufs Maul. 'Mist - das tat weh.'
	var string Ooh02;
	var string Ooh03;
	
	// ------ ZS_MagicSleep ------
	var string WhatWasThat;     			//Wenn NSC aus Magic Sleep erwacht
	
	// ------ TA_Sleep ------
	var string GetOutOfMyBed;				//Raus aus meinem Bett!
	var string Awake;						//NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, räkeln)
	
	// ------ B_Say_ToughGuyNews ------
	var string TOUGHGUY_ATTACKLOST;			//Spieler hat einen ToughGuy angegriffen und gewonnen
	var string TOUGHGUY_ATTACKWON;			//Spieler hat einen ToughGuy angegriffen und ist besiegt worden
	var string TOUGHGUY_PLAYERATTACK;		//Spieler hat einen ToughGuy angegriffen und den Kampf abgebrochen	
	
	// ------ GOLD ------
	var string GOLD_1000;					//1000 Goldstücke.
	var string GOLD_950;					//950 Goldstücke.
	var string GOLD_900;					//900 Goldstücke.
	var string GOLD_850;					//850 Goldstücke.
	var string GOLD_800;					//800 Goldstücke.
	var string GOLD_750;					//750 Goldstücke.
	var string GOLD_700;					//700 Goldstücke.
	var string GOLD_650;					//650 Goldstücke.
	var string GOLD_600;					//600 GOldstücke.
	var string GOLD_550;					//550 Goldstücke.
	var string GOLD_500;					//500 Goldstücke.
	var string GOLD_450;					//450 Goldstücke.
	var string GOLD_400;					//400 Goldstücke.
	var string GOLD_350;					//350 Goldstücke.
	var string GOLD_300;					//300 Goldstücke.
	var string GOLD_250;					//250 Goldstücke.
	var string GOLD_200;					//200 Goldstücke.
	var string GOLD_150;					//150 Goldstücke.
	var string GOLD_100;					//100 Goldstücke.
	var string GOLD_90;						//90 Goldstücke.
	var string GOLD_80;						//80 Goldstücke.
	var string GOLD_70;						//70 Goldstücke.
	var string GOLD_60;						//60 Goldstücke.
	var string GOLD_50;						//50 Goldstücke.
	var string GOLD_40;						//40 Goldstücke.
	var string GOLD_30;						//30 Goldstücke.
	var string GOLD_20;						//20 Goldstücke.
	var string GOLD_10;						//10 Goldstücke.
	
	// ------ B_Say_Smalltalk (TA_Smalltalk) ------
	VAR	string Smalltalk01;				// ...wenn Du meinst...
	VAR	string Smalltalk02;				// ...kann schon sein...
	VAR	string Smalltalk03;				// ...war nicht besonders schlau....
	VAR	string Smalltalk04;				// ...ich halt mich da lieber raus...
	VAR	string Smalltalk05;				// ...das ist wirklich nicht mein Problem...
	VAR	string Smalltalk06;				// ...war doch klar, daß das Ärger gibt...
	VAR	string Smalltalk07;				// ...aber behalt's für Dich, muß nicht gleich jeder wissen...
	VAR	string Smalltalk08;				// ...das passiert mir nicht nochmal...
	VAR	string Smalltalk09;				// ...an der Gechichte muß wohl doch was dran sein...
	VAR	string Smalltalk10;				// ...man muß eben aufpassen was man rumerzählt...
	VAR	string Smalltalk11;				// ...solange ich damit nichts zu tun habe...
	VAR	string Smalltalk12;				// ...man darf auch nicht alles glauben, was man hört...
	VAR	string Smalltalk13;				// ...in seiner Haut will ich trotzdem nicht stecken...
	VAR	string Smalltalk14;				// ...immer wieder die selbe Leier...
	VAR	string Smalltalk15;				// ...manche lernen eben garnichts dazu...
	VAR	string Smalltalk16;				// ...früher wäre das ganz anders gelaufen...
	VAR	string Smalltalk17;				// ...gequatscht wird viel...
	VAR	string Smalltalk18;				// ...ich hör nicht mehr auf das Gefasel...
	VAR	string Smalltalk19;				// ...verlaß Dich auf jemanden und Du bist verlassen, das ist eben so...
	VAR	string Smalltalk20;				// ...ich glaube kaum, daß sich daran was ändern wird...
	VAR	string Smalltalk21;				// ...wahrscheinlich hast Du recht...
	VAR	string Smalltalk22;				// ...erstmal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird...
	VAR	string Smalltalk23;				// ...ich dachte, das wäre schon lange geklärt, aber das ist wohl nicht so...
	VAR	string Smalltalk24;				// ...laß uns lieber über was anderes reden...
	//Tough Guy (SLD/MIL/DJG)
	VAR	string Smalltalk25;				// ...der war doch sturzbetrunken...							
	VAR	string Smalltalk26;				// ...mit mir kann man sowas nicht machen...			
	VAR	string Smalltalk27;				// ...alle sind gerannt wie die Hasen, ich war ganz allein...
	//ProInnos (NOV/KDF/PAL)
	VAR	string Smalltalk28;				// ...so steht es in den heiligen Schriften...							
	VAR	string Smalltalk29;				// ...ich handle stets in Innos Namen...			
	VAR	string Smalltalk30;				// ...niemand darf gegen die göttliche Ordnung verstoßen...

	// Khorata

	VAR	string SmalltalkKhorataAnnaQuest01;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataAnnaQuest02;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataAnnaQuest03;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataAnnaQuest04;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataAnnaQuest05;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataAnnaQuest06;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataDichter01;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataDichter02;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataDichter03;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataDichter04;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataDichter05;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataEndres01;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataEndres02;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataEndres03;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataEndres04;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataEndres05;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataEndres06;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataEndres07;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataFrauenkleider01;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataFrauenkleider02;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorataFrauenkleider03;		// ...niemand darf gegen die göttliche Ordnung verstoßen...

	VAR	string SmalltalkKhorataUnruhen01;
	VAR	string SmalltalkKhorataUnruhen02;
	VAR	string SmalltalkKhorataUnruhen03;
	VAR	string SmalltalkKhorataUnruhen04;
	VAR	string SmalltalkKhorataUnruhen05;
	VAR	string SmalltalkKhorataUnruhen06;
	VAR	string SmalltalkKhorataUnruhen07;
	VAR	string SmalltalkKhorataUnruhen08;
	VAR	string SmalltalkKhorataUnruhen09;
	VAR	string SmalltalkKhorataUnruhen10;
	VAR	string SmalltalkKhorataUnruhen11;

	VAR	string SmalltalkKhorataUnruhenTheodorus01;
	VAR	string SmalltalkKhorataUnruhenTheodorus02;
	VAR	string SmalltalkKhorataUnruhenTheodorus03;
	VAR	string SmalltalkKhorataUnruhenTheodorus04;

	VAR	string SmalltalkKhorataUnruhenWendel01;
	VAR	string SmalltalkKhorataUnruhenWendel02;
	VAR	string SmalltalkKhorataUnruhenWendel03;
	VAR	string SmalltalkKhorataUnruhenWendel04;

	VAR	string SmalltalkKhorataUnruhenLukas01;
	VAR	string SmalltalkKhorataUnruhenLukas02;
	VAR	string SmalltalkKhorataUnruhenLukas03;
	VAR	string SmalltalkKhorataUnruhenLukas04;

	VAR	string SmalltalkKhorataDiebeGrusel01;
	VAR	string SmalltalkKhorataDiebeGrusel02;
	VAR	string SmalltalkKhorataDiebeGrusel03;
	VAR	string SmalltalkKhorataDiebeGrusel04;
	VAR	string SmalltalkKhorataDiebeGrusel05;
	VAR	string SmalltalkKhorataDiebeGrusel06;

	VAR	string SmalltalkKhorataDiebeBib01;
	VAR	string SmalltalkKhorataDiebeBib02;
	VAR	string SmalltalkKhorataDiebeBib03;
	VAR	string SmalltalkKhorataDiebeBib04;
	VAR	string SmalltalkKhorataDiebeBib05;
	VAR	string SmalltalkKhorataDiebeBib06;
	VAR	string SmalltalkKhorataDiebeBib07;
	VAR	string SmalltalkKhorataDiebeBib08;

	VAR	string SmalltalkKhorataNormal01;
	VAR	string SmalltalkKhorataNormal02;
	VAR	string SmalltalkKhorataNormal03;
	VAR	string SmalltalkKhorataNormal04;
	VAR	string SmalltalkKhorataNormal05;
	VAR	string SmalltalkKhorataNormal06;

	// Khorinis

	VAR	string SmalltalkRangar01;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkRangar02;		// ...niemand darf gegen die göttliche Ordnung verstoßen...

	VAR	string SmalltalkMatteo01;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkMatteo02;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkMatteo03;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkMatteo04;		// ...niemand darf gegen die göttliche Ordnung verstoßen...

	VAR	string SmalltalkKhorinisMario01;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorinisMario02;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorinisMario03;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkKhorinisMario04;		// ...niemand darf gegen die göttliche Ordnung verstoßen...

	VAR	string SmalltalkFellan01;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkFellan02;		// ...niemand darf gegen die göttliche Ordnung verstoßen...

	VAR	string SmalltalkMikaPflanzen01;		// ...niemand darf gegen die göttliche Ordnung verstoßen...
	VAR	string SmalltalkMikaPflanzen02;		// ...niemand darf gegen die göttliche Ordnung verstoßen...

	// Dämonenritterfesuntg

	VAR STRING SmalltalkDMRBelagerungAbdi01;
	VAR STRING SmalltalkDMRBelagerungAbdi02;
		
	// ------ Lehrer-Kommentare ------
	var string NoLearnNoPoints			;	//NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string NoLearnOverPersonalMAX	;	//NSC-Lehrer verbietet Steigerung ÜBER sein persönliches Lehrer-Maximum
	var string NoLearnYoureBetter		;   //NSC-Lehrer - MAX ist schlechter als oder gleich wie Spieler
	var string YouLearnedSomething		;   //SC hat etwas gelernt

	// ------ B_AssignCityGuide ------
	var string UNTERSTADT		;
	var string OBERSTADT		;
	var string TEMPEL		;
	var string MARKT		;
	var string GALGEN		;
	var string KASERNE		;
	var string HAFEN	;
	// -------------------------------
	var string WHERETO		;
	// -------------------------------
	var string OBERSTADT_2_UNTERSTADT	;
	var string UNTERSTADT_2_OBERSTADT	;
	var string UNTERSTADT_2_TEMPEL		;
	var string UNTERSTADT_2_HAFEN		;
	var string TEMPEL_2_UNTERSTADT		;
	var string TEMPEL_2_MARKT			;
	var string TEMPEL_2_GALGEN			;
	var string MARKT_2_TEMPEL			;
	var string MARKT_2_KASERNE			;
	var string MARKT_2_GALGEN			;
	var string GALGEN_2_TEMPEL			;
	var string GALGEN_2_MARKT			;
	var string GALGEN_2_KASERNE			;
	var string KASERNE_2_MARKT			;
	var string KASERNE_2_GALGEN			;
	var string HAFEN_2_UNTERSTADT		;

	// ------ Kampf ------
	var	string Dead				;			// Tödlich verletzt
	VAR	string Aargh_1			;			// Treffer kassiert im Kampf	
	VAR	string Aargh_2			;			// Treffer kassiert im Kampf	
	VAR	string Aargh_3			;			// Treffer kassiert im Kampf	
	
	var string ADDON_WRONGARMOR;			//Sc hat unangemessene Rüstung an				//Default
	var string ADDON_WRONGARMOR_SLD;		//Beide SLD/DJG und falsche Rüstung
	var string ADDON_WRONGARMOR_MIL;		//Beide MIL/PAL	und falsche Rüstung
	var string ADDON_WRONGARMOR_KDF;		//Beide KDF und falsche Rüstung
	var string ADDON_NOARMOR_BDT;			//self ist BAndite und SC hat keine Rüstung an.
	
	var string ADDON_DIEBANDIT;				//Stirb du dreckiger Bandit
	var string ADDON_DIRTYPIRATE;			//Piratenpack
	// ------ SC SVMs ------
	var string SC_HeyTurnAround;			//SC: Hey du! (B_AssessTalk)
	var string SC_HeyTurnAround02;	
	var string SC_HeyTurnAround03;	
	var string SC_HeyTurnAround04;			
	var string SC_HeyWaitASecond;			//SC: Hey warte mal! (B_AssessTalk)
	var string DoesntWork;				
	var string PickBroke;				
	var string NeedKey;					
	var string NoMorePicks;	
	var string NoPickLockTalent;
	var string NoSweeping;
	
	var string PICKLOCKORKEYMISSING;	
	var string KEYMISSING;
	var string PICKLOCKMISSING;
	var string NEVEROPEN;
	var string MISSINGITEM;
	var string DONTKNOW;
	var string NOTHINGTOGET;
	var string NOTHINGTOGET02;
	var string NOTHINGTOGET03;
	var string HEALSHRINE;
	var string HEALLASTSHRINE;
	var string IRDORATHTHEREYOUARE;
	var string SCOPENSIRDORATHBOOK;
	var string SCOPENSLASTDOOR;

	//-------------Addon ----------------------
	
	var string TRADE_1;
	var string TRADE_2;
	var string TRADE_3;
	
	var string VERSTEHE;
	var string FOUNDTREASURE;
	var string CANTUNDERSTANDTHIS;
	var string CANTREADTHIS;
	var string STONEPLATE_1;
	var string STONEPLATE_2;
	var string STONEPLATE_3;
	
	var string COUGH;
	var string HUI;
	
	var string Addon_ThisLittleBastard;
	var string ADDON_OPENADANOSTEMPLE;
	
	//Story Banditenlager Dialoge
	var string	ATTENTAT_ADDON_DESCRIPTION;
	var string  ATTENTAT_ADDON_DESCRIPTION2;
	var string	ATTENTAT_ADDON_PRO;
	var string 	ATTENTAT_ADDON_CONTRA;
	
	var string 	MINE_ADDON_DESCRIPTION;
	var string 	ADDON_SUMMONANCIENTGHOST;
	var string 	ADDON_ANCIENTGHOST_NOTNEAR;
	
	var string 	ADDON_GOLD_DESCRIPTION; 

	// MOD

	var string WHOAREYOU;			//Wer bist du?
	var string MATTEOPAPER;			//Ich hab hier ein Flugblatt für dich.
	var string WANNAMARRY;			//Willst du mich heiraten?
	var string HAVEFREUDENSPENDER;		//Ich hab hier ein Fläschchen Freudenspender für dich.
	var string WHATSUP;			
	var string NO;				//Nein.
	var string HIERNIMM;			//Hier, nimm.
	var string HIER;			//Hier.
	var string ALTERWALDMANN01;
	var string ALTERWALDMANN02;
	var string ALTERWALDMANN03;
	var string ALTERWALDMANN04;
	var string ALTERWALDMANN05;
	var string IRDORATHGEHTLOS;
	var string IRDORATHGEHBACK;
	var string IRDORATHNOWAY;
	var string IRDORATHHEBEL;
	var string IRDORATHHEBELPROBLEM;
	var string WIESONICHT;			//Wieso nicht?
	var string WASMACHENWIRJETZT;		//Was machen wir jetzt?
	var string WASISTDENNHIERLOS;		//Was ist denn hier los?
	var string WASMEINSTDU;			//Was meinst du?
	var string WASISTDENN;			//Was ist denn?
	var string WASISTDAS;			//Was ist das?
	var string WASISTZUTUN;			//Was ist zu tun?
	var string WIESOLLICHVORGEHEN;		//Wie soll ich vorgehen?
	var string KANNSTDUMIRWASBEIBRINGEN;	//Kannst du mir was beibringen?
	var string WOFINDEICHIHN;		//Wo finde ich ihn?
	var string WASMACHSTDUHIER;		//Was machst du hier?


	// Drachen

	var string SMALLTALKDRAGON01;
	var string SMALLTALKDRAGON02;
	var string SMALLTALKDRAGON03;
	var string SMALLTALKDRAGON04;
	var string SMALLTALKDRAGON05;
	var string SMALLTALKDRAGON06;
	var string SMALLTALKDRAGON07;
	var string SMALLTALKDRAGON08;
	var string SMALLTALKDRAGON09;
	var string SMALLTALKDRAGON10;
	var string SMALLTALKDRAGON11;
	var string SMALLTALKDRAGON12;
	var string SMALLTALKDRAGON13;

	// Sätze der Minenarbeiter in Relendel

	var string RELMINE01;
	var string RELMINE02;
	var string RELMINE03;
	var string RELMINE04;
	var string RELMINE05;
	var string RELMINE06;
	var string RELMINE07;
	var string RELMINE08;
	var string RELMINE09;
	var string RELMINE10;
	var string RELMINE11;
	var string RELMINE12;

	// Kampf gegen Xeres => der ist immortal

	var string XERESISTIMMORTAL;

	// Hero hat Notiz gefunden => Hinweis, dass er die auch lesen sollte

	var string READZETTEL;			//Das sollte ich lieber mal lesen.


	// Kommentare zum Rübenziehen

	var string RUEBE01_01;
	var string RUEBE01_02;
	var string RUEBE01_03;
	var string RUEBE02;
	var string RUEBE03;
	var string RUEBE04_01;
	var string RUEBE04_02;
	var string RUEBE04_03;


	// Kommentar, wenn man sich lieber nochmal umsehen sollte (wenn man noch was suchen muss)

	var string LOOKFORSOMETHING;

	// Satz zum göttlichen Boten (Hund Adanos bzw. Baal Netbek)

	var string GODLYBOTE01;
	var string GODLYBOTE02;

	// Kommentar, wenn Alvars Kristall gefunden wird

	var string ALVARKRISTALL01;
	var string ALVARKRISTALL02;
	var string ALVARKRISTALL03;

	// Kommentar, wenn Buch über Eriskult gelesen

	var string ERISKULTBUCH01;

	// Kommentar zum Bücherregal

	var string BUECHERREGALFINDPAPER;
	var string BUECHERREGALNO;
	var string BUECHERREGALNOTHING;

	// Faule Äpfel unterschmuggeln

	var string PLACEAPFEL01;
	var string PLACEAPFEL02;
	var string PLACEAPFEL03;
	var string PLACEAPFEL04;
	var string PLACEAPFEL05;

	// Grüne Erzader hacken

	var string NOHACKE;
	var string HACKESCHLECHT;

	// Lernen auf Gold

	var string NOLEARNGOLD;

	// Wenn Fokus nicht eingesetzt werden kann

	var string FOKUSNICHTEINSETZEN;

	// Witze

	var string WITZ_01_01;
	var string WITZ_01_02;
	var string WITZ_01_03;
	var string WITZ_01_04;
	var string WITZ_01_05;
	var string WITZ_01_06;

	var string WITZ_02_01;

	var string WITZ_03_01;
	var string WITZ_03_02;

	var string WITZ_04_01;
	var string WITZ_04_02;
	var string WITZ_04_03;
	var string WITZ_04_04;
	var string WITZ_04_05;
	var string WITZ_04_06;
	var string WITZ_04_07;
	var string WITZ_04_08;
	var string WITZ_04_09;
	var string WITZ_04_10;

	var string WITZ_05_01;
	var string WITZ_05_02;
	var string WITZ_05_03;
	var string WITZ_05_04;

	var string WITZ_06_01;
	var string WITZ_06_02;

	var string WITZ_07_01;
	var string WITZ_07_02;

	var string WITZ_08_01;
	var string WITZ_08_02;

	var string WITZ_09_01;
	var string WITZ_09_02;

	var string WITZ_10_01;
	var string WITZ_10_02;
	var string WITZ_10_03;
	var string WITZ_10_04;
	var string WITZ_10_05;
	var string WITZ_10_06;
	var string WITZ_10_07;
	var string WITZ_10_08;
	var string WITZ_10_09;
	var string WITZ_10_10;

	// 3x gleicher Dialog bei Plagenquest

	var string PLAGENQUEST01;
	var string PLAGENQUEST02;
	var string PLAGENQUEST03;
	var string PLAGENQUEST04;
	var string PLAGENQUEST05;
	var string PLAGENQUEST06;
	var string PLAGENQUEST07;
	var string PLAGENQUEST08;
	var string PLAGENQUEST09;
	var string PLAGENQUEST10;
	var string PLAGENQUEST11;
	var string PLAGENQUEST12;
	var string PLAGENQUEST13;
	var string PLAGENQUEST14;
	var string PLAGENQUEST15;
	var string PLAGENQUEST16;
	var string PLAGENQUEST17;

	// 3x gleicher Dialog bei HeroBot-Kill

	var string HEROBOTQUEST01;
	var string HEROBOTQUEST02;

	// Schwarze Novizen

	var string AMBISNOV01;
	var string AMBISNOV02;
	var string AMBISNOV03;
	var string AMBISNOV04;
	var string AMBISNOV05;
	var string AMBISNOV06;
	var string AMBISNOV07;
	var string AMBISNOV08;

	// Gespräch mit Schürfern wegen "Ärger im Kessel"

	var string KESSELPROBLEM01;
	var string KESSELPROBLEM02;
	var string KESSELPROBLEM03;

	// Anschlagtafel-Gespräche

	var string ANSCHLAGTAFEL01;
	var string ANSCHLAGTAFEL02;

	// Held probiert Sachen für Bierhexen-Quest

	var string SCHMECKTNORMAL;
	var string SCHMECKTECKLIG;

	// Held sollte eingesammeltes Item benutzen

	var string SHOULDUSE;

	// Held kennt Chromanin-Rätsel aus Vorgänger

	var string KNOWSRIDDLER;
};     


// **********************************
// NSCs
// ----
// SVMs müssen immer "SVM_x" heissen, 
// wobei x die VoiceNummer ist.	
// **********************************

// ------ wird nur intern gebraucht! ------
instance SVM_0 (C_SVM)				
{

};

// *************
// 		Orks
// *************

INSTANCE SVM_18	(C_SVM)							
{

};

// ****************
// 	   Dementor
// ****************

INSTANCE SVM_19	(C_SVM)
{
	DieEnemy     	= "SVM_19_DieEnemy"     	;//(zischt) Da ist er!
	RunCoward    	= "SVM_19_RunCoward"    	;//(zischt) Wir werden dich kriegen!
	Dead      		= "SVM_19_Dead"      	;//Aaaaaargl!
	Aargh_1      	= "SVM_19_Aargh_1"     	;//Aargh
	Aargh_2      	= "SVM_19_Aargh_2"     	;//Aargh
	Aargh_3      	= "SVM_19_Aargh_3"     	;//Aargh
};

// Kobolde

INSTANCE SVM_20 (C_SVM)
{
	
};

// Drachen

INSTANCE SVM_21 (C_SVM)
{
	SmalltalkDragon01	= "SVM_21_SmalltalkDragon01"; //Jaja, sie sind gerannt, wie die Hasen.
	SmalltalkDragon02	= "SVM_21_SmalltalkDragon02"; //Die ganze Wolle schlägt mir aber ziemlich auf den Magen.
	SmalltalkDragon03	= "SVM_21_SmalltalkDragon03"; //Hoffentlich bekomme ich keine Verstopfung oder Sodbrennen.
	SmalltalkDragon04	= "SVM_21_SmalltalkDragon04"; //Etwas von der schlammigen Pfütze wird meiner Verdauung wieder auf die Sprünge helfen.
	SmalltalkDragon05	= "SVM_21_SmalltalkDragon05"; //Der Hund als Nachspeise war aber ziemlich zäh.
	SmalltalkDragon06	= "SVM_21_SmalltalkDragon06"; //Das Essen ist auch nicht mehr das, was es einmal war vor 5000 Jahren.
	SmalltalkDragon07	= "SVM_21_SmalltalkDragon07"; //Einer von den Wichten hat mir doch tatsächlich einen Pfeil in die Pfote geschossen.
	SmalltalkDragon08	= "SVM_21_SmalltalkDragon08"; //Den habe ich erst mal geröstet.
	SmalltalkDragon09	= "SVM_21_SmalltalkDragon09"; //Die anderen sind aber ganz schnell abgehauen.
	SmalltalkDragon10	= "SVM_21_SmalltalkDragon10"; //Jaja, nach 5000 Jahren endlich Ruhe.
	SmalltalkDragon11	= "SVM_21_SmalltalkDragon11"; //Immer musste er im Schlaf reden.
	SmalltalkDragon12	= "SVM_21_SmalltalkDragon12"; //Und das Giftvieh, das seine Eier bewacht hat, sind wir auch endlich los.
	SmalltalkDragon13	= "SVM_21_SmalltalkDragon13"; //Ja, und der Magie dieses Untoten sei Dank.
	
};

INSTANCE SVM_22 (C_SVM)
{
	SmalltalkDragon01	= "SVM_22_SmalltalkDragon01"; //Jaja, sie sind gerannt, wie die Hasen.
	SmalltalkDragon02	= "SVM_22_SmalltalkDragon02"; //Die ganze Wolle schlägt mir aber ziemlich auf den Magen.
	SmalltalkDragon03	= "SVM_22_SmalltalkDragon03"; //Hoffentlich bekomme ich keine Verstopfung oder Sodbrennen.
	SmalltalkDragon04	= "SVM_22_SmalltalkDragon04"; //Etwas von der schlammigen Pfütze wird meiner Verdauung wieder auf die Sprünge helfen.
	SmalltalkDragon05	= "SVM_22_SmalltalkDragon05"; //Der Hund als Nachspeise war aber ziemlich zäh.
	SmalltalkDragon06	= "SVM_22_SmalltalkDragon06"; //Das Essen ist auch nicht mehr das, was es einmal war vor 5000 Jahren.
	SmalltalkDragon07	= "SVM_22_SmalltalkDragon07"; //Einer von den Wichten hat mir doch tatsächlich einen Pfeil in die Pfote geschossen.
	SmalltalkDragon08	= "SVM_22_SmalltalkDragon08"; //Den habe ich erst mal geröstet.
	SmalltalkDragon09	= "SVM_22_SmalltalkDragon09"; //Die anderen sind aber ganz schnell abgehauen.
	SmalltalkDragon10	= "SVM_22_SmalltalkDragon10"; //Jaja, nach 5000 Jahren endlich Ruhe.
	SmalltalkDragon11	= "SVM_22_SmalltalkDragon11"; //Immer musste er im Schlaf reden.
	SmalltalkDragon12	= "SVM_22_SmalltalkDragon12"; //Und das Giftvieh, das seine Eier bewacht hat, sind wir auch endlich los.
	SmalltalkDragon13	= "SVM_22_SmalltalkDragon13"; //Ja, und der Magie dieses Untoten sei Dank.
	
};

INSTANCE SVM_23 (C_SVM)
{
	SmalltalkDragon01	= "SVM_23_SmalltalkDragon01"; //Jaja, sie sind gerannt, wie die Hasen.
	SmalltalkDragon02	= "SVM_23_SmalltalkDragon02"; //Die ganze Wolle schlägt mir aber ziemlich auf den Magen.
	SmalltalkDragon03	= "SVM_23_SmalltalkDragon03"; //Hoffentlich bekomme ich keine Verstopfung oder Sodbrennen.
	SmalltalkDragon04	= "SVM_23_SmalltalkDragon04"; //Etwas von der schlammigen Pfütze wird meiner Verdauung wieder auf die Sprünge helfen.
	SmalltalkDragon05	= "SVM_23_SmalltalkDragon05"; //Der Hund als Nachspeise war aber ziemlich zäh.
	SmalltalkDragon06	= "SVM_23_SmalltalkDragon06"; //Das Essen ist auch nicht mehr das, was es einmal war vor 5000 Jahren.
	SmalltalkDragon07	= "SVM_23_SmalltalkDragon07"; //Einer von den Wichten hat mir doch tatsächlich einen Pfeil in die Pfote geschossen.
	SmalltalkDragon08	= "SVM_23_SmalltalkDragon08"; //Den habe ich erst mal geröstet.
	SmalltalkDragon09	= "SVM_23_SmalltalkDragon09"; //Die anderen sind aber ganz schnell abgehauen.
	SmalltalkDragon10	= "SVM_23_SmalltalkDragon10"; //Jaja, nach 5000 Jahren endlich Ruhe.
	SmalltalkDragon11	= "SVM_23_SmalltalkDragon11"; //Immer musste er im Schlaf reden.
	SmalltalkDragon12	= "SVM_23_SmalltalkDragon12"; //Und das Giftvieh, das seine Eier bewacht hat, sind wir auch endlich los.
	SmalltalkDragon13	= "SVM_23_SmalltalkDragon13"; //Ja, und der Magie dieses Untoten sei Dank.
	
};
 

// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	26;