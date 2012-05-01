INSTANCE Info_Mod_Hagen_Hi (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_Hi_Condition;
	information	= Info_Mod_Hagen_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_Hi_Condition()
{
	if (Mod_IstLehrling == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_00"); //(erschöpft und fahrig) Danke für dein Kommen. Du hast dich gut gemacht, als ehemaliger Sträfling.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_01"); //Ich will ganz offen mit dir reden. Das Verschwinden der Barriere hat uns vor große Probleme gestellt.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_02"); //Die ganzen ehemaligen Gefangenen - wohin mit ihnen?
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_03"); //Der König hat befohlen, sie nicht aufs Festland zu lassen.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_04"); //Ich will sie nicht alle in der Stadt haben, und es gibt viele, die das noch weniger wollen.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_05"); //Bisher, Innos sei Dank, sind sie zum Großteil im Minental geblieben.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_06"); //Aber der Weg nach Khorinis ist ihnen nicht mehr versperrt.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_07"); //Und was sie in ihren Lagern ausbrüten, kann ich nicht einmal erahnen.
	AI_Output(hero, self, "Info_Mod_Hagen_Hi_15_08"); //Welche Rolle spiele ich in der Geschichte?
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_09"); //Du bist nun ein angesehener Bürger. Du kennst beide Seiten.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_10"); //Ich brauche Informationen. Was planen die Sträflinge? Wo sind sie überall?
	AI_Output(hero, self, "Info_Mod_Hagen_Hi_15_11"); //Ich soll also spionieren.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_12"); //Es soll ihnen kein Leid geschehen, im Gegenteil!
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_13"); //Man versucht mich zu beeinflussen, zu hintergehen, damit rücksichtslos gegen euch vorgegangen wird.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_14"); //(seufzt) Wenn sich keine Lösung ergibt, sieht es für die ehemaligen Sträflinge düster aus.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_15"); //Oder für die Stadt! Ich will kein Massaker verantworten müssen.
	AI_Output(hero, self, "Info_Mod_Hagen_Hi_15_16"); //Was soll ich also tun? Und was habe ich davon?
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_17"); //Sieh dich im Sumpflager und dem Söldnerlager des Minentals um.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_18"); //Ich habe auch gehört, dass sich ein Haufen Banditen in einem Talkessel im Norden angesiedelt hat.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_19"); //Vielleicht gibt es weitere Gruppierungen, die sich nach dem Verschwinden der Barriere gebildet haben.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_20"); //Finde heraus, inwieweit die Stimmung gegen uns ist. Wie zahlreich die unabhängigen Lager sind.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_21"); //Ob es zu Kampfvorbereitungen kommt. Oder ob es ruhig bleibt. Dann berichte mir.
	AI_Output(hero, self, "Info_Mod_Hagen_Hi_15_22"); //Was ist mit dem Alten Lager?
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_23"); //Es ist nicht nötig, dass du dich dort erkundigst.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_24"); //Über das Alte Lager weiß ich alles, was ich wissen muss.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_25"); //Als Gegenleistung werde ich dir unbegrenzten Zutritt zum Minental verschaffen.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_26"); //Du wirst der Einzige sein, der sich sowohl in Khorinis als auch im Minental frei bewegen kann.
	AI_Output(hero, self, "Info_Mod_Hagen_Hi_15_27"); //Dann werde ich mich mal auf den Weg machen.
	AI_Output(self, hero, "Info_Mod_Hagen_Hi_04_28"); //Ich danke ... (stöhnt) Was ... ist das? Dieser ... Schmerz ...

	Log_CreateTopic	(TOPIC_MOD_HAGEN_ASYLANTEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_HAGEN_ASYLANTEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_HAGEN_ASYLANTEN, "Lord Hagen hat mir eine umfassende Aufgabe gegeben: Ich soll alle Gruppierungen im Minental, ob alt oder neu, aufsuchen und herausfinden, was ihre Pläne für die Zukunft sind. Dazu sollte ich mich mit den jeweiligen Anführern unterhalten. Lord Hagen erhofft sich von diesen Gesprächen Aufschlüsse darüber, wie er seine Sträflingspolitik gestalten soll.");

	var int ptr;
	ptr = MEM_SearchVobByName("NW_2_OW_ORETRAIL");

	if (ptr > 0)
	{
		var oCTriggerChangeLevel tcl;
		MEM_AssignInst(tcl, ptr);

		tcl.levelname = "Minental\Minental.ZEN";
		tcl.startvob = "WP_INTRO09";
	};

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "HAGENKO");
};

INSTANCE Info_Mod_Hagen_Asylanten (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_Asylanten_Condition;
	information	= Info_Mod_Hagen_Asylanten_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe Neuigkeiten zu den Gruppierungen im Minental.";
};

FUNC INT Info_Mod_Hagen_Asylanten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_Hi))
	&& ((Mod_Hagen_BL == 0)
	|| (Mod_Hagen_VL == 0)
	|| (Mod_Hagen_KG == 0)
	|| (Mod_Hagen_JL == 0)
	|| (Mod_Hagen_SL == 0)
	|| (Mod_Hagen_NL == 0))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_Asylanten_Info()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_15_00"); //Ich habe Neuigkeiten zu den Gruppierungen im Minental.

	Info_ClearChoices	(Info_Mod_Hagen_Asylanten);

	Info_AddChoice	(Info_Mod_Hagen_Asylanten, DIALOG_BACK, Info_Mod_Hagen_Asylanten_BACK);

	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_Asylanten))
	&& (Mod_Hagen_BL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einem Talkessel im Norden halten sich Banditen auf.", Info_Mod_Hagen_Asylanten_F1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Asylanten))
	&& (Mod_Hagen_VL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einer Ruine sind Verwandlungsmagier aufgetaucht.", Info_Mod_Hagen_Asylanten_E1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Asylanten))
	&& (Mod_Hagen_KG == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Am Pass ist weit und breit keine Gruppierung zu sehen.", Info_Mod_Hagen_Asylanten_D2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Der König hat einen eigenen Trupp geschickt, um den Pass zu bewachen.", Info_Mod_Hagen_Asylanten_D1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Asylanten))
	&& (Mod_Hagen_JL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Eine Jägergemeinschaft geht ihrem Beruf nach.", Info_Mod_Hagen_Asylanten_C1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Cadar_Asylanten))
	&& (Mod_Hagen_SL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Die Bruderschaft erhebt sich!", Info_Mod_Hagen_Asylanten_B2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Die Bruderschaft verhält sich ruhig.", Info_Mod_Hagen_Asylanten_B1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Lee_WieStehts))
	&& (Mod_Hagen_NL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Im Neuen Lager ist alles ruhig.", Info_Mod_Hagen_Asylanten_A2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Das Neue Lager plant einen Ausbruch.", Info_Mod_Hagen_Asylanten_A1);
	};
};

FUNC VOID Info_Mod_Hagen_Asylanten_BACK()
{
	Info_ClearChoices	(Info_Mod_Hagen_Asylanten);
};

FUNC VOID Info_Mod_Hagen_Asylanten_F1()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_F1_15_00"); //In einem Talkessel im Norden halten sich Banditen auf.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_F1_04_01"); //Banditen? Das verheißt nichts Gutes ... Was konntest du herausfinden?
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_F1_15_02"); //Es sind nicht allzu viele, allerdings konnte ich nicht in Erfahrung bringen, welche Schritte sie als nächstes planen.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_F1_04_03"); //Ich werde sie im Auge behalten müssen.

	Mod_Hagen_BL = 1;

	B_GivePlayerXP	(300);

	Info_ClearChoices	(Info_Mod_Hagen_Asylanten);

	Info_AddChoice	(Info_Mod_Hagen_Asylanten, DIALOG_BACK, Info_Mod_Hagen_Asylanten_BACK);

	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_Asylanten))
	&& (Mod_Hagen_BL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einem Talkessel im Norden halten sich Banditen auf.", Info_Mod_Hagen_Asylanten_F1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Asylanten))
	&& (Mod_Hagen_VL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einer Ruine sind Verwandlungsmagier aufgetaucht.", Info_Mod_Hagen_Asylanten_E1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Asylanten))
	&& (Mod_Hagen_KG == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Am Pass ist weit und breit keine Gruppierung zu sehen.", Info_Mod_Hagen_Asylanten_D2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Der König hat einen eigenen Trupp geschickt, um den Pass zu bewachen.", Info_Mod_Hagen_Asylanten_D1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Asylanten))
	&& (Mod_Hagen_JL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Eine Jägergemeinschaft geht ihrem Beruf nach.", Info_Mod_Hagen_Asylanten_C1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Cadar_Asylanten))
	&& (Mod_Hagen_SL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Die Bruderschaft erhebt sich!", Info_Mod_Hagen_Asylanten_B2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Die Bruderschaft verhält sich ruhig.", Info_Mod_Hagen_Asylanten_B1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Lee_WieStehts))
	&& (Mod_Hagen_NL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Im Neuen Lager ist alles ruhig.", Info_Mod_Hagen_Asylanten_A2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Das Neue Lager plant einen Ausbruch.", Info_Mod_Hagen_Asylanten_A1);
	};
};

