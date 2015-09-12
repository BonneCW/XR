INSTANCE Info_Mod_Valentine_Hi (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_Hi_Condition;
	information	= Info_Mod_Valentine_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Valentine_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Valentine_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Valentine_Hi_16_01"); //Ich bin Valentine, Valentinos Schwester.
};

INSTANCE Info_Mod_Valentine_Kapitel2 (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_Kapitel2_Condition;
	information	= Info_Mod_Valentine_Kapitel2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Valentine_Kapitel2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentine_Hi))
	&& (Kapitel >= 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Moe_Geruechte3))
	&& (Npc_KnowsInfo(hero, Info_Mod_Canthar_Port))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_Kapitel2_Info()
{
	AI_Output(self, hero, "Info_Mod_Valentine_Kapitel2_16_00"); //(ungläubig) Was willst DU denn hier?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Valentine_WoValentino (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_WoValentino_Condition;
	information	= Info_Mod_Valentine_WoValentino_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich komme von Moe. Es geht um Valentino.";
};

FUNC INT Info_Mod_Valentine_WoValentino_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentine_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Moe_Geruechte3))
	&& (Mod_Moe_Valentino == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_WoValentino_Info()
{
	AI_Output(hero, self, "Info_Mod_Valentine_WoValentino_15_00"); //Ich komme von Moe. Es geht um Valentino.
	AI_Output(self, hero, "Info_Mod_Valentine_WoValentino_16_01"); //Bist du nicht derjenige, den Canthar haben will?

	Info_ClearChoices	(Info_Mod_Valentine_WoValentino);

	Info_AddChoice	(Info_Mod_Valentine_WoValentino, "Nein, wer behauptet denn so etwas?", Info_Mod_Valentine_WoValentino_B);
	Info_AddChoice	(Info_Mod_Valentine_WoValentino, "Ja, das stimmt.", Info_Mod_Valentine_WoValentino_A);
};

FUNC VOID Info_Mod_Valentine_WoValentino_E()
{
	AI_Output(hero, self, "Info_Mod_Valentine_WoValentino_E_15_00"); //Ich will versuchen, Valentino zu retten.
	AI_Output(self, hero, "Info_Mod_Valentine_WoValentino_E_16_01"); //(spöttisch) Valentino retten? Du? Allein?

	Info_ClearChoices	(Info_Mod_Valentine_WoValentino);

	Info_AddChoice	(Info_Mod_Valentine_WoValentino, "Ja, ich allein. Wo ist er?", Info_Mod_Valentine_WoValentino_G);
	Info_AddChoice	(Info_Mod_Valentine_WoValentino, "Hast du eine bessere Idee?", Info_Mod_Valentine_WoValentino_F);
};

FUNC VOID Info_Mod_Valentine_WoValentino_B()
{
	AI_Output(hero, self, "Info_Mod_Valentine_WoValentino_B_15_00"); //Nein, wer behauptet denn so etwas?
	AI_Output(self, hero, "Info_Mod_Valentine_WoValentino_B_16_01"); //(argwöhnisch) Canthar beschrieb in seiner Forderung einen Menschen, dessen Beschreibung auf dich zutreffen würde.

	Info_ClearChoices	(Info_Mod_Valentine_WoValentino);

	Info_AddChoice	(Info_Mod_Valentine_WoValentino, "Das muss Zufall sein.", Info_Mod_Valentine_WoValentino_D);
	Info_AddChoice	(Info_Mod_Valentine_WoValentino, "Vielleicht bin ich das doch. Ja, je länger ich darüber nachdenke ...", Info_Mod_Valentine_WoValentino_C);
};

FUNC VOID Info_Mod_Valentine_WoValentino_A()
{
	AI_Output(hero, self, "Info_Mod_Valentine_WoValentino_A_15_00"); //Ja, das stimmt.
	AI_Output(self, hero, "Info_Mod_Valentine_WoValentino_A_16_01"); //Was willst du dann von mir?

	Info_Mod_Valentine_WoValentino_E();
};

FUNC VOID Info_Mod_Valentine_WoValentino_D()
{
	AI_Output(hero, self, "Info_Mod_Valentine_WoValentino_D_15_00"); //Das muss Zufall sein.
	AI_Output(self, hero, "Info_Mod_Valentine_WoValentino_D_16_01"); //Aha ... na schön, was willst du?

	Info_Mod_Valentine_WoValentino_E();
};

FUNC VOID Info_Mod_Valentine_WoValentino_C()
{
	AI_Output(hero, self, "Info_Mod_Valentine_WoValentino_C_15_00"); //Vielleicht bin ich das doch. Ja, je länger ich darüber nachdenke ...
	AI_Output(self, hero, "Info_Mod_Valentine_WoValentino_C_16_01"); //(genervt) Was soll das? Komm wieder, wenn du dir sicher bist.

	Info_ClearChoices	(Info_Mod_Valentine_WoValentino);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Valentine_WoValentino_G()
{
	AI_Output(hero, self, "Info_Mod_Valentine_WoValentino_G_15_00"); //(grob) Ja, ich allein. Wo ist er?
	AI_Output(self, hero, "Info_Mod_Valentine_WoValentino_G_16_01"); //(einsilbig) Auf der Höhe von Jacks Leuchtturm. Viel Glück.

	Info_ClearChoices	(Info_Mod_Valentine_WoValentino);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_754_NONE_Valentino_NW, "KIDNAPPED");

	Mod_Moe_Valentino = 1;

	B_LogEntry	(TOPIC_MOD_MOE_VALENTINO, "Valentino wird auf dem Plateau in der Nähe von Jacks Leuchtturm festgehalten. Da werde ich ihn wohl irgendwie rausholen müssen.");

	// Pfad zum Leuchtturm

	Wld_InsertNpc	(Mod_7026_OUT_Entfuehrer_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_7027_OUT_Entfuehrer_NW,	"TAVERNE");

	// Um Zelt

	Wld_InsertNpc	(Mod_7028_OUT_Entfuehrer_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_7029_OUT_Entfuehrer_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_7030_OUT_Entfuehrer_NW,	"TAVERNE");

	// In Zelt

	Wld_InsertNpc	(Mod_7031_OUT_Entfuehrer_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_7032_OUT_Entfuehrer_NW,	"TAVERNE");

	// Lager hochfahren

	Wld_SendTrigger	("EVT_NW_VALENTINOZELT");

	Wld_InsertItem	(ItWr_CantharZettel_Valentino, "FP_ITEM_VALENTINO_RAMIREZ_ZETTEL");
};

FUNC VOID Info_Mod_Valentine_WoValentino_F()
{
	AI_Output(hero, self, "Info_Mod_Valentine_WoValentino_F_15_00"); //Hast du eine bessere Idee?
	AI_Output(self, hero, "Info_Mod_Valentine_WoValentino_F_16_01"); //Canthar will dich in die Finger bekommen, und du willst ihm allein entgegenlaufen?
	AI_Output(self, hero, "Info_Mod_Valentine_WoValentino_F_16_02"); //Nein, du darfst dich seinen Häschern nicht zu erkennen geben. (bestimmt) Ich werde mitkommen.

	Info_ClearChoices	(Info_Mod_Valentine_WoValentino);

	Info_AddChoice	(Info_Mod_Valentine_WoValentino, "Auf keinen Fall nehme ich dich mit. Wo sind die Entführer?", Info_Mod_Valentine_WoValentino_I);
	Info_AddChoice	(Info_Mod_Valentine_WoValentino, "Das findest du nicht zu gefährlich?", Info_Mod_Valentine_WoValentino_H);
};

FUNC VOID Info_Mod_Valentine_WoValentino_I()
{
	AI_Output(hero, self, "Info_Mod_Valentine_WoValentino_I_15_00"); //Auf keinen Fall nehme ich dich mit. Wo sind die Entführer?
	AI_Output(self, hero, "Info_Mod_Valentine_WoValentino_I_16_01"); //(einsilbig) Na schön. Auf der Höhe von Jacks Leuchtturm. Viel Glück.

	Info_ClearChoices	(Info_Mod_Valentine_WoValentino);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_754_NONE_Valentino_NW, "KIDNAPPED");

	Mod_Moe_Valentino = 1;

	B_LogEntry	(TOPIC_MOD_MOE_VALENTINO, "Valentino wird auf dem Plateau in der Nähe von Jacks Leuchtturm festgehalten. Da werde ich ihn wohl irgendwie rausholen müssen.");

	// Pfad zum Leuchtturm

	Wld_InsertNpc	(Mod_7026_OUT_Entfuehrer_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_7027_OUT_Entfuehrer_NW,	"TAVERNE");

	// Um Zelt

	Wld_InsertNpc	(Mod_7028_OUT_Entfuehrer_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_7029_OUT_Entfuehrer_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_7030_OUT_Entfuehrer_NW,	"TAVERNE");

	// In Zelt

	Wld_InsertNpc	(Mod_7031_OUT_Entfuehrer_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_7032_OUT_Entfuehrer_NW,	"TAVERNE");

	// Lager hochfahren

	Wld_SendTrigger	("EVT_NW_VALENTINOZELT");

	Wld_InsertItem	(ItWr_CantharZettel_Valentino, "FP_ITEM_VALENTINO_RAMIREZ_ZETTEL");
};

