INSTANCE Info_Mod_Thofeistos_Hi (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Hi_Condition;
	information	= Info_Mod_Thofeistos_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo. Bist du hier der Schmied?";
};

FUNC INT Info_Mod_Thofeistos_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thofeistos_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Hi_15_00"); //Hallo. Bist du hier der Schmied?
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_01"); //Nein, ich heize nur ordentlich die Wohnhöhle auf. Was sollte ich wohl sonst an der Schmiede machen?!
	AI_Output(hero, self, "Info_Mod_Thofeistos_Hi_15_02"); //Tschuldigung, war nur eine Frage.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_03"); //Ja, eine ziemlich dumme. Na ja, sei’s drum. Nichts für ungut. Gibt hier viel zu tun für mich, mehr als ich ursprünglich erwartet hatte, als ich mich dem Lager anschloss.
	AI_Output(hero, self, "Info_Mod_Thofeistos_Hi_15_04"); //Woher kommst du und warum hast du dich nach dem Fall der Barriere dem Neuen Lager angeschlossen?
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_05"); //Ursprünglich stamme ich aus dem Norden des Festlandes. Ich hörte von den großen Erzvorkommen auf Khorinis und habe mich daher auf den Weg auf diese Insel gemacht.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_06"); //Nach dem Fall der Barriere habe ich keine Sekunde gezögert und bin ins Tal gegangen, zur eigentlichen Quelle des Erzes.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_07"); //So viel magisches Erz, das ich nach meinem Willen formen kann, neue Legierungen ergründen, Kompositionen des Metalls erschaffen, die es noch nicht gegeben hat.
	AI_Output(hero, self, "Info_Mod_Thofeistos_Hi_15_08"); //Ja, man hört, ein Schmied aus voller Seele.
};

INSTANCE Info_Mod_Thofeistos_Orksoeldner (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Orksoeldner_Condition;
	information	= Info_Mod_Thofeistos_Orksoeldner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du eine Waffe für mich?";
};

FUNC INT Info_Mod_Thofeistos_Orksoeldner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_HabPfeife))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Orksoeldner_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_GiveSLDWeapon_15_00"); //Hast du eine Waffe für mich?
	AI_Output(self, hero, "Info_Mod_Thofeistos_Orksoeldner_29_01"); //Nun, an sich schon, da du jetzt zu den Orkjägern gehörst ...
	AI_Output(hero, self, "Info_Mod_Thofeistos_Orksoeldner_15_02"); //Aber was?
	AI_Output(self, hero, "Info_Mod_Thofeistos_Orksoeldner_29_03"); //Mir ist gerade mal wieder das Erz ausgegangen. Wenn du dein Schwert haben willst, so gehe zu unserer Mine und hole mir eine Kiste Erz.

	Log_CreateTopic	(TOPIC_MOD_NL_ERZKISTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NL_ERZKISTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NL_ERZKISTE, "Jetzt darf ich noch Thofeistos eine Kiste Erz aus der Mine holen.");
};

INSTANCE Info_Mod_Thofeistos_Erzkiste (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Erzkiste_Condition;
	information	= Info_Mod_Thofeistos_Erzkiste_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier ist die Kiste.";
};

