// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Mil_333_Stadtwache_EXIT (C_INFO)
{
	npc			= Mil_333_Stadtwache;
	nr			= 999;
	condition	= DIA_Mil_333_Stadtwache_EXIT_Condition;
	information	= DIA_Mil_333_Stadtwache_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Mil_333_Stadtwache_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Mil_333_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// -----------------------------------------------------------
	const string Mil_333_Checkpoint	= "NW_CITY_MERCHANT_PATH_29";	//Eingang City Hintereingang!
// -----------------------------------------------------------

INSTANCE Info_Mod_Mil_333_Hi (C_INFO)
{
	npc		= Mil_333_Stadtwache;
	nr		= 1;
	condition	= Info_Mod_Mil_333_Hi_Condition;
	information	= Info_Mod_Mil_333_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mil_333_Hi_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Parlaf_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mil_333_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Mil_333_Hi_36_00"); //Du willst hier rein, nehme ich an?

	Info_ClearChoices	(Info_Mod_Mil_333_Hi);

	Info_AddChoice	(Info_Mod_Mil_333_Hi, "Ja, und du wirst mich nicht daran hindern.", Info_Mod_Mil_333_Hi_B);
	Info_AddChoice	(Info_Mod_Mil_333_Hi, "Sieht so aus.", Info_Mod_Mil_333_Hi_A);
};

FUNC VOID Info_Mod_Mil_333_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Mil_333_Hi_B_15_00"); //Ja, und du wirst mich nicht daran hindern.
	AI_Output(self, hero, "Info_Mod_Mil_333_Hi_B_36_00"); //(lacht) Oh, das macht mir ja Angst. Na los, komm doch, wenn du dich traust!
	AI_Output(self, hero, "Info_Mod_Mil_333_Hi_B_36_01"); //Und solltest du dir jetzt doch in die Hosen scheißen, dann versuch's lieber auf der anderen Seite bei Garond. Der ist heute für Verbrechergesocks zuständig.

	Info_ClearChoices	(Info_Mod_Mil_333_Hi);

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Mil_333_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Mil_333_Hi_A_15_00"); //Sieht so aus.
	AI_Output(self, hero, "Info_Mod_Mil_333_Hi_A_36_01"); //Du bist wohl einer der Sträflinge, die aus dem Minental ausgebrochen sind?
	AI_Output(hero, self, "Info_Mod_Mil_333_Hi_A_15_02"); //Kann sein.
	AI_Output(self, hero, "Info_Mod_Mil_333_Hi_A_36_03"); //Bist du. Ich kenne jeden, der in der Stadt ein- und ausgeht. Aber dich habe ich noch nie gesehen.
	AI_Output(hero, self, "Info_Mod_Mil_333_Hi_A_15_04"); //Darf ich denn jetzt vorbei?
	AI_Output(self, hero, "Info_Mod_Mil_333_Hi_A_36_05"); //Nicht bei mir. Garond will euch Kuppelbewohner selbst in Augenschein nehmen, bevor er euch reinlässt.
	AI_Output(self, hero, "Info_Mod_Mil_333_Hi_A_36_06"); //Du wirst dich zum anderen Tor bemühen müssen.
	AI_Output(self, hero, "Info_Mod_Mil_333_Hi_A_36_07"); //Aber versuch am besten, Garond gegenüber weniger ... frech zu sein. Er ist ein ziemlicher Kotzbrocken, und er kann euch so gar nicht leiden.

	Info_ClearChoices	(Info_Mod_Mil_333_Hi);

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Mil_333_Hi2 (C_INFO)
{
	npc		= Mil_333_Stadtwache;
	nr		= 1;
	condition	= Info_Mod_Mil_333_Hi2_Condition;
	information	= Info_Mod_Mil_333_Hi2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mil_333_Hi2_Condition()
{
	if (Npc_GetDistToWP(other, Mil_333_Checkpoint) <= 1000) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Parlaf_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Mil_333_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mil_333_Hi2_Info()
{
	AI_Output(self, hero, "Info_Mod_Mil_333_Hi2_36_00"); //Du willst hier rein, nehme ich an?
	AI_Output(hero, self, "Info_Mod_Mil_333_Hi2_15_01"); //Sieht so aus.
	AI_Output(self, hero, "Info_Mod_Mil_333_Hi2_36_02"); //Ich habe dich noch nie gesehen.
	AI_Output(hero, self, "Info_Mod_Mil_333_Hi2_15_03"); //Ich war aber schon beim anderen Stadttor. Frag Garond, wenn du mir nicht glaubst.
	AI_Output(self, hero, "Info_Mod_Mil_333_Hi2_36_04"); //Nee, lass mal, ich hab heute noch was Besseres vor. Na gut, komm rein.
};

INSTANCE Info_Mod_Mil_333_TomKraut (C_INFO)
{
	npc		= Mil_333_Stadtwache;
	nr		= 1;
	condition	= Info_Mod_Mil_333_TomKraut_Condition;
	information	= Info_Mod_Mil_333_TomKraut_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mil_333_TomKraut_Condition()
{
	if (Mod_SenyanTom_Kraut_Wache_01 == 1)
	&& (Mod_SenyanTom_Kraut_Wache_02 == 1)
	&& (Mod_SenyanTom_Kraut_Mika == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mil_333_TomKraut_Info()
{
	AI_Output(self, hero, "Info_Mod_Mil_333_TomKraut_36_00"); //Ohh, mein Kopf ... er fühlt sich an wie leergesaugt.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Mil_333_Daemonisch (C_INFO)
{
	npc		= Mil_333_Stadtwache;
	nr		= 1;
	condition	= Info_Mod_Mil_333_Daemonisch_Condition;
	information	= Info_Mod_Mil_333_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mil_333_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mil_333_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Mil_333_Daemonisch_36_00"); //Ahh, schon wieder einer dieser verrückten Ausflügler.
	AI_Output(hero, self, "Info_Mod_Mil_333_Daemonisch_15_01"); //Was meinst du mit verrückt? Und welche Ausflügler?
	AI_Output(self, hero, "Info_Mod_Mil_333_Daemonisch_36_02"); //Eben die ganzen Bürger, die immer wieder durchs Stadttor kommen.
	AI_Output(self, hero, "Info_Mod_Mil_333_Daemonisch_36_03"); //In letzter Zeit sind es verdammt viele geworden. Und verrückt ist das, was so in letzter Zeit alles in der Nähe der Stadttore passiert.

	B_Say	(hero, self, "$WASMEINSTDU");

	AI_Output(self, hero, "Info_Mod_Mil_333_Daemonisch_36_04"); //Na ja, zunächst die Banditen in dem kleinen Tal vor der Stadt.
	AI_Output(self, hero, "Info_Mod_Mil_333_Daemonisch_36_05"); //Ein Bürger hat sie entdeckt und einige Paladine und Stadtwachen abends dorthin geführt.
	AI_Output(self, hero, "Info_Mod_Mil_333_Daemonisch_36_06"); //Tengron, der eigentlich in der Stadt Wache halten sollte, hat es nicht auf seinem Posten ausgehalten und lief später nach.
	AI_Output(self, hero, "Info_Mod_Mil_333_Daemonisch_36_07"); //Es dauerte gar nicht lange, da kam er schreiend zurück und berichtete etwas von finsteren Schatten.
	AI_Output(self, hero, "Info_Mod_Mil_333_Daemonisch_36_08"); //Ja, ja, haha, Schatten in der Nacht, dem muss sein heiliges Licht zu sehr auf die Rübe geschienen haben.
	AI_Output(self, hero, "Info_Mod_Mil_333_Daemonisch_36_09"); //Von den anderen, die einige Zeit später zurückkamen, erfuhren wir, dass er in Tobsucht verfiel und jeden angriff. Seitdem sitzt er in der Arrestzelle ...
	AI_Output(self, hero, "Info_Mod_Mil_333_Daemonisch_36_10"); //Und dann noch Brian. Kam vor gar nicht langer Zeit aus der Stadt gestürmt, stammelte irgendetwas von Bedrohung der Stadt und finsteren Schatten.
	AI_Output(self, hero, "Info_Mod_Mil_333_Daemonisch_36_11"); //Ist dann Richtung Orlan zwischen den Bäumen verschwunden.
	AI_Output(hero, self, "Info_Mod_Mil_333_Daemonisch_15_12"); //Ähh, ist das nicht irgendwie ein Grund für dich, dir Sorgen zu machen?
	AI_Output(self, hero, "Info_Mod_Mil_333_Daemonisch_36_13"); //Wieso? Die Paladine durchforsten so oft abends die dunklen Wälder, dass man sich nicht sicherer fühlen kann.
	AI_Output(self, hero, "Info_Mod_Mil_333_Daemonisch_36_14"); //Die beiden Paladine die jedoch vor ein paar Tagen in das kleine Waldstück nördlich von uns gegangen sind, lassen sich aber echt Zeit, alles nach Banditen zu durchsuchen.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Mann, die Torwache scheint sich ja auch über gar nichts zu wundern. Ein Bürger hatte Paladine und Stadtwachen abends ins kleine Tal geführt, wo sich angeblich Banditen befanden. Tengron, der ihnen etwas später nachging, kam verstört zurückgelaufen und berichtete von finsteren Schatten. Die Begleiter, die später zurückkamen, behaupteten, er hätte sie angegriffen und sei verrückt geworden. Seitdem sitzt er im Gefängnis. Brian kam bei anderer Gelegenheit ebenfalls verängstigt zum Stadttor gelaufen und murmelte von schwarzen Schatten und einer Bedrohung der Stadt. Zuletzt erfuhr ich noch, dass zwei Paladine im nördlichen Waldstück beim Osttor verschwunden sind.");

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Mil_333_Daemonisch2 (C_INFO)
{
	npc		= Mil_333_Stadtwache;
	nr		= 1;
	condition	= Info_Mod_Mil_333_Daemonisch2_Condition;
	information	= Info_MoD_Mil_333_Daemonisch2_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Mil_333_Daemonisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlaf_Hi))
	&& (self.aivar[AIV_PASSGATE] == TRUE)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Mod_HQ_Daemonisch >= 2)
	&& (Kapitel == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mil_333_Daemonisch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Mil_333_Daemonisch2_36_00"); //Halt, erst den Schluck Klosterwein trinken.

	B_GiveInvItems	(self, hero, ItFo_KWine, 1);

	B_UseItem	(hero, ItFo_KWine);

	Npc_SetRefuseTalk (self, 60);
};

INSTANCE Info_Mod_Mil_333_Mario (C_INFO)
{
	npc		= Mil_333_Stadtwache;
	nr		= 1;
	condition	= Info_Mod_Mil_333_Mario_Condition;
	information	= Info_Mod_Mil_333_Mario_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist es erlaubt, über die Stadtmauer zu klettern?";
};

FUNC INT Info_Mod_Mil_333_Mario_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mario_Hilfe8))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mil_333_Mario_Info()
{
	AI_Output(hero, self, "Info_Mod_Mil_333_Mario_15_00"); //Ist es erlaubt, über die Stadtmauer zu klettern?
	AI_Output(self, hero, "Info_Mod_Mil_333_Mario_36_01"); //(lacht) Stadtmauern sind so geplant, dass niemand rüber klettern kann.
	AI_Output(hero, self, "Info_Mod_Mil_333_Mario_15_02"); //Ach so. Da hinten tun das aber zwei Kerle.
	AI_Output(self, hero, "Info_Mod_Mil_333_Mario_36_03"); //Was?! Wo?
	AI_Output(hero, self, "Info_Mod_Mil_333_Mario_15_04"); //Na, Richtung Westen. Ein ganzes Stück.
	AI_Output(hero, self, "Info_Mod_Mil_333_Mario_15_05"); //Als ich sie gefragt habe, was sie da wollen, sagten sie, ich solle mich verpissen.
	AI_Output(self, hero, "Info_Mod_Mil_333_Mario_36_06"); //Bei Innos! Immer wenn ICH Dienst habe!

	B_LogEntry	(TOPIC_MOD_MARIO_FLUCHTHILFE, "Die Stadtwachen sind abgelenkt.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Mil_333_HaradLehrling (C_INFO)
{
	npc		= Mil_333_Stadtwache;
	nr		= 1;
	condition	= Info_Mod_Mil_333_HaradLehrling_Condition;
	information	= Info_MoD_Mil_333_HaradLehrling_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mil_333_HaradLehrling_Condition()
{
	if (Npc_HasItems(hero, ItMi_Waffenbuendel) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mil_333_HaradLehrling_Info()
{
	AI_Output(self, hero, "Info_Mod_Mil_333_HaradLehrling_36_00"); //Stopp. Du bist doch der Lehrling von Harad, oder?
	AI_Output(hero, self, "Info_Mod_Mil_333_HaradLehrling_15_01"); //Ja, schon ...
	AI_Output(self, hero, "Info_Mod_Mil_333_HaradLehrling_36_02"); //Auf Anweisung Tengrons müssen wir dich durchsuchen. Einen kleinen Moment, bitte ...

	AI_PlayAni	(self, "T_PLUNDER");

	AI_Output(self, hero, "Info_Mod_Mil_333_HaradLehrling_36_03"); //Um dieses Waffenbündel ging es. Damit verstößt Harad gegen eine Bestimmung Tengrons. Wir müssen es an uns nehmen.

	B_GiveInvItems	(hero, self, ItMi_Waffenbuendel, 1);

	AI_Output(self, hero, "Info_Mod_Mil_333_HaradLehrling_36_04"); //Dass Harad versucht, es durch dich zu den Söldnern zu schmuggeln, wird ernsthafte Konsequenzen für ihn haben.

	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************
	var int MIL_333_Personal_AbsolutionLevel;
	//var int Mil_333_schonmalreingelassen; --> GLOBALS
// -----------------------------------------------------------

instance DIA_Mil_333_Stadtwache_FirstWarn (C_INFO)
{
	npc			= Mil_333_Stadtwache;
	nr			= 1;
	condition	= DIA_Mil_333_Stadtwache_FirstWarn_Condition;
	information	= DIA_Mil_333_Stadtwache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Mil_333_Stadtwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, Mil_333_Checkpoint) <= 1000) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};

	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) //wenn CRIME in Stadt bekannt
	&& (B_GetCurrentAbsolutionLevel(self) == MIL_333_Personal_AbsolutionLevel) //und noch nicht bezahlt
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else //CRIME_NONE (oder Sheepkiller) - wenn Crime rehabilitiert, wird hier PASSGATE automatisch wieder auf TRUE gesetzt
	{
		if (Mil_333_schonmalreingelassen == TRUE)
		{
			self.aivar[AIV_PASSGATE] = TRUE;
		};
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_36_00"); //HALT!
		
	// ------ PETZMASTER LIGHT ------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output (other, self,"DIA_Mil_333_Stadtwache_FirstWarn_15_01"); //(seufzt) Was denn?
		AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_36_02"); //Das weißt du ganz genau!
	
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_36_03"); //Du wirst in der Stadt als Mörder gesucht!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_36_04"); //Dreckige Diebe brauchen wir hier nicht!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_36_05"); //Unruhestifter können wir in unserer Stadt nicht gebrauchen!
		};
	
		AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_36_06"); //Warum, glaubst du, sollten wir dich reinlassen?
	}
	else // ------ normales Reinkommen ------
	{
		 var C_Item itm; itm = Npc_GetEquippedArmor(other);
		
		// ------ ohne Rüstung ODER als Bauer ------
		if (Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output (other, self,"DIA_Mil_333_Stadtwache_FirstWarn_15_07"); //Ja?
			AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_36_08"); //Du siehst aus wie ein armer Wicht. Leute ohne Geld können wir in der Stadt nicht gebrauchen.
		}
 	 	else 
		{
			AI_Output (other, self,"DIA_Mil_333_Stadtwache_FirstWarn_15_15"); //(ruhig) Was?
			AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_36_16"); //Wollte dich nur mal ansehen. Na ja, sieht aus, als ob du Geld hättest. Kannst reingehen.
			
			self.aivar[AIV_PASSGATE] = TRUE;
			Mil_333_schonmalreingelassen = TRUE;
			
			AI_StopProcessInfos(self);
		};
	};

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Mil_333_Stadtwache_SecondWarn (C_INFO)
{
	npc			= Mil_333_Stadtwache;
	nr			= 2;
	condition	= DIA_Mil_333_Stadtwache_SecondWarn_Condition;
	information	= DIA_Mil_333_Stadtwache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_333_Stadtwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_333_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_333_Stadtwache_SecondWarn_36_00"); //Kein Durchgang für dich, habe ich doch schon erwähnt.

	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP (other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Mil_333_Stadtwache_Attack (C_INFO)
{
	npc			= Mil_333_Stadtwache;
	nr			= 3;
	condition	= DIA_Mil_333_Stadtwache_Attack_Condition;
	information	= DIA_Mil_333_Stadtwache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_333_Stadtwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_333_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Mil_333_Stadtwache_Attack_36_00"); //Du hast es so gewollt ...
	
	AI_StopProcessInfos	(self);			
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};


// ************************************************************
// 							Bestechung!
// ************************************************************

INSTANCE DIA_Mil_333_Stadtwache_Bribe (C_INFO)
{
	npc			= Mil_333_Stadtwache;
	nr			= 5;
	condition	= DIA_Mil_333_Stadtwache_Bribe_Condition;
	information	= DIA_Mil_333_Stadtwache_Bribe_Info;
	permanent	= TRUE;
	description	= "Hier sind 100 Goldstücke. Lass mich rein!";
};                       

FUNC INT DIA_Mil_333_Stadtwache_Bribe_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};
	
func void DIA_Mil_333_Stadtwache_Bribe_Info()
{
	AI_Output (other, self,"DIA_Mil_333_Stadtwache_Bribe_15_00"); //Hier sind 100 Goldstücke. Lass mich rein!
	
	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		AI_Output (self, other,"DIA_Mil_333_Stadtwache_Bribe_36_01"); //(gierig) 100 Goldstücke klingen gut. Dann mal immer rein mit dir.
		
		if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_333_Stadtwache_Bribe_36_02"); //Und geh direkt zu Andre! Sonst knöpf ich dir beim nächsten Mal wieder 100 Goldstücke ab!
		};
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Mil_333_schonmalreingelassen = TRUE;
		
		// ------ wenn bezahlt, persönliche Absolution erteilen -------
		MIL_333_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else //nicht genug Gold
	{
		AI_Output (self, other,"DIA_Mil_333_Stadtwache_Bribe_36_03"); //Was?! Wo?! Ich sehe keine 100 Goldmünzen. Hau ab!
	};
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_Mil_333_Stadtwache_PERM (C_INFO)
{
	npc			= Mil_333_Stadtwache;
	nr			= 5;
	condition	= DIA_Mil_333_Stadtwache_PERM_Condition;
	information	= DIA_Mil_333_Stadtwache_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

FUNC INT DIA_Mil_333_Stadtwache_PERM_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
	
func void DIA_Mil_333_Stadtwache_PERM_Info()
{
	AI_Output (self, other,"DIA_Mil_333_Stadtwache_PERM_36_00"); //Weitergehen!
	
	AI_StopProcessInfos (self);
};