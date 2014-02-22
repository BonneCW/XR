INSTANCE Info_Mod_Penner_ReallyHi (C_INFO)
{
	npc		= Mod_7540_OUT_Penner_REL;
	nr		= 1;
	condition	= Info_Mod_Penner_ReallyHi_Condition;
	information	= Info_Mod_Penner_ReallyHi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Penner_ReallyHi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Penner_ReallyHi_Info()
{
	AI_Output(self, hero, "Info_Mod_Penner_ReallyHi_27_00"); //Haste mal 'ne Münze?
	AI_Output(hero, self, "Info_Mod_Penner_ReallyHi_15_01"); //Ich habe ziemlich viele Münzen.
	AI_Output(self, hero, "Info_Mod_Penner_ReallyHi_27_02"); //(geduldig) Und gibste mir eine davon ab?
	AI_Output(hero, self, "Info_Mod_Penner_ReallyHi_15_03"); //Na, ich weiß nicht. Beantworte meine Fragen, und ich überleg's mir vielleicht.
};

INSTANCE Info_Mod_Penner_OnlyPenner (C_INFO)
{
	npc		= Mod_7540_OUT_Penner_REL;
	nr		= 1;
	condition	= Info_Mod_Penner_OnlyPenner_Condition;
	information	= Info_Mod_Penner_OnlyPenner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du der einzige Obdachlose hier?";
};

FUNC INT Info_Mod_Penner_OnlyPenner_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Penner_OnlyPenner_Info()
{
	AI_Output(hero, self, "Info_Mod_Penner_OnlyPenner_15_00"); //Bist du der einzige Obdachlose hier?
	AI_Output(self, hero, "Info_Mod_Penner_OnlyPenner_27_01"); //Jup. Das ist ein Vorteil. Ich habe keine Konkurrenz.
};

INSTANCE Info_Mod_Penner_WarumArm (C_INFO)
{
	npc		= Mod_7540_OUT_Penner_REL;
	nr		= 1;
	condition	= Info_Mod_Penner_WarumArm_Condition;
	information	= Info_Mod_Penner_WarumArm_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie hast du es geschafft, in einer so reichen Stadt arm zu werden?";
};

FUNC INT Info_Mod_Penner_WarumArm_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Penner_WarumArm_Info()
{
	AI_Output(hero, self, "Info_Mod_Penner_WarumArm_15_00"); //Wie hast du es geschafft, in einer so reichen Stadt arm zu werden?
	AI_Output(self, hero, "Info_Mod_Penner_WarumArm_27_01"); //Dass ich ein Penner bin, heißt doch nicht, dass ich arm bin. Ich habe sogar viel Geld.
	AI_Output(self, hero, "Info_Mod_Penner_WarumArm_27_02"); //Meinen Beruf konnte ich mir aussuchen. Und was gibt es Schöneres, als den ganzen Tag faul herumzusitzen, Gespräche aufzuschnappen und Informationen für bare Münze zu verkaufen?
	AI_Output(hero, self, "Info_Mod_Penner_WarumArm_15_03"); //Du handelst mit Informationen?
	AI_Output(self, hero, "Info_Mod_Penner_WarumArm_27_04"); //Kann man so sagen. Alles hat seinen Preis.
};

INSTANCE Info_Mod_Penner_Infos (C_INFO)
{
	npc		= Mod_7540_OUT_Penner_REL;
	nr		= 1;
	condition	= Info_Mod_Penner_Infos_Condition;
	information	= Info_Mod_Penner_Infos_Info;
	permanent	= 1;
	important	= 0;
	description	= "Verkauf mir Informationen ...";
};

FUNC INT Info_Mod_Penner_Infos_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Penner_Infos_Choices()
{
	Info_ClearChoices	(Info_Mod_Penner_Infos);

	Info_AddChoice	(Info_Mod_Penner_Infos, DIALOG_BACK, Info_Mod_Penner_Infos_BACK);

	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_Elvira))
	&& (Npc_HasItems(Mod_7499_KDF_Elvira_REL, ItKe_RELMagier) == 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 50)
	{
		Info_AddChoice	(Info_Mod_Penner_Infos, "Kannst du mir etwas über Elvira erzählen? (50 Gold)", Info_Mod_Penner_Infos_F);
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Juliana_WasLos))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Wendel_Endres03))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 10)
	{
		Info_AddChoice	(Info_Mod_Penner_Infos, "Was kannst du mir über das Verschwinden von Julianas Mann erzählen? (10 Gold)", Info_Mod_Penner_Infos_E);
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Buerger2))
	&& (Mod_REL_Buerger == 0)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 50)
	{
		Info_AddChoice	(Info_Mod_Penner_Infos, "Wer ist Hauptverantwortlicher für die Wasserversorgung? (50 Gold)", Info_Mod_Penner_Infos_D);
		Info_AddChoice	(Info_Mod_Penner_Infos, "Wie viele Stände hat der Marktplatz von Khorata? (50 Gold)", Info_Mod_Penner_Infos_C);
		Info_AddChoice	(Info_Mod_Penner_Infos, "Wie hießen die drei Ratten des Stadthalters? (50 Gold)", Info_Mod_Penner_Infos_B);
		Info_AddChoice	(Info_Mod_Penner_Infos, "Wo finde ich hier einen Abort? (50 Gold)", Info_Mod_Penner_Infos_A);
	};
};

