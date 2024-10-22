INSTANCE Info_Mod_Gnom_Hi (C_INFO)
{
	npc		= Gnom_11005_NW;
	nr		= 1;
	condition	= Info_Mod_Gnom_Hi_Condition;
	information	= Info_Mod_Gnom_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gnom_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gnom_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Gnom_Hi_11_00"); //Hallo, Mensch. Lange keinen mehr von deiner Sorte gesehen ...
	AI_Output(self, hero, "Info_Mod_Gnom_Hi_11_01"); //Na ja, wie dem auch sei, nach dem ganzen Gesöff hätte ich mal wieder Lust was zu rauchen.
	AI_Output(self, hero, "Info_Mod_Gnom_Hi_11_02"); //Du hast doch bestimmt was bei dir.
};

INSTANCE Info_Mod_Gnom_Joint (C_INFO)
{
	npc		= Gnom_11005_NW;
	nr		= 1;
	condition	= Info_Mod_Gnom_Joint_Condition;
	information	= Info_Mod_Gnom_Joint_Info;
	permanent	= 0;
	important	= 0;
	description	= "Klar, hier ein harziger Stängel.";
};

FUNC INT Info_Mod_Gnom_Joint_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gnom_Hi))
	&& (Npc_HasItems(hero, ItMi_Joint) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gnom_Joint_Info()
{
	AI_Output(hero, self, "Info_Mod_Gnom_Joint_15_00"); //Klar, hier ein harziger Stängel.

	B_GiveInvItems	(hero, self, ItMi_Joint, 1);

	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_01"); //Ahh, vielen Dank.

	B_UseItem	(self, ItMi_Joint);

	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_02"); //Nach 5000 Jahren ist es wirklich ein Genuss, mal wieder einen zu rauchen.
	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_03"); //Ja, das magische Gefängnis war wirklich eine Zeit voller Entbehrungen.
	AI_Output(hero, self, "Info_Mod_Gnom_Joint_15_04"); //Das magische Gefängnis? Erzähl mir mehr darüber.
	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_05"); //Dieses verfluchte Buch, in welchem wir gefangen waren.
	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_06"); //Zumindest gab es dort viel Raum, mehr, als man von außen vermuten konnte.
	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_07"); //So stand man sich nicht die ganze Zeit mit Kobolden, Hexen und Drachen auf den Füßen.
	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_08"); //Der Drache Dragon und Lich, der untote Magier, haben sich schnell zu den großen Bossen gemacht.
	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_09"); //Haben auch nach einigen Jahrhunderten irgendeinen magischen Pakt oder so geschlossen ...
	AI_Output(hero, self, "Info_Mod_Gnom_Joint_15_10"); //Magischer Pakt? Worum ging es da?
	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_11"); //Ach, was weiß ich. Unsterblichkeit gegen Drachenmacht und Dienerschaft oder so. Hat mich nicht so interessiert.
	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_12"); //Mein Kumpel Gormgniez hat da mehr mit den anderen zu tun gehabt und so manches aufgeschnappt.
	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_13"); //Der gierige Kobold ist aber ins Tal des Erzes aufgebrochen, um seine Taschen in irgend einer Kesselmine  mit dem edlen Metall zu füllen ...
	AI_Output(hero, self, "Info_Mod_Gnom_Joint_15_14"); //Und wo sind die beiden jetzt?
	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_15"); //Öhh, Lich wollte zur Stadt oder einige Höhlengräber schänden oder so ähnlich.
	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_16"); //Und Dragon hat sich, glaube ich, nicht unweit von dem Ort unserer Befreiung in die Berge verzogen, will jetzt ein paar neue Diener anheuern ...
	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_17"); //Ach, jetzt merke ich, wie mir der Kopf von dem Gesöff allmählich schwer wird.
	AI_Output(self, hero, "Info_Mod_Gnom_Joint_11_18"); //Hast du vielleicht noch zehn von diesen Stängeln für mich? Die waren mir viel bekömmlicher.

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Im Gespräch mit dem betrunkenen Gnom habe ich erfahren, dass der untote Magier Lich und ein Drache namens Dragon ein magisches Bündnis eingegangen sind. Der Austausch von Unsterblichkeit gegen Drachenmacht und Dienerkreaturen scheint eine Rolle zu spielen.");
	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Der Gnom erzählte mir noch, dass sein Freund, ein Kobold, mehr zu dem Thema wüsste. Dieser brach jedoch ins Minental auf, um seine Gier nach magischem Erz zu stillen. Dabei wollte er die Mine in einem Talkessel aufsuchen. Ich sollte Lee mal um Zugang zur freien Mine fragen.");
};

INSTANCE Info_Mod_Gnom_Joints (C_INFO)
{
	npc		= Gnom_11005_NW;
	nr		= 1;
	condition	= Info_Mod_Gnom_Joints_Condition;
	information	= Info_Mod_Gnom_Joints_Info;
	permanent	= 0;
	important	= 0;
	description	= "Klar, hier sind sie.";
};

FUNC INT Info_Mod_Gnom_Joints_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gnom_Joint))
	&& (Npc_HasItems(hero, ItMi_Joint) >= 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gnom_Joints_Info()
{
	AI_Output(hero, self, "Info_Mod_Gnom_Joints_15_00"); //Klar, hier sind sie.

	B_GiveInvItems	(hero, self, ItMi_Joint, 10);

	AI_Output(self, hero, "Info_Mod_Gnom_Joints_11_01"); //Ahh, tausend Dank. Wie kann ich dir das nur vergelten.
	AI_Output(self, hero, "Info_Mod_Gnom_Joints_11_02"); //Ach, hier, nimm dieses Paket mit dem Gesöff, was ich bei der Taverne mitgehen lassen habe.

	B_GiveInvItems	(self, hero, ItMi_OrlansSchnaps, 1);
};

INSTANCE Info_Mod_Gnom_NoJoint (C_INFO)
{
	npc		= Gnom_11005_NW;
	nr		= 1;
	condition	= Info_Mod_Gnom_NoJoint_Condition;
	information	= Info_Mod_Gnom_NoJoint_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sonst noch irgendwelche Neujahrswünsche, du halbe Portion?";
};

FUNC INT Info_Mod_Gnom_NoJoint_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gnom_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gnom_Joint))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gnom_NoJoint_Info()
{
	AI_Output(hero, self, "Info_Mod_Gnom_NoJoint_15_00"); //Sonst noch irgendwelche Neujahrswünsche, du halbe Portion?
	AI_Output(self, hero, "Info_Mod_Gnom_NoJoint_11_01"); //Hüte deine Zunge, Mensch, und lass was zu rauchen rüberwachsen. Sonst wird es dir schlecht ergehen.
};

