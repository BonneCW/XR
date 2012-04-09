INSTANCE Info_Mod_Cirio_Hi (C_INFO)
{
	npc		= Mod_7405_OUT_Cirio_REL;
	nr		= 1;
	condition	= Info_Mod_Cirio_Hi_Condition;
	information	= Info_Mod_Cirio_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cirio_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cirio_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Cirio_Hi_09_00"); //He, Fremder, was führt dich nach Relendel?
	AI_Output(hero, self, "Info_Mod_Cirio_Hi_15_01"); //Warum willst du das wissen?
	AI_Output(self, hero, "Info_Mod_Cirio_Hi_09_02"); //Nun ja, ich hab ein kleines Rattenproblem, und du siehst aus, als könntest du damit fertig werden.
	AI_Output(hero, self, "Info_Mod_Cirio_Hi_15_03"); //Na gut, was soll ich denn genau für dich machen?
	AI_Output(self, hero, "Info_Mod_Cirio_Hi_09_04"); //Vor ein paar Tagen, als ich in die Stadt gegangen bin, um Nahrungsmittel zu kaufen, hat sich ein Haufen Ratten in meinem Haus breit gemacht.
	AI_Output(self, hero, "Info_Mod_Cirio_Hi_09_05"); //Diese verdammten Viecher zerfressen mir noch mein ganzes Haus, und es sind einfach zu viele für mich allein.
	AI_Output(hero, self, "Info_Mod_Cirio_Hi_15_06"); //Ich denke, mit ein paar Ratten werde ich schon fertig.
	AI_Output(self, hero, "Info_Mod_Cirio_Hi_09_07"); //Danke, Fremder, ich führe dich zu meinem Haus.
	AI_Output(hero, self, "Info_Mod_Cirio_Hi_15_08"); //Ok, gehen wir!

	Log_CreateTopic	(TOPIC_MOD_RATTENQUEST, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_RATTENQUEST, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_RATTENQUEST, "Cirio hat in seinem Haus ein kleines Rattenproblem. Er bat mich, ihm dabei zu helfen, und führt mich nun dorthin.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDE");
};

INSTANCE Info_Mod_Cirio_AtHaus (C_INFO)
{
	npc		= Mod_7405_OUT_Cirio_REL;
	nr		= 1;
	condition	= Info_Mod_Cirio_AtHaus_Condition;
	information	= Info_Mod_Cirio_AtHaus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cirio_AtHaus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cirio_Hi))
	&& (Npc_GetDistToWP(hero, "REL_SURFACE_085") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cirio_AtHaus_Info()
{
	AI_Output(self, hero, "Info_Mod_Cirio_AtHaus_09_00"); //Gut, da wären wir. Du meintest ja, du würden mit ihnen alleine klar kommen. Ich halte ihnen so lange den Rücken frei, nicht dass noch mehr von diesen Viechern kommen.
	AI_Output(hero, self, "Info_Mod_Cirio_AtHaus_15_01"); //In Ordnung, aber umsonst mach' ich das nicht.
	AI_Output(self, hero, "Info_Mod_Cirio_AtHaus_09_02"); //Na ja, viel Gold hab ich nicht mehr dabei, aber wenn du die Ratten für mich tötest, bekommst du 200 Gold aus meinem Tresor. Hier hast du schon mal 20 Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 20);

	AI_Output(hero, self, "Info_Mod_Cirio_AtHaus_15_03"); //200 Gold klingt gut, dein Rattenproblem ist schon Geschichte.

	B_LogEntry	(TOPIC_MOD_RATTENQUEST, "Cirio hat mich zu seinem Haus gebracht, und ich werde mich nun um die Ratten kümmern.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "WAIT");

	Wld_InsertNpc	(Giant_Rat_Cirio, "REL_SURFACE_085");
	Wld_InsertNpc	(Giant_Rat_Cirio, "REL_SURFACE_085");
	Wld_InsertNpc	(Giant_Rat_Cirio, "REL_SURFACE_085");
	Wld_InsertNpc	(Giant_Rat_Cirio, "REL_SURFACE_085");
	Wld_InsertNpc	(Giant_Rat_Cirio, "REL_SURFACE_085");
	Wld_InsertNpc	(Giant_Rat_Cirio, "REL_SURFACE_085");
	Wld_InsertNpc	(Giant_Rat_Cirio, "REL_SURFACE_085");
	Wld_InsertNpc	(Giant_Rat_Cirio, "REL_SURFACE_085");
	Wld_InsertNpc	(Giant_Rat_Cirio, "REL_SURFACE_085");
	Wld_InsertNpc	(Giant_Rat_Cirio, "REL_SURFACE_085");
	Wld_InsertNpc	(Giant_Rat_Cirio, "REL_SURFACE_085");
	Wld_InsertNpc	(Giant_Rat_Cirio, "REL_SURFACE_085");
};

INSTANCE Info_Mod_Cirio_RattenErledigt (C_INFO)
{
	npc		= Mod_7405_OUT_Cirio_REL;
	nr		= 1;
	condition	= Info_Mod_Cirio_RattenErledigt_Condition;
	information	= Info_Mod_Cirio_RattenErledigt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cirio_RattenErledigt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cirio_AtHaus))
	&& (Npc_IsDead(Giant_Rat_Cirio))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cirio_RattenErledigt_Info()
{
	AI_Output(self, hero, "Info_Mod_Cirio_RattenErledigt_09_00"); //Du hast sie also alle getötet, beachtlich. Schade nur, dass sie dir nun in den Rücken fallen.
	AI_Output(hero, self, "Info_Mod_Cirio_RattenErledigt_15_01"); //Was soll das, du hast doch gesagt, du hältst mir den Rücken frei.
	AI_Output(self, hero, "Info_Mod_Cirio_RattenErledigt_09_02"); //Ich sagte, ich halte IHNEN den Rücken frei. Ich hatte gehofft, meine Freunde würden alleine mit dir fertig werden, aber das ist jetzt auch egal, denn für mich bist du nur Futter.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TRANSFORM");

	Wld_InsertNpc	(Mod_7406_OUT_Mann_REL, "REL_SURFACE_105");
	B_KillNpc	(Mod_7406_OUT_Mann_REL);

	Wld_InsertNpc	(Giant_Rat, "REL_SURFACE_098");
	Wld_InsertNpc	(Giant_Rat, "REL_SURFACE_098");
	Wld_InsertNpc	(Giant_Rat, "REL_SURFACE_099");
	Wld_InsertNpc	(Giant_Rat, "REL_SURFACE_100");
	Wld_InsertNpc	(Giant_Rat, "REL_SURFACE_102");
	Wld_InsertNpc	(Giant_Rat, "REL_SURFACE_100");
	Wld_InsertNpc	(Giant_Rat, "REL_SURFACE_102");
	Wld_InsertNpc	(Giant_Rat, "REL_SURFACE_103");
	Wld_InsertNpc	(Giant_Rat, "REL_SURFACE_103");
	Wld_InsertNpc	(Giant_Rat, "REL_SURFACE_103");
};

INSTANCE Info_Mod_Cirio_EXIT (C_INFO)
{
	npc		= Mod_7405_OUT_Cirio_REL;
	nr		= 1;
	condition	= Info_Mod_Cirio_EXIT_Condition;
	information	= Info_Mod_Cirio_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Cirio_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cirio_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};