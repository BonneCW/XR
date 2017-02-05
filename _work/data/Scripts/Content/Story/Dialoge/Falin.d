INSTANCE Info_Mod_Falin_Hi (C_INFO)
{
	npc		= Mod_7475_SLD_Falin_MT;
	nr		= 1;
	condition	= Info_Mod_Falin_Hi_Condition;
	information	= Info_Mod_Falin_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo! Wer bist du und was machst du hier?";
};

FUNC INT Info_Mod_Falin_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Falin_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Falin_Hi_15_00"); //Hallo! Wer bist du und was machst du hier?
	AI_Output(self, hero, "Info_Mod_Falin_Hi_07_01"); //Ich bin Falin und auf dem Weg ins alte Kloster.
	AI_Output(hero, self, "Info_Mod_Falin_Hi_15_02"); //Und was lungerst du dann hier rum?
	AI_Output(self, hero, "Info_Mod_Falin_Hi_07_03"); //War neugierig. Wusste nicht, dass hier ein Lager ist.
	AI_Output(hero, self, "Info_Mod_Falin_Hi_15_04"); //Dies ist das Waldläuferlager. Der Druide Cyrco ist der Anführer. Wir suchen Nahkämpfer zur Verstärkung.
	AI_Output(self, hero, "Info_Mod_Falin_Hi_07_05"); //Ehrlich? Das könnte mir gefallen. Immer der selbe Trott bei uns. Wache schieben oder rumsitzen in der Höhle.
	AI_Output(hero, self, "Info_Mod_Falin_Hi_15_06"); //Da ist hier mehr los. Also willst du?
	AI_Output(self, hero, "Info_Mod_Falin_Hi_07_07"); //Ich muss erst dieses Paket ins Kloster bringen.
	AI_Output(hero, self, "Info_Mod_Falin_Hi_15_08"); //Weißt du was? Ich bring das rüber. Du gehst ins Lager. Sag der Torwache, du bist ein Neuer. Er wird dich zu Cyrco schicken.
	AI_Output(self, hero, "Info_Mod_Falin_Hi_07_09"); //Das wäre mir grad recht. Hier, das Paket.

	B_GiveInvItems	(self, hero, ItMi_PaketFalin, 1);

	B_LogEntry	(TOPIC_MOD_JG_NAHKAMPF, "Möglicherweise habe ich schon einen Söldner gefunden, jetzt mal in Khorinis nachfragen. Ach ja. Und das Paket fürs Kloster ...");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "LAGER");
};

INSTANCE Info_Mod_Falin_EXIT (C_INFO)
{
	npc		= Mod_7475_SLD_Falin_MT;
	nr		= 1;
	condition	= Info_Mod_Falin_EXIT_Condition;
	information	= Info_Mod_Falin_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Falin_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Falin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};