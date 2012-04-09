INSTANCE Info_Mod_Hexenqueen_Hi (C_INFO)
{
	npc		= Mod_1859_HEX_Hexenqueen_PAT;
	nr		= 1;
	condition	= Info_Mod_Hexenqueen_Hi_Condition;
	information	= Info_Mod_Hexenqueen_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hexenqueen_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aaron_Fake_DoorIn))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hexenqueen_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Hi_17_00"); //(lacht) Du lieferst mir meinen Gemahl doch tatsächlich noch frei Haus.
	AI_Output(hero, self, "Info_Mod_Hexenqueen_Hi_15_01"); //Ich liefere dir nur den Tod frei Haus!
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Hi_17_02"); //Schweig, du Narr! Glaubst du wirklich, du kannst dich zwischen mich und meine Mutter stellen?
	AI_Output(hero, self, "Info_Mod_Hexenqueen_Hi_15_03"); //Deine Mutter?
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Hi_17_04"); //(lacht) Oder sollte ich lieber UNSERE Mutter sagen?
	AI_Output(hero, self, "Info_Mod_Hexenqueen_Hi_15_05"); //Was? Wie meinst du das?
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Hi_17_06"); //Ganz einfach. Ich bin die Tochter von Ragon und Garan ist der Sohn der früheren Hexenkönigin.
	AI_Output(hero, self, "Info_Mod_Hexenqueen_Hi_15_07"); //Dann ist Garan ... dein Bruder?
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Hi_17_08"); //Du begreifst ja ganz schnell.
	AI_Output(hero, self, "Info_Mod_Hexenqueen_Hi_15_09"); //Und Tojan ist ... IGITT!
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Hi_17_10"); //(lacht) Ja. Der Sohn von Bruder und Schwester. In ihm vereinte sich das Blut wieder.
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Hi_17_11"); //Schade, dass sein Vater ihn getötet hat. Doch Mutter wird ihn dafür bestrafen.
	AI_Output(hero, self, "Info_Mod_Hexenqueen_Hi_15_12"); //Du meinst die vorherige Hexenkönigin?
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Hi_17_13"); //Ja. Ragon tötete sie, als sie in einem kurzen Moment der Unachtsamkeit ihren Zauber nicht eng genug um ihn gesponnen hatte und er ihre wahre Natur erkannte.
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Hi_17_14"); //Dafür bezahlte er aber auch mit seinem Leben.
	AI_Output(hero, self, "Info_Mod_Hexenqueen_Hi_15_15"); //Dann hast du also Garans Erinnerungen gelöscht und ihn sich selbst Überlassen.
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Hi_17_16"); //Ja, ich ließ ihn mit nichts weiter zurück als dem Namen Aaron. Ein Anagramm für den Namen meiner Mutter ... Orana!
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Hi_17_17"); //Doch das ist jetzt nich weiter wichtig! Ich werde meine Mutter zurück ins Leben holen! Und der kleine Garan wird mir dabei helfen.
	AI_Output(hero, self, "Info_Mod_Hexenqueen_Hi_15_18"); //Aber warum brauchst du dazu Garan?
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Hi_17_19"); //Es ist sein Blut, dass ich brauche! Mit ihm kann ich der Hexenkönigin wieder das Leben schenken!
	AI_Output(hero, self, "Info_Mod_Hexenqueen_Hi_15_20"); //Genug, jetzt wirst du sterben!

	AI_StopProcessInfos	(self);

	Mod_FM_AtHexe = 1;
};

INSTANCE Info_Mod_Hexenqueen_Blut (C_INFO)
{
	npc		= Mod_1859_HEX_Hexenqueen_PAT;
	nr		= 1;
	condition	= Info_Mod_Hexenqueen_Blut_Condition;
	information	= Info_Mod_Hexenqueen_Blut_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hexenqueen_Blut_Condition()
{
	if (Mod_FM_AtHexe == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hexenqueen_Blut_Info()
{
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Blut_17_00"); //(lacht) Ihr schwachen Sterblichen! Erschaudert vor der Macht meiner Mutter!
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Blut_17_01"); //Sie ist ... was ist das ... NEIN! Warum bist du nicht aus Fleisch und Blut?

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_1771_KDF_Aaron_PAT, "KILL");
	AI_Teleport	(Mod_1771_KDF_Aaron_PAT, "WP_PAT_TURM_17");
};

INSTANCE Info_Mod_Hexenqueen_Falsch (C_INFO)
{
	npc		= Mod_1859_HEX_Hexenqueen_PAT;
	nr		= 1;
	condition	= Info_Mod_Hexenqueen_Falsch_Condition;
	information	= Info_Mod_Hexenqueen_Falsch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hexenqueen_Falsch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aaron_Blut))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hexenqueen_Falsch_Info()
{
	AI_Output(self, hero, "Info_Mod_Hexenqueen_Falsch_17_00"); //AHHHH! ES WAR EIN DOPPELGÄNGER! ICH WERDE EUCH VERNICHTEN!

	AI_StopProcessInfos	(self);
};