FUNC VOID Info_Mod_Penner_Infos_Info()
{
	AI_Output(hero, self, "Info_Mod_Penner_Infos_15_00"); //Verkauf mir Informationen ...

	Info_Mod_Penner_Infos_Choices();
};

FUNC VOID Info_Mod_Penner_Infos_BACK()
{
	Info_ClearChoices	(Info_Mod_Penner_Infos);
};

FUNC VOID Info_Mod_Penner_Infos_F()
{
	AI_Output(hero, self, "Info_Mod_Penner_Infos_F_15_00"); //Kannst du mir etwas über Elvira erzählen?

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Penner_Infos_F_27_01"); //Die Schnecke bei den Feuermagiern?
	AI_Output(self, hero, "Info_Mod_Penner_Infos_F_27_02"); //Ja ... wart mal, da gab’s irgendeine lustige Geschichte in der Taverne.
	AI_Output(self, hero, "Info_Mod_Penner_Infos_F_27_03"); //Irgendwas mit Alkohol und Klosterwein ... ja, genau, die war mal tatsächlich dort, um das Wort Innos' zu predigen und die Trinker zu bekehren.
	AI_Output(self, hero, "Info_Mod_Penner_Infos_F_27_04"); //Die ganzen Jungs haben dort natürlich erst mal gejohlt, als die da rein kam.
	AI_Output(self, hero, "Info_Mod_Penner_Infos_F_27_05"); //Der Wirt hat ganz einen auf Kavalier gemacht und ihr 'nen Klosterwein angeboten.
	AI_Output(self, hero, "Info_Mod_Penner_Infos_F_27_06"); //Und sie? Stand erst mal zögerlich da und hat dann nach dem alkoholfreien Klosterwein gefragt, hähä.
	AI_Output(self, hero, "Info_Mod_Penner_Infos_F_27_07"); //Wahrscheinlich wird ihr bei Alkohol ganz anders, wenn du verstehst, haha.

	Info_Mod_Penner_Infos_Choices();
};