FUNC VOID Info_Mod_Valentine_WoValentino_H()
{
	AI_Output(hero, self, "Info_Mod_Valentine_WoValentino_H_15_00"); //Das findest du nicht zu gefährlich?
	AI_Output(self, hero, "Info_Mod_Valentine_WoValentino_H_16_01"); //Ich habe schon einen Plan ... Folge mir, ich bringe dich zu dem Lager der Entführer.

	Info_ClearChoices	(Info_Mod_Valentine_WoValentino);

	Mod_Moe_Valentino = 2;

	B_LogEntry	(TOPIC_MOD_MOE_VALENTINO, "Valentine wird mich zu dem Ort führen, an dem Valentino festgehalten wird. Sie meint, sie habe einen Plan ...");

	// Pfad zum Leuchtturm

	Wld_InsertNpc	(Mod_7026_OUT_Entfuehrer_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_7027_OUT_Entfuehrer_NW,	"TAVERNE");

	// Um Zelt

	Wld_InsertNpc	(Mod_7028_OUT_Entfuehrer_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_7029_OUT_Entfuehrer_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_7030_OUT_Entfuehrer_NW,	"TAVERNE");

	// In Zelt

	Wld_InsertNpc	(Mod_7031_OUT_Entfuehrer_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_7032_OUT_Entfuehrer_NW,	"TAVERNE");

	// Lager hochfahren

	Wld_SendTrigger	("EVT_NW_VALENTINOZELT");

	B_StartOtherRoutine	(Mod_754_NONE_Valentino_NW, "KIDNAPPED");

	Wld_InsertItem	(ItWr_CantharZettel_Valentino, "FP_ITEM_VALENTINO_RAMIREZ_ZETTEL");
};

