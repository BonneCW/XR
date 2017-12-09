INSTANCE Info_Mod_UndeadOrkShamane_Hi (C_INFO)
{
	npc		= Mod_10032_ORC_UndeadShamane_MT;
	nr		= 1;
	condition	= Info_Mod_UndeadOrkShamane_Hi_Condition;
	information	= Info_Mod_UndeadOrkShamane_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_UndeadOrkShamane_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_UndeadOrkShamane_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_UndeadOrkShamane_Hi_18_00"); //(zu sich selbst) Ein Buch von großer magischer Kraft spüre ich. Nur zu neugierig bin ich, welche Bewandtnis es damit auf sich hat.
	AI_Output(self, hero, "Info_Mod_UndeadOrkShamane_Hi_18_01"); //(zu dem Helden) Was, du hier, der meinen alten Meister einst verbannte?! Ich ziehe mich lieber mit dem Buch an einen Ort toter Stille zurück, um mich ihm ungestört zu widmen.

	B_LogEntry	(TOPIC_MOD_THERIDDLE, "Verdammt. Dieser untote Orkschamane hat mir einfach das Buch vor der Nase weggeklaut und sich an einen 'Ort toter Stille' abgesetzt, was immer er damit auch meinte.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	AI_Teleport	(self, "TOT");

	Mod_NL_UOS_Day = Wld_GetDay();
};