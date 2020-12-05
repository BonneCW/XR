INSTANCE Info_Mod_Saturas_NW_Hi (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Hi_Condition;
	information	= Info_Mod_Saturas_NW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Saturas_NW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_00"); //Co Pan tutaj robi? Odczekaj minute.... Ty!

	B_ReadySpell	(self, SPL_Icecube, SPL_Cost_IceCube);

	AI_Output(hero, self, "Info_Mod_Saturas_NW_Hi_15_01"); //Uh, I--
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_02"); //Po tym, co osiagneliscie w nowym obozie, czy naprawde osmielicie sie tu przyjechac!
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_03"); //Cieszcie sie, ze Milten jest dla was i ze jestescie powiernikiem Xardasa, najwyzszego ksiedza Beliara.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_04"); //I czy okolicznosci upadku bariery dla nas nie lezalyby w ciemnosci i dlatego wasz wplyw na nia nie wykluczalby calkowicie,....
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_05"); //... nalezy zamrozic sie do lodu i zostac wydmuchiwanym przez uderzenie pioruna.

	AI_RemoveWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_06"); //Wiec od teraz dbaj o to, co robisz!
};

INSTANCE Info_Mod_Saturas_NW_Soeldner (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Soeldner_Condition;
	information	= Info_Mod_Saturas_NW_Soeldner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jestem z najemnikami.";
};

FUNC INT Info_Mod_Saturas_NW_Soeldner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Hi))
	&& (Mod_Gilde == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Soeldner_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Soeldner_15_00"); //Jestem z najemnikami.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Soeldner_14_01"); //Nastepnie dobrze sie rozejrzyj, ale nie rób nic glupiego.
};

INSTANCE Info_Mod_Saturas_NW_RDW (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_RDW_Condition;
	information	= Info_Mod_Saturas_NW_RDW_Info;
	permanent	= 0;
	important	= 0;
	description	= "Naleze do pierscienia wodnego.";
};

FUNC INT Info_Mod_Saturas_NW_RDW_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Hi))
	&& (Mod_Gilde == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_RDW_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_RDW_15_00"); //Naleze do pierscienia wodnego.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_RDW_14_01"); //Wiec dolaczyles do nas. Mam nadzieje, ze nie oszukujesz.
};

INSTANCE Info_Mod_Saturas_NW_Brief (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Brief_Condition;
	information	= Info_Mod_Saturas_NW_Brief_Info;
	permanent	= 0;
	important	= 0;
	description	= "Otrzymalem dla Ciebie list od Xardasa.";
};

FUNC INT Info_Mod_Saturas_NW_Brief_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Hi))
	&& (Mod_PortalLance == TRUE)
	&& (Npc_HasItems(hero, XardasLetterForSaturas_Geoeffnet) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Brief_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Brief_15_00"); //Dostalem do Ciebie list od Xardasa.

	B_GiveInvItems	(hero, self, XardasLetterForSaturas_Geoeffnet, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Saturas_NW_Brief_14_01"); //Bardzo ciekawy. No cóz, mozecie tu pozostac, ale jesli zlosliwie sie zlosliwie popadniecie, zabije was.
};

INSTANCE Info_Mod_Saturas_NW_Portal (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Portal_Condition;
	information	= Info_Mod_Saturas_NW_Portal_Info;
	permanent	= 0;
	important	= 0;
	description	= "Slyszalem o portalu.";
};

FUNC INT Info_Mod_Saturas_NW_Portal_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_InGilde))
	&& (Mod_PortalLance == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Portal_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Portal_15_00"); //Slyszalem o portalu.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Portal_14_01"); //To prawda, ze podczas naszych wykopalisk znalezlismy portal.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Portal_14_02"); //Jest on jednak zamkniety i nie znalezlismy jeszcze sposobu na jego otwarcie.

	Log_CreateTopic	(TOPIC_MOD_PORTAL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PORTAL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PORTAL, "Saturas potwierdzil pogloski o portalu i powiedzial, ze nie znalezli jeszcze sposobu na jego otwarcie.");
};

INSTANCE Info_Mod_Saturas_NW_DurchsPortal (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_DurchsPortal_Condition;
	information	= Info_Mod_Saturas_NW_DurchsPortal_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy moge przejsc przez portal, gdy jest on otwarty?";
};

FUNC INT Info_Mod_Saturas_NW_DurchsPortal_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Portal))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_DurchsPortal_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_DurchsPortal_15_00"); //Czy moge przejsc przez portal, gdy jest on otwarty?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_DurchsPortal_14_01"); //Mozecie przyjsc ze mna, ale powinniscie byc ostrozni. Nie wiemy, co nas tam czeka.

	B_LogEntry	(TOPIC_MOD_PORTAL, "Satura pozwolila mi przejsc przez portal zaraz po jego otwarciu.");
};

INSTANCE Info_Mod_Saturas_NW_WieOeffnen (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_WieOeffnen_Condition;
	information	= Info_Mod_Saturas_NW_WieOeffnen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co mozemy zrobic, aby otworzyc brame?";
};

FUNC INT Info_Mod_Saturas_NW_WieOeffnen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Portal))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_WieOeffnen_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_WieOeffnen_15_00"); //Co mozemy zrobic, aby otworzyc brame?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_WieOeffnen_14_01"); //Idz do Nefariusa, tlumaczac napisy na scianach.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_WieOeffnen_14_02"); //Moze teraz wymyslil cos nowego.

	B_LogEntry	(TOPIC_MOD_PORTAL, "Saturas wyslala mnie do Nefariusa. Ja powinienem sie z nim sprawdzic, czy jest cos nowego.");
};

INSTANCE Info_Mod_Saturas_NW_Argez (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Argez_Condition;
	information	= Info_Mod_Saturas_NW_Argez_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Argez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_WieOeffnen))
	&& (Mod_Argez == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Argez_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_00"); //Ach, jest jeszcze jedna rzecz, z która mozesz nam pomóc.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_01"); //Dla rozczarowujacego ciebie, masz teraz wiele pracy do zrobienia.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_02"); //Rozwaz jego zwrot.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_03"); //Przejdzmy jednak do sedna sprawy: poza murami murów miasta Khoriniego pojawila sie powazna anomalia magiczna.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_04"); //Bylo tak silne, ze najpotezniejsi z magów byli nawiedzeni naglymi wizjami.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_05"); //Co wywolalo te anomalie?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_06"); //Znalezienie pracy bedzie Twoim zadaniem. Obawiam sie jednak najgorszego.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_07"); //Czarodziejskie wrazenie.... pomimo tego, ze nigdy wczesniej nie czulem sie tak jak kiedys.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_08"); //Wraz z intensywnoscia podejrzewam, ze w tamtym czasie jeden z naszych najsilniejszych wrogów byl tuz za miastem.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_09"); //Gdyby to prawda, ludzie nie byliby juz bezpieczni.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_10"); //Skad wiesz, ze anomalia wystapila poza murami Khorinis?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_11"); //Bylem jednym z zaskoczonych ta wizja.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_12"); //Bylo to zbyt mgliste, aby móc je precyzyjnie zlokalizowac, ale wyraznie rozpoznalem mury miejskie oddalone tylko o kilka metrów.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_13"); //Musisz dowiedziec sie, kto lub co spowodowalo te anomalie!
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_14"); //(ironiczne) Brak problemu. Zalózmy sie, ze zapytam, kto ostatnio uzywa tam czarnej magii.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_15"); //Nieco powazniej, prosze.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_16"); //Istnieje prosty sposób wykrywania anomalii magicznych. Znalazlem ja w tej swiatyni.

	B_GiveInvItems	(self, hero, ItAm_Anomalie, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_17"); //Chce, zeby amulet wrócil, wiec nie sprzedaj go i nie zalatwiaj!
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_18"); //Zeby z niego korzystac, wystarczy tylko zalozyc. Gdy tylko zblizysz sie do miejsca, w którym powstala anomalia, otrzymasz wizje procesu.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_19"); //Miejmy nadzieje, ze jest to wyrazniejsze niz te, których doswiadczylismy.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_20"); //Bez problemu. Wiec po prostu spaceruje ta rzecza po murach miasta Khorinis?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_21"); //To powinno to zrobic, tak. Im szybciej o to zadbasz, tym lepiej.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_22"); //Roger to.

	Log_CreateTopic	(TOPIC_MOD_DUNKLEMAGIE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DUNKLEMAGIE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DUNKLEMAGIE, "Gdzies poza murem Khorinisa miala miejsce powazna anomalia magiczna. Szatan kazal mi opuscic mury miasta z zewnatrz. Aby zlokalizowac anomalie, musze nosic amulet niewidzialnego czlowieka. Gdy tylko zajme wlasciwe miejsce, zagwarantuje mi to, ze bede mógl szybko przyjrzec sie przeszlosci.");
};

INSTANCE Info_Mod_Saturas_NW_Argez2 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Argez2_Condition;
	information	= Info_Mod_Saturas_NW_Argez2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dowiedzialem sie, kto jest odpowiedzialny za anomalie.";
};