FUNC VOID Info_Mod_Hagen_Asylanten_E1()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_E1_15_00"); //In einer Ruine sind Verwandlungsmagier aufgetaucht.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_E1_04_01"); //Verwandlungsmagier? Was sind das für Gestalten?
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_E1_15_02"); //Sie hoffen auf Hilfe von außerhalb, da ihre Heimatwelt von einer Goblinplage heimgesucht wird. Sind ganz umgänglich.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_E1_04_03"); //(lacht rau) Und da suchen sie gerade im Minental?
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_E1_04_04"); //Ich kann sie jedenfalls nicht unterstützen, meine Männer werden alle gebraucht.

	Mod_Hagen_VL = 1;

	B_GivePlayerXP	(300);

	Info_ClearChoices	(Info_Mod_Hagen_Asylanten);

	Info_AddChoice	(Info_Mod_Hagen_Asylanten, DIALOG_BACK, Info_Mod_Hagen_Asylanten_BACK);

	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_Asylanten))
	&& (Mod_Hagen_BL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einem Talkessel im Norden halten sich Banditen auf.", Info_Mod_Hagen_Asylanten_F1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Asylanten))
	&& (Mod_Hagen_VL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einer Ruine sind Verwandlungsmagier aufgetaucht.", Info_Mod_Hagen_Asylanten_E1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Asylanten))
	&& (Mod_Hagen_KG == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Am Pass ist weit und breit keine Gruppierung zu sehen.", Info_Mod_Hagen_Asylanten_D2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Der König hat einen eigenen Trupp geschickt, um den Pass zu bewachen.", Info_Mod_Hagen_Asylanten_D1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Asylanten))
	&& (Mod_Hagen_JL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Eine Jägergemeinschaft geht ihrem Beruf nach.", Info_Mod_Hagen_Asylanten_C1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Cadar_Asylanten))
	&& (Mod_Hagen_SL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Die Bruderschaft erhebt sich!", Info_Mod_Hagen_Asylanten_B2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Die Bruderschaft verhält sich ruhig.", Info_Mod_Hagen_Asylanten_B1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Lee_WieStehts))
	&& (Mod_Hagen_NL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Im Neuen Lager ist alles ruhig.", Info_Mod_Hagen_Asylanten_A2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Das Neue Lager plant einen Ausbruch.", Info_Mod_Hagen_Asylanten_A1);
	};
};

FUNC VOID Info_Mod_Hagen_Asylanten_D2()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_D2_15_00"); //(lügen) Am Pass ist weit und breit keine Gruppierung zu sehen.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_D2_04_01"); //(atmet tief durch) Dann ist die Situation doch noch ein Stück entspannter als ich dachte.

	Mod_Hagen_KG = 2;

	B_GivePlayerXP	(300);

	Info_ClearChoices	(Info_Mod_Hagen_Asylanten);

	Info_AddChoice	(Info_Mod_Hagen_Asylanten, DIALOG_BACK, Info_Mod_Hagen_Asylanten_BACK);

	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_Asylanten))
	&& (Mod_Hagen_BL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einem Talkessel im Norden halten sich Banditen auf.", Info_Mod_Hagen_Asylanten_F1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Asylanten))
	&& (Mod_Hagen_VL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einer Ruine sind Verwandlungsmagier aufgetaucht.", Info_Mod_Hagen_Asylanten_E1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Asylanten))
	&& (Mod_Hagen_KG == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Am Pass ist weit und breit keine Gruppierung zu sehen.", Info_Mod_Hagen_Asylanten_D2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Der König hat einen eigenen Trupp geschickt, um den Pass zu bewachen.", Info_Mod_Hagen_Asylanten_D1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Asylanten))
	&& (Mod_Hagen_JL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Eine Jägergemeinschaft geht ihrem Beruf nach.", Info_Mod_Hagen_Asylanten_C1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Cadar_Asylanten))
	&& (Mod_Hagen_SL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Die Bruderschaft erhebt sich!", Info_Mod_Hagen_Asylanten_B2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Die Bruderschaft verhält sich ruhig.", Info_Mod_Hagen_Asylanten_B1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Lee_WieStehts))
	&& (Mod_Hagen_NL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Im Neuen Lager ist alles ruhig.", Info_Mod_Hagen_Asylanten_A2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Das Neue Lager plant einen Ausbruch.", Info_Mod_Hagen_Asylanten_A1);
	};
};

FUNC VOID Info_Mod_Hagen_Asylanten_D1()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_D1_15_00"); //Der König hat einen eigenen Trupp geschickt, um den Pass zu bewachen.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_D1_04_01"); //Verdammt! Wozu das?
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_D1_15_02"); //Du scheinst bei ihm in Ungnade gefallen zu sein, und er traut dir nicht mehr über den Weg.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_D1_04_03"); //(empört) Da zeigt es sich nun wieder!
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_D1_04_04"); //Kaum bist du ein paar Jahre aus der unmittelbaren Reichweite des Königs, schon wird von allen Seiten gegen dich intrigiert, ohne dass du dich dagegen wehren kannst.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_D1_04_05"); //Diese Knaben werden ich mir genauer anschauen müssen.

	Mod_Hagen_KG = 1;

	B_GivePlayerXP	(300);

	Info_ClearChoices	(Info_Mod_Hagen_Asylanten);

	Info_AddChoice	(Info_Mod_Hagen_Asylanten, DIALOG_BACK, Info_Mod_Hagen_Asylanten_BACK);

	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_Asylanten))
	&& (Mod_Hagen_BL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einem Talkessel im Norden halten sich Banditen auf.", Info_Mod_Hagen_Asylanten_F1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Asylanten))
	&& (Mod_Hagen_VL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einer Ruine sind Verwandlungsmagier aufgetaucht.", Info_Mod_Hagen_Asylanten_E1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Asylanten))
	&& (Mod_Hagen_KG == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Am Pass ist weit und breit keine Gruppierung zu sehen.", Info_Mod_Hagen_Asylanten_D2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Der König hat einen eigenen Trupp geschickt, um den Pass zu bewachen.", Info_Mod_Hagen_Asylanten_D1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Asylanten))
	&& (Mod_Hagen_JL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Eine Jägergemeinschaft geht ihrem Beruf nach.", Info_Mod_Hagen_Asylanten_C1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Cadar_Asylanten))
	&& (Mod_Hagen_SL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Die Bruderschaft erhebt sich!", Info_Mod_Hagen_Asylanten_B2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Die Bruderschaft verhält sich ruhig.", Info_Mod_Hagen_Asylanten_B1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Lee_WieStehts))
	&& (Mod_Hagen_NL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Im Neuen Lager ist alles ruhig.", Info_Mod_Hagen_Asylanten_A2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Das Neue Lager plant einen Ausbruch.", Info_Mod_Hagen_Asylanten_A1);
	};
};

FUNC VOID Info_Mod_Hagen_Asylanten_C1()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_C1_15_00"); //Eine Jägergemeinschaft geht ihrem Beruf nach.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_C1_04_01"); //Sie müssen über den Pass gekommen sein, noch bevor ich ihn kontrollieren lassen konnte.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_C1_04_02"); //Aber sie werden wohl kaum für Ärger sorgen.

	Mod_Hagen_JL = 1;

	B_GivePlayerXP	(300);

	Info_ClearChoices	(Info_Mod_Hagen_Asylanten);

	Info_AddChoice	(Info_Mod_Hagen_Asylanten, DIALOG_BACK, Info_Mod_Hagen_Asylanten_BACK);

	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_Asylanten))
	&& (Mod_Hagen_BL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einem Talkessel im Norden halten sich Banditen auf.", Info_Mod_Hagen_Asylanten_F1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Asylanten))
	&& (Mod_Hagen_VL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einer Ruine sind Verwandlungsmagier aufgetaucht.", Info_Mod_Hagen_Asylanten_E1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Asylanten))
	&& (Mod_Hagen_KG == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Am Pass ist weit und breit keine Gruppierung zu sehen.", Info_Mod_Hagen_Asylanten_D2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Der König hat einen eigenen Trupp geschickt, um den Pass zu bewachen.", Info_Mod_Hagen_Asylanten_D1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Asylanten))
	&& (Mod_Hagen_JL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Eine Jägergemeinschaft geht ihrem Beruf nach.", Info_Mod_Hagen_Asylanten_C1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Cadar_Asylanten))
	&& (Mod_Hagen_SL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Die Bruderschaft erhebt sich!", Info_Mod_Hagen_Asylanten_B2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Die Bruderschaft verhält sich ruhig.", Info_Mod_Hagen_Asylanten_B1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Lee_WieStehts))
	&& (Mod_Hagen_NL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Im Neuen Lager ist alles ruhig.", Info_Mod_Hagen_Asylanten_A2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Das Neue Lager plant einen Ausbruch.", Info_Mod_Hagen_Asylanten_A1);
	};
};

FUNC VOID Info_Mod_Hagen_Asylanten_B2()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_B2_15_00"); //Die Bruderschaft erhebt sich!
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_B2_04_01"); //(alarmiert) Die Bruderschaft? Was plant sie?
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_B2_15_02"); //Sie glauben, der Schläfer sei nur ein Trick des Königs gewesen, um sie still zu halten.
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_B2_15_03"); //Deswegen sind sie nun der Überzeugung, Innos sei der Gott des Lügens, und haben sich Beliar zugewandt.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_B2_04_04"); //Gebe Innos, dass das nicht wahr ist!

	Mod_Hagen_SL = 2;

	B_GivePlayerXP	(300);

	Info_ClearChoices	(Info_Mod_Hagen_Asylanten);

	Info_AddChoice	(Info_Mod_Hagen_Asylanten, DIALOG_BACK, Info_Mod_Hagen_Asylanten_BACK);

	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_Asylanten))
	&& (Mod_Hagen_BL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einem Talkessel im Norden halten sich Banditen auf.", Info_Mod_Hagen_Asylanten_F1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Asylanten))
	&& (Mod_Hagen_VL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einer Ruine sind Verwandlungsmagier aufgetaucht.", Info_Mod_Hagen_Asylanten_E1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Asylanten))
	&& (Mod_Hagen_KG == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Am Pass ist weit und breit keine Gruppierung zu sehen.", Info_Mod_Hagen_Asylanten_D2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Der König hat einen eigenen Trupp geschickt, um den Pass zu bewachen.", Info_Mod_Hagen_Asylanten_D1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Asylanten))
	&& (Mod_Hagen_JL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Eine Jägergemeinschaft geht ihrem Beruf nach.", Info_Mod_Hagen_Asylanten_C1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Cadar_Asylanten))
	&& (Mod_Hagen_SL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Die Bruderschaft erhebt sich!", Info_Mod_Hagen_Asylanten_B2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Die Bruderschaft verhält sich ruhig.", Info_Mod_Hagen_Asylanten_B1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Lee_WieStehts))
	&& (Mod_Hagen_NL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Im Neuen Lager ist alles ruhig.", Info_Mod_Hagen_Asylanten_A2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Das Neue Lager plant einen Ausbruch.", Info_Mod_Hagen_Asylanten_A1);
	};
};

