INSTANCE Info_Mod_Brunhild_DI_Hi (C_INFO)
{
	npc		= Mod_7642_OUT_Brunhild_DI;
	nr		= 1;
	condition	= Info_Mod_Brunhild_DI_Hi_Condition;
	information	= Info_Mod_Brunhild_DI_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brunhild_DI_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brunhild_DI_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Hi_17_00"); //Nanu? Träum ich? Wer seid ihr?
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Hi_15_01"); //Wir sind Piraten. Uns hat eine Flaschenpost hergeführt.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Hi_17_02"); //Ihr habt meine Nachricht gefunden? Dem Himmel sei Dank!
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Hi_17_03"); //Übrigens man nennt mich Brunhild. Freunde sagen Bruni zu mir.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Hi_15_04"); //Angenehm. Wie kommst du hierher?
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Hi_17_05"); //Das ist eine lange Geschichte.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Hi_15_06"); //Erzähl.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Hi_17_07"); //Ich bin mit meinem Vater und meinem Bruder losgesegelt. Wir wollten nach Khorinis.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Hi_17_08"); //Man sagt,  dort sind keine Orks, die einem den Hof verwüsten und alles töten, was nicht nach Ork aussieht.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Hi_17_09"); //Meine Mutter ist von denen getötet worden.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Hi_15_10"); //Woher hast du dieses Ammenmärchen?
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Hi_17_11"); //Auf dem Festland sagt man das.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Hi_15_12"); //Was für ein Witz! Und wo sind deine Leute?
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Hi_17_13"); //Tot. Mein Bruder hat den Schiffsbruch nicht überlebt und mein Vater hat uns dieses Zelt hier gebaut.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Hi_17_14"); //Dann wurde er von unheimlichen, hinkenden Gestalten erschlagen, die unter uns in den Höhlen hausen.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Hi_15_15"); //Die kennen wir. Kein Einziger treibt mehr sein Unwesen.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Hi_17_16"); //Ihr habt die alle getötet?
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Hi_15_17"); //Wir sind Piraten und fürchten weder Tod noch Beliar!
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Hi_17_18"); //Könnt ihr mich mitnehmen? Hier überlebe ich nicht lange, auch ohne die Hinker.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Hi_15_19"); //Das wird unser Kapitän entscheiden. Aber ich denke schon.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Hi_15_20"); //Lasst uns zum Strand gehen.

	Mod_DI_InselErkunden = 2;

	B_StartOtherRoutine	(self, "FOLLOW");
	B_StartOtherRoutine	(Mod_1542_PIR_AlligatorJack_DI, "START");

	B_StartOtherRoutine	(Mod_1540_PIR_Skip_DI, "START");
	AI_Teleport	(Mod_1540_PIR_Skip_DI, "WP_DI_SKIPKOMMTANLAND");

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Wld_InsertNpc	(Mod_1554_KDW_Jones_DI, "WP_DI_HEROKOMMTANLAND");
	Wld_InsertNpc	(Mod_7642_OUT_Brunhild_DI,	"WP_DI_BRUNHILD_02");
};

INSTANCE Info_Mod_Brunhild_DI_Gestaendnis (C_INFO)
{
	npc		= Mod_7642_OUT_Brunhild_DI;
	nr		= 1;
	condition	= Info_Mod_Brunhild_DI_Gestaendnis_Condition;
	information	= Info_Mod_Brunhild_DI_Gestaendnis_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie gefällts dir hier bei uns?";
};

FUNC INT Info_Mod_Brunhild_DI_Gestaendnis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_DI_Brunhild))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brunhild_DI_Gestaendnis_Info()
{
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Gestaendnis_15_00"); //Wie gefällts dir hier bei uns?
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Gestaendnis_17_01"); //Besser als in meinem elenden Zelt allemal! Willst du einen Teller Suppe?
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Gestaendnis_15_02"); //Später vielleicht. Ich komme von Samuel ...
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Gestaendnis_17_03"); //Ihr habt über mich gesprochen?
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Gestaendnis_15_04"); //Haben wir. Du warst nicht ehrlich zu mir.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Gestaendnis_17_05"); //Verzeih Ich hatte Angst ich müsse auf dieser Insel bleiben.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Gestaendnis_15_06"); //So brutal sind wir Piraten auch wieder nicht. Erzähl was wirklich war.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Gestaendnis_17_07"); //Wir sind nicht ausgewandert, sondern geflohen.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Gestaendnis_17_08"); //Meine Mutter ist nicht ertrunken, sondern sie wurde als Hexe auf dem Scheiterhaufen verbrannt.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Gestaendnis_17_09"); //Und ich wurde auch der Hexerei verdächtigt.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Gestaendnis_15_10"); //War sie eine Hexe? Bist du eine Hexe?
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Gestaendnis_17_11"); //Nein. Mein Vater hat früher dem Magierorden der Erde angehört.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Gestaendnis_17_12"); //Als er meine Mutter kennengelernt hatte und sie heiraten wollte, musste er den Orden verlassen.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Gestaendnis_15_13"); //Orden der Erde? Noch nie gehört.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Gestaendnis_17_14"); //Dieser Orden betet zu Adanos wie die Wassermagier auch. Ist nicht so bekannt wie die anderen Orden und ihre Magie ist auch etwas anders.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Gestaendnis_17_15"); //Vater hat nun Mutter und mir einiges von dieser Magie beigebracht.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Gestaendnis_15_16"); //Also keine Hexerei?
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Gestaendnis_17_17"); //Nein. Gute, positive Magie, wie andere auch. Mein Wissen entspricht etwa dem ersten Kreis der Magie.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Gestaendnis_15_18"); //Das bedeutet?
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Gestaendnis_17_19"); //Ich könnte Bäume entwurzeln, Erdspalten schaffen, Geröllawinen auslösen, Felsen bewegen. Solche Dinge halt.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Gestaendnis_15_20"); //Felsen bewegen ... Hmm ... interessant.
};