FUNC INT Info_Mod_Saturas_NW_Argez2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Argez))
	&& (Mod_Argez == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Argez2_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_00"); //Dowiedzialem sie, kto jest odpowiedzialny za anomalie.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_01"); //Czy tak jest? Kim to jest?
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_02"); //Nazywa sie Argez. Spotkalem go przed Khorinisem i pomóglem mu dostac sie do miasta.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_03"); //Nieprawidlowosc zostala nagle zastapiona przez zombie, które nas zaatakowalo i bronil tym zakleciem.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_04"); //Pomagales mu w miescie?
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_05"); //Udawal, ze stracil pamiec. Nie widzialem w nim nic zlego, wrecz przeciwnie.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_06"); //Hmm, podejrzana osobowosc raz na zawsze.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_07"); //Czy myslisz, ze mozesz przyniesc go do mnie? Uwielbiam z nim porozmawiac.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_08"); //Nie sadze, by byl to problem.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_09"); //Bardzo dobry. Aby uratowac ciebie i jego daleka droge wstecz, zrobilem ten przewijak.

	B_GiveInvItems	(self, hero, ItSc_ArgezToSaturas, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_10"); //Uzywaj go wtedy, gdy chcesz, aby przyszedl z toba.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_11"); //Ach, zanim pójdziesz, chcialbym powrócic do mojego amuletu.

	if (Npc_HasItems(hero, ItAm_Anomalie) == 1)
	{
		AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_12"); //Tutaj jest tutaj.

		B_GiveInvItems	(hero, self, ItAm_Anomalie, 1);

		AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_13"); //Dzieki. Do zobaczenia pózniej.

		B_GivePlayerXP	(250);

		Mod_AnomalieAmulett = 0;
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_14"); //Przepraszam, juz tego nie mam.
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_15"); //Jak Beliar moze Ci ufac? Mozesz byc pewien, ze to byl ostatni raz!

		B_GivePlayerXP	(200);
	};

	B_SetTopicStatus	(TOPIC_MOD_DUNKLEMAGIE, LOG_SUCCESS);

	B_LogEntry	(TOPIC_MOD_ARGEZ, "Saturnas chce isc po Argezie z powodu anomalii. Chce poprosic go o wizyte u magika wody.");
};

INSTANCE Info_Mod_Saturas_NW_Argez3 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Argez3_Condition;
	information	= Info_Mod_Saturas_NW_Argez3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Argez3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_NW_LosZuSaturas))
	&& (Npc_GetDistToNpc(PC_Friend_NW, hero) < 1500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Argez3_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez3_14_00"); //To znów Ty. Ale przynosi pan ten argumentez.

	B_GivePlayerXP	(100);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TALKWITHARGEZ");
	B_StartOtherRoutine	(PC_Friend_NW, "ATSATURAS");

	B_SetTopicStatus	(TOPIC_MOD_ARGEZ, LOG_SUCCESS);
};

INSTANCE Info_Mod_Saturas_NW_Argez4 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Argez4_Condition;
	information	= Info_Mod_Saturas_NW_Argez4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Argez4_Condition()
{
	if (Mod_Argez == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Argez4_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez4_14_00"); //Nefarius poprosil Cie o pomoc. Powiedzial, ze byc moze bedziecie w stanie mu pomóc.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez4_15_01"); //Ide go gdzies do zobaczenia.
};

INSTANCE Info_Mod_Saturas_NW_Gefangen (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Gefangen_Condition;
	information	= Info_Mod_Saturas_NW_Gefangen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy masz racje?";
};

FUNC INT Info_Mod_Saturas_NW_Gefangen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Riordian_TempelDicht4))
	&& (Npc_IsDead(GardeInnos_4098_Danae))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Gefangen_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_00"); //Czy masz racje?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_01"); //Tak, to w porzadku. Dziekujemy za uratowanie nas. Jestesmy Wam gleboko zadluzeni.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_02"); //A co z wartownia Innos?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_03"); //Kiedy nas ogarneli, czwórka strazników przeszla przez portal, aby odzyskac potezna bron.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_04"); //Jak dlugo temu tak bylo?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_05"); //Okolo dwie godziny.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_06"); //Musze zatrzymac strazników, zanim wyciagna miecz.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_07"); //Potem lepiej sie spieszyc, bo straznicy byli dobrze zorganizowani.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_08"); //Natychmiast udaje sie do portalu.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_09"); //Zycze powodzenia.
};

INSTANCE Info_Mod_Saturas_NW_Goetter (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Goetter_Condition;
	information	= Info_Mod_Saturas_NW_Goetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co wiesz o broni bogów?";
};

FUNC INT Info_Mod_Saturas_NW_Goetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_UrizielKaputt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Goetter_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Goetter_15_00"); //Co wiesz o broni bogów?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Goetter_14_01"); //Zgodnie z dawnymi tradycjami, przypuszcza sie, ze sa trzy z tych artefaktów. Jeden dla kazdego Boga.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Goetter_14_02"); //Mówi sie, ze bron ta zostala rozprowadzona na trzy terytoria Khorinis. Ta czesc, Minental i Jharkendar.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Goetter_14_03"); //Nie dokonalismy jeszcze wielu badan na temat Jharkendara, ale napisy wspominaja o swiatyni Adanosa. Jestem pewien, ze znajdziecie tam jedna z tych broni.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Goetter_14_04"); //Druga bronia jest prawdopodobnie swiety mlot strazacki. Na szczescie jest to juz w naszym posiadaniu.

	B_LogEntry	(TOPIC_MOD_URIZIEL, "Kazda z broni bogów nalezy do boga. Mam juz w swoim posiadaniu bron Beliars. Bron Innos' jest swietym mlotkiem magów ognia. A bron Adanos' podobno znajduje sie w Jharkendarze w swiatyni Adanosa'.");
};

INSTANCE Info_Mod_Saturas_AW_Member_08 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_08_Condition;
	information	= Info_Mod_Saturas_AW_Member_08_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_08_Condition()
{
	if (Mod_WM_Boeden == 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_08_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_00"); //Czuje silne wibracje równowagi sil i odczuwam zle przeczucia.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_01"); //Prosze udac sie na wypas i spróbowac dowiedziec sie, co wydarzylo sie na plaskowyzu pastwiskowym i w okolicy.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_02"); //Równiez w tawernie na pewno bedzie mozna sie obejrzec, z pewnoscia znajda sie tam informacje.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_03"); //Zanim jednak rozpocznie pan te kolejna misje, wydaje mi sie, ze nadszedl wlasciwy czas, by powitac pana w naszych szeregach.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_04"); //Zrobiliscie wiele dla naszej spolecznosci i udowodniliscie, ze jestescie godni bycia magikiem wody.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_05"); //Powinien równiez pomóc w zdaniu egzaminów w rozumieniu Adano.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_06"); //Oczywiscie, mozesz swobodnie wybrac droge wodnego wojownika, aby walczyc z magia i mieczem....

	Mod_WM_Boeden = 12;

	Log_CreateTopic	(TOPIC_MOD_ADANOS_UNHEIL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ADANOS_UNHEIL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Szatan neka ciemne przeczucia. Poszukuje plaskowyzu pastwiskowego i okolic, aby dowiedziec sie, co sie stalo. W tawernie moga równiez znajdowac sie informacje.");

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_08);

	Info_AddChoice	(Info_Mod_Saturas_AW_Member_08, "Wybieram droge wojownika.", Info_Mod_Saturas_AW_Member_08_B);
	Info_AddChoice	(Info_Mod_Saturas_AW_Member_08, "Wybieram droge magów.", Info_Mod_Saturas_AW_Member_08_A);
};

FUNC VOID Info_Mod_Saturas_AW_Member_08_B()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_B_15_00"); //Wybieram droge wojownika.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_B_14_01"); //Jesli tego chcesz, skontaktuj sie z Ethan. On wraz z Toba podejmie kolejne kroki.

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_08);
};

FUNC VOID Info_Mod_Saturas_AW_Member_08_A()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_A_15_00"); //Wybieram droge magów.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_01"); //I niech tak bedzie. Nastepnie daj swiadectwo o twoim przywiazaniu do wody i powiedz slowa przysiegi:
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_02"); //Przysiegam mocami bogów.... i moc swietej wody......
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_A_15_03"); //Przysiegam mocami bogów.... i moc swietej wody......
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_04"); //... ze moja wiedza i dzialania beda polaczone z woda od teraz i na zawsze....
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_A_15_05"); //... ze moja wiedza i dzialania beda polaczone z woda od teraz i na zawsze....
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_06"); //... i fontanna zycia.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_A_15_07"); //... i fontanna zycia.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_08"); //To sie dzieje. Od teraz bedziesz sluzyl jako magik wody naszej spolecznosci i podazal za wola Adano.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_09"); //Tutaj daje wam szate wody i rózdzke maga.

	CreateInvItems	(self, ItAr_KDW_L_Addon, 1);
	B_GiveInvItems	(self, hero, ItAr_KDW_L_Addon, 1);
	CreateInvItems	(hero, ItMW_Addon_Stab03, 1);

	Snd_Play ("LEVELUP");

	B_GivePlayerXP	(1000);

	B_Göttergefallen(2, 5);

	Mod_Gilde = 10;

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_10"); //Niech Adanos poprowadzi Cie przez caly czas i pokaze Ci wlasciwa droge do utrzymania równowagi.

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_08);
};