FUNC VOID Info_Mod_Hagen_Asylanten_B1()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_B1_15_00"); //Die Bruderschaft verhält sich ruhig.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_B1_04_01"); //Das ist eine gute Nachricht.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_B1_04_02"); //Allerdings kann man nie wissen, wann mal einer ihrer Fanatiker zu einem Exodus aufruft.

	Mod_Hagen_SL = 1;

	B_GivePlayerXP	(300);

	Info_ClearChoices	(Info_Mod_Hagen_Asylanten);

	Info_AddChoice	(Info_Mod_Hagen_Asylanten, DIALOG_BACK, Info_Mod_Hagen_Asylanten_BACK);

	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_Asylanten))
	&& (Mod_Hagen_BL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einem Talkessel im Norden halten sich Banditen auf.", Info_Mod_Hagen_Asylanten_F1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Asylanten))
	&& (Mod_Hagen_VL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einer Ruine sind Verwandlungsmagier aufgetaucht.", Info_Mod_Hagen_Asylanten_E1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Asylanten))
	&& (Mod_Hagen_KG == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Am Pass ist weit und breit keine Gruppierung zu sehen.", Info_Mod_Hagen_Asylanten_D2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Der König hat einen eigenen Trupp geschickt, um den Pass zu bewachen.", Info_Mod_Hagen_Asylanten_D1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Asylanten))
	&& (Mod_Hagen_JL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Eine Jägergemeinschaft geht ihrem Beruf nach.", Info_Mod_Hagen_Asylanten_C1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Cadar_Asylanten))
	&& (Mod_Hagen_SL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Die Bruderschaft erhebt sich!", Info_Mod_Hagen_Asylanten_B2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Die Bruderschaft verhält sich ruhig.", Info_Mod_Hagen_Asylanten_B1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Lee_WieStehts))
	&& (Mod_Hagen_NL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Im Neuen Lager ist alles ruhig.", Info_Mod_Hagen_Asylanten_A2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Das Neue Lager plant einen Ausbruch.", Info_Mod_Hagen_Asylanten_A1);
	};
};

FUNC VOID Info_Mod_Hagen_Asylanten_A2()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_A2_15_00"); //Im Neuen Lager ist alles ruhig.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_A2_04_01"); //Das kann ich mir ja kaum vorstellen.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_A2_04_02"); //Aber da ich selbst nichts Genaueres weiß, werde ich mich wohl nach dir richten müssen.

	Mod_Hagen_NL = 2;

	B_GivePlayerXP	(300);

	Info_ClearChoices	(Info_Mod_Hagen_Asylanten);

	Info_AddChoice	(Info_Mod_Hagen_Asylanten, DIALOG_BACK, Info_Mod_Hagen_Asylanten_BACK);

	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_Asylanten))
	&& (Mod_Hagen_BL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einem Talkessel im Norden halten sich Banditen auf.", Info_Mod_Hagen_Asylanten_F1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Asylanten))
	&& (Mod_Hagen_VL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einer Ruine sind Verwandlungsmagier aufgetaucht.", Info_Mod_Hagen_Asylanten_E1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Asylanten))
	&& (Mod_Hagen_KG == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Am Pass ist weit und breit keine Gruppierung zu sehen.", Info_Mod_Hagen_Asylanten_D2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Der König hat einen eigenen Trupp geschickt, um den Pass zu bewachen.", Info_Mod_Hagen_Asylanten_D1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Asylanten))
	&& (Mod_Hagen_JL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Eine Jägergemeinschaft geht ihrem Beruf nach.", Info_Mod_Hagen_Asylanten_C1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Cadar_Asylanten))
	&& (Mod_Hagen_SL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Die Bruderschaft erhebt sich!", Info_Mod_Hagen_Asylanten_B2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Die Bruderschaft verhält sich ruhig.", Info_Mod_Hagen_Asylanten_B1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Lee_WieStehts))
	&& (Mod_Hagen_NL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Im Neuen Lager ist alles ruhig.", Info_Mod_Hagen_Asylanten_A2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Das Neue Lager plant einen Ausbruch.", Info_Mod_Hagen_Asylanten_A1);
	};
};

FUNC VOID Info_Mod_Hagen_Asylanten_A1()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_A1_15_00"); //Das Neue Lager plant einen Ausbruch.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_A1_04_01"); //Bei Innos! Erzähl mehr!
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_A1_15_02"); //Die Banditen wollen zum Festland segeln und den König stürzen.
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten_A1_15_03"); //Es ist sehr wahrscheinlich, dass sie auf ihrem Weg nach Khorinis kommen.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten_A1_04_04"); //Nein! Wenn sie es schaffen, auf das Festland überzusetzen, bin ich verloren!

	Mod_Hagen_NL = 1;

	B_GivePlayerXP	(300);

	Info_ClearChoices	(Info_Mod_Hagen_Asylanten);

	Info_AddChoice	(Info_Mod_Hagen_Asylanten, DIALOG_BACK, Info_Mod_Hagen_Asylanten_BACK);

	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_Asylanten))
	&& (Mod_Hagen_BL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einem Talkessel im Norden halten sich Banditen auf.", Info_Mod_Hagen_Asylanten_F1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Asylanten))
	&& (Mod_Hagen_VL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "In einer Ruine sind Verwandlungsmagier aufgetaucht.", Info_Mod_Hagen_Asylanten_E1);
	};
	
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Asylanten))
	&& (Mod_Hagen_KG == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Am Pass ist weit und breit keine Gruppierung zu sehen.", Info_Mod_Hagen_Asylanten_D2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Der König hat einen eigenen Trupp geschickt, um den Pass zu bewachen.", Info_Mod_Hagen_Asylanten_D1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Asylanten))
	&& (Mod_Hagen_JL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Eine Jägergemeinschaft geht ihrem Beruf nach.", Info_Mod_Hagen_Asylanten_C1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Cadar_Asylanten))
	&& (Mod_Hagen_SL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Die Bruderschaft erhebt sich!", Info_Mod_Hagen_Asylanten_B2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Die Bruderschaft verhält sich ruhig.", Info_Mod_Hagen_Asylanten_B1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Lee_WieStehts))
	&& (Mod_Hagen_NL == 0)
	{
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "(lügen) Im Neuen Lager ist alles ruhig.", Info_Mod_Hagen_Asylanten_A2);
		Info_AddChoice	(Info_Mod_Hagen_Asylanten, "Das Neue Lager plant einen Ausbruch.", Info_Mod_Hagen_Asylanten_A1);
	};
};

INSTANCE Info_Mod_Hagen_Asylanten2 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_Asylanten2_Condition;
	information	= Info_Mod_Hagen_Asylanten2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich sollte alle Lager gefunden haben.";
};

FUNC INT Info_Mod_Hagen_Asylanten2_Condition()
{
	if (Mod_Hagen_BL > 0)
	&& (Mod_Hagen_VL > 0)
	&& (Mod_Hagen_KG > 0)
	&& (Mod_Hagen_JL > 0)
	&& (Mod_Hagen_SL > 0)
	&& (Mod_Hagen_NL > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_Asylanten2_Info()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten2_15_00"); //Ich sollte alle Lager gefunden haben.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten2_04_01"); //Du hast mir einen wichtigen Dienst erwiesen. Ich kann dir nicht genug danken.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten2_04_02"); //Nun wird es einfacher sein, auf die tatsächliche Lage dort zu reagieren.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten2_04_03"); //Bevor ich dich gehen lasse, muss ich dir leider noch kurz wehtun.

	Mod_Talk_Sicherung = TRUE;

	B_SetTopicStatus	(TOPIC_MOD_HAGEN_ASYLANTEN, LOG_SUCCESS);

	B_GivePlayerXP	(500);

	CurrentNQ += 1;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Hagen_Asylanten3 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_Asylanten3_Condition;
	information	= Info_Mod_Hagen_Asylanten3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_Asylanten3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_Asylanten2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_Asylanten3_Info()
{
	Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

	B_Say	(hero, self, "$AARGH_1");

	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_00"); //Nimm es bitte nicht persönlich, aber ich kann mir keine Fehler mehr erlauben.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_01"); //Ich habe dir ein Wahrheitsserum verabreichen lassen, um deine Aussagen zu den Gruppierungen zu überprüfen.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_02"); //Keine Angst, du bleibst auf jeden Fall am Leben.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_03"); //Falls du mich jedoch angelogen haben solltest, muss ich dir leider meine Gunst entziehen.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_04"); //Also, sprich: Hast du mir die Wahrheit über die Gruppierungen erzählt?

	if (Mod_Hagen_NL == 1)
	&& (Mod_Hagen_SL == 1)
	&& (Mod_Hagen_KG == 1)
	{
		AI_Output(hero, self, "Info_Mod_Hagen_Asylanten3_15_05"); //(leiernd) Ich habe nach bestem Wissen nur die Wahrheit gesprochen.
		AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_06"); //(erleichtert) Das bedeutet mir sehr viel.
		AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_07"); //Verzeih bitte meine grobe Methode. Nur so konnte ich mir sicher sein.
		AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_08"); //Die Wirkung des Serums verfliegt in ein paar Minuten, dann bist du wieder du selbst.
		AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_09"); //Du sollst auch eine kleine Entschädigung für das dir zugefügte Unrecht erhalten.

		B_GiveInvItems	(self, hero, ItMi_Gold, 500);

		AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_10"); //Ich hoffe, du bist mir nicht allzu böse?
		AI_Output(hero, self, "Info_Mod_Hagen_Asylanten3_15_11"); //(leiernd) Ich polier dir die Fresse, du Sack.
		AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_12"); //(ernst) Es tut mir Leid.

		Mod_Hagen_Asylanten = 1;
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Hagen_Asylanten3_15_13"); //(leiernd) Nein.
		AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_14"); //(ruhig) Und wie ist stattdessen die Lage?
		AI_Output(hero, self, "Info_Mod_Hagen_Asylanten3_15_15"); //(leiernd) Das Neue Lager plant, aus dem Minental auszubrechen und mit einem Schiff aufs Festland zu gelangen.
		AI_Output(hero, self, "Info_Mod_Hagen_Asylanten3_15_16"); //Die Bruderschaft ist vollkommen ruhig.
		AI_Output(hero, self, "Info_Mod_Hagen_Asylanten3_15_17"); //Am Pass lagert die Garde des Königs, damit du dort keine Macht mehr hast. Der König traut dir nicht.
		AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_18"); //Das ist ja doch etwas anderes, als du mir versucht hast weiszumachen, nicht?
		AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_19"); //Und da behaupte noch einer, ich sei paranoid.
		AI_Output(self, hero, "Info_Mod_Hagen_Asylanten3_04_20"); //(laut) Albrecht, schaff ihn hier raus. Und geh sicher, dass er diesen Tag nicht so schnell vergisst.

		AI_StopProcessInfos	(self);
	};
};