FUNC VOID Info_Mod_Penner_Infos_E()
{
	AI_Output(hero, self, "Info_Mod_Penner_Infos_E_15_00"); //Was kannst du mir über das Verschwinden von Julianas Mann erzählen?

	B_GiveInvItems	(hero, self, ItMi_Gold, 10);

	AI_Output(self, hero, "Info_Mod_Penner_Infos_E_27_01"); //Du meinst Endres? Dass er verschwunden ist, kann ich dir erzählen.
	AI_Output(self, hero, "Info_Mod_Penner_Infos_E_27_02"); //Mehr weiß niemand, oder, besser gesagt, mehr gibt niemand zu.
	AI_Output(hero, self, "Info_Mod_Penner_Infos_E_15_03"); //Seit wann wird er denn vermisst?
	AI_Output(self, hero, "Info_Mod_Penner_Infos_E_27_04"); //Er wurde vor ein paar Tagen zum letzten Mal gesehen. Auf der Arbeit war er noch, und danach hat er die Fliege gemacht.
	AI_Output(hero, self, "Info_Mod_Penner_Infos_E_15_05"); //Du meinst, er ist abgehauen?
	AI_Output(self, hero, "Info_Mod_Penner_Infos_E_27_06"); //Na ja, denk ich mal. Juliana ist schon ziemlich zickig, die würde ich auch nicht ewig aushalten.
	AI_Output(self, hero, "Info_Mod_Penner_Infos_E_27_07"); //Aber 'ne Garantie, dass es so gewesen ist, hab ich nicht.

	Info_Mod_Penner_Infos_Choices();
};

FUNC VOID Info_Mod_Penner_Infos_D()
{
	AI_Output(hero, self, "Info_Mod_Penner_Infos_D_15_00"); //Wer ist Hauptverantwortlicher für die Wasserversorgung?

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Penner_Infos_D_27_01"); //Wendel natürlich. Er macht den ganzen Tag nichts anderes, als die Leitungen zu kontrollieren.

	Info_Mod_Penner_Infos_Choices();
};

FUNC VOID Info_Mod_Penner_Infos_C()
{
	AI_Output(hero, self, "Info_Mod_Penner_Infos_C_15_00"); //Wie viele Stände hat der Marktplatz von Khorata?

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Penner_Infos_C_27_01"); //Was ist das für eine Frage? Kannst du nicht zählen? Ich sehe hier sechs Stände.

	Info_Mod_Penner_Infos_Choices();
};

FUNC VOID Info_Mod_Penner_Infos_B()
{
	AI_Output(hero, self, "Info_Mod_Penner_Infos_B_15_00"); //Wie hießen die drei Ratten des Stadthalters?

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Penner_Infos_B_27_01"); //Haha, das war ein Spaß mit den Ratten. Sie hießen Fievel, Pinky und Oleg.

	Info_Mod_Penner_Infos_Choices();
};

FUNC VOID Info_Mod_Penner_Infos_A()
{
	AI_Output(hero, self, "Info_Mod_Penner_Infos_A_15_00"); //Wo finde ich hier einen Abort?

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Penner_Infos_A_27_01"); //Soweit ich weiß, haben nur die Feuermagier ein richtiges Plumpsklo.

	Info_Mod_Penner_Infos_Choices();
};

INSTANCE Info_Mod_Penner_Kimon (C_INFO)
{
	npc		= Mod_7540_OUT_Penner_REL;
	nr		= 1;
	condition	= Info_Mod_Penner_Kimon_Condition;
	information	= Info_Mod_Penner_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo! Ich brauche eine Information.";
};

FUNC INT Info_Mod_Penner_Kimon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kimon_REL_Freudenspender))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Penner_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Penner_Kimon_15_00"); //Hallo! Ich brauche eine Information.
	AI_Output(self, hero, "Info_Mod_Penner_Kimon_27_01"); //Dafür bin ich ja da. Was willst du wissen?
	AI_Output(hero, self, "Info_Mod_Penner_Kimon_15_02"); //Ich suchen jemanden, der Freudenspender liefert. Du vielleicht?
	AI_Output(self, hero, "Info_Mod_Penner_Kimon_27_03"); //Wo denkst du hin? Damit habe ich nichts zu tun.
	AI_Output(hero, self, "Info_Mod_Penner_Kimon_15_04"); //Dann werde ich mich mal bei den Händlern umhören.
};

