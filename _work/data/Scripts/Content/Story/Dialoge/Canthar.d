INSTANCE Info_Mod_Canthar_Port (C_INFO)
{
	npc		= Mod_548_NONE_Canthar_NW;
	nr		= 1;
	condition	= Info_Mod_Canthar_Port_Condition;
	information	= Info_Mod_Canthar_Port_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Canthar_Port_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Flora))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Canthar_Port_Info()
{
	AI_Output(self, hero, "Info_Mod_Canthar_Port_09_00"); //Da bist du nun also. Ich hatte schon fast erwartet, dass du den Anschlag überlebst.
	AI_Output(self, hero, "Info_Mod_Canthar_Port_09_01"); //Und nun bist du gekommen, um mich zur Rechenschaft zu ziehen. Tja, das wird dir leider nicht gelingen.
	AI_Output(self, hero, "Info_Mod_Canthar_Port_09_02"); //Aber dein Geschick hat mich erstaunt. Du hast ganze Arbeit geleistet. Zur Sicherheit werde ich mich jetzt für einige Zeit zurückziehen, um Gras über die Sache wachsen zu lassen.
	AI_Output(self, hero, "Info_Mod_Canthar_Port_09_03"); //Du kannst dir sicher sein, dass ich jeden deiner Schritte überwache, so wie ich es gemacht habe, seit du den Koffer hast. Ach ja, wenn du nichts dagegen hast, nehme ich dir das gute Stück ab. Du weißt ja gar nicht, was die Bilder dort drin für einen Wert haben.

	if (Npc_HasItems(hero, ItMi_PortsKoffer) == 1)
	{
		Npc_RemoveInvItems	(hero, ItMi_PortsKoffer, 1);
	}
	else
	{
		Wld_RemoveItem	(ItMi_PortsKoffer);

		AI_Output(self, hero, "Info_Mod_Canthar_Port_09_04"); //Wie ich sehe, versuchst du, das Ding zu verstecken. Dann werde ich eben einen meiner Gehilfen beauftragen müssen, danach zu suchen.
	};

	AI_Output(self, hero, "Info_Mod_Canthar_Port_09_05"); //Fast hätte der gute Brahim vereitelt, dass ich den Koffer bekomme, indem er dich zu dem vertrottelten Händler schickte. Dadurch ist es eigentlich seine Schuld, dass er sterben musste. (lacht)
	AI_Output(self, hero, "Info_Mod_Canthar_Port_09_06"); //Ich habe sowieso das Gefühl, dass er immer gerade so viel gegen mich gearbeitet hat, dass ich nichts davon mitbekommen habe. Aber er wird seine Bestrafung noch früh genug erleben.
	AI_Output(self, hero, "Info_Mod_Canthar_Port_09_07"); //So, ich habe jetzt genug geredet. Wenn der Tag gekommen ist, werde ich zurückkehren und dich langsam auseinandernehmen.
	AI_Output(self, hero, "Info_Mod_Canthar_Port_09_08"); //Frag' Moe, er wird davon erfahren, dass ich zurück bin.
	
	Log_CreateTopic	(TOPIC_MOD_CANTHAR_GESCHAEFTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_CANTHAR_GESCHAEFTE, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_MOE_PORT, TOPIC_MOD_CANTHAR_GESCHAEFTE, "Canthar ist der Drahtzieher. Er hat die Ermordung Ports und Kunos veranlasst. Als ich ihn aufsuchte, entwendete er mir den Koffer und kündigte an, sich vorerst zurückzuziehen, irgendwann jedoch wieder zu kommen. Moe werde davon erfahren.", "Ich habe eines von Canthar' Geschäften gestört und stehe seitdem in seinem Blickfeld. Er hat angekündigt, mich nach seiner Rückkehr 'auseinanderzunehmen'. Mal sehen, was sich daraus entwickelt ...");
	B_SetTopicStatus	(TOPIC_MOD_MOE_PORT, LOG_SUCCESS);

	B_GivePlayerXP	(300);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FLEEING");

	CurrentNQ += 1;
};

var int OptionenCanthar;

