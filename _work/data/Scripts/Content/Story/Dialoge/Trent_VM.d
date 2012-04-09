INSTANCE Info_Mod_Trent_VM_Hi (C_INFO)
{
	npc		= Mod_7630_RIT_Trent_VM;
	nr		= 1;
	condition	= Info_Mod_Trent_VM_Hi_Condition;
	information	= Info_Mod_Trent_VM_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Trent_VM_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Granmar_VM_Trent))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Trent_VM_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Trent_VM_Hi_06_00"); //Wobei soll ich dir denn genau hier helfen?
	AI_Output(hero, self, "Info_Mod_Trent_VM_Hi_15_01"); //Am besten folgst du mir erst mal ein wenig tiefer in die Mine.
	AI_Output(self, hero, "Info_Mod_Trent_VM_Hi_06_02"); //In Ordnung.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTONAGER");
	B_StartOtherRoutine	(Mod_7625_KGD_Granmar_VM, "START");
};

INSTANCE Info_Mod_Trent_VM_BrauchenLicht (C_INFO)
{
	npc		= Mod_7630_RIT_Trent_VM;
	nr		= 1;
	condition	= Info_Mod_Trent_VM_BrauchenLicht_Condition;
	information	= Info_Mod_Trent_VM_BrauchenLicht_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Trent_VM_BrauchenLicht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trent_VM_Hi))
	&& (Npc_GetDistToWP(self, "MINE_GO_37") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Trent_VM_BrauchenLicht_Info()
{
	AI_Output(self, hero, "Info_Mod_Trent_VM_BrauchenLicht_06_00"); //Mhm, hier scheint ein merkwürdiger Windzug zu herrschen. Normale Fackeln werden hier wahrscheinlich nicht funktionieren.
	AI_Output(self, hero, "Info_Mod_Trent_VM_BrauchenLicht_06_01"); //Ich glaube, ich weiß, was wir hier brauchen. Ich hatte mich schon gefragt, wann ich die Runen mal wirklich brauche.
	AI_Output(hero, self, "Info_Mod_Trent_VM_BrauchenLicht_15_02"); //Was für eine Rune meinst du?
	AI_Output(self, hero, "Info_Mod_Trent_VM_BrauchenLicht_06_03"); //Die Lichtrune, die man als Ritter bekommt. Mit ihr werden wir in der Dunkelheit keine Probleme haben.

	B_LogEntry	(TOPIC_MOD_KG_STEINMONSTER, "Trent will seine Lichtrune einsetzen, um uns Licht im rechten Tunnel zu spenden.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETONAGER");

	B_Attack	(self, hero, AR_None, 0);
};

INSTANCE Info_Mod_Trent_VM_AtFirstNager (C_INFO)
{
	npc		= Mod_7630_RIT_Trent_VM;
	nr		= 1;
	condition	= Info_Mod_Trent_VM_AtFirstNager_Condition;
	information	= Info_Mod_Trent_VM_AtFirstNager_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Trent_VM_AtFirstNager_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trent_VM_BrauchenLicht))
	&& (Npc_GetDistToWP(self, "MINE_GO_43") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Trent_VM_AtFirstNager_Info()
{
	AI_Output(self, hero, "Info_Mod_Trent_VM_AtFirstNager_06_00"); //Mhm, diese Monster kommen mir bekannt vor.

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Trent_VM_AtFirstNager_06_01"); //Ja, genau, derartige Monster sind mir schon in einer Höhle in Varant auf gefallen.
	AI_Output(self, hero, "Info_Mod_Trent_VM_AtFirstNager_06_02"); //Allerdings war es dort eine Goldmine und die Nager waren wesentlich kleiner als diese hier.
	AI_Output(self, hero, "Info_Mod_Trent_VM_AtFirstNager_06_03"); //Wenn ich mich nicht irre, dürften sie auch eine Königin haben. Also lass uns weiter gehen.

	B_LogEntry	(TOPIC_MOD_KG_STEINMONSTER, "Trent meint, er kenne die Erznager bereits aus Varant, auch wenn sie dort kleiner sind. Er vermutet auch eine Königin hier in der Mine.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETONAGER2");
};

INSTANCE Info_Mod_Trent_VM_AtSecondNager (C_INFO)
{
	npc		= Mod_7630_RIT_Trent_VM;
	nr		= 1;
	condition	= Info_Mod_Trent_VM_AtSecondNager_Condition;
	information	= Info_Mod_Trent_VM_AtSecondNager_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Trent_VM_AtSecondNager_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trent_VM_AtFirstNager))
	&& (Npc_GetDistToWP(self, "MINE_GO_45") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Trent_VM_AtSecondNager_Info()
{
	AI_Output(self, hero, "Info_Mod_Trent_VM_AtSecondNager_06_00"); //Kannst du das auch hören?! Ich glaube die Königin ist sehr nah, sie wird auch einige ihrer Kinder um sich geschart haben.
	AI_Output(self, hero, "Info_Mod_Trent_VM_AtSecondNager_06_01"); //Ich warte hier, falls du noch etwas benötigst ist jetzt die letzte Möglichkeit.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "WAITATNAGER2");
};

INSTANCE Info_Mod_Trent_VM_KillQueen (C_INFO)
{
	npc		= Mod_7630_RIT_Trent_VM;
	nr		= 1;
	condition	= Info_Mod_Trent_VM_KillQueen_Condition;
	information	= Info_Mod_Trent_VM_KillQueen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin bereit, erledigen wir sie!";
};

FUNC INT Info_Mod_Trent_VM_KillQueen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trent_VM_AtSecondNager))
	&& (Npc_GetDistToWP(self, "MINE_GO_45") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Trent_VM_KillQueen_Info()
{
	AI_Output(hero, self, "Info_Mod_Trent_VM_KillQueen_15_00"); //Ich bin bereit, erledigen wir sie!
	AI_Output(self, hero, "Info_Mod_Trent_VM_KillQueen_06_01"); //Dann los!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETOQUEEN");
};

INSTANCE Info_Mod_Trent_VM_QueenDead (C_INFO)
{
	npc		= Mod_7630_RIT_Trent_VM;
	nr		= 1;
	condition	= Info_Mod_Trent_VM_QueenDead_Condition;
	information	= Info_Mod_Trent_VM_QueenDead_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Trent_VM_QueenDead_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trent_VM_KillQueen))
	&& (Npc_GetDistToWP(self, "MINE_GO_53") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Trent_VM_QueenDead_Info()
{
	AI_Output(self, hero, "Info_Mod_Trent_VM_QueenDead_06_00"); //So, das Vieh wird sich im nächsten Leben zweimal überlegen, wo es seine Eier legt. Mal sehen, was es alles interessantes gefressen hat.

	AI_GotoNpc	(self, ErznagerQueen);
	AI_TurnToNpc	(self, ErznagerQueen);
	AI_PlayAni	(self, "T_PLUNDER");

	AI_GotoNpc	(self, hero);
	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Trent_VM_QueenDead_06_01"); //Seltsam ... so etwas habe ich noch nie gesehen.

	self.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Trent_VM_AfterQueen (C_INFO)
{
	npc		= Mod_7630_RIT_Trent_VM;
	nr		= 1;
	condition	= Info_Mod_Trent_VM_AfterQueen_Condition;
	information	= Info_Mod_Trent_VM_AfterQueen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alles in Ordnung mit dir?";
};

FUNC INT Info_Mod_Trent_VM_AfterQueen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trent_VM_QueenDead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Trent_VM_AfterQueen_Info()
{
	AI_Output(hero, self, "Info_Mod_Trent_VM_AfterQueen_15_00"); //Alles in Ordnung mit dir?

	Wld_PlayEffect("spellFX_Fear", self, self, 0, 0, 0, FALSE);

	AI_Output(self, hero, "Info_Mod_Trent_VM_AfterQueen_06_01"); //Es gehört mir, verstanden! Keiner darf erfahren, dass ich es besitze.
	AI_Output(self, hero, "Info_Mod_Trent_VM_AfterQueen_06_02"); //(zu sich selbst) Warum sollte ich ein Risiko eingehen?! Ein Opfer wird mir womöglich seine gesammte Macht zugänglich machen.

	CreateInvItems	(self, ItMi_SchwarzesErz_Trent, 1);

	B_LogEntry	(TOPIC_MOD_KG_STEINMONSTER, "Trent ist durchgedreht und greift mich an. Ich sollte ihn erst mal K.O. schlagen und dann sehen, was mit ihm los ist.");

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

INSTANCE Info_Mod_Trent_VM_AfterQueenAttack (C_INFO)
{
	npc		= Mod_7630_RIT_Trent_VM;
	nr		= 1;
	condition	= Info_Mod_Trent_VM_AfterQueenAttack_Condition;
	information	= Info_Mod_Trent_VM_AfterQueenAttack_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Trent_VM_AfterQueenAttack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trent_VM_AfterQueen))
	&& (Npc_HasItems(hero, ItMi_SchwarzesErz_Trent) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Trent_VM_AfterQueenAttack_Info()
{
	AI_Output(self, hero, "DEFAULT"); //
	AI_Output(hero, self, "Info_Mod_Trent_VM_AfterQueenAttack_15_00"); //Langsam habe ich genug von Kerlen, die in dunklen Höhlen den Verstand verlieren.
	AI_Output(self, hero, "Info_Mod_Trent_VM_AfterQueenAttack_06_01"); //Was ist passiert?
	AI_Output(hero, self, "Info_Mod_Trent_VM_AfterQueenAttack_15_02"); //Das schwarze Erz hier hat dich ziemlich durchdrehen lassen. Komisch, denn bei mir zeigt es scheinbar keine Wirkung.
	AI_Output(self, hero, "Info_Mod_Trent_VM_AfterQueenAttack_06_03"); //Ich hab schon viel dunkle Magie erlebt, dass diese allerdings eines Tages mich treffen würde, habe ich nicht erwartet.
	AI_Output(self, hero, "Info_Mod_Trent_VM_AfterQueenAttack_06_04"); //Auf jeden Fall danke ich dir. An solchen magischen Artefakten kann man ganz schön zu Grunde gehen.
	AI_Output(self, hero, "Info_Mod_Trent_VM_AfterQueenAttack_06_05"); //Ich denke, ich setz mich erst mal ein wenig von der Gruppe ab und denke über all das hier nach. Vielleicht sieht man sich ja noch mal.

	B_GivePlayerXP	(400);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Trent_VM_AndreSauer (C_INFO)
{
	npc		= Mod_7630_RIT_Trent_VM;
	nr		= 1;
	condition	= Info_Mod_Trent_VM_AndreSauer_Condition;
	information	= Info_Mod_Trent_VM_AndreSauer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich glaube, Lord Andre ist ein wenig sauer auf deine Entscheidung direkt hierher zu kommen.";
};

FUNC INT Info_Mod_Trent_VM_AndreSauer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trent_VM_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Andre_Steinmonster2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Trent_VM_AndreSauer_Info()
{
	AI_Output(hero, self, "Info_Mod_Trent_VM_AndreSauer_15_00"); //Ich glaube, Lord Andre ist ein wenig sauer auf deine Entscheidung direkt hierher zu kommen.
	AI_Output(self, hero, "Info_Mod_Trent_VM_AndreSauer_06_01"); //Das sind sie meistens, bis ich mit einem Berg voll Erz zurück komme. Dann war es plötzlich doch ihre Idee.
};

INSTANCE Info_Mod_Trent_VM_EXIT (C_INFO)
{
	npc		= Mod_7630_RIT_Trent_VM;
	nr		= 1;
	condition	= Info_Mod_Trent_VM_EXIT_Condition;
	information	= Info_Mod_Trent_VM_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Trent_VM_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Trent_VM_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};