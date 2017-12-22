INSTANCE Info_Mod_Petunia_Hi (C_INFO)
{
	npc		= Mod_7594_OUT_Petunia_TUG;
	nr		= 1;
	condition	= Info_Mod_Petunia_Hi_Condition;
	information	= Info_Mod_Petunia_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Petunia_Hi_Condition()
{
	if (Mod_VMG_Pruefung_Barriere == 3)
	&& (Mod_IsFleischwanze == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Petunia_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Petunia_Hi_43_00"); //Was? Wie kommst du hier rein?

	Info_ClearChoices	(Info_Mod_Petunia_Hi);

	Info_AddChoice	(Info_Mod_Petunia_Hi, "Tierverwandlung. Du hast nicht aufgepasst.", Info_Mod_Petunia_Hi_B);
	Info_AddChoice	(Info_Mod_Petunia_Hi, "Wie kommst DU denn hier rein?", Info_Mod_Petunia_Hi_A);
};

FUNC VOID Info_Mod_Petunia_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Hi_B_15_00"); //Tierverwandlung. Du hast nicht aufgepasst.
	AI_Output(self, hero, "Info_Mod_Petunia_Hi_B_43_01"); //Verdammt, da hat jemand an der Rolle gepfuscht! Aber danke für den Tipp.

	Info_ClearChoices	(Info_Mod_Petunia_Hi);

	Info_AddChoice	(Info_Mod_Petunia_Hi, "Was machst du hier?", Info_Mod_Petunia_Hi_D);
	Info_AddChoice	(Info_Mod_Petunia_Hi, "Wer bist du?", Info_Mod_Petunia_Hi_C);
};

FUNC VOID Info_Mod_Petunia_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Hi_A_15_00"); //Wie kommst DU denn hier rein?
	AI_Output(self, hero, "Info_Mod_Petunia_Hi_A_43_01"); //ICH stelle hier die Fragen. Ich glaube nicht, dass du dir erlauben kannst, frech zu werden, Bübchen.

	Info_ClearChoices	(Info_Mod_Petunia_Hi);

	Info_AddChoice	(Info_Mod_Petunia_Hi, "Was machst du hier?", Info_Mod_Petunia_Hi_D);
	Info_AddChoice	(Info_Mod_Petunia_Hi, "Wer bist du?", Info_Mod_Petunia_Hi_C);
};

FUNC VOID Info_Mod_Petunia_Hi_E()
{
	AI_Output(self, hero, "Info_Mod_Petunia_Hi_E_43_00"); //Nun geh mir aus dem Weg, ich habe zu tun.

	Info_ClearChoices	(Info_Mod_Petunia_Hi);

	Info_AddChoice	(Info_Mod_Petunia_Hi, "Das geht nicht, oder hast du die Barriere vergessen?", Info_Mod_Petunia_Hi_G);
	Info_AddChoice	(Info_Mod_Petunia_Hi, "Ich hatte eigentlich vor, dich aufzuhalten.", Info_Mod_Petunia_Hi_F);
};

FUNC VOID Info_Mod_Petunia_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Hi_D_15_00"); //Was machst du hier?
	AI_Output(self, hero, "Info_Mod_Petunia_Hi_D_43_01"); //Euren Untergang besiedeln! Und dann werde ich einen Tee trinken. Ich liebe Tee.

	Mod_VMG_Pruefung_Petunia += 1;

	if (Mod_VMG_Pruefung_Petunia == 1)
	{
		Info_ClearChoices	(Info_Mod_Petunia_Hi);

		Info_AddChoice	(Info_Mod_Petunia_Hi, "Wer bist du?", Info_Mod_Petunia_Hi_C);		
	}
	else
	{
		Info_Mod_Petunia_Hi_E();
	};
};

FUNC VOID Info_Mod_Petunia_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Hi_C_15_00"); //Wer bist du?
	AI_Output(self, hero, "Info_Mod_Petunia_Hi_C_43_01"); //Mein Name tut nichts zur Sache, aber ich denke meine Taten zeichnen mich aus.

	Mod_VMG_Pruefung_Petunia += 1;

	if (Mod_VMG_Pruefung_Petunia == 1)
	{
		Info_ClearChoices	(Info_Mod_Petunia_Hi);

		Info_AddChoice	(Info_Mod_Petunia_Hi, "Was machst du hier?", Info_Mod_Petunia_Hi_D);		
	}
	else
	{
		Info_Mod_Petunia_Hi_E();
	};
};