FUNC INT Info_Mod_Thofeistos_Erzkiste_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_FMCTorwache_Erzkiste))
	&& (Npc_HasItems(hero, ItMi_Erzkiste) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Erzkiste_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Erzkiste_15_00"); //Hier ist die Kiste.

	B_GiveInvItems	(hero, self, ItMi_Erzkiste, 1);

	if (hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self, hero, "Info_Mod_Thofeistos_Erzkiste_29_01"); //Sehr gut. Hier hast du das Schwert, das dir gebührt, Orkschlächter genannt.

		B_GiveInvItems	(self, hero, ItMw_Orkschlaechter, 1);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Thofeistos_Erzkiste_29_02"); //Sehr gut. Hier hast du das Schwert, das dir gebührt, Orkpiekser genannt.

		B_GiveInvItems	(self, hero, ItMw_Orkpickser, 1);
	};

	AI_Output(self, hero, "Info_Mod_Thofeistos_Erzkiste_29_03"); //Es ist das Beste, was du bei mir bekommen kannst. Bessere Waffen wirst du dir schon selbst anfertigen müssen.
	AI_Output(hero, self, "Info_Mod_Thofeistos_Erzkiste_15_04"); //(verwirrt) Ähh, du hast die Waffe schon?! Aber wieso ...
	AI_Output(self, hero, "Info_Mod_Thofeistos_Erzkiste_29_05"); //Ach, ich hatte gerade keine Zeit und war mir zu gemütlich, um selbst die Kiste zu holen. Hier hast du zwei Erzbrocken als Dank.

	B_GiveInvItems	(self, hero, ItMi_Nugget, 2);

	B_SetTopicStatus	(TOPIC_MOD_NL_ERZKISTE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Thofeistos_Gormgniez (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Gormgniez_Condition;
	information	= Info_Mod_Thofeistos_Gormgniez_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich komme von Lee, um mir Erz als Belohnung zu holen.";
};

FUNC INT Info_Mod_Thofeistos_Gormgniez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_Gormgniez))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Gormgniez_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Gormgniez_15_00"); //Ich komme von Lee, um mir Erz als Belohnung zu holen.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Gormgniez_29_01"); //Ja, ja, so viel Erz. Hoffentlich versäufst du nicht alles, sondern machst auch einige schöne Klingen daraus.

	B_GiveInvItems	(self, hero, ItMi_Nugget, 15);

	B_SetTopicStatus	(TOPIC_MOD_NL_CRAWLER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Thofeistos_SeeVorLager (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_SeeVorLager_Condition;
	information	= Info_Mod_Thofeistos_SeeVorLager_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thofeistos_SeeVorLager_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_SeeVorLager_Info()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_00"); //Du bist doch viel draußen unterwegs. Ist dir vielleicht am See vor dem Lager etwas Ungewöhnliches aufgefallen?
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_01"); //Nee, nicht dass ich wüsste. Warum fragst du?
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_02"); //Ach, nur so, ist nicht so wichtig. Mir war nur etwas Merkwürdiges im See aufgefallen ... aber ... nein, zu abwegig.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_03"); //Naja, es sind viele ungewöhnliche und abwegige Dinge in den letzten Tagen auf Khorinis geschehen. Zum Beispiel Drachen ...
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_04"); //(unterbricht) Dann stimmt es also doch, was ich des Nachts im See glaubte zu sehen und zu hören.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_05"); //Ja, wovon sprichst du?
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_06"); //Letzte Nacht. Ich machte einen Spaziergang vor dem Lager und vernahm plötzlich fauchende und quiekende Geräusche vom See, wie ich sie nur aus alten Büchern zu kennen glaubte.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_07"); //Fauchende Geräusche?! Was für Bücher?
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_08"); //Bücher über Drachen und ihnen verwandte Wesen, darunter auch solche, die im Wasser zu Hause sind.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_09"); //Als ich zum See schaute, glaubte ich auch kurz einen langen Körper erkennen zu können, der sich durch das Wasser schlängelte.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_10"); //Es erschien mir aber zu unwahrscheinlich, hier im Minental plötzlich auf solches Seeungeheuer zu stoßen.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_11"); //Und wie soll man da jetzt weiter vorgehen? Was ist zu tun?
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_12"); //Nun, ich glaube nicht, dass dieses Wesen eine echte Bedrohung für das Lager darstellt, da es sich wie erwähnt bevorzugt im Wasser aufhält, auch wenn es sich gewisse Zeit im Flug fortbewegen kann.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_13"); //Hmm, wenn du mir jedoch seine Schuppen bringen könntest, könnte ich dir daraus eine neue Rüstung fertigen.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_14"); //Du müsstest jedoch berücksichtigen, dass es sich nur nachts aus dem Schlamm des Sees erhebt.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_15"); //Versuche es an Land zu locken und es dort zu bezwingen.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_16"); //Ein Seeungeheuer bezwingen?! Hmm, ich werde sehen, was sich machen lässt ...
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_17"); //Viel Glück.

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Thofeistos glaubt im See vor dem Lager ein Seeungeheuer ausgemacht zu haben. Wenn das Geschöpf sich nachts aus dem See erhebt, soll ich es an Land locken und erledigen. Aus den Schuppen des Seeungeheuers könnte Thofeistos mir eine neue Rüstung fertigen.");
};

