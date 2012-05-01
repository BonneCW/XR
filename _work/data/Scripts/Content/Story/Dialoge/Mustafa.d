INSTANCE Info_Mod_Mustafa_Hi (C_INFO)
{
	npc		= Mod_7146_ASS_Mustafa_NW;
	nr		= 1;
	condition	= Info_Mod_Mustafa_Hi_Condition;
	information	= Info_Mod_Mustafa_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, der Blutkelch.";
};

FUNC INT Info_Mod_Mustafa_Hi_Condition()
{
	if (Npc_HasItems(hero, ItMi_Bloodcup_Richter) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mustafa_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Mustafa_Hi_15_00"); //Hier, der Blutkelch.
	AI_Output(self, hero, "Info_Mod_Mustafa_Hi_13_01"); //Hervorragend. Gib ihn Na'im.
};

INSTANCE Info_Mod_Mustafa_PosWechsel (C_INFO)
{
	npc		= Mod_7146_ASS_Mustafa_NW;
	nr		= 1;
	condition	= Info_Mod_Mustafa_PosWechsel_Condition;
	information	= Info_Mod_Mustafa_PosWechsel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tag, Hoher Rat. Du willst mich sprechen.";
};

FUNC INT Info_Mod_Mustafa_PosWechsel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Zahit_PosWechsel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mustafa_PosWechsel_Info()
{
	AI_Output(hero, self, "Info_Mod_Mustafa_PosWechsel_15_00"); //Tag, Hoher Rat. Du willst mich sprechen.
	AI_Output(self, hero, "Info_Mod_Mustafa_PosWechsel_13_01"); //Es geht das Gerücht über den dritten Blutkelch um. Einer der Händler soll ihn angeboten haben.
	AI_Output(hero, self, "Info_Mod_Mustafa_PosWechsel_15_02"); //Nun, es gibt viele Händler. Wer genau hat den Blutkelch?
	AI_Output(self, hero, "Info_Mod_Mustafa_PosWechsel_13_03"); //Was weiß ich. Finde den Kelch und bringe ihn uns. Und vergiss nicht, dass der Besitzer sterben muss.
	AI_Output(hero, self, "Info_Mod_Mustafa_PosWechsel_15_04"); //Immer zu Diensten, Hoher Rat.
	AI_Output(self, hero, "Info_Mod_Mustafa_PosWechsel_13_05"); //Dann spute dich.

	Log_CreateTopic	(TOPIC_MOD_ASS_LASTBLUTKELCH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_LASTBLUTKELCH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Einer der Händler soll einen 3. Blutkelch haben. Den muss ich besorgen und zu Mustafa bringen. Vielleicht werde ich in der Stadt fündig. Am Besten beim Marktplatz anfangen ...");
};

INSTANCE Info_Mod_Mustafa_Blutkelch (C_INFO)
{
	npc		= Mod_7146_ASS_Mustafa_NW;
	nr		= 1;
	condition	= Info_Mod_Mustafa_Blutkelch_Condition;
	information	= Info_Mod_Mustafa_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tag, hoher Rat. Hast du den dritten Blutkelch schon bekommen?";
};

FUNC INT Info_Mod_Mustafa_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Azhar_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mustafa_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Mustafa_Blutkelch_15_00"); //Tag, hoher Rat. Hast du den dritten Blutkelch schon bekommen?
	AI_Output(self, hero, "Info_Mod_Mustafa_Blutkelch_13_01"); //Nein. Aber ich warte dringend darauf. Warum fragst du?
	AI_Output(hero, self, "Info_Mod_Mustafa_Blutkelch_15_02"); //Bis jetzt ist mir nicht gelungen, den Kelch ausfindig zu machen.
	AI_Output(hero, self, "Info_Mod_Mustafa_Blutkelch_15_03"); //Darf ich dich was fragen?
	AI_Output(self, hero, "Info_Mod_Mustafa_Blutkelch_13_04"); //Gewiss.
	AI_Output(hero, self, "Info_Mod_Mustafa_Blutkelch_15_05"); //Wofür sind diese drei Kelche gut?
	AI_Output(self, hero, "Info_Mod_Mustafa_Blutkelch_13_06"); //Das erfähst du, wenn wir alle beisammen haben.
	AI_Output(self, hero, "Info_Mod_Mustafa_Blutkelch_13_07"); //Was ist eigentlich mit dem Zeremoniendolch, den du besorgen sollst?
	AI_Output(hero, self, "Info_Mod_Mustafa_Blutkelch_15_08"); //Das ist auch in Arbeit. Ich hab rausgefunden, dass der Dolch ingendwo in Jharkendar ist. Weiß nur noch nicht, wo.
	AI_Output(self, hero, "Info_Mod_Mustafa_Blutkelch_13_09"); //Jharkendar? Wo ist das?
	AI_Output(hero, self, "Info_Mod_Mustafa_Blutkelch_15_10"); //Eine entfernte Gegend auf der Insel, die nur mit einem Boot oder dem Portal der Wassermagier zu erreichen ist.
	AI_Output(self, hero, "Info_Mod_Mustafa_Blutkelch_13_11"); //Interessant. Davon musst du mir später mehr erzählen. Nun erledige erst mal deine Aufträge.
	AI_Output(self, hero, "Info_Mod_Mustafa_Blutkelch_13_12"); //Wobei mir der Dolch wichtiger ist. Bring ihn mir und dir ist die Ernennung zum Krieger sicher.
	AI_Output(hero, self, "Info_Mod_Mustafa_Blutkelch_15_13"); //Ich bemühe mich, hoher Rat.

	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Der Blutkelch ist verschwunden. Da scheint jemand sein eigenes Süppchen zu kochen. Wird nicht einfach sein, rauszufinden, was da läuft.");
};

INSTANCE Info_Mod_Mustafa_Zeremoniendolch (C_INFO)
{
	npc		= Mod_7146_ASS_Mustafa_NW;
	nr		= 1;
	condition	= Info_Mod_Mustafa_Zeremoniendolch_Condition;
	information	= Info_Mod_Mustafa_Zeremoniendolch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mustafa_Zeremoniendolch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Amir_Zeremoniendolch3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mustafa_Zeremoniendolch_Info()
{
	AI_Output(self, hero, "Info_Mod_Mustafa_Zeremoniendolch_13_00"); //Da bist du ja. Hast du ... Komm ein wenig zur Seite.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATKAMAL");
	B_StartOtherRoutine	(Mod_7163_ASS_Kamal_NW, "PLAUDERN");
};

INSTANCE Info_Mod_Mustafa_Zeremoniendolch2 (C_INFO)
{
	npc		= Mod_7146_ASS_Mustafa_NW;
	nr		= 1;
	condition	= Info_Mod_Mustafa_Zeremoniendolch2_Condition;
	information	= Info_Mod_Mustafa_Zeremoniendolch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mustafa_Zeremoniendolch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_Zeremoniendolch))
	&& (Npc_GetDistToWP(self, "WP_ASSASSINE_53") < 250)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mustafa_Zeremoniendolch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Mustafa_Zeremoniendolch2_13_00"); //Hast du den Zeremoniendolch?
	AI_Output(hero, self, "Info_Mod_Mustafa_Zeremoniendolch2_15_01"); //Es war schwierig, aber ich habe ihn.
	AI_Output(self, hero, "Info_Mod_Mustafa_Zeremoniendolch2_13_02"); //Zeig her.

	B_GiveInvItems	(hero, self, ItMw_Avaquar, 1);

	AI_UnequipWeapons	(self);

	Npc_RemoveInvItems	(self, ItMw_Katana, 1);

	AI_EquipBestMeleeWeapon	(self);

	AI_ReadyMeleeWeapon	(self);

	AI_PlayAni	(self, "T_1HINSPECT");

	AI_Output(self, hero, "Info_Mod_Mustafa_Zeremoniendolch2_13_03"); //Das scheint er tatsächlich zu sein, das ist schon mal gut. Pass auf, du behältst den Dolch erst mal.

	AI_UnequipWeapons	(self);

	B_GiveInvItems	(self, hero, ItMw_Avaquar, 1);

	CreateInvItems	(self, ItMw_Katana, 1);

	AI_EquipBestMeleeWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Mustafa_Zeremoniendolch2_13_04"); //Wirst ihn wahrscheinlich noch brauchen. Aber zu niemanden ein Wort darüber!
	AI_Output(hero, self, "Info_Mod_Mustafa_Zeremoniendolch2_15_05"); //Verstanden. Du wolltest mich zum Krieger ernennen.
	AI_Output(self, hero, "Info_Mod_Mustafa_Zeremoniendolch2_13_06"); //Das stimmt. Hiermit ernenne ich dich zum Assassinenkrieger und überreiche dir die Kriegerausrüstung.

	CreateInvItems	(hero, ItAr_Assassine_01, 1);

	B_ShowGivenThings	("Assassinenrüstung erhalten");

	AI_Output(self, hero, "Info_Mod_Mustafa_Zeremoniendolch2_13_07"); //Und Gratulation für deinen schnellen Aufstieg in unserer Kaste. Ich wollte, wir hätten mehr von deinem Kaliber.
	AI_Output(hero, self, "Info_Mod_Mustafa_Zeremoniendolch2_15_08"); //Danke. Ich muss mich noch um den Blutkelch kümmern.
	AI_Output(self, hero, "Info_Mod_Mustafa_Zeremoniendolch2_13_09"); //Tu das. Und sprich mal mit Masut. Er hat wohl etwas ungewöhliches bemerkt.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_7163_ASS_Kamal_NW, "START");

	B_SetTopicStatus	(TOPIC_MOD_ASS_ZEREMONIENDOLCH, LOG_SUCCESS);

	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Mustafa hat mich zum Krieger ernannt. Den Zeremoniendolch soll ich erst mal behalten. Da ist doch auch was im Busch! Aber erst mal der Kelch.");

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Mustafa_Verschwoerung (C_INFO)
{
	npc		= Mod_7146_ASS_Mustafa_NW;
	nr		= 1;
	condition	= Info_Mod_Mustafa_Verschwoerung_Condition;
	information	= Info_Mod_Mustafa_Verschwoerung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hoher Rat, ich muss dir unbedingt etwas zeigen.";
};

FUNC INT Info_Mod_Mustafa_Verschwoerung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mirza_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mustafa_Verschwoerung_Info()
{
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung_15_00"); //Hoher Rat, ich muss dir unbedingt etwas zeigen.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung_15_01"); //Wenn du mir folgen möchtest. Ich warte im Gang beim Kistenstapel auf dich.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung_13_02"); //Wenn's denn sein muss ...

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Mustafa_Verschwoerung2 (C_INFO)
{
	npc		= Mod_7146_ASS_Mustafa_NW;
	nr		= 1;
	condition	= Info_Mod_Mustafa_Verschwoerung2_Condition;
	information	= Info_Mod_Mustafa_Verschwoerung2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mustafa_Verschwoerung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_Verschwoerung))
	&& (Npc_GetDistTowP(self, "WP_ASSASSINE_41") < 500)
	&& (Npc_HasItems(hero, ItMi_Bloodcup_MIS) == 1)
	&& (Npc_HasItems(hero, ItMi_Bloodcup_Richter) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mustafa_Verschwoerung2_Info()
{
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung2_13_00"); //Was gibt's hier zu sehen? Vielleicht den Blutkelch?
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_01"); //Den habe ich. Sogar zwei davon. Aber ...
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung2_13_02"); //Zeig her.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_03"); //Hier.

	Npc_RemoveInvItems	(hero, ItMi_Bloodcup_MIS, 1);
	Npc_RemoveInvItems	(hero, ItMi_Bloodcup_Richter, 1);

	B_ShowGivenThings	("Blutkelche gegeben");

	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_04"); //Aber ich habe etwas zu berichten, das sonst keiner hören soll.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung2_13_05"); //Was ein Umstand. Es gibt keine Geheimnisse bei uns im Rat.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_06"); //Das weiß ich besser. Hör zu: Die Magier planen eine Verschwörung unter Führung von Rat Norek.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung2_13_07"); //Unmöglich.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_08"); //Doch. Du hast doch zwei Kelche.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_09"); //Einen hat der Magier Mufid vor mir gefunden und in einer Truhe verwahrt, die in einer eingerichteten Höhle weit abseits der Stadt ist. Da drin war auch noch ein 2. Kelch.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_10"); //Ich bin sicher, dass der Zweite der ist, den Norek anfangs von Amir bekommen hat.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_11"); //Und den letzten habe ich Na'im gegeben.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung2_13_12"); //Hmm. Ich könnte rausfinden, ob Norek seinen Kelch noch hat. Aber was soll das Ganze?
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_13"); //Die Magier planen, das Lager hier zu verlassen und in dieser Höhle unterzutauchen.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_14"); //Dann soll Zahit in der Stadt den Paladinen unser Versteck hier verraten.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_15"); //Norek glaubt, er kann sich und seinen Leuten damit einen Freibrief hier auf Khorinis verschaffen.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung2_13_16"); //Unglaublich, aber es wäre möglich.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung2_13_17"); //Höre zu: du gehst in die Stadt und bringst den Verräter zum Schweigen.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung2_13_18"); //Ich werde herausfinden, wessen Blutkelch fehlt. Wir treffen uns wieder hier.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_19"); //Zu Befehl, Rat.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung2_13_20"); //Moment. Hast du den neuen Dolch schon ausprobiert?

	if (Mod_ASS_AvaquarGemeuchelt == 1)
	{
		AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_21"); //Den Zeremoniendolch? Oh ja, ein unheimliches Ding.
		AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung2_13_22"); //Dann benutze den. Wir können uns kein Aufsehen erlauben.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_23"); //Den Zeremoniendolch? Nein ...
		AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung2_13_24"); //Dann benutze den. Wir können uns kein Aufsehen erlauben.
		AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung2_15_25"); //Wird gemacht.
	};

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	B_LogEntry	(TOPIC_MOD_ASS_VERSCHWOERUNG, "Ich habe Mustafa alles über Norek und die Magier erzählt. Er scheint mir zu glauben. Nun soll ich den Verräter in der Stadt zum Schweigen bringen. Danach treffe ich mich mit Mustafa wieder bei den Kisten.");
};

