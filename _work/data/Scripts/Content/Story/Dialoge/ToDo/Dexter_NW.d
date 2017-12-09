INSTANCE Info_Mod_Dexter_NW_Hi (C_INFO)
{
	npc		= Mod_7806_BDT_Dexter_NW;
	nr		= 1;
	condition	= Info_Mod_Dexter_NW_Hi_Condition;
	information	= Info_Mod_Dexter_NW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_NW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dexter_NW_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Dexter_NW_Hi_15_00"); //Dexter?! Was machst du hier?
	AI_Output(self, hero, "Info_Mod_Dexter_NW_Hi_09_01"); //Nun, im Minental wurde es mir und den Jungs einfach zu heiß.
	AI_Output(self, hero, "Info_Mod_Dexter_NW_Hi_09_02"); //In letzter Zeit hatten uns die Orks einfach viel zu stark zugesetzt und nach allen Geschehnissen, die wir heil überstanden haben, wollte ich unser Glück nicht weiter auf die Probe stellen.
	AI_Output(self, hero, "Info_Mod_Dexter_NW_Hi_09_03"); //Daher haben lieber mal das monsterverseuchte Tal verlassen und es uns in dieser verlassenen Festung gemütlich gemacht.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SESSEL");
};

INSTANCE Info_Mod_Dexter_NW_AllesRoger (C_INFO)
{
	npc		= Mod_7806_BDT_Dexter_NW;
	nr		= 1;
	condition	= Info_Mod_Dexter_NW_AllesRoger_Condition;
	information	= Info_Mod_Dexter_NW_AllesRoger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und, gefällt’s euch hier?";
};

FUNC INT Info_Mod_Dexter_NW_AllesRoger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_NW_Hi))
	&& (Npc_GetDistToWP(hero, "NW_CASTLEMINE_HUT_10") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_NW_AllesRoger_Info()
{
	AI_Output(hero, self, "Info_Mod_Dexter_NW_AllesRoger_15_00"); //Und, gefällt’s euch hier?
	AI_Output(self, hero, "Info_Mod_Dexter_NW_AllesRoger_09_01"); //Naja, was will man mehr? Wir haben ein Dach über dem Kopf, dank der Lage ist es leicht zu verteidigen, man hat immer alles im Blick.
	AI_Output(self, hero, "Info_Mod_Dexter_NW_AllesRoger_09_02"); //Jetzt wäre es nur noch praktisch, wenn wir Zugang zur Mine hätten. Vielleicht gäbe es ja da was zu holen ... nur hinein kommen wir eben nicht.
};

INSTANCE Info_Mod_Dexter_NW_Minenzugang (C_INFO)
{
	npc		= Mod_7806_BDT_Dexter_NW;
	nr		= 1;
	condition	= Info_Mod_Dexter_NW_Minenzugang_Condition;
	information	= Info_Mod_Dexter_NW_Minenzugang_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hinter dem Gitter gibt es eine Steinplatte (...)";
};

FUNC INT Info_Mod_Dexter_NW_Minenzugang_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_NW_AllesRoger))
	&& (Mod_Mineneingang_Castle)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_NW_Minenzugang_Info()
{
	AI_Output(hero, self, "Info_Mod_Dexter_NW_Minenzugang_15_00"); //Hinter dem Gitter gibt es eine Steinplatte, die auf Beschuss mit Pfeilen und Bolzen reagiert und so Zugang in die Mine freilegt.
	AI_Output(self, hero, "Info_Mod_Dexter_NW_Minenzugang_09_01"); //Wirklich? Das müssen wir bei nächster Gelegenheit gleich ausprobieren ...
};

INSTANCE Info_Mod_Dexter_NW_Minenzugang2 (C_INFO)
{
	npc		= Mod_7806_BDT_Dexter_NW;
	nr		= 1;
	condition	= Info_Mod_Dexter_NW_Minenzugang2_Condition;
	information	= Info_Mod_Dexter_NW_Minenzugang2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_NW_Minenzugang2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_NW_Minenzugang))
	&& (Mod_Banditen_Mine == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_NW_Minenzugang2_Info()
{
	AI_Output(self, hero, "Info_Mod_Dexter_NW_Minenzugang2_09_00"); //(lacht) Diese Mine scheint eine wahre Goldgrube zu sein. Wenn der Abbau weiter so gut läuft, werden wir bald so reich sein, wie die etablierten Schnösel in den Rathäusern.
	AI_Output(self, hero, "Info_Mod_Dexter_NW_Minenzugang2_09_01"); //Nichts für Ungut, das war gute Arbeit. Hier hast du schon mal einen Anteil am Gewinn.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	B_GivePlayerXP	(200);

	Mod_Banditen_Mine_Tag = Wld_GetDay();
};

INSTANCE Info_Mod_Dexter_NW_Minenzugang3 (C_INFO)
{
	npc		= Mod_7806_BDT_Dexter_NW;
	nr		= 1;
	condition	= Info_Mod_Dexter_NW_Minenzugang3_Condition;
	information	= Info_Mod_Dexter_NW_Minenzugang3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dexter_NW_Minenzugang3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_NW_Minenzugang2))
	&& (Mod_Banditen_Mine == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dexter_NW_Minenzugang3_Info()
{
	AI_Output(self, hero, "Info_Mod_Dexter_NW_Minenzugang3_09_00"); //(lacht) Na, da schaust du, was? Jetzt sind wir wirklich ganz oben angekommen ... wahre Erzbarone! Jemand muss ja die Tradition fortführen, nicht wahr?
	AI_Output(self, hero, "Info_Mod_Dexter_NW_Minenzugang3_09_01"); //Hier hast du auch den Fummel, wenn du mal einen auf feinen Herrn machen willst ... dabei darf selbstverständlich auch kein Gold und Erz fehlen. Viel Spaß damit.

	CreateInvItems	(hero, ItMi_Gold, 700);
	CreateInvItems	(hero, ItMi_Nugget, 20);
	CreateInvItems	(hero, ITAR_Governor, 1);

	B_ShowGivenThings	("Prunkgewand, 700 Gold und 20 Erz erhalten");

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Dexter_NW_EXIT (C_INFO)
{
	npc		= Mod_7806_BDT_Dexter_NW;
	nr		= 1;
	condition	= Info_Mod_Dexter_NW_EXIT_Condition;
	information	= Info_Mod_Dexter_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Dexter_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dexter_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};