INSTANCE Info_Mod_Hagen_Alissandro (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_Alissandro_Condition;
	information	= Info_Mod_Hagen_Alissandro_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alissandro schickt mich, wir haben eine Bitte an die Paladine.";
};

FUNC INT Info_Mod_Hagen_Alissandro_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Knast2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_Alissandro_Info()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Alissandro_15_00"); //Alissandro schickt mich, wir haben eine Bitte an die Paladine.
	AI_Output(self, hero, "Info_Mod_Hagen_Alissandro_04_01"); //Ich höre.
	AI_Output(hero, self, "Info_Mod_Hagen_Alissandro_15_02"); //Das Alte Lager wird von Dämonenrittern unter der Leitung des früheren Erzbarons Gomez bedroht und wir erhoffen uns Hilfe vom Orden der Paladine.
	AI_Output(self, hero, "Info_Mod_Hagen_Alissandro_04_03"); //Nun, ich kenne Alissandro, er ist ein kluger und gerechter Mann und ich bin sicher, dass unter seiner Hand das Alte Lager eine gute Leitung erfährt, darum wollen wir eure Bitte erfüllen.
	AI_Output(self, hero, "Info_Mod_Hagen_Alissandro_04_04"); //Ich will dir den Plan erklären:
	AI_Output(self, hero, "Info_Mod_Hagen_Alissandro_04_05"); //Als Erstes werden wir durch die Verlassene Mine in das Minental gehen, wo wir bei der Jägerhütte Stellung beziehen. Danach Werden wir alle Wegen ins und aus dem Minental einnehmen.
	AI_Output(self, hero, "Info_Mod_Hagen_Alissandro_04_06"); //Wenn wir dies geschafft haben werden wir die Alte Mine angreifen und sie einnehmen.
	AI_Output(self, hero, "Info_Mod_Hagen_Alissandro_04_07"); //Wenn kein Nachschub mehr daraus kommen kann belagern wir Gomez und seine Leute in dem ein großer Teil unseres Heeres um das Lager Stellung bezieht, um zu verhindern, dass es jemand betritt oder verlässt.
	AI_Output(self, hero, "Info_Mod_Hagen_Alissandro_04_08"); //Allerdings werden wir jemanden in das Lager einschleußen, um ihnen von innen heraus zu schaden. Derjenige wirst du sein. So werden wir Gomez schließlich zur Kapitulation zwingen.
	AI_Output(self, hero, "Info_Mod_Hagen_Alissandro_04_09"); //Wir werden bald ins Minental kommen. Geh du in der Zeit zu Alissandro und berichte ihm dies.

	B_LogEntry	(TOPIC_MOD_AL_FLUCHT, "Lord Hagen hat mir seine Hilfe zugesichert. Ich werde Alissandro davon berichten.");
};

INSTANCE Info_Mod_Hagen_Cornelius (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_Cornelius_Condition;
	information	= Info_Mod_Hagen_Cornelius_Info;
	permanent	= 0;
	important	= 0;
	description	= "Aufgrund meiner zahlreichen Verdienste ...";
};

FUNC INT Info_Mod_Hagen_Cornelius_Condition()
{
	if (Mod_Cornelius_Overtalk == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_Cornelius_Info()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Cornelius_15_00"); //Aufgrund meiner zahlreichen Verdienste ...
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius_04_01"); //Du fängst ja schon an wie die Stadtquacksalber. Was willst du?
	AI_Output(hero, self, "Info_Mod_Hagen_Cornelius_15_02"); //Ich erbitte eine neue Aufgabe für Cornelius.
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius_04_03"); //(lacht) Den mach ich höchstens zum königlichen Kloputzer.
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius_04_04"); //Wieso beschwert sich gerade der? Seine einzige Arbeit besteht anscheinend darin, mir das Leben schwer zu machen.
	AI_Output(hero, self, "Info_Mod_Hagen_Cornelius_15_05"); //Das macht ihn nicht glücklich.
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius_04_06"); //(ironisch) Die Vorstellung rührt mich zu Tränen. Aber ich werde ihn hier in meiner Nähe behalten, wo ich auf ihn aufpassen kann.
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius_04_07"); //Sonst müsste ich noch dauernd die Befürchtung haben, dass seine korrupten Spielchen zum Erfolg führen.

	Info_ClearChoices	(Info_Mod_Hagen_Cornelius);

	Info_AddChoice	(Info_Mod_Hagen_Cornelius, "Das ist mir doch zu gefährlich.", Info_Mod_Hagen_Cornelius_B);
	Info_AddChoice	(Info_Mod_Hagen_Cornelius, "Ich bürge für ihn.", Info_Mod_Hagen_Cornelius_A);
};

FUNC VOID Info_Mod_Hagen_Cornelius_B()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Cornelius_B_15_00"); //Das ist mir doch zu gefährlich.
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius_B_04_01"); //Ich freue mich, dass du das auch so siehst.

	Mod_Cornelius_Overtalk = 2;

	Mod_Cornelius_Overtalk_Day = Wld_GetDay();

	B_SetTopicStatus	(TOPIC_MOD_CORNELIUS_HELP, LOG_FAILED);

	Info_ClearChoices	(Info_Mod_Hagen_Cornelius);
};

FUNC VOID Info_Mod_Hagen_Cornelius_A()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Cornelius_A_15_00"); //Ich bürge für ihn.
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius_A_04_01"); //Du scheinst dir deiner Sache ja sicher zu sein. Wenn ich gewillt wäre, Cornelius ein neues Amt zu verleihen, welches wäre das?
	AI_Output(hero, self, "Info_Mod_Hagen_Cornelius_A_15_02"); //Ich denke, etwas Wirtschaftliches würde ihm liegen.
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius_A_04_03"); //(seufzt tief) So sei es. Richte ihm aus, dass ich ihn bei nächster Gelegenheit zum Wirtschaftsminister ernenne.
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius_A_04_04"); //Aber bedenke, dass ich mich dazu nur verpflichtet fühle, weil du uns bisher so große Dienste erwiesen hast.
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius_A_04_05"); //Hoffen wir, dass er seine Stellung nicht missbraucht.

	B_LogEntry	(TOPIC_MOD_CORNELIUS_HELP, "Ich sollte Cornelius davon berichten, dass er bei nächster Gelegenheit von Lord Hagen zum Wirtschaftsminister ernannt wird.");

	Mod_Cornelius_Overtalk = 4;

	Mod_Cornelius_Overtalk_Day = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Hagen_Cornelius);
};

INSTANCE Info_Mod_Hagen_Cornelius02 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_Cornelius02_Condition;
	information	= Info_Mod_Hagen_Cornelius02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo ist Cornelius?";
};