INSTANCE Info_Mod_Thofeistos_Seeungeheuer (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Seeungeheuer_Condition;
	information	= Info_Mod_Thofeistos_Seeungeheuer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe die Schuppen.";
};

FUNC INT Info_Mod_Thofeistos_Seeungeheuer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_SeeVorLager))
	&& (Npc_HasItems(hero, ItAt_Seeungeheuerschuppen) == 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Seeungeheuer_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Seeungeheuer_15_00"); //Ich habe die Schuppen.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_01"); //Zeig her ...

	B_GiveInvItems	(hero, self, ItAt_Seeungeheuerschuppen, 11);

	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_02"); //... tatsächlich.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_03"); //Du bist ein noch größerer Krieger, als ich ursprünglich vermutet hatte.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_04"); //Nicht vielen Menschen wäre es gelungen, so ein Ungetüm zu bezwingen.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_05"); //Komm morgen wieder. Dann werde ich deine Rüstung fertig haben.

	Mod_NL_DJGArmor_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Thofeistos_DJGArmor (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_DJGArmor_Condition;
	information	= Info_Mod_Thofeistos_DJGArmor_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thofeistos_DJGArmor_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Seeungeheuer))
	&& (Wld_GetDay() > Mod_NL_DJGArmor_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_DJGArmor_Info()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_00"); //Ahh, da bist du. Vor kurzem habe ich deine Rüstung fertig bekommen.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_01"); //Hier, sie wird dir hoffentlich noch lange gute Dienste erweisen.

	B_GiveInvItems	(self, hero, ItAr_DJG_L, 1);

	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_02"); //Hmm, und dann noch ... ich habe nachgedacht.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_03"); //Mein ganzes Leben habe ich der Schmiedekunst verschrieben, formte Waffen, welche sonst keiner zu schmieden vermochte und erschuf Legierungen, deren Geheimnisse nur mir bekannt sind.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_04"); //Ich habe Wissen, das aus uralten Quellen überliefert wurde und kann mich mit den besten Schmelzern und Schmieden Nordmars messen.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_05"); //Doch du bist der Erste, der mir würdig erscheint, die tieferen Weihen der Erzverarbeitung zu erfahren.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_06"); //Ja, auch wenn ich die meiste Zeit am Schmiedeoffen stehe, so erfahre ich doch einiges ...
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_07"); //Mein ganzes Wissen um die Erzverarbeitung steht dir nun offen.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_08"); //Triff deine Wahl, aber sei dir auch bewusst, dass es viel Erfahrung erfordert, die Kunst in jeder der Disziplinen zu vervollkommnen.

	Mod_Gilde = 5;
};

INSTANCE Info_Mod_Thofeistos_Urs (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Urs_Condition;
	information	= Info_Mod_Thofeistos_Urs_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bringe den feurigen Hammer von Urs.";
};

FUNC INT Info_Mod_Thofeistos_Urs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Urs_Hi))
	&& (Npc_HasItems(hero, ItMw_FeurigerHammer) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Urs_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Urs_15_00"); //Ich bringe den feurigen Hammer von Urs.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Urs_29_01"); //(euphorisch) Was, der magische Hammer?! Gib schon her, ich muss ihn gleich ausprobieren.

	B_GiveInvItems	(hero, self, ItMw_FeurigerHammer, 1);

	AI_UseMob	(self, "ANVIL", 1);
	AI_UseMob	(self, "ANVIL", -1);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Thofeistos_Urs_29_02"); //Fantastisch, der Stahl erhitzt sich ja unter den Schlägen fast von selbst.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Urs_29_03"); //Ein großartiges Stück, das eines Erzschmelzers in Nordmar würdig wäre.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Urs_29_04"); //20 Brocken waren ausgemacht? Hier, nimm 30 ... und selbst dies spiegelt den wahren Wert dieses Stückes nicht wirklich wieder.

	B_GiveInvItems	(self, hero, ItMi_Nugget, 30);

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_URS_HUND, "Thofeistos hat seinen Hammer ... und ich 30 Erzbrocken.");
};