INSTANCE Info_Mod_Mustafa_Verschwoerung3 (C_INFO)
{
	npc		= Mod_7146_ASS_Mustafa_NW;
	nr		= 1;
	condition	= Info_Mod_Mustafa_Verschwoerung3_Condition;
	information	= Info_Mod_Mustafa_Verschwoerung3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mustafa_Verschwoerung3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_Verschwoerung2))
	&& (Npc_GetDistTowP(self, "WP_ASSASSINE_41") < 500)
	&& (Npc_IsDead(Mod_7100_ASS_Zahit_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mustafa_Verschwoerung3_Info()
{
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung3_13_00"); //Ich habe die Blutkelche im Rat mal vorsichtig zur Sprache gebracht.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung3_13_01"); //Norek konnte seinen nicht vorzeigen. Er habe ihn an einem sicheren Ort verwahrt, sagt er.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung3_13_02"); //Na'im hatte den Kelch bei sich ...
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung3_15_03"); //Und der Verräter ist tot.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung3_13_04"); //Dann müssen die Informationen stimmen, die du bekommen hast.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung3_13_05"); //Nun muss ich nur noch wissen, auf welcher Seite Rat Na'im tatsächlich steht.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung3_15_06"); //Er hat den Kelch ja noch.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung3_13_07"); //Schon, aber wenn er zur anderen Seite gehört, ist es egal, ob er oder Norek ihn hat.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung3_15_08"); //Auch wieder wahr. Hm ... man müsste an diesen 3. Kelch gelangen, ohne dass Na'im das merkt. Für alle Fälle ...
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung3_13_09"); //Das hat was. Aber wie? Er trägt ihn immer bei sich.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung3_15_10"); //Ein Schlafzauber vielleicht?
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung3_13_11"); //Das könnte klappen. Aber Norek würde das sicher bemerken ...
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung3_15_12"); //Dann eben zwei Schlafzauber.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung3_15_13"); //Sehr gut. Aber wir warten die Nacht ab. Da schlafen die meisten Magier.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung3_15_14"); //Du nimmst jetzt die zwei Kelche wieder zurück und bringst sie in Sicherheit. Man kann nie wissen ...

	CreateInvItems	(hero, ItMi_Bloodcup_MIS, 1);
	CreateInvItems	(hero, ItMi_Bloodcup_Richter, 1);

	B_ShowGivenThings	("Blutkelche erhalten");

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_ASS_VERSCHWOERUNG, "Nun ist sicher, dass Norek und seine Magier Verrat planen. Ich soll die zwei vorhandenen Kelche erst mal in Sicherheit bringen. Für alle Fälle. Und dann die heute Nacht mit zwei Schlafzaubern beim Rat auftauchen ...");
};

