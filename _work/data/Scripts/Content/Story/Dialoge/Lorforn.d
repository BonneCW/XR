INSTANCE Info_Mod_Lorforn_Hi (C_INFO)
{
	npc		= Mod_1962_OUT_Lorforn_TUG;
	nr		= 1;
	condition	= Info_Mod_Lorforn_Hi_Condition;
	information	= Info_Mod_Lorforn_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lorforn_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lorforn_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_06_00"); //Was? Wer bist du denn?

	Info_ClearChoices	(Info_Mod_Lorforn_Hi);

	Info_AddChoice	(Info_Mod_Lorforn_Hi, "Was geht dich das an?", Info_Mod_Lorforn_Hi_C);
	Info_AddChoice	(Info_Mod_Lorforn_Hi, "Ich bin gekommen, um die Goblin-Matronen zu töten.", Info_Mod_Lorforn_Hi_B);
	Info_AddChoice	(Info_Mod_Lorforn_Hi, "Ich bin dein schlimmster Albtraum!", Info_Mod_Lorforn_Hi_A);
};

FUNC VOID Info_Mod_Lorforn_Hi_H()
{
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_H_06_00"); //Aber das ist ... die Wahrheit, ja.
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_H_15_01"); //Du erzählst mir jetzt sofort, was du hier machst, oder ich bringe dich um.
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_H_06_02"); //Okay, okay, ich rede. Ich wurde geschickt, um ... ähm ...
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_H_15_03"); //Soll ich deinem Gedächtnis auf die Sprünge helfen?
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_H_06_04"); //Ich rede ja schon! Ich ... wurde geschickt, um hier ein Erdbeben auszulösen. Dadurch wird dieses blöde Tal von Goblins zerfressen.
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_H_06_05"); //Ja, und diese doofen Magier haben ein ordentliches Problem. Ähm ... du bringst mich doch jetzt nicht um, oder?
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_H_15_06"); //Das überlege ich mir noch.
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_H_06_07"); //Bitte! Ich habe dir alles erzählt! Lass mich laufen, ich werde mich nie wieder hier blicken lassen, ehrlich!

	Info_ClearChoices	(Info_Mod_Lorforn_Hi);

	Info_AddChoice	(Info_Mod_Lorforn_Hi, "Na gut, zisch ab. Aber lass dich nie wieder hier blicken.", Info_Mod_Lorforn_Hi_N);
	Info_AddChoice	(Info_Mod_Lorforn_Hi, "Du bist zu gefährlich. Ich werde dich umbringen.", Info_Mod_Lorforn_Hi_M);
};

FUNC VOID Info_Mod_Lorforn_Hi_I()
{
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_I_06_00"); //Ich ... bewundere die schöne Natur.
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_I_15_01"); //Das glaubst du doch wohl selbst nicht.

	Info_Mod_Lorforn_Hi_H();
};

FUNC VOID Info_Mod_Lorforn_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_C_15_00"); //Was geht dich das an?
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_C_06_01"); //Nein, nein, natürlich geht es mich nichts an, ich bin nur neugierig.
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_C_15_02"); //Zu neugierig für meinen Geschmack.
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_C_06_03"); //Was ... hast du jetzt vor?
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_C_15_04"); //Vielleicht haue ich dich einmal und du verrätst mir, was du hier machst.
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_C_06_05"); //Du brauchst mich nicht zu hauen!

	Info_Mod_Lorforn_Hi_I();
};

FUNC VOID Info_Mod_Lorforn_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_B_15_00"); //Ich bin gekommen, um die Goblin-Matronen zu töten.
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_B_06_01"); //Ähm ... davon würde ich dir abraten, ehrlich.
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_B_15_02"); //Warum?
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_B_06_03"); //Ähm ... die sind groß ... und stark, ja. Ich würde mich nicht an sie heran wagen.
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_B_15_04"); //Damit komme ich schon klar.
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_B_06_05"); //Und sie haben magische Kräfte, ja!

	Info_ClearChoices	(Info_Mod_Lorforn_Hi);

	Info_AddChoice	(Info_Mod_Lorforn_Hi, "Damit werde ich auch fertig.", Info_Mod_Lorforn_Hi_E);
	Info_AddChoice	(Info_Mod_Lorforn_Hi, "Wollen wir mal zusammen nachsehen?", Info_Mod_Lorforn_Hi_D);
};

