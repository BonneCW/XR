INSTANCE Info_Mod_Myxir_AW_Hi (C_INFO)
{
	npc		= Mod_7000_KDS_Myxir_AW;
	nr		= 1;
	condition	= Info_Mod_Myxir_AW_Hi_Condition;
	information	= Info_Mod_Myxir_AW_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Myxir? Wie kommst du hierher?";
};

FUNC INT Info_Mod_Myxir_AW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Myxir_AW_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_AW_Hi_15_00"); //Myxir? Wie kommst du hierher?
	AI_Output(self, hero, "Info_Mod_Myxir_AW_Hi_12_01"); //Xardas hatte angeordnet, dass ich ein Auge auf dich werfe und verhindere, dass du zu Schaden kommst.
	AI_Output(self, hero, "Info_Mod_Myxir_AW_Hi_12_02"); //Ein Glück für dich, sonst hätte dich diese Gardistin sicher kalt gestellt.
	AI_Output(hero, self, "Info_Mod_Myxir_AW_Hi_15_03"); //(verlegen) Ja, ähm ... danke. Wieso sind wir im Lager der Piraten?
	AI_Output(self, hero, "Info_Mod_Myxir_AW_Hi_12_04"); //Weil das zufällig der einzige Ort in Jharkendar ist, an dem die Garde Innos' noch nicht eingedrungen ist.
	AI_Output(hero, self, "Info_Mod_Myxir_AW_Hi_15_05"); //Was ist mit den Leichen?
	AI_Output(self, hero, "Info_Mod_Myxir_AW_Hi_12_06"); //Untote und der Blutkult griffen uns an. Ich hatte hier bei Greg Stellung bezogen und ihn beim Angriff unterstützt.
	AI_Output(self, hero, "Info_Mod_Myxir_AW_Hi_12_07"); //Es kamen einige um, doch noch können die Piraten standhalten. Aber für wie lange noch?
	AI_Output(self, hero, "Info_Mod_Myxir_AW_Hi_12_08"); //Das Wichtigste ist jetzt, dass wir die Garde Innos' aufhalten, ehe sie Innos' Schwert in ihren Besitz bringen.

	Mod_934_PIR_Henry_AW.aivar[AIV_PASSGATE] = TRUE;
};

INSTANCE Info_Mod_Myxir_AW_WhatNow (C_INFO)
{
	npc		= Mod_7000_KDS_Myxir_AW;
	nr		= 1;
	condition	= Info_Mod_Myxir_AW_WhatNow_Condition;
	information	= Info_Mod_Myxir_AW_WhatNow_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was soll ich tun?";
};

FUNC INT Info_Mod_Myxir_AW_WhatNow_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_AW_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_AW_WhatNow_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_AW_WhatNow_15_00"); //Was soll ich tun?
	AI_Output(self, hero, "Info_Mod_Myxir_AW_WhatNow_12_01"); //Das ist das Anspruchsvolle. Die Gardisten haben es geschafft, ihre Rüstungen so zu verzaubern, dass sie unverwundbar sind.
	AI_Output(self, hero, "Info_Mod_Myxir_AW_WhatNow_12_02"); //Deshalb benötigen wir eine spezielle Waffe, um die Rüstung zu durchdringen, den Dolch Beliars.
	AI_Output(hero, self, "Info_Mod_Myxir_AW_WhatNow_15_03"); //Beliars Dolch?
	AI_Output(self, hero, "Info_Mod_Myxir_AW_WhatNow_12_04"); //Ja. Er kann nur von mächtigen Schwarzmagiern geschmiedet werden und ist vernichtend. Mit einem Schlag kann man die Rüstung eines Gardisten Innos' durchdringen.
	AI_Output(self, hero, "Info_Mod_Myxir_AW_WhatNow_12_05"); //Jedoch wirkt er nur ein Mal. Die Bauanleitung muss sich irgendwo in Jharkendar befinden. Du musst sie bergen, damit wir den Dolch herstellen können.
	AI_Output(hero, self, "Info_Mod_Myxir_AW_WhatNow_15_06"); //Wo soll ich anfangen zu suchen?
	AI_Output(self, hero, "Info_Mod_Myxir_AW_WhatNow_12_07"); //Schwierig zu sagen. Jedoch gibt es im Tal mehrere Herrenhäuser der Erbauer. Am besten versuchst du dort dein Glück.

	Log_CreateTopic	(TOPIC_MOD_BEL_BELIARDOLCH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_BELIARDOLCH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_BELIARDOLCH, "Um die unverwundbaren Gardisten doch besiegen zu können, brauche ich den Dolch Beliars. Diesen kann man nur ein Mal benutzen, doch er zerstört jede Rüstung mit nur einem Schlag. Die Bauanleitung dafür soll sich irgendwo in Jharkendar befinden. Myxir riet mir, die Herrenhäuser zu durchsuchen.");
};