INSTANCE Info_Mod_Penner_Kimon2 (C_INFO)
{
	npc		= Mod_7540_OUT_Penner_REL;
	nr		= 1;
	condition	= Info_Mod_Penner_Kimon2_Condition;
	information	= Info_Mod_Penner_Kimon2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich schon wieder. Habe nichts gefunden.";
};

FUNC INT Info_Mod_Penner_Kimon2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kimon))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Penner_Kimon2_Info()
{
	AI_Output(hero, self, "Info_Mod_Penner_Kimon2_15_00"); //Ich schon wieder. Habe nichts gefunden. Aber der Morpheus behauptet, du wüsstest was.
	AI_Output(self, hero, "Info_Mod_Penner_Kimon2_27_01"); //So, sagt er? Hmm, ich weiß nicht ...
	AI_Output(hero, self, "Info_Mod_Penner_Kimon2_15_02"); //Nun rück schon raus. Es soll dein Schaden nicht sein.
	AI_Output(self, hero, "Info_Mod_Penner_Kimon2_27_03"); //Hmm ... Erstens: Das wird teuer für dich. Zweitens: Du erzählst niemandem ein Sterbenswörtchen darüber, sonst verpfeife ich dich beim Gericht.
	AI_Output(hero, self, "Info_Mod_Penner_Kimon2_15_04"); //Abgemacht. Ich halte dicht. Was willst du?
	AI_Output(self, hero, "Info_Mod_Penner_Kimon2_27_05"); //Erst mal 300 Gold für die Info.
};

INSTANCE Info_Mod_Penner_Kimon3 (C_INFO)
{
	npc		= Mod_7540_OUT_Penner_REL;
	nr		= 1;
	condition	= Info_Mod_Penner_Kimon3_Condition;
	information	= Info_Mod_Penner_Kimon3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was kannst du mir darüber sagen? (300 Gold gegeben)";
};

FUNC INT Info_Mod_Penner_Kimon3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Penner_Kimon2))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Penner_Kimon3_Info()
{
	AI_Output(hero, self, "Info_Mod_Penner_Kimon3_15_00"); //Was kannst du mir darüber sagen?
	AI_Output(self, hero, "Info_Mod_Penner_Kimon3_27_01"); //Also, pass auf: Mein alter Herr lebt auch hier in Relendel. Aber er ist nicht mehr richtig im Kopf. Hat sich in eine Höhle zurückgezogen.
	AI_Output(self, hero, "Info_Mod_Penner_Kimon3_27_02"); //Ich kann ihn heute nicht mehr verstehen. Der redet nur noch in Rätseln. Vielleicht wirst du ja daraus schlau.
	AI_Output(hero, self, "Info_Mod_Penner_Kimon3_15_03"); //Doch. Hört sich interessant an. Den besuche ich mal. Wo ist diese Höhle?
	AI_Output(self, hero, "Info_Mod_Penner_Kimon3_27_04"); //Du kennst den Rundweg, wenn du zum Tal reinkommst?
	AI_Output(hero, self, "Info_Mod_Penner_Kimon3_15_05"); //Ich denke ja.
	AI_Output(self, hero, "Info_Mod_Penner_Kimon3_27_06"); //Also, du gehst links rum, immer an der Felswand lang. Da kommst du zu der Höhle, wo mein Alter haust.

	B_LogEntry	(TOPIC_MOD_KIMON_FREUDENSPENDER, "Der Penner erzählt von seinem Vater, der unverständlich redet. Er haust in einer Höhle in der Felswand links vom Taleingang. Mal schaun ...");
};