INSTANCE Info_Mod_Saturas_AW_Member_09 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_09_Condition;
	information	= Info_Mod_Saturas_AW_Member_09_Info;
	permanent	= 0;
	important	= 0;
	description	= "Z ich grobów wznosza sie umarli.";
};

FUNC INT Info_Mod_Saturas_AW_Member_09_Condition()
{
	if (Mod_WM_Boeden == 12)
	&& (Mod_WM_SawGraveOne == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_09_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_09_15_00"); //Z ich grobów wznosza sie umarli. Wsród nich, istoty wydaja sie poruszac, które ich prowadza.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_09_14_01"); //Co Pan mówi! Jakie zle demony czynia? Spróbuj dowiedziec sie wiecej. Robimy badania w pismach.

	Mod_WM_DaySave = Wld_GetDay();

	Npc_SetRefuseTalk	(self, 360);

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_10))
	{
		Mod_WM_Boeden = 13;

		Wld_InsertItem	(ItMi_EffektMarker2, "FP_ITEM_ELENASTRUHE");

		Wld_InsertNpc	(Mod_7198_HEX_AttraktiveFrau_NW, "TAVERNE");
	};
};

INSTANCE Info_Mod_Saturas_AW_Member_10 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_10_Condition;
	information	= Info_Mod_Saturas_AW_Member_10_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na plaskowyzu pastwiskowym znajduja sie gigantyczne stworzenia (....) )";
};

FUNC INT Info_Mod_Saturas_AW_Member_10_Condition()
{
	if (Mod_WM_Boeden == 12)
	&& (Mod_WM_SawBigOne == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_10_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_10_15_00"); //Na pastwisku plaskowyzu znajduja sie gigantyczne stworzenia otoczone hordy mniejszych demonicznych istot, które wydaja sie byc stonowane.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_10_14_01"); //Dla Adano! Zgloszenia sa niezwykle niepokojace. Poniewaz równiez i te istoty zapewne beda mialy swojego mistrza......
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_10_14_02"); //Spróbuj sluchac w gospodarstwach wokól plaskowyzu. Naprawde potrzebujemy wiecej wskazówek.

	Mod_WM_DaySave = Wld_GetDay();

	Npc_SetRefuseTalk	(self, 360);

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_09))
	{
		Mod_WM_Boeden = 13;

		Wld_InsertItem	(ItMi_EffektMarker2, "FP_ITEM_ELENASTRUHE");

		Wld_InsertNpc	(Mod_7198_HEX_AttraktiveFrau_NW, "TAVERNE");
	};
};

INSTANCE Info_Mod_Saturas_AW_Member_11 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_11_Condition;
	information	= Info_Mod_Saturas_AW_Member_11_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_11_Condition()
{
	if (Mod_WM_Boeden == 13)
	&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_09))
	&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_10))
	&& ((Wld_GetDay() > Mod_WM_DaySave)
	|| (Npc_RefuseTalk(self) == FALSE))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_11_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_00"); //W naszych dochodzeniach stwierdzilismy cos bardzo niepokojacego. Zaskoczylo mnie to juz podczas sprzatania podlóg, ze powstalo tak malo stworzen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_01"); //Wyglada na to, ze jakas nieznana nam do tej pory moc, zarówno magia Beliara, jak i - co wyjasniloby sile tych stworzen - potega Inna wziela na siebie, zjednoczona i wykorzystala ja do tej ohydnej pracy.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_11_15_02"); //Co powinnismy teraz zrobic?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_03"); //Jak wspomniano powyzej, stworzenia te maja równiez swoich panów, którzy je tutaj nazywali.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_04"); //Aby sprawowac kontrole nad takimi poteznymi istotami, twórcy nie powinni od nich zbyt daleko oddalac sie.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_05"); //Posluchaj i przyjrzyj sie uwaznie plaskowyzu pastwiskowego i gospodarstwom rolnym. Musi byc jakas wskazówka.

	Mod_WM_Boeden = 14;
};

INSTANCE Info_Mod_Saturas_AW_Member_12 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_12_Condition;
	information	= Info_Mod_Saturas_AW_Member_12_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_12_Condition()
{
	if (Mod_WM_Verflucht == 1)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_12_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_12_14_00"); //Nie wygladasz tak dobrze. Wydaje sie, ze jest czarny cien na tobie.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_12_14_01"); //Najpierw udaj sie do klasztoru, zagoj sie w Pyrokar, a potem wróc do mnie, aby mi powiedziec, co sie wydarzylo.

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Saturas_AW_HexenTalk()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_00"); //Cóz, sa to magicznie utalentowane kobiety kojarzone z mrocznymi mocami.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_01"); //W przeciwienstwie do zwyklych demonicznych magów, którzy uzywaja tylko sily swojego boga Beliara, sa o wiele silniej zwiazani z sfera demoniczna.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_02"); //Pozostawili za soba istnienie zwyklych ludzi i zwiazali sie z demonicznymi silami.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_03"); //Stopien tego polaczenia zalezy od klanu czarownic.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_HexenTalk_15_04"); //Jest kilka klanów?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_05"); //Tak, niektóre zródla podaja informacje na ten temat.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_06"); //Podczas gdy niektórzy tylko sporadycznie uzywaja zaklecia metamorfozy, aby przeksztalcic swoja ludzka forme lub zadac obrazenia zwierzetom, inni wydaja znaczna czesc swojego istnienia w postaci, która nie odpowiada ludzkiej formie.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_07"); //Cecha wspólna ich wszystkich jest jednak to, ze przez dlugi czas moga oni zyc w sposób niewykrywalny wsród zwyklych ludzi, wplywac na nich, sprawowac nad nimi niemal calkowita kontrole przez krótki czas i rzucac obrazenia w ich otoczeniu.

	Mod_WM_Hexeninfos = 2;

	B_StartOtherRoutine	(Mod_7198_HEX_AttraktiveFrau_NW, "TOT");
};

INSTANCE Info_Mod_Saturas_AW_Member_13 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_13_Condition;
	information	= Info_Mod_Saturas_AW_Member_13_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dowiedzialem sie czegos.";
};

FUNC INT Info_Mod_Saturas_AW_Member_13_Condition()
{
	if (Mod_WM_Hexeninfos == 1)
	&& (Mod_WM_Verflucht == 0)
	&& (Mod_GenugBauernHinweise == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_13_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_13_15_00"); //Dowiedzialem sie czegos.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_13_14_01"); //Tak? Sprawozdania.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_13_15_02"); //Na Khorinis wydaja sie byc kobiety, które sa potezne mroczna magia. Mysle, ze to czarownice. Przynajmniej to wlasnie Pyrokar mial na mysli....
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_13_14_03"); //Czarownice? Dohorynu? To naprawde bardzo niepokojace.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_13_15_04"); //Jakie sa dokladnie rodzaje stworzen?

	Info_Mod_Saturas_AW_HexenTalk();

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Saturas_AW_Member_14 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_14_Condition;
	information	= Info_Mod_Saturas_AW_Member_14_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy mogliby byc odpowiedzialni za niedawna katastrofe?";
};

FUNC INT Info_Mod_Saturas_AW_Member_14_Condition()
{
	if (Mod_WM_Hexeninfos == 2)
	&& (Mod_WM_HexenTot == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_14_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_14_15_00"); //Czy mogliby byc odpowiedzialni za niedawna katastrofe?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_01"); //Hmm, trudno okreslic. Z jednej strony sa mistrzami w kontrolowaniu innych istot.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_02"); //Ale ze powinni tez byc w stanie stworzyc istoty takiej mocy? Nie wiem.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_03"); //Byloby to bardzo niezwykle we wszystkich okolicznosciach, poniewaz kontroluja one sferyczne przejawy we wlasciwosciach, ale zwykle w waskich granicach.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_04"); //Nalezy nadal prowadzic dochodzenia. Nadal musza byc pewne rzeczy, które do tej pory pozostawaly ukryte przed nami.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_05"); //Jesli jednak natkniemy sie na czarownice, zakonczenie ich dzialalnosci z pewnoscia nie byloby niekorzystna sytuacja.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_06"); //Ale wystrzegaj sie. Sa poteznymi, magicznymi istotami.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Satura nie byla pewna, czy czarownice sa odpowiedzialne za niedawna katastrofe. Odmawial jednak zakonczenia ich egzystencji, jesli je odszukalem.");
};