INSTANCE Info_Mod_Gnom_NoJoint2 (C_INFO)
{
	npc		= Gnom_11005_NW;
	nr		= 1;
	condition	= Info_Mod_Gnom_NoJoint2_Condition;
	information	= Info_Mod_Gnom_NoJoint2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ja, natürlich. Geh lieber Blumen pflücken, du Zwerg.";
};

FUNC INT Info_Mod_Gnom_NoJoint2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gnom_NoJoint))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gnom_Joint))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gnom_NoJoint2_Info()
{
	AI_Output(hero, self, "Info_Mod_Gnom_NoJoint2_15_00"); //Ja, natürlich. Geh lieber Blumen pflücken, du Zwerg.
	AI_Output(self, hero, "Info_Mod_Gnom_NoJoint2_11_01"); //Ok, das war’s.
	AI_Output(hero, self, "Info_Mod_Gnom_NoJoint2_15_02"); //Dann bin ich aber mal ge ...

	AI_EquipBestMeleeWeapon	(self);

	AI_DrawWeapon	(self);

	AI_Output(hero, self, "Info_Mod_Gnom_NoJoint2_15_03"); //... ohh.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

INSTANCE Info_Mod_Gnom_Verbatscht (C_INFO)
{
	npc		= Gnom_11005_NW;
	nr		= 1;
	condition	= Info_Mod_Gnom_Verbatscht_Condition;
	information	= Info_Mod_Gnom_Verbatscht_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gnom_Verbatscht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gnom_NoJoint2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gnom_Verbatscht_Info()
{
	AI_Output(self, hero, "Info_Mod_Gnom_Verbatscht_11_01"); //Na, willst du dich noch mal mit mir anlegen?
};

INSTANCE Info_Mod_Gnom_EXIT (C_INFO)
{
	npc		= Gnom_11005_NW;
	nr		= 1;
	condition	= Info_Mod_Gnom_EXIT_Condition;
	information	= Info_Mod_Gnom_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gnom_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gnom_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};