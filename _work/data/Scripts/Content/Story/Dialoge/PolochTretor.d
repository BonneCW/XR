INSTANCE Info_Mod_Poloch_Hi (C_INFO)
{
	npc		= Mod_10048_Orc_Poloch_MT;
	nr		= 1;
	condition	= Info_Mod_Poloch_Hi_Condition;
	information	= Info_Mod_Poloch_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gibt es ein Problem bei euch? Ihr blickt nicht gerade zufrieden drein.";
};

FUNC INT Info_Mod_Poloch_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Poloch_Hi_Info()
{
	var C_NPC Poloch; Poloch = Hlp_GetNpc(Mod_10048_Orc_Poloch_MT);
	var C_NPC Tretor; Tretor = Hlp_GetNpc(Mod_10049_Orc_Tretor_MT);

	TRIA_Invite(Tretor);
	TRIA_Start();
	
	AI_Output(hero, self, "Info_Mod_Poloch_Hi_15_00"); //Gibt es ein Problem bei euch? Ihr blickt nicht gerade zufrieden drein.

	TRIA_Next(Tretor);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Hi_18_01"); //Das Problem sein Poloch. Er nicht wollen einsehen, dass Tretor der Stärkere.

	TRIA_Next(Poloch);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Hi_18_02"); //Dass Poloch nicht lachen! Es sein klar wie Flusswasser, dass Tretor sich nicht mit Poloch messen können.
	AI_Output(hero, self, "Info_Mod_Poloch_Hi_15_03"); //Dann tretet doch gegeneinander an! Ein kleiner Faustkampf wird die Sache schon klären.
	AI_Output(self, hero, "Info_Mod_Poloch_Hi_18_04"); //Poloch und Tretor haben vorhin gemacht, haben zwei Mahlzeiten lang gekämpft. Poloch nicht wissen, wie Tretor machen, aber er ihn nicht können besiegen.

	TRIA_Next(Tretor);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Hi_18_05"); //Poloch irgendwie schummeln, Tretor kriegen ihn nicht zu packen. Dann Tretor gehen die Luft aus und er müssen aufhören.

	TRIA_Next(Poloch);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Hi_18_06"); //Poloch auch brauchen Pause. Aber wenn wieder erholt, er Tretor zeigen!

	TRIA_Next(Tretor);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Hi_18_07"); //Tretor wollen das sehen!
	AI_Output(hero, self, "Info_Mod_Poloch_Hi_15_08"); //Verstehe ich das richtig? Ihr seid beide gleich stark, wollt es euch aber nicht eingestehen?
	AI_Output(self, hero, "Info_Mod_Poloch_Hi_18_09"); //Ohne Schummeln von Poloch Tretor wäre stärker!

	TRIA_Next(Poloch);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Hi_18_10"); //Poloch nicht schummeln, aber Tretor laufen immer davon wie ein feiger Hase.

	TRIA_Finish();

	Log_CreateTopic	(TOPIC_MOD_POLOCHTRETOR_SCHUMMLER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_POLOCHTRETOR_SCHUMMLER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_POLOCHTRETOR_SCHUMMLER, "Die Orks Poloch und Tretor stecken gerade mitten in einer persönlichen Auseinandersetzung. Wenn ich den Frieden in der Bergfestung wiederherstellen will, muss ich die beiden auseinanderbringen.");
};

INSTANCE Info_Mod_Poloch_Egal (C_INFO)
{
	npc		= Mod_10048_Orc_Poloch_MT;
	nr		= 1;
	condition	= Info_Mod_Poloch_Egal_Condition;
	information	= Info_Mod_Poloch_Egal_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist es nicht egal, wer stärker ist?";
};