FUNC INT Info_Mod_Hagen_Cornelius02_Condition()
{
	if (Mod_Cornelius_Overtalk == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_Cornelius02_Info()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Cornelius02_15_00"); //Wo ist Cornelius?
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius02_04_01"); //Da, wo er hingehört: hinter Gittern.
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius02_04_02"); //Ich habe gerade noch erfahren, dass er einen kleinen Putsch im Sinn hatte.
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius02_04_03"); //Er hätte nicht so viele Außenstehende einweihen sollen.
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius02_04_04"); //Gut, dass du damals nicht darauf beharrt hast, ihn sein Amt wechseln zu lassen, sonst sähe es jetzt vielleicht ganz anders aus.
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius02_04_05"); //Man muss immer gut aufpassen, wen man sich zum Freund macht.

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Hagen_Cornelius03 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_Cornelius03_Condition;
	information	= Info_Mod_Hagen_Cornelius03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_Cornelius03_Condition()
{
	if (Mod_Cornelius_Overtalk == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_Cornelius03_Info()
{
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius03_04_00"); //(verbittert) Ist die Sache nun also gegessen? Können wir wieder an die Arbeit gehen?
	AI_Output(hero, self, "Info_Mod_Hagen_Cornelius03_15_01"); //Verzeih bitte meinen Leichtsinn.
	AI_Output(self, hero, "Info_Mod_Hagen_Cornelius03_04_02"); //Es soll dir als Lehre gereichen.
};

INSTANCE Info_Mod_Hagen_StellDichEin (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_StellDichEin_Condition;
	information	= Info_Mod_Hagen_StellDichEin_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_StellDichEin_Condition()
{
	if (Mod_HagenStellDichEin == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_StellDichEin_Info()
{
	AI_EquipBestArmor	(Mod_1056_VLK_Buergerin_NW);

	AI_Output(self, hero, "Info_Mod_Hagen_StellDichEin_04_00"); //Verflucht, was hast du hier zu suchen.
	AI_Output(hero, self, "Info_Mod_Hagen_StellDichEin_15_01"); //Ähh, ich ...
	AI_Output(self, hero, "Info_Mod_Hagen_StellDichEin_04_02"); //Nun gut, ähh, vergessen wir, dass das hier stattgefunden hat.

	AI_EquipBestArmor	(self);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_1056_VLK_Buergerin_NW, "START");
};

INSTANCE Info_Mod_Hagen_Mario (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_Mario_Condition;
	information	= Info_Mod_Hagen_Mario_Info;
	permanent	= 0;
	important	= 0;
	description	= "Garond ist ein Mörder!";
};

FUNC INT Info_Mod_Hagen_Mario_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garond_Mario2))
	&& (!Npc_IsDead(Mod_500_PAL_Garond_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_Mario_Info()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Mario_15_00"); //Garond ist ein Mörder!
	AI_Output(self, hero, "Info_Mod_Hagen_Mario_04_01"); //Du meinst das Duell mit Mario?
	AI_Output(self, hero, "Info_Mod_Hagen_Mario_04_02"); //(seufzt) Von einem erfahrenen Mann wie Garond hätte ich nicht erwartet, dass er etwas so Törichtes anstellt, aber ich kann an dem Duell selbst nichts Unrechtmäßiges sehen.
	AI_Output(self, hero, "Info_Mod_Hagen_Mario_04_03"); //In vielen Fällen enden diese leider tödlich. Dessen sollte man sich bewusst sein, bevor man jemanden herausfordert.
	AI_Output(hero, self, "Info_Mod_Hagen_Mario_15_04"); //Das bedeutet, ich muss die Sache selbst in die Hand nehmen.
	AI_Output(self, hero, "Info_Mod_Hagen_Mario_04_05"); //Es würde mir besser gefallen, du würdest sie ruhen lassen.
	AI_Output(hero, self, "Info_Mod_Hagen_Mario_15_06"); //Das werde ich jetzt selbst entscheiden.
};

INSTANCE Info_Mod_Hagen_AndreVermaechtnis (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_AndreVermaechtnis_Condition;
	information	= Info_Mod_Hagen_AndreVermaechtnis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_AndreVermaechtnis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Andre))
	|| (Npc_KnowsInfo(hero, Info_Mod_Theodorus_Andre))
	|| (Npc_KnowsInfo(hero, Info_Mod_Wendel_Andre))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_AndreVermaechtnis_Info()
{
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_00"); //Aha, nun bist du also eingetroffen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_01"); //Ich habe von allem gehört, was geschehen ist ... und auch von Andres Wunsch, dass du sein Nachfolger werden sollst.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_02"); //Mir ist da allerdings einiges über deine Vergangenheit zu Ohren gekommen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_03"); //So sollst du ein ehemaliger Gefangener der Kolonie sein und Kontakte zu Lares und einigen Hehlern des Neuen Lagers unterhalten.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis_15_04"); //Ich ...
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_05"); //Du brauchst es gar nicht zu leugnen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_06"); //Nach den letzten Ereignissen habe ich mich über dich erkundigt und aus mehreren Quellen Bestätigung erhalten.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_07"); //Angesichts dessen kann ich dich nicht einfach so zum Hauptmann ernennen ... allein schon, weil ich dich dafür zu einem Paladin des Königs erheben müsste, wo du doch mit seinen Feinden konspirierst.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_08"); //Andererseits, nun ... kann ich deine Taten für die Stadt, wie auch Andres Willen nach seinem großen Opfer nicht einfach so ignorieren.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis_15_09"); //Was heißt das nun konkret?
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_10"); //Das bedeutet, dass ich dir die Chance geben werde, dich zu bewähren.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_11"); //Wenn du bewiesen hast, dass du eines solchen Amtes würdig bist und den Paladinen keine Schande sein wirst, werde ich es mir vielleicht nochmal überlegen.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis_15_12"); //Wie kann ich meine Loyalität beweisen?
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_13"); //Nun, für deine erste Aufgabe wirst du genau die Beziehungen nutzen müssen, welche ein so schlechtes Licht auf dich werfen ... auch, wenn es paradox klingt.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_14"); //Du wirst zum Großbauernhof gehen und Lares eine Nachricht überbringen, die meinen Willen für einen Nichtangriffspakt bekundet.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_15"); //Die Lage im Minental spitzt sich nämlich besorgniserregend zu.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_16"); //Da ist ein offener Konflikt zwischen Paladinen und Söldnern für keine Seite von Vorteil.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_17"); //Ich hoffe Lares wird es genauso sehen. Hier ist die Botschaft.

	B_GiveInvItems	(self, hero, ItWr_HagenLares, 1);

	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis_04_18"); //Du weißt also, was du zu tun hast.

	Log_CreateTopic	(TOPIC_MOD_MILIZ_FRIEDENSBOTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MILIZ_FRIEDENSBOTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MILIZ_FRIEDENSBOTE, "Lord Hagen hat Zweifel, ob ich wirklich eines Paladins und Hauptmanns würdig bin. Daher soll ich erst mal einige Aufgaben für ihn erledigen. Zu Beginn muss ich einen Friedensbotschaft an Lares überbringen.");
};

INSTANCE Info_Mod_Hagen_AndreVermaechtnis2 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_AndreVermaechtnis2_Condition;
	information	= Info_Mod_Hagen_AndreVermaechtnis2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_AndreVermaechtnis2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lares_Friedensbote))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_AndreVermaechtnis2_Info()
{
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis2_04_00"); //Du bist zurück? Was hast du zu berichten?
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis2_15_01"); //Ich übergab Lares der Schreiben und er willigte in die Waffenruhe ein.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis2_04_02"); //Das ist gut. Damit hast du diese Aufgabe erwartungsgemäß erfüllt.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis2_04_03"); //Da das Übel jedoch nie ruht, muss ich dich gleich zum nächsten Auftrag aussenden.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis2_15_04"); //Um welche Bedrohung für die Stadt geht es?
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis2_04_05"); //Nun ... wie soll ich sagen ... vom Osttor aus zieht ein zunehmender starker Verwesungsgeruch in die Stadt.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis2_04_06"); //Zum einen stört es das öffentliche Leben auf dem sonst so belebten Markt ungemein, zum anderen konnten die Torwachen bislang keine Quelle dieses Übels ausmachen, was beunruhigend ist.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis2_04_07"); //Daher habe ich einige Stadtwachen vor das Osttor geschickt, um nach dem Ursprung zu suchen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis2_04_08"); //Du wirst dich zu ihnen begeben und sie dabei anleiten.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis2_04_09"); //Falls ihr fündig werdet, zögert nicht das Problem zu beseitigen, wenn es in eurer Macht liegt.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis2_04_10"); //Alles verstanden? Gut. Möge Innos eure Suche erhellen.

	B_SetTopicStatus	(TOPIC_MOD_MILIZ_FRIEDENSBOTE, LOG_SUCCESS);
	Log_CreateTopic	(TOPIC_MOD_MILIZ_NASE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MILIZ_NASE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MILIZ_NASE, "Vom Osttor aus zieht ein starker Verwesungsgeruch in die Stadt. Daher soll ich mich dorthin begeben, wo mich einige Stadtwachen bei der Suche nach der Quelle des Gestanks unterstützen werden. Falls wir was finden, sollen wir das Problem lösen, wenn möglich.");

	B_RemoveNpc	(Mod_7100_ASS_Zahit_NW);
	B_RemoveNpc	(Mod_7101_ASS_Krieger_NW);
	B_RemoveNpc	(Mod_7113_ASS_Yussuf_NW);
	B_RemoveNpc	(Mod_7105_ASS_Aabid_NW);
	B_RemoveNpc	(Mod_7104_ASS_Shakir_NW);
	B_RemoveNpc	(Mod_7103_ASS_Gauner_NW);
	B_RemoveNpc	(Mod_7106_ASS_Ramsi_NW);
	B_RemoveNpc	(Mod_7102_ASS_Zeki_NW);
	B_RemoveNpc	(Mod_7108_ASS_Gauner_NW);
	B_RemoveNpc	(Mod_7107_ASS_Gauner_NW);
	B_RemoveNpc	(Mod_7127_ASS_Krieger_NW);
	B_RemoveNpc	(Mod_7117_ASS_Krieger_NW);
	B_RemoveNpc	(Mod_7118_ASS_Anwaerter_NW);
	B_RemoveNpc	(Mod_7116_ASS_Krieger_NW);
	B_RemoveNpc	(Mod_7124_ASS_Anwaerter_NW);
	B_RemoveNpc	(Mod_7122_ASS_Maysara_NW);
	B_RemoveNpc	(Mod_7123_ASS_Malik_NW);
	B_RemoveNpc	(Mod_7119_ASS_Masut_NW);
	B_RemoveNpc	(Mod_7125_ASS_Karim_NW);
	B_RemoveNpc	(Mod_7126_ASS_Krieger_NW);
	B_RemoveNpc	(Mod_7141_ASS_Elite_NW);
	B_RemoveNpc	(Mod_7134_ASS_Anwaerter_NW);
	B_RemoveNpc	(Mod_7133_ASS_Sinbad_NW);
	B_RemoveNpc	(Mod_7131_ASS_Krieger_NW);
	B_RemoveNpc	(Mod_7142_ASS_Elite_NW);
	B_RemoveNpc	(Mod_7138_ASS_Azhar_NW);
	B_RemoveNpc	(Mod_7140_ASS_Elite_NW);
	B_RemoveNpc	(Mod_7145_ASS_Aadel_NW);
	B_RemoveNpc	(Mod_7149_ASS_Mufid_NW);
	B_RemoveNpc	(Mod_7146_ASS_Mustafa_NW);
	B_RemoveNpc	(Mod_7147_ASS_Naim_NW);
	B_RemoveNpc	(Mod_7150_ASS_Mahamad_NW);
	B_RemoveNpc	(Mod_7152_ASS_Aiman_NW);
	B_RemoveNpc	(Mod_7148_ASS_Norek_NW);
	B_RemoveNpc	(Mod_7154_ASS_Malek_NW);
	B_RemoveNpc	(Mod_7156_ASS_Mirza_NW);
	B_RemoveNpc	(Mod_7166_ASS_Novize_NW);
	B_RemoveNpc	(Mod_7160_ASS_Novize_NW);
	B_RemoveNpc	(Mod_7199_ASS_Amir_NW);
	B_RemoveNpc	(Mod_7159_ASS_Novize_NW);
	B_RemoveNpc	(Mod_7158_ASS_Novize_NW);
	B_RemoveNpc	(Mod_7161_ASS_Novize_NW);
	B_RemoveNpc	(Mod_7157_ASS_Mourad_NW);
	B_RemoveNpc	(Mod_7163_ASS_Kamal_NW);
	B_RemoveNpc	(Mod_7164_ASS_Kais_NW);
	B_RemoveNpc	(Mod_7165_ASS_Adil_NW);

	B_StartOtherRoutine	(Mod_7111_ASS_Yasin_NW, "MILIZ");
	B_KillNpc	(Mod_7111_ASS_Yasin_NW);

	Wld_SendTrigger	("EVT_ASSISTOT");

	CreateInvItems	(Mod_7111_ASS_Yasin_NW, ItWr_YasinErpresser, 1);
	CreateInvItems	(Mod_7111_ASS_Yasin_NW, ItWr_YasinNotiz, 1);

	B_StartOtherRoutine	(Mod_541_NONE_Till_NW, "NASE");
	B_StartOtherRoutine	(Mod_744_MIL_Pablo_NW, "NASE");
	B_StartOtherRoutine	(Mod_968_MIL_Bilgot_NW, "NASE");

	AI_UnequipArmor	(Mod_541_NONE_Till_NW);

	CreateInvItems	(Mod_541_NONE_Till_NW, ItAr_MIL_M, 1);

	AI_EquipArmor	(Mod_541_NONE_Till_NW, ItAr_MIL_M);

	B_GivePlayerXP	(300);

	Wld_InsertNpc	(Mod_7681_ASS_Halbtoter_NW,	"WP_ASSASSINE_08");
};

