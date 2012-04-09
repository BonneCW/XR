INSTANCE Info_Mod_Cedric_IR_Hi (C_INFO)
{
	npc		= Mod_7460_RIT_Cedric_IR;
	nr		= 1;
	condition	= Info_Mod_Cedric_IR_Hi_Condition;
	information	= Info_Mod_Cedric_IR_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cedric_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cedric_IR_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Cedric_IR_Hi_12_00"); //Welch ein finsterer, abscheulicher Ort. Hier scheint Innos ferner, als sonst irgendwo auf der Welt.
	AI_Output(self, hero, "Info_Mod_Cedric_IR_Hi_12_01"); //Es ist unsere Aufgabe, als seine Stellvertreter die Insel  zu betreten und alle unheilige Brut für immer von diesem gottverlassenen Ort zu bannen.
	AI_Output(hero, self, "Info_Mod_Cedric_IR_Hi_15_02"); //Ja, mal schauen, wer mitkommt. Ich glaube nicht, dass ein paar kampferprobte Gefährten zur Begleitung verfehlt wären.
	AI_Output(self, hero, "Info_Mod_Cedric_IR_Hi_12_03"); //Ich werde hier bleiben und über das Schiff wachen.
	AI_Output(self, hero, "Info_Mod_Cedric_IR_Hi_12_04"); //Zur Seite werden dir drei kampferprobte Paladine stehen, und Milten, wenn es dein Wunsch ist.

	if (Mod_DiegoDabei > 0)
	|| (Mod_LesterDabei > 0)
	|| (Mod_AngarDabei > 0)
	|| (Mod_NamibDabei > 0)
	|| (Mod_VatrasDabei > 0)
	|| (Mod_EthanDabei > 0)
	|| (Mod_RandolphDabei > 0)
	{
		AI_Output(hero, self, "Info_Mod_Cedric_IR_Hi_15_05"); //Und was ist dem den anderen an Bord?
		AI_Output(self, hero, "Info_Mod_Cedric_IR_Hi_12_06"); //Ich sagte bereits, es entspricht Innos Willen, dass seine Diener dieses Eiland seinem Segen zuführen.
		AI_Output(self, hero, "Info_Mod_Cedric_IR_Hi_12_07"); //Niemand anders besitzt den nötigen Glauben und die Stärke.
		AI_Output(hero, self, "Info_Mod_Cedric_IR_Hi_15_08"); //Aber ...
		AI_Output(self, hero, "Info_Mod_Cedric_IR_Hi_12_09"); //(energisch) Ich diskutiere nicht darüber.
		AI_Output(self, hero, "Info_Mod_Cedric_IR_Hi_12_10"); //Nimm die Streiter, die dir zur Seite gestellt wurden und tue das, wofür du herkamst.
	};

	AI_Output(self, hero, "Info_Mod_Cedric_IR_Hi_12_11"); //Was bei Innos ...?!

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(PC_Friend_IR, "SHIP_CREW_CAPTAIN");

	Mod_IR_Keroloth = 1;
	Mod_IR_Marcos = 1;
	Mod_IR_Gerold = 1;
	Mod_IR_Milten = 1;

	B_StartOtherRoutine	(Mod_7443_KDF_Milten_IR, "FOLLOW");
	B_StartOtherRoutine	(Mod_7462_RIT_Gerold_IR, "FOLLOW");
	B_StartOtherRoutine	(Mod_7461_RIT_Marcos_IR, "FOLLOW");
	B_StartOtherRoutine	(Mod_7463_RIT_Keroloth_IR, "FOLLOW");
};

INSTANCE Info_Mod_Cedric_IR_Argez (C_INFO)
{
	npc		= Mod_7460_RIT_Cedric_IR;
	nr		= 1;
	condition	= Info_Mod_Cedric_IR_Argez_Condition;
	information	= Info_Mod_Cedric_IR_Argez_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cedric_IR_Argez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_IR_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cedric_IR_Argez_Info()
{
	AI_Output(self, hero, "Info_Mod_Cedric_IR_Argez_12_00"); //(außer sich) Dieser Mann erdreistet sich als Blinder Passagier auf das königliche Schiff zu kommen?!
	AI_Output(self, hero, "Info_Mod_Cedric_IR_Argez_12_01"); //Ein Schiff der Paladine, dass in heiliger Mission unterwegs ist?!
	AI_Output(hero, self, "Info_Mod_Cedric_IR_Argez_15_02"); //Reg dich nicht auf, er steht auf unserer Seite ...
	AI_Output(self, hero, "Info_Mod_Cedric_IR_Argez_12_03"); //Achja, wieso sollte ich das annehmen?
	AI_Output(self, hero, "Info_Mod_Cedric_IR_Argez_12_04"); //Er könnte ein Spion des Feindes sein, der sich auf unser Schiff eingeschlichen hat, unsere heilige Mission zu sabotieren.
	AI_Output(hero, self, "Info_Mod_Cedric_IR_Argez_15_05"); //Nein, er stand mir und den Magiern bereits hilfreich mit Rat und Tat zur Seite. Wir können ihm vertrauen.
	AI_Output(self, hero, "Info_Mod_Cedric_IR_Argez_12_06"); //(etwas ruhiger) Wer weiß ... Nun gut, aber ich werde ihn dennoch nicht aus den Augen lassen ... und jetzt geh deiner Aufgabe nach!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Cedric_IR_Fertig (C_INFO)
{
	npc		= Mod_7460_RIT_Cedric_IR;
	nr		= 1;
	condition	= Info_Mod_Cedric_IR_Fertig_Condition;
	information	= Info_Mod_Cedric_IR_Fertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cedric_IR_Fertig_Condition()
{
	if (Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cedric_IR_Fertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Cedric_IR_Fertig_12_00"); //Hey, ich habe gehört, dass du alles erledigt hast.
	AI_Output(self, hero, "Info_Mod_Cedric_IR_Fertig_12_01"); //Für Glückwünsche gibt es ja während der Fahrt noch genug Zeit.
	AI_Output(self, hero, "Info_Mod_Cedric_IR_Fertig_12_02"); //Können wir dann endlich wieder in See stechen?
	AI_Output(hero, self, "Info_Mod_Cedric_IR_Fertig_15_03"); //Ja, ich wüsste keinen Grund warum nicht.
	AI_Output(self, hero, "Info_Mod_Cedric_IR_Fertig_12_04"); //Gut, hier ist der Schlüssel für die Kajüte, hau dich ein wenig aufs Ohr, während ich die Segel setze.

	B_GiveInvItems	(self, hero, ItKe_Irdorath, 1);
};

INSTANCE Info_Mod_Cedric_IR_EXIT (C_INFO)
{
	npc		= Mod_7460_RIT_Cedric_IR;
	nr		= 1;
	condition	= Info_Mod_Cedric_IR_EXIT_Condition;
	information	= Info_Mod_Cedric_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Cedric_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cedric_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};