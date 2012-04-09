INSTANCE Info_Mod_Leprechaun_XW_Hi (C_INFO)
{
	npc		= Monster_11074_Leprechaun_XW;
	nr		= 1;
	condition	= Info_Mod_Leprechaun_XW_Hi_Condition;
	information	= Info_Mod_Leprechaun_XW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Leprechaun_XW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Leprechaun_XW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Leprechaun_XW_Hi_20_00"); //Schon wieder ein Neuer! Ha, dich kennt Leprechaun doch!
};

INSTANCE Info_Mod_Leprechaun_XW_Antworten (C_INFO)
{
	npc		= Monster_11074_Leprechaun_XW;
	nr		= 1;
	condition	= Info_Mod_Leprechaun_XW_Antworten_Condition;
	information	= Info_Mod_Leprechaun_XW_Antworten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist mir ein paar Antworten schuldig.";
};

FUNC INT Info_Mod_Leprechaun_XW_Antworten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Leprechaun_XW_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Leprechaun_XW_Antworten_Info()
{
	AI_Output(hero, self, "Info_Mod_Leprechaun_XW_Antworten_15_00"); //Du bist mir ein paar Antworten schuldig.
	AI_Output(self, hero, "Info_Mod_Leprechaun_XW_Antworten_20_01"); //Er kann sich nicht erinnern, dir etwas zu schulden. Der Steinwächter sollte doch alles beglichen haben. (lacht meckernd)
};

INSTANCE Info_Mod_Leprechaun_XW_TuerAuf (C_INFO)
{
	npc		= Monster_11074_Leprechaun_XW;
	nr		= 1;
	condition	= Info_Mod_Leprechaun_XW_TuerAuf_Condition;
	information	= Info_Mod_Leprechaun_XW_TuerAuf_Info;
	permanent	= 0;
	important	= 0;
	description	= "Willst du nicht die Tür aufmachen?";
};

FUNC INT Info_Mod_Leprechaun_XW_TuerAuf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Leprechaun_XW_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Leprechaun_XW_TuerAuf_Info()
{
	AI_Output(hero, self, "Info_Mod_Leprechaun_XW_TuerAuf_15_00"); //Willst du nicht die Tür aufmachen? Ich tu dir auch nichts.
	AI_Output(self, hero, "Info_Mod_Leprechaun_XW_TuerAuf_20_01"); //Ja, wieso eigentlich nicht? Er müsste ja nur den Schlüssel hervorholen, den er immer bei sich hat, ihn in das Schloss stecken und drei Mal umdrehen - stimmt's?
	AI_Output(self, hero, "Info_Mod_Leprechaun_XW_TuerAuf_20_02"); //Keine schwierige Aufgabe also. Dazu wäre sogar er in der Lage.
	AI_Output(self, hero, "Info_Mod_Leprechaun_XW_TuerAuf_20_03"); //Aber weißt du was? So würde das doch gar keinen Spaß machen!
};

INSTANCE Info_Mod_Leprechaun_XW_EXIT (C_INFO)
{
	npc		= Monster_11074_Leprechaun_XW;
	nr		= 1;
	condition	= Info_Mod_Leprechaun_XW_EXIT_Condition;
	information	= Info_Mod_Leprechaun_XW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Leprechaun_XW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Leprechaun_XW_EXIT_Info()
{
	AI_Output(self, hero, "Info_Mod_Leprechaun_XW_EXIT_20_00"); //Jetzt gibt's noch lecker Happi-Happi und dann muss Leprechaun auch schon wieder gehen.
	AI_Output(self, hero, "Info_Mod_Leprechaun_XW_EXIT_20_01"); //Er wünscht euch einen gesegneten Appetit. Hähähä!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};