INSTANCE Info_Mod_Xardas_MT_Felsenfestung (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_Felsenfestung_Condition;
	information	= Info_Mod_Xardas_MT_Felsenfestung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_MT_Felsenfestung_Condition()
{
	if (Mod_Xeres_Kampf01 == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_MT_Felsenfestung_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Felsenfestung_14_00"); //Das war knapp. Zum Glück bin ich dir gefolgt. Es scheint so, als wärst du nicht stark genug, um Xeres besiegen zu können.
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Felsenfestung_15_01"); //(sarkastisch) Gut, dass wir das jetzt immerhin wissen.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Felsenfestung_14_02"); //Ich habe Xeres' Kräfte unterschätzt. Das macht ihn noch gefährlicher, als ich dachte.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Felsenfestung_14_03"); //Ich kenne niemanden, der sich mit ihm messen könnte.
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Felsenfestung_15_04"); //Dann wühl doch noch mal in deinen alten Folianten. Da steht doch immer was Nützliches drin.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Felsenfestung_14_05"); //Wir werden es darauf ankommen lassen müssen.
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Felsenfestung_15_06"); //Kann ich in der Zwischenzeit helfen?
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Felsenfestung_14_07"); //Ich habe bisher dafür gesorgt, dass niemand Weiteres aus Xeres' Gefängnis ausbrechen konnte.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Felsenfestung_14_08"); //Um dir beizustehen, musste ich meinen Wachposten verlassen.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Felsenfestung_14_09"); //Ich befürchte, dass in Jharkendar mittlerweile die Hölle los ist.
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Felsenfestung_15_10"); //Das bedeutet, ich darf mich dort vergnügen.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Felsenfestung_14_11"); //Ich werde nicht ruhen, bis ich etwas herausgefunden habe. Solange musst du dort Xeres' Truppen aufhalten.
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Felsenfestung_15_12"); //Nichts leichter als das.

	B_LogEntry	(TOPIC_MOD_XERES, "Xardas sucht einen Weg, wie wir es vielleicht doch noch mit Xeres aufnehmen können. In der Zwischenzeit soll ich in Jharkendar Xeres' heranrollende Truppen aufhalten.");

	B_StartOtherRoutine	(Xeres_01, "START");
};

INSTANCE Info_Mod_Xardas_MT_ArgezSicher (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_ArgezSicher_Condition;
	information	= Info_Mod_Xardas_MT_ArgezSicher_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_MT_ArgezSicher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_AW_Rettung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_MT_ArgezSicher_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_MT_ArgezSicher_14_00"); //Gut, dass du kommst. Hast du Xeres' Leute zurückgehalten?
	AI_Output(hero, self, "Info_Mod_Xardas_MT_ArgezSicher_15_01"); //Argez und ich haben einen kleinen Trupp aufgerieben.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_ArgezSicher_14_02"); //Hoffentlich haben wir damit fürs Erste unsere Ruhe. Ich habe nämlich einen neuen Auftrag für dich.
	AI_Output(hero, self, "Info_Mod_Xardas_MT_ArgezSicher_15_03"); //Nur her damit, wenn Xeres damit aufzuhalten ist.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_ArgezSicher_14_04"); //Ich habe dir schon erzählt, dass sich Radanos in mehrere Persönlichkeiten aufspaltete, die miteinander konkurrierten und auseinander strebten - die Geburtsstunde von Innos, Adanos und Beliar.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_ArgezSicher_14_05"); //Die drei neuen Götter waren von Beginn an Todfeinde und bekämpften sich, wo sie nur konnten.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_ArgezSicher_14_06"); //Wie meine Studien ergeben haben, griffen sie dabei auch zu Waffen.
	AI_Output(hero, self, "Info_Mod_Xardas_MT_ArgezSicher_15_07"); //Hmm. Ziemlich mächtige Waffen, nehme ich an?
	AI_Output(self, hero, "Info_Mod_Xardas_MT_ArgezSicher_14_08"); //Die mächtigsten mir bekannten Waffen, die zu haben sind. Mit einer von ihnen sollte es möglich sein, Xeres zu schlagen.

	Wld_InsertNpc	(SkeletonMage_Riddler, "OW_FOGDUNGEON_36_MOVEMENT2");
	Wld_InsertNpc	(Lesser_Skeleton, "OW_FOGDUNGEON_36");
	Wld_InsertNpc	(Lesser_Skeleton, "FP_FOGTOWER_BOOK");
	Wld_InsertNpc	(Lesser_Skeleton, "OW_FOGDUNGEON_30");
	Wld_InsertNpc	(Lesser_Skeleton, "OW_FOGDUNGEON_30");
	Wld_InsertNpc	(Lesser_Skeleton, "OW_FOGDUNGEON_28");
	Wld_InsertNpc	(Lesser_Skeleton, "OW_FOGDUNGEON_31");
	Wld_InsertNpc	(Lesser_Skeleton, "OW_FOGDUNGEON_25");
	Wld_InsertNpc	(Lesser_Skeleton, "OW_FOGDUNGEON_16");
	Wld_InsertNpc	(Lesser_Skeleton, "OW_FOGDUNGEON_17");
	Wld_InsertNpc	(Lesser_Skeleton, "OW_FOGDUNGEON_18");
	Wld_InsertNpc	(Lesser_Skeleton, "OW_FOGDUNGEON_22");
	Wld_InsertNpc	(Lesser_Skeleton, "OW_FOGDUNGEON_10");
	Wld_InsertNpc	(Lesser_Skeleton, "OW_FOGDUNGEON_09");
	Wld_InsertNpc	(Lesser_Skeleton, "OW_FOGDUNGEON_08");

	Log_CreateTopic	(TOPIC_MOD_ERSTEWAFFE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ERSTEWAFFE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ERSTEWAFFE, "Ich soll eine magische Waffe finden. Diese stammt von einem der drei Götter und wurde auf Khorinis versteckt.");
};

INSTANCE Info_Mod_Xardas_MT_WoWaffe (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_WoWaffe_Condition;
	information	= Info_Mod_Xardas_MT_WoWaffe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo soll ich mit der Suche beginnen?";
};

