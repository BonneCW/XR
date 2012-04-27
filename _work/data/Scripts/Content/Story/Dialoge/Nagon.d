INSTANCE Info_Mod_Nagon_Hi (C_INFO)
{
	npc		= Mod_1773_KDF_Nagon_PAT;
	nr		= 1;
	condition	= Info_Mod_Nagon_Hi_Condition;
	information	= Info_Mod_Nagon_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Nagon_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gizar_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nagon_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Nagon_Hi_10_00"); //Stör mich jetzt nicht!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Nagon_Gizar (C_INFO)
{
	npc		= Mod_1773_KDF_Nagon_PAT;
	nr		= 1;
	condition	= Info_Mod_Nagon_Gizar_Condition;
	information	= Info_Mod_Nagon_Gizar_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Nagon_Gizar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gizar_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nagon_Gizar_Info()
{
	AI_Output(self, hero, "Info_Mod_Nagon_Gizar_10_00"); //Ah, es freut mich, dich zu sehen, Bruder.
	AI_Output(hero, self, "Info_Mod_Nagon_Gizar_15_01"); //Gizar hat mich zu Euch geschickt.
	AI_Output(self, hero, "Info_Mod_Nagon_Gizar_10_02"); //Ich weiß. Pyrokar hält große Stücke auf dich. Er hat großes Vertrauen in dich! Das ist auch der Grund warum du hier bist.
	AI_Output(self, hero, "Info_Mod_Nagon_Gizar_10_03"); //Ich habe eine wichtige Aufgabe für dich. Du musst die fünf Foki, die die Schwarzmagier benutzen um die Barriere aufrecht zu halten, stehlen und zu uns bringen.
	AI_Output(hero, self, "Info_Mod_Nagon_Gizar_15_04"); //Aber... Wie soll ich das machen?
	AI_Output(self, hero, "Info_Mod_Nagon_Gizar_10_05"); //Geh im Turm ganz nach oben und frag das Orakel. Es wird dir verraten, wie du die Foki erlangen kannst.

	Log_CreateTopic	(TOPIC_MOD_FM_FOKI, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FM_FOKI, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FM_FOKI, "Nagon will, dass ich die fünf Foki stehle, die die Schwarzmagier benutzen, um die Barriere um Patherion aufrecht zu erhalten. Dazu soll ich das Orakel befragen, welches sich auf dem Turm befindet.");
};

INSTANCE Info_Mod_Nagon_HabFoki (C_INFO)
{
	npc		= Mod_1773_KdF_Nagon_PAT;
	nr		= 1;
	condition	= Info_Mod_Nagon_HabFoki_Condition;
	information	= Info_Mod_Nagon_HabFoki_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab die Foki.";
};

FUNC INT Info_Mod_Nagon_HabFoki_Condition()
{
	if (Npc_HasItems(hero, ItMi_Focus_Pat) == 5)
	&& (Mod_FM_Foki >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nagon_HabFoki_Info()
{
	AI_Output(hero, self, "Info_Mod_Nagon_HabFoki_15_00"); //Ich habe es geschafft. Ich habe die fünf Foki.
	
	B_GiveInvItems	(hero, self, ItMi_Focus_Pat, 5);

	AI_Output(self, hero, "Info_Mod_Nagon_HabFoki_10_01"); //Wahrhaftig Bruder, du hast es geschafft! Wir sind stolz auf dich! Du hast Innos einen großen Dienst erwiesen!
	AI_Output(hero, self, "Info_Mod_Nagon_HabFoki_15_02"); //Aber warum ist die Barriere noch nicht verschwunden?
	AI_Output(self, hero, "Info_Mod_Nagon_HabFoki_10_03"); //Nun, wir müssen zuerst ein Ritual durchführen. Dazu brauchen wir aber noch einen fünften Magier.
	AI_Output(self, hero, "Info_Mod_Nagon_HabFoki_10_04"); //Ich werde sie solange gut verwahren, bis wir jemanden gefunden haben, der mächtig genug ist, die Barriere mit uns zu zerstören.
	AI_Output(self, hero, "Info_Mod_Nagon_HabFoki_10_05"); //Wusstest du, dass wir die Foki geschaffen haben?
	AI_Output(hero, self, "Info_Mod_Nagon_HabFoki_15_06"); //Ihr?
	AI_Output(self, hero, "Info_Mod_Nagon_HabFoki_10_07"); //Ja. Das heißt wir vier und Ragon.
	AI_Output(hero, self, "Info_Mod_Nagon_HabFoki_15_08"); //Achso, der Gründer dieses Klosters.
	AI_Output(self, hero, "Info_Mod_Nagon_HabFoki_10_09"); //Du kennst die Geschichte?
	AI_Output(hero, self, "Info_Mod_Nagon_HabFoki_15_10"); //Ja, Pyrokar hat sie mir erzählt.
	AI_Output(self, hero, "Info_Mod_Nagon_HabFoki_10_11"); //Traurig, wenn man überlegt, dass der Gründer der gesamten Innoskirche verschollen ist.
	AI_Output(hero, self, "Info_Mod_Nagon_HabFoki_15_12"); //Ja, ich habe aber noch eine Frage: Kennst du Aaron?
	AI_Output(self, hero, "Info_Mod_Nagon_HabFoki_10_13"); //Aaron? Du meinst den neuen Magier. Ja, ich kenne ihn.
	AI_Output(self, hero, "Info_Mod_Nagon_HabFoki_10_14"); //Er hat die letzte Lieferung Tränke vorbeigebracht die Tojan wollte. Das ist noch gar nicht so lange her ...
	AI_Output(hero, self, "Info_Mod_Nagon_HabFoki_15_15"); //(überrascht) Er hat die Tränke gebracht?
	AI_Output(self, hero, "Info_Mod_Nagon_HabFoki_10_16"); //Ja, er hat sie auch gleich verteilt, genau wie du.
	AI_Output(hero, self, "Info_Mod_Nagon_HabFoki_15_17"); //Und ist da irgendwas Außergewöhnliches passiert?
	AI_Output(self, hero, "Info_Mod_Nagon_HabFoki_10_18"); //Etwas Außergewöhnliches? Wie meinst du etwas Außergewöhnliches?
	AI_Output(hero, self, "Info_Mod_Nagon_HabFoki_15_19"); //Naja, zum Beispiel, dass ein Schwarzmagier in der Festung war?
	AI_Output(self, hero, "Info_Mod_Nagon_HabFoki_10_20"); //Was? Ein Schwarzmagier? Wie kommst du denn darauf?
	AI_Output(hero, self, "Info_Mod_Nagon_HabFoki_15_21"); //Nur so 'ne Frage.
	AI_Output(self, hero, "Info_Mod_Nagon_HabFoki_10_22"); //Nein, das hätte mir Tojan unbedingt gemeldet.
	AI_Output(hero, self, "Info_Mod_Nagon_HabFoki_15_23"); //Achso, danke. Weißt du wo sich Aaron aufhält?
	AI_Output(self, hero, "Info_Mod_Nagon_HabFoki_10_24"); //Des Tags ist er immer irgendwo anders, er versucht sich überall nützlich zu machen, aber nachts ist er immer in der Kirche und betet.

	B_GivePlayerXP	(500);

	B_StartOtherRoutine	(Mod_1771_KDF_Aaron_PAT, "ARBEIT");

	B_LogEntry	(TOPIC_MOD_FM_VERRAT, "Aaron ist tagsüber nur schwer aufzufinden, da er überall aushilft, aber nachts ist er immer in der Kirche und betet. Was noch komisch war, was dass Nagon es für unmöglich hält, dass ein Schwarzmagier im Kloster ist. Es scheint fast so, als hätte Tojan ihn nicht darüber informiert.");
	B_SetTopicStatus	(TOPIC_MOD_FM_FOKI, LOG_SUCCESS);
};

INSTANCE Info_Mod_Nagon_MangelQuest (C_INFO)
{
	npc		= Mod_1773_KDF_Nagon_PAT;
	nr		= 1;
	condition	= Info_Mod_Nagon_MangelQuest_Condition;
	information	= Info_Mod_Nagon_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was trübt dein Gemüt, Bruder?";
};

FUNC INT Info_Mod_Nagon_MangelQuest_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nagon_MangelQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Nagon_MangelQuest_15_00"); //Was trübt dein Gemüt, Bruder?
	AI_Output(self, hero, "Info_Mod_Nagon_MangelQuest_10_01"); //Ach ... entschuldige meinen Tonfall ... aber sieh dich doch nur mal hier um!
	AI_Output(hero, self, "Info_Mod_Nagon_MangelQuest_15_02"); //(schaut sich um) Hmm, ich sehe nichts ...
	AI_Output(self, hero, "Info_Mod_Nagon_MangelQuest_10_03"); //Eben! Dies ist die Kirche Patherions, einer der wichtigsten religiösen Orte unseres Gemeinschaft Innos’ ... und wer ist hier? Fast niemand!
	AI_Output(hero, self, "Info_Mod_Nagon_MangelQuest_15_04"); //Es herrscht aber nun mal leider Belagerung, und die Priester und Streiter Innos’ müssen ...
	AI_Output(self, hero, "Info_Mod_Nagon_MangelQuest_10_05"); //(unterbricht) Ja, diese Stätte verteidigen.
	AI_Output(self, hero, "Info_Mod_Nagon_MangelQuest_10_06"); //Aber welchen Wert hat es denn überhaupt noch, wenn keiner das Gebet zu Innos’ spricht und die religiösen Traditionen pflegt, die doch unseren Glauben als solchen definieren.
	AI_Output(self, hero, "Info_Mod_Nagon_MangelQuest_10_07"); //Dieser Konflikt hat uns viele Opfer abverlangt ... aber der größte Preis, den wir dafür zahlen, ist unsere Verbindung zu Innos.
	AI_Output(self, hero, "Info_Mod_Nagon_MangelQuest_10_08"); //Wenn nicht mal mehr an diesem heiligen Ort jemand die Beziehung zu Innos pflegt, ja, dann haben wir den Krieg quasi schon verloren.

	B_StartMangel();

	B_LogEntry	(TOPIC_MOD_FM_MANGEL, "Nagon beklagte sich darüber, dass niemand mehr in die Kapelle beten kommt.");
};

INSTANCE Info_Mod_Nagon_MangelQuest2 (C_INFO)
{
	npc		= Mod_1773_KDF_Nagon_PAT;
	nr		= 1;
	condition	= Info_Mod_Nagon_MangelQuest2_Condition;
	information	= Info_Mod_Nagon_MangelQuest2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Nagon_MangelQuest2_Condition()
{
	if (Mod_Pat_Beter >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nagon_MangelQuest2_Info()
{
	AI_Output(self, hero, "Info_Mod_Nagon_MangelQuest2_10_00"); //(enthusiastischer) Sei gegrüßt, Bruder. Kaum, dass wir uns unterhalten hatten, fanden sich rasch mehrere Jünger zum Gebet ein.
	AI_Output(self, hero, "Info_Mod_Nagon_MangelQuest2_10_01"); //Diesem Ort des Glaubens wird nun wieder die Aufmerksamkeit zu Teil, wie es sein sollte ... und ich bezweifle mal, dass es Zufall ist.
	AI_Output(self, hero, "Info_Mod_Nagon_MangelQuest2_10_02"); //Dein Einsatz für unseren Glauben zeigt, dass du ein wahrer Diener unseres Herrn bist.
	AI_Output(self, hero, "Info_Mod_Nagon_MangelQuest2_10_03"); //So gehe denn mit Innos' Segen und helfe auch weiterhin die Welt nach seinem Willen zu gestalten.

	B_BlessAttribute	(hero, ATR_MANA_MAX, 3);

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_FM_MANGEL, "Nagon war erfreut über die Gläubigen in der Kirche.");

	B_StopMangel();
};

var int Nagon_LastPetzCounter;
var int Nagon_LastPetzCrime;

INSTANCE Info_Mod_Nagon_PMSchulden (C_INFO)
{
	npc         	= Mod_1773_KDF_Nagon_PAT;
	nr          	= 1;
	condition   	= Info_Mod_Nagon_PMSchulden_Condition;
	information 	= Info_Mod_Nagon_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Nagon_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Nagon_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Nagon_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Nagon_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_00"); //Bist du gekommen, um deine Strafe zu zahlen?

	if (B_GetTotalPetzCounter(self) > Nagon_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_01"); //Ich hatte mich schon gefragt, ob du es überhaupt noch wagst, hierher zu kommen!
		AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_02"); //Anscheinend ist es nicht bei den letzten Anschuldigungen geblieben!

		if (Nagon_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_03"); //Ich hatte dich gewarnt! Die Strafe, die du jetzt zahlen musst, ist höher!
			AI_Output (hero, self, "Info_Mod_Nagon_PMAdd_15_00"); //Wieviel?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Nagon_LastPetzCounter);
		
			if (diff > 0)
			{
				Nagon_Schulden = Nagon_Schulden + (diff * 50);
			};
		
			if (Nagon_Schulden > 1000)	{	Nagon_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Nagon_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_04"); //Du hast mich schwer enttäuscht!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Nagon_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_05"); //Es haben sich einige neue Dinge ergeben.
		
		if (Nagon_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_06"); //Plötzlich gibt es niemanden mehr, der dich des Mordes bezichtigt.
		};
		
		if (Nagon_LastPetzCrime == CRIME_THEFT)
		|| ( (Nagon_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_07"); //Niemand erinnert sich mehr, dich bei einem Diebstahl gesehen zu haben.
		};
		
		if (Nagon_LastPetzCrime == CRIME_ATTACK)
		|| ( (Nagon_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_08"); //Es gibt keine Zeugen mehr dafür, dass du jemals in eine Schlägerei verwickelt warst.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_09"); //Anscheinend haben sich alle Anklagen gegen dich in Wohlgefallen aufgelöst.
		};
		
		AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_10"); //Ich weiß nicht, was da gelaufen ist, aber ich warne dich: Spiel keine Spielchen mit mir.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_11"); //Ich habe mich jedenfalls entschieden, dir deine Schulden zu erlassen.
			AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_12"); //Sieh zu, dass du nicht wieder in Schwierigkeiten kommst.
	
			Nagon_Schulden			= 0;
			Nagon_LastPetzCounter 	= 0;
			Nagon_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_13"); //Damit eins klar ist: Deine Strafe musst du trotzdem in voller Höhe zahlen.
			B_Say_Gold (self, hero, Nagon_Schulden);
			AI_Output (self, hero, "Info_Mod_Nagon_PMSchulden_10_14"); //Also, was ist?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Nagon_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Nagon_PETZMASTER);
		Info_AddChoice		(Info_Mod_Nagon_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Nagon_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Nagon_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Nagon_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Nagon_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Nagon_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Nagon_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Nagon_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Nagon_PMSchulden_HowMuchAgain_15_00"); //Wie viel war es noch mal?
	B_Say_Gold (self, hero, Nagon_Schulden);

	Info_ClearChoices  	(Info_Mod_Nagon_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Nagon_PETZMASTER);
	Info_AddChoice		(Info_Mod_Nagon_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Nagon_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Nagon_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Nagon_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Nagon_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Nagon_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Nagon_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Nagon_PETZMASTER   (C_INFO)
{
	npc         	= Mod_1773_KDF_Nagon_PAT;
	nr          	= 1;
	condition   	= Info_Mod_Nagon_PETZMASTER_Condition;
	information 	= Info_Mod_Nagon_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Nagon_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Nagon_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Nagon_PETZMASTER_Info()
{
	Nagon_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Nagon noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_00"); //Du musst der Neue sein, der hier im Kloster Ärger gemacht hat.
	};	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_01"); //Gut, dass du zu mir kommst, bevor alles noch schlimmer für dich wird.
		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_02"); //Mord ist ein schweres Vergehen!

		Nagon_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Nagon_Schulden = Nagon_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_03"); //Ganz zu schweigen von den anderen Sachen, die du angerichtet hast.
		};

		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_04"); //Die meisten Magier und Paladine werden einen Mörder im Kloster nicht dulden!
		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_06"); //Ich habe kein Interesse daran, dich an den Galgen zu bringen.
		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_07"); //Aber es wird nicht leicht sein, die Leute wieder gnädig zu stimmen.
		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_08"); //Du könntest deine Reue zeigen, indem du eine Strafe zahlst - natürlich muss die Strafe angemessen hoch sein.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_09"); //Gut, dass du kommst! Du wirst des Diebstahls bezichtigt! Es gibt Zeugen!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_10"); //Von den anderen Dingen, die mir zu Ohren gekommen sind, will ich gar nicht erst reden.
		};

		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_11"); //Ich werde so ein Verhalten im Kloster nicht dulden!
		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_12"); //Du wirst eine Strafe zahlen müssen, um dein Verbrechen wieder gutzumachen!
		
		Nagon_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_13"); //Wenn du dich mit den Schwarzmagiern anlegst, geht uns das nichts an.
		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_14"); //Aber wenn du Magier oder Paladine angreifst, muss ich dich zur Rechenschaft ziehen.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_15"); //Und die Sache mit den Schafen musste wohl auch nicht sein.
		};

		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_16"); //Wenn ich dir das durchgehen lasse, macht hier bald jeder, was er will.
		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_17"); //Also wirst du eine angemessene Strafe zahlen - und die Sache ist vergessen.
		
		Nagon_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_18"); //Mir ist zu Ohren gekommen, du hättest dich an unseren Schafen vergriffen.
		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_19"); //Dir ist klar, dass ich das nicht durchgehen lassen kann.
		AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_10_20"); //Du wirst eine Entschädigung zahlen müssen!
		
		Nagon_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Nagon_PETZMASTER_15_21"); //Wie viel?
	
	if (Nagon_Schulden > 1000)	{	Nagon_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Nagon_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Nagon_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Nagon_PETZMASTER);
	Info_AddChoice		(Info_Mod_Nagon_PETZMASTER,"Ich habe nicht genug Gold!",Info_Mod_Nagon_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Nagon_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Nagon_PETZMASTER,"Ich will die Strafe zahlen.",Info_Mod_Nagon_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Nagon_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Nagon_PETZMASTER_PayNow_15_00"); //Ich will die Strafe zahlen!
	B_GiveInvItems (hero, self, itmi_gold, Nagon_Schulden);
	AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_PayNow_10_01"); //Gut! Ich werde dafür sorgen, dass es jeder im Kloster erfährt - damit wäre dein Ruf einigermaßen wiederhergestellt.

	B_GrantAbsolution (LOC_PATHERION);
	
	Nagon_Schulden			= 0;
	Nagon_LastPetzCounter 	= 0;
	Nagon_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Nagon_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Nagon_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Nagon_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Nagon_PETZMASTER_PayLater_15_00"); //Ich habe nicht genug Gold!
	AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_PayLater_10_01"); //Dann sieh zu, dass du das Gold so schnell wie möglich beschaffst.
	AI_Output (self, hero, "Info_Mod_Nagon_PETZMASTER_PayLater_10_02"); //Und ich warne dich: Wenn du dir noch was zu schulden kommen lässt, wird die Sache noch schlimmer für dich!
	
	Nagon_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Nagon_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Nagon_EXIT (C_INFO)
{
	npc		= Mod_1773_KDF_Nagon_PAT;
	nr		= 1;
	condition	= Info_Mod_Nagon_EXIT_Condition;
	information	= Info_Mod_Nagon_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Nagon_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nagon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};