INSTANCE Info_Mod_Valentine_LosZuValentino (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_LosZuValentino_Condition;
	information	= Info_Mod_Valentine_LosZuValentino_Info;
	permanent	= 0;
	important	= 0;
	description	= "Los geht's!";
};

FUNC INT Info_Mod_Valentine_LosZuValentino_Condition()
{
	if (Mod_Moe_Valentino == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_LosZuValentino_Info()
{
	AI_Output(hero, self, "Info_Mod_Valentine_LosZuValentino_15_00"); //Los geht's!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "VALENTINO");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

INSTANCE Info_Mod_Valentine_FirstStop (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_FirstStop_Condition;
	information	= Info_Mod_Valentine_FirstStop_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Valentine_FirstStop_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentine_LosZuValentino))
	&& (Npc_GetDistToWp(self, "NW_CITY_TO_LIGHTHOUSE_04") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_FirstStop_Info()
{
	AI_Output(self, hero, "Info_Mod_Valentine_FirstStop_16_00"); //(flüsternd) Dort vorn sind schon die ersten beiden dieser Verbrecherbande.
	AI_Output(self, hero, "Info_Mod_Valentine_FirstStop_16_01"); //Scheinen mir aber noch Neulinge zu sein, sie sehen nicht gerade wie ernste Gegner aus.
	AI_Output(self, hero, "Info_Mod_Valentine_FirstStop_16_02"); //Ich denke, du kannst sie ohne Weiteres ausschalten. Pass nur auf, dass sie keine Verstärkung holen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FIRSTGANGSTER");
};

INSTANCE Info_Mod_Valentine_FirstStop_Fertig (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_FirstStop_Fertig_Condition;
	information	= Info_Mod_Valentine_FirstStop_Fertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Valentine_FirstStop_Fertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentine_FirstStop))
	&& (Npc_IsDead(Mod_7026_OUT_Entfuehrer_NW))
	&& (Npc_IsDead(Mod_7027_OUT_Entfuehrer_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_FirstStop_Fertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Valentine_FirstStop_Fertig_16_00"); //Gut so! Aber der schwierige Teil kommt erst noch. Folge mir!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOZELT");
};

INSTANCE Info_Mod_Valentine_SecondStop (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_SecondStop_Condition;
	information	= Info_Mod_Valentine_SecondStop_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Valentine_SecondStop_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentine_FirstStop_Fertig))
	&& (Npc_GetDistToWp(self, "NW_CITY_JAEGER_08") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_SecondStop_Info()
{
	AI_Output(self, hero, "Info_Mod_Valentine_SecondStop_16_00"); //(die ganze Zeit über flüsternd) Psst! Da vorn sind sie.
	AI_Output(self, hero, "Info_Mod_Valentine_SecondStop_16_01"); //Jetzt zu meinem Plan: Du bleibst genau hier stehen und ich schleiche mich an das Lager heran und spioniere die Bewacher aus.
	AI_Output(self, hero, "Info_Mod_Valentine_SecondStop_16_02"); //Vielleicht kann man sie irgendwie voneinander trennen oder sich an ihnen vorbei schleichen.
	AI_Output(hero, self, "Info_Mod_Valentine_SecondStop_15_03"); //(ebenfalls immer flüsternd) Wieso soll nicht ich das machen?
	AI_Output(self, hero, "Info_Mod_Valentine_SecondStop_16_04"); //Weil sie dich suchen und mich nicht. Wenn ich entdeckt werde, kann ich immer noch unschuldig tun.
	AI_Output(self, hero, "Info_Mod_Valentine_SecondStop_16_05"); //Aber am besten wäre es wohl, du sagst mir, was ich tun soll. Das ist meine erste Unternehmung dieser Art!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATZELT");
};

INSTANCE Info_Mod_Valentine_Spy01 (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_Spy01_Condition;
	information	= Info_Mod_Valentine_Spy01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kundschafte das Lager heimlich aus.";
};

FUNC INT Info_Mod_Valentine_Spy01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentine_SecondStop))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_Spy01_Info()
{
	AI_Output(hero, self, "Info_Mod_Valentine_Spy01_15_00"); //Kundschafte das Lager heimlich aus.

	AI_SetWalkMode	(self, NPC_SNEAK);

	AI_GotoWP	(self, "NW_CITY_JAEGER_11");
	AI_GotoWP	(self, "NW_CITY_JAEGER_08");
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Valentine_Spy01_Fertig (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_Spy01_Fertig_Condition;
	information	= Info_Mod_Valentine_Spy01_Fertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Valentine_Spy01_Fertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentine_Spy01))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_Spy01_Fertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Valentine_Spy01_Fertig_16_00"); //Drei Mann stehen um das Zelt herum, und im Zelt zeichnen sich drei Schatten ab; einer davon wird Valentino sein.
	AI_Output(self, hero, "Info_Mod_Valentine_Spy01_Fertig_16_01"); //Was soll ich jetzt tun?

	B_LogEntry	(TOPIC_MOD_MOE_VALENTINO, "Valentino wird in einem Zelt von zwei Männern bewacht. Um das Zelt herum stehen drei weitere Wächter. Es wird wohl etwas mehr als Draufhauen brauchen, an Valentino heran zu kommen ...");
};