INSTANCE Info_Mod_Thofeistos_Teacher (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Teacher_Condition;
	information	= Info_Mod_Thofeistos_Teacher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Thofeistos_Teacher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	if (Mod_Gilde != 5)
	&& (Mod_Gilde != 19)
	{
		AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_01"); //Erweise dich erst mal als würdig. Nicht jeden Dahergelaufenen weihe ich darin ein, magisches Erz zu bearbeiten.
	}
	else
	{
		if (Mod_Gilde == 5)
		|| (Mod_Gilde == 19)
		{

			if (Mod_NL_Thofeistos_Lehrer == 0)
			{
				Mod_NL_Thofeistos_Lehrer = 1;

				AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_02"); //Du hast bewiesen, dass du sowohl über die Fertigkeiten des Kampfes verfügst, als auch über Verstand und Geschick.
				AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_03"); //Damit hast du dich dafür qualifiziert, etwas über die Kunst zu erlernen magisches Erz zu verarbeiten.
				AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_04"); //Natürlich werde ich dich nicht in alles einweisen.
				AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_05"); //Zum einen fehlt mir dafür die Zeit, zum anderen ist dieses Wissen nur den allergrößten Kriegern vorbehalten.
			};

			if (Mod_Gilde == 5)
			{
				Info_ClearChoices	(Info_Mod_Thofeistos_Teacher);

				Info_AddChoice	(Info_Mod_Thofeistos_Teacher, DIALOG_BACK, Info_Mod_Thofeistos_Teacher_BACK);

				if (Armor_Dragon == 1)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Mittlere Drachenjägerrüstung verbessern (1000 Gold)", Info_Mod_Thofeistos_Teacher_Armor_Dragon2);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Mittlere Drachenjägerrüstung verbessern (10 LP)", Info_Mod_Thofeistos_Teacher_Armor_Dragon2);
					};
				};
				if (Armor_Dragon == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Leichte Drachenjägerrüstung verbessern (1000 Gold)", Info_Mod_Thofeistos_Teacher_Armor_Dragon);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Leichte Drachenjägerrüstung verbessern (10 LP)", Info_Mod_Thofeistos_Teacher_Armor_Dragon);
					};
				};
				if (Pfeil_GoldErz == 1)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 2500)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Fernkampfwaffen der Drachenjäger. (2500 Gold)", Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 25)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Fernkampfwaffen der Drachenjäger. (25 LP)", Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter);
					};
				};
				if (Pfeil_GoldErz == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Pfeil- und Bolzenspitzen aus Gold-Erz-Legierung schmieden. (1000 Gold)", Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Pfeil- und Bolzenspitzen aus Gold-Erz-Legierung schmieden. (10 LP)", Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz);
					};
				};
				if (Waffe_ErzEisen == 1)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 2500)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Drachenjäger-Waffe schmieden. (2500 Gold)", Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 25)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Drachenjäger-Waffe schmieden. (25 LP)", Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter);
					};
				};
				if (Waffe_ErzEisen == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Waffe aus Erz-Eisen-Legierung schmieden. (1000 Gold)", Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Waffe aus Erz-Eisen-Legierung schmieden. (10 LP)", Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen);
					};
				};
			};

			if (Mod_Gilde == 19)
			{
				Info_ClearChoices	(Info_Mod_Thofeistos_Teacher);

				Info_AddChoice	(Info_Mod_Thofeistos_Teacher, DIALOG_BACK, Info_Mod_Thofeistos_Teacher_BACK);

				if (Pfeil_GoldErz == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Pfeil- und Bolzenspitzen aus Gold-Erz-Legierung schmieden. (1000 Gold)", Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Pfeil- und Bolzenspitzen aus Gold-Erz-Legierung schmieden. (10 LP)", Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz);
					};
				};
				if (Waffe_ErzEisen == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Waffe aus Erz-Eisen-Legierung schmieden. (1000 Gold)", Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Waffe aus Erz-Eisen-Legierung schmieden. (10 LP)", Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen);
					};
				};
			};
		};
	};
};