INSTANCE Info_Mod_Saturas_AW_Member_15 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_15_Condition;
	information	= Info_Mod_Saturas_AW_Member_15_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam nowe informacje.";
};

FUNC INT Info_Mod_Saturas_AW_Member_15_Condition()
{
	if (Mod_WM_Hexeninfos == 1)
	&& (Mod_WM_Verflucht == 0)
	&& (Mod_GenugBauernHinweise == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_15_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_00"); //Mam nowe informacje. Ostatnio wiele niezwyklych wydarzen wydarzylo sie w gospodarstwach rolnych.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_15_14_01"); //Tak? Sprawozdania.

	if (Npc_KnowsInfo(hero, Info_Mod_Rosi_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_02"); //Rosi narzekal na niekorzystne warunki pogodowe i gradobicie od poczatku sezonu.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Babera_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_03"); //Babera cierpi od jakiegos czasu na ciezkie bóle pleców.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Balthasar_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_04"); //Owce Balthazara sa chropowate.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Bobo_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_05"); //Bobo powiedzial mi, ze stado czarnych wilków mieszka w poblizu farmy od pewnego czasu.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Gunnar_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_06"); //Gunnar poinformowal o prysznicach gradowych, kwasnym mleku owczym i problemach zdrowotnych gospodarstwa w tym sezonie.
	};

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_15_14_07"); //Faktycznie tez owo nagromadzenie takich zdarzen jest bardzo podejrzane. Podejrzewa sie o czary.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_08"); //Czarownice? Jakie sa dokladnie rodzaje stworzen?

	Info_Mod_Saturas_AW_HexenTalk();

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Saturas_AW_Member_16 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_16_Condition;
	information	= Info_Mod_Saturas_AW_Member_16_Info;
	permanent	= 0;
	important	= 0;
	description	= "To bylo dla mnie dziwne.";
};

FUNC INT Info_Mod_Saturas_AW_Member_16_Condition()
{
	if (Mod_HasBerserkScroll == 1)
	&& (Npc_HasItems(hero, ItSc_AuraBerserker) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_16_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_16_15_00"); //To bylo dla mnie dziwne.

	B_GiveInvItems	(hero, self, ItSc_AuraBerserker, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_01"); //Pozwole sobie spojrzec. Hmm, takie role nie sa mi znane. Ale.... na chwile.....
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_02"); //Postacie na niej wydaja sie odpowiadac postaciom starej kultury.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_03"); //Niewiarygodne.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_16_15_04"); //Tak, co to jest?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_05"); //Jesli nie jestem wprowadzona w blad, to jest to rola utraconej kultury, która mozna wykorzystac do rzucenia poteznego czaru Aury.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_06"); //Moze to znacznie zwiekszyc nasza sile walki.....

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Saturas_AW_Member_17 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_17_Condition;
	information	= Info_Mod_Saturas_AW_Member_17_Info;
	permanent	= 0;
	important	= 0;
	description	= "Te role znalazlem tutaj.";
};

FUNC INT Info_Mod_Saturas_AW_Member_17_Condition()
{
	if (Mod_HasHexenScroll == 1)
	&& (Npc_HasItems(hero, ItSc_Verfluchen) > 0)
	&& (Npc_HasItems(hero, ItSc_TrfWoman) > 0)
	&& (Npc_HasItems(hero, ItSc_TrfWomanBack) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_17_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_17_15_00"); //Te role znalazlem tutaj.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_17_14_01"); //Pozwólcie mi widziec....

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_17_14_02"); //Hmm, ciekawe.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_17_15_03"); //A co z tym?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_17_14_04"); //Sa to typowe role czarownic, zaklecia obrazen i zaklecia transformacji.

	if (Mod_WM_Hexeninfos < 2)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_17_14_05"); //Jasne jest wiec, ze w okolicy sa czarownice.
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_17_15_06"); //Czarownice? Jakie sa dokladnie rodzaje stworzen?
	
		Info_Mod_Saturas_AW_HexenTalk();

		B_GivePlayerXP	(250);
	};
};

INSTANCE Info_Mod_Saturas_AW_Member_18 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_18_Condition;
	information	= Info_Mod_Saturas_AW_Member_18_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy moge zastosowac metamorfoze w jakikolwiek sposób?";
};

FUNC INT Info_Mod_Saturas_AW_Member_18_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_17))
	&& (Npc_HasItems(hero, ItSc_TrfWoman) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_18_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_18_15_00"); //Czy moge zastosowac metamorfoze w jakikolwiek sposób?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_18_14_01"); //Zglaszasz sie! Nie moge powiedziec, co by sie stalo, gdybys zastosowal u siebie zaklecie metamorfoza.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_18_14_02"); //Musisz najpierw zmodyfikowac proces aplikacji, poniewaz jest ona specjalnie dostosowana do kobiecych uzytkowników.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_18_15_03"); //Daloby mi to przewage nad czarownicami.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_18_14_04"); //Bardzo dobrze. Wlasciwie powinienes miec mozliwosc zastosowania efektu do siebie poprzez uzycie pustej runy do przeniesienia zaklecia na ciebie.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_18_14_05"); //Mam tylko nadzieje, ze nie robisz nic glupiego.
};

INSTANCE Info_Mod_Saturas_AW_Member_19 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_19_Condition;
	information	= Info_Mod_Saturas_AW_Member_19_Info;
	permanent	= 0;
	important	= 0;
	description	= "Moglem pokonac czarownice.";
};

FUNC INT Info_Mod_Saturas_AW_Member_19_Condition()
{
	if (Mod_WM_HexenTot == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_19_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_19_15_00"); //Moglem pokonac czarownice.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_01"); //To jest dobre, mniej zmartwienia. Moi szpiedzy powiedzieli mi, ze stworzenia rozproszyly sie - z wyjatkiem tych niedaleko Orlanu - ale nie stracily prawie nic w mocy.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_02"); //Oczywiste jest wiec, ze czarownice kontrolowaly tylko istoty, ale ich faktyczni twórcy nadal istnieja. Spróbuj dowiedziec sie wiecej.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_03"); //Ze pozbyles sie czarownic, byc moze wabiles twórców stworzen troche z ich okladki.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_04"); //Rozejrzyjmy sie wiec dookola po wskazówki.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_05"); //Byc moze uda sie znalezc cos w poblizu stworzen w Orlanie, poniewaz pozostaja one niezmienione gdzie sie znajdowaly.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_06"); //Trzeba znalezc autorów. Gdybyscie nie odniesli sukcesu, prawdopodobnie wszyscy bylibysmy skazani na zgube, poniewaz tylko moc dawno utraconych artefaktów boskich bylaby w stanie powstrzymac te potwory.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_19_15_07"); //Boskie artefakty?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_08"); //Tak, obiekty starozytnej mocy. Jednym z nich byl krysztal pochlaniania, który byl w stanie zawierac wyzwolone energie, które dostarczaja tym istotom ich mocy.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_09"); //Mówi sie, ze byly tam inne artefakty, a takze zaklecia na Khorninach, które podobno byly w stanie dostarczyc nosnikowi lub magikowi wielka moc, tworzac obezwladniajaca aure, a nawet dac czesc boskiej mocy.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_10"); //Ale te przedmioty, jak równiez wiedza o magii, od dawna uwazane sa za utracone.

	Mod_WM_ArtefaktSammler = 1;

	B_GivePlayerXP	(600);

	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Amulett))
	{
		B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Hmm, moze amulet przedluzacza pomoze nam w walce z bestiami.");
	};

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Wydaje sie, ze czarownice nie byly istotami prawdziwego stworzenia, ale tylko po to, aby sprawowac nad nimi kontrole, poniewaz te stworzenia rozrzucone zostaly po ich smierci, z wyjatkiem Orlanu. Moge wiec znalezc tam dalsze informacje. Satura mówila, ze po zniszczeniu czarownic powinienem miec teraz wieksza szanse na odnalezienie zródla zla.");
};

INSTANCE Info_Mod_Saturas_AW_Member_20 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_20_Condition;
	information	= Info_Mod_Saturas_AW_Member_20_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nauczylam sie, ze tak zwany kult krwi (....) )";
};