INSTANCE Info_Mod_Valentine_Spy02 (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_Spy02_Condition;
	information	= Info_Mod_Valentine_Spy02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kundschafte das Lager noch mal aus und achte auf besondere Eigenschaften.";
};

FUNC INT Info_Mod_Valentine_Spy02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentine_Spy01_Fertig))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_Spy02_Info()
{
	AI_Output(hero, self, "Info_Mod_Valentine_Spy02_15_00"); //Kundschafte das Lager noch mal aus und achte auf besondere Eigenschaften der Wächter.

	AI_SetWalkMode	(self, NPC_SNEAK);

	AI_GotoWP	(self, "NW_CITY_JAEGER_11");
	AI_GotoWP	(self, "NW_CITY_JAEGER_08");
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Valentine_Spy02_Fertig (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_Spy02_Fertig_Condition;
	information	= Info_Mod_Valentine_Spy02_Fertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Valentine_Spy02_Fertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentine_Spy02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_Spy02_Fertig_Info()
{
	if (!Npc_IsDead(Mod_7032_OUT_Entfuehrer_NW))
	{
		AI_Output(self, hero, "Info_Mod_Valentine_Spy02_Fertig_16_00"); //Einer der Wächter bleibt immer auf der Stelle stehen und trinkt unablässig Bier.
	};
	if (!Npc_IsDead(Mod_7030_OUT_Entfuehrer_NW))
	{
		AI_Output(self, hero, "Info_Mod_Valentine_Spy02_Fertig_16_01"); //Einer hat anscheinend eine schwache Blase, er entfernt sich ungefähr zu jeder geraden Stunde vom Lager, um sich zu erleichtern.
	};
	if (!Npc_IsDead(Mod_7031_OUT_Entfuehrer_NW))
	{
		AI_Output(self, hero, "Info_Mod_Valentine_Spy02_Fertig_16_02"); //Einer patrouilliert zwar durchs Lager, sieht dafür aber nicht sehr kräftig aus.
	};
};

INSTANCE Info_Mod_Valentine_Kill01 (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_Kill01_Condition;
	information	= Info_Mod_Valentine_Kill01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Misch' dem ersten Wächter eine Überdosis in sein Bier.";
};

FUNC INT Info_Mod_Valentine_Kill01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentine_Spy02_Fertig))
	&& (!C_NpcIsDown(Mod_7032_OUT_Entfuehrer_NW))
	&& (Mod_ValentineKill01 == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_Kill01_Info()
{
	AI_Output(hero, self, "Info_Mod_Valentine_Kill01_15_00"); //Misch dem ersten Wächter eine Überdosis in sein Bier.
	AI_Output(self, hero, "Info_Mod_Valentine_Kill01_16_01"); //Was genau soll ich denn mixen?
	AI_Output(self, hero, "Info_Mod_Valentine_Kill01_16_02"); //Wenn du zehn Blauflieder hast, wird er von der Überdosis einschlafen.
	AI_Output(self, hero, "Info_Mod_Valentine_Kill01_16_03"); //Falls du eine Portion Gift hast, wird er zumindest für längere Zeit in Ohnmacht fallen.
	AI_Output(self, hero, "Info_Mod_Valentine_Kill01_16_04"); //Von drei Portionen Gift dürfte er sicher sterben.

	Info_ClearChoices	(Info_Mod_Valentine_Kill01);

	Info_AddChoice	(Info_Mod_Valentine_Kill01, "Ich überleg's mir doch noch mal.", Info_Mod_Valentine_Kill01_D);

	if (Npc_HasItems(hero, ItPo_Gift) >= 3)
	{
		Info_AddChoice	(Info_Mod_Valentine_Kill01, "Gift hab ich genug, daran wird's nicht scheitern.", Info_Mod_Valentine_Kill01_C);
	};
	if (Npc_HasItems(hero, ItPo_Gift) >= 1)
	{
		Info_AddChoice	(Info_Mod_Valentine_Kill01, "Ich hab nur eine Portion Gift.", Info_Mod_Valentine_Kill01_B);
	};
	if (Npc_HasItems(hero, ItPo_Tiergift) >= 1)
	{
		Info_AddChoice	(Info_Mod_Valentine_Kill01, "Ich hab hier etwas Tiergift.", Info_Mod_Valentine_Kill01_G);
	};
	if (Npc_HasItems(hero, ItPo_Pflanzengift) >= 1)
	{
		Info_AddChoice	(Info_Mod_Valentine_Kill01, "Ich hab hier etwas Gewächsgift.", Info_Mod_Valentine_Kill01_F);
	};
	if (Npc_HasItems(hero, ItPo_Mischgift) >= 1)
	{
		Info_AddChoice	(Info_Mod_Valentine_Kill01, "Ich hab dieses spezielle Gift.", Info_Mod_Valentine_Kill01_E);
	};
	if (Npc_HasItems(hero, ItPl_BluePlant) >= 10)
	{
		Info_AddChoice	(Info_Mod_Valentine_Kill01, "Hier hast du 10 Blauflieder.", Info_Mod_Valentine_Kill01_A);
	};
};

FUNC VOID Info_Mod_Valentine_Kill01_D()
{
	AI_Output(hero, self, "Info_Mod_Valentine_Kill01_D_15_00"); //Ich überleg's mir doch noch mal.

	Info_ClearChoices	(Info_Mod_Valentine_Kill01);
};

FUNC VOID Info_Mod_Valentine_Kill01_C()
{
	AI_Output(hero, self, "Info_Mod_Valentine_Kill01_C_15_00"); //Gift hab ich genug, daran wird's nicht scheitern.

	B_GiveInvItems	(hero, self, ItPo_Gift, 3);

	Mod_ValentineKill01 = 1;

	Info_ClearChoices	(Info_Mod_Valentine_Kill01);

	AI_SetWalkMode	(self, NPC_RUN);

	AI_GotoWP	(self, "NW_CITY_JAEGER_18");
	AI_GotoWP	(self, "NW_CITY_JAEGER_08");
	
	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Valentine_Kill01_B()
{
	AI_Output(hero, self, "Info_Mod_Valentine_Kill01_B_15_00"); //Ich hab nur eine Portion Gift.

	B_GiveInvItems	(hero, self, ItPo_Gift, 1);

	Mod_ValentineKill01 = 1;

	Info_ClearChoices	(Info_Mod_Valentine_Kill01);

	AI_SetWalkMode	(self, NPC_RUN);

	AI_GotoWP	(self, "NW_CITY_JAEGER_18");
	AI_GotoWP	(self, "NW_CITY_JAEGER_08");
	
	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Valentine_Kill01_G()
{
	AI_Output(hero, self, "Info_Mod_Valentine_Kill01_G_15_00"); //Ich hab hier etwas Tiergift.

	B_GiveInvItems	(hero, self, ItPo_Tiergift, 1);

	Mod_ValentineKill01 = 1;

	Info_ClearChoices	(Info_Mod_Valentine_Kill01);

	AI_SetWalkMode	(self, NPC_RUN);

	AI_GotoWP	(self, "NW_CITY_JAEGER_18");
	AI_GotoWP	(self, "NW_CITY_JAEGER_08");
	
	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Valentine_Kill01_F()
{
	AI_Output(hero, self, "Info_Mod_Valentine_Kill01_F_15_00"); //Ich hab hier etwas Gewächsgift.

	B_GiveInvItems	(hero, self, ItPo_Pflanzengift, 1);

	Mod_ValentineKill01 = 1;

	Info_ClearChoices	(Info_Mod_Valentine_Kill01);

	AI_SetWalkMode	(self, NPC_RUN);

	AI_GotoWP	(self, "NW_CITY_JAEGER_18");
	AI_GotoWP	(self, "NW_CITY_JAEGER_08");
	
	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Valentine_Kill01_E()
{
	AI_Output(hero, self, "Info_Mod_Valentine_Kill01_E_15_00"); //Ich hab dieses spezielle Gift.

	B_GiveInvItems	(hero, self, ItPo_Mischgift, 1);

	Mod_ValentineKill01 = 1;

	Info_ClearChoices	(Info_Mod_Valentine_Kill01);

	AI_SetWalkMode	(self, NPC_RUN);

	AI_GotoWP	(self, "NW_CITY_JAEGER_18");
	AI_GotoWP	(self, "NW_CITY_JAEGER_08");
	
	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Valentine_Kill01_A()
{
	AI_Output(hero, self, "Info_Mod_Valentine_Kill01_A_15_00"); //Hier hast du 10 Blauflieder.

	B_GiveInvItems	(hero, self, ItPl_BluePlant, 10);

	Mod_ValentineKill01 = 1;

	Info_ClearChoices	(Info_Mod_Valentine_Kill01);

	AI_SetWalkMode	(self, NPC_RUN);

	AI_GotoWP	(self, "NW_CITY_JAEGER_18");
	AI_GotoWP	(self, "NW_CITY_JAEGER_08");
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Valentine_Kill01_Fertig (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_Kill01_Fertig_Condition;
	information	= Info_Mod_Valentine_Kill01_Fertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Valentine_Kill01_Fertig_Condition()
{
	if ((Npc_HasItems(self, ItPo_Gift) >= 3)
	|| (Npc_HasItems(self, ItPo_Gift) >= 1)
	|| (Npc_HasItems(self, ItPo_Mischgift) >= 1)
	|| (Npc_HasItems(self, ItPo_Tiergift) >= 1)
	|| (Npc_HasItems(self, ItPo_Pflanzengift) >= 1)
	|| (Npc_HasItems(self, ItPl_BluePlant) >= 10))
	&& (Mod_ValentineKill01 == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_Kill01_Fertig_Info()
{
	if (Npc_HasItems(self, ItPo_Gift) >= 3)
	|| (Npc_HasItems(self, ItPo_Pflanzengift) >= 1)
	|| (Npc_HasItems(self, ItPo_Tiergift) >= 1)
	|| (Npc_HasItems(self, ItPo_Mischgift) >= 1)
	{
		AI_Output(self, hero, "Info_Mod_Valentine_Kill01_Fertig_16_00"); //Der dürfte nie wieder aufstehen.

		B_GivePlayerXP	(Mod_7032_OUT_Entfuehrer_NW.level/2);

		B_KillNpc	(Mod_7032_OUT_Entfuehrer_NW);
	}
	else if (Npc_HasItems(self, ItPo_Gift) >= 1)
	{
		AI_Output(self, hero, "Info_Mod_Valentine_Kill01_Fertig_16_01"); //Der wird so bald nicht mehr aufstehen.

		B_StartOtherRoutine	(Mod_7032_OUT_Entfuehrer_NW, "SLEEP");

		Mod_7032_OUT_Entfuehrer_NW.flags = 2;
	}
	else if (Npc_HasItems(self, ItPl_BluePlant) >= 10)
	{
		AI_Output(self, hero, "Info_Mod_Valentine_Kill01_Fertig_16_02"); //Der macht erstmal ein kleines Schläfchen.

		B_StartOtherRoutine	(Mod_7032_OUT_Entfuehrer_NW, "SLEEP");

		Mod_7032_OUT_Entfuehrer_NW.flags = 2;
	};
};

INSTANCE Info_Mod_Valentine_Kill02 (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_Kill02_Condition;
	information	= Info_Mod_Valentine_Kill02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Locke den schwachen Wächter hierher.";
};

FUNC INT Info_Mod_Valentine_Kill02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentine_Spy02_Fertig))
	&& (!Npc_IsDead(Mod_7031_OUT_Entfuehrer_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_Kill02_Info()
{
	AI_Output(hero, self, "Info_Mod_Valentine_Kill02_15_00"); //Locke den schwachen Wächter hierher.

	AI_SetWalkMode	(self, NPC_RUN);

	Mod_ValentineKill02 = 1;

	AI_GotoWP	(self, "NW_CITY_JAEGER_18");
	AI_GotoWP	(self, "NW_CITY_JAEGER_08");
	
	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_7031_OUT_Entfuehrer_NW, "KILLER");
};

INSTANCE Info_Mod_Valentine_Kill02_Fertig (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_Kill02_Fertig_Condition;
	information	= Info_Mod_Valentine_Kill02_Fertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Valentine_Kill02_Fertig_Condition()
{
	if (Mod_ValentineKill02 == 1)
	&& (Npc_IsDead(Mod_7031_OUT_Entfuehrer_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_Kill02_Fertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Valentine_Kill02_Fertig_16_00"); //Der steht so schnell nicht wieder auf. Einer weniger, um den wir uns sorgen müssen.
};

INSTANCE Info_Mod_Valentine_Kill03 (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_Kill03_Condition;
	information	= Info_Mod_Valentine_Kill03_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich kümmere mich mal kurz um den mit der schwachen Blase.";
};

FUNC INT Info_Mod_Valentine_Kill03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentine_Spy02_Fertig))
	&& (!Npc_IsDead(Mod_7031_OUT_Entfuehrer_NW))
	&& (Mod_ValentineKill03 == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_Kill03_Info()
{
	AI_Output(hero, self, "Info_Mod_Valentine_Kill03_15_00"); //Ich kümmere mich mal kurz um den mit der schwachen Blase.

	Mod_ValentineKill03 = 1;
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Valentine_Kill03_Fertig (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_Kill03_Fertig_Condition;
	information	= Info_Mod_Valentine_Kill03_Fertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Valentine_Kill03_Fertig_Condition()
{
	if ((Mod_ValentineKill03 == 1)
	&& (Npc_IsDead(Mod_7030_OUT_Entfuehrer_NW)))
	|| (Mod_ValentineKill03 == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_Kill03_Fertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Valentine_Kill03_Fertig_16_00"); //Gut gemacht. Was kommt als nächstes?
};

INSTANCE Info_Mod_Valentine_AllKills_Fertig (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_AllKills_Fertig_Condition;
	information	= Info_Mod_Valentine_AllKills_Fertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Valentine_AllKills_Fertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentine_SecondStop))
	&& ((Npc_IsDead(Mod_7030_OUT_Entfuehrer_NW))
	|| (Mod_ValentineKill03 == 2))
	&& (Npc_IsDead(Mod_7031_OUT_Entfuehrer_NW))
	&& ((Npc_IsDead(Mod_7032_OUT_Entfuehrer_NW))
	|| (Npc_IsInState(Mod_7032_OUT_Entfuehrer_NW, ZS_Drained)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_AllKills_Fertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Valentine_AllKills_Fertig_16_00"); //Gut! Ich hätte nicht damit gerechnet, dass wir so weit kommen.
	AI_Output(self, hero, "Info_Mod_Valentine_AllKills_Fertig_16_01"); //Jetzt müssen wir nur noch die zwei Verbrecher im Zelt erledigen, ohne dass sie Valentino etwas antun.

	B_LogEntry	(TOPIC_MOD_MOE_VALENTINO, "Die ersten drei Wächter sind erledigt, bleiben zwei.");
};

INSTANCE Info_Mod_Valentine_ValentinoFrei (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_ValentinoFrei_Condition;
	information	= Info_Mod_Valentine_ValentinoFrei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Valentine_ValentinoFrei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentine_AllKills_Fertig))
	&& (Npc_KnowsInfo(hero, Info_Mod_Valentino_Kidnapped))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentine_ValentinoFrei_Info()
{
	AI_Output(self, hero, "Info_Mod_Valentine_ValentinoFrei_16_00"); //(fröhlich) Hätte nicht gedacht, dass das so einfach wird.
	AI_Output(hero, self, "Info_Mod_Valentine_ValentinoFrei_15_01"); //Es war auch nicht besonders einfach.
	AI_Output(self, hero, "Info_Mod_Valentine_ValentinoFrei_16_02"); //Wie auch immer. Ich fand es unglaublich spannend.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};

INSTANCE Info_Mod_Valentine_Pickpocket (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_Pickpocket_Condition;
	information	= Info_Mod_Valentine_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Valentine_Pickpocket_Condition()
{
	C_Beklauen	(56, ItMi_Gold, 17);
};

FUNC VOID Info_Mod_Valentine_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Valentine_Pickpocket);

	Info_AddChoice	(Info_Mod_Valentine_Pickpocket, DIALOG_BACK, Info_Mod_Valentine_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Valentine_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Valentine_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Valentine_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Valentine_Pickpocket);
};

FUNC VOID Info_Mod_Valentine_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Valentine_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Valentine_Pickpocket);

		Info_AddChoice	(Info_Mod_Valentine_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Valentine_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Valentine_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Valentine_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Valentine_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Valentine_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Valentine_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Valentine_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Valentine_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Valentine_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Valentine_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Valentine_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Valentine_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Valentine_EXIT (C_INFO)
{
	npc		= Mod_1197_VLK_Valentine_NW;
	nr		= 1;
	condition	= Info_Mod_Valentine_EXIT_Condition;
	information	= Info_Mod_Valentine_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Valentine_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Valentine_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};