FUNC VOID Info_Mod_Thofeistos_Teacher_BACK()
{
	Info_ClearChoices	(Info_Mod_Thofeistos_Teacher);
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz_29_00"); //Nimm drei Erzbrocken und erhitze diese mit einem Goldbrocken.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz_29_01"); //Dadurch lässt sich das magische Erz überhaupt erst weich genug machen, um Pfeil- und Bolzenspitzen daraus zu schmieden.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz_29_02"); //Das Material reicht für etwa 100 Pfeile oder Bolzen.

	if (Mod_Schwierigkeit == 4)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 1000);
	}
	else
	{
		hero.lp -= 10;
	};

	Pfeil_GoldErz = 1;

	Mod_PfeileSchnitzen = 1;

	Mod_PfeileSpitzen = 1;

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Für Pfeile und Bolzen mit einer Gold-Erz-Legierung muss ich drei Erzbrocken und einen Goldbrocken an einem Amboss zusammenschmieden. Daraus erhalte ich 100 Spitzen, die ich mit Pfeilstäben zu Pfeilen oder Bolzen zusammenbauen kann.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen_29_00"); //Nimm einen Schmiederohling, erhitze diesen und schmiede – abhängig von der Größe des Waffe – 20 bis 30 Brocken magischen Erzes in den glühenden Stahl hinein.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen_29_01"); //Erst die daraus entstehende Legierung hat die Eigenschaften, die sie formbar und schmiedbar machen.

	B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_03_Dex);
	B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_03);
	B_TeachPlayerTalentSmith	(self, hero, WEAPON_2H_Special_03);

	Waffe_ErzEisen = 1;

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Um Waffen mit einer Erz-Eisen-Legierung herzustellen, soll ich an einem Amboss 20 bis 30 Erzbrocken - je nach Größe des Schwertes - in den Rohstahl einarbeiten.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_00"); //Die Legende besagt, dass vor vielen Jahrhunderten, als Drachen noch wesentlich häufiger auf dem Antlitz der Erde anzutreffen waren, ein wagemutiger Recke sich dem Kampf mit einer solchen Bestie stellte.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_01"); //Er focht lange mit ihr, doch vermochte er mit seiner Erzwaffe kaum den Panzer des Untieres zu durchdringen und fügte ihr nur kleinere Wunden zu.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_02"); //Endlich traf ein Flammenhauch die vom Drachenblut getränkte Klinge, dass diese rot erglühte.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_03"); //Der nächste Hieb, welchen der Krieger ausführte, durchbohrte das Untier nun auf einmal mühelos.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_04"); //Es stellt sich heraus, dass glühende Erzwaffen, die mit dem Blut dieser magischen Geschöpfe in Kontakt kommen, eine Härte erlangen, der nichts zu widerstehen vermag.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_05"); //Je nach Größe der Waffe benötigt man zwischen fünf und sieben Phiolen Drachenblut.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_06"); //Eine Waffe aus reinem Erz herzustellen, ist jedoch eine ungleich größere Kunst.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_07"); //Man mag zwar häufig von Erzwaffen sprechen, dabei handelt es sich jedoch immer um Legierungen, die mit anderen Metallen verunreinigt sind.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_08"); //Um eine Hitze zu erzeugen, die alle anderen Verunreinigungen im Erz beseitigt und selbst reines Erz formbar und schmiedbar macht, muss man einem Drachen die Flüssigkeit entnehmen, welche ihm seinen gefürchteten Flammenhauch verleiht.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_09"); //Diese befindet sich in einem weiß-violetten Organ, welches nicht weit unterhalb des Brustbeins liegt.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_10"); //Du musst zwischen seiner Schuppenpanzerung mit einem Messer ansetzen und so lange schneiden, bis das Organ sichtbar wird.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_11"); //Die Flüssigkeit fängst du dann in einem Fläschchen auf.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_12"); //Der Prozess, einen reinen Erzrohling herzustellen, wird in einem Hochzofen vollzogen.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_13"); //Aber sei gewarnt. Die explosive Hitze, die dabei entsteht, zieht alle Umstehenden mit in Leidenschaft.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_14"); //Wenn du, je nach gewünschter Größe der Waffe, 60 bis 80 Erzbrocken in den Ofen gegeben hast, fügst du nun drei Fläschchen der Flüssigkeit hinzu.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_15"); //Von der Schmelze nimmst du nur den Teil in der Mitte als Rohling, der am schnellsten fest wird.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_16"); //Um daraus eine Waffe zu schmieden, begibst du dich an eine Schmiede und heizt diese mit einem Fläschchen der Flüssigkeit auf.

	B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_04_Dex);
	B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_04);
	B_TeachPlayerTalentSmith	(self, hero, WEAPON_2H_Special_04);

	Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
	Log_AddEntry (TOPIC_TalentAnimalTrophy, "Ich kann jetzt, wenn ich eine Rasierklinge dabei habe:");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_TAKEANIMALTROPHY, 1);

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonElixier] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonElixier] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... toten Drachen ihr Flammenelixier entnehmen.");
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... toten Drachen ihr Blut abzapfen.");
	};

	Waffe_ErzEisen = 2;

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Für wirklich reine Erzwaffen benötige ich zuerst einmal das Flammenelixier der Drachen. Davon muss ich 3 mit 60 bis 80 Erzbrocken - je nach Größe der Waffe - in einem Schmelzofen schmelzen. Den so entstehenden reinen Erzrohling muss ich dann noch an einem Amboss mit einem weiteren Fläschchen Flammenelixier und 5 bzw. 7 Phiolen Drachenblut bearbeiten.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_00"); //Während du die Erzlegierung für Pfeile oder Bolzen herstellst, mischst du ein Fläschchen Drachenblut hinzu.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_01"); //Das verleiht den Pfeilspitzen eine Härte, die jeden Panzer und Schild zu durchbohren vermag.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_02"); //Du solltest auch einen Bogen oder eine Armbrust mit Drachensehnen herstellen.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_03"); //Die Spann- und Durchschlagskraft, die eine Drachensehne erzeugt, übertrifft alles, was man sonst findet.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_04"); //Geeignet sind vor allem die Sehnen an den Gelenken der Arme und Beine dieser Viecher, am Hals kann man auch brauchbares Material finden.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_05"); //Du musst längs schneiden, zwischen den Schuppen, um dich vorsichtig zu den Sehnen vorzuarbeiten.

	Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
	Log_AddEntry (TOPIC_TalentAnimalTrophy, "Ich kann jetzt, wenn ich eine Rasierklinge dabei habe:");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_TAKEANIMALTROPHY, 1);

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonSehne] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonSehne] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... die Sehnen toter Drachen entfernen.");
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... toten Drachen ihr Blut abzapfen.");
	};

	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonSehne] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;

	Pfeil_GoldErz = 2;

	if (Mod_Schwierigkeit == 4)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 2500);
	}
	else
	{
		hero.lp -= 25;
	};

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Um die Pfeile noch durchschlagskräftiger zu machen, soll ich bei der Herstellung der Spitzen zusätzlich noch eine Phiole Drachenblut hinzugeben.");
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Außerdem wäre ein passender Bogen oder eine Armbrust nicht schlecht. Dazu brauche ich einen Ast und zwei Sehnen der Drachen, welche ich an einem Baumstamm verbinden kann.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Armor_Dragon()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Armor_Dragon_29_00"); //Nun, das zu erklären habe ich keine Zeit. Präge dir diese Bauanleitung aufmerksam ein, dann wirst du wissen, wie vorzugehen ist.

	B_ShowGivenThings	("Bauanleitung erhalten");

	B_HeroFakeScroll ();

	AI_Output(hero, self, "Info_Mod_Thofeistos_Teacher_Armor_Dragon_15_01"); //Aha, so ... 9 Schuppen abtrennen ... anfügen ... 20 Erz zum Verstärken ... Dann verbinden und fixieren ... sollte klappen.

	Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
	Log_AddEntry (TOPIC_TalentAnimalTrophy, "Ich kann jetzt, wenn ich eine Rasierklinge dabei habe:");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_TAKEANIMALTROPHY, 1);
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... Drachenschuppen vom Körper eines toten Drachen lösen.");
	};

	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;

	Armor_Dragon = 1;

	if (Mod_Schwierigkeit == 4)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 1000);
	}
	else
	{
		hero.lp -= 10;
	};

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Für die Verbesserung meiner leichten Drachenjägerrüstung brauche ich 9 Drachenschuppen und 20 Erzbrocken. Beides wird der Rüstung an einem Amboss hinzugefügt.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Armor_Dragon2()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Armor_Dragon2_29_00"); //Um die perfekte Rüstung zu erschaffen, musst du noch geschickter vorgehen, um weitere 16 Erz und sieben Schuppen mit der Rüstung zu verbinden.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Armor_Dragon2_29_01"); //Daneben benötigst du noch vier Phiolen Drachenblut zum Härten der Rüstung.

	Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
	Log_AddEntry (TOPIC_TalentAnimalTrophy, "Ich kann jetzt, wenn ich eine Rasierklinge dabei habe:");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_TAKEANIMALTROPHY, 1);
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... toten Drachen ihr Blut abzapfen.");
	};

	Armor_Dragon = 2;

	if (Mod_Schwierigkeit == 4)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 1000);
	}
	else
	{
		hero.lp -= 10;
	};

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Für die Verbesserung meiner mittleren Drachenjägerrüstung brauche ich noch mal 7 Drachenschuppen und 16 Erzbrocken. Dazu kommen allerdings noch vier Phiolen Drachenblut.");
};

