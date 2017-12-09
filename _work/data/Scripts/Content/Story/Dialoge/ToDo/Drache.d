INSTANCE Info_Mod_Drache_Hi (C_INFO)
{
	npc		= Wasserdrache_11054_DT;
	nr		= 1;
	condition	= Info_Mod_Drache_Hi_Condition;
	information	= Info_Mod_Drache_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Drache_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Drache_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Drache_Hi_22_00"); //Noch ein Mensch. Was treibst du hier? Zurück zu deinem Verein, sonst lernst du mich kennen.
	AI_Output(hero, self, "Info_Mod_Drache_Hi_15_01"); //(Leise) Ich gehöre nicht zu diesem Haufen. Ich bin gekommen, um Khorgor zu finden und zu töten.
	AI_Output(self, hero, "Info_Mod_Drache_Hi_22_02"); //Khorgor ist auch mein Feind. Nur leider bin ich machtlos, seit er mich hier eingesperrt hat.
	AI_Output(hero, self, "Info_Mod_Drache_Hi_15_03"); //Würdest du mir helfen, wenn es mir gelingt, dich zu befreien?
	AI_Output(self, hero, "Info_Mod_Drache_Hi_22_04"); //Mit Freuden. Aber das ist nicht so einfach.
	AI_Output(hero, self, "Info_Mod_Drache_Hi_15_05"); //Weil?
	AI_Output(self, hero, "Info_Mod_Drache_Hi_22_06"); //Ich bin ein Wasserdrache. Wasser ist mein Lebenselixier, auf das ich hier nun schon lange verzichten muss.
	AI_Output(self, hero, "Info_Mod_Drache_Hi_22_07"); //So sieche ich hier dahin, bin kraftlos und kann nicht kämpfen. Ich nehme Stück für Stück die Struktur dieser Umgebung an.
	AI_Output(hero, self, "Info_Mod_Drache_Hi_15_08"); //Kann man sehen. Du mutierst zum Silberdrachen.
	AI_Output(self, hero, "Info_Mod_Drache_Hi_22_09"); //(etwas lauter) Das ist kein Spaß! Bring mir Wasser, wenn ich dir helfen soll. Da vorn ist ein See.
	AI_Output(hero, self, "Info_Mod_Drache_Hi_15_10"); //Schon. Und dazwischen sind nur ungefähr zehn Feinde.
	AI_Output(self, hero, "Info_Mod_Drache_Hi_22_11"); //Tölpel! Du wirst bei Nacht an ihnen vorbei schleichen. Oder machst dich unsichtbar.
	AI_Output(hero, self, "Info_Mod_Drache_Hi_15_12"); //Das hat was. Wie viel Wasser brauchst du?
	AI_Output(self, hero, "Info_Mod_Drache_Hi_22_13"); //Idealerweise den halben See. Aber vier Eimer sollten reichen für den Anfang.
	AI_Output(hero, self, "Info_Mod_Drache_Hi_15_14"); //Und woher bekomme ich jetzt einen Eimer?
	AI_Output(self, hero, "Info_Mod_Drache_Hi_22_15"); //Am See gibt's sicher welche. Von den Verbrechern dort.

	Log_CreateTopic	(TOPIC_MOD_JG_DRACHENDURST, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_DRACHENDURST, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_DRACHENDURST, "Ein leibhaftiger Drachen! Ein blauer. Er will mir helfen, wenn ich ihm Wasser verschaffe. 4 Eimer will er haben.");
};

INSTANCE Info_Mod_Drache_Drachendurst01 (C_INFO)
{
	npc		= Wasserdrache_11054_DT;
	nr		= 1;
	condition	= Info_Mod_Drache_Drachendurst01_Condition;
	information	= Info_Mod_Drache_Drachendurst01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier. Ein Eimer voll Wasser.";
};