FUNC VOID Info_Mod_Lorforn_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_E_15_00"); //Damit werde ich auch fertig.
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_E_06_01"); //Habe ich schon erwähnt, dass sie riesig sind?
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_E_15_02"); //Sag mal – willst du mich verarschen?

	Info_Mod_Lorforn_Hi_H();
};

FUNC VOID Info_Mod_Lorforn_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_D_15_00"); //Wollen wir mal zusammen nachsehen?
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_D_06_01"); //Wie? Was? Das ist mir viel zu gefährlich.
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_D_15_02"); //War nur ein Witz. Was machst du eigentlich hier?

	Info_Mod_Lorforn_Hi_I();
};

FUNC VOID Info_Mod_Lorforn_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_A_15_00"); //Ich bin dein schlimmster Albtraum!
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_A_06_01"); //Hey! Ich ... ich habe dir doch nichts getan!

	Info_ClearChoices	(Info_Mod_Lorforn_Hi);

	Info_AddChoice	(Info_Mod_Lorforn_Hi, "Was machst DU denn hier?", Info_Mod_Lorforn_Hi_G);
	Info_AddChoice	(Info_Mod_Lorforn_Hi, "Ich habe keine Zeit für ein Gespräch, ich werde dich jetzt umhauen.", Info_Mod_Lorforn_Hi_F);
};

FUNC VOID Info_Mod_Lorforn_Hi_G()
{
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_G_15_00"); //Was machst DU denn hier?

	Info_Mod_Lorforn_Hi_I();
};

FUNC VOID Info_Mod_Lorforn_Hi_F()
{
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_F_15_00"); //Ich habe keine Zeit für ein Gespräch, ich werde dich jetzt umhauen.
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_F_06_01"); //Dann wirst du ... ähm ... halt sterben, ja!

	Info_ClearChoices	(Info_Mod_Lorforn_Hi);

	Info_AddChoice	(Info_Mod_Lorforn_Hi, "War nur ein Scherz, was machst du denn hier?", Info_Mod_Lorforn_Hi_L);
	Info_AddChoice	(Info_Mod_Lorforn_Hi, "Dann komm mal her, Bürschchen!", Info_Mod_Lorforn_Hi_K);
};

FUNC VOID Info_Mod_Lorforn_Hi_L()
{
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_L_15_00"); //War nur ein Scherz, was machst du denn hier?

	Info_Mod_Lorforn_Hi_I();
};

FUNC VOID Info_Mod_Lorforn_Hi_K()
{
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_K_15_00"); //Dann komm mal her, Bürschchen!
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_K_06_01"); //Stirb!

	Info_ClearChoices	(Info_Mod_Lorforn_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

FUNC VOID Info_Mod_Lorforn_Hi_N()
{
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_N_15_00"); //Na gut, zisch ab. Aber lass dich nie wieder hier blicken.
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_N_06_01"); //Das werde ich dir nie vergessen.

	B_LogEntry	(TOPIC_MOD_FERCO_GOBLIN, "Ich habe auf dem Weg zu den Matronen einen Typen getroffen, der wahrscheinlich für das Erdbeben verantwortlich ist. Er meinte, er wäre von irgendjemandem geschickt worden.");

	TUG_Lorforn = TRUE;

	Info_ClearChoices	(Info_Mod_Lorforn_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Lorforn_Hi_M()
{
	AI_Output(hero, self, "Info_Mod_Lorforn_Hi_M_15_00"); //Du bist zu gefährlich. Ich werde dich umbringen.
	AI_Output(self, hero, "Info_Mod_Lorforn_Hi_M_06_01"); //Das wirst du ... bereuen!

	Info_ClearChoices	(Info_Mod_Lorforn_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Lorforn_EXIT (C_INFO)
{
	npc		= Mod_1962_OUT_Lorforn_TUG;
	nr		= 1;
	condition	= Info_Mod_Lorforn_EXIT_Condition;
	information	= Info_Mod_Lorforn_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lorforn_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lorforn_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};