INSTANCE Info_Mod_Thofeistos_GiveSLDWeapon (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_GiveSLDWeapon_Condition;
	information	= Info_Mod_Thofeistos_GiveSLDWeapon_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du eine Waffe für mich?";
};

FUNC INT Info_Mod_Thofeistos_GiveSLDWeapon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Hi))
	&& (Mod_Gilde == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_GiveSLDWeapon_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_GiveSLDWeapon_15_00"); //Hast du eine Waffe für mich?
	AI_Output(self, hero, "Info_Mod_Thofeistos_GiveSLDWeapon_29_01"); //Als einfacher Söldner habe ich ein Söldnerschwert für dich. Entscheide dich für das Ein- oder Zweihandschwert.

	Info_ClearChoices	(Info_Mod_Thofeistos_GiveSLDWeapon);

	Info_AddChoice	(Info_Mod_Thofeistos_GiveSLDWeapon, "Zweihand", Info_Mod_Thofeistos_GiveSLDWeapon_B);
	Info_AddChoice	(Info_Mod_Thofeistos_GiveSLDWeapon, "Einhand", Info_Mod_Thofeistos_GiveSLDWeapon_A);
};

FUNC VOID Info_Mod_Thofeistos_GiveSLDWeapon_B()
{
	B_ShowGivenThings	("Groben Zweihänder erhalten");

	CreateInvItems	(hero, ItMw_2h_Sld_Sword, 1);

	Info_ClearChoices	(Info_Mod_Thofeistos_GiveSLDWeapon);
};

