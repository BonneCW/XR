INSTANCE Info_Mod_Karras_GDG_Kreis1	(C_INFO)
{
	npc		= Mod_6008_DMB_Karras_GDG;
	nr		= 1;
	condition	= Info_Mod_Karras_GDG_Kreis1_Condition;
	information	= Info_Mod_Karras_GDG_Kreis1_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den ersten Kreis der Magie.";
};
FUNC INT Info_Mod_Karras_GDG_Kreis1_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Karras_Hallo))
	&& ((Mod_Gilde == 12)
	|| (Mod_Gilde == 13)
	|| (Mod_Gilde == 14)
	|| (Mod_Gilde == 15)
	|| (Mod_Gilde == 16))
	&& (Mod_MagieKreis == 0)
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Karras_GDG_Kreis1_Info ()
{
	AI_Output (hero, self, "Info_Mod_Karras_GDG_Kreis1_15_00"); //Lehre mich den ersten Kreis der Magie.
	
	if B_TeachMagicCircle (self, hero, 1)
	{
		AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis1_12_01"); //Der erste Kreis erlaubt es dir, Runen, die du erschaffen hast, anzuwenden.
		AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis1_12_02"); //Du kannst jetzt die Formeln der Zaubersprüche lernen, um deine eigenen Runen herzustellen.

		Mod_MagieKreis = 1;
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_02
///////////////////////////////////////////////////////////////////////
INSTANCE Info_Mod_Karras_GDG_Kreis2		(C_INFO)
{
	npc		= Mod_6008_DMB_Karras_GDG;
	nr		= 1;
	condition	= Info_Mod_Karras_GDG_Kreis2_Condition;
	information	= Info_Mod_Karras_GDG_Kreis2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den zweiten Kreis der Magie.";
};
FUNC INT Info_Mod_Karras_GDG_Kreis2_Condition ()
{	
	if ((Mod_Gilde == 12)
	|| (Mod_Gilde == 13)
	|| (Mod_Gilde == 14)
	|| (Mod_Gilde == 15)
	|| (Mod_Gilde == 16))
	&& (Mod_MagieKreis == 1)
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Karras_GDG_Kreis2_Info ()
{
	AI_Output (hero, self, "Info_Mod_Karras_GDG_Kreis2_15_00"); //Lehre mich den zweiten Kreis der Magie.
	
	if (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self, hero, 2)
		{
			AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis2_12_01"); //Tritt nun in den zweiten Kreis und lerne, noch mächtigere Zauber zu wirken.

			Mod_MagieKreis = 2;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis2_12_02"); //Die Zeit ist noch nicht gekommen.
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_03
///////////////////////////////////////////////////////////////////////
INSTANCE Info_Mod_Karras_GDG_Kreis3		(C_INFO)
{
	npc		= Mod_6008_DMB_Karras_GDG;
	nr		= 1;
	condition	= Info_Mod_Karras_GDG_Kreis3_Condition;
	information	= Info_Mod_Karras_GDG_Kreis3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den dritten Kreis der Magie.";
};
FUNC INT Info_Mod_Karras_GDG_Kreis3_Condition ()
{	
	if ((Mod_Gilde == 13)
	|| (Mod_Gilde == 14))
	&& (Mod_MagieKreis == 2)
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Karras_GDG_Kreis3_Info ()
{
	AI_Output (hero, self, "Info_Mod_Karras_GDG_Kreis3_15_00"); //Lehre mich den dritten Kreis der Magie.
	
	if (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self, hero, 3)
		{
			AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis3_12_01"); //Ja, die Zeit ist gekommen. Tritt ein in den dritten Kreis der Magie. Neue Zauber erwarten dich.

			Mod_MagieKreis = 3;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis3_12_02"); //Es ist noch nicht an der Zeit für dich, den dritten Kreis zu lernen.
	};
};		

INSTANCE Info_Mod_Karras_GDG_Kreis4 (C_INFO)
{
	npc		= Mod_6008_DMB_Karras_GDG;
	nr		= 1;
	condition	= Info_Mod_Karras_GDG_Kreis4_Condition;
	information	= Info_Mod_Karras_GDG_Kreis4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will den vierten Kreis der Magie lernen.";
};

FUNC INT Info_Mod_Karras_GDG_Kreis4_Condition()
{	
	if (Mod_MagieKreis == 3)
	&& ((Mod_Gilde == 13)
	|| (Mod_Gilde == 14))
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Karras_GDG_Kreis4_Info ()
{
	AI_Output (hero, self, "Info_Mod_Karras_GDG_Kreis4_15_00"); //Ich will den vierten Kreis der Magie lernen.
	
	if (Kapitel >= 4)
	{
		if B_TeachMagicCircle (self,hero, 4)
		{
			AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis4_12_01"); //Gut. Alle Zeichen sind erfüllt. Tritt nun ein in den vierten Kreis, auf dass dir die Macht der neuen Zauber inne ist.

			Mod_MagieKreis = 4;
		};
	}
	else
	{
			AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis4_12_02"); //Noch ist es nicht soweit.
	};
};

INSTANCE Info_Mod_Karras_GDG_Kreis5 (C_INFO)
{
	npc		= Mod_6008_DMB_Karras_GDG;
	nr		= 1;
	condition	= Info_Mod_Karras_GDG_Kreis5_Condition;
	information	= Info_Mod_Karras_GDG_Kreis5_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will den fünften Kreis der Magie lernen.";
};

FUNC INT Info_Mod_Karras_GDG_Kreis5_Condition()
{	
	if (Mod_MagieKreis == 4)
	&& (Mod_Gilde == 14)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_GDG_Kreis5_Info()
{
	AI_Output (hero, self, "Info_Mod_Karras_GDG_Kreis5_15_00"); //Ich will den fünften Kreis der Magie lernen.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,hero, 5)
		{
			AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis5_12_01"); //Dann tritt nun ein, in den fünften Kreis der Magie. Du wirst nun mächtigere Zauber als je zuvor beherrschen.

			Mod_MagieKreis = 5;
		};
	}
	else
	{
			AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis5_12_02"); //Die Zeit ist noch nicht reif dafür.
	};
};

INSTANCE Info_Mod_Karras_GDG_Kreis6	(C_INFO)
{
	npc		= Mod_6008_DMB_Karras_GDG;
	nr		= 1;
	condition	= Info_Mod_Karras_GDG_Kreis6_Condition;
	information	= Info_Mod_Karras_GDG_Kreis6_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den letzten Kreis der Magie.";
};

FUNC INT Info_Mod_Karras_GDG_Kreis6_Condition()
{	
	if (Mod_MagieKreis == 5)
	&& (Mod_Gilde == 14)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_GDG_Kreis6_Info()
{
	AI_Output (hero, self, "Info_Mod_Karras_GDG_Kreis6_15_00"); //Lehre mich den letzten Kreis der Magie.
	
	if (Kapitel >= 6)
	{
		if B_TeachMagicCircle (self,hero, 6)  
		{
			AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis6_12_01"); //Viel Zeit ist vergangen, seit du den Bund mit Beliar eingegangen bist. Viel ist geschehen und wir finden keine Ruhe.
			AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis6_12_02"); //Du bist der Erwählte Beliars'. Und als solcher wirst du alle Kraft brauchen, um deine Kämpfe zu bestehen.
			AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis6_12_03"); //Ich weihe dich nun, Erwählter. Du trittst in den sechsten Kreis.
			AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis6_12_04"); //Die Zauberformeln des letzten Kreises kannst du nun von Andokai lernen, wenn du es wünscht.

			Mod_MagieKreis = 6;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Karras_GDG_Kreis6_12_05"); //Noch ist es nicht an der Zeit dafür. Wenn du ein Stück weiter auf dem Weg gegangen bist, den Beliar dir zeigt, dann werde ich dich unterweisen.
	};
};

INSTANCE Info_Mod_Karras_GDG_EXIT (C_INFO)
{
	npc		= Mod_6008_DMB_Karras_GDG;
	nr		= 1;
	condition	= Info_Mod_Karras_GDG_EXIT_Condition;
	information	= Info_Mod_Karras_GDG_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Karras_GDG_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Karras_GDG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};