FUNC VOID Info_Mod_Petunia_Hi_G()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Hi_G_15_00"); //Das geht nicht, oder hast du die Barriere vergessen?
	AI_Output(self, hero, "Info_Mod_Petunia_Hi_G_43_01"); //Fast. Aber das macht nichts, dann wirst du halt aus dem Weg gegangen. (kichert)

	Info_ClearChoices	(Info_Mod_Petunia_Hi);

	Info_AddChoice	(Info_Mod_Petunia_Hi, "Dann mal los.", Info_Mod_Petunia_Hi_I);
	Info_AddChoice	(Info_Mod_Petunia_Hi, "Warte, wir können über alles reden.", Info_Mod_Petunia_Hi_H);
};

FUNC VOID Info_Mod_Petunia_Hi_J()
{
	AI_Output(self, hero, "Info_Mod_Petunia_Hi_J_43_00"); //Die ganze Falle. Der Trunk, die anschließende Vision und das deponierte Blütenblatt. Einfach alles!
	AI_Output(hero, self, "Info_Mod_Petunia_Hi_J_15_01"); //Danke für die Information, ich muss dann auch schon wieder gehen.
	AI_Output(self, hero, "Info_Mod_Petunia_Hi_J_43_02"); //Du glaubst doch nicht, dass ich dich jetzt einfach gehen lasse? Du kennst schließlich meinen Plan.
	AI_Output(hero, self, "Info_Mod_Petunia_Hi_J_15_03"); //Das hatte ich eigentlich gedacht ...
	AI_Output(self, hero, "Info_Mod_Petunia_Hi_J_43_04"); //Sehr witzig, Bübchen. Männer, blast ihm das Licht aus. (kichert)

	Info_ClearChoices	(Info_Mod_Petunia_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Petunia_Hi_F()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Hi_F_15_00"); //Ich hatte eigentlich vor, dich aufzuhalten.
	AI_Output(self, hero, "Info_Mod_Petunia_Hi_F_43_01"); //Ach ja? (lacht hysterisch) Niemand kann mich jetzt noch aufhalten! Es ist alles vorbereitet!
	AI_Output(hero, self, "Info_Mod_Petunia_Hi_F_15_02"); //Was ist vorbereitet?

	Info_Mod_Petunia_Hi_J();
};

FUNC VOID Info_Mod_Petunia_Hi_I()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Hi_I_15_00"); //Dann mal los.
	AI_Output(self, hero, "Info_Mod_Petunia_Hi_I_43_01"); //Schnappt ihn euch!

	Info_ClearChoices	(Info_Mod_Petunia_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Petunia_Hi_H()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Hi_H_15_00"); //Warte, wir können über alles reden.
	AI_Output(self, hero, "Info_Mod_Petunia_Hi_H_43_01"); //Ich will aber nicht reden. Außerdem bringt das jetzt auch nichts mehr, dazu ist es zu spät.
	AI_Output(hero, self, "Info_Mod_Petunia_Hi_H_15_02"); //Was ist zu spät?
	AI_Output(self, hero, "Info_Mod_Petunia_Hi_H_43_03"); //Es ist alles vorbereitet!

	Info_Mod_Petunia_Hi_J();
};

INSTANCE Info_Mod_Petunia_Pruefung (C_INFO)
{
	npc		= Mod_7594_OUT_Petunia_TUG;
	nr		= 1;
	condition	= Info_Mod_Petunia_Pruefung_Condition;
	information	= Info_Mod_Petunia_Pruefung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Deine Handlanger wären erledigt.";
};

FUNC INT Info_Mod_Petunia_Pruefung_Condition()
{
	if (Mod_VMG_Pruefung_Petunia == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Petunia_Pruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_15_00"); //Deine Handlanger wären erledigt.
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_43_01"); //Du bist gar nicht mal so schwächlich wie du aussiehst.
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_15_02"); //Ich denke, es ist Zeit, dass du mir erklärst, was hier gespielt wird.
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_43_03"); //Du kennst den Plan. Was willst du noch wissen?

	Info_ClearChoices	(Info_Mod_Petunia_Pruefung);

	Info_AddChoice	(Info_Mod_Petunia_Pruefung, "Jetzt erzähl mir doch mal, wer du bist.", Info_Mod_Petunia_Pruefung_B);
	Info_AddChoice	(Info_Mod_Petunia_Pruefung, "Warum das Ganze?", Info_Mod_Petunia_Pruefung_A);
};

FUNC VOID Info_Mod_Petunia_Pruefung_C()
{
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_C_43_00"); //Die Verwandlungsmagier haben mein Leben zerstört!
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_C_43_01"); //Ich war eine von ihnen, aber ich wurde nie als vollwertiges Mitglied behandelt. Wahrscheinlich, weil ich eine Frau bin. Pah!
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_C_43_02"); //Irgendwann habe ich dann halt angefangen, gegen sie zu arbeiten. So einfach ist das.
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_C_15_03"); //Was haben sie dir denn getan?
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_C_43_04"); //Bei den kleinsten Vergehen haben sie schon die höchsten Strafen gegen mich verhängt. So was von unfair!

	Info_ClearChoices	(Info_Mod_Petunia_Pruefung);

	Info_AddChoice	(Info_Mod_Petunia_Pruefung, "Das kann ich voll und ganz nachvollziehen.", Info_Mod_Petunia_Pruefung_E);
	Info_AddChoice	(Info_Mod_Petunia_Pruefung, "Kleine Strafen?", Info_Mod_Petunia_Pruefung_D);
};

FUNC VOID Info_Mod_Petunia_Pruefung_B()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_B_15_00"); //Jetzt erzähl mir doch mal, wer du bist.
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_B_43_01"); //Mein Name ist Petunia.
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_B_15_02"); //Vielleicht ein bisschen mehr?
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_B_43_03"); //Wie du willst. Die ganze Geschichte.

	Info_Mod_Petunia_Pruefung_C();
};

FUNC VOID Info_Mod_Petunia_Pruefung_A()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_A_15_00"); //Warum das Ganze?
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_A_43_01"); //Warum? Das kann ich dir sagen!

	Info_Mod_Petunia_Pruefung_C();
};