FUNC INT Info_Mod_Xardas_MT_WoWaffe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_Felsenfestung))
	&& (Npc_HasItems(hero, ItMw_BeliarWeapon_Raven) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_MT_WoWaffe_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_MT_WoWaffe_15_00"); //Wo soll ich mit der Suche beginnen?
	AI_Output(self, hero, "Info_Mod_Xardas_MT_WoWaffe_14_01"); //Zwei Schauplätze der Kampfhandlungen müssen sich im Minental befunden haben. Es ist von "mystischen Orten" die Rede.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_WoWaffe_14_02"); //Der eine sei bei der "Monduhr" - ich vermute, damit ist der Steinkreis gemeint, in dem auch ein Fokusstein verborgen war.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_WoWaffe_14_03"); //Bei dem anderen handelt es sich um ein verfluchtes Gemäuer. Die Ortsbeschreibung passt genau auf den Nebelturm an der Küste.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_WoWaffe_14_04"); //Am besten beginnst du deine Suche an einem dieser beiden Orte, dort müsstest du fündig werden.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_WoWaffe_14_05"); //Sobald du es an dich genommen hast, komm wieder zurück.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_WoWaffe_14_06"); //Solltest du vorerst jedoch nur auf dürftige Hinweise stoßen, die du nicht zu deuten weißt, stehe ich dir durchaus mit meinem Rat zur Seite.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_WoWaffe_14_07"); //Beliar möge dich bei deiner Suche behüten und die Augen deiner Feinde in Dunkelheit hüllen.

	B_LogEntry	(TOPIC_MOD_ERSTEWAFFE,	"Xardas erwähnte ein schwieriges Rätsel. Ich werde es wohl lösen müssen um an die Waffe zu gelangen. Doch vorher muss ich den Ort finden. Xardas sagt, ich solle mich an einen mystischen Ort begeben. In Frage kämen dafür wohl entweder der Stonehenge oder der Nebelturm. Sollte ich irgendwelche Hinweise nicht verstehen, so wird mir Xardas vielleicht helfen können.");
};

INSTANCE Info_Mod_Xardas_MT_RiddleHelper (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_RiddleHelper_Condition;
	information	= Info_Mod_Xardas_MT_RiddleHelper_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe ein Buch mit Hinweisen gefunden.";
};

FUNC INT Info_Mod_Xardas_MT_RiddleHelper_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_WoWaffe))
	&& (Npc_HasItems(hero, ItMw_BeliarWeapon_Raven) == 0)
	&& (riddle6 == FALSE)
	&& (riddle1 == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_MT_RiddleHelper_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_MT_RiddleHelper_15_00"); //Ich habe ein Buch mit Hinweisen gefunden.

	if (riddle5 == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Xardas_MT_RiddleHelper_15_01"); //In diesem Text steht, dass ich jemanden, oder etwas an dem Ort finden werde, wo alles begann ...
		AI_Output(self, hero, "Info_Mod_Xardas_MT_RiddleHelper_14_02"); //Ist es mit deinem Verstand schon so weit her, dass du dich nicht mal mehr an den Ort erinnerst, an welchem du den ersten Hinweis fandest?!
	}
	else if (riddle4 == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Xardas_MT_RiddleHelper_15_03"); //Es heißt hier, dass die Taten jener, die sich an Bord befanden, längst vergessen seien.
		AI_Output(self, hero, "Info_Mod_Xardas_MT_RiddleHelper_14_04"); //Überflüssig zu erwähnen, dass wohl von einem Schiff die Rede ist.
		AI_Output(self, hero, "Info_Mod_Xardas_MT_RiddleHelper_14_05"); //Und aus dem Text kann man eigentlich schließen, dass ihm durch widrige Umstände unsanft die Seetauglichkeit genommen wurde.
		AI_Output(self, hero, "Info_Mod_Xardas_MT_RiddleHelper_14_06"); //Soll ich jetzt vielleicht noch darauf verweisen, an welchen Orten du ein solches finden könntes!?
	}
	else if (riddle3 == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Xardas_MT_RiddleHelper_15_07"); //Ich soll nun jenen Ort finden, an dem ein kluger Fischer sein Netz nicht auswerfen würde, so heißt es.
		AI_Output(self, hero, "Info_Mod_Xardas_MT_RiddleHelper_14_08"); //Nun, wenn der Verstand es gebietet in klaren Gewässern zu fischen ... schaue dich im Osten der Kolonie um ...
		AI_Output(self, hero, "Info_Mod_Xardas_MT_RiddleHelper_14_09"); //(trocken) Mehr Hinweise sollte es kaum benötigen.
	}
	else if (riddle2 == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Xardas_MT_RiddleHelper_15_10"); //Diesmal soll ich einen Ort finden, der fast voll Wasser ist, aber dennoch genug Luft zum Atmen bietet.
		AI_Output(self, hero, "Info_Mod_Xardas_MT_RiddleHelper_14_11"); //Wenn du dich nördlich vom Alten Lager umsiehst, müsstest du den gesuchten ort Finden ... wobei ich mit "umsehen" nicht nur den oberflächlichen Gebrauch deiner Augen meine ...
	}
	else if (riddle1 == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Xardas_MT_RiddleHelper_15_12"); //Ich soll die Suche an dem Ort beginnen, von wo ich Aufbrach.
		AI_Output(self, hero, "Info_Mod_Xardas_MT_RiddleHelper_14_13"); //Nun, dann bist du hier sicherlich nicht völlig fehl am Platz.
		AI_Output(self, hero, "Info_Mod_Xardas_MT_RiddleHelper_14_14"); //In unmittelbarer Nähe habe ich gerade erst das Erstehen einer magischen Aura gespürt.
		AI_Output(self, hero, "Info_Mod_Xardas_MT_RiddleHelper_14_15"); //Schaue dich nur gründlich um, und du wirst finden, wonach du gesucht hast.
	};
};

INSTANCE Info_Mod_Xardas_MT_HabSchwert (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_HabSchwert_Condition;
	information	= Info_Mod_Xardas_MT_HabSchwert_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab das Schwert gefunden.";
};