FUNC INT Info_Mod_Poloch_Egal_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Poloch_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Poloch_Egal_Info()
{
	var C_NPC Poloch; Poloch = Hlp_GetNpc(Mod_10048_Orc_Poloch_MT);
	var C_NPC Tretor; Tretor = Hlp_GetNpc(Mod_10049_Orc_Tretor_MT);

	TRIA_Invite(Tretor);
	TRIA_Start();
	
	AI_Output(hero, self, "Info_Mod_Poloch_Egal_15_00"); //Ist es nicht egal, wer stärker ist?

	TRIA_Next(Tretor);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Egal_18_01"); //Tretor sein egal, aber Poloch geben die ganze Zeit mit seiner Stärke an, bis Tretor genervt. Sagen, dass Poloch sollen aufhören, aber tun nicht.

	TRIA_Next(Poloch);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Egal_18_02"); //Tretor schon wieder lügen! Poloch nie haben angegeben, sondern Tretor haben gestichelt, dass Poloch dürre Ärmchen, und dann Poloch zeigen seine Kraft.

	TRIA_Next(Tretor);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Egal_18_03"); //Tretor haben nicht gestichelt, sein Erfindung von Poloch!
	
	AI_TurnAway(hero, self);
	
	AI_Output(hero, self, "Info_Mod_Poloch_Egal_15_04"); //(zu sich selbst) Ich sehe schon, mit Diplomatie komme ich hier nicht weit.
	
	AI_TurnToNpc(hero, self);

	TRIA_Finish();
};

INSTANCE Info_Mod_Poloch_IAmStronger (C_INFO)
{
	npc		= Mod_10048_Orc_Poloch_MT;
	nr		= 1;
	condition	= Info_Mod_Poloch_IAmStronger_Condition;
	information	= Info_Mod_Poloch_IAmStronger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ihr seid ja Witzfiguren. Ich bin natürlich der Stärkste!";
};

FUNC INT Info_Mod_Poloch_IAmStronger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Poloch_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Poloch_IAmStronger_Info()
{
	var C_NPC Poloch; Poloch = Hlp_GetNpc(Mod_10048_Orc_Poloch_MT);
	var C_NPC Tretor; Tretor = Hlp_GetNpc(Mod_10049_Orc_Tretor_MT);

	TRIA_Invite(Tretor);
	TRIA_Start();
	
	AI_Output(hero, self, "Info_Mod_Poloch_IAmStronger_15_00"); //Ihr seid ja Witzfiguren. Ich bin natürlich der Stärkste!
	
	TRIA_Next(Poloch);
	
	AI_Output(self, hero, "Info_Mod_Poloch_IAmStronger_18_01"); //(lacht laut) Mensch machen auch Späße.
	AI_Output(hero, self, "Info_Mod_Poloch_IAmStronger_15_02"); //Ich meine es ernst. Im Kampf bin ich stärker als ihr beiden Luschen zusammen.

	TRIA_Next(Tretor);
	
	AI_Output(self, hero, "Info_Mod_Poloch_IAmStronger_18_03"); //Tretor finden gar nicht mehr lustig. Mensch sofort aufhören.
	
	TRIA_Next(Poloch);
	
	AI_Output(self, hero, "Info_Mod_Poloch_IAmStronger_18_04"); //Poloch müssen Tretor da zustimmen.

	TRIA_Finish();
};

INSTANCE Info_Mod_Poloch_Noobs (C_INFO)
{
	npc		= Mod_10048_Orc_Poloch_MT;
	nr		= 1;
	condition	= Info_Mod_Poloch_Noobs_Condition;
	information	= Info_Mod_Poloch_Noobs_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ihr Schwächlinge seid nur ganz kleine Töne im Konzert der Großen.";
};

FUNC INT Info_Mod_Poloch_Noobs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Poloch_IAmStronger))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Poloch_Noobs_Info()
{
	var C_NPC Poloch; Poloch = Hlp_GetNpc(Mod_10048_Orc_Poloch_MT);
	var C_NPC Tretor; Tretor = Hlp_GetNpc(Mod_10049_Orc_Tretor_MT);

	TRIA_Invite(Tretor);
	TRIA_Start();
	
	AI_Output(hero, self, "Info_Mod_Poloch_Noobs_15_00"); //Ihr Schwächlinge seid nur ganz kleine Töne im Konzert der Großen.
	
	TRIA_Next(Tretor);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Noobs_18_01"); //Das reichen! Mensch schreien nach einer Abreibung!

	TRIA_Next(Poloch);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Noobs_18_02"); //Poloch werden ihm alle seine Knochen brechen!

	TRIA_Finish();
	
	AI_StopProcessInfos	(self);
	
	Mod_PolochTretor = 1;
};

INSTANCE Info_Mod_Poloch_Won (C_INFO)
{
	npc		= Mod_10048_Orc_Poloch_MT;
	nr		= 1;
	condition	= Info_Mod_Poloch_Won_Condition;
	information	= Info_Mod_Poloch_Won_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe nicht übertrieben, wie ihr gesehen habt.";
};