INSTANCE Info_Mod_Hagen_AndreVermaechtnis3 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_AndreVermaechtnis3_Condition;
	information	= Info_Mod_Hagen_AndreVermaechtnis3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_AndreVermaechtnis3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Till_InnosNase2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_AndreVermaechtnis3_Info()
{
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis3_04_00"); //Du bist wieder da? Heißt das, die Quelle wurde gefunden und beseitigt?
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis3_15_01"); //Ja, die Stadtwachen kümmern sich gerade darum.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis3_15_02"); //In einer nahe gelegenen Höhle lagen die Leichen einiger finsterer Gestalten herum, die offensichtlich vom Roboter erschlagen wurden.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis3_04_03"); //Was so nahe an der Stadt? Und der Roboter hat sie beseitigt?
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis3_04_04"); //Hmm ... wohl eine weitere Erklärung dafür, dass die Gewaltkriminalität so stark in der Stadt und Umgebung abgenommen hat.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis3_04_05"); //(halblaut) Vielleicht hätte man den Roboter noch ein bisschen länger ...
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis3_04_06"); //(wieder zum Helden) Ähhm, wie dem auch sei, du hast der Stadt wieder einmal einen guten Dienst erwiesen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis3_04_07"); //Hier eine kleine Entlohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis3_04_08"); //Wenn du dich weiter so gut bewährst, ist es nur noch eine Frage der Zeit, bist du Hauptmann und Paladin wirst, auch, wenn ich vorerst keine weiteren Aufgaben für dich habe.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis3_04_09"); //Folge einfach weiter dem Pfad der Rechtschaffenden, dem Beispiel Innos.

	B_SetTopicStatus	(TOPIC_MOD_MILIZ_NASE, LOG_SUCCESS);

	B_StartOtherRoutine	(Mod_541_NONE_Till_NW, "START");
	B_StartOtherRoutine	(Mod_744_MIL_Pablo_NW, "START");
	B_StartOtherRoutine	(Mod_968_MIL_Bilgot_NW, "START");

	B_StartOtherRoutine	(Mod_587_NONE_Jesper_NW, "HEHLER");
	B_StartOtherRoutine	(Mod_598_MIL_Mika_NW, "HEHLER");

	B_GivePlayerXP	(300);

	B_StartOtherRoutine	(Mod_748_NONE_Rengaru_NW, "DIEB");
};

INSTANCE Info_Mod_Hagen_AndreVermaechtnis4 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_AndreVermaechtnis4_Condition;
	information	= Info_Mod_Hagen_AndreVermaechtnis4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_AndreVermaechtnis4_Condition()
{
	if (Mod_PAL_MikaHehler > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_AndreVermaechtnis4_Info()
{
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis4_04_00"); //Stadtwache Mika ist verschwunden. Was ist passiert?
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis4_04_01"); //Du bist für die Stadtwachen verantwortlich. Ich verlange Rechenschaft!
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis4_15_02"); //Er handelte mit heißer Ware und bekam Feuer unter dem Hintern, als ich ihn dabei erwischte.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis4_04_03"); //Was ... aber ... Dann war er also der Hehler, der die gestohlenen Waren aus der Stadt schaffte.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis4_15_04"); //Ihr wusstet von einem Hehler?
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis4_04_05"); //Wir wussten, dass es einen Verbindungsmann zwischen den Dieben der Stadt und der umliegenden Gegend geben musste.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis4_04_06"); //Nur so konnten die gestohlenen Waren unbemerkt die Stadt verlassen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis4_04_07"); //Mika also ... ja ... jetzt im Nachhinein macht es alles Sinn. Aber ... was ist mit ihm geschehen?

	if (Mod_PAL_MikaHehler == 2)
	{
		AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis4_15_08"); //Er ist aus der Stadt entkommen.
		AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis4_04_09"); //Ärgerlich, dass er so seiner Strafe entgeht. Aber zumindest haben die Diebe ihren Hehler verloren.

		B_GivePlayerXP	(250);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis4_15_10"); //Ich habe ihn erwischt und war gezwungen ihn im Kampf zu töten.
		AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis4_04_11"); //So wurde er also für seine Taten gerichtet. Gut.
		AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis4_04_12"); //Und die Diebe haben ihren Hehler verloren.

		B_GivePlayerXP	(350);
	};

	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis4_04_13"); //Das sollte ihr Handwerk ordentlich erschweren.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis4_04_14"); //Damit hast du der Stadt wieder einmal einen wertvollen Dienst erwiesen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis4_04_15"); //Hier, diesen Sold hast du dir verdient.

	if (Mod_PAL_MikaHehler == 2)
	{
		B_GiveInvItems	(self, hero, ItMi_Gold, 200);
	}
	else
	{
		B_GiveInvItems	(self, hero, ItMi_Gold, 300);
	};
};

INSTANCE Info_Mod_Hagen_AndreVermaechtnis5 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_AndreVermaechtnis5_Condition;
	information	= Info_Mod_Hagen_AndreVermaechtnis5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Diebe haben mehr als nur ihren Hehler verloren.";
};

FUNC INT Info_Mod_Hagen_AndreVermaechtnis5_Condition()
{
	if (Mod_PAL_MikaHehler == 1)
	&& (Npc_HasItems(hero, ItKe_Hotel) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_AndreVermaechtnis5_Info()
{
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis5_15_00"); //Die Diebe haben mehr als nur ihren Hehler verloren.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis5_15_01"); //Ich habe Mikas "Handelspartner" gestellt. Er wird keinen Ärger mehr machen.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis5_15_02"); //Ich fand einen Schlüssel bei ihm.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis5_04_03"); //Das ist großartig, Zeig mir den Schlüssel ...
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis5_15_04"); //Hier.

	B_GiveInvItems	(hero, self, ItKe_Hotel, 1);

	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis5_04_05"); //"H". Da könnten viele in der Stadt in Frage kommen ... mich eingeschlossen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis5_04_06"); //Wo hast du Mika bei seinen krummen Geschäften erwischt.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis5_15_07"); //Dort, wo der Herold tagsüber predigt.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis5_04_08"); //Aha! Das bringt uns der Sache natürlich näher.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis5_04_09"); //Ich werde dann alles in die Wege leiten, um sicher zu gehen. Komm morgen wieder zu mir.

	if (Mod_PAL_Diebesgilde == 1)
	{
		AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis5_15_10"); //Aber ...
		AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis5_04_11"); //Ja, war noch was?
		AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis5_15_12"); //Ich habe die Diebes bereits ausgeschaltet. Der Schlüssel führte von Hannas Herberge aus zu ihrem Versteck.
		AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis5_04_13"); //(irritiert, etwas enttäuscht) Wie, du hast dich schon darum gekümmert?!
		AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis5_04_14"); //(fängt sich wieder) Ähhm, nun, wenn das so ist ... gute Arbeit.
		AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis5_04_15"); //Damit hast du der Stadt wieder einmal einen unschätzbaren Dienst erwiesen.
		AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis5_04_16"); //Hier, diesen Sold hast du dir mehr als verdient.

		B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

		B_GivePlayerXP	(600);

		B_StartOtherRoutine	(Mod_583_NONE_Hanna_NW, "KNAST");
		B_StartOtherRoutine	(Mod_968_MIL_Bilgot_NW, "HOTEL");
	}
	else
	{
		Log_CreateTopic	(TOPIC_MOD_MILIZ_DIEBESGILDE, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_MILIZ_DIEBESGILDE, LOG_RUNNING);
		B_LogEntry	(TOPIC_MOD_MILIZ_DIEBESGILDE, "Lord Hagen hat mich dazu angewiesen, mich morgen wieder bei ihm zu melden.");

		Mod_PAL_Diebesgilde_Day = Wld_GetDay();
	};
};