FUNC INT Info_Mod_Xardas_MT_HabSchwert_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Riddler_Chromanin))
	&& ((Npc_HasItems(hero, ItMw_BeliarWeapon_Raven) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_01) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_02) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_03) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_04) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_05) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_06) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_07) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_08) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_09) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_10) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_11) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_12) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_13) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_14) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_15) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_16) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_17) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_18) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_19) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_20) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_01) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_02) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_03) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_04) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_05) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_06) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_07) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_08) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_09) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_10) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_11) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_12) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_13) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_14) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_15) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_16) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_17) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_18) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_19) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_20) == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_MT_HabSchwert_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_MT_HabSchwert_15_00"); //Ich hab das Schwert gefunden.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_HabSchwert_14_01"); //Sehr gut. Ich vermute, dass es sich hierbei um die Klaue Beliars handelt. Mit ihrer Macht solltest du Xeres ohne Probleme besiegen können.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_HabSchwert_14_02"); //Bevor du die Waffe jedoch benutzt, solltest du sie erst an einem Beliar Schrein weihen.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_HabSchwert_14_03"); //Nimm noch dieses Amulett zur Sicherheit.

	CreateInvItems	(self, ItAm_Xardas_SchutzVorXeres, 1);
	B_GiveInvItems	(self, hero, ItAm_Xardas_SchutzVorXeres, 1);

	AI_Output(self, hero, "Info_Mod_Xardas_MT_HabSchwert_14_04"); //Dieses Amulett sollte in der Lage sein, dich vor Xeres Fesselzauber zu schützen.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_HabSchwert_14_05"); //Sei aber gewarnt. Nach deiner letzten Begegnung mit ihm ist sein Einfluss auf die Orks in der Stadt noch gewachsen.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_HabSchwert_14_06"); //Rechne nicht damit, dass Standarten dich jetzt noch schützen werden.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_HabSchwert_14_07"); //Dir werden schon andere Wege einfallen müsse, um an ihn heranzukommen, sei es Magie, Zaubertrank, oder Schwert.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_HabSchwert_14_08"); //Ich werde nun nach Khorinis zurückkehren. Beliar sei mit dir.

	B_LogEntry_More	(TOPIC_MOD_XERES, TOPIC_MOD_ERSTEWAFFE, "Ich hab das Schwert und Xardas denkt, dass ich damit Xeres vernichten kann.", "Ich hab das Schwert und Xardas denkt, dass ich damit Xeres vernichten kann.");
	B_SetTopicStatus	(TOPIC_MOD_ERSTEWAFFE, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "TOT");
	Npc_ExchangeRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Xardas_MT_Befoerderung (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_Befoerderung_Condition;
	information	= Info_Mod_Xardas_MT_Befoerderung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will Schwarzmagier werden.";
};

FUNC INT Info_Mod_Xardas_MT_Befoerderung_Condition()
{
	if (Mod_Gilde == 12)
	&& (Kapitel > 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_MT_Befoerderung_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Befoerderung_15_00"); //Ich will Schwarzmagier werden.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Befoerderung_14_01"); //Du wählst also den Weg der Magie. Eine weise Entscheidung.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Befoerderung_14_02"); //Ich werde dich in den Rang des Schwarzmagiers erheben. Hoffentlich hilft das bei der Vernichtung von Xeres.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Befoerderung_14_03"); //Hier ist deine Robe.

	CreateInvItems	(self, SCHWARZMAGIERROBE, 1);
	B_GiveInvItems	(self, hero, SCHWARZMAGIERROBE, 1);

	AI_UnequipArmor	(hero);
	AI_EquipArmor	(hero, Schwarzmagierrobe);

	B_GivePlayerXP	(400);

	B_Göttergefallen(3, 5);

	Mod_Gilde = 13;

	Snd_Play ("LEVELUP");
};

INSTANCE Info_Mod_Xardas_MT_Gomez (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_Gomez_Condition;
	information	= Info_Mod_Xardas_MT_Gomez_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_MT_Gomez_Condition()
{
	if (Mod_GomezAngriff == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_MT_Gomez_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Gomez_14_00"); //Das reicht! Wir brauchen Gomez noch.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Xardas_MT_Raven (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_Raven_Condition;
	information	= Info_Mod_Xardas_MT_Raven_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_MT_Raven_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_MT_GomezNervt))
	&& (!Npc_IsInState(Mod_7068_DMR_Raven_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_MT_Raven_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Raven_14_00"); //Beenden wir nun diese rührende Versöhnung und gehen ...

	B_LogEntry	(TOPIC_MOD_AL_LOCKVOGEL, "Leider verhinderten Xardas und Raven die Tötung von Gomez ... Allerdings befiehlt Raven seinen Leuten das Lager zu verlassen und gibt mir als Entschädigung Gomez altes Schwert.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	B_StartOtherRoutine	(Mod_7067_DMR_Gomez_MT, "TOT");
	B_StartOtherRoutine	(Mod_7068_DMR_Raven_MT, "TOT");
	B_StartOtherRoutine	(Mod_7066_DMR_Daemonenritter_MT, "TOT");

	AI_Teleport	(self, "TOT");
	AI_Teleport	(Mod_7067_DMR_Gomez_MT, "TOT");
	AI_Teleport	(Mod_7068_DMR_Raven_MT, "TOT");
	AI_Teleport	(Mod_7066_DMR_Daemonenritter_MT, "TOT");
};

INSTANCE Info_Mod_Xardas_MT_Orkfriedhof (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_Orkfriedhof_Condition;
	information	= Info_Mod_Xardas_MT_Orkfriedhof_Info;
	permanent	= 0;
	important	= 0;
	description	= "Im Sumpf tauchte ein untoter Schamane der Orks auf und raubte ein Chromaninbuch.";
};

FUNC INT Info_Mod_Xardas_MT_Orkfriedhof_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_UndeadOrkShamane_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_MT_Orkfriedhof_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Orkfriedhof_15_00"); //Im Sumpf tauchte ein untoter Schamane der Orks auf und raubte ein Chromaninbuch.
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Orkfriedhof_15_01"); //Er sprach davon, sich an einen Ort toter Stille zurückziehen zu wollen.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Orkfriedhof_14_02"); //Im Sumpf sagst du? Befindet sich nicht in unmittelbarer Nähe jener orkische Friedhof, welchen du zu Zeiten des Schläfers bereits aufsuchtest?
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Orkfriedhof_15_03"); //Dies wäre der nahe liegendste Ort für deine Suche ... darauf hättest du jedoch beileibe selbst stoßen können.

	Mod_NL_UOS_Day = Wld_GetDay() - 1;
};

INSTANCE Info_Mod_Xardas_MT_UndeadOrk (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_UndeadOrk_Condition;
	information	= Info_Mod_Xardas_MT_UndeadOrk_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_MT_UndeadOrk_Condition()
{
	if (Mod_NL_UOS == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_MT_UndeadOrk_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_MT_UndeadOrk_14_00"); //Konntest du mittlerweile Chromanin erlangen?
	AI_Output(hero, self, "Info_Mod_Xardas_MT_UndeadOrk_15_01"); //Es gibt da gewisse Schwierigkeiten.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_UndeadOrk_14_02"); //Schwierigkeiten?!
	AI_Output(hero, self, "Info_Mod_Xardas_MT_UndeadOrk_15_03"); //Nun ... ach, ich mache es kurz.
	AI_Output(hero, self, "Info_Mod_Xardas_MT_UndeadOrk_15_04"); //Ein untoter Orkschamane raubte ein Buch und setzte sich im Orkfriedhof ab, wo er mich durch magische Barriere und Geiseln daran hindert, an das Buch zu kommen.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_UndeadOrk_14_05"); //Ist er in Reichweite deiner Magie?
	AI_Output(hero, self, "Info_Mod_Xardas_MT_UndeadOrk_15_06"); //Ich denke schon ...
	AI_Output(self, hero, "Info_Mod_Xardas_MT_UndeadOrk_14_07"); //Dann vernichte ihn mit einem Zauber. Da er selbst der Urheber der Barriere sein dürfte, müsste dich nichts mehr daran hindern zu dem Buch zu gelangen.

	Info_ClearChoices	(Info_Mod_Xardas_MT_UndeadOrk);

	Info_AddChoice	(Info_Mod_Xardas_MT_UndeadOrk, "Ja, aber die Geiseln.", Info_Mod_Xardas_MT_UndeadOrk_B);
	Info_AddChoice	(Info_Mod_Xardas_MT_UndeadOrk, "Ok, verstanden.", Info_Mod_Xardas_MT_UndeadOrk_A);
};

FUNC VOID Info_Mod_Xardas_MT_UndeadOrk_B()
{
	AI_Output(hero, self, "Info_Mod_Xardas_MT_UndeadOrk_B_15_00"); //Ja, aber die Geiseln. Es befinden sich untote Geschöpfe bei ihnen, die nicht sehr erfreut über das Ableben ihres Meisters wären ...
	AI_Output(self, hero, "Info_Mod_Xardas_MT_UndeadOrk_B_14_01"); //(mürrisch) Es geht hier um das Bestehen der Welt, wie wir sie kennen, und du machst dir Gedanken über solche Nichtigkeiten ... Hmpf, na gut, lass mich überlegen ...
	AI_Output(self, hero, "Info_Mod_Xardas_MT_UndeadOrk_B_14_02"); //Hmm, du müsstest dir Wirkung zweier verschiedener Spruchrollen rekombinieren, damit alle untoten Geschöpfe auf einen Schlag vernichtet werden.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_UndeadOrk_B_14_03"); //Ich kann dies einmalig für dich vornehmen.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_UndeadOrk_B_14_04"); //Mit welchen Spruchrollen, musst du jedoch schon selbst entscheiden ... und besorgen musst du diese selbstverständlich auch.

	Mod_NL_Xardas_ScrollCombiner = 1;
	
	Info_ClearChoices	(Info_Mod_Xardas_MT_UndeadOrk);
};

FUNC VOID Info_Mod_Xardas_MT_UndeadOrk_A()
{
	AI_Output(hero, self, "Info_Mod_Xardas_MT_UndeadOrk_A_15_00"); //Ok, verstanden.
	
	Info_ClearChoices	(Info_Mod_Xardas_MT_UndeadOrk);
};

INSTANCE Info_Mod_Xardas_MT_ScrollCombining (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_ScrollCombining_Condition;
	information	= Info_Mod_Xardas_MT_ScrollCombining_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich möchte zwei Spruchrollen miteinander kombinieren.";
};

FUNC INT Info_Mod_Xardas_MT_ScrollCombining_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_UndeadOrk))
	&& (Mod_NL_Xardas_ScrollCombiner == 1)
	{
		return 1;
	};
};