INSTANCE Info_Mod_Brunhild_DI_Amulett (C_INFO)
{
	npc		= Mod_7642_OUT_Brunhild_DI;
	nr		= 1;
	condition	= Info_Mod_Brunhild_DI_Amulett_Condition;
	information	= Info_Mod_Brunhild_DI_Amulett_Info;
	permanent	= 0;
	important	= 0;
	description	= "Schau mal hier. Hast du das schon mal gesehen?";
};

FUNC INT Info_Mod_Brunhild_DI_Amulett_Condition()
{
	if (Npc_HasItems(hero, ItAm_Pirateninsel) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brunhild_DI_Amulett_Info()
{
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Amulett_15_00"); //Schau mal hier. Hast du das schon mal gesehen?
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Amulett_17_01"); //Oh! Ein Medaillon.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Amulett_15_02"); //Medaillon?
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Amulett_17_03"); //Ja. Was ähnliches wie ein Amulett, aber kostbarer und seltener.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Amulett_15_04"); //Und was hat es damit auf sich?
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Amulett_17_05"); //Weiß ich nicht genau. Es könnte ein Banner sein, ich bin aber nicht sicher.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Amulett_15_06"); //Ein Banner?
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Amulett_17_07"); //Ja. Ein Gegenstand, mit dem man Bannsprüche aussprechen oder auch rückgängig machen kann.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Amulett_15_08"); //Das hilft uns momentan nicht weiter.
};

INSTANCE Info_Mod_Brunhild_DI_Erdmagie (C_INFO)
{
	npc		= Mod_7642_OUT_Brunhild_DI;
	nr		= 1;
	condition	= Info_Mod_Brunhild_DI_Erdmagie_Condition;
	information	= Info_Mod_Brunhild_DI_Erdmagie_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du kannst doch Felsen bewegen ...";
};

FUNC INT Info_Mod_Brunhild_DI_Erdmagie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brunhild_DI_Gestaendnis))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_DI_Amulett))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brunhild_DI_Erdmagie_Info()
{
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Erdmagie_15_00"); //Du kannst doch Felsen bewegen ...
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Erdmagie_17_01"); //Schon, wenn es kein ganzer Berg ist.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Erdmagie_15_02"); //Wir glauben, den Schatz gefunden zu haben. Aber massive Felswände versperren den Eingang.
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Erdmagie_15_03"); //Du könntest dich unverzichtbar machen bei uns.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Erdmagie_17_04"); //Das hat was. Wo ist der Schatz?
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Erdmagie_15_05"); //In den Höhlen. Ich führ dich hin.

	B_StartOtherRoutine	(self, "FOLLOW");

	self.aivar[AIV_Partymember] = TRUE;
};

INSTANCE Info_Mod_Brunhild_DI_Erdmagie2 (C_INFO)
{
	npc		= Mod_7642_OUT_Brunhild_DI;
	nr		= 1;
	condition	= Info_Mod_Brunhild_DI_Erdmagie2_Condition;
	information	= Info_Mod_Brunhild_DI_Erdmagie2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brunhild_DI_Erdmagie2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brunhild_DI_Erdmagie))
	&& (Npc_GetDistToWP(hero, "WP_DI_HOEHLE_02_TUNNEL_2") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brunhild_DI_Erdmagie2_Info()
{
	AI_Output(self, hero, "DEFAULT"); //
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Erdmagie2_15_00"); //Hier ist eine der Höhlen.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Erdmagie2_17_01"); //Aha. Und diese Wand meinst du? Sollte klappen.

	AI_PlayAni	(self, "T_MAGRUN_2_TRFSHOOT");

	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Erdmagie2_17_02"); //Hm. Ich schaffe es nicht. Seltsam ... da ist irgend ein Hindernis. Kein reales ... Starke Magie.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Erdmagie2_17_03"); //Vielleicht kann dieser Jones, der bei deinem Kapitän steht dabei helfen. Meine Kenntnisse über Bannzauber sind zu gering.

	Mod_DI_InselErkunden = 3;
};

INSTANCE Info_Mod_Brunhild_DI_Ende (C_INFO)
{
	npc		= Mod_7642_OUT_Brunhild_DI;
	nr		= 1;
	condition	= Info_Mod_Brunhild_DI_Ende_Condition;
	information	= Info_Mod_Brunhild_DI_Ende_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brunhild_DI_Ende_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jones_Ende))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brunhild_DI_Ende_Info()
{
	AI_Output(self, hero, "DEFAULT"); //
	AI_Output(hero, self, "Info_Mod_Brunhild_DI_Ende_15_00"); //Du solltest schon mal zurück aufs Schiff gehen, ich weiß nicht, was mich hinter dieser Wand noch so erwartet.
	AI_Output(self, hero, "Info_Mod_Brunhild_DI_Ende_17_01"); //Schade, deine Nähe hat so etwas beruhigendes.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "KUECHE");

	self.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Brunhild_DI_EXIT (C_INFO)
{
	npc		= Mod_7642_OUT_Brunhild_DI;
	nr		= 1;
	condition	= Info_Mod_Brunhild_DI_EXIT_Condition;
	information	= Info_Mod_Brunhild_DI_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brunhild_DI_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brunhild_DI_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};