FUNC INT Info_Mod_Saturas_AW_Member_20_Condition()
{
	if (Mod_WM_Blutkultinfos == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_20_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_15_00"); //Dowiedzialem sie, ze tak zwany kult krwi powinien byc odpowiedzialny za pojawienie sie tych istot.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_01"); //Przez Adanosa kult krwi.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_15_02"); //Czym dokladnie jest kult krwi?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_03"); //Nie mozna tego powiedziec w kilku slowach. Jest to starozytne braterstwo, które wydaje sie istniec prawie tak dlugo, jak dlugo istnieja sami bogowie.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_04"); //Kiedy Innos, Adanos i Beliar wkroczyli na swiat, wybrala i stworzyla kazdego zastepce, który mial dzialac w ich woli, ale posiadal wlasne umysly i wole.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_05"); //Ale równiez te, obdarzone wielka wladza, znów wybraly sluzbe, tak aby na przestrzeni wieków rozwijaly sie cale sieci zwiazków róznych stworzen.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_06"); //Niektórzy z nich równiez nie byli zadowoleni ze srodków, które im dali przez bóstwo i zaczeli uzywac wladzy innych bogów.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_07"); //Inni zaczeli realizowac wlasne interesy. Kult krwi jednak, jak sie wydaje, nigdy nie stal w zadnej relacji z którymkolwiek z trzech bóstw.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_15_08"); //A skad sie biora?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_09"); //Sa one pasozytniczymi istotami, które nie sluza Bogu i moga pochlaniac i wiazac kazda uwalniana energie.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_10"); //Wydaje sie, ze sa one zwiazane z istotami zwanymi wampirami, ale pochlaniaja cala energie martwych istot.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_15_11"); //Jak to mozliwe, ze tak dlugo pozostawaly nieodkryte?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_12"); //Moga odpoczac ukryte pod ziemia przez dziesiatki lat, dopóki nie odczuja szoku równowagi i nie zobacza swojej szansy.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_13"); //Zawsze staraja sie oni o zaklócenie tej równowagi, bowiem bez wzgledu na to czy Innos czy Beliar zwyciezy, wiele istot zawsze bedzie w wyniku tego zawsze niszczonych, co powoduje wzrost ich mocy.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_14"); //Sa wiec naszymi naturalnymi przeciwnikami i atakowaliby Cie natychmiast, gdyby uznali cie za sluge Adanosa.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_15"); //Stwory, które teraz wyslali, obdarzeni potega obu bóstw, Innosa i Beliara, nie bedziemy w stanie latwo wygnac.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_16"); //Musisz, jesli to mozliwe, znalezc korzen zla, kult krwi i zniszczyc je wszystkie.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Saturas potwierdzil, ze kult krwi jest prawdopodobnie odpowiedzialny za wyglad istot. Mialem wysledzic i zniszczyc jego zwolenników.");

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_20);

	Info_AddChoice	(Info_Mod_Saturas_AW_Member_20, "Bede na drodze do pozbycia sie pasjonatów.", Info_Mod_Saturas_AW_Member_20_A);
};

FUNC VOID Info_Mod_Saturas_AW_Member_20_A()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_A_15_00"); //Bede na drodze do pozbycia sie pasjonatów.

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_20);
};

INSTANCE Info_Mod_Saturas_AW_Member_21 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_21_Condition;
	information	= Info_Mod_Saturas_AW_Member_21_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy nie mozna przywrócic potegi krysztalu?";
};

FUNC INT Info_Mod_Saturas_AW_Member_21_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_19))
	&& (Mod_WM_ArtefaktSammler == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_21_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_21_15_00"); //Czy nie mozna przywrócic potegi krysztalu?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_21_14_01"); //Obawiam sie, ze brakuje nam srodków. Tylko boski poslannik móglby to uczynic.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_21_14_02"); //Sprawdz to z Cronos. On moze ci powiedziec wiecej na ten temat.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Slyszalem od Saturasa, ze krysztal pochlaniania bylby w stanie ograniczyc moc istot, gdybys oddal jej swoja moc. Cronos moze mi o tym opowiedziec wiecej.");
};

INSTANCE Info_Mod_Saturas_AW_Member_22 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_22_Condition;
	information	= Info_Mod_Saturas_AW_Member_22_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam ten amulet tutaj.";
};

FUNC INT Info_Mod_Saturas_AW_Member_22_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_21))
	&& (Mod_WM_ArtefaktSammler == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Albert_Hexen))
	&& (Npc_HasItems(hero, ItAm_MegaAmulett2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_22_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_22_15_00"); //Mam ten amulet tutaj.

	B_GiveInvItems	(hero, self, ItAm_MegaAmulett2, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_22_14_01"); //Bardzo ciekawy. Ten amulet zdaje sie byc starozytna potega. Przypomina mi to artefakt z ukradzionej nam jakis czas temu ksiazki.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_22_15_02"); //Artefakt zostal Ci skradziony?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_22_14_03"); //Nie, mam na mysli ksiazke. Niektórzy zloczyncy beztrosko wykorzystali nasze pisma. Niech Adanos go ukarze. Ale.... gdzie bylem wlasnie teraz..... Oh, amulet. (spójrz na to)
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_22_14_04"); //Faktycznie, fantastyczne, jesli moja pamiec nie zwodzi mnie, amulet ten ma moc rozciagajaca efekt kazdego zaklecia, jakie nosiciel rzuca na niego wszystkim swoim przyjaciolom. Wydajne narzedzie....

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Saturas_AW_Member_23 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_23_Condition;
	information	= Info_Mod_Saturas_AW_Member_23_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co mozesz mi powiedziec o tej runie?";
};

FUNC INT Info_Mod_Saturas_AW_Member_23_Condition()
{
	if (Mod_WM_HasRune == 1)
	&& (Npc_HasItems(hero, ItRu_Kontrolle) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_23_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_23_15_00"); //Co mozesz mi powiedziec o tej runie?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_01"); //Hmm, prosze pozwolic mi zobaczyc.... Z Adanosem....
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_23_15_02"); //Tak, co z tym?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_03"); //Jest to runa sterujaca, która ma funkcje utrzymywania telepatycznego i energicznego kontaktu z poteznymi istotami sluzacymi na dlugich dystansach - dosyc kilkaset metrów.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_04"); //Jest on równiez uzywany do wzajemnego rozpoznawania istot i zapobiega atakowaniu sie nawzajem istot noszacych ta rune.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_05"); //Moge bezpiecznie zalozyc, ze oderwales ja od jednego z wyzszych stworzen, które zniszczyly srodowisko.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_23_15_06"); //Tak, to prawda.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_07"); //Doskonaly, moze ten element pomoze Ci w wyszukiwaniu.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_08"); //Spróbuj zastosowac je przed uderzeniem stworzenia.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Saturas wierzy, ze runa powstrzymalaby je przed wzajemnym atakiem. Gdybym jej uzywala, moglaby mi pomóc znalezc winowajców.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Saturas_AW_Member_24 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_24_Condition;
	information	= Info_Mod_Saturas_AW_Member_24_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_24_Condition()
{
	if (Mod_WM_HexenTot == 1)
	&& (Mod_WM_Hexeninfos < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_24_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_24_14_01"); //Moi szpiedzy zapytali o gospodarstwa rolne, a wniosek jest oczywisty, ze w okolicy sa czarownice.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_24_15_00"); //Czarownice? Jakie sa dokladnie rodzaje stworzen?
	
	Info_Mod_Saturas_AW_HexenTalk();
};

INSTANCE Info_Mod_Saturas_AW_Member_25 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_25_Condition;
	information	= Info_Mod_Saturas_AW_Member_25_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kult krwi byl raz na jakis czas. Zniszczylem ich wszystkich.";
};

FUNC INT Info_Mod_Saturas_AW_Member_25_Condition()
{
	if (Mod_WM_BlutkultTot == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_25_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_25_15_00"); //Kult krwi byl raz na jakis czas. Zniszczylem ich wszystkich.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_01"); //Czy tak jest? To wspaniala wiadomosc. Niech to zlo bedzie wykorzenione na zawsze z powierzchni ziemi. Zrobiliscie nam Panstwo usluge o nieocenionej wartosci.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_02"); //Tak czy inaczej, stworzenia na wierzbowym plaskowyzu powinny byc teraz tak oslabione po smierci ich twórców, ze mozemy wystawic atak zjednoczonymi silami.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_03"); //Cronos wyjedzie z kilkoma wojownikami wodnymi i czeka na Ciebie w tawernie Orlanu.

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_22))
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_04"); //On ma amulet, który nam dales i uzyje go w walce.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_16))
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_05"); //On ma ten zaklecie, którego nam dales, a on uzyje go w bitwie.
	};

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_06"); //Wciaz mozesz spróbowac zmobilizowac naszych wspólbraci w miescie. Niech Adanos zapewni Ci bezpieczenstwo.
	
	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Wydaje sie, ze nadszedl moment, aby uderzyc przeciwko potworom na plaskowyzu pastwiskowym. Cronos i niektórzy wojownicy wodni czekaja na mnie w Orlanie.");

	B_GivePlayerXP	(1000);

	Mod_WM_HexenTot = 2;

	Mod_WM_CronosAttack = 1;

	B_StartOtherRoutine	(Mod_1538_WKR_Wasserkrieger_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1530_WKR_Everaldo_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1539_WKR_Wasserkrieger_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1533_WKR_Salvador_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1537_WKR_Vanas_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1536_WKR_Roka_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1535_WKR_Wasserkrieger_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1534_WKR_Wasserkrieger_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1532_HTR_Ethan_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_758_KDW_Cronos_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_588_WNOV_Joe_NW, "SAMMELN");
};

