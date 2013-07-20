INSTANCE Info_Mod_Nefarius_AW_Fokussuche (C_INFO)
{
	npc		= Mod_9002_KDW_Nefarius_AW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_AW_Fokussuche_Condition;
	information	= Info_Mod_Nefarius_AW_Fokussuche_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll mich wegen der Fokussuche bei dir melden.";
};

FUNC INT Info_Mod_Nefarius_AW_Fokussuche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Fokusplatz))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Fokussuche_Info()
{
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_Fokussuche_15_00"); //Ich soll mich wegen der Fokussuche bei dir melden.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_01"); //Ach ja, genau.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_02"); //Saturas hat überall herumgefragt, ob es nicht eine Möglichkeit gibt, dass er nicht zwei von uns mit dir ins Minental schicken muss.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_03"); //Und gerade kurz zuvor hatte ich etwas Spektakuläres in den Inschriften hier entdeckt.
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_Fokussuche_15_04"); //Wenn's mir hilft, immer raus damit.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_05"); //Das alte Volk konnte eine schwarze Perle so schleifen, dass sie als Prisma funktionierte.
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_Fokussuche_15_06"); //Aber eine schwarze Perle ist doch nicht durchsichtig!
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_07"); //Das Prisma galt auch nicht dem Licht, sondern der Magie.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_08"); //Der Zaubernde wirkte einen Spruch auf das Prisma, und bildlich gesehen wurde er in der Perle gebrochen und trat gestreut aus ihr aus.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_09"); //Diese Prismen konnten in vielen Disziplinen hilfreich sein, in der Schlacht ebenso wie beim Blumengießen.
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_Fokussuche_15_10"); //Aha ... Das soll bedeuten, mit einem richtig geschliffenen Prisma könnte ich einen Zauber in drei Teile brechen und somit die drei benötigten Magier simulieren?
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_11"); //Prinzipiell schon. Gegen den Schutzzauber allein würde das aber nicht helfen, da ja auch die Kraft des Zaubers gestreut wird.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_12"); //Aber die schwarze Perle hat viele mächtige, teils dunkle Eigenschaften.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_13"); //Und so gelang es dem alten Volk, das Prisma so herzustellen, dass es Magie aufnehmen konnte, ohne sie gleich wieder abzugeben.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_14"); //Das Verfahren muss Ähnlichkeiten haben zu dem, mit dem aus der schwarzen Perle Runen geschaffen werden.
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_Fokussuche_15_15"); //Gut, dann fasse ich das mal zusammen.
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_Fokussuche_15_16"); //Ich brauche eine schwarze Perle, die nicht nur zu einem Magieprisma geschliffen ist, sondern zusätzlich mit Zaubern aufgeladen werden kann.
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_Fokussuche_15_17"); //Es ist nur fraglich, ob überhaupt irgendwo steht, wie so etwas herzustellen ist.
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_Fokussuche_15_18"); //Richtig?
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_19"); //Mehr konnte ich bisher nicht herausfinden, aber ich bin mir sicher, es ist nur eine Frage der Zeit, bis ich auf die richtigen Inschriften stoße.
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_Fokussuche_15_20"); //Dann kann ich mir hier also so lange die Zeit vertreiben?
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_21"); //Meinetwegen.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_22"); //Ach, noch was. Die Inschriften waren bebildert.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_23"); //Der Magier, der die schwarze Perle mit Magie fütterte, wurde von Bild zu Bild kleiner.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche_05_24"); //Aber das ist wahrscheinlich nur eine Ungenauigkeit, die im Zuge des Meißelns entstanden ist.
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_Fokussuche_15_25"); //(murmelt) Na klasse ...

	Log_CreateTopic	(TOPIC_MOD_MAGIEPRISMA, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MAGIEPRISMA, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MAGIEPRISMA, "Laut dem alten Volk gibt es eine Möglichkeit, wie ich mehrere Magier vortäuschen kann. Ich brauche dafür eine schwarze Perle, die zu einem Prisma geschliffen ist. Nefarius ist auf der Suche nach einer Methode, wie dies zu bewerkstelligen ist. Ich kann mich so lange in den Ruinen umschauen.");

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Nefarius_AW_Fokussuche2 (C_INFO)
{
	npc		= Mod_9002_KDW_Nefarius_AW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_AW_Fokussuche2_Condition;
	information	= Info_Mod_Nefarius_AW_Fokussuche2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Prisma.";
};

