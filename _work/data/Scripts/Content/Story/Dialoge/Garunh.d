INSTANCE Info_Mod_Garunh_Hi (C_INFO)
{
	npc		= Mod_10045_Orc_Garunh_EIS;
	nr		= 1;
	condition	= Info_Mod_Garunh_Hi_Condition;
	information	= Info_Mod_Garunh_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Garunh_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baro_Orkring2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garunh_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Garunh_Hi_18_00"); //Du sein Mensch von weit entfernten Ort.
	AI_Output(self, hero, "Info_Mod_Garunh_Hi_18_01"); //Ich berichte dir nicht nur von bösen Orks, sondern auch von bösen Menschen aus diesem Tal.
};

INSTANCE Info_Mod_Garunh_Orkring (C_INFO)
{
	npc		= Mod_10045_Orc_Garunh_EIS;
	nr		= 1;
	condition	= Info_Mod_Garunh_Orkring_Condition;
	information	= Info_Mod_Garunh_Orkring_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was weißt du über die bösen Orks?";
};

FUNC INT Info_Mod_Garunh_Orkring_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garunh_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garunh_Orkring_Info()
{
	AI_Output(hero, self, "Info_Mod_Garunh_Orkring_15_00"); //Was weißt du über die bösen Orks?
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring_18_01"); //Böse Orks sind sehr abergläubig. Sie vergöttern die  Macht des Erschaffers.
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring_18_02"); //Er ist sehr stark, seitdem er im Tempel unter den Bergen war.
};

INSTANCE Info_Mod_Garunh_Orkring2 (C_INFO)
{
	npc		= Mod_10045_Orc_Garunh_EIS;
	nr		= 1;
	condition	= Info_Mod_Garunh_Orkring2_Condition;
	information	= Info_Mod_Garunh_Orkring2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer sind eigentlich die bösen Menschen?";
};

FUNC INT Info_Mod_Garunh_Orkring2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garunh_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garunh_Orkring2_Info()
{
	AI_Output(hero, self, "Info_Mod_Garunh_Orkring2_15_00"); //Wer sind eigentlich die bösen Menschen?
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring2_18_01"); //Böse Menschen, haben Waffen einer alten Schmiede gefunden.
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring2_18_02"); //Waffen die nicht rosten und für Orks geschmiedet wurden.
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring2_18_03"); //Sie liefern den Orks die Waffen und Orks bezahlen mit Artefakten unserer Kultur.
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring2_18_04"); //Sie haben Ring von meinen Ahnen an die Menschen gegeben und Garunh muss ihn wieder zurückerlangen, um Ehre nicht zu beschmutzen.
};

INSTANCE Info_Mod_Garunh_Orkring3 (C_INFO)
{
	npc		= Mod_10045_Orc_Garunh_EIS;
	nr		= 1;
	condition	= Info_Mod_Garunh_Orkring3_Condition;
	information	= Info_Mod_Garunh_Orkring3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie können wir die Orks daran hindern den Pass anzugreifen?";
};

