INSTANCE Info_Mod_Danae_Hi (C_INFO)
{
	npc		= GardeInnos_4098_Danae;
	nr		= 1;
	condition	= Info_Mod_Danae_Hi_Condition;
	information	= Info_Mod_Danae_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Danae_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Danae_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Danae_Hi_02_00"); //Seht, wer gekommen ist. Der Anhänger Beliars, der bereits einen von uns getötet hat.
	AI_Output(self, hero, "Info_Mod_Danae_Hi_02_01"); //Du kommst zu spät! Die anderen sind bereits auf der anderen Seite und werden Innos Schwert bergen. Euer Untergang ist besiegelt.
	AI_Output(self, hero, "Info_Mod_Danae_Hi_02_02"); //Wenn ich euch getötet habe, werden wir Khorinis einnehmen.
	AI_Output(hero, self, "Info_Mod_Danae_Hi_15_03"); //Hör' auf zu quatschen, lass uns zur Sache kommen!
	AI_Output(self, hero, "Info_Mod_Danae_Hi_02_04"); //Wie du willst!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};