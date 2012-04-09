INSTANCE Info_Mod_Bshydal_Hi (C_INFO)
{
	npc		= Mod_7315_BK_Bshydal_AW;
	nr		= 1;
	condition	= Info_Mod_Bshydal_Hi_Condition;
	information	= Info_Mod_Bshydal_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bshydal_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bshydal_Hi_Info()
{
	AI_TurnToNpc	(self, GardeInnos_4099_Josephina);

	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_02_00"); //Narren, ich habe euch doch nur zu meinem Werkzeug gemacht.
	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_02_01"); //Ihr wart so blind vor fanatischem Eifer, dass ich euch nach meinem Willen lenken konnte, ohne dass ihr es merktet.
	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_02_02"); //Hahaha. Die Macht, die ich euch verliehen habe, nehme ich nun wieder in mich auf ... und zudem den Rest eurer Stärke.

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_02_03"); //Was?! Wie bist du hier hereingekommen? Nunja, das spielt jetzt auch keine Rolle mehr.
	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_02_04"); //In der Truhe direkt hier befindet sich das Artefakt, das Schwert Innos.
	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_02_05"); //Buahaha, wir werden Beliar verbannen und durch die Erschütterung des Gleichgewichtes so mächtig werden, dass nicht mal Innos uns mehr etwas anhaben kann.

	B_SetTopicStatus	(TOPIC_MOD_BEL_GARDEINNOS, LOG_SUCCESS);

	Info_ClearChoices	(Info_Mod_Bshydal_Hi);

	Info_AddChoice	(Info_Mod_Bshydal_Hi, "Mach nur, du hast das Rennen gewonnen und dir das Schwert verdient.", Info_Mod_Bshydal_Hi_B);
	Info_AddChoice	(Info_Mod_Bshydal_Hi, "Nein, das dürft ihr nicht.", Info_Mod_Bshydal_Hi_A);
};

FUNC VOID Info_Mod_Bshydal_Hi_C()
{
	AI_UseMob (self, "CHEST", 1);
	AI_UseMob (self, "CHEST", -1);

	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_C_02_00"); //(erschrocken) Wie, was ... nein ... das kann nicht sein.
	AI_Output(hero, self, "Info_Mod_Bshydal_Hi_C_15_01"); //Hä, was ist jetzt los?
	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_C_02_02"); //Es ... es ist unmöglich, die Aufzeichnungen, es hat alles gestimmt. (wütend) Betrug, Täuschung, Verrat!
	AI_Output(hero, self, "Info_Mod_Bshydal_Hi_C_15_03"); //Ohh, scheinbar hat er nicht das gefunden, was er erhoffte.
	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_C_02_04"); //(außer sich) Verflucht, es darf nicht sein. Nein, nein, arrrrghhh ...
	AI_Output(hero, self, "Info_Mod_Bshydal_Hi_C_15_05"); //Der scheint jetzt aber mächtig angefressen.

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_C_02_06"); //(wahnsinnig) Ja, du warst es, du musst es gewesen sein, du hast es geraubt.
	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_C_02_07"); //Ich werde dich in tausend Stücke hacken und das Schwert an mich nehmen (durchgeknallt) und dann ... ja, (schreit) werde ich die Welt beherrschen. Stirb!
	
	Info_ClearChoices	(Info_Mod_Bshydal_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

FUNC VOID Info_Mod_Bshydal_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Bshydal_Hi_B_15_00"); //Mach nur, du hast das Rennen gewonnen und dir das Schwert verdient.
	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_B_02_01"); //(irritiert) Wie ... ähh, was?
	AI_Output(hero, self, "Info_Mod_Bshydal_Hi_B_15_02"); //Ja, es war ein langes und zähes Ringen um das Schwert, das du für dich entschieden hast. Du bist also auch der würdige Träger des Schwertes.
	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_B_02_03"); //Was soll das werden ...? Egal. (grimmig) Ich nehme jetzt die Waffe an mich. (mit gezwungenem und knappem Lachen) Haha.
	
	Info_Mod_Bshydal_Hi_C();
};

FUNC VOID Info_Mod_Bshydal_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Bshydal_Hi_A_15_00"); //Nein, das dürft ihr nicht. Ihr würdet der Welt damit unvorstellbaren Schaden zufügen.
	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_A_02_01"); //Hahaha, dein Gejammer wird mich bestimmt nicht aufhalten.
	AI_Output(self, hero, "Info_Mod_Bshydal_Hi_A_02_02"); //Dafür wirst du dir Ehre haben, als Erster durch die Waffe zu sterben ... noch vor deinem Meister.
	AI_Output(hero, self, "Info_Mod_Bshydal_Hi_A_15_03"); //Neeein ...
	
	Info_Mod_Bshydal_Hi_C();
};

INSTANCE Info_Mod_Bshydal_NichtTot (C_INFO)
{
	npc		= Mod_7316_BK_Bshydal_AW;
	nr		= 1;
	condition	= Info_Mod_Bshydal_NichtTot_Condition;
	information	= Info_Mod_Bshydal_NichtTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bshydal_NichtTot_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bshydal_NichtTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Bshydal_NichtTot_02_00"); //Hehehe ...
	AI_Output(hero, self, "Info_Mod_Bshydal_NichtTot_15_01"); //Wie, was, ich habe dich doch gerade ...
	AI_Output(self, hero, "Info_Mod_Bshydal_NichtTot_02_02"); //Erschlagen? Narr, ich trage die Macht der Garde Innos’ in mir. Damit bin ich nun fast unsterblich.
	AI_Output(hero, self, "Info_Mod_Bshydal_NichtTot_15_03"); //Diese Stärke und Macht ... überwältigend. Arrghhhh.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};