FUNC INT Info_Mod_Nefarius_AW_Fokussuche2_Condition()
{
	if (Npc_HasItems(hero, ItMi_Magieprisma) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Fokussuche2_Info()
{
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_Fokussuche2_15_00"); //Ich habe das Prisma.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche2_05_01"); //Phänomenal! (eifrig) Darf ... darf ich es mal sehen?

	Info_ClearChoices	(Info_Mod_Nefarius_AW_Fokussuche2);

	Info_AddChoice	(Info_Mod_Nefarius_AW_Fokussuche2, "Nein.", Info_Mod_Nefarius_AW_Fokussuche2_B);
	Info_AddChoice	(Info_Mod_Nefarius_AW_Fokussuche2, "Klar doch.", Info_Mod_Nefarius_AW_Fokussuche2_A);
};

FUNC VOID Info_Mod_Nefarius_AW_Fokussuche2_C()
{
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche2_C_05_00"); //Mit dem Prisma sollte es nun möglich sein, den Schutzzauber der Fokussteine zu brechen.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche2_C_05_01"); //Du musst lediglich das Prisma aufladen und dann auf den Fokusstein entleeren.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche2_C_05_02"); //Du machst das schon!

	Info_ClearChoices	(Info_Mod_Nefarius_AW_Fokussuche2);

	B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Ich habe mein Prisma und kann damit den Schutzzauber brechen. Ich muss das Prisma nur mit Zaubersprüchen aufladen und dann auf die Foki entleeren. Klasse, dann kann es ja endlich losgehen.");
};

FUNC VOID Info_Mod_Nefarius_AW_Fokussuche2_B()
{
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_Fokussuche2_B_15_00"); //Nein.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche2_B_05_01"); //Oh, schade. Aber wie du meinst.

	Info_Mod_Nefarius_AW_Fokussuche2_C();
};

FUNC VOID Info_Mod_Nefarius_AW_Fokussuche2_A()
{
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_Fokussuche2_A_15_00"); //Klar doch.

	B_GiveInvItems	(hero, self, ItMi_Magieprisma, 1);

	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche2_A_05_01"); //(begutachtend) Aha ... So, so ... Das ist ja interessant ...
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche2_A_05_02"); //Darf ich fragen, wie du daran gelangt bist?
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_Fokussuche2_A_15_03"); //Das willst du gar nicht wissen. Es war jede Menge Beliarmagie notwendig.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_Fokussuche2_A_05_04"); //(überrascht) Oh! Äh, nimm es doch mal besser zurück.

	B_GiveInvItems	(self, hero, ItMi_Magieprisma, 1);

	Info_Mod_Nefarius_AW_Fokussuche2_C();
};

INSTANCE Info_Mod_Nefarius_AW_PrismaGeladen (C_INFO)
{
	npc		= Mod_9002_KDW_Nefarius_AW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_AW_PrismaGeladen_Condition;
	information	= Info_Mod_Nefarius_AW_PrismaGeladen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Prisma mit einem Zauberspruch geladen.";
};

FUNC INT Info_Mod_Nefarius_AW_PrismaGeladen_Condition()
{
	if (Mod_Prisma_Start)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nefarius_AW_PrismaGeladen_Info()
{
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_PrismaGeladen_15_00"); //Ich habe das Prisma mit einem Zauberspruch geladen.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_PrismaGeladen_05_01"); //Es hat funktioniert! Bravo! (Pause) Das war noch nicht alles, was du sagen wolltest?
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_PrismaGeladen_15_02"); //Ich weiß jetzt, was die mysteriöse Zeichnung an der Wand darstellen sollte.
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_PrismaGeladen_15_03"); //Der Zauber, der im Prisma verschwand ... ich habe das Gefühl, er hat mir einen Teil meiner Lebenskraft geraubt.
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_PrismaGeladen_15_04"); //Seitdem fühle ich mich kränklich und schwach.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_PrismaGeladen_05_05"); //Das ist äußerst bedenklich, zumal du das Prisma noch mit weiteren Sprüchen laden musst, damit es seine volle Wirkung entfaltet.
	AI_Output(self, hero, "Info_Mod_Nefarius_AW_PrismaGeladen_05_06"); //Sei bloß vorsichtig damit! Wir können nur hoffen, dass die Energie, die dir geraubt wurde, zusammen mit den Zaubersprüchen wieder freigelassen wird.
	AI_Output(hero, self, "Info_Mod_Nefarius_AW_PrismaGeladen_15_07"); //Ansonsten bleibt auch nur noch meine fleischliche Hülle übrig...
};

