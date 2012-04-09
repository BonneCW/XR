// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Sld_8_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Sld_8 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Sld_8_EXIT_Condition;
	information	= Info_Sld_8_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Sld_8_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_EXIT_Info()
{	
	AI_Output(self, hero, "DIA_SLD_8_EXIT_08_00"); //Stirb uns nicht weg!

	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Sld_8_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Sld_8_EinerVonEuchWerden_Condition;
	information	= Info_Sld_8_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Könnt ihr noch einen guten Mann brauchen?";
};                       

FUNC INT Info_Sld_8_EinerVonEuchWerden_Condition()
{
	if (Mod_Gilde == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00"); //Könnt ihr noch einen guten Mann brauchen?
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01"); //Lee wird keine Leute bei den Söldnern zulassen, die nicht schon 'ne Zeit lang hier waren und Erfahrung gesammelt haben.
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02"); //Wenn du hier im Lager bleiben willst, musst du dich zuerst mit Lares in Khorinis rumschlagen.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Sld_8_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Sld_8_WichtigePersonen_Condition;
	information	= Info_Sld_8_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01"); //Wir Söldner folgen alle Lee. Die meisten hier sind einfach Männer, die im Alten Lager nicht bleiben konnten oder wollten.
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_02"); //Hier kocht jeder sein eigenes Süppchen. Die Jungs sind sich nur in einem einig: Wir sammeln hier das ganze Erz aus der Mine. Damit können wir später den König ganz schön unter Druck setzen.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Sld_8_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Sld_8_DasLager_Condition;
	information	= Info_Sld_8_DasLager_Info;
	permanent	= 1;
	description = "Was kannst du mir über dieses Lager erzählen?";
};                       

FUNC INT Info_Sld_8_DasLager_Condition()
{	
	if (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Sld_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00"); //Was kannst du mir über dieses Lager erzählen?
	AI_Output(self,other,"Info_Sld_8_DasLager_08_01"); //Pass auf dich auf, während du hier bist. Im Lager sind 'ne Menge Halsabschneider unterwegs.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_02"); //Es gibt 'ne Reihe ungeschriebener Gesetze hier. Erstens: Nur die Söldner kommen in den Bereich der Magier.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_03"); //Zweitens: Wer versucht, an den Erzhaufen ranzukommen, ist ein toter Mann. Drittens: Ich würde nicht versuchen, in die Kneipe auf dem See zu gehen.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_04"); //Die gehört nämlich den ehemaligen Banditen und die sehen es nicht gerne, wenn grüne Jungs wie du da aufkreuzen.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Sld_8_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Sld_8_DieLage_Condition;
	information	= Info_Sld_8_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht's aus?";
};                       

FUNC INT Info_Sld_8_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,other,"Info_Sld_8_DieLage_08_01"); //Wie immer - wir passen auf, dass keiner dem Erz zu nahe kommt.
};

INSTANCE Info_Mod_SLD_8_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_SLD_8_Pickpocket_Condition;
	information	= Info_Mod_SLD_8_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_SLD_8_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 450);
};

FUNC VOID Info_Mod_SLD_8_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_SLD_8_Pickpocket);

	Info_AddChoice	(Info_Mod_SLD_8_Pickpocket, DIALOG_BACK, Info_Mod_SLD_8_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_SLD_8_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_SLD_8_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_SLD_8_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_SLD_8_Pickpocket);
};

FUNC VOID Info_Mod_SLD_8_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_SLD_8_Pickpocket);
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Sld_8(var c_NPC slf)
{
	Info_Sld_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Sld_8_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Sld_8_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Sld_8_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Sld_8_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_Sld_8_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