INSTANCE Info_Mod_Mustafa_Verschwoerung4 (C_INFO)
{
	npc		= Mod_7146_ASS_Mustafa_NW;
	nr		= 1;
	condition	= Info_Mod_Mustafa_Verschwoerung4_Condition;
	information	= Info_Mod_Mustafa_Verschwoerung4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mustafa_Verschwoerung4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_Verschwoerung3))
	&& (Npc_GetDistTowP(self, "WP_ASSASSINE_41") < 500)
	&& (Wld_IsTime(22,00,24,00))
	&& ((Npc_HasItems(hero, ItSc_Sleep) >= 2)
	|| (Npc_HasItems(hero, ItRu_Sleep) >= 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mustafa_Verschwoerung4_Info()
{
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung4_13_00"); //Höchste Zeit, dass du kommst. Norek ist äußerst nervös. Hat mehrmals nach Mufid gefragt.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung4_13_01"); //Und auch die anderen Magier verhalten sich unruhig.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung4_15_02"); //Soll ich jetzt zum Rat gehen?
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung4_13_03"); //Unbedingt. Schläfer beide ein und nimm den Kelch von Na'im. Du schaffst das.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung4_13_04"); //Ich rede inzwischen mit meinen Kriegern.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_ASS_VERSCHWOERUNG, "Es ist soweit. Jetzt muss ich Norek und Na'im einschläfern und dann Na'im den Kelch abnehmen ...");
};