INSTANCE Info_Mod_Saturas_AW_Member_26 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_26_Condition;
	information	= Info_Mod_Saturas_AW_Member_26_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_26_Condition()
{
	if (Mod_WM_CronosAttack >= 3)
	&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_25))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_Info()
{			
	B_StartOtherRoutine	(Mod_763_NONE_Gaan_NW, "PRESTART");
	B_StartOtherRoutine	(Mod_4026_NONE_Kuno_NW, "START");
	
	if (Mod_WM_CronosAttack == 3)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_00"); //Niewiarygodne. Zagrozenie to jest rzeczywiscie wyeliminowane. Przeciwstawiales potwory i potwory i smiales je.
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_01"); //Nawet wasze dzialania w wyszukiwaniu ostrosci znikaja na tle tego osiagniecia.
	}
	else if (Mod_WM_CronosAttack == 4)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_02"); //Niewiarygodny, slyszalem, jak cie pokonales stworzenia tylko na plaskowyzu.
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_03"); //Zdumiewajace, choc musze cie winic za te niepotrzebne ryzyko.
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_04"); //Motywem przewodnim nie powinna byc slepa próznosc, zwazywszy na niebezpieczenstwo, które zawisa nad wszystkim.
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_05"); //Stawka jest zbyt wysoka. Nie zapominaj o tym....
	};

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_06"); //Tutaj wez to zloto.

	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_07"); //Oczywiscie, nie moze ona przewazyc nad Twoimi dzialaniami. Dlatego pas naszego Pana Adanosa, który jest opisany w tym podreczniku, powinien przyozdobic Twoje cialo.

	B_GiveInvItems	(self, hero, ItWr_Bauplan_AdanosBelt, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_08"); //Mozna równiez wybrac jeden z ponizszych elementów.

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_26);

	Info_AddChoice	(Info_Mod_Saturas_AW_Member_26, "Dwóch wladców Deszcz lodowy", Info_Mod_Saturas_AW_Member_26_D);
	Info_AddChoice	(Info_Mod_Saturas_AW_Member_26, "bordo", Info_Mod_Saturas_AW_Member_26_C);
	Info_AddChoice	(Info_Mod_Saturas_AW_Member_26, "eliksir spirytusu", Info_Mod_Saturas_AW_Member_26_B);
	Info_AddChoice	(Info_Mod_Saturas_AW_Member_26, "poszerzanie wiedzy", Info_Mod_Saturas_AW_Member_26_A);
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_E()
{
	var int Mod_WM_NewTruppen;
	Mod_WM_NewTruppen = 10 - (Mod_WM_Truppe_01 + Mod_WM_Truppe_02 + Mod_WM_Truppe_03 + Mod_WM_Truppe_04 + Mod_WM_Truppe_05 + Mod_WM_Truppe_06 + Mod_WM_Truppe_07 + Mod_WM_Truppe_08 + Mod_WM_Truppe_09 + Mod_WM_Truppe_10);

	if (Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
	{
		if (Mod_WM_NewTruppen == 0)
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_00"); //Powiedz:"Gdzie sa nasi wspólbracia, którzy staneli po waszej stronie w walce?
			AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_26_E_15_01"); //Um, no..... Obawiam sie, ze wszyscy upadli.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_02"); //Co? Oni wszyscy umarli! Adanos naprawde wystawia nas na próbe.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_03"); //Tak, równowaga jest wielkim dobrem, które niestety czasami wymaga poswiecenia.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_04"); //Lecz po utracie tak wielu naszych szanownych wspólbraci potrzeba duzo czasu.

			B_GivePlayerXP	(1000);
		}
		else if (Mod_WM_TruppenLeft == Mod_WM_NewTruppen)
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_05"); //Równie przyjemne jak niszczenie bestii jest to, ze kazdy z twoich towarzyszy broni wrócil bez obrazen.

			B_GivePlayerXP	(4000);

			hero.attribute[ATR_MANA_MAX] += 10;
			hero.attribute[ATR_MANA] += 10;

			PrintScreen	("Mana + 10", -1, -1, FONT_SCREEN, 2);
		}
		else if ((Mod_WM_TruppenLeft-4) < Mod_WM_NewTruppen)
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_06"); //Z drugiej strony, smutno mi jednak, ze wsród naszych wspólbraci, choc niewielu, byli umarli.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_07"); //Badzmy zawsze swiadomi tego, ze równowaga jest wielkim dobrem i jej zachowanie wymaga niestety czasami poswiecen.

			B_GivePlayerXP	(3000);

			hero.attribute[ATR_MANA_MAX] += 5;
			hero.attribute[ATR_MANA] += 5;

			PrintScreen	("Mana + 5", -1, -1, FONT_SCREEN, 2);
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_08"); //Przejscie wielu wspólbraci w walce z potwornymi potworami jest jednak niezwykle smutne. Bedzie juz na dlugo zanim nasza spolecznosc odzyska zdrowie.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_07"); //Badzmy zawsze swiadomi tego, ze równowaga jest wielkim dobrem i jej zachowanie wymaga niestety czasami poswiecen.

			B_GivePlayerXP	(2000);

			hero.attribute[ATR_MANA_MAX] += 2;
			hero.attribute[ATR_MANA] += 2;

			PrintScreen	("Mana + 2", -1, -1, FONT_SCREEN, 2);
		};
	};

	if (Mod_WM_NewTruppen > 0)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_09"); //Niech blogoslawienstwo naszego Pana Adanosa bedzie z wami na zawsze.
	};

	if (!Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
	{
		B_GivePlayerXP	(5000);

		hero.attribute[ATR_MANA_MAX] += 10;
		hero.attribute[ATR_MANA] += 10;

		if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_22))
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_11"); //Ah tak, tutaj masz z powrotem amulet. Bylo to dla nas bardzo korzystne. Ogladalem sie troche wiecej. Bardzo ciekawy utwór....

			B_GiveInvItems	(self, hero, ItAm_MegaAmulett2, 1);
		};
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_22))
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_12"); //Cóz, tu masz jeszcze amulet z powrotem, który Cronos niósl z nim na plaskowyzu. Ogladalem sie troche wiecej. Bardzo ciekawy utwór....

			B_GiveInvItems	(self, hero, ItAm_MegaAmulett2, 1);
		};
	};

	if (Mod_HSWM_RatProblem == 1)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_10"); //Zwróce sie teraz do Rady.

		B_StartOtherRoutine	(self, "RAT");
		B_StartOtherRoutine	(Mod_527_SLD_Torlof_NW, "RAT");

		Mod_HSWM_RatProblem = 0;
	};

	Mod_WM_UnheilFertig_Day = Wld_GetDay();
	Mod_WM_UnheilFertig = 1;

	Mod_BengarsHofLeer = 1;

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_UNHEIL, LOG_SUCCESS);

	Mod_TillChange = 1;

	Mod_TillChange_Day = Wld_GetDay();

	B_Göttergefallen(2, 1);

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_26);
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_D()
{
	B_GiveInvItems	(self, hero, ItSc_IceRain, 2);

	Info_Mod_Saturas_AW_Member_26_E();
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_C()
{
	B_GiveInvItems	(self, hero, ItRu_Thunderball, 1);

	Info_Mod_Saturas_AW_Member_26_E();
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_B()
{
	B_GiveInvItems	(self, hero, ItPo_Geist, 1);

	Info_Mod_Saturas_AW_Member_26_E();
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_A()
{
	B_GiveInvItems	(self, hero, ItPo_Wissen, 1);

	Info_Mod_Saturas_AW_Member_26_E();
};

INSTANCE Info_Mod_Saturas_AW_Member_27 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_27_Condition;
	information	= Info_Mod_Saturas_AW_Member_27_Info;
	permanent	= 0;
	important	= 0;
	description	= "Krysztal odzyskal swoja pierwotna moc.";
};

FUNC INT Info_Mod_Saturas_AW_Member_27_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AdanosDog_Kristall))
	&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_27_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_27_15_00"); //Krysztal odzyskal swoja pierwotna moc.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_01"); //Niewiarygodny! Tak, czuje, ze jest przenikniety boska moca.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_02"); //Czyniac to, nie tylko uczyniles nasza wspólnote wspaniala sluzba, ale takze dales nam narzedzie do zapewnienia zachowania równowagi.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_03"); //Bedzie on równiez w stanie powstrzymac zagrozenie na plaskowyzu pastwiskowym i uchronic cale Khorinis od ciezkiego losu.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_04"); //Teraz powinien on oslabic potwory do tego stopnia, ze mozemy odwazyc sie zaatakowac zjednoczonymi silami.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_05"); //Tak, czuje, jak krysztal moze nawet pozostawic swój efekt na tak duzym dystansie.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_06"); //Cronos wezmie go i uzyje na plaskowyzu, gdzie bedzie czekal na ciebie z wojownikami. Czas raz na zawsze wykorzenic to zlo.

	B_GivePlayerXP	(1000);
};