FUNC INT Info_Mod_Garunh_Orkring3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garunh_Orkring))
	&& (Npc_KnowsInfo(hero, Info_Mod_Garunh_Orkring2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garunh_Orkring3_Info()
{
	AI_Output(hero, self, "Info_Mod_Garunh_Orkring3_15_00"); //Wie können wir die Orks daran hindern den Pass anzugreifen?
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring3_18_01"); //Wenn Mensch helfen Garunh, seinen Ring von bösen Menschen zu holen, dann er auch Stärke von Orks schwächen.
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring3_18_02"); //Böse Menschen haben Höhle. Garunh begleiten dich zu ihr.

	B_LogEntry	(TOPIC_MOD_EIS_ORKRING, "Damit Garunh mir gegen die Orks am Pass hilft muss ich ihm zuerst helfen einen alten Ring von den Banditen zurückzuerobern. Er wird mich zu ihnen führen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETOBANDITEN");

	self.aivar[AIV_Partymember] = TRUE;
};

INSTANCE Info_Mod_Garunh_Orkring4 (C_INFO)
{
	npc		= Mod_10045_Orc_Garunh_EIS;
	nr		= 1;
	condition	= Info_Mod_Garunh_Orkring4_Condition;
	information	= Info_Mod_Garunh_Orkring4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Garunh_Orkring4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garunh_Orkring3))
	&& (Npc_GetDistToWP(self, "NORDOSTENLOCH_11") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garunh_Orkring4_Info()
{
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring4_18_00"); //Böse Menschen befinden sich hinter Hütte im Berg. Eingang sein zu klein für Orks, deswegen sind Menschen hier sicher.
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring4_18_01"); //Garunh muss hier warten und auf Erfolg von Mensch hoffen.
	AI_Output(hero, self, "Info_Mod_Garunh_Orkring4_15_02"); //Ich finde deinen Ring schon, halt mir einfach hier draußen den Rücken frei.

	B_LogEntry	(TOPIC_MOD_EIS_ORKRING, "Wir sind bei der Höhle angekommen. Da der Eingang allerdings zu klein für Garunh ist, muss ich mich den Banditen alleine stellen.");
};

INSTANCE Info_Mod_Garunh_Orkring5 (C_INFO)
{
	npc		= Mod_10045_Orc_Garunh_EIS;
	nr		= 1;
	condition	= Info_Mod_Garunh_Orkring5_Condition;
	information	= Info_Mod_Garunh_Orkring5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die bösen Menschen und ihr Anfüher sind tot.";
};

FUNC INT Info_Mod_Garunh_Orkring5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garunh_Orkring))
	&& (Npc_KnowsInfo(hero, Info_Mod_Garunh_Orkring2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garunh_Orkring5_Info()
{
	AI_Output(hero, self, "Info_Mod_Garunh_Orkring5_15_00"); //Die bösen Menschen und ihr Anfüher sind tot. Bei ihm habe ich auch deinen Ring gefunden.

	B_GiveInvItems	(hero, self, ItRi_Garunh, 1);

	AI_Output(self, hero, "Info_Mod_Garunh_Orkring5_18_01"); //Danke, Mensch, jetzt du haben meine Ehre gerettet. Ich will dir Geheimnis von Orks verraten.
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring5_18_02"); //Vor vielen Jahren haben Orks in den Bergen großen Tempel gefunden.
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring5_18_03"); //Der mutigste war Schamane Asek. Er sein der erste gewesen, der Tempel betreten hat.
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring5_18_04"); //In der Artefakthalle fand er viele mächtige Artefakte, doch keins interessierte ihn, außer Stab des Erschaffers.
	AI_Output(hero, self, "Info_Mod_Garunh_Orkring5_15_05"); //Was soll das für ein Stab sein? Und wer ist der Erschaffer?
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring5_18_06"); //Stab sein so stark wie Erschaffer und Erschaffer jeder sein, der Stab besitzt.
	AI_Output(hero, self, "Info_Mod_Garunh_Orkring5_15_07"); //Heißt das, dass man mit ihm alles erschaffen kann, was man will?
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring5_18_08"); //Sein göttliches Artefakt, nicht für Orks oder Menschen bestimmt.
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring5_18_09"); //Asek können nur Tod erschaffen. Und das er haben gemacht, um sich und Tempel zu schützen.
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring5_18_10"); //Aber Asek wollte mehr. Er haben nicht nur lebende Orks im Tempel zu lebenden Toten gemacht, sondern auch tote Orks von Friedhof aufstehen lassen.
	AI_Output(hero, self, "Info_Mod_Garunh_Orkring5_15_11"); //Moment mal, soll das heißen die Orks im Wald sind untote Orks?
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring5_18_12"); //Ja, Asek nur haben ganz wenige am Leben gelassen. Nur Anführer sind noch lebendig.
	AI_Output(hero, self, "Info_Mod_Garunh_Orkring5_15_13"); //Wo befindet sich der Tempel, in dem Asek sein Versteck hat?
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring5_18_14"); //Das können dir nur lebender Ork-Anfüher sagen. Da du Sprache aber nicht kannst, brauchst du Übersetzer.
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring5_18_15"); //Baro haben von Mensch erzählt, der Orks studiert hat. Am besten du gehen zu ihm.
	AI_Output(self, hero, "Info_Mod_Garunh_Orkring5_18_16"); //Wenn du weißt, wo Asek ist, du können mich aufsuchen bei Zelt. Viel Erfolg, Mensch.

	B_GivePlayerXP	(250);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_EIS_ORKRING, LOG_SUCCESS);

	Log_CreateTopic	(TOPIC_MOD_EIS_UNTOTEORKS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EIS_UNTOTEORKS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EIS_UNTOTEORKS, "Garunh hat mir erzählt, was es mit den Orks auf sich hat. Offenbar hat ein Schamane namens Asek einen mächtigen Stab in einem Tempel gefunden, mit dessen Hilfe er nahezu alle Orks in Untote verwandelt hat und zusätzlich noch tote Orks hat auferstehen lassen. Um seinen Aufenthaltsort zu erfahren soll ich mit Baro sprechen, da er jemanden kennt, der die Sprache der Orks studiert hat. Danach muss ich einen Ork-Anführer finden und die Informationen beschaffen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	self.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Garunh_EXIT (C_INFO)
{
	npc		= Mod_10045_Orc_Garunh_EIS;
	nr		= 1;
	condition	= Info_Mod_Garunh_EXIT_Condition;
	information	= Info_Mod_Garunh_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Garunh_EXIT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garunh_Orkring3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garunh_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};