INSTANCE Info_Mod_Nefarius_AW_Runen (C_INFO)
{
	npc		= Mod_9002_KDW_Nefarius_AW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_AW_Runen_Condition;
	information	= Info_Mod_Nefarius_AW_Runen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Unterweise mich (Runen erschaffen)";
};

FUNC INT Info_Mod_Nefarius_AW_Runen_Condition ()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_Hi))
	&& ((Mod_Gilde == 9)
	|| (Mod_Gilde == 10)
	|| (Mod_Gilde == 11)
	|| (Mod_Gilde == 17)
	|| (Mod_Gilde == 18))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_Info ()
{
	var INT abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "Info_Mod_Nefarius_AW_Runen_15_00"); //Unterweise mich.
	
	Info_ClearChoices 	(Info_Mod_Nefarius_AW_Runen);
	Info_AddChoice		(Info_Mod_Nefarius_AW_Runen, DIALOG_BACK, Info_Mod_Nefarius_AW_Runen_BACK);
	
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) >= 6)
	{
		if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,Info_Mod_Nefarius_AW_Runen_Shrink);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Icerain] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_Icerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icerain)) ,Info_Mod_Nefarius_AW_Runen_Icerain);
			abletolearn = (abletolearn +1);
		};	
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 5)
	{
		if (PLAYER_TALENT_RUNES [SPL_IceWave] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_IceWave, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_IceWave)), Info_Mod_Nefarius_AW_Runen_IceWave);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_FullHeal] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_FullHeal, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_FullHeal)), Info_Mod_Nefarius_AW_Runen_FullHeal);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 4)
	{
		if (PLAYER_TALENT_RUNES [SPL_LightningFlash] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_LightningFlash, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_LightningFlash)), Info_Mod_Nefarius_AW_Runen_LightningFlash);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Waterfist] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_Waterfist, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Waterfist)), Info_Mod_Nefarius_AW_Runen_Waterfist);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 3)
	{
		if (PLAYER_TALENT_RUNES [SPL_MediumHeal] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_MediumHeal, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_MediumHeal)), Info_Mod_Nefarius_AW_Runen_MediumHeal);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_IceCube] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_IceCube, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_IceCube)), Info_Mod_Nefarius_AW_Runen_IceCube);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_ChargeZap] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_ChargeZap, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_ChargeZap)), Info_Mod_Nefarius_AW_Runen_Thunderball);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Thunderstorm] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_Thunderstorm, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Thunderstorm)), Info_Mod_Nefarius_AW_Runen_Thunderstorm);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Geyser] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_Geyser, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Geyser)), Info_Mod_Nefarius_AW_Runen_Geyser);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 2)
	{
		if (PLAYER_TALENT_RUNES [SPL_Icelance] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_Icelance, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Icelance)), Info_Mod_Nefarius_AW_Runen_Icelance);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_InstantIceball] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_InstantIceball, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_InstantIceball)), Info_Mod_Nefarius_AW_Runen_InstantIceball);
			abletolearn = (abletolearn +1);
		};
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	{
		if (PLAYER_TALENT_RUNES [SPL_Light] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_Light, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Light)), Info_Mod_Nefarius_AW_Runen_Light);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_LightHeal] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_LightHeal, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_LightHeal)), Info_Mod_Nefarius_AW_Runen_LightHeal);
			abletolearn = (abletolearn +1);
		};
		if (PLAYER_TALENT_RUNES [SPL_Zap] == FALSE)
		{
			Info_AddChoice	(Info_Mod_Nefarius_AW_Runen, B_BuildLearnString (NAME_SPL_Zap, B_GetLearnCostTalent (hero, NPC_TALENT_RUNES, SPL_Zap)), Info_Mod_Nefarius_AW_Runen_Zap);
			abletolearn = (abletolearn +1);
		};
	};

	if (abletolearn < 1)
	{
		AI_Output (self, other, "Info_Mod_Nefarius_AW_Runen_14_01"); //Es gibt nichts mehr, das ich dir beibringen könnte.
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_BACK()
{
	Info_ClearChoices 	(Info_Mod_Nefarius_AW_Runen);
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_Light()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Light);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Light) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Light, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_SummonWolf()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonWolf);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_SumWolf) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_SumWolf, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_Icerain()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Icerain);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Icerain) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Icerain, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_LightHeal()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_LightHeal);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_LightHeal) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_LightHeal, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_SummonDragon()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonDragon);
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_SummonIceGolem()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonIceGolem);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_SumIceGol) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_SumIceGol, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_SummonEisgoblin()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_SummonEisgoblin);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_SumGobEis) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_SumGobEis, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_Icebolt()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Icebolt);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Icebolt) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Icebolt, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_Zap()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Zap);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Zap) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Zap, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_Icelance()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Icelance);
	
	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Icelance) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Icelance, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_InstantIceball()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_InstantIceball);
	
	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_InstantIceball) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_InstantIceball, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_Waterfist()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Waterfist);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Waterfist) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Waterfist, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_IceCube()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_IceCube);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_IceCube) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_IceCube, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_Thunderball()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_ChargeZap);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Thunderball) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Thunderball, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_Thunderstorm()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Thunderstorm);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Thunderstorm) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Thunderstorm, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_Geyser()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Geyser);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Geyser) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Geyser, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_MediumHeal()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_MediumHeal);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_MediumHeal) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_MediumHeal, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_LightningFlash()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_LightningFlash);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_LightningFlash) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_LightningFlash, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_IceWave()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_IceWave);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_IceWave) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_IceWave, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_Shrink()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_Shrink);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_Shrink) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_Shrink, 1);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Runen_FullHeal()
{
	B_TeachPlayerTalentRunes (self, hero, SPL_FullHeal);

	if (Npc_HasItems(Mod_9001_KDW_Cronos_AW, ItSc_FullHeal) == 0)
	{
		CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItSc_FullHeal, 1);
	};
};