INSTANCE Info_Mod_Hagen_AndreVermaechtnis6 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_AndreVermaechtnis6_Condition;
	information	= Info_Mod_Hagen_AndreVermaechtnis6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_AndreVermaechtnis6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_AndreVermaechtnis5))
	&& (Wld_GetDay() > Mod_PAL_Diebesgilde_Day)
	&& (Mod_PAL_Diebesgilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_AndreVermaechtnis6_Info()
{
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis6_04_00"); //Gut, dass du eintriffst. Ich habe bereits alles in die Wege geleitet.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis6_15_01"); //Was ist zu tun?
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis6_04_02"); //Du wirst dich in Hannas Herberge begeben, von wo aus ein Weg nach unten in die Kanalisation führt.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis6_04_03"); //Dort wirst du die Aufmerksamkeit der Diebe auf dich lenken, sodass an anderer Stelle Stadtwachen unbemerkt durch einen Schacht hineinklettern und sich positionieren können.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis6_04_04"); //Mit einem Überraschungsangriff sollten wir die Diebesbande dann hoffentlich überrumpeln können.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis6_04_05"); //Du weißt also, was zu tun ist? Viel Erfolg.

	B_GiveInvItems	(self, hero, ItKe_Hotel, 1);

	B_LogEntry	(TOPIC_MOD_MILIZ_DIEBESGILDE, "Von Hannas Herberge aus führt ein Weg nach unten in die Kanalisation, den ich einschlagen soll.");

	B_StartOtherRoutine	(Mod_968_MIL_Bilgot_NW, "HOTEL");

	B_StartOtherRoutine	(Mod_568_NONE_Cassia_NW, "DIEB");
	B_StartOtherRoutine	(Mod_746_NONE_Ramirez_NW, "DIEB");
};

INSTANCE Info_Mod_Hagen_AndreVermaechtnis7 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_AndreVermaechtnis7_Condition;
	information	= Info_Mod_Hagen_AndreVermaechtnis7_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_AndreVermaechtnis7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wambo_AndreVermaechtnis))
	&& (Mod_PAL_Diebesgilde == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_AndreVermaechtnis7_Info()
{
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis7_04_00"); //Ihr habt euch um die Diebesbande gekümmert? Ausgezeichnet.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis7_04_01"); //Damit hast du der Stadt wieder einmal einen unschätzbaren Dienst erwiesen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis7_04_02"); //Hier, diesen Sold hast du dir mehr als verdient.

	B_SetTopicStatus	(TOPIC_MOD_MILIZ_DIEBESGILDE, LOG_SUCCESS);

	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	B_GivePlayerXP	(600);
};

INSTANCE Info_Mod_Hagen_AndreVermaechtnis8 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_AndreVermaechtnis8_Condition;
	information	= Info_Mod_Hagen_AndreVermaechtnis8_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_AndreVermaechtnis8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_AndreVermaechtnis3))
	&& (Npc_KnowsInfo(hero, Info_Mod_Urnol_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_AndreVermaechtnis8_Info()
{
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_00"); //Bei Innos, wie konnte ich nur die unsägliche Gefahr übersehen, in der unsere Stadt schwebte.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_01"); //Es hätte nicht viel gefehlt, und die Kreaturen der Nacht hätten uns ihrem Willen unterworfen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_02"); //Zu viele Stadtwachen und Paladine hatten sie schon kontrolliert ... allein dein Einsatz hat uns vor Schlimmeren bewahrt, wie ich gerade erfahren habe.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_03"); //Wahrlich, du gehörst in die Reihen unserer Streiter.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_04"); //Es jetzt noch zu leugnen, hieße Innos Willen zu verleugnen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_05"); //Bist du also bereit ein Paladin des Königs und ein Streiter Innos’ zu werden?
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis8_15_06"); //Ja, das bin ich.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_07"); //Dann erhebe ich dich hiermit zu einem der unsrigen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_08"); //Was die Tugenden eines Paladins sein, wie du den Weg der Rechtschaffenheit begehst ... das alles muss ich dir nicht erläutern.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_09"); //Denn du hast durch deine Taten bewiesen, dass du stets im Sinne Innos handelst.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_10"); //Zudem bist du nun auch offiziell Hauptmann der Stadt Khorinis.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_11"); //Für gewöhnlich wäre dein Platz jetzt in der Kaserne.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_12"); //Ich habe aber schon mitbekommen, dass es dich nie lange an einem Ort hält.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_13"); //Ich glaube dennoch, oder gerade deshalb wirst du unserer Stadt und der Insel besonders gut dienen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_14"); //Dass du ihr Schicksal bislang schon entscheidend zum Guten bestimmt hast, steht außer Frage.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_15"); //Wir werden das schon irgendwie hinbekommen ...
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_16"); //Wie dem auch sei, hier sind die Rüstung und das Schwert eines Paladins.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis8_04_17"); //Willkommen in unseren Reihen.

	B_StartOtherRoutine	(self, "RAT");
};

INSTANCE Info_Mod_Hagen_AndreVermaechtnis9 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_AndreVermaechtnis9_Condition;
	information	= Info_Mod_Hagen_AndreVermaechtnis9_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_AndreVermaechtnis9_Condition()
{
	if (Mod_Gilde == 3)
	&& (Mod_Enter_Minental_04)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_AndreVermaechtnis9_Info()
{
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis9_04_00"); //Ahh, gut, dass du kommst. Ich nehme an, dass du schon von den dramatischen Ereignissen im Minental gehört hast?
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis9_15_01"); //Du meinst den Fall des Alten Lagers?
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis9_04_02"); //Genau. Das Böse gewinnt mit besorgniserregender Geschwindigkeit an Macht ... und neues Übel scheint aus dem Minental zu drohen.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis9_15_03"); //Um was geht es?
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis9_04_04"); //Das wissen wir selber leider noch nicht genau.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis9_04_05"); //Denn die Erfahrungen mit den Seelenpeinigern haben uns gezeigt, dass nicht immer auf den ersten Blick Harmloses von Gefährlichem zu unterscheiden ist.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis9_04_06"); //Fest steht nur, dass seit kurzem vermehrt Leute aus dem Minental strömen und man Gruppen von ihnen überall in der Umgebung antrifft.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis9_04_07"); //Ob, nur harmlose Flüchtlinge, oder verschlagene Verbrecher, gar heimtückische Spione des Feindes ... wir wissen es nicht.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis9_04_08"); //Einige unsere Stadtwachen befinden sich in ihrer Nähe und beobachten die Lage.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis9_04_09"); //In Hinblick auf deine Kenntnis um das Minental und seine Bewohner möchte ich, dass du zu ihnen stößt und ergründest, was es mit den Leuten auf sich hat.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis9_04_10"); //Hier, auf dieser Karte habe ich die Positionen der Gruppen verzeichnet.

	B_GiveInvItems	(self, hero, ItWr_Map_HagenAL, 1);

	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis9_04_11"); //Du weißt also, was zu tun ist? Innos begleite dich auf deinen Wegen!

	Log_CreateTopic	(TOPIC_MOD_MILIZ_FREUNDFEIND, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MILIZ_FREUNDFEIND, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MILIZ_FREUNDFEIND, "Seit dem Fall des Alten Lagers sind vermehrt Menschen aus dem Minental geströmt, die sich in Gruppen an verschiedenen Stellen von Khorinis niedergelassen haben. Lord Hagen möchte, dass ich ergründe, ob es nur harmlose Flüchtlinge sind, oder ob sie böses im Schilde führen.");

	B_StartOtherRoutine	(Mod_109_MIL_Rick_NW, "FISK");
	B_StartOtherRoutine	(Mod_118_MIL_Rumbold_NW, "FISK");

	Wld_InsertNpc	(Mod_7682_STT_Fisk_NW,	"NW_BIGMILL_FARM3_07");
	Wld_InsertNpc	(Mod_7683_BUD_Buddler_NW,	"NW_BIGMILL_FARM3_07");
	Wld_InsertNpc	(Mod_7684_STT_Schatten_NW,	"NW_BIGMILL_FARM3_07");
	Wld_InsertNpc	(Mod_7685_BUD_Buddler_NW,	"NW_BIGMILL_FARM3_07");

	Wld_InsertNpc	(Mod_7686_BUD_Grim_NW,	"NW_TAVERNE_TROLLAREA_15");
	Wld_InsertNpc	(Mod_7687_GRD_Gardist_NW,	"NW_TAVERNE_TROLLAREA_15");
	Wld_InsertNpc	(Mod_7688_STT_Schatten_NW,	"NW_TAVERNE_TROLLAREA_15");
	Wld_InsertNpc	(Mod_7689_BUD_Buddler_NW,	"NW_TAVERNE_TROLLAREA_15");
	Wld_InsertNpc	(Mod_7690_STT_Schatten_NW,	"NW_TAVERNE_TROLLAREA_15");
	Wld_InsertNpc	(Mod_7691_BUD_Buddler_NW,	"NW_TAVERNE_TROLLAREA_15");

	Wld_InsertNpc	(Mod_7692_BUD_Buddler_NW,	"NW_FARM1_PATH_SPAWN_05");
	Wld_InsertNpc	(Mod_7693_BUD_Buddler_NW,	"NW_FARM1_PATH_SPAWN_05");
	Wld_InsertNpc	(Mod_7694_BDT_Bandit_NW,	"NW_FARM1_PATH_SPAWN_05");
	Wld_InsertNpc	(Mod_7695_BDT_Bandit_NW,	"NW_FARM1_PATH_SPAWN_05");
	Wld_InsertNpc	(Mod_7696_BDT_Bandit_NW,	"NW_FARM1_PATH_SPAWN_05");
};

INSTANCE Info_Mod_Hagen_AndreVermaechtnis10 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_AndreVermaechtnis10_Condition;
	information	= Info_Mod_Hagen_AndreVermaechtnis10_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich war bei den drei Gruppen aus dem Minental.";
};

