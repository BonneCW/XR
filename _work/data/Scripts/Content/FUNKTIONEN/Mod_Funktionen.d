var int Mod_Goetterlevel_Adanos;
var int Mod_Goetterlevel_Innos;
var int Mod_Goetterlevel_Beliar;

var int Mod_ErsteGesinnung;

FUNC VOID B_Göttergefallen (var int GefallenArt, var int GefallenCounter)
{
	var string GefallenMeldung;

	GefallenMeldung = ConcatStrings("+", IntToString(GefallenCounter));
	GefallenMeldung = ConcatStrings(GefallenMeldung, " Gesinnung für ");

	if (GefallenArt == 1)
	{
		Innos_Gefallen += GefallenCounter;

		GefallenMeldung = ConcatStrings(GefallenMeldung, "Innos");
	}
	else if (GefallenArt == 2)
	{
		Adanos_Gefallen += GefallenCounter;

		GefallenMeldung = ConcatStrings(GefallenMeldung, "Adanos");
	}
	else if (GefallenArt == 3)
	{
		Beliar_Gefallen += GefallenCounter;

		GefallenMeldung = ConcatStrings(GefallenMeldung, "Beliar");
	};

	PrintScreen (Gefallenmeldung, -1, YPOS_LevelUp-25, FONT_ScreenSmall, 2);

	if (Mod_ErsteGesinnung == FALSE)
	{
		Mod_ErsteGesinnung = TRUE;

		Log_CreateTopic	(TOPIC_MOD_GESINNUNG, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_GESINNUNG, "Durch meine Taten scheint sich mein Ansehen bei den Göttern zu ändern. Jede der Hauptgilden gehört zu einer Gottheit, nur die Söldner scheinen da recht unanhängig zu sein. Die Nebengilden gehören zum Teil keinem Gott an. Aufträge für die Gilden, die einem Gott angehören, werde mich in dessen Ansehen steigern. Auch meine restlichen Taten wie Diebstähle werden in mein Ansehen einfließen.");
	};

	if (Innos_Gefallen > Beliar_Gefallen)
	&& (Innos_Gefallen > Adanos_Gefallen)
	{
		Mod_Goetterlevel_Beliar = Innos_Gefallen - Beliar_Gefallen;
		Mod_Goetterlevel_Adanos = Innos_Gefallen - Adanos_Gefallen;
		
		if (Mod_Goetterlevel_Beliar >= 100)
		&& (Mod_Goetterlevel_Adanos >= 100)
		{
			Mod_Gottstatus = 9;

			Npc_SetTalentSkill (hero, NPC_TALENT_GOTTSTATUS, 9);
		}
		else if (Mod_Goetterlevel_Beliar >= 50)
		&& (Mod_Goetterlevel_Adanos >= 50)
		{
			Mod_Gottstatus = 10;

			Npc_SetTalentSkill (hero, NPC_TALENT_GOTTSTATUS, 10);
		}
		else if (Mod_Goetterlevel_Beliar >= 20)
		&& (Mod_Goetterlevel_Adanos >= 20)
		{	
			Mod_Gottstatus = 11;

			Npc_SetTalentSkill (hero, NPC_TALENT_GOTTSTATUS, 11);
		}
		else
		{
			if (Mod_Gottstatus == 4)
			|| (Mod_Gottstatus == 8)
			{
				Mod_GottCooldown = 0;
			};

			Mod_Gottstatus = 12;

			Npc_SetTalentSkill (hero, NPC_TALENT_GOTTSTATUS, 12);
		};
	}
	else if (Beliar_Gefallen > Adanos_Gefallen)
	&& (Beliar_Gefallen > Innos_Gefallen)
	{
		Mod_Goetterlevel_Adanos = Beliar_Gefallen - Adanos_Gefallen;
		Mod_Goetterlevel_Innos = Beliar_Gefallen - Innos_Gefallen;
		
		if (Mod_Goetterlevel_Adanos >= 100)
		&& (Mod_Goetterlevel_Innos >= 100)
		{
			Mod_Gottstatus = 1;

			Npc_SetTalentSkill (hero, NPC_TALENT_GOTTSTATUS, 1);
		}
		else if (Mod_Goetterlevel_Innos >= 50)
		&& (Mod_Goetterlevel_Adanos >= 50)
		{
			Mod_Gottstatus = 2;

			Npc_SetTalentSkill (hero, NPC_TALENT_GOTTSTATUS, 2);
		}
		else if (Mod_Goetterlevel_Adanos >= 20)
		&& (Mod_Goetterlevel_Innos >= 20)
		{	
			Mod_Gottstatus = 3;

			Npc_SetTalentSkill (hero, NPC_TALENT_GOTTSTATUS, 3);
		}
		else
		{
			if (Mod_Gottstatus == 8)
			|| (Mod_Gottstatus == 12)
			{
				Mod_GottCooldown = 0;
			};

			Mod_Gottstatus = 4;

			Npc_SetTalentSkill (hero, NPC_TALENT_GOTTSTATUS, 4);
		};
	}
	else
	{
		Mod_Goetterlevel_Beliar = Adanos_Gefallen - Beliar_Gefallen;
		Mod_Goetterlevel_Innos = Adanos_Gefallen - Innos_Gefallen;
		
		if (Mod_Goetterlevel_Beliar >= 100)
		&& (Mod_Goetterlevel_Innos >= 100)
		{
			Mod_Gottstatus = 5;

			Npc_SetTalentSkill (hero, NPC_TALENT_GOTTSTATUS, 5);
		}
		else if (Mod_Goetterlevel_Beliar >= 50)
		&& (Mod_Goetterlevel_Adanos >= 50)
		{
			Mod_Gottstatus = 6;

			Npc_SetTalentSkill (hero, NPC_TALENT_GOTTSTATUS, 6);
		}
		else if (Mod_Goetterlevel_Beliar >= 20)
		&& (Mod_Goetterlevel_Innos >= 20)
		{	
			Mod_Gottstatus = 7;

			Npc_SetTalentSkill (hero, NPC_TALENT_GOTTSTATUS, 7);
		}
		else
		{
			if (Mod_Gottstatus == 4)
			|| (Mod_Gottstatus == 12)
			{
				Mod_GottCooldown = 0;
			};

			Mod_Gottstatus = 8;

			Npc_SetTalentSkill (hero, NPC_TALENT_GOTTSTATUS, 8);
		};
	};

	SetMagicDamage();
};