INSTANCE Info_Mod_Penner_Hi (C_INFO)
{
	npc		= Mod_7540_OUT_Penner_REL;
	nr		= 1;
	condition	= Info_Mod_Penner_Hi_Condition;
	information	= Info_Mod_Penner_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Penner_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Penner))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Penner_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Penner_Hi_27_00"); //Eh! Haste mal 'ne Münze?
	AI_Output(hero, self, "Info_Mod_Penner_Hi_15_01"); //Das hatten wir doch schon mal! Ich dachte, du hast genug Geld?
	AI_Output(self, hero, "Info_Mod_Penner_Hi_27_02"); //Seit Anselm weg ist, werden meine, äh, Dienste nicht mehr so gerne gesehen.
	AI_Output(self, hero, "Info_Mod_Penner_Hi_27_03"); //Dabei muss ich doch dringend mit der Kutsche nach Khorinis, weil meine Alte liegt im Sterben.
	AI_Output(self, hero, "Info_Mod_Penner_Hi_27_04"); //Nu hab ich aber nich genuch Mäuse. Bei den Leuten hier is nix mehr zu holen.
	AI_Output(hero, self, "Info_Mod_Penner_Hi_15_05"); //Na gut. Hier hast du 5 Gold. Aber versauf sie nicht.

	B_GiveInvItems	(hero, self, ItMi_Gold, 5);

	AI_Output(self, hero, "Info_Mod_Penner_Hi_27_06"); //Oh, danke, Mann. Adanos soll dich schützn.

	Log_CreateTopic	(TOPIC_MOD_JG_PENNER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_PENNER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_PENNER, "Habe einem Bettler etwas gegeben. Vielleicht brauch ich den noch mal.");

	Npc_SetRefuseTalk (self, 30);
};