FUNC INT Info_Mod_Hagen_AndreVermaechtnis10_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_NW_Hi))
	&& (Npc_IsDead(Mod_7686_BUD_Grim_NW))
	&& (Npc_IsDead(Mod_7687_GRD_Gardist_NW))
	&& (Npc_IsDead(Mod_7689_BUD_Buddler_NW))
	&& (Npc_IsDead(Mod_7691_BUD_Buddler_NW))
	&& (Npc_IsDead(Mod_7690_STT_Schatten_NW))
	&& (Npc_IsDead(Mod_7692_BUD_Buddler_NW))
	&& (Npc_IsDead(Mod_7693_BUD_Buddler_NW))
	&& (Npc_IsDead(Mod_7694_BDT_Bandit_NW))
	&& (Npc_IsDead(Mod_7695_BDT_Bandit_NW))
	&& (Npc_IsDead(Mod_7696_BDT_Bandit_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_AndreVermaechtnis10_Info()
{
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis10_15_00"); //Ich war bei den drei Gruppen aus dem Minental.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis10_04_01"); //Und was hast du zu berichten?
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis10_15_02"); //Bei Bengar waren es harmlose Flüchtlinge, darunter ein Händler, den ich noch aus der Kolonie kannte.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis10_15_03"); //Sie sind mittlerweile in der Stadt.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis10_04_04"); //In Ordnung, das ist gut.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis10_04_05"); //Vielleicht können wir von ihnen noch mehr über die Situation im Minental erfahren.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis10_15_06"); //Die Gruppe bei Akil war nicht ganz so umgänglich.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis10_15_07"); //Es waren Wegelagerer ... deren Überreste nun am Wege lagern.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis10_04_08"); //Gute, Arbeit. Ein paar Halunken und Unruhestifter weniger.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis10_04_09"); //Sie wussten eben nicht, was ein Paladin vermag.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis10_04_10"); //Wie dem auch sei ... und die letzte Gruppe?
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis10_15_11"); //Auch ein alter Bekannter aus dem Alten Lager ...
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis10_04_12"); //Erfreulich zu hören ...
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis10_15_13"); //Der jedoch nicht ganz so harmlos war.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis10_15_14"); //Es scheint, dass er unter dem Einfluss der Seeleinpeiniger das Tor im Lager öffnete.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis10_04_15"); //Was, er war dafür verantwortlich?
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis10_15_16"); //Ja. Er und seine "Freunde" die bei ihm waren, werden hier jedoch kein weiteres Unheil mehr anrichten.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis10_04_17"); //Da bin ich aber erleichtert. Innos möge ihrer gequälten Seelen gnädig sein ...
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis10_04_18"); //Wie dem auch sei, du hast deine Mission wie immer mehr als zufrieden stellend erfüllt.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis10_04_19"); //Wir können wirklich stolz sein, dich in den Reihen der Paladine zu wissen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	B_GivePlayerXP	(800);

	B_SetTopicStatus	(TOPIC_MOD_MILIZ_FREUNDFEIND, LOG_SUCCESS);

	Mod_Hagen_KG_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Hagen_AndreVermaechtnis11 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_AndreVermaechtnis11_Condition;
	information	= Info_Mod_Hagen_AndreVermaechtnis11_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_AndreVermaechtnis11_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_AndreVermaechtnis10))
	&& (Wld_GetDay()-3 > Mod_Hagen_KG_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_AndreVermaechtnis11_Info()
{
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_00"); //Gut, dass du da bist.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_01"); //Die letzten Ereignisse haben gezeigt, wie schnell uns auch hier die Lage entgleiten kann, wenn die Situation im Minental derart instabil ist.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_02"); //Wir bräuchten daher unbedingt jemanden, der vor Ort ein Auge darauf hat.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_03"); //Männer kann ich leider keine entbehren und ins Minental schicken, da die Situation um Khorinis schon unsere ganze Aufmerksamkeit erfordert.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis11_15_04"); //Wie ist dann vorzugehen?
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_05"); //Wir müssen Kontakt zu einem Lager im Minental aufnehmen und sie um eine engere Zusammenarbeit bitten.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis11_15_06"); //Hmm, ich vermute mal, du dachtest dabei nicht an die Banditen oder Söldner.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_07"); //Ähhm, natürlich nicht ... alles hat seine Grenzen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_08"); //Gemeint waren selbstverständlich die Königstreuen. Auf ihnen ruhen jetzt meine Hoffnungen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_09"); //Sie sind kampferprobt und befinden sich gleich am Pass.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis11_15_10"); //Aber?
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_11"); //Nun, viel mehr als eine Handelsbeziehung unterhielten wir bisher nicht zu Ihnen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_12"); //Und auch diese gründete nur auf ihrer guten Einstellung  gegenüber Andre, den sie aus früherer Zeit kannten und respektierten.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis11_15_13"); //Was ist das Problem?
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_14"); //Nun ... ich habe sie damals kurz nach dem Fall der Barriere dorthin strafversetzt.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_15"); //Dies geschah auf Befehl, wozu ich aber nicht näheres sagen darf.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_16"); //Egal ... sie sind auf jeden Fall nicht sonderlich gut auf mich zu sprechen.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_17"); //Sie berufen sich nun stets darauf, dass sie ihren Schwur dem König geleistet haben und auch nur ihm zu Treue und Gehorsam verpflichtet sind.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_18"); //Aufgrund der Situation auf dem Festland ist es aber momentan recht schwierig an Direktiven des Königs zu gelangen, wie du dir vorstellen kannst.
	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis11_15_19"); //Was ist also zu tun?
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_20"); //Du bist nicht nur Paladin und Hauptmann der Stadt, sondern kennst dich zudem besser als jeder andere von uns im Minental aus.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_21"); //Daher wirst du dich zu ihnen begeben und Hymir dieses Schreiben überbringen.

	B_GiveInvItems	(self, hero, ItWr_HagenForHymir, 1);

	AI_Output(hero, self, "Info_Mod_Hagen_AndreVermaechtnis11_15_22"); //Gut, ich mache mich auf den Weg.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_23"); //Warte! Falls er nicht darauf eingehen sollte, musst du diese Spruchrolle in ihrem Lager benutzen.

	B_GiveInvItems	(self, hero, ItSc_SumHagen, 1);

	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis11_04_24"); //Denke daran ... Innos beschütze dich.

	Log_CreateTopic	(TOPIC_MOD_MILIZ_TREUE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MILIZ_TREUE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MILIZ_TREUE, "Hagen möchte, dass ich Hymir eine Botschaft überbringe, in welcher er um eine Zusammenarbeit bittet.");
};

INSTANCE Info_Mod_Hagen_AndreVermaechtnis12 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_AndreVermaechtnis12_Condition;
	information	= Info_Mod_Hagen_AndreVermaechtnis12_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_AndreVermaechtnis12_Condition()
{
	if (Mod_Kap4_KGOrks >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_AndreVermaechtnis12_Info()
{
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis12_04_00"); //Die Situation am Pass sollte jetzt sicherer werden.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis12_04_01"); //Feinde können nun nicht mehr einfach so unentdeckt in Khorinis eindringen, was zum großen Teil dein Verdienst ist.
	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis12_04_02"); //Hier, dein Sold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Hagen_AndreVermaechtnis12_04_03"); //Innos behüte dich vor allen Gefahren.

	B_GivePlayerXP	(400);

	B_SetTopicStatus	(TOPIC_MOD_MILIZ_TREUE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Hagen_Siegelring (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_Siegelring_Condition;
	information	= Info_Mod_Hagen_Siegelring_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe diesen Ring hier.";
};

FUNC INT Info_Mod_Hagen_Siegelring_Condition()
{
	if (Npc_HasItems(hero, ItRi_Siegelring) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_Siegelring_Info()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Siegelring_15_00"); //Ich habe diesen Ring hier.

	B_GiveInvItems	(hero, self, ItRi_Siegelring, 1);

	AI_Output(self, hero, "Info_Mod_Hagen_Siegelring_04_01"); //Lass sehen ... Das ... das ist tatsächlich der geraubte Siegelring, den du mir da gebracht hast.
	AI_Output(self, hero, "Info_Mod_Hagen_Siegelring_04_02"); //Unglaublich! Ich hätte nicht erwartet ihn jemals wieder zu Gesicht zu bekommen ...
	AI_Output(self, hero, "Info_Mod_Hagen_Siegelring_04_03"); //Und was ist mit dem Frevler, der ihn raubte?
	AI_Output(hero, self, "Info_Mod_Hagen_Siegelring_15_04"); //Er wird niemanden mehr überfallen.
	AI_Output(self, hero, "Info_Mod_Hagen_Siegelring_04_05"); //So hat er also das Los bekommen, was ihm Zustand. Wie dem auch sei, dein Verdienst für die Stadt ist nicht gering zu schätzen.
	AI_Output(self, hero, "Info_Mod_Hagen_Siegelring_04_06"); //Hier hast du 1000 Gold als Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	AI_Output(self, hero, "Info_Mod_Hagen_Siegelring_04_07"); //Dein leuchtendes Beispiel soll Vorbild für alle Bürger des Reiches sein. Innos sei mit dir.

	B_GivePlayerXP	(2500);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_HEROLD_SIEGELRING, LOG_SUCCESS);
};

INSTANCE Info_Mod_Hagen_Asylanten4 (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_Asylanten4_Condition;
	information	= Info_Mod_Hagen_Asylanten4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Was hast du jetzt vor?";
};

FUNC INT Info_Mod_Hagen_Asylanten4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_Asylanten3))
	&& (Mod_Hagen_Asylanten == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hagen_Asylanten4_Info()
{
	AI_Output(hero, self, "Info_Mod_Hagen_Asylanten4_15_00"); //Was hast du jetzt vor?
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten4_04_01"); //Ich glaube, ich sollte Boten in das Minental schicken, um mit dem Neuen Lager zu einer gütlichen Einigung zu kommen.
	AI_Output(self, hero, "Info_Mod_Hagen_Asylanten4_04_02"); //Außerdem werde ich mit der Garde in Kontakt treten müssen, bevor sie dort im Auftrag des Königs Dummheiten begehen.
};

INSTANCE Info_Mod_Hagen_Pickpocket (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_Pickpocket_Condition;
	information	= Info_Mod_Hagen_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Hagen_Pickpocket_Condition()
{
	C_Beklauen	(108, ItMi_Gold, 1200);
};

FUNC VOID Info_Mod_Hagen_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hagen_Pickpocket);

	Info_AddChoice	(Info_Mod_Hagen_Pickpocket, DIALOG_BACK, Info_Mod_Hagen_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hagen_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hagen_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hagen_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hagen_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Hagen_EXIT (C_INFO)
{
	npc		= Mod_592_PAL_Hagen_NW;
	nr		= 1;
	condition	= Info_Mod_Hagen_EXIT_Condition;
	information	= Info_Mod_Hagen_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hagen_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hagen_EXIT_Info()
{
	AI_Output(self, hero, "Info_Mod_Hagen_EXIT_04_00"); //Für den König!

	AI_StopProcessInfos	(self);
};