INSTANCE Info_Mod_Myxir_AW_WhatNext (C_INFO)
{
	npc		= Mod_7000_KDS_Myxir_AW;
	nr		= 1;
	condition	= Info_Mod_Myxir_AW_WhatNext_Condition;
	information	= Info_Mod_Myxir_AW_WhatNext_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist das Nächste?";
};

FUNC INT Info_Mod_Myxir_AW_WhatNext_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_AW_WhatNow))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_AW_WhatNext_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_AW_WhatNext_15_00"); //Was kommt als nächstes?
	AI_Output(self, hero, "Info_Mod_Myxir_AW_WhatNext_12_01"); //Wir müssen mehr über das Schwert Innos' herausfinden. Die Erbauer sammelten viele alte Schriften zu mächtigen Artefakten.
	AI_Output(self, hero, "Info_Mod_Myxir_AW_WhatNext_12_02"); //Du musst eine dieser alten Schriften finden. Vermutlich liegt diese in der Bibliothek der Erbauer im Canyon.
	AI_Output(self, hero, "Info_Mod_Myxir_AW_WhatNext_12_03"); //Gehe dorthin und finde die Schrift. Sei aber vorsichtig. Die Orks im Canyon haben sich mit der Garde befreundet und bewachen die Bibliothek.

	B_LogEntry	(TOPIC_MOD_BEL_INNOSSCHWERT, "Wir müssen mehr über das Schwert Innos' herausfinden. Ich soll in der alten Bibliothek der Erbauer im Canyon nachsehen, ob ich alte Aufzeichnungen darüber finden kann. Die Bibliothek soll allerdings von Orks bewacht werden.");
};

INSTANCE Info_Mod_Myxir_AW_WhatLast (C_INFO)
{
	npc		= Mod_7000_KDS_Myxir_AW;
	nr		= 1;
	condition	= Info_Mod_Myxir_AW_WhatLast_Condition;
	information	= Info_Mod_Myxir_AW_WhatLast_Info;
	permanent	= 0;
	important	= 0;
	description	= "Noch etwas?";
};

FUNC INT Info_Mod_Myxir_AW_WhatLast_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_AW_WhatNext))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_AW_WhatLast_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_AW_WhatLast_15_00"); //Noch etwas?
	AI_Output(self, hero, "Info_Mod_Myxir_AW_WhatLast_12_01"); //Ja. Wir müssen Jharkendar zurückgewinnen. Greg hat vor, es zu befreien.
	AI_Output(self, hero, "Info_Mod_Myxir_AW_WhatLast_12_02"); //Sprich mit ihm darüber. Er hat die Pläne.
	AI_Output(hero, self, "Info_Mod_Myxir_AW_WhatLast_15_03"); //Gut, ich werde sofort aufbrechen.

	Log_CreateTopic	(TOPIC_MOD_BEL_BEFREIUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_BEFREIUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_BEFREIUNG, "Greg will Jharkendar von der Garde Innos' zurückerobern. Ich soll zu ihm gehen, da er die Pläne hat.");
};

INSTANCE Info_Mod_Myxir_AW_LightHeal (C_INFO)
{
	npc		= Mod_7000_KDS_Myxir_AW;
	nr		= 1;
	condition	= Info_Mod_Myxir_AW_LightHeal_Condition;
	information	= Info_Mod_Myxir_AW_LightHeal_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du ein Rune der leichten Wundheilung für mich?";
};

FUNC INT Info_Mod_Myxir_AW_LightHeal_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_SkipToDead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_AW_LightHeal_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_AW_LightHeal_15_00"); //Hast du ein Rune der leichten Wundheilung für mich?
	AI_Output(self, hero, "Info_Mod_Myxir_AW_LightHeal_12_01"); //Was willst du damit?
	AI_Output(hero, self, "Info_Mod_Myxir_AW_LightHeal_15_02"); //Der Pirat Skip liegt im Sterben, und ohne diese Rune kann der Heiltrank nicht gebraut werden.
	AI_Output(self, hero, "Info_Mod_Myxir_AW_LightHeal_12_03"); //Einen Verbündeten zu verlieren können wir uns nicht leisten. Hier hast du eine.

	B_GiveInvItems	(self, hero, ItRu_LightHeal, 1);

	AI_Output(hero, self, "Info_Mod_Myxir_AW_LightHeal_15_04"); //Danke.
};