INSTANCE Info_Mod_Saturas_AW_Member_28 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_28_Condition;
	information	= Info_Mod_Saturas_AW_Member_28_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto krysztal.";
};

FUNC INT Info_Mod_Saturas_AW_Member_28_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
	&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_28_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_28_15_00"); //Oto krysztal.

	B_GiveInvItems	(hero, self, ItMi_AbsorbKristall2, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_28_14_01"); //Trudno uwierzyc, ze narzedzie Adanosa jest teraz w rekach naszej spolecznosci.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_28_14_02"); //Niech blogoslawienstwo naszego Pana bedzie wam towarzyszylo na wszystkich waszych drogach.

	B_GivePlayerXP	(1500);

	hero.attribute[ATR_MANA_MAX] += 5;
	hero.attribute[ATR_MANA] += 5;
};

INSTANCE Info_Mod_Saturas_AW_KhorataPlage_01 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_KhorataPlage_01_Condition;
	information	= Info_Mod_Saturas_AW_KhorataPlage_01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_KhorataPlage_01_Condition()
{
	if (Wld_GetDay()-2 > Mod_WM_UnheilFertig_Day)
	&& (Mod_WM_UnheilFertig == 1)
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_KhorataPlage_01_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_00"); //Ogromne niebezpieczenstwo, jakie grozilo Khorinisowi, zostalo wygnane. Nadal jednak zdarzaja sie incydenty i doniesienia, które wymagaja naszej uwagi.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_01"); //Prosba, która teraz wam powierzam, ma miejsce na pólnocy, w czesci wyspy zwanej Relendel. Slyszales o tym?
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_01_15_02"); //Teah, ostatnia, ale nie tylko w poszukiwaniu fragmentów, stracilem droge.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_03"); //Cóz, przynajmniej Twoja wiedza na ten temat sprawia, ze wszystko jest nieco latwiejsze.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_04"); //Mówiac konkretnie: slyszalem o plagach, które ostatnio spustoszyly Relendel.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_05"); //Dopóki przyczyny lub twórcy calej rzeczy nie sa znani, dopóty istnieja powody do niepokoju.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_01_15_06"); //Jakie sa to plagi?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_07"); //Istoty, które wielu ludzi nazywalo szkodnikami, królikami, szczurami, owadami.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_08"); //Jako magicy wody i opiekunowie równowagi wiemy oczywiscie, ze oni równiez maja swoje miejsce w strukturze swiata.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_09"); //Jednak nagle wzrosty ludnosci sa czyms wiecej niz niezwyklym.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_01_15_10"); //Ale to brzmi bardziej jak temat dla Rangerów.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_11"); //Nie, istnieja powody, aby sadzic, ze nie sa one pochodzenia naturalnego, ze kryje sie za nimi magia, wiec do nas nalezy zbadanie tej sprawy.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_01_15_12"); //Wszystko w porzadku, wtedy bede na drodze.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_13"); //Dzieki. Niech Adanos pójdzie z wami.

	Log_CreateTopic	(TOPIC_MOD_ADANOS_PLAGE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ADANOS_PLAGE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ADANOS_PLAGE, "Satura dala mi tym razem zadanie zbadania jakichs plag w Relendel. Mówi sie, ze wszystkie rodzaje osadów zwierzecych - szczury, króliki, owady - rozmnazaly sie tam w nienaturalnym tempie.");
};

INSTANCE Info_Mod_Saturas_AW_KhorataPlage_02 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_KhorataPlage_02_Condition;
	information	= Info_Mod_Saturas_AW_KhorataPlage_02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dowiedzialem sie, jakie sa plagi.";
};

FUNC INT Info_Mod_Saturas_AW_KhorataPlage_02_Condition()
{
	if (Mod_WM_UnheilFertig == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_KhorataPlage_02_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_00"); //Dowiedzialem sie, jakie sa plagi.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_02_14_01"); //Tak, sprawozdanie.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_02"); //Wszystkie one maja rózne pochodzenie.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_03"); //Szczury pochodza z rasy szczurów z lodowiska.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_04"); //Magicy demonów trzymaja palce w dzumie króliczej. Badaja zaklecia zarazy.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_05"); //I wizytacja owadów w ostatniej inwazji opiera sie na boskim przeklenstwie.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_02_14_06"); //(promieniowany) Niewiarygodny! To, co musicie zglaszac, nie tylko rozwiewa moje obawy o zla moc, która moze sie kryc za tym wszystkim.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_02_14_07"); //Reprezentuje on równiez prawdziwy skarb wiedzy, który poszerza nasze zrozumienie poprzez stworzenie Adanosa......
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_02_14_08"); //Tutaj wez te magiczne artefakty jako podziekowanie. Niech zawsze spocznie na tobie blogoslawienstwo Adano.

	B_ShowGivenThings	("6 eliksirów, kamien runowy, 5 wladców i serce lodu zachowanego na ziemi.");

	CreateInvItems	(hero, ItPo_Geist, 1);
	CreateInvItems	(hero, ItPo_Mana_03, 5);
	CreateInvItems	(hero, ItMi_Runeblank, 1);
	CreateInvItems	(hero, ItSc_Thunderstorm, 3);
	CreateInvItems	(hero, ItSc_IceRain, 2);
	CreateInvItems	(hero, ItAt_IceGolemHeart, 1);

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_PLAGE, LOG_SUCCESS);

	B_GivePlayerXP	(800);

	B_Göttergefallen (2, 2);
};

INSTANCE Info_Mod_Saturas_NW_JGScroll (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_JGScroll_Condition;
	information	= Info_Mod_Saturas_NW_JGScroll_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam tutaj czesc i wiadomosc, której nie moge przeczytac.";
};

FUNC INT Info_Mod_Saturas_NW_JGScroll_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Key2))
	&& (Npc_HasItems(hero, ItWr_TruhenNotizJG) == 1)
	&& (Npc_HasItems(hero, ItWr_TruhenScrollJG) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_JGScroll_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_JGScroll_15_00"); //Mam tutaj czesc i wiadomosc, której nie moge przeczytac.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_JGScroll_14_01"); //Pozwole sobie to zobaczyc.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Saturas_NW_JGScroll_14_02"); //Ah tak. Stare pismo odreczne. Zapytaj Riordiana, specjalizuje sie w nim.
};

INSTANCE Info_Mod_Saturas_NW_Rasend (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Rasend_Condition;
	information	= Info_Mod_Saturas_NW_Rasend_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Rasend_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daron_Rasend))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Rasend_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_00"); //
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend_15_01"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_02"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_03"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_04"); //
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend_15_05"); //
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend_15_06"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_07"); //
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend_15_08"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_09"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_10"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_11"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_12"); //

	B_LogEntry	(TOPIC_MOD_ADANOS_RASEND, "Równiez miejsce wykopaliska nie zostalo ocalone przed atakami demonów. Nastepnie udal sie do Relendel. Saturas poradzil mi odwiedzic Xardas, aby dowiedziec sie wiecej o tej zlowieszczej istocie.");
};

INSTANCE Info_Mod_Saturas_NW_Rasend02 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Rasend02_Condition;
	information	= Info_Mod_Saturas_NW_Rasend02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Rasend02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Shivar_DemonsDead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Rasend02_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_00"); //Moge wyczuwac, ze niebezpieczenstwo zostalo zazegnane i ze pojawia sie tu nieuszkodzony, daje mi potwierdzenie.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_01"); //Jak udalo ci sie to zrobic ponownie?
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend02_15_02"); //Mysle, ze nie chcesz wiedziec....
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_03"); //W kazdym razie po raz kolejny wykonales bezcenna usluge dla calego Khorini.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_04"); //Nie ma watpliwosci, ze jestes wybrany na jednego z najwyzszych dostojników wsród slug Adano.

	if (Mod_Gilde == 10)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_05"); //Czy czujesz sie gotów sluzyc spolecznosci lokalnej jako sedzia wody?
		AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend02_15_06"); //Tak, chce byc sedzia wody.
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_07"); //Nastepnie wezcie te szate i blogoslawienstwo Adano.
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_08"); //Niech w twojej pracy zachowa sie równowaga.

		CreateInvItems	(self, ITAR_KDW_H, 1);
		B_GiveInvItems	(self, hero, ITAR_KDW_H, 1);

		Snd_Play ("LEVELUP");

		B_GivePlayerXP	(1000);

		B_Göttergefallen(2, 5);

		Mod_Gilde = 11;
	}
	else if (Mod_Gilde == 17)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_09"); //Dlaczego od razu nie zobaczysz Ethana?

		B_GivePlayerXP	(600);
	};

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_RASEND, LOG_SUCCESS);
};

INSTANCE Info_Mod_Saturas_NW_Sweetwater (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Sweetwater_Condition;
	information	= Info_Mod_Saturas_NW_Sweetwater_Info;
	permanent	= 0;
	important	= 0;
	description	= "Potrzebujesz mojej pomocy?";
};