FUNC VOID B_Xardas_MT_WrongScrollCombination ()
{
	AI_Output(self, hero, "Info_Mod_Xardas_MT_WrongScrollCombination_14_00"); //(kurz angebunden, despektierlich) Hmm,  ich hoffe diese Zauber werden den Erfordernissen gerecht.
};

FUNC VOID B_Xardas_MT_RightScrollCombination ()
{
	AI_Output(self, hero, "Info_Mod_Xardas_MT_RightScrollCombination_14_00"); //(vornehm zurückhaltend, lobend) In der Tat, deine Wahl war nicht die schlechteste, so scheint mir.
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_MT_ScrollCombining_15_00"); //Ich möchte zwei Spruchrollen miteinander kombinieren.

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);

	if (Npc_HasItems(hero, ItSc_HarmUndead) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Untote vernichten", Info_Mod_Xardas_MT_ScrollCombining_HarmUndead);
	};
	if (Npc_HasItems(hero, ItSc_PalHolyBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Heiliger Pfeil", Info_Mod_Xardas_MT_ScrollCombining_HolyBolt);
	};
	if (Npc_HasItems(hero, ItSc_FireRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerregen", Info_Mod_Xardas_MT_ScrollCombining_FireRain);
	};
	if (Npc_HasItems(hero, ItSc_FireBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerpfeil", Info_Mod_Xardas_MT_ScrollCombining_FireBolt);
	};
	if (Npc_HasItems(hero, ItSc_IceWave) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eiswelle", Info_Mod_Xardas_MT_ScrollCombining_IceWave);
	};
	if (Npc_HasItems(hero, ItSc_IceRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eisregen", Info_Mod_Xardas_MT_ScrollCombining_IceRain);
	};
	if (Npc_HasItems(hero, ItSc_IceBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eispfeil", Info_Mod_Xardas_MT_ScrollCombining_IceBolt);
	};
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HarmUndead()
{
	Npc_RemoveInvItems	(hero, ItSc_HarmUndead, 1);

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);

	if (Npc_HasItems(hero, ItSc_HarmUndead) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Untote vernichten", Info_Mod_Xardas_MT_ScrollCombining_HarmUndead_HarmUndead);
	};
	if (Npc_HasItems(hero, ItSc_PalHolyBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Heiliger Pfeil", Info_Mod_Xardas_MT_ScrollCombining_HarmUndead_HolyBolt);
	};
	if (Npc_HasItems(hero, ItSc_FireRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerregen", Info_Mod_Xardas_MT_ScrollCombining_HarmUndead_FireRain);
	};
	if (Npc_HasItems(hero, ItSc_FireBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerpfeil", Info_Mod_Xardas_MT_ScrollCombining_HarmUndead_FireBolt);
	};
	if (Npc_HasItems(hero, ItSc_IceWave) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eiswelle", Info_Mod_Xardas_MT_ScrollCombining_HarmUndead_IceWave);
	};
	if (Npc_HasItems(hero, ItSc_IceRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eisregen", Info_Mod_Xardas_MT_ScrollCombining_HarmUndead_IceRain);
	};
	if (Npc_HasItems(hero, ItSc_IceBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eispfeil", Info_Mod_Xardas_MT_ScrollCombining_HarmUndead_IceBolt);
	};
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HarmUndead_HarmUndead()
{
	Npc_RemoveInvItems	(hero, ItSc_HarmUndead, 1);

	CreateInvItems	(hero, ItSc_HarmUndead, 2);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HarmUndead_HolyBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_PalHolyBolt, 1);

	CreateInvItems	(hero, ItSc_PalHolyBolt, 1);
	CreateInvItems	(hero, ItSc_HarmUndead, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HarmUndead_FireRain()
{
	Npc_RemoveInvItems	(hero, ItSc_FireRain, 1);

	CreateInvItems	(hero, ItSc_HolyRain, 1);
	CreateInvItems	(hero, ItSc_FireBolt, 1);

	B_Xardas_MT_RightScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HarmUndead_FireBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_FireBolt, 1);

	CreateInvItems	(hero, ItSc_PalHolyBolt, 1);
	CreateInvItems	(hero, ItSc_FireBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HarmUndead_IceWave()
{
	Npc_RemoveInvItems	(hero, ItSc_IceWave, 1);

	CreateInvItems	(hero, ItSc_HolyWave, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_RightScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HarmUndead_IceRain()
{
	Npc_RemoveInvItems	(hero, ItSc_IceRain, 1);

	CreateInvItems	(hero, ItSc_HolyRain, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_RightScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HarmUndead_IceBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_IceBolt, 1);

	CreateInvItems	(hero, ItSc_PalHolyBolt, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HolyBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_PalHolyBolt, 1);

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);

	if (Npc_HasItems(hero, ItSc_HarmUndead) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Untote vernichten", Info_Mod_Xardas_MT_ScrollCombining_HolyBolt_HarmUndead);
	};
	if (Npc_HasItems(hero, ItSc_PalHolyBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Heiliger Pfeil", Info_Mod_Xardas_MT_ScrollCombining_HolyBolt_HolyBolt);
	};
	if (Npc_HasItems(hero, ItSc_FireRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerregen", Info_Mod_Xardas_MT_ScrollCombining_HolyBolt_FireRain);
	};
	if (Npc_HasItems(hero, ItSc_FireBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerpfeil", Info_Mod_Xardas_MT_ScrollCombining_HolyBolt_FireBolt);
	};
	if (Npc_HasItems(hero, ItSc_IceWave) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eiswelle", Info_Mod_Xardas_MT_ScrollCombining_HolyBolt_IceWave);
	};
	if (Npc_HasItems(hero, ItSc_IceRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eisregen", Info_Mod_Xardas_MT_ScrollCombining_HolyBolt_IceRain);
	};
	if (Npc_HasItems(hero, ItSc_IceBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eispfeil", Info_Mod_Xardas_MT_ScrollCombining_HolyBolt_IceBolt);
	};
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HolyBolt_HarmUndead()
{
	Npc_RemoveInvItems	(hero, ItSc_HarmUndead, 1);

	CreateInvItems	(hero, ItSc_PalHolyBolt, 1);
	CreateInvItems	(hero, ItSc_HarmUndead, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HolyBolt_HolyBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_PalHolyBolt, 1);

	CreateInvItems	(hero, ItSc_PalHolyBolt, 2);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HolyBolt_FireRain()
{
	Npc_RemoveInvItems	(hero, ItSc_FireRain, 1);

	CreateInvItems	(hero, ItSc_HolyRain, 1);
	CreateInvItems	(hero, ItSc_FireBolt, 1);

	B_Xardas_MT_RightScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HolyBolt_FireBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_FireBolt, 1);

	CreateInvItems	(hero, ItSc_PalHolyBolt, 1);
	CreateInvItems	(hero, ItSc_FireBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HolyBolt_IceWave()
{
	Npc_RemoveInvItems	(hero, ItSc_IceWave, 1);

	CreateInvItems	(hero, ItSc_HolyWave, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_RightScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HolyBolt_IceRain()
{
	Npc_RemoveInvItems	(hero, ItSc_IceRain, 1);

	CreateInvItems	(hero, ItSc_HolyRain, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_RightScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_HolyBolt_IceBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_IceBolt, 1);

	CreateInvItems	(hero, ItSc_PalHolyBolt, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireRain()
{
	Npc_RemoveInvItems	(hero, ItSc_FireRain, 1);

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);

	if (Npc_HasItems(hero, ItSc_HarmUndead) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Untote vernichten", Info_Mod_Xardas_MT_ScrollCombining_FireRain_HarmUndead);
	};
	if (Npc_HasItems(hero, ItSc_PalHolyBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Heiliger Pfeil", Info_Mod_Xardas_MT_ScrollCombining_FireRain_HolyBolt);
	};
	if (Npc_HasItems(hero, ItSc_FireRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerregen", Info_Mod_Xardas_MT_ScrollCombining_FireRain_FireRain);
	};
	if (Npc_HasItems(hero, ItSc_FireBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerpfeil", Info_Mod_Xardas_MT_ScrollCombining_FireRain_FireBolt);
	};
	if (Npc_HasItems(hero, ItSc_IceWave) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eiswelle", Info_Mod_Xardas_MT_ScrollCombining_FireRain_IceWave);
	};
	if (Npc_HasItems(hero, ItSc_IceRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eisregen", Info_Mod_Xardas_MT_ScrollCombining_FireRain_IceRain);
	};
	if (Npc_HasItems(hero, ItSc_IceBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eispfeil", Info_Mod_Xardas_MT_ScrollCombining_FireRain_IceBolt);
	};
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireRain_HarmUndead()
{
	Npc_RemoveInvItems	(hero, ItSc_HarmUndead, 1);

	CreateInvItems	(hero, ItSc_HolyRain, 1);
	CreateInvItems	(hero, ItSc_FireBolt, 1);

	B_Xardas_MT_RightScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireRain_HolyBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_PalHolyBolt, 1);

	CreateInvItems	(hero, ItSc_HolyRain, 1);
	CreateInvItems	(hero, ItSc_FireBolt, 1);

	B_Xardas_MT_RightScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireRain_FireRain()
{
	Npc_RemoveInvItems	(hero, ItSc_FireRain, 1);

	CreateInvItems	(hero, ItSc_FireRain, 2);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireRain_FireBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_FireBolt, 1);

	CreateInvItems	(hero, ItSc_FireRain, 1);
	CreateInvItems	(hero, ItSc_FireBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireRain_IceWave()
{
	Npc_RemoveInvItems	(hero, ItSc_IceWave, 1);

	CreateInvItems	(hero, ItSc_FireWave, 1);
	CreateInvItems	(hero, ItSc_IceRain, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireRain_IceRain()
{
	Npc_RemoveInvItems	(hero, ItSc_IceRain, 1);

	CreateInvItems	(hero, ItSc_FireRain, 1);
	CreateInvItems	(hero, ItSc_IceRain, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireRain_IceBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_IceBolt, 1);

	CreateInvItems	(hero, ItSc_FireBolt, 1);
	CreateInvItems	(hero, ItSc_IceRain, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_FireBolt, 1);

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);

	if (Npc_HasItems(hero, ItSc_HarmUndead) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Untote vernichten", Info_Mod_Xardas_MT_ScrollCombining_FireBolt_HarmUndead);
	};
	if (Npc_HasItems(hero, ItSc_PalHolyBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Heiliger Pfeil", Info_Mod_Xardas_MT_ScrollCombining_FireBolt_HolyBolt);
	};
	if (Npc_HasItems(hero, ItSc_FireRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerregen", Info_Mod_Xardas_MT_ScrollCombining_FireBolt_FireRain);
	};
	if (Npc_HasItems(hero, ItSc_FireBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerpfeil", Info_Mod_Xardas_MT_ScrollCombining_FireBolt_FireBolt);
	};
	if (Npc_HasItems(hero, ItSc_IceWave) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eiswelle", Info_Mod_Xardas_MT_ScrollCombining_FireBolt_IceWave);
	};
	if (Npc_HasItems(hero, ItSc_IceRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eisregen", Info_Mod_Xardas_MT_ScrollCombining_FireBolt_IceRain);
	};
	if (Npc_HasItems(hero, ItSc_IceBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eispfeil", Info_Mod_Xardas_MT_ScrollCombining_FireBolt_IceBolt);
	};
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireBolt_HolyBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_PalHolyBolt, 1);

	CreateInvItems	(hero, ItSc_PalHolyBolt, 1);
	CreateInvItems	(hero, ItSc_FireBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireBolt_HarmUndead()
{
	Npc_RemoveInvItems	(hero, ItSc_HarmUndead, 1);

	CreateInvItems	(hero, ItSc_HarmUndead, 1);
	CreateInvItems	(hero, ItSc_FireBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireBolt_FireRain()
{
	Npc_RemoveInvItems	(hero, ItSc_FireRain, 1);

	CreateInvItems	(hero, ItSc_FireRain, 1);
	CreateInvItems	(hero, ItSc_FireBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireBolt_FireBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_FireBolt, 1);

	CreateInvItems	(hero, ItSc_FireBolt, 2);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireBolt_IceWave()
{
	Npc_RemoveInvItems	(hero, ItSc_IceWave, 1);

	CreateInvItems	(hero, ItSc_FireWave, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireBolt_IceRain()
{
	Npc_RemoveInvItems	(hero, ItSc_IceRain, 1);

	CreateInvItems	(hero, ItSc_FireRain, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_FireBolt_IceBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_IceBolt, 1);

	CreateInvItems	(hero, ItSc_FireBolt, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceWave()
{
	Npc_RemoveInvItems	(hero, ItSc_IceWave, 1);

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);

	if (Npc_HasItems(hero, ItSc_HarmUndead) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Untote vernichten", Info_Mod_Xardas_MT_ScrollCombining_IceWave_HarmUndead);
	};
	if (Npc_HasItems(hero, ItSc_PalHolyBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Heiliger Pfeil", Info_Mod_Xardas_MT_ScrollCombining_IceWave_HolyBolt);
	};
	if (Npc_HasItems(hero, ItSc_FireRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerregen", Info_Mod_Xardas_MT_ScrollCombining_IceWave_FireRain);
	};
	if (Npc_HasItems(hero, ItSc_FireBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerpfeil", Info_Mod_Xardas_MT_ScrollCombining_IceWave_FireBolt);
	};
	if (Npc_HasItems(hero, ItSc_IceWave) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eiswelle", Info_Mod_Xardas_MT_ScrollCombining_IceWave_IceWave);
	};
	if (Npc_HasItems(hero, ItSc_IceRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eisregen", Info_Mod_Xardas_MT_ScrollCombining_IceWave_IceRain);
	};
	if (Npc_HasItems(hero, ItSc_IceBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eispfeil", Info_Mod_Xardas_MT_ScrollCombining_IceWave_IceBolt);
	};
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceWave_HarmUndead()
{
	Npc_RemoveInvItems	(hero, ItSc_HarmUndead, 1);

	CreateInvItems	(hero, ItSc_IceBolt, 1);
	CreateInvItems	(hero, ItSc_HolyWave, 1);

	B_Xardas_MT_RightScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceWave_HolyBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_PalHolyBolt, 1);

	CreateInvItems	(hero, ItSc_IceBolt, 1);
	CreateInvItems	(hero, ItSc_HolyWave, 1);

	B_Xardas_MT_RightScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceWave_FireRain()
{
	Npc_RemoveInvItems	(hero, ItSc_FireRain, 1);

	CreateInvItems	(hero, ItSc_IceRain, 1);
	CreateInvItems	(hero, ItSc_FireWave, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceWave_FireBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_FireBolt, 1);

	CreateInvItems	(hero, ItSc_IceBolt, 1);
	CreateInvItems	(hero, ItSc_FireWave, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceWave_IceWave()
{
	Npc_RemoveInvItems	(hero, ItSc_IceWave, 1);

	CreateInvItems	(hero, ItSc_IceWave, 2);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceWave_IceRain()
{
	Npc_RemoveInvItems	(hero, ItSc_IceRain, 1);

	CreateInvItems	(hero, ItSc_IceRain, 1);
	CreateInvItems	(hero, ItSc_IceWave, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceWave_IceBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_IceBolt, 1);

	CreateInvItems	(hero, ItSc_IceWave, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceRain()
{
	Npc_RemoveInvItems	(hero, ItSc_IceRain, 1);

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);

	if (Npc_HasItems(hero, ItSc_HarmUndead) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Untote vernichten", Info_Mod_Xardas_MT_ScrollCombining_IceRain_HarmUndead);
	};
	if (Npc_HasItems(hero, ItSc_PalHolyBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Heiliger Pfeil", Info_Mod_Xardas_MT_ScrollCombining_IceRain_HolyBolt);
	};
	if (Npc_HasItems(hero, ItSc_FireRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerregen", Info_Mod_Xardas_MT_ScrollCombining_IceRain_FireRain);
	};
	if (Npc_HasItems(hero, ItSc_FireBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerpfeil", Info_Mod_Xardas_MT_ScrollCombining_IceRain_FireBolt);
	};
	if (Npc_HasItems(hero, ItSc_IceWave) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eiswelle", Info_Mod_Xardas_MT_ScrollCombining_IceRain_IceWave);
	};
	if (Npc_HasItems(hero, ItSc_IceRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eisregen", Info_Mod_Xardas_MT_ScrollCombining_IceRain_IceRain);
	};
	if (Npc_HasItems(hero, ItSc_IceBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eispfeil", Info_Mod_Xardas_MT_ScrollCombining_IceRain_IceBolt);
	};
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceRain_HarmUndead()
{
	Npc_RemoveInvItems	(hero, ItSc_HarmUndead, 1);

	CreateInvItems	(hero, ItSc_HolyRain, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_RightScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceRain_HolyBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_PalHolyBolt, 1);

	CreateInvItems	(hero, ItSc_HolyRain, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_RightScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceRain_FireRain()
{
	Npc_RemoveInvItems	(hero, ItSc_FireRain, 1);

	CreateInvItems	(hero, ItSc_IceRain, 1);
	CreateInvItems	(hero, ItSc_FireRain, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceRain_FireBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_FireBolt, 1);

	CreateInvItems	(hero, ItSc_IceBolt, 1);
	CreateInvItems	(hero, ItSc_FireRain, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceRain_IceWave()
{
	Npc_RemoveInvItems	(hero, ItSc_IceWave, 1);

	CreateInvItems	(hero, ItSc_IceWave, 1);
	CreateInvItems	(hero, ItSc_IceRain, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceRain_IceRain()
{
	Npc_RemoveInvItems	(hero, ItSc_IceRain, 1);

	CreateInvItems	(hero, ItSc_IceRain, 2);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceRain_IceBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_IceBolt, 1);

	CreateInvItems	(hero, ItSc_IceRain, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_IceBolt, 1);

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);

	if (Npc_HasItems(hero, ItSc_HarmUndead) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Untote vernichten", Info_Mod_Xardas_MT_ScrollCombining_IceBolt_HarmUndead);
	};
	if (Npc_HasItems(hero, ItSc_PalHolyBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Heiliger Pfeil", Info_Mod_Xardas_MT_ScrollCombining_IceBolt_HolyBolt);
	};
	if (Npc_HasItems(hero, ItSc_FireRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerregen", Info_Mod_Xardas_MT_ScrollCombining_IceBolt_FireRain);
	};
	if (Npc_HasItems(hero, ItSc_FireBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Feuerpfeil", Info_Mod_Xardas_MT_ScrollCombining_IceBolt_FireBolt);
	};
	if (Npc_HasItems(hero, ItSc_IceWave) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eiswelle", Info_Mod_Xardas_MT_ScrollCombining_IceBolt_IceWave);
	};
	if (Npc_HasItems(hero, ItSc_IceRain) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eisregen", Info_Mod_Xardas_MT_ScrollCombining_IceBolt_IceRain);
	};
	if (Npc_HasItems(hero, ItSc_IceBolt) >= 1)
	{
		Info_AddChoice	(Info_Mod_Xardas_MT_ScrollCombining, "Eispfeil", Info_Mod_Xardas_MT_ScrollCombining_IceBolt_IceBolt);
	};
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceBolt_HarmUndead()
{
	Npc_RemoveInvItems	(hero, ItSc_HarmUndead, 1);

	CreateInvItems	(hero, ItSc_HarmUndead, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceBolt_HolyBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_PalHolyBolt, 1);

	CreateInvItems	(hero, ItSc_PalHolyBolt, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceBolt_FireRain()
{
	Npc_RemoveInvItems	(hero, ItSc_FireRain, 1);

	CreateInvItems	(hero, ItSc_IceRain, 1);
	CreateInvItems	(hero, ItSc_FireBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceBolt_FireBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_FireBolt, 1);

	CreateInvItems	(hero, ItSc_IceBolt, 1);
	CreateInvItems	(hero, ItSc_FireBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceBolt_IceWave()
{
	Npc_RemoveInvItems	(hero, ItSc_IceWave, 1);

	CreateInvItems	(hero, ItSc_IceWave, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceBolt_IceRain()
{
	Npc_RemoveInvItems	(hero, ItSc_IceRain, 1);

	CreateInvItems	(hero, ItSc_IceRain, 1);
	CreateInvItems	(hero, ItSc_IceBolt, 1);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

FUNC VOID Info_Mod_Xardas_MT_ScrollCombining_IceBolt_IceBolt()
{
	Npc_RemoveInvItems	(hero, ItSc_IceBolt, 1);

	CreateInvItems	(hero, ItSc_IceBolt, 2);

	B_Xardas_MT_WrongScrollCombination();

	Info_ClearChoices	(Info_Mod_Xardas_MT_ScrollCombining);
};

INSTANCE Info_Mod_Xardas_MT_Chromanin3 (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_Chromanin3_Condition;
	information	= Info_Mod_Xardas_MT_Chromanin3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier ein Chromaninbuch bei mir ...";
};

FUNC INT Info_Mod_Xardas_MT_Chromanin3_Condition()
{
	if (Mod_NL_UOS > 6)
	&& (Npc_HasItems(hero, ItWr_Chromanin3) == 1)
	&& (Mod_NL_Chromanin == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_MT_Chromanin3_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Chromanin3_15_00"); //Ich habe hier ein Chromaninbuch bei mir ...
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Chromanin3_14_01"); //(uninteressiert) Gut. Es war auch deine Aufgabe diese zu bergen.
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Chromanin3_15_02"); //Da gibt es jedoch ein Problem.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Chromanin3_14_03"); //Problem? Sofern du des Lesens mächtig bist, wo sollte ein Problem bestehen?
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Chromanin3_15_04"); //Nun ... es ist leer.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Chromanin3_14_05"); //Was?! Unsinn, zeig her ...

	B_GiveInvItems	(hero, self, ItWr_Chromanin3, 1);

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Xardas_MT_Chromanin3_14_06"); //Bei Beliar! Aber, wie ist das möglich? Unter welchen Umständen bist du an dieses Buch gekommen?

	B_GiveInvItems	(self, hero, ItWr_Chromanin3, 1);

	AI_Output(hero, self, "Info_Mod_Xardas_MT_Chromanin3_15_07"); //Ich entriss es dem Kadaver eines untoten Orkschamanen.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Chromanin3_14_08"); //Untoter Orkschamane?! Üble Magie scheint hier im Spiel zu sein ... Ja, ich spüre es.  Die magische Energie dieses Buches scheint fast gänzlich getilgt.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Chromanin3_14_09"); //Aber wie ist ihm das nur gelungen? Hatte er noch etwas bei sich?

	if (Mod_NL_Siegelbuch == 0)
	{
		AI_Output(hero, self, "Info_Mod_Xardas_MT_Chromanin3_15_10"); //Ich weiß es nicht ...
		AI_Output(self, hero, "Info_Mod_Xardas_MT_Chromanin3_14_11"); //Dann geh und schaue nach!
	};

	B_SetTopicStatus	(TOPIC_MOD_SLD_FRIEDHOF, LOG_SUCCESS);
};

INSTANCE Info_Mod_Xardas_MT_Siegelbuch_01 (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_Siegelbuch_01_Condition;
	information	= Info_Mod_Xardas_MT_Siegelbuch_01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ja, dieses versiegelten Buch.";
};

FUNC INT Info_Mod_Xardas_MT_Siegelbuch_01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_Chromanin3))
	&& (Npc_HasItems(hero, ItWr_Siegelbuch) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_MT_Siegelbuch_01_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Siegelbuch_01_15_00"); //Ja, dieses versiegelten Buch.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_01_14_01"); //Lass sehen ...

	B_GiveInvItems	(hero, self, ItWr_Siegelbuch, 1);

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_01_14_02"); //(Erstaunt) Es ... es scheint ein magisches Vakuum um sich zu erzeugen.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_01_14_03"); //Viel mehr noch, es saugt magische Energie aus der Umgebung förmlich in sich auf, langsam, aber stetig.
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Siegelbuch_01_15_04"); //Ich verstehe immer noch nicht ganz. Warum dieser ganz magische Firlefanz?
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Siegelbuch_01_15_05"); //Das Chromanin-Buch ist doch einfach ein Nachschlagewerk, in welchem ein paar Sätze festgehalten wurden.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_01_14_06"); //(erbost) Einfältiger Narr! Aber was will man von einem einfachen Söldner auch erwarten ...
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_01_14_07"); //Es ist nicht einfach nur Papier, auf welches etwas mit Tinte und Feder niedergeschrieben wurde. Die Schrift ist magischer Natur und kann auch nur mit magischen Mitteln beseitigt werden.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_01_14_08"); //Und jetzt will ich in Ruhe das versiegelte Buch studieren, welches du mir gebracht hast. Frühestens morgen kann ich dir mehr dazu sagen.

	Mod_NL_XardasSiegelDay = Wld_GetDay();
};

INSTANCE Info_Mod_Xardas_MT_Siegelbuch_02 (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_Siegelbuch_02_Condition;
	information	= Info_Mod_Xardas_MT_Siegelbuch_02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und was hast du herausgefunden?";
};

FUNC INT Info_Mod_Xardas_MT_Siegelbuch_02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_Siegelbuch_01))
	&& (Wld_GetDay()-1 == Mod_NL_XardasSiegelDay)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_MT_Siegelbuch_02_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Siegelbuch_02_15_00"); //Und was hast du herausgefunden?
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_02_14_01"); //(grimmig) Ich sagte frühestens morgen!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Xardas_MT_Siegelbuch_03 (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_Siegelbuch_03_Condition;
	information	= Info_Mod_Xardas_MT_Siegelbuch_03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du mittlerweile etwas herausgefunden?";
};

FUNC INT Info_Mod_Xardas_MT_Siegelbuch_03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_Siegelbuch_01))
	&& (Wld_GetDay()-1 > Mod_NL_XardasSiegelDay)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_MT_Siegelbuch_03_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Siegelbuch_03_15_00"); //Hast du mittlerweile etwas herausgefunden?
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_03_14_01"); //Ja, das habe ich, auch, wenn es nicht leicht war. Es scheint sich zu bestätigen, was ich bereits vermutet hatte.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_03_14_02"); //Der versiegelte Wälzer muss die magische Energie des Chromaninbuches absorbiert haben.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_03_14_03"); //Vermutlich hat der untote Orkschamene die Gefahr, welche das Chromanin für seinen Meister darstellt, erkannt und diesen Schritt vollzogen.
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Siegelbuch_03_15_04"); //Was können wir in diesem Fall machen, um die Magie des Buches wiederherzustellen?
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_03_14_05"); //Nun, aus den wenigen Quellen die ich fand konnte ich schließen, dass es sich um das "Buch des Pondaros" handeln könnte.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_03_14_06"); //Es ist uralt und soll eben diese Eigenschaften besessen haben, wie das Buch, welches du mir brachtest.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_03_14_07"); //Um die Magie des Chromaninbuches wiederzugewinnen, müssten wir die drei Siegel brechen und das Buch des Pondaros öffnen.
	AI_Output(hero, self, "Info_Mod_Xardas_MT_Siegelbuch_03_15_08"); //Und wie sollen wir das anstellen? Ich vermute nicht, dass es mit schlichter Gewalt zu schaffen wäre, richtig?
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_03_14_09"); //Richtig. Jedoch gaben die lückenhaften Quellen in dieser Beziehung nur den Satz preis "die Siegel im Kreis der Steine brechen". Sehr rätselhaft.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_03_14_10"); //Blicke dich auf Khorinis um, ob du Erscheinungen findest, die dieser Umschreibung entsprechen.
	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_03_14_11"); //An diesen Orten wirst du sicher auch bestimmte Mechanismen finden, die dir helfen werden, wenn du sie benutzt.

	B_GiveInvItems	(self, hero, ItWr_Siegelbuch, 1);

	AI_Output(self, hero, "Info_Mod_Xardas_MT_Siegelbuch_03_14_12"); //Ich werde während dessen versuchen mehr über dieses ominöse Buch zu erfahren.

	Mod_NL_Siegelbuch = 2;

	B_LogEntry	(TOPIC_MOD_ERSTEWAFFE, "Scheinbar hat das 'Buch des Pondaros' die Magie des Chromaninbuches in sich aufgenommen. Um diese wiederherzustellen, müssen die Siegel gebrochen werden. Xardas konnte mir jedoch nur den Satz 'die Siegel im Kreis der Steine brechen' mit auf den Weg geben. Hmm, Kreis der Steine ... Dort sollen dann jedenfalls Mechanismen sein, die mir helfen werden, wenn ich sie benutze ...");
};

INSTANCE Info_Mod_Xardas_MT_EXIT (C_INFO)
{
	npc		= Mod_680_DMB_Xardas_MT;
	nr		= 1;
	condition	= Info_Mod_Xardas_MT_EXIT_Condition;
	information	= Info_Mod_Xardas_MT_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Xardas_MT_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Xardas_MT_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};