FUNC VOID Info_Mod_Petunia_Pruefung_E()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_E_15_00"); //Das kann ich voll und ganz nachvollziehen.
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_E_43_01"); //Endlich mal jemand, der mich versteht!

	Info_ClearChoices	(Info_Mod_Petunia_Pruefung);

	Info_AddChoice	(Info_Mod_Petunia_Pruefung, "Du hast sie doch nicht mehr alle.", Info_Mod_Petunia_Pruefung_G);
	Info_AddChoice	(Info_Mod_Petunia_Pruefung, "Voll und ganz. Ich werde mal mit Per reden.", Info_Mod_Petunia_Pruefung_F);
};

FUNC VOID Info_Mod_Petunia_Pruefung_H()
{
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_H_43_00"); //Was erlaubst du dir? Ich schütte dir mein Herz aus und du lässt es in diesem elenden Boden versickern!
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_H_43_01"); //Was habe ich dir denn getan?

	Info_ClearChoices	(Info_Mod_Petunia_Pruefung);

	Info_AddChoice	(Info_Mod_Petunia_Pruefung, "", Info_Mod_Petunia_Pruefung_E);
	Info_AddChoice	(Info_Mod_Petunia_Pruefung, "", Info_Mod_Petunia_Pruefung_D);
};

FUNC VOID Info_Mod_Petunia_Pruefung_D()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_D_15_00"); //Kleine Strafen?
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_D_43_01"); //Ja. Da habe ich aus Versehen mal eine Herde Schafe gebraten oder Wölfen das Fell abgezogen, wenn mir kalt war. Das muss doch wohl drin sein!
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_D_15_02"); //Ich glaube, du kannst deine Vergehen überhaupt nicht einschätzen.
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_D_15_03"); //So eine unberechenbare Frau kann man doch nicht in der Gemeinschaft lassen.

	Info_ClearChoices	(Info_Mod_Petunia_Pruefung);

	Info_AddChoice	(Info_Mod_Petunia_Pruefung, "Du hast den Verwandlungsmagiern und damit auch mir viel Ärger bereitet.", Info_Mod_Petunia_Pruefung_J);
	Info_AddChoice	(Info_Mod_Petunia_Pruefung, "Was hast du jetzt vor?", Info_Mod_Petunia_Pruefung_I);
};