INSTANCE Info_Mod_Myxir_AW_BeliarDolch (C_INFO)
{
	npc		= Mod_7000_KDS_Myxir_AW;
	nr		= 1;
	condition	= Info_Mod_Myxir_AW_BeliarDolch_Condition;
	information	= Info_Mod_Myxir_AW_BeliarDolch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe die Bauanleitung gefunden.";
};

FUNC INT Info_Mod_Myxir_AW_BeliarDolch_Condition()
{
	if (Npc_HasItems(hero, ItWr_Bauplan_BeliarDolch) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_AW_BeliarDolch_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_AW_BeliarDolch_15_00"); //Ich habe die Bauanleitung gefunden.
	AI_Output(self, hero, "Info_Mod_Myxir_AW_BeliarDolch_12_01"); //Unglaublich ... zeig her ...

	B_GiveInvItems	(hero, self, ItWr_Bauplan_BeliarDolch, 1);

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Myxir_AW_BeliarDolch_12_02"); //Aha, ein Brocken davon und ein Brocken hiervon. Hmm, nun, du hast nicht zufällig je einen Brocken magisches und schwarzes Erz bei dir?
};

INSTANCE Info_Mod_Myxir_AW_BeliarDolchZutaten (C_INFO)
{
	npc		= Mod_7000_KDS_Myxir_AW;
	nr		= 1;
	condition	= Info_Mod_Myxir_AW_BeliarDolchZutaten_Condition;
	information	= Info_Mod_Myxir_AW_BeliarDolchZutaten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier sind sie.";
};

FUNC INT Info_Mod_Myxir_AW_BeliarDolchZutaten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_AW_BeliarDolch))
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 1)
	&& (Npc_HasItems(hero, ItMi_Zeitspalt_Addon) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_AW_BeliarDolchZutaten_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_AW_BeliarDolchZutaten_15_00"); //Hier sind sie.

	Npc_RemoveInvItems	(hero, ItMi_Nugget, 1);
	Npc_RemoveInvItems	(hero, ItMi_Zeitspalt_Addon, 1);

	B_ShowGivenThings	("1 Erz und 1 schwarzes Erz gegeben");

	AI_Output(self, hero, "Info_Mod_Myxir_AW_BeliarDolchZutaten_12_01"); //Ausgezeichnet. Ich mache mich gleich an die Arbeit. In wenigen Stunden müsste ich fertig sein.
	AI_Output(hero, self, "Info_Mod_Myxir_AW_BeliarDolchZutaten_15_02"); //Hoffentlich haben wir noch einige Stunden Zeit.

	AI_StopProcessInfos	(self);

	Npc_SetRefuseTalk (self, 3600);

	B_LogEntry	(TOPIC_MOD_BEL_BELIARDOLCH, "Myxir hat die Zutaten für den Dolch und wird eine Weile brauchen, bis er fertig ist.");
};

INSTANCE Info_Mod_Myxir_AW_BeliarDolchFertig (C_INFO)
{
	npc		= Mod_7000_KDS_Myxir_AW;
	nr		= 1;
	condition	= Info_Mod_Myxir_AW_BeliarDolchFertig_Condition;
	information	= Info_Mod_Myxir_AW_BeliarDolchFertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Myxir_AW_BeliarDolchFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_AW_BeliarDolchZutaten))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_AW_BeliarDolchFertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Myxir_AW_BeliarDolchFertig_12_00"); //Hier, nimm den Dolch.

	B_GiveInvItems	(self, hero, ItMw_BeliarDolch, 1);

	AI_UnequipWeapons	(hero);

	EquipItem	(hero, ItMw_BeliarDolch);

	AI_DrawWeapon	(hero);

	AI_PlayAni	(hero, "T_1HSINSPECT");

	AI_Output(self, hero, "Info_Mod_Myxir_AW_BeliarDolchFertig_12_01"); //(aufgebracht) Jetzt ist nicht die Zeit, dir das Ding in jedem Detail anzusehen. Lauf los und töte die Bastarde.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_BEL_BELIARDOLCH, "Ich habe den Dolch und sollte nun gewappnet sein der Gardistin gegenüberzutreten.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_BELIARDOLCH, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Myxir_AW_EXIT (C_INFO)
{
	npc		= Mod_7000_KDS_Myxir_AW;
	nr		= 1;
	condition	= Info_Mod_Myxir_AW_EXIT_Condition;
	information	= Info_Mod_Myxir_AW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Myxir_AW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Myxir_AW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};