INSTANCE Info_Mod_Penner_NochDa (C_INFO)
{
	npc		= Mod_7540_OUT_Penner_REL;
	nr		= 1;
	condition	= Info_Mod_Penner_NochDa_Condition;
	information	= Info_Mod_Penner_NochDa_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Penner_NochDa_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Penner_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_August_Penner2))
	&& (Npc_RefuseTalk(self))
	&& (Npc_HasItems(hero, ItMi_BrokenRune01) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Penner_NochDa_Info()
{
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_27_00"); //He!
	AI_Output(hero, self, "Info_Mod_Penner_NochDa_15_01"); //Nanu. Du bist ja immer noch da.
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_27_02"); //Wär längst weg, aber die Kutsche fährt nich.
	AI_Output(hero, self, "Info_Mod_Penner_NochDa_15_03"); //Und warum nicht?
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_27_04"); //Weil wir hier keine Pferde ham ...
	AI_Output(hero, self, "Info_Mod_Penner_NochDa_15_05"); //Dann soll der Kutscher Snapper einspannen. Oder besser Razor zähmen. Die laufen schneller.
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_27_06"); //Razor zähmen? Willst du mich verarschen? Aber was andres: Ich sehe, du hast da so 'ne Rune dabei.
	AI_Output(hero, self, "Info_Mod_Penner_NochDa_15_07"); //Dieses kaputte Ding hier?
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_27_08"); //Jo. Genau die. Wenn du mir die vermachen tätst, hätt ich 'nen ganz heißen Tipp für dich.

	B_SetTopicStatus	(TOPIC_MOD_JG_PENNER, LOG_SUCCESS);

	Wld_InsertNpc	(Mod_7542_OUT_Raritaetenhaendler_REL, "REL_CITY_045");

	Info_ClearChoices	(Info_Mod_Penner_NochDa);

	Info_AddChoice	(Info_Mod_Penner_NochDa, "Nein, das ist mir nicht ganz geheuer. Und vielleicht brauche ich die Rune noch.", Info_Mod_Penner_NochDa_B);
	Info_AddChoice	(Info_Mod_Penner_NochDa, "Was willst du denn damit?", Info_Mod_Penner_NochDa_A);
};

FUNC VOID Info_Mod_Penner_NochDa_B()
{
	AI_Output(hero, self, "Info_Mod_Penner_NochDa_B_15_00"); //Nein, das ist mir nicht ganz geheuer. Und vielleicht brauche ich die Rune noch.
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_B_27_01"); //Oh je, bis der Kutscher die Razor im Griff hat, ist meine Alte hinüber.
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_B_27_02"); //Was soll's. Haste wenigstens 'ne Pulle Schnaps für mich? Muss mein Schmerz betäubn.

	if (Npc_HasItems(hero, ItFo_Booze) >= 1)
	{
		AI_Output(hero, self, "Info_Mod_Penner_NochDa_B_15_03"); //Na gut, hier, ein Wacholder.
		AI_Output(self, hero, "Info_Mod_Penner_NochDa_B_27_04"); //Danke, Mann. Du rettest wenigstens mir das Lebn.

		B_GivePlayerXP	(50);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Penner_NochDa_B_15_05"); //Nein, leider nicht.
		AI_Output(self, hero, "Info_Mod_Penner_NochDa_B_27_06"); //Oh je, wenn mich der Schmerz mal nich umbringt.
	};

	Info_ClearChoices	(Info_Mod_Penner_NochDa);
};

FUNC VOID Info_Mod_Penner_NochDa_A()
{
	AI_Output(hero, self, "Info_Mod_Penner_NochDa_A_15_00"); //Was willst du denn damit?
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_A_27_01"); //Vielleicht bringt die mich nach Khorinis.
	AI_Output(hero, self, "Info_Mod_Penner_NochDa_A_15_02"); //Wenn du meinst. Hier. Und was wolltest du mir erzählen?

	B_GiveInvItems	(hero, self, ItMi_BrokenRune01, 1);

	AI_Output(self, hero, "Info_Mod_Penner_NochDa_A_27_03"); //Also, pass auf. Mein Alter war früher Pirat.
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_A_27_04"); //Hat ganz schön was auf die Seite geschafft und den ganzen Schotter vergrabn.
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_A_27_05"); //Ich weiß nicht, wo, und den alten Knacker kann ich heut nich mehr verstehn.
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_A_27_06"); //Der red nur noch in Rätseln. Vielleicht wirst du ja draus schlau.
	AI_Output(hero, self, "Info_Mod_Penner_NochDa_A_15_07"); //Doch, hört sich interessant an. Den besuche ich mal. Wo ist diese Höhle?
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_A_27_08"); //Du kennst den Rundweg, wenn du zum Tal reinkommst?
	AI_Output(hero, self, "Info_Mod_Penner_NochDa_A_15_09"); //Ich denke ja.
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_A_27_10"); //Also du latscht ... ähhh ... Wie heißt noch mal das, wo der Daumen rechts ist?
	AI_Output(hero, self, "Info_Mod_Penner_NochDa_A_15_11"); //Links, du Pfeife!
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_A_27_12"); //Also links rum, den Weg entlang.
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_A_27_13"); //Irgendwann siehst du rechts auf dem Wall 'nen toten Baum. Sieht aus wie 'ne Hand.
	AI_Output(self, hero, "Info_Mod_Penner_NochDa_A_27_14"); //Da wieder ... links bis zur Felswand. Hinter 'nem großen Brocken ist dann die Höhle.
	AI_Output(hero, self, "Info_Mod_Penner_NochDa_A_15_15"); //Das sollte zu finden sein. Mach's gut.

	Info_ClearChoices	(Info_Mod_Penner_NochDa);

	Log_CreateTopic	(TOPIC_MOD_JG_PENNERSVATER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_PENNERSVATER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_PENNERSVATER, "Der Penner erzählt von einem alten Piraten, der unverständlich redet. Er haust in einer Höhle in der Felswand links vom Taleingang. Ich soll den Weg langgehen. Ein toter Baum, der aussieht wie eine Hand, da wieder links bis zur Felswand. Mal schaun.");
};

INSTANCE Info_Mod_Penner_RuneBack (C_INFO)
{
	npc		= Mod_7540_OUT_Penner_REL;
	nr		= 1;
	condition	= Info_Mod_Penner_RuneBack_Condition;
	information	= Info_Mod_Penner_RuneBack_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tag, Sportsfreund. Bist du schon gereist?";
};

FUNC INT Info_Mod_Penner_RuneBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Penner_NochDa))
	&& (Npc_HasItems(self, ItMi_BrokenRune01) == 1)
	&& (Npc_HasItems(hero, ItMi_BrokenRune02) == 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 200)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Penner_RuneBack_Info()
{
	AI_Output(hero, self, "Info_Mod_Penner_RuneBack_15_00"); //Tag, Sportsfreund. Bist du schon gereist?
	AI_Output(self, hero, "Info_Mod_Penner_RuneBack_27_01"); //Nee. Das Ding funzt nich. Habs probiert, mir wurde schwindelig, hab so was wie blauen Dunst gesehen.
	AI_Output(self, hero, "Info_Mod_Penner_RuneBack_27_02"); //Wie ich die Augen wieder aufmach, sitz ich immer noch hier.
	AI_Output(hero, self, "Info_Mod_Penner_RuneBack_15_03"); //Das tut mir aber leid. Weißt du was?
	AI_Output(self, hero, "Info_Mod_Penner_RuneBack_27_04"); //Nö.
	AI_Output(hero, self, "Info_Mod_Penner_RuneBack_15_05"); //Du gibst mir das Teil zurück und ich gebe dir dafür 200 Gold.
	AI_Output(self, hero, "Info_Mod_Penner_RuneBack_27_06"); //(schreit auf) 200 Mäuse! Das sind ja zehn Pullen, Quatsch, zwanzich Pullen. Nee ...
	AI_Output(hero, self, "Info_Mod_Penner_RuneBack_15_07"); //Komm wieder runter. Und denk auch ans Essen. Der Wirt hat gepökeltes Lammfleisch.
	AI_Output(self, hero, "Info_Mod_Penner_RuneBack_27_08"); //Gepökeltes Lamm. Bei Adanos! Hab ich zuletzt an Weihnachten gegessen. Vor zwei Jahrn oder so. Boah ...
	AI_Output(hero, self, "Info_Mod_Penner_RuneBack_15_09"); //Hier, nimm, und mach's gut!

	Npc_RemoveInvItems	(hero, ItMi_Gold, 200);
	Npc_RemoveInvItems	(self, ItMi_BrokenRune01, 1);
	CreateInvItems	(hero, ItMi_BrokenRune01, 1);

	B_ShowGivenThings	("200 Gold gegeben und Runenhälfte erhalten");

	AI_Output(self, hero, "Info_Mod_Penner_RuneBack_27_10"); //Tausend Dank, Mann!

	B_LogEntry	(TOPIC_MOD_JG_PENNER, "Geschafft! Ich habe beide Teile. Vielleicht kann man die Rune reparieren. Am besten einen Fachmann fragen. Ob's hier einen Magier gibt? Mal fragen. Vielleicht Daniel, der handelt doch mit Magie.");
};

INSTANCE Info_Mod_Penner_EXIT (C_INFO)
{
	npc		= Mod_7540_OUT_Penner_REL;
	nr		= 1;
	condition	= Info_Mod_Penner_EXIT_Condition;
	information	= Info_Mod_Penner_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Penner_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Penner_EXIT_Info()
{
	if (Mod_LeavePennerFirstTime == FALSE)
	{
		Mod_LeavePennerFirstTime = TRUE;

		AI_Output(self, hero, "Info_Mod_Penner_EXIT_27_00"); //Du musst mir übrigens kein Gold schenken. Ich habe schon genug.
		AI_Output(hero, self, "Info_Mod_Penner_EXIT_15_01"); //Warum hast du mich dann darum gebeten?
		AI_Output(self, hero, "Info_Mod_Penner_EXIT_27_02"); //Das gehört zum Beruf. Man erwartet von Pennern einfach, dass sie nach Münzen fragen.
	};

	AI_StopProcessInfos	(self);
};