FUNC INT Info_Mod_Poloch_Won_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Poloch_Noobs))
	&& (Mod_PolochTretor == 3)
	&& (Mod_Poloch_Beat && Mod_Tretor_Beat)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Poloch_Won_Info()
{
	var C_NPC Poloch; Poloch = Hlp_GetNpc(Mod_10048_Orc_Poloch_MT);
	var C_NPC Tretor; Tretor = Hlp_GetNpc(Mod_10049_Orc_Tretor_MT);

	TRIA_Invite(Tretor);
	TRIA_Start();
	
	AI_Output(hero, self, "Info_Mod_Poloch_Won_15_00"); //Ich habe nicht übertrieben, wie ihr gesehen habt.
	AI_Output(hero, self, "Info_Mod_Poloch_Won_15_01"); //Und jetzt lasst eure kindischen Spielchen und helft lieber mit, die Bergfestung herzurichten.
	
	TRIA_Next(Tretor);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Won_18_02"); //(unterwürfig) Mensch haben Tretor und Poloch besiegt. Sie müssen sich seinem Willen beugen.

	TRIA_Next(Poloch);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Won_18_03"); //Poloch sehen ein, dass dumm von ihm, mit Tretor zu streiten. Er sich wollen versöhnen.
	
	TRIA_Next(Tretor);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Won_18_04"); //Tretor nehmen Angebot an.
	AI_Output(hero, self, "Info_Mod_Poloch_Won_15_05"); //Dann können wir uns ja jetzt wichtigen Dingen zuwenden.

	TRIA_Finish();
	
	B_GivePlayerXP(200);
	B_SetTopicStatus	(TOPIC_MOD_POLOCHTRETOR_SCHUMMLER, LOG_SUCCESS);

	CurrentNQ += 1;
	
	AI_StopProcessInfos	(self);
	
	Mod_PolochTretor = 4;
};

INSTANCE Info_Mod_Poloch_Lost (C_INFO)
{
	npc		= Mod_10048_Orc_Poloch_MT;
	nr		= 1;
	condition	= Info_Mod_Poloch_Lost_Condition;
	information	= Info_Mod_Poloch_Lost_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Poloch_Lost_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Poloch_Noobs))
	&& (Mod_PolochTretor == 3)
	&& (Mod_Poloch_Beat == 0 || Mod_Tretor_Beat == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Poloch_Lost_Info()
{
	var C_NPC Poloch; Poloch = Hlp_GetNpc(Mod_10048_Orc_Poloch_MT);
	var C_NPC Tretor; Tretor = Hlp_GetNpc(Mod_10049_Orc_Tretor_MT);

	TRIA_Invite(Tretor);
	TRIA_Start();

	TRIA_Next(Poloch);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Lost_18_02"); //Großes Maul von Mensch jetzt gestopft. Tretor haben gut geholfen.
	
	TRIA_Next(Tretor);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Lost_18_01"); //Poloch und Tretor zusammen unbesiegbar.

	TRIA_Next(Poloch);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Lost_18_02"); //Poloch sehen ein, dass dumm von ihm, mit Tretor zu streiten. Er sich wollen versöhnen.
	
	TRIA_Next(Tretor);
	
	AI_Output(self, hero, "Info_Mod_Poloch_Lost_18_01"); //Tretor nehmen Angebot an.
	AI_Output(hero, self, "Info_Mod_Poloch_Lost_15_00"); //Dann können wir uns ja jetzt wichtigen Dingen zuwenden.

	TRIA_Finish();
	
	B_GivePlayerXP(100);
	B_SetTopicStatus	(TOPIC_MOD_POLOCHTRETOR_SCHUMMLER, LOG_SUCCESS);

	CurrentNQ += 1;
	
	AI_StopProcessInfos	(self);
	
	Mod_PolochTretor = 4;
};

INSTANCE Info_Mod_Poloch_EXIT (C_INFO)
{
	npc		= Mod_10048_Orc_Poloch_MT;
	nr		= 1;
	condition	= Info_Mod_Poloch_EXIT_Condition;
	information	= Info_Mod_Poloch_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Poloch_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Poloch_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};