FUNC INT Info_Mod_Drache_Drachendurst01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Drache_Hi))
	&& (Npc_HasItems(hero, ItMi_EimerW) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drache_Drachendurst01_Info()
{
	AI_Output(hero, self, "Info_Mod_Drache_Drachendurst01_15_00"); //Hier. Ein Eimer voll Wasser.

	B_GiveInvItems	(hero, self, ItMi_EimerW, 1);

	Mdl_SetVisualBody		(self,	"Dragon_WATER02_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	AI_Output(self, hero, "Info_Mod_Drache_Drachendurst01_22_01"); //Ahh. Köstlich! Mir geht's schon gleich besser. Aber ich brauche mehr.
	AI_Output(hero, self, "Info_Mod_Drache_Drachendurst01_15_02"); //Bin schon unterwegs.

	B_GiveInvItems	(self, hero, ItMi_Eimer, 1);
};

INSTANCE Info_Mod_Drache_Drachendurst02 (C_INFO)
{
	npc		= Wasserdrache_11054_DT;
	nr		= 1;
	condition	= Info_Mod_Drache_Drachendurst02_Condition;
	information	= Info_Mod_Drache_Drachendurst02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier. Die zweite Fuhre.";
};

FUNC INT Info_Mod_Drache_Drachendurst02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Drache_Drachendurst01))
	&& (Npc_HasItems(hero, ItMi_EimerW) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drache_Drachendurst02_Info()
{
	AI_Output(hero, self, "Info_Mod_Drache_Drachendurst02_15_00"); //Hier. Die zweite Fuhre.

	B_GiveInvItems	(hero, self, ItMi_EimerW, 1);

	Mdl_SetVisualBody		(self,	"Dragon_WATER03_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	AI_Output(self, hero, "Info_Mod_Drache_Drachendurst02_22_01"); //Danke Mensch. Du rettest mir das Leben.
	AI_Output(hero, self, "Info_Mod_Drache_Drachendurst02_15_02"); //Und riskiere meins.
	AI_Output(self, hero, "Info_Mod_Drache_Drachendurst02_22_03"); //Ohne mich hast du eh keine Chance hier.
	AI_Output(hero, self, "Info_Mod_Drache_Drachendurst02_15_04"); //Mag sein, Bin unterwegs.

	B_GiveInvItems	(self, hero, ItMi_Eimer, 1);
};

INSTANCE Info_Mod_Drache_Drachendurst03 (C_INFO)
{
	npc		= Wasserdrache_11054_DT;
	nr		= 1;
	condition	= Info_Mod_Drache_Drachendurst03_Condition;
	information	= Info_Mod_Drache_Drachendurst03_Info;
	permanent	= 0;
	important	= 0;
	description	= "So, die dritte Ladung. Wie geht's dir jetzt?";
};

FUNC INT Info_Mod_Drache_Drachendurst03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Drache_Drachendurst02))
	&& (Npc_HasItems(hero, ItMi_EimerW) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drache_Drachendurst03_Info()
{
	AI_Output(hero, self, "Info_Mod_Drache_Drachendurst03_15_00"); //So, die dritte Ladung. Wie geht's dir jetzt?

	B_GiveInvItems	(hero, self, ItMi_EimerW, 1);

	Mdl_SetVisualBody		(self,	"Dragon_WATER04_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	AI_Output(self, hero, "Info_Mod_Drache_Drachendurst03_22_01"); //Fühl mich so gut, wie lange nicht mehr. Und bin auch wieder bei Kräften.
	AI_Output(self, hero, "Info_Mod_Drache_Drachendurst03_22_02"); //Jetzt noch einen Eimer und ich reiß' das Gitter hier nieder.

	B_GiveInvItems	(self, hero, ItMi_Eimer, 1);
};

INSTANCE Info_Mod_Drache_Drachendurst04 (C_INFO)
{
	npc		= Wasserdrache_11054_DT;
	nr		= 1;
	condition	= Info_Mod_Drache_Drachendurst04_Condition;
	information	= Info_Mod_Drache_Drachendurst04_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier. Aller guten Dinge ist vier.";
};

FUNC INT Info_Mod_Drache_Drachendurst04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Drache_Drachendurst03))
	&& (Npc_HasItems(hero, ItMi_EimerW) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drache_Drachendurst04_Info()
{
	AI_Output(hero, self, "Info_Mod_Drache_Drachendurst04_15_00"); //Hier. Aller guten Dinge ist vier.

	B_GiveInvItems	(hero, self, ItMi_EimerW, 1);

	Mdl_SetVisualBody		(self,	"Dragon_WATER_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	AI_Output(self, hero, "Info_Mod_Drache_Drachendurst04_22_01"); //Wohl wahr! Rüber mit den Eimern.
	AI_Output(hero, self, "Info_Mod_Drache_Drachendurst04_15_02"); //So. Und jetzt? Das Gitter?
	AI_Output(self, hero, "Info_Mod_Drache_Drachendurst04_22_03"); //War nicht ernst gemeint. Das schaff ich natürlich nicht.
	AI_Output(hero, self, "Info_Mod_Drache_Drachendurst04_15_04"); //Na ja. Wenigstens hast du deine blaue Farbe wieder. Und jetzt?
	AI_Output(self, hero, "Info_Mod_Drache_Drachendurst04_22_05"); //Ehrlich? Ich bin wieder blau?
	AI_Output(hero, self, "Info_Mod_Drache_Drachendurst04_15_06"); //Wie ein Matrose, der seine letzte Heuer versoffen hat.
	AI_Output(self, hero, "Info_Mod_Drache_Drachendurst04_22_07"); //Aah! Hier bin ich Drache, hier darf ich's sein!
	AI_Output(hero, self, "Info_Mod_Drache_Drachendurst04_15_08"); //Zur Sache, Lindwurm. Wie bekomme ich dich da raus?
	AI_Output(self, hero, "Info_Mod_Drache_Drachendurst04_22_09"); //Also höre: Drüben im Tempel haust so eine seltsame schwarze Gestalt. Mit glühenden Augen.
	AI_Output(hero, self, "Info_Mod_Drache_Drachendurst04_15_10"); //(aufgeregt) Der Suchende! Endlich hab ich ihn aufgespürt.
	AI_Output(self, hero, "Info_Mod_Drache_Drachendurst04_22_11"); //Du kennst diese Gestalt?
	AI_Output(hero, self, "Info_Mod_Drache_Drachendurst04_15_12"); //Der ist mir schon zwei Mal entwischt. Aber diesmal krieg ich ihn!
	AI_Output(self, hero, "Info_Mod_Drache_Drachendurst04_22_13"); //Nun gut. Aber vergiss mein Gatter nicht, du wirst mich brauchen bei der Meute im Wald.
	AI_Output(self, hero, "Info_Mod_Drache_Drachendurst04_22_14"); //Also weiter: Vor einiger Zeit konnte ich ein Gespräch belauschen zwischen dem Dunklen und einem der Vasallen.
	AI_Output(self, hero, "Info_Mod_Drache_Drachendurst04_22_15"); //Da hab ich erfahren, dass der Öffnungsmechanismus in der Bibliothek zu finden ist. Allerdings verborgen, was immer das heißt.
	AI_Output(hero, self, "Info_Mod_Drache_Drachendurst04_15_16"); //Hm. Ein Hebel vielleicht. Oder eine Winde. Nee ... eine Winde kann man nicht verstecken. Mal sehen ...

	Log_CreateTopic	(TOPIC_MOD_JG_SUCHENDER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_SUCHENDER, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_JG_DRACHENDURST, TOPIC_MOD_JG_SUCHENDER, "Der Drache war mit vier Eimern Wasser zufrieden. Mal sehen, wie's weitergeht.", "Der Wasserdrache erzählt von einer Vorrichtung, die das Gatter öffnet. In der Tempelbibliothek soll der versteckt sein. Und der Suchende wahrscheinlich auch. Ich muss auf seine Eisattacken achten. Hab ich noch 'nen Magieschutz im Beutel? Und besser auf Nahkampf gehen. Vielleicht ist eine List hilfreich ...");
	B_SetTopicStatus	(TOPIC_MOD_JG_DRACHENDURST, LOG_SUCCESS);

	Wld_InsertNpc	(Mod_7543_DMT_Suchender_DT, "DT_039");
};

INSTANCE Info_Mod_Drache_Drachental (C_INFO)
{
	npc		= Wasserdrache_11054_DT;
	nr		= 1;
	condition	= Info_Mod_Drache_Drachental_Condition;
	information	= Info_Mod_Drache_Drachental_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Drache_Drachental_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Drachental))
	&& (Mod_JG_Gitter == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drache_Drachental_Info()
{
	AI_Output(self, hero, "Info_Mod_Drache_Drachental_22_00"); //He! Wo steckst du? Was ist mit dem Gatter?
	AI_Output(hero, self, "Info_Mod_Drache_Drachental_15_01"); //Geduld! Hatte noch anderes zu tun. Der Raum des Schwarzen sagst du?
	AI_Output(self, hero, "Info_Mod_Drache_Drachental_22_02"); //Ja. Irgendwo da soll der Hebel sein.
	AI_Output(hero, self, "Info_Mod_Drache_Drachental_15_03"); //Mal sehen.

	Log_CreateTopic	(TOPIC_MOD_JG_VASALLEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_VASALLEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_VASALLEN, "Ich sollte nun den Drachen befreien und dann die Wachen hier töten.");
};

INSTANCE Info_Mod_Drache_Drachental2 (C_INFO)
{
	npc		= Wasserdrache_11054_DT;
	nr		= 1;
	condition	= Info_Mod_Drache_Drachental2_Condition;
	information	= Info_Mod_Drache_Drachental2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Drache_Drachental2_Condition()
{
	if (Npc_IsDead(Mod_7544_OUT_Wache_DT))
	&& (Npc_IsDead(Mod_7545_OUT_Wache_DT))
	&& (Npc_IsDead(Mod_7546_OUT_Wache_DT))
	&& (Npc_IsDead(Mod_7547_OUT_Wache_DT))
	&& (Npc_IsDead(Mod_7548_OUT_Wache_DT))
	&& (Npc_IsDead(Mod_7549_OUT_Wache_DT))
	&& (Npc_IsDead(Mod_7550_OUT_Wache_DT))
	&& (Npc_IsDead(Mod_7551_OUT_Wache_DT))
	&& (Npc_IsDead(Mod_7552_OUT_Wache_DT))
	&& (Npc_IsDead(Mod_7553_OUT_Wache_DT))
	&& (Mod_JG_Gitter == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drache_Drachental2_Info()
{
	AI_Output(self, hero, "Info_Mod_Drache_Drachental2_22_00"); //Duuurst! Ich brauche dringend Wasser! Ich bin am See.
	AI_Output(hero, self, "Info_Mod_Drache_Drachental2_15_01"); //Ich schau mich mal um.

	B_LogEntry_More	(TOPIC_MOD_JG_VASALLEN, TOPIC_MOD_JG_DRACHENTAL, "Erstaunlich, was Wasser für Kraft hat. Den Rücken sollte ich nun freihaben.", "Erstaunlich, was Wasser für Kraft hat. Den Rücken sollte ich nun freihaben. Ich gehe am besten noch mal in die Bibliothek. Vielleicht habe ich vorhin was übersehen ...");
	B_SetTopicStatus	(TOPIC_MOD_JG_VASALLEN, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "DURST");

	Wld_InsertItem	(ItWr_RaetselWand, "FP_ITEM_RAETSELWANDZETTEL");
};

INSTANCE Info_Mod_Drache_Khorgor (C_INFO)
{
	npc		= Wasserdrache_11054_DT;
	nr		= 1;
	condition	= Info_Mod_Drache_Khorgor_Condition;
	information	= Info_Mod_Drache_Khorgor_Info;
	permanent	= 0;
	important	= 0;
	description	= "So, mein Auftrag hier ist erledigt.";
};

FUNC INT Info_Mod_Drache_Khorgor_Condition()
{
	if (Mod_JG_Khorgor == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drache_Khorgor_Info()
{
	AI_Output(hero, self, "Info_Mod_Drache_Khorgor_15_00"); //So, mein Auftrag hier ist erledigt. Ich muss zu meinen Leuten zurück. Wenn ich nur wüsste wie.
	AI_Output(self, hero, "Info_Mod_Drache_Khorgor_22_01"); //Da drin muss irgendwo ein Transporter sein. Das Fußvolk ist da immer raus und rein ...
	AI_Output(hero, self, "Info_Mod_Drache_Khorgor_15_02"); //Da muß ich doch mal schauen. Und was wirst du machen?
	AI_Output(self, hero, "Info_Mod_Drache_Khorgor_22_03"); //Ich sauf den See leer unn mache mich auf die Suche nach meinen Brüdern.
	AI_Output(hero, self, "Info_Mod_Drache_Khorgor_15_04"); //Dann wünsch ich dir viel Erfolg.
	AI_Output(self, hero, "Info_Mod_Drache_Khorgor_22_05"); //Dir auch. Und hier, ein kleines Geschenk.

	B_GiveInvItems	(self, hero, ItMi_Aquamarine, 10);
};

INSTANCE Info_Mod_Drache_EXIT (C_INFO)
{
	npc		= Wasserdrache_11054_DT;
	nr		= 1;
	condition	= Info_Mod_Drache_EXIT_Condition;
	information	= Info_Mod_Drache_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Drache_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Drache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};