INSTANCE Info_Mod_Canthar_AtLager (C_INFO)
{
	npc		= Mod_548_NONE_Canthar_NW;
	nr		= 1;
	condition	= Info_Mod_Canthar_AtLager_Condition;
	information	= Info_Mod_Canthar_AtLager_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Canthar_AtLager_Condition()
{
	if (Mod_CantharQuest_Last == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Canthar_AtLager_Info()
{
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager_09_00"); //Wieder auf den Beinen? Genieß es, denn es wird das letzte Mal sein.

	B_LogEntry	(TOPIC_MOD_MOE_DEAD, "Ich bin in Canthar's Falle getappt. Aber so ungelegen kommt mir das gar nicht. Immerhin bin ich jetzt da, wo ich hin wollte: in der Höhle des Löwen.");

	Info_ClearChoices	(Info_Mod_Canthar_AtLager);

	Info_AddChoice	(Info_Mod_Canthar_AtLager, "Komm her, du Schwein!", Info_Mod_Canthar_AtLager_D);
	Info_AddChoice	(Info_Mod_Canthar_AtLager, "Wieso musste Moe sterben?", Info_Mod_Canthar_AtLager_C);
	Info_AddChoice	(Info_Mod_Canthar_AtLager, "Was hast du mit meiner Ausrüstung gemacht?", Info_Mod_Canthar_AtLager_B);
	Info_AddChoice	(Info_Mod_Canthar_AtLager, "Warum hast du mich nicht schon lange umgebracht?", Info_Mod_Canthar_AtLager_A);
};

FUNC VOID Info_Mod_Canthar_AtLager_E()
{
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager_E_09_00"); //Ich muss gestehen, ich habe genug von deinen langweiligen Fragen.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager_E_09_01"); //Mir juckt es unter den Fingern, dich sterben zu sehen. Also, stell dich dem Kampf!
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager_E_15_02"); //Was hält mich davon ab, wegzurennen?
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager_E_09_03"); //Was?! Das wird dir nicht gelingen!

	Info_ClearChoices	(Info_Mod_Canthar_AtLager);

	AI_StopProcessInfos	(self);

	//B_Attack	(self, hero, AR_None, 0);

	Mod_CantharQuest_Last = 6;
};

FUNC VOID Info_Mod_Canthar_AtLager_D()
{
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager_D_15_00"); //Komm her, du Schwein!
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager_D_09_01"); //Na, na, jetzt fang nicht mit den Beleidigungen an.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager_D_09_02"); //Aber schön zu sehen, wie einfach du zu provozieren bist. Das wird den Kampf noch genüsslicher machen.
};

FUNC VOID Info_Mod_Canthar_AtLager_C()
{
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager_C_15_00"); //Wieso musste Moe sterben?
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager_C_09_01"); //(spöttisch) Das verstehst du nicht, was? Ist auch ein bisschen schwierig.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager_C_09_02"); //Aber es hatte damit zu tun, dass er dir geholfen hat.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager_C_09_03"); //Hätte er nach meiner ersten Warnung damit aufgehört, wäre er wenigstens schnell gestorben ...

	OptionenCanthar += 1;

	if (OptionenCanthar == 3)
	{
		Info_Mod_Canthar_AtLager_E();
	};
};

FUNC VOID Info_Mod_Canthar_AtLager_B()
{
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager_B_15_00"); //Was hast du mit meiner Ausrüstung gemacht?
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager_B_09_01"); //Oh, die ist an einem sicheren Ort am anderen Ende unseres Verstecks verstaut.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager_B_09_02"); //Aber du wirst sie kaum noch brauchen. (lacht)

	B_LogEntry	(TOPIC_MOD_MOE_DEAD, "Laut Canthar ist meine Ausrüstung irgendwo in diesem Unterschlupf versteckt. Ich sollte sie wohl besser finden, bevor ich mich ihm stelle.");

	OptionenCanthar += 1;

	if (OptionenCanthar == 3)
	{
		Info_Mod_Canthar_AtLager_E();
	};

};

FUNC VOID Info_Mod_Canthar_AtLager_A()
{
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager_A_15_00"); //Warum hast du mich nicht schon lange umgebracht?
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager_A_09_01"); //(hasserfüllt) Weißt du, was du mir angetan hast?
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager_A_09_02"); //Nein, du wirst durch meine eigene Hand zugrunde gehen!

	OptionenCanthar += 1;

	if (OptionenCanthar == 3)
	{
		Info_Mod_Canthar_AtLager_E();
	};
};

var int OptionenCanthar2;