FUNC INT Info_Mod_Saturas_NW_Sweetwater_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Sweetwater))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Sweetwater_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater_15_00"); //Potrzebujesz mojej pomocy?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater_14_01"); //Tak. Nie znalbym nikogo innego.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater_15_02"); //A zatem wszystko w porzadku. Co sie dzieje?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater_14_03"); //Piraci potrzebuja wsparcia. Dobry mysliwy. Czyz nie jestescie?
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater_15_04"); //To wystarczy. Zostalem nawet mianowany straznikiem.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater_14_05"); //Wydaje mi sie, ze to wlasciwy czlowiek. Teraz zajmij sie tym. Zglaszanie sie do piratów.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater_15_06"); //Jestem na drodze.

	B_LogEntry	(TOPIC_MOD_JG_SWEETWATER, "Saturas wysyla mnie do piratów. Zobaczmy, co musza dla mnie zrobic......");
};

INSTANCE Info_Mod_Saturas_NW_Sweetwater2 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Sweetwater2_Condition;
	information	= Info_Mod_Saturas_NW_Sweetwater2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Sweetwater2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AlligatorJack_Sweetwater2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Sweetwater2_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater2_14_00"); //Co sie dzieje?
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater2_15_01"); //Mieli na jeziorze plage aligatora. To juz sie stalo.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater2_14_02"); //Nie spodziewalem sie czegos innego. Daje Vatrasom znac. Jestem pewien, ze nadal jestes zajety Minentalem.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater2_15_03"); //Mozna to powiedziec. Do zobaczenia pózniej.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater2_14_04"); //Adanos jest z wami.

	B_SetTopicStatus	(TOPIC_MOD_JG_SWEETWATER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Saturas_PMSchulden (C_INFO)
{
	npc         	= Mod_774_KDW_Saturas_NW;
	nr          	= 1;
	condition   	= Info_Mod_Saturas_PMSchulden_Condition;
	information 	= Info_Mod_Saturas_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Saturas_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Saturas_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Saturas_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Saturas_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_00"); //Czy przyszedles/as zaplacic grzywne?

	if (B_GetTotalPetzCounter(self) > Saturas_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_01"); //Zastanawialem sie, czy nawet nie osmieliscie sie tu przyjechac!
		AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_02"); //Najwyrazniej nie sa to ostatnie oskarzenia!

		if (Saturas_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_03"); //Ostrzegam cie! Grzywna, która musisz zaplacic jest teraz wyzsza!
			AI_Output (hero, self, "Info_Mod_Saturas_PMAdd_15_00"); //Ile?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Saturas_LastPetzCounter);
		
			if (diff > 0)
			{
				Saturas_Schulden = Saturas_Schulden + (diff * 50);
			};
		
			if (Saturas_Schulden > 1000)	{	Saturas_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Saturas_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_04"); //Zapusciles mnie tak zle!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Saturas_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_05"); //Pojawily sie nowe rzeczy.
		
		if (Saturas_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_06"); //Nagle nie ma juz nikogo, kto oskarzalby cie o morderstwo.
		};
		
		if (Saturas_LastPetzCrime == CRIME_THEFT)
		|| ( (Saturas_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_07"); //Nikt nie pamieta, ze widzisz sie przy kradziezy.
		};
		
		if (Saturas_LastPetzCrime == CRIME_ATTACK)
		|| ( (Saturas_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_08"); //Nie ma juz zadnych swiadków tego, ze kiedykolwiek walczyles.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_09"); //Widocznie wszystkie zarzuty przeciwko Tobie zniknely.
		};
		
		AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_10"); //Nie wiem, co sie stalo, ale ostrzegam: nie graj ze mna.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_11"); //Zrezygnowalem z waszego zadluzenia.
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_12"); //Upewnij sie, ze nie popadniesz ponownie w klopoty.
	
			Saturas_Schulden			= 0;
			Saturas_LastPetzCounter 	= 0;
			Saturas_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_13"); //Jedno jest pewne: nadal trzeba zaplacic kare w calosci.
			B_Say_Gold (self, hero, Saturas_Schulden);
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_14"); //Co to jest?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Saturas_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Saturas_PETZMASTER);
		Info_AddChoice		(Info_Mod_Saturas_PMSchulden,"Nie mam wystarczajaco duzo zlota!",Info_Mod_Saturas_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Saturas_PMSchulden,"Ile to znów bylo?",Info_Mod_Saturas_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Saturas_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Saturas_PMSchulden,"Chce zaplacic grzywne.",Info_Mod_Saturas_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Saturas_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Saturas_PMSchulden_HowMuchAgain_15_00"); //Ile to znów bylo?
	B_Say_Gold (self, hero, Saturas_Schulden);

	Info_ClearChoices  	(Info_Mod_Saturas_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Saturas_PETZMASTER);
	Info_AddChoice		(Info_Mod_Saturas_PMSchulden,"Nie mam wystarczajaco duzo zlota!",Info_Mod_Saturas_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Saturas_PMSchulden,"Ile to znów bylo?",Info_Mod_Saturas_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Saturas_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Saturas_PMSchulden,"Chce zaplacic grzywne.",Info_Mod_Saturas_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Saturas_PETZMASTER   (C_INFO)
{
	npc         	= Mod_774_KDW_Saturas_NW;
	nr          	= 1;
	condition   	= Info_Mod_Saturas_PETZMASTER_Condition;
	information 	= Info_Mod_Saturas_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Saturas_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Saturas_PETZMASTER_Info()
{
	Saturas_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_01"); //Ciesze sie, ze przyszedles do mnie, zanim sytuacja sie pogorszyla.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_02"); //Morderstwo jest powaznym wykroczeniem!

		Saturas_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Saturas_Schulden = Saturas_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_03"); //Nie wspominajac o innych rzeczach, które zrobiles.
		};

		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_06"); //Nie interesuje mnie to, ze moge panstwa umiescic na szubienicy. Jestesmy na wojnie i potrzebujemy kazdego czlowieka, którego mozemy dostac.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_07"); //Ale nie bedzie latwo sprawic, by ludzie znów byli laskawi.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_08"); //Mozesz okazac swoja pokute placac grzywne - oczywiscie kara musi byc odpowiednia.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_09"); //Dobrze! Jestes oskarzony o kradziez! Sa swiadkowie!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_10"); //Nie chce nawet mówic o innych rzeczach, które slyszalem.
		};

		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_11"); //Nie bede tolerowal takiego zachowania w naszym kraju!
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_12"); //Bedziesz musial zaplacic grzywne za swoje przestepstwo!
		
		Saturas_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_13"); //Jesli walczysz z riffem w porcie, to jest jedna rzecz....
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_14"); //Ale jesli zaatakujesz naszych ludzi, bede musial Cie pociagnac do odpowiedzialnosci.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_15"); //I nie sadze, aby tak bylo w przypadku owiec.
		};

		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_16"); //Jesli pozwole wam sie z tym uporac, wszyscy beda robic to, co chca.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_17"); //Placi sie wiec odpowiednia grzywne - a cala sprawa zostanie zapomniana.
		
		Saturas_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_18"); //Slyszalem, ze balaganiles sie z naszymi owcami.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_19"); //Zdajesz sobie sprawe, ze nie moge tego przepuscic.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_20"); //Bedziesz musial wyplacic odszkodowanie!
		
		Saturas_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Saturas_PETZMASTER_15_21"); //Ile?
	
	if (Saturas_Schulden > 1000)	{	Saturas_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Saturas_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Saturas_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Saturas_PETZMASTER);
	Info_AddChoice		(Info_Mod_Saturas_PETZMASTER,"Nie mam wystarczajaco duzo zlota!",Info_Mod_Saturas_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Saturas_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Saturas_PETZMASTER,"Chce zaplacic grzywne.",Info_Mod_Saturas_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Saturas_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Saturas_PETZMASTER_PayNow_15_00"); //Chce zaplacic grzywne!
	B_GiveInvItems (hero, self, itmi_gold, Saturas_Schulden);
	AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_PayNow_14_01"); //Dobrze! Doloze wszelkich staran, aby kazdy z nas sie o tym dowiedzial - wiec Twoja reputacja zostanie w rozsadny sposób przywrócona.

	B_GrantAbsolution (LOC_WMCAMP);
	
	Saturas_Schulden			= 0;
	Saturas_LastPetzCounter 	= 0;
	Saturas_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Saturas_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Saturas_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Saturas_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Saturas_PETZMASTER_PayLater_15_00"); //Nie mam wystarczajaco duzo zlota!
	AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_PayLater_14_01"); //Nastepnie zobacz, ze zloto dostaniesz jak najszybciej.
	AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_PayLater_14_02"); //I ostrzegam cie, ze jesli cokolwiek zawdzieczasz sobie, to bedzie ci gorzej.
	
	Saturas_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Saturas_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Saturas_NW_EXIT (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_EXIT_Condition;
	information	= Info_Mod_Saturas_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Saturas_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Saturas_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