INSTANCE Info_Mod_Mustafa_Verschwoerung5 (C_INFO)
{
	npc		= Mod_7146_ASS_Mustafa_NW;
	nr		= 1;
	condition	= Info_Mod_Mustafa_Verschwoerung5_Condition;
	information	= Info_Mod_Mustafa_Verschwoerung5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab den Kelch! Was nun?";
};

FUNC INT Info_Mod_Mustafa_Verschwoerung5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_Verschwoerung4))
	&& (Mod_ASS_NaimBlutkelch == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mustafa_Verschwoerung5_Info()
{
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung5_15_00"); //Ich hab den Kelch! Was nun?
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung5_13_01"); //Gute Arbeit, Krieger. Damit hast du dir den Rang eines Elite-Assassinen verdient.
	AI_Output(self, hero, "Info_Mod_Mustafa_Verschwoerung5_13_02"); //Bring die Kelche nun in Sicherheit und kehre dann so schnell wie möglich zurück.
	AI_Output(hero, self, "Info_Mod_Mustafa_Verschwoerung5_15_03"); //Danke, hoher Rat. Ich eile.

	B_LogEntry	(TOPIC_MOD_ASS_VERSCHWOERUNG, "Ich soll die Kelche in Sicherheit bringen und dann so schnell wie möglich zurückkehren ...");
	B_SetTopicStatus	(TOPIC_MOD_ASS_LASTBLUTKELCH, LOG_SUCCESS);

	B_GivePlayerXP	(500);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Mustafa_NachSchlacht (C_INFO)
{
	npc		= Mod_7146_ASS_Mustafa_NW;
	nr		= 1;
	condition	= Info_Mod_Mustafa_NachSchlacht_Condition;
	information	= Info_Mod_Mustafa_NachSchlacht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier.";
};

FUNC INT Info_Mod_Mustafa_NachSchlacht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Naim_NachSchlacht2))
	&& (Npc_HasItems(hero, ItMi_Bloodcup_Richter) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mustafa_NachSchlacht_Info()
{
	AI_Output(hero, self, "Info_Mod_Mustafa_NachSchlacht_15_00"); //Hier.

	B_GiveInvItems	(hero, self, ItMi_Bloodcup_Richter, 1);

	AI_Output(self, hero, "Info_Mod_Mustafa_NachSchlacht_13_01"); //Danke, Krieger. Genau, wie die Überlieferungen berichten. Ein neues Leben für den Trank aus dem Blutkelch.
	AI_Output(hero, self, "Info_Mod_Mustafa_NachSchlacht_15_02"); //Was heißt das?
	AI_Output(self, hero, "Info_Mod_Mustafa_NachSchlacht_13_03"); //Sprich mit Na'im. Er wird es dir erklären. Ich bin noch schwach.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Mustafa_Pickpocket (C_INFO)
{
	npc		= Mod_7146_ASS_Mustafa_NW;
	nr		= 1;
	condition	= Info_Mod_Mustafa_Pickpocket_Condition;
	information	= Info_Mod_Mustafa_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Mustafa_Pickpocket_Condition()
{
	C_Beklauen	(118, ItMi_Gold, 2000);
};

FUNC VOID Info_Mod_Mustafa_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Mustafa_Pickpocket);

	Info_AddChoice	(Info_Mod_Mustafa_Pickpocket, DIALOG_BACK, Info_Mod_Mustafa_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Mustafa_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Mustafa_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Mustafa_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Mustafa_Pickpocket);
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

INSTANCE Info_Mod_Mustafa_EXIT (C_INFO)
{
	npc		= Mod_7146_ASS_Mustafa_NW;
	nr		= 1;
	condition	= Info_Mod_Mustafa_EXIT_Condition;
	information	= Info_Mod_Mustafa_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Mustafa_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mustafa_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};