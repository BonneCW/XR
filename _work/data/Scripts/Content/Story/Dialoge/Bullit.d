FUNC VOID B_Say_HeroBullit_Batschen ()
{
	AI_Output(hero, self, "Info_Mod_Bullit_Batschen_15_00"); //Du sagst mir jetzt, was du weißt, oder du bekommst ein paar aufs Maul.
	AI_Output(self, hero, "Info_Mod_Bullit_Batschen_06_01"); //Dann komm doch her!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

INSTANCE Info_Mod_Bullit_Dieb (C_INFO)
{
	npc		= Mod_1108_GRD_Bullit_MT;
	nr		= 1;
	condition	= Info_Mod_Bullit_Dieb_Condition;
	information	= Info_Mod_Bullit_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sachen aus dem Haus der Erzbarone sind verschwunden ...";
};

FUNC INT Info_Mod_Bullit_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Bullit_Infos == 0)
	&& (Mod_PDV_Fisk_Infos == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bullit_Dieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Bullit_Dieb_15_00"); //Sachen aus dem Haus der Erzbarone sind verschwunden und ich glaube, dass du was damit zu tun hast.
	AI_Output(self, hero, "Info_Mod_Bullit_Dieb_06_01"); //Du bist doch der Kerl, den ich damals in der Kolonie begrüßt habe. Und du willst mir jetzt einen Diebstahl anhängen?

	B_Say_HeroBullit_Batschen();
};

INSTANCE Info_Mod_Bullit_Frage (C_INFO)
{
	npc		= Mod_1108_GRD_Bullit_MT;
	nr		= 1;
	condition	= Info_Mod_Bullit_Frage_Condition;
	information	= Info_Mod_Bullit_Frage_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du schon gehört ...";
};

FUNC INT Info_Mod_Bullit_Frage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Bullit_Infos == 0)
	&& (Mod_PDV_Fisk_Infos == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bullit_Frage_Info()
{
	AI_Output(hero, self, "Info_Mod_Bullit_Frage_15_00"); //Hast du schon gehört, dass den Erzbaronen Sachen gestohlen werden?
	AI_Output(self, hero, "Info_Mod_Bullit_Frage_06_01"); //Du bist doch der Kerl, den ich damals in der Kolonie begrüßt habe. Warum soll ich dir etwas über den Diebstahl erzählen?

	B_Say_HeroBullit_Batschen();
};

INSTANCE Info_Mod_Bullit_Dealer (C_INFO)
{
	npc		= Mod_1108_GRD_Bullit_MT;
	nr		= 1;
	condition	= Info_Mod_Bullit_Dealer_Condition;
	information	= Info_Mod_Bullit_Dealer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mal angenommen ...";
};

FUNC INT Info_Mod_Bullit_Dealer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Bullit_Infos == 0)
	&& (Mod_PDV_Fisk_Infos == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bullit_Dealer_Info()
{
	AI_Output(hero, self, "Info_Mod_Bullit_Dealer_15_00"); //Mal angenommen, ich will "besondere" Waren kaufen: Wo müsste ich dann hingehen?
	AI_Output(self, hero, "Info_Mod_Bullit_Dealer_06_01"); //Du bist doch der Kerl, den ich damals in der Kolonie begrüßt habe. Du fragst mich nach heißer Ware?
	AI_Output(self, hero, "Info_Mod_Bullit_Dealer_06_02"); //Nun, ich würde es mal bei Fisk versuchen.
	AI_Output(hero, self, "Info_Mod_Bullit_Dealer_15_03"); //Gut, ich werde es versuchen.
	AI_Output(self, hero, "Info_Mod_Bullit_Dealer_06_04"); //Gut, mach das. Viel Spaß! (lacht)

	Mod_PDV_Bullit_Infos = 1;

	Mod_PDV_Genug_Infos += 1;

	B_LogEntry	(TOPIC_MOD_PDV, "Bullit meint, bei Fisk könnte ich Informationen bekommen.");
};

INSTANCE Info_Mod_Bullit_Umgehauen (C_INFO)
{
	npc		= Mod_1108_GRD_Bullit_MT;
	nr		= 1;
	condition	= Info_Mod_Bullit_Umgehauen_Condition;
	information	= Info_Mod_Bullit_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bullit_Umgehauen_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Bullit_Dieb))
	|| (Npc_KnowsInfo(hero, Info_Mod_Bullit_Frage)))
	&& (Mod_PDV_Bullit_Infos == 0)
	&& (Mod_PDV_Fisk_Infos == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bullit_Umgehauen_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Bullit_Umgehauen_06_00"); //Schon gut, schon gut. Ich kann dir nicht helfen, aber ich würde es mal bei Fisk versuchen.

			Mod_PDV_Bullit_Infos	=	1;

			Mod_PDV_Genug_Infos += 1;

			B_LogEntry	(TOPIC_MOD_PDV, "Bullit meint, bei Fisk könnte ich Informationen bekommen.");
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Bullit_Umgehauen_06_01"); //Und wieder hattest du keine Chance. Jetzt verzieh dich!
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};
};

INSTANCE Info_Mod_Bullit_Crime (C_INFO)
{
	npc		= Mod_1108_GRD_Bullit_MT;
	nr		= 1;
	condition	= Info_Mod_Bullit_Crime_Condition;
	information	= Info_Mod_Bullit_Crime_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum haben sie dich in die Kolonie geworfen?";
};

FUNC INT Info_Mod_Bullit_Crime_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bullit_Crime_Info()
{
	AI_Output(hero, self, "Info_Mod_Bullit_Crime_15_00"); //Warum haben sie dich in die Kolonie geworfen?
	AI_Output(self, hero, "Info_Mod_Bullit_Crime_06_01"); //Weil ich den armen Leuten in Myrtana immer bei ihrer Arbeit geholfen habe.
	AI_Output(hero, self, "Info_Mod_Bullit_Crime_15_02"); //Wirklich?
	AI_Output(self, hero, "Info_Mod_Bullit_Crime_06_03"); //Natürlich nicht, du Idiot! Ich war Bandit und wurde dann von Lee, dem jetztigen Anführer der Söldner, erwischt.
	AI_Output(self, hero, "Info_Mod_Bullit_Crime_06_04"); //Seitdem sitze ich hier fest. Und seit die Barriere weg ist, kann ich nicht mal mehr Neuankömmlinge taufen.
	AI_Output(hero, self, "Info_Mod_Bullit_Crime_15_05"); //Also stehst du mit Lee auf Kriegsfuß?
	AI_Output(self, hero, "Info_Mod_Bullit_Crime_06_06"); //Mit dem Schlappschwanz sowieso.
};

INSTANCE Info_Mod_Bullit_EXIT (C_INFO)
{
	npc		= Mod_1108_GRD_Bullit_MT;
	nr		= 1;
	condition	= Info_Mod_Bullit_EXIT_Condition;
	information	= Info_Mod_Bullit_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bullit_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bullit_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};