INSTANCE Info_Mod_Nefarius_AW_Pickpocket (C_INFO)
{
	npc		= Mod_9002_KDW_Nefarius_AW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_AW_Pickpocket_Condition;
	information	= Info_Mod_Nefarius_AW_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Nefarius_AW_Pickpocket_Condition()
{
	C_Beklauen	(144, ItMi_Gold, 600);
};

FUNC VOID Info_Mod_Nefarius_AW_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Nefarius_AW_Pickpocket);

	Info_AddChoice	(Info_Mod_Nefarius_AW_Pickpocket, DIALOG_BACK, Info_Mod_Nefarius_AW_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Nefarius_AW_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Nefarius_AW_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Nefarius_AW_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Nefarius_AW_Pickpocket);
};

FUNC VOID Info_Mod_Nefarius_AW_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Nefarius_AW_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Nefarius_AW_Pickpocket);

		Info_AddChoice	(Info_Mod_Nefarius_AW_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Nefarius_AW_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Nefarius_AW_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Nefarius_AW_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Nefarius_AW_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Nefarius_AW_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Nefarius_AW_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Nefarius_AW_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Nefarius_AW_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Nefarius_AW_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Nefarius_AW_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Nefarius_AW_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Nefarius_AW_EXIT (C_INFO)
{
	npc		= Mod_9002_KDW_Nefarius_AW;
	nr		= 1;
	condition	= Info_Mod_Nefarius_AW_EXIT_Condition;
	information	= Info_Mod_Nefarius_AW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Nefarius_AW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nefarius_AW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};