FUNC VOID Info_Mod_Thofeistos_GiveSLDWeapon_A()
{
	B_ShowGivenThings	("Grobes Kurzschwert erhalten");

	CreateInvItems	(hero, ItMw_GrobesKurzschwert, 1);

	Info_ClearChoices	(Info_Mod_Thofeistos_GiveSLDWeapon);
};

INSTANCE Info_Mod_Thofeistos_Trade (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Trade_Condition;
	information	= Info_Mod_Thofeistos_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= "Handelst du auch mit Schmiedzubehör?";
};

FUNC INT Info_Mod_Thofeistos_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);

	AI_Output(hero, self, "Info_Mod_Thofeistos_Trade_15_00"); //Handelst du auch mit Schmiedzubehör?
};

INSTANCE Info_Mod_Thofeistos_Pickpocket (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Pickpocket_Condition;
	information	= Info_Mod_Thofeistos_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Thofeistos_Pickpocket_Condition()
{
	C_Beklauen	(115, ItMi_Nugget, 6);
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

	Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_BACK, Info_Mod_Thofeistos_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Thofeistos_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

		Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Thofeistos_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Thofeistos_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Thofeistos_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Thofeistos_EXIT (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_EXIT_Condition;
	information	= Info_Mod_Thofeistos_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thofeistos_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thofeistos_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};