FUNC VOID Info_Mod_Petunia_Pruefung_G()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_G_15_00"); //Du hast sie doch nicht mehr alle.

	Info_Mod_Petunia_Pruefung_H();
};

FUNC VOID Info_Mod_Petunia_Pruefung_F()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_F_15_00"); //Voll und ganz. Ich werde mal mit Per reden.
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_F_43_01"); //Vielen Dank, das werde ich dir nie vergessen!

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich habe Petunia versprochen, dass ich mit Per darüber rede, was jetzt passieren soll. Sie wird wohl vorerst keinen Ärger mehr machen.");

	Mod_VMG_Pruefung_Petunia = 6;

	Wld_SendTrigger	("EVT_BARRIERE");

	Info_ClearChoices	(Info_Mod_Petunia_Pruefung);
};

FUNC VOID Info_Mod_Petunia_Pruefung_J()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_J_15_00"); //Du hast den Verwandlungsmagiern und damit auch mir viel Ärger bereitet.
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_J_43_01"); //Ach komm. Du hast doch alles wieder gerade gebogen. Das kannst du mir wirklich nicht anlasten.

	Info_ClearChoices	(Info_Mod_Petunia_Pruefung);

	Info_AddChoice	(Info_Mod_Petunia_Pruefung, "Was hast du jetzt vor?", Info_Mod_Petunia_Pruefung_I);
};

FUNC VOID Info_Mod_Petunia_Pruefung_I()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_I_15_00"); //Was hast du jetzt vor?
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_I_43_01"); //Was soll ich denn bitte tun? Du hast alles kaputt gemacht. Du kennst den Plan.
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_I_43_02"); //Geh und tu', was immer du jetzt für nötig hältst.

	Info_ClearChoices	(Info_Mod_Petunia_Pruefung);

	Info_AddChoice	(Info_Mod_Petunia_Pruefung, "Ich werde mit Per über das weitere Vorgehen reden.", Info_Mod_Petunia_Pruefung_L);
	Info_AddChoice	(Info_Mod_Petunia_Pruefung, "Ich werde mit Per über deine Strafe reden.", Info_Mod_Petunia_Pruefung_K);
};

FUNC VOID Info_Mod_Petunia_Pruefung_L()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_L_15_00"); //Ich werde mit Per über das weitere Vorgehen reden.
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_L_43_01"); //Tu' das.

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich habe Petunia versprochen, dass ich mit Per darüber rede, was jetzt passieren soll. Sie wird wohl vorerst keinen Ärger mehr machen.");

	Mod_VMG_Pruefung_Petunia = 6;

	Wld_SendTrigger	("EVT_BARRIERE");

	Info_ClearChoices	(Info_Mod_Petunia_Pruefung);
};

FUNC VOID Info_Mod_Petunia_Pruefung_K()
{
	AI_Output(hero, self, "Info_Mod_Petunia_Pruefung_K_15_00"); //Ich werde mit Per über deine Strafe reden.
	AI_Output(self, hero, "Info_Mod_Petunia_Pruefung_K_43_01"); //Wenn du das für richtig hältst ...

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich werde Per sagen, dass Petunia hinter allem steckt und mit ihm beraten, wie wir sie wieder loswerden.");

	Mod_VMG_Pruefung_Petunia = 7;

	Wld_SendTrigger	("EVT_BARRIERE");

	Info_ClearChoices	(Info_Mod_Petunia_Pruefung);
};

INSTANCE Info_Mod_Petunia_EXIT (C_INFO)
{
	npc		= Mod_7594_OUT_Petunia_TUG;
	nr		= 1;
	condition	= Info_Mod_Petunia_EXIT_Condition;
	information	= Info_Mod_Petunia_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Petunia_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Petunia_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};