INSTANCE Info_Mod_Canthar_AtLager2 (C_INFO)
{
	npc		= Mod_548_NONE_Canthar_NW;
	nr		= 1;
	condition	= Info_Mod_Canthar_AtLager2_Condition;
	information	= Info_Mod_Canthar_AtLager2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Canthar_AtLager2_Condition()
{
	if (Mod_CantharQuest_Last == 7)
	&& (Npc_IsDead(Mod_7211_NONE_Schlaeger_NW))
	&& (Npc_IsDead(Mod_7212_NONE_Schlaeger_NW))
	&& (Npc_IsDead(Mod_7213_NONE_Schlaeger_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Canthar_AtLager2_Info()
{
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_09_00"); //(gehässig) Du meinst jetzt vielleicht, am Ende angelangt zu sein.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_09_01"); //Nur ich stehe noch zwischen dir und deinem unendlichen Ruhm. Doch sei dir sicher, dem ist nicht so!
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_15_02"); //Was willst du mir damit sagen?
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_09_03"); //Nichts, was du verstehen könntest. Aber merk dir meine Worte, du wirst dich noch an sie erinnern!
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_15_04"); //Mal langsam. Jetzt erzählst du mir erstmal, was das ganze mit diesen Gaunereien sollte.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_09_05"); //Warum mir mein Verdienst in der Diebegilde nicht ausreichte und ich mir eine zweite Existenz aufbaute?
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_09_06"); //Die Diebesgilde hätte zum Überleben gereicht, aber nicht zum Leben.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_09_07"); //Bei Beliar, soll ich etwa den ganzen Tag lang Sextanten sammeln und alte Furzer um ihre Geldbeutel erleichtern?
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_09_08"); //Wo bleibt da die Herausforderung, der Nervenkitzel?
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_09_09"); //Wir sind uns gar nicht so unähnlich, du und ich.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_09_10"); //Wenn du mal genau drüber nachdenkst, wirst du auch drauf kommen.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_09_11"); //Bloß hast du meinen Sohn umgebracht und meine Geschäfte platzen lassen.
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_15_12"); //Da wollen wir Moe und die anderen Toten auf deinem Gewissen mal nicht unterschlagen.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_09_13"); //Du wagst es, diese Nichtsnutze mit meinem Sohn zu vergleichen?

	B_LogEntry	(TOPIC_MOD_MOE_DEAD, "Canthar meinte in unserem letzten Gespräch, dass er nicht die letzte Instanz auf meinem Weg zum Erfolg sei. Was hat er damit wohl gemeint?");

	Info_ClearChoices	(Info_Mod_Canthar_AtLager2);

	Info_AddChoice	(Info_Mod_Canthar_AtLager2, "Der Blutzoll war auf allen Seiten zu hoch.", Info_Mod_Canthar_AtLager2_C);
	Info_AddChoice	(Info_Mod_Canthar_AtLager2, "Als wäre aus dem Sohn was Besseres als sein Vater geworden!", Info_Mod_Canthar_AtLager2_B);
	Info_AddChoice	(Info_Mod_Canthar_AtLager2, "Jeder Mensch hat den gleichen Wert.", Info_Mod_Canthar_AtLager2_A);
};

FUNC VOID Info_Mod_Canthar_AtLager2_D()
{
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_D_09_00"); //Nun kommt es also zum unausweichlichen Kampf. Unausweichlich?
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_D_15_01"); //Du wirst in dem Duell keine Chancen haben.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_D_09_02"); //Kannst du mir auch etwas sagen, was ich noch nicht weiß?

	Info_ClearChoices	(Info_Mod_Canthar_AtLager2);

	Info_AddChoice	(Info_Mod_Canthar_AtLager2, "Lass uns endlich einen Schlusspunkt setzen!", Info_Mod_Canthar_AtLager2_F);

	if (OptionenCanthar2 == 1)
	{
		Info_AddChoice	(Info_Mod_Canthar_AtLager2, "Ich verzeihe dir.", Info_Mod_Canthar_AtLager2_E);
	};
};

FUNC VOID Info_Mod_Canthar_AtLager2_C()
{
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_C_15_00"); //Der Blutzoll war auf allen Seiten zu hoch.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_C_09_01"); //(verächtlich) Da hast du Recht. (rhetorisch) Aber was sollen wir daran jetzt ändern?

	OptionenCanthar2 = 1;

	Info_Mod_Canthar_AtLager2_D();
};

FUNC VOID Info_Mod_Canthar_AtLager2_B()
{
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_B_15_00"); //Als wäre aus dem Sohn was Besseres als sein Vater geworden!
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_B_09_01"); //(Totenstille)

	Info_Mod_Canthar_AtLager2_D();

};

FUNC VOID Info_Mod_Canthar_AtLager2_A()
{
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_A_15_00"); //Jeder Mensch hat den gleichen Wert.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_A_09_01"); //Spar dir dein Gesülze, du befolgst es ja selbst nicht. Wie viele sind gestorben durch deine Einwirkung?
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_A_09_02"); //Denk darüber nach, bevor du mir mit Moralpredigten kommst!

	Info_Mod_Canthar_AtLager2_D();
};

FUNC VOID Info_Mod_Canthar_AtLager2_F()
{
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_F_15_00"); //Lass uns endlich einen Schlusspunkt setzen!
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_F_09_01"); //Ja, aber anders als geplant. (Pause) Ich habe mich entschlossen, mich dir nicht zu stellen.
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_F_15_02"); //Was hast du vor?

	Mod_CantharSelbstmord = 1;

	Info_ClearChoices	(Info_Mod_Canthar_AtLager2);

	AI_StopProcessInfos	(self);

	B_GivePlayerXP	(400);

	B_LogEntry	(TOPIC_MOD_MOE_DEAD, "Canthar ist tot. Hoffentlich habe ich jetzt den ganzen Ärger vom Hals.");
};

FUNC VOID Info_Mod_Canthar_AtLager2_E()
{
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_E_15_00"); //Ich verzeihe dir.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_E_09_01"); //Wie? Was? Nein, aber ...
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_E_15_02"); //Du bist ein dreckiges Molerat, aber ich will nicht auch dich noch umlegen.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_E_09_03"); //Soll ich dich angreifen? Es wäre mein Untergang.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_E_09_04"); //Kann ich mit der Schmach leben, die du mir bereiten willst? Ich wäre auf ewig unglücklich.
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_E_15_05"); //Fang ein neues Leben an. Weit weg von hier.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_E_09_06"); //Dazu soll ich fähig sein? Obwohl ... vielleicht sind dort die Bedingungen besser.
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_E_15_07"); //Welche Bedingungen?
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_E_09_08"); //Was würde ich dort wohl machen? Eine geregelte Existenz leben? Pah!
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_E_09_09"); //(atmet tief durch) Na gut, ich nehme dein edles Friedensangebot an.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_E_09_10"); //Du musst aber wissen, dass ich nicht das höchste Tier in unserer Organisation bin.
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_E_15_11"); //Wer ist es dann?
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_E_09_12"); //Das weiß ich nicht. Ich kenne meinen Auftraggeber nicht.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_E_09_13"); //Wir haben uns immer in der Dunkelheit im Lagerhaus am Hafen getroffen.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_E_09_14"); //Aber wenn du nach Khorinis zurückkehrst, wirst du noch Bekanntschaft mit ihm machen, da bin ich mir sicher.
	AI_Output(hero, self, "Info_Mod_Canthar_AtLager2_E_15_15"); //Danke für die Information. Mach's gut.
	AI_Output(self, hero, "Info_Mod_Canthar_AtLager2_E_09_16"); //Du bist vernünftiger als ich dachte. Hier hast du noch den Schlüssel für die Tür nach draußen.

	B_GiveInvItems	(self, hero, ItKe_Canthar, 1);

	Info_ClearChoices	(Info_Mod_Canthar_AtLager2);

	AI_StopProcessInfos	(self);

	B_GivePlayerXP	(500);

	B_LogEntry	(TOPIC_MOD_MOE_DEAD, "Ich habe Canthar leben lassen. Als Dank hat er mir verraten, dass ich bei meiner Wiederkehr in Khorinis noch Bekanntschaft mit einem Unbekannten machen werde, der Auftraggeber von Canthar war.");
};

INSTANCE Info_Mod_Canthar_Pickpocket (C_INFO)
{
	npc		= Mod_548_NONE_Canthar_NW;
	nr		= 1;
	condition	= Info_Mod_Canthar_Pickpocket_Condition;
	information	= Info_Mod_Canthar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Canthar_Pickpocket_Condition()
{
	C_Beklauen	(99, ItMi_Gold, 2500);
};

FUNC VOID Info_Mod_Canthar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Canthar_Pickpocket);

	Info_AddChoice	(Info_Mod_Canthar_Pickpocket, DIALOG_BACK, Info_Mod_Canthar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Canthar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Canthar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Canthar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Canthar_Pickpocket);
};

FUNC VOID Info_Mod_Canthar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Canthar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Canthar_Pickpocket);

		Info_AddChoice	(Info_Mod_Canthar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Canthar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Canthar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Canthar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Canthar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Canthar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Canthar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Canthar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Canthar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Canthar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Canthar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Canthar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Canthar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Canthar_EXIT (C_INFO)
{
	npc		= Mod_548_NONE_Canthar_NW;
	nr		= 1;
	condition	= Info_Mod_Canthar_EXIT_Condition;
	information	= Info_Mod_Canthar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Canthar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Canthar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};