// *************************
// Globalvariablen für Story
// *************************

// Vampir
var int Effekt_An;
var int Effekt_Einmal;
var int Vampir_Counter;
var int Inportal;
var int Blood;
var int Mod_PlayerIstVampir;
var int Mod_HeroIstInRaum;
var int SchutzVorSonne;

// Tränke brauen

var int Mod_TrankFirstStep;
var int Mod_TrankSecondStep;
var int Mod_TrankThirdStep;
var int Mod_Darf_Health_01;
var int Mod_Darf_Mana_01;
var int Mod_Darf_Speed;
var int Mod_Darf_PermHealth;
var int Mod_Count_Health_01;
var int Mod_Count_Mana_01;
var int Mod_Count_Speed;
var int Mod_Count_PermHealth;
var int Mod_PermHealth_Day;
var int Mod_PermHealth_Zeit;
var int Mod_PermTrank_Tries;
var int Mod_PermHealth_Wrong;

// Zielsystem

const int TARGET_RUMP = 1;
const int TARGET_HEAD = 2;
const int TARGET_LEFTARM = 3;
const int TARGET_RIGHTARM = 4;
const int TARGET_LEFTLEG = 5;
const int TARGET_RIGHTLEG = 6;

// Mod-Variable

var int Bosskampf_Pass_NW;


var int TimeSwitch;
var int View_Time;
var int transformCooldown;
var int Mod_Regenerationstrank_Counter;
var int Mod_AL_ZufluchtCounter;
var int Mod_Fortuno_Sumpfmensch_Scene;
var int Mod_Ring_Verschlagenheit;
var int Mod_Ring_Verschlagenheit_Sneak;
var int Mod_Banditen_Mine;
var int Mod_Banditen_Mine_Tag;
var int Mod_Mineneingang_Castle;
var int Mod_Banditen_Irdorath_MT;
var int Mod_Banditen_Irdorath_NW;
var string Mod_PrismaKey;
var int Mod_Alax_Zutaten;
var int Mod_Alax_Zutat_Schwefel;
var int Mod_Alax_Zutat_Pech;
var int Mod_Alax_Zutat_Bergkristall;
var int Mod_Alax_Zutat_GletscherQuartz;
var int Mod_Alax_Zutat_Aquamarin;
var int Mod_Alax_Zutat_Heilknospe;
var int Mod_Alax_Zutat_Zwillingsdorn;
var int Mod_Alax_Zutat_Heilkraut;
var int Mod_Alax_Zutat_Heilpflanze;
var int Mod_Alax_Zutat_Heilwurzel;
var int Mod_Alax_Zutat_Feuernessel;
var int Mod_Alax_Zutat_Feuerkraut;
var int Mod_Alax_Zutat_Feuerwurzel;
var int Mod_Alax_Zutat_Kohle;
var int Mod_Alax_Zutat_SchwarzePerle;
var int Mod_Wolf_MinecrawlerRuestung;
var int Mod_Wolf_MinecrawlerRuestung_Day;
var int Mod_Diebe_WandGehackt;
var int Mod_Diebe_BrunnenTag;
var int Mod_PrismaAngelegt;
var int Mod_NaKosh_MT;
var int Mod_KristallPrisma_Absorbiert;
var int Mod_OTSchalter;
var int Mod_OT_Geheimkammer;
var int Mod_PAT_Focus_01;
var int Mod_PAT_Focus_02;
var int Mod_PAT_Focus_03;
var int Mod_PAT_Focus_04;
var int Mod_PAT_Focus_05;
var int Mod_KarrasNecronicum;
var int Mod_FM_Hyglas_Eisgebiet;
var int Mod_FM_Hyglas_Eisgebiet_Day;
var int Mod_KristallPrisma;
var int Mod_AuraFlammen_Used;
var int Mod_AuraFlammen;
var int Mod_AuraFlammen_Counter;
var int Mod_PAT_Velario;
var int Mod_PAT_VelarioDay;
var int Mod_Pat_Beter;
var int Mod_Pat_PflanzenCount;
var int Mod_Pat_Heilpflanze;
var int Mod_Pat_Heilkraut;
var int Mod_Pat_Heilwurzel;
var int Mod_Pat_Feuernessel;
var int Mod_Pat_Feuerkraut;
var int Mod_Pat_Feuerwurzel;
var int Mod_Pat_Heilknospe;
var int Mod_Pat_Winterrute;
var int Mod_Pat_FlaemarKraut;
var int Mod_Pat_FlaemarAlkohol;
var int Mod_Pat_FurgasFertig;
var int Mod_Pat_MangelStarted;
var int Mod_TillChange;
var int Mod_TillChange_Day;
var int Mod_BeliarBibScene;
var int Mod_Gravo_Auftritt_Tag;
var int Mod_Gravo_Schatz;
var int Mod_Jackal_Tabak_1;
var int Mod_Jackal_Tabak_7;
var int Mod_JackalTabak_01;
var int Mod_JackalTabak_02;
var int Mod_JackalTabak_03;
var int Mod_JackalTabak_04;
var int Mod_JackalTabak_05;
var int Mod_JackalTabak_06;
var int Mod_JackalTabak_07;
var int Mod_JackalTabak_08;
var int Mod_JackalTabak_09;
var int Mod_JackalTabak_10;
var int Mod_JackalTabak_11;
var int Mod_JackalTabak_12;
var int Mod_JackalTabak_13;
var int Mod_Sly_Tipp;
var int Mod_Nagur_Geschaeft;
var int Mod_Nagur_Geschaeft_Tag;
var int Mod_Kardif_InfoTruhe;
var int Mod_Kardif_Info;
var int Mod_Riordian_Geister;
var int Mod_Riordian_Geister_Tag;
var int Mod_Cavalorn_Banditen;
var int Mod_Kimon_REL;
var int Mod_Bloodsplats;
var int Mod_Lobart_Unkraut;
var int Mod_Eremit_Harpien;
var int Mod_EIS_Wuetar;
var int Mod_EIS_Gestath;
var int Mod_EIS_Gestath_Day;
var int Mod_EIS_Gestath_DragonsnapperHorn;
var int Snapperbogen;
var int Mod_EIS_Amorite;
var int Mod_Xeres_Kampfphase;
var int Mod_Xeres_Geister;
var int Mod_Xeres_Geister_Tot;
var int Mod_Maussteuerung;
var int Mod_XW_Kap6;
var int Mod_XW_Startscene;
var int Mod_XW_Startscene_Counter;
var int Mod_Sly_Arena_Tag;
var int Mod_Sly_Arena;
var int Mod_Costa_Guertel_Tag;
var int Mod_Costa_Guertel;
var int Mod_FM_FeuerEis;
var int Mod_FMAufnahme_Day;
var int Mod_DaronAkahasch_Day;
var int Mod_DaronAkahasch;
var int Mod_Marduk_BetTag;
var int Mod_Marduk_BetReihe;
var int Mod_Marduk_StampfZeit;
var int Mod_Marduk_Gebetet;
var int Mod_Marduk_Gestampft;
var int Mod_Hilda_Argez;
var int Mod_Buddlerfleisch_Counter;
var int Mod_Waldbeere_Counter;
var int Mod_Weidenbeere_Counter;
var int Mod_Fisch_Counter;
var int Mod_Bartok_Ruestung_Day;
var int Mod_Gomez_Timer;
var int Mod_Gomez_HasenKiller;
var int Mod_Gomez_HasenKiller2;
var int Mod_Beliarschreine;
var int Mod_BeliarStatue_Bibliothek_Dabei;
var int Mod_BibEntdeckt;
var int Mod_Beliar_Andokai;
var int Mod_Diebe_Brunnen;
var int Mod_Herold_Kompass;
var int Mod_Herold_Siegelring;
var int Mod_Herold_Siegelring_Verlauf;
var int Mod_Dornenguertel;
var int Mod_TalismanBehueter;
var int Mod_HeilungRing;
var int Mod_WillenskraftRing;
var int Mod_KritischerTrefferRing;
var int Mod_BaroAtWillingham;
var int Mod_IstSchaf;
var int Mod_Irmgard_Tag;
var int Mod_Kneipe_Ditmar;
var int Mod_TPL_HK_Ydran;
var int Mod_Pilar_Gobbos;
var int Mod_Albert_WBD;
var int Mod_Xardas_Uriziel_Day;
var int Mod_Xardas_Ende;
var int Mod_XardasOWTower_Truhe;
var int Mod_Erol_Fahrender;
var int Mod_Erol_Unterwegs_Day;
var int Mod_HaradLehrling_SterbTag;
var int Mod_HaradLehrling_Boltan;
var int Mod_HaradLehrling_Kap4;
var int Mod_HaradLehrling_Kampf;
var int Mod_Brian_KeinLehrling;
var int Mod_Brian_KeinLehrling_Day;
var int Mod_PrismaRitual_Counter;
var int Mod_PrismaRitual_ZuLangsam;
var int Mod_Prisma_TrollFokus;
var int Mod_Prisma_KlosterFokus;
var int Mod_Prisma_Array[4];
var int Mod_Prisma_Start;
var int Mod_Dieb_Verkleidung;
var int Mod_Argez_Shrink;
var C_NPC Mod_Argez_ShrinkMonster;
var int Mod_FrauRichard_Weg;
var int Mod_Leprechaun_Choices;
var int Mod_TPL_Hueterklinge;
var int Mod_TPL_Hueterklinge_Art;
var int Mod_TPL_Hueterklinge_Drak;
var int Mod_SP_Killed_Day;
var int Mod_Saturas_Gast;
var int Mod_Saturas_Gast_Fortschritt;
var int Mod_AMQ_Evil;
var int Mod_AMQ_Viper;
var int Mod_Dieb_Haus_Day;
var int HeroAtLight;
var int CurrentLevel3;
var int fireplacenr;
var int Mod_Diebe_FackelAn;
var int Mod_Diebe_Weg;
var int Mod_Diebe_Elvira;
var int questitemliste;
var int Mod_Diebe_Andre_Day;
var int Mod_Leichengase_Day;
var int Mod_Leichengase_Kraut;
var int Mod_Wambo_Freund;
var int Mod_Mud_Lebt;
var int Mod_KG_OleErz;
var int Mod_Hagen_KG_Day;
var int Mod_Kap4_KGOrks;
var int Mod_Fisk_LH_Fingers;
var int Mod_Fisk_LH_Mud;
var int Mod_Fisk_LH_Scatty;
var int Mod_Fisk_LeiseHoffnung;
var int LogState_PosY;
var int Mod_PAL_Grim;
var int Mod_Xeres_Ende;
var int Mod_Balken;
var int Mod_PAL_Diebesgilde;
var int Mod_PAL_Diebesgilde_Day;
var int Mod_PAL_Diebesgilde_Aktion;
var int Mod_PAL_MikaHehler;
var int DrinkCounter;
var int Mod_JudithNacht;
var int Mod_AndreSchwert_Test;
var int Mod_AndreSchwert;
var int Mod_AndreSchwert_Counter;
var int Mod_AndreSchwert_Art;
var int Mod_AndreSchwert_Tag;
var int Mod_Fliegen;
var int Attack_Run;
var int Mod_Save_HeroArmor_Argez;
var int Mod_Fellan_Day;
var int Mod_Mika_Pflanzen;
var int Mod_Fellan_Umzug;
var int Mod_FM_AaronDay;
var int Mod_Nackt;
var int Mod_DidCrime;
var int Mod_Edda_Lernen;
var int Mod_Bosper_Tinktur;
var int Mod_DiegoHoltKristall_Fertig;
var int Inventory_Open;
var int Mod_Bosper_Constantino;
var int Mod_HasFleisch_Amount;
var int Mod_Leitwolf_Fleisch;
var int Mod_EndresIndizien_Teleport;
var int Mod_KampfLaeuft;
var int CutsceneAn;
var int Mod_Suppenwuerze_Thekla;
var int Mod_KG_VMGate_01;
var int Mod_KG_VMGate_02;
var int Mod_SavegameImport;
var int Mod_Raetsel01;
var int Mod_Raetsel02;
var int Mod_Raetsel03;
var int Mod_Raetsel04;
var int Mod_Raetsel05;
var int Mod_GdG_Frage;
var int Mod_GdG_Richtig;
var int Mod_GuertelDerGolemBand;
var int Mod_BlickfangAmulett;
var int Mod_BlutmondAmulett;
var int Mod_SphericRing;
var int Mod_WiederkehrRing;
var int Mod_BuecherwurmRing;
var int Mod_EberRing;
var int Mod_KuenstlerRing;
var int Mod_KuenstlerLaute;
var int Mod_TrollRing;
var int Mod_REL_Moorleiche_01;
var int Mod_REL_Moorleiche_01_Counter;
var int Mod_REL_Moorleiche_02;
var int Mod_REL_Moorleiche_02_Counter;
var int Mod_REL_Moorleiche_03;
var int Mod_REL_Moorleiche_03_Counter;
var int Mod_REL_Moorleiche_04;
var int Mod_REL_Moorleiche_04_Counter;
var int Mod_REL_Moorleiche_05;
var int Mod_REL_Moorleiche_05_Counter;
var int Mod_REL_Moorleiche_06;
var int Mod_REL_Moorleiche_06_Counter;
var int Mod_REL_Moorleiche_07;
var int Mod_REL_Moorleiche_07_Counter;
var int Mod_REL_Moorleiche_08;
var int Mod_REL_Moorleiche_08_Counter;
var int Mod_REL_Moorleiche_09;
var int Mod_REL_Moorleiche_09_Counter;
var int Mod_REL_Moorleiche_10;
var int Mod_REL_Moorleiche_10_Counter;
var int Mod_REL_Moorleiche_11;
var int Mod_REL_Moorleiche_11_Counter;
var int Mod_REL_Moorleiche_12;
var int Mod_REL_Moorleiche_12_Counter;
var int Mod_REL_Moorleiche_13;
var int Mod_REL_Moorleiche_13_Counter;
var int Mod_REL_Moorleiche_14;
var int Mod_REL_Moorleiche_14_Counter;
var int Mod_REL_Moorleiche_15;
var int Mod_REL_Moorleiche_15_Counter;
var int Mod_REL_Moorleiche_16;
var int Mod_REL_Moorleiche_16_Counter;
var int Mod_REL_Moorleiche_17;
var int Mod_REL_Moorleiche_17_Counter;
var int Mod_REL_Moorleiche_18;
var int Mod_REL_Moorleiche_18_Counter;
var int Mod_REL_Moorleiche_19;
var int Mod_REL_Moorleiche_19_Counter;
var int Mod_REL_Moorleiche_20;
var int Mod_REL_Moorleiche_20_Counter;
var int Mod_Talk_Sicherung;
var int Mod_Hagen_Asylanten;
var int Mod_HagenKOScene;
var int Mod_Caine_Leichengase;
var int Mod_BergweltScroll;
var int Mod_Hagen_NL;
var int Mod_Hagen_SL;
var int Mod_Hagen_JL;
var int Mod_Hagen_KG;
var int Mod_Hagen_VL;
var int Mod_Hagen_BL;
var int Mod_UluMulu;
var int Mod_Bierhexen;
var int Mod_Bierhexen_Tag;
var int Mod_Purpurmond_Intus;
var int Mod_Purpurmond_Intus_Time;
var int Mod_Thys_Schneegeister;
var int Mod_Herek_Zombie;
var int Mod_Herek_Gold;
var int Mod_Parcival_VorKneipe;
var int Mod_Parcival_VorKneipe_Tag;
var int Mod_Thys_Schneegeister_Tag;
var int Mod_Aldaro_Gift;
var int Mod_Aldaro_Gift_Tag;
var int Mod_Herek_Lebt;
var int Mod_Orlan_Bett;
var int Mod_Fingers_Nek;
var int Mod_Botschek_Wasserleichen;
var int Mod_Vino_Brennerei;
var int Mod_SenyanTom_Kraut_Wache_01;
var int Mod_SenyanTom_Kraut_Wache_02;
var int Mod_SenyanTom_Kraut_Mika;
var int Mod_Metzger_Kapitel;
var int Mod_Metzger_Schaf;
var int Mod_Metzger_Schaf_Wert;
var int MakePotion;
var int Mod_Thorben_Dietriche;
var int Mod_Thorben_Dietriche2;
var int Mod_Echsis_GolemKiller;
var int Mod_Ring_Alchemist;
var int Mod_Amulett_LangerAtem;
var int Mod_Echsis_Geheimnis;
var int Mod_Echsis_Geheimnis_Tag;
var int Mod_QuatschtNichtCounter;
var int Mod_Verschleierung;
var int Mod_CountVerwandlungen;
var int Mod_CountTaschendiebstahl;
var int Mod_CountSpende;
var int Mod_CountGifte;
var int Mod_Botschek_Info_A;
var int Mod_Botschek_Info_B;
var int Mod_Botschek_Info_C;
var int Mod_Botschek_Info_D;
var int Mod_Botschek_Info_E;
var int Mod_Botschek_Info_F;
var int Mod_SenyanTom_Kraut_Tag;
var int Mod_SenyanTom_Kraut;
var int Mod_Dam_Spawned;
var int Mod_Piraten_Aufbruch;
var int Mod_Botschek_Gaertner;
var int Mod_Chani_Abenteurer;
var int Mod_Viran_Sumpfbeeren;
var int Mod_Viran_Sumpfbeeren_Tag;
var int Mod_Alkor_Contest;
var int Mod_SumpfbeerenTraum;
var int Mod_IstGolem;
var int Mod_AlraunenFalle;
var int Mod_VersengungRing;
var int Mod_ASS_DolchMonolog;
var int Mod_ASS_PosWechsel;
var int Mod_ASS_ErolWiederDa;
var int Mod_OT_XardasNachricht;
var int Mod_Urs_Hund;
var int Mod_Urs_Hund_Counter;
var int Mod_ASS_Waechter_01;
var int Mod_ASS_Waechter_02;
var int Mod_ASS_Waechter_03;
var int Mod_ASS_Waechter_04;
var int Mod_ASS_Waechter_05;
var int Mod_ASS_Waechter_06;
var int Mod_ASS_Waechter_07;
var int Mod_ASS_Waechter_08;
var int Mod_ASS_Waechter_09;
var int Mod_ASS_IdricoSpende;
var int Mod_ASS_AtVerratHoehle;
var int Mod_ASS_Schlacht;
var int Mod_ASS_NaimBlutkelch;
var int Mod_GiftNeutralisierung;
var int Mod_StartTimer;
var int TimeCounter_Fog;
var int Mod_GuertelDerBewaehrung;
var int Mod_ASS_AvaquarGemeuchelt;
var int Mod_NL_BruceTot;
var int Mod_NL_TalkesselProblem;
var int Mod_WM_IsWarg;
var int Mod_AlfansQuest_Tag;
var int Mod_NL_BruceTot_Counter;
var int CurrentF8Time;
var int FrameCounter;
var int Mod_Halfmar_Pflanzen;
var int Mod_Geist_EIS_Spawned;
var int Mod_Geist_EIS_Bruder;
var int Mod_Xeres_Kampf01;
var int Mod_Xeres_Kampf01_Counter;
var int Mod_KG_SchwarzerRing;
var int Mod_KG_OrkTot;
var int Mod_KG_OrkZauber;
var int Mod_KG_NachOrkZauber;
var int Mod_Griselda_Arena;
var int Mod_KG_TrentInMT;
var int Mod_PirInsel_Teleport;
var int Mod_RitterScene;
var int MaxF8Time;
var int Mod_KG_SchwarzesErz;
var int Mod_BalrogHeart;
var int Mod_Moorhexe;
var int Mod_KG_RightTunnel;
var int Mod_Autosave;
var int Autosave_Counter;
var int Autosave_Blocker;
var int Mod_KG_WaitInMine;
var int MoD_KG_SpecialErzguardian;
var int Mod_ArgezVision_Counter;
var int Mod_Enter_Relendel_03;
var int Mod_KG_MineSpawn;
var int Mod_XardasAlchemie;
var int Mod_Enter_Relendel_05;
var int Mod_LeavePennerFirstTime;
var int Mod_Argez_Counter;
var int Mod_AnomalieAmulett;
var int Mod_REL_LukasS;
var int Mod_REL_FuegoWeg;
var int Mod_Argez_Choice;
var int Mod_Garond_Rauswurf;
var int Mod_KG_TrentInMine;
var int Mod_KG_TrentLicht;
var int Mod_Argez;
var int Mod_Argez_Day;
var int Mod_PAT_FuegoDa;
var int Mod_OT_Monolog_01;
var int Mod_REL_FuegoDay;
var int Mod_KIGlocke;
var int FirstF8Malus;
var int Mod_HeroSuchenderLiegt;
var int Mod_REL_WendelS;
var int Mod_REL_WendelS_Counter;
var int Mod_REL_WendelS_Choice;
var int Mod_REL_Stadthalter;
var int Mod_REL_Stadthalter_Day;
var int Mod_PIR_AngusHank_Kampf;
var int Mod_REL_TheodorusS;
var int Mod_Weisenchronik_Intus;
var int Mod_FolgsamkeitSnapper_Intus;
var int Mod_FolgsamkeitSnapper_Time;
var int Mod_REL_TheodorusS_Counter;
var int Mod_Tiergift;
var int Mod_Gewaechsgift;
var int Mod_Unbekannter_Fight;
var int Mod_AuraFrost;
var int Mod_AuraFrost_Counter;
var int Mod_AuraFeuer;
var int Mod_AuraFeuer_Counter;
var int Mod_AuraHeilung;
var int Mod_AuraHeilung_Counter;
var int Mod_JG_RangarDrago;
var int Mod_Mario_Day;
var int Mod_Zuris_Ueberfall;
var int Mod_IsgarothHaendler;
var int Mod_REL_Kandidat;
var int Fliegenpilz_Gegessen;
var int NPCCount;
var int Mod_Scavengerdung;
var int Mod_Scavengerdung_Tag;
var int Mod_WM_HexenSpruch;
var int Mod_Jim_Schutz;
var int Mod_Jim_FakeGeist;
var int Mod_Jim_AnselmDay;
var int Mod_LesterInRelendel;
var int Mod_LesterRELGuide;
var int Mod_EndresGeist;
var int Mod_Jim_Freudenspender;
var int Mod_Mario;
var int HealPrice;
var int Mod_Flora_Dachratte;
var int Mod_Anselm_Ornament;
var int Mod_VMG_Pruefung_Teleport;
var int Mod_VMG_Pruefung;
var int Mod_VMG_Pruefung_Leitwolf;
var int Mod_VMG_Pruefung_Genn;
var int Mod_VMG_Pruefung_Asko;
var int Mod_VMG_Pruefung_Barriere;
var int Mod_VMG_Pruefung_Barriere_Counter;
var int Mod_VMG_Pruefung_Petunia;
var int Mod_VMG_Pruefung_Vision;
var int Mod_VMG_Pruefung_Per;
var int Mod_IsFleischwanze;
var int Mod_Jana_Beutel;
var int Mod_SonjaSex;
var int Mod_Sonja_Freier;
var int Mod_Garvell_Fenia;
var int Mod_Mario_Diego;
var int Mod_SiegelEffekt;
var int Mod_PIR_Samuel_Poekelfleisch;
var int Mod_EduardZuWenigGoldCounter;
var int Mod_Matteo_GuteApples;
var int Mod_Matteo_SchlechteApples;
var int Mod_SuchenderZettelHinweis;
var int Mod_ASS_Bennet;
var int Mod_ASS_Blutkelch3;
var int Mod_ASS_Comeback;
var int Mod_ASS_Assassinengold;
var int Mod_Brody_Weg;
var int Mod_Steinschale1;
var int Mod_Steinschale2;
var int Mod_AndreTurnier;
var int Mod_Rupert_Apfel;
var int Mod_Baltram_Apfel;
var int Mod_Fenia_Apfel;
var int Mod_Coragon_Apfel;
var int Mod_Jora_Apfel;
var int Mod_Matteo_Fragen;
var int Mod_LobartsSchafeTot;
var int Mod_LehrlingBei;
var int Mod_LobartsRuebenBaltram;
var int Mod_Thorben_Brahim;
var int Mod_Thorben_Vertretung_Tag;
var int Mod_Thorben_Vertretung;
var int Mod_Thorben_KO;
var int Mod_Thorben_Present;
var int Mod_Thorben_Present_Day;
var int Mod_Thorben_Geschenk;
var int Mod_Thorben_Geschenk_Tag;
var int Mod_Thorben_Lehrling_Weg;
var int Mod_Ignaz_Bruder;
var int Mod_Constantino_SDW;
var int Mod_Constantino_SDW_Day;
var int Mod_AlvarKristall;
var int Mod_SinbadTraining;
var int Mod_Shivar_EIS_Angriff;
var int Mod_ASS_MahamadRaetsel;
var int Mod_ASS_MahamadRaetsel_Niete;
var int Mod_ASS_MirzaAmulett;
var int Mod_AusEisgebietRaus;
var int GiftCounter;
var int Mod_NL_TorOffen_OGY;
var int Mod_ASS_Richter;
var int Mod_GiveErfolgXP;
var int KrankheitCounter;
var int Mod_SumpfisWeg;
var int Mod_Cornelius_Overtalk;
var int Mod_Cornelius_Overtalk_Day;
var int Mod_DaemonischZettel;
var int Mod_BEL_GregOwen;
var int Mod_BEL_GregOwen_Counter;
var int Mod_AL_BloodwynBartholoGefangen;
var int Mod_AL_BloodwynBartholoGefangen_Counter;
var int Mod_NL_UDOS_WaitDay;
var int Mod_ASS_Krieger;
var int Mod_ASS_Magier;
var int Mod_ASS_Jack;
var int Mod_SilasTrader;
var int Mod_Klaue_TB;
var int Riddle1Inserted;
var int Mod_BronkoMehlsack;
var int Bonus_1h;
var int Bonus_2h;
var int Bonus_Bow;
var int Mod_WarteAufUeberfall;
var int Mod_Traenenkristall_Sequenz;
var int Bonus_CBow;
var int Mod_SeraHatBuch;
var int Mod_AlvarDead;
var int Mod_AlvarTagebuch;
var int Mod_BengarBaltram;
var int Mod_HeroArmor;
var int Mod_LobartAlwin;
var int Mod_IR_Dabei;
var int Mod_IR_Randolph;
var int Mod_IR_Velaya;
var int Mod_IR_Uriela;
var int Mod_IR_Cassia;
var int Mod_IR_Myxir;
var int Mod_IR_Gorn;
var int Mod_IR_Cord;
var int Mod_IR_Milten;
var int Mod_Beliarstatue_Kanalisation_Dabei;
var int Mod_VinoWillRache;
var int Mod_SheromeSuche;
var int Mod_LobartRuebinator;
var int Mod_AlrikSchaukampf;
var int Krauttabak_Bonus;
var int Krauttabak_Bonustime;
var int Mod_FernandoBlubber;
var int Mod_GarondCityCrime;
var int Mod_RupertHandelt;
var int Mod_MontyFake;
var int Mod_IR_Tengron;
var int Mod_IR_Lester;
var int Mod_IR_Angar;
var int Mod_IR_Diego;
var int Mod_IR_Ethan;
var int Mod_IR_Vatras;
var int Mod_IR_Namib;
var int Mod_IR_Keroloth;
var int Mod_IR_Marcos;
var int Mod_IR_Gerold;
var int Mod_IR_HebelProb;
var int Mod_IR_HebelProb2;
var int Mod_Mutantengolem;
var int Mod_HeroMachtRandiAni;
var int Mod_Adanostempel_Door;
var int Mod_LobartsRuebenCounter;
var int Mod_LobartsRuebe01;
var int Mod_LobartsRuebe02;
var int Mod_LobartsRuebe03;
var int Mod_LobartsRuebe04;
var int Mod_LobartsRuebe05;
var int Mod_LobartsRuebe06;
var int Mod_LobartsRuebe07;
var int Mod_LobartsRuebe08;
var int Mod_LobartsRuebe09;
var int Mod_LobartsRuebe10;
var int Mod_LobartsRuebe11;
var int Mod_LobartsRuebe12;
var int Mod_LobartsRuebe13;
var int Mod_LobartsRuebe14;
var int Mod_LobartsRuebe15;
var int Mod_LobartsRuebe16;
var int Mod_LobartsRuebe17;
var int Mod_LobartsRuebe18;
var int Mod_LobartsRuebe19;
var int Mod_LobartsRuebe20;
var int LobartsRuebe01;
var int LobartsRuebe02;
var int LobartsRuebe03;
var int LobartsRuebe04;
var int LobartsRuebe05;
var int LobartsRuebe06;
var int LobartsRuebe07;
var int LobartsRuebe08;
var int LobartsRuebe09;
var int LobartsRuebe10;
var int LobartsRuebe11;
var int LobartsRuebe12;
var int LobartsRuebe13;
var int LobartsRuebe14;
var int LobartsRuebe15;
var int LobartsRuebe16;
var int LobartsRuebe17;
var int LobartsRuebe18;
var int LobartsRuebe19;
var int LobartsRuebe20;
var int NextRuebe;
var int Mod_MinentalTor;
var C_NPC Mod_IR_Hebelmann;
var int Mod_LoreCounter;
var int Mod_IsRabbit;
var int Mod_Wirt_Freibier;
var int Mod_JG_Drachental;
var int Mod_JG_August;
var int Mod_IR_Hebel01;
var int Mod_IR_Hebel02;
var int Mod_IR_Hebel03;
var int Mod_IR_Hebel04;
var int Mod_JG_HockDa;
var int Mod_Schrittweite;
var int Mod_IR_Light01_Pos;
var int Mod_IR_Light02_Pos;
var int Mod_ASS_Felicita;
var int Mod_ASS_Schneider;
var int Mod_ASS_Schneider_Day;
var int Mod_IR_Argez;
var int Mod_JG_PennerDay;
var int Mod_Fernando_Mitternachtsspuk;
var int Mod_ASS_Yussuf;
var int Mod_ASS_Gritta;
var int Mod_ASS_ShakirGritta_Day;
var int Mod_ASS_ShakirGritta;
var int Mod_JG_Finder;
var int Mod_IR_Hebel;
var int Mod_IR_HebelCounter;
var int Mod_IR_Bridge;
var int Mod_IR_BridgeCounter;
var int Mod_ECHSI_SumpfhaiZaehne;
var int Mod_HQ_AlraunenTor;
var int Mod_HQ_AlraunenTor_Counter;
var int Mod_HQ_AlraunenTor_Sumpfgolems;
var int Mod_JG_SuchenderDT;
var int Mod_Raining;
var int LoreRelendel;
var int LoreKhorinis;
var int Mod_JG_Gitter;
var int Mod_SabitschTot;
var int Mod_SabitschTotPetze;
var int Mod_WildererFlucht;
var int BackGroundCounter;
var int Mod_BDT_AlterWaldMann_Counter;
var int Mod_ShivarLieb;
var int Mod_MorgahardBeleidigt;
var int Mod_Orks_Morgahard;
var int Mod_GDG_Plattform;
var int Mod_GDG_RitualTafel01;
var int Mod_GDG_RitualTafel02;
var int LoreEisgebietMine01;
var int LoreEisgebietSW01;
var int LoreEisgebietSO01;
var int LoreEisgebietNW01;
var int LoreEisgebietNO01;
var int Mod_NL_SnorreWeg;
var int Mod_BDT_AlterWaldMann;
var int Mod_JG_Idrico;
var int Mod_BDT_AlterWaldMann_Text;
var int Mod_IstKeiler;
var int Mod_SkipGreg_Counter;
var int Mod_WM_CronosAngriff;
var int Mod_RandolphIR_Demon;
var int Mod_TrfSkeleton2;
var int Mod_TrfSkeleton2_Time;
var int Mod_JG_Raetselstein;
var int Mod_JG_Raetselstein01;
var int Mod_JG_Raetselstein02;
var int Mod_JG_Raetselstein03;
var int Mod_JG_Raetselstein04;
var int Mod_JG_Raetselstein_Counter;
var int Mod_JG_Raetselstein_Wert;
var int Mod_JG_Raetselwand;
var int Mod_JG_Opferschale;
var int Mod_JG_Khorgor;
var int Mod_LorfornZettel;
var int Mod_SoerenZettel;
var int Mod_NL_SchlachtDa;
var int Mod_REL_QuestCounter;
var int Mod_REL_Buerger;
var int Mod_REL_BuergerFragen;
var int Mod_HasUrizielKaputt;
var int Mod_HatOrnamentPriester;
var int Mod_HatOrnamentHeiler;
var int Mod_HatOrnamentKrieger;
var int Mod_HatOrnamentTotenwaechter;
var int Mod_KarrasMTTeleport;
var int Mod_HalsketteDerEhre;
var int Mod_GuertelDerEhre;
var int Mod_Ring01DerEhre;
var int Mod_Ring02DerEhre;
var int Mod_RandolphDabei;
var int Mod_REL_Wettstreit;
var int Mod_REL_Wettstreit_Tyrus;
var int Mod_REL_Wettstreit_Davon;
var int Mod_REL_Wettstreit_Hero;
var int Mod_REL_Wettstreit_Tag;
var int Mod_REL_Wettstreit_Verloren;
var int Mod_REL_Wettstreit_Gold;
var int Mod_REL_Nagelnachschub_Tag;
var int Mod_REL_Nagelnachschub_Hans;
var int Mod_REL_Dokumente;
var int Mod_HSWM_RatProblem;
var int Mod_REL_DornGold;
var int Mod_REL_Hasenfuss;
var int Mod_REL_IdricoDorn;
var int Mod_REL_Frauenkleider;
var int Mod_REL_Frauenkleider01;
var int Mod_REL_Frauenkleider02;
var int Mod_REL_Frauenkleider03;
var int Mod_KG_Trollholz_Day;
var int Mod_KG_Sterling;
var int Mod_WM_SheepKiller;
var int Mod_REL_Korndiebe;
var int Mod_REL_MelvinTrank;
var int Mod_Juliana_Endres_01;
var int Mod_Hubert_Fuehrung_Canceled;
var int Mod_WM_Eisklinge;
var int Mod_WM_Eisklinge_Counter;
var int Mod_HSNL_RatProblem;
var int Mod_Juliana_Endres_02;
var int Mod_WM_HeroHatDaemonInSich;
var int Mod_CantharSelbstmord;
var int Mod_GarvellDa;
var int Mod_Roman_Endres_01;
var int Mod_Roman_Endres_02;
var int Mod_Leonhard_Endres;
var int Mod_EndresIndizien;
var int Mod_BEL_AngusHank_Angriff;
var int Mod_RichterEndres_Juliana;
var int Mod_WM_Rasend;
var int Mod_Zellentuer_Knast_01;
var int Mod_WM_Rasend_Day;
var int Mod_RichterEndres_Arzt;
var int Mod_RichterEndres_Wendel;
var int Mod_WM_BoedenAktiviert;
var int Mod_VelayaFrei;
var int Mod_SchwimmTauchCounter;
var int Mod_Wendel_FettNehmer;
var int Mod_Ursula_SchafsfellQuest;
var int Mod_EssKo;
var int Mod_JG_NovizeJGPass;
var int Mod_JG_CyrcoAmulett;
var int Mod_SuchenderAtTurm;
var int Mod_JG_WulfgarFell_Day;
var int Mod_AL_CorneliusTot;
var int Mod_JG_TurmwaechterFelle;
var int Mod_FuegoLehrer;
var int Mod_FMFieber;
var int Mod_FMFieberDay;
var int UrnolWeg;
var int Mod_TeleportSteinkreis_Funzt;
var int Mod_Oschust_OrkAttack;
var int Mod_JG_DragoHilfe2;
var int Mod_RBB_Angriff;
var int Mod_RudolfSchnaps;
var int Mod_MyxirNachtmahr;
var int Mod_ValentineKill01;
var int Mod_ValentineKill02;
var int Mod_ValentineKill03;
var int Mod_Hel_GhoulSpawn;
var int Mod_BennetSchiffTag;
var int Mod_NL_Teutonica_Smalltalk;
var int Mod_NL_Teutonica;
var int Mod_JointCounter;
var int Mod_AdanostempelBodenfalle;
var int Mod_JG_MinenPart;
var int Mod_DiegoDabei;
var int Mod_MiltenDabei;
var int Mod_GornDabei;
var int Mod_LesterDabei;
var int Mod_RavenDabei;
var int Mod_MyxirDabei;
var int Mod_VatrasDabei;
var int Mod_BeliarStatue_Beliarkloster_Dabei;
var int Mod_BeliarStatue_Oldmine_Dabei;
var int Mod_BeliarStatue_Eisgebiet_Dabei;
var int Mod_EthanDabei;
var int Mod_TengronDabei;
var int Mod_CordDabei;
var int Mod_BennetDabei;
var int Mod_AngarDabei;
var int Mod_NamibDabei;
var int Mod_Kapitan;
var int Mod_JackHW;
var int Mod_JackAL;
var int Mod_JackDabei;
var int Mod_SagittaDabei;
var int Mod_SagittaSS;
var int Mod_SagittaHK;
var int Mod_CrewCount;
var int Mod_KG_Glenn;
var int Mod_CedricDabei;
var int Mod_KerolothDabei;
var int Mod_MarcosDabei;
var int Mod_GeroldDabei;
var int Mod_BonesDabei;
var int Mod_CassiaDabei;
var int Mod_UrielaDabei;
var int Mod_VelayaDabei;
var int Mod_CedricLos;
var int Mod_Irdorath;
var int Mod_BonesOk;
var int ATFeld01;
var int ATFeld02;
var int ATFeld03;
var int ATFeld04;
var int ATFeld05;
var int ATFeld06;
var int ATFeld07;
var int ATFeld08;
var int ATFeld09;
var int ATFeld10;
var int ATFeld11;
var int ATFeld12;
var int Mod_MonsterGekillt;
var int Mod_HQ_Daemonisch_Sequenz;
var int Mod_HQ_Daemonisch_SP;
var int Mod_HQ_Daemonisch_SPZ;
var int Mod_HQ_Daemonisch_SP_01;
var int Mod_HQ_Daemonisch_SP_02;
var int Mod_HQ_Daemonisch_SP_03;
var int Mod_HQ_Daemonisch_City_Counter;
var int Mod_HQ_Daemonisch_City;
var int Mod_HQ_Daemonisch_Orlan_Counter;
var int Mod_HQ_Daemonisch_Orlan;
var int Mod_HQ_Daemonisch_Thekla_Counter;
var int Mod_HQ_Daemonisch_Thekla;
var int Mod_HQ_SoeldnerDaemonisch;
var int Mod_HQ_BrianDaemonisch;
var int Mod_HQ_SPGesehen;
var int Mod_HQ_FokusTeleport;
var int Mod_HQ_FokusZuXardas;
var int Mod_HQ_PaladineDaemonisch;
var int Mod_HQ_Daemonisch;
var int Mod_LichtAn_Pal;
var int Mod_LichtAn_Normal;
var int Mod_Buchleser;
var int Mod_BaboVerwirrt_Day;
var int Mod_ALTore;
var int Mod_ALTor_01;
var int Mod_ALTor_02;
var int Mod_ALTor_03;
var int Mod_XeresGetroffen;
var int Mod_Buchleser_Counter;
var int Mod_GaanSnapperOrni;
var int Mod_WM_RobertChemo;
var int Mod_LeonhardRuprecht;
var int Mod_WM_UnheilFertig;
var int Mod_RattenQuest;
var int Mod_WM_Plage_PartRatte;
var int Mod_WM_Plage_PartHase;
var int Mod_WM_Plage_PartInsekt;
var int Mod_WM_UnheilFertig_Day;
var int Mod_WM_KurganAlarm;
var int Mod_WM_KurganAlarm_Counter;
var int Mod_WM_ElvrichImSumpf;
var int SLD_Gruppe;
var int Mod_NL_HatFlorentiusGekillt;
var int Mod_REL_HenkerKampf;
var int Mod_WM_HexenFluchBroken;
var int Mod_NL_DrachensudIntus;
var int Mod_NL_JeremiahHasEier;
var int Mod_NL_JeremiahHasEier_Day;
var int Mod_REL_Dichter;
var int Mod_VMG_FaiceImBett;
var int Mod_REL_DichterBeiMargarethe;
var int Mod_REL_DichterInKhorinis;
var int Mod_BK_BookSpawn;
var int Mod_PCKenntGrogRezept;
var int Mod_LeeOJGBoss;
var int Mod_Akahasch_Guiding;
var int Mod_CantharAufTot;
var int Mod_NL_ReislordProBauern;
var int Mod_NL_ReislordProBauern_Day;
var int Mod_MordCounter;
var int Mod_KristallDiego;
var int Mod_Enter_Minental_01;
var int Mod_SchatzinselToSchiffschlacht;
var int Mod_LehmarTot;
var int Mod_VermisstenCounter;
var int Mod_VermisstenQuest;
var int Mod_Henrik_Schweine;
var int Mod_EchsenFeind;
var int Mod_ImGrenzgebiet;
var int Mod_EchsenQuest;
var int Mod_EchsenQuest_01;
var int Mod_EchsenQuest_02;
var int Mod_EchsenQuest_03;
var int Mod_Albi_VertrauensTag;
var int Mod_EchsenQuest_01_FleischAbgelegt;
var int Mod_EchsenQuest_01_SumpfhaiGeschwaecht;
var int Mod_EchsenQuest_01_SumpfhaiAngelockt;
var int Mod_Theodorus_FreudenspenderWarnung;
var int Mod_AnnaQuest;
var int Mod_AnnaQuest_Day;
var int Mod_AnnaQuestRichter;
var int Mod_AnnaQuest_WachenWeg;
var int LEAVE_PORTALTEMPEL_FIRSTTIME_ONETIME;
var int Mod_EchsenTag;
var int Mod_PfeilCounter;
var int Mod_SL_TalasGuide;
var int Mod_Enter_Addon_01;
var int Mod_Enter_Schatzinsel_01;
var int Mod_GespraechCounter_BB;
var int Mod_AW_PortalMeldung;
var int Mod_VMG_WSTrador;
var int Mod_HS_UrnolXardas_NextDay;
var int Mod_ASS_ThorbenLaute;
var int Mod_WM_HasRune;
var int Mod_ArgezSpawn;
var int Mod_PCKenntErzUmwandlung;
var int Mod_HS_DarfZuKing;
var int Mod_Echsis;
var int Mod_FlugblattMeldung;
var int Mod_MT_TruhenVoll;
var string Mod_MT_GiveTruhe;
var int Mod_SL_Arsch_Entschuldigung;
var int Mod_VMG_TeleporterEntdeckt;
var int Mod_VMG_Giftpflanzen;
var int Mod_Nl_Thofeistos_Lehrer;
var int Mod_NL_DragonKlosterTag;
var int Mod_SchreinEntweiht;
var int Mod_VMG_FurtTot;
var int Mod_VMG_Turendil_Trador_Day;
var int Mod_VMG_AlbertFurtTot;
var int Mod_Thorge_Skelette;
var int Mod_SL_PartFluffy;
var int Mod_SL_PartLochgraeber;
var int Mod_SL_PartGeliebte;
var int Mod_SL_PartBlind;
var int Mod_SL_PartBrunnen;
var int Mod_SL_PartFluffy_Counter;
var int Mod_SL_PartFluffy_Day;
var int Mod_SL_PartBlind_Counter;
var int Mod_SL_HofstaatFutsch;
var int FliegenpilzGift_FirstTime;
var int Mod_SL_Weg;
var int Mod_SL_Schwaechen;
var int Mod_SL_ListeSpawn;
var int Mod_XR_Xardas_MT;
var int Mod_BDT_Aus;
var int Mod_PalaKristall;

var int HP_Reg_Mod_1855_PAL_Paladin_PAT;
var int HP_To_Mod_1855_PAL_Paladin_PAT;
var int HP_Heal_Mod_1855_PAL_Paladin_PAT;
var int HP_Counter_Mod_1855_PAL_Paladin_PAT;
var int Mana_Reg_Mod_1855_PAL_Paladin_PAT;
var int Mana_To_Mod_1855_PAL_Paladin_PAT;
var int Mana_Heal_Mod_1855_PAL_Paladin_PAT;
var int Mana_Counter_Mod_1855_PAL_Paladin_PAT;

var int HP_Reg_Mod_1856_PAL_Paladin_PAT;
var int HP_To_Mod_1856_PAL_Paladin_PAT;
var int HP_Heal_Mod_1856_PAL_Paladin_PAT;
var int HP_Counter_Mod_1856_PAL_Paladin_PAT;
var int Mana_Reg_Mod_1856_PAL_Paladin_PAT;
var int Mana_To_Mod_1856_PAL_Paladin_PAT;
var int Mana_Heal_Mod_1856_PAL_Paladin_PAT;
var int Mana_Counter_Mod_1856_PAL_Paladin_PAT;

var int HP_Reg_Mod_1857_KDF_Magier_PAT;
var int HP_To_Mod_1857_KDF_Magier_PAT;
var int HP_Heal_Mod_1857_KDF_Magier_PAT;
var int HP_Counter_Mod_1857_KDF_Magier_PAT;
var int Mana_Reg_Mod_1857_KDF_Magier_PAT;
var int Mana_To_Mod_1857_KDF_Magier_PAT;
var int Mana_Heal_Mod_1857_KDF_Magier_PAT;
var int Mana_Counter_Mod_1857_KDF_Magier_PAT;

var int HP_Reg_Mod_7333_KDS_SchwarzerMagier_PAT;
var int HP_To_Mod_7333_KDS_SchwarzerMagier_PAT;
var int HP_Heal_Mod_7333_KDS_SchwarzerMagier_PAT;
var int HP_Counter_Mod_7333_KDS_SchwarzerMagier_PAT;
var int Mana_Reg_Mod_7333_KDS_SchwarzerMagier_PAT;
var int Mana_To_Mod_7333_KDS_SchwarzerMagier_PAT;
var int Mana_Heal_Mod_7333_KDS_SchwarzerMagier_PAT;
var int Mana_Counter_Mod_7333_KDS_SchwarzerMagier_PAT;

var int HP_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT;
var int HP_To_Mod_7332_SMK_SchwarzerKrieger_PAT;
var int HP_Heal_Mod_7332_SMK_SchwarzerKrieger_PAT;
var int HP_Counter_Mod_7332_SMK_SchwarzerKrieger_PAT;
var int Mana_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT;
var int Mana_To_Mod_7332_SMK_SchwarzerKrieger_PAT;
var int Mana_Heal_Mod_7332_SMK_SchwarzerKrieger_PAT;
var int Mana_Counter_Mod_7332_SMK_SchwarzerKrieger_PAT;

var int Mod_Fokus_Kloster;
var int Mod_Fokus_Meer;
var int Mod_Fokus_Troll;
var int Mod_Fokus_Stonehenge;
var int Mod_Fokus_Bergfestung;
var int Mod_Fokus_Alle;
var int Mod_WM_HexenVerwandlung;
var int Mod_SL_KingAtSwamp;
var int Mod_SL_AlexGraben;
var int Mod_Till_Streit;
var int Mod_NL_Steinkreis_01;
var int Mod_BDT_Esteban_RacheAngriff;
var int Mod_NL_Steinkreis_02;
var int Mod_NL_Hel;
var int Mod_NL_Steinkreis_03;
var int Mod_NL_UDS_Spawn;
var int Mod_NL_OpenOGY;
var int Mod_WM_HexenTrfCounter;
var int Mod_HasMILH;
var int TimeAn;
var int Mod_HasSLDH;
var int Mod_BlutetCounter;
var int Mod_WM_WasiliTag;
var int RingDerBosheit_Equipped;
var int Mod_BDT_OrcCity_Leer;
var int Mod_BlutCounter;
var int Mod_SL_BildMalTag;
var int Mod_WM_WasiliQuest;
var int Mod_ThorbenTrader;
var int Mod_AlvaresAndre_Taeter;
var int Mod_Freudenspender;
var int Mod_WM_PepeAtSheep;
var int Goetterwaffen_Jetzt_Weg;
var int Mod_BEL_Josephina_Bib;
var int Mod_BEL_Josephina_Bib_Counter;
var int Mod_FanatikerDa;
var int Mod_NL_HasKamm;
var int Mod_PAL_Galf;
var int Mod_Sekte_Karras;
var int Mod_PAL_MISH_Day;
var int Mod_PAL_HeroBot;
var int Mod_WM_FokusTeleport;
var int Mod_SL_Entscheidung;
var int Mod_Cronos_UsedBerserker;
var int Mod_Sekte_UDS_Stein;
var int Mod_Sekte_Joseppe;
var int Mod_Sekte_JoseppePreis;
var int Mod_NL_Dragon_KnowsFreudenspender;
var int Mod_NL_Grimbald;
var int Knows_MagicSecretsBand6;
var int Mod_NL_HeroHasStab;
var int Mod_Sekte_JoseppeBuch;
var int Mod_NL_Lich;
var int Mod_ArenaKampfStarted;
var int Mod_AuraDesStehlens;
var int Mod_NL_PalasLich;
var int Mod_Sekte_KatarDay;
var int Mod_HS_XardasRat;
var int Thorben_Regen;
var int CurrentOpfer;
var int Mod_LeftysBauern;
var int Mod_SLD_Spy;
var int Mod_Sleeper_01;
var int Mod_Sleeper_02;
var int Mod_Sleeper_03;
var int Mod_SLD_KampfDay;
var int Mod_Lefty_Horatio_Down;
var int Mod_Lefty_Bauern_Down;
var int HP_Heal;
var int AdanosGoldGesamt;
var int AdanosZusatzBonus;
var int Mod_HSBook;
var int Mod_HSBook2;
var int Mod_Sekte_WeiberheldHaus;
var int Mod_Sekte_TraderHaus01;
var int Mod_Sekte_TraderHaus02;
var int Mod_Sekte_Verheiratet;
var int Mod_SLD_Rath;
var int Mod_SLD_Wettstreit;
var int Mod_SLD_Orkjaeger;
var int Mod_SLD_Shrike;
var int Mod_SLD_Fester;
var int Mod_AMQ_Bollok;
var int Mod_AMQ_Viper_Day;
var int Mod_JG_GrimbaldTeacher;
var int Mod_NL_UOS_Attack;
var int Mod_NL_UOS_BarriereCounter;
var int Mod_NL_Xardas_ScrollCombiner;
var int Mana_Heal;
var int Mod_BEL_AJ;
var int Mod_BEL_PortalAktiv;
var int Mod_BEL_PortalCounter;
var int Mod_BEL_Bshydal;
var int Mod_BEL_FirstPortal;
var int Mod_BEL_BeliarDoch_Gefunden;
var int Mod_Reislord_DayChecker;
var int Mod_SLD_Kagan;
var int Mod_WM_Nahrungsopfer;
var int Mod_CantharQuest_Last;
var int Mod_Erfinderbrief_Gelesen;
var int Mod_CantharSchlaeger_Counter;
var int Mod_Schlaeger_SaveHeroHP;
var int Mod_NL_Fester_GobboFlucht;
var int Mod_AuraBerserker;
var int FokusBlockade;
var int Mod_HagenStellDichEin;
var int Piratenhut_Equipped;
var int BoeserBlickAbwender_Equipped;
var int FinsternisPanzerhandschuh_Equipped;
var int HeroKoboldGold;
var int Mod_AuraBerserker_Counter;
var int Mod_BrodyQuest;
var int Mod_JuanQuest;
var int Mod_WM_EthanQuest;
var int Mod_WM_TruppenLeft;
var int Mod_WM_Truppe_01;
var int Mod_WM_Truppe_02;
var int Mod_WM_Truppe_03;
var int Mod_WM_Truppe_04;
var int Mod_WM_Truppe_05;
var int Mod_WM_Truppe_06;
var int Mod_WM_Truppe_07;
var int Mod_WM_Truppe_08;
var int Mod_WM_Truppe_09;
var int Mod_WM_Truppe_10;
var int Mod_Untier_Frisst;
var int Armor_Dragon;
var int Mod_NL_Jharkendar_DrachenSpawn;
var int Mod_WM_Iwan;
var int Mod_SLD_FesterPotion;
var int Mod_WM_Kontrolled;
var int Mod_Untier_Frisst_Counter;
var int Mod_WM_Beeinflussend;
var int Mod_WM_WasiliSchnaps;
var int Mod_Untier_Tot;
var int Mod_WM_Hexenritual;
var int Mod_WM_Hexenritual_Counter;
var int Mod_WM_HexenTot;
var int Mod_WM_BlutkultTot;
var int Mod_WM_StraschiduosBrief;
var int Mod_DienerDesBoesen_01_Healer;
var int Mod_DienerDesBoesen_02_Healer;
var int Mod_AbsorbKristall;
var int Mod_Cronos_AbsorberTest;
var int Mod_AkilsHof_WaitingForDeath;
var int Mod_HasJuanBook_Gelesen;
var int Mod_AngusHank_Verbatscht;
var int Mod_HeroIstDemon;
var int Mod_HeroDemonCounter;
var int Mod_WM_ArtefaktSammler;
var int Mod_Saturas_KDW_Geblubber;
var int Mod_WM_Goldopfer;
var int Mod_WM_Erzopfer;
var int Mod_UOS_HolySpell;
var int Mod_WM_Knochenopfer;
var int Mod_WM_Heilopfer;
var int Mod_WM_Manaopfer;
var int Mod_WM_HexenHagel;
var int Mod_Brad_Quest;
var int Mod_WM_Verflucht;
var int Mod_WM_Hexeninfos;
var int Mod_IstUrnolTot;
var int Mod_InErfinderhaus;
var int Mod_WM_GornAttack;
var int Mod_NL_ZombieVerwandlung;
var int Mod_Edgor_SchafeSchlachten;
var int Mod_NL_UOS_Casting;
var int Mod_Moe_Valentino;
var int Mod_HasBerserkScroll;
var int Mod_NL_JeremiahDay;
var int Mod_WM_Boeden_02;
var int Mod_NL_DJGArmor_Day;
var int Mod_Cronos_Artefakt;
var int Mod_UrnolBS;
var int Mod_WM_Tiergestalt;
var int Mod_HexenAttack;
var int Mod_MitLawrenceGesprochen;
var int Mod_NL_XardasTeleport;
var int Mod_MoeDontTalk;
var int Mod_WM_Blutkultinfos;
var int Mod_PAL_Pablo_FirstRaetsel;
var int Mod_PAL_Pablo_SecondRaetsel;
var int Mod_CountAnschlag;
var int Mod_Randolph_Started;
var int Mod_FI_Quest;
var int DolchkampfAn;
var int Mod_FM_Hexencounter;
var int Mod_WM_DaySave;
var int Mod_MoeTalkedAboutNoTalk;
var int Mod_WM_KameraBengar_Counter;
var int Mod_AL_Oric;
var int Mod_Telbor_GoingToHof;
var int Hat_BuddlerNachrichtVonAL;
var int Mod_HeroFliegtAL;
var int Mod_NL_Dschinn_FM;
var int Mod_NL_Dschinn_OM;
var int Mod_NL_Dschinn_VM;
var int Mod_AkilsHofAusgestorben;
var int Ritual_Angefangen;
var int Mod_GomezAngriff;
var int Mod_ASS_AmirLehmar;
var int Mod_WM_SawBigOne;
var int Mod_WM_SawGraveOne;
var int Mod_Enter_Orkfriedhof_01;
var int Mod_VMG_FaiceGifty_Gift;
var int Mod_Turendil_Faice_Day;
var int Mod_Extension_Angelegt;
var int BeliarAufnahme;
var int EXP_LastLevel;
var int Mod_AlissandroBanditen_GetDay;
var int Mod_Vanja_BromorKO;
var int Mod_VMG_Faice_Gift;
var int Mod_SkinnerQuest;
var int Mod_Enter_Orktempel_01;
var int Mod_AL_InsertWhistler;
var int Mod_GoraxWeinGeklaut;
var int Mod_AL_AtCavalorn;
var int Mod_Enter_VM_01;
var int Mod_AlbertGoesToOrks;
var int CHECKOPENDOORPATHERION_OPENED;
var int Mod_HalvorHolFischeQuest;
var int Mod_PortalDicht;
var int Mod_SLD_Rufus;
var int Mod_SLD_WaermeRing;
var int Mod_PAL_GiselleKerze;
var int Mod_Allievo_Zusatzpower;
var int Mod_WM_CronosAttack;
var int Mod_Hofstaat_Typ_Intro_Counter;
var int Mod_AufstellungAktiviert;
var int Mod_SabineInRelendel;
var int Mod_Banditenueberfall_Esteban;
var int Mod_Banditen_Orkjagd;
var int Mod_EstebanBeleidigt;
var int Mod_UeberfallTag;
var int Mod_HeroKannUDSwampsharkRune;
var int Mod_HinweiseDerBauernZuHexen;
var int Mod_HS_Raufbold;
var int Mod_GenugBauernHinweise;
var int Mod_WM_MariaGeheilt;
var int Mod_MitLawrence_Counter;
var int Mod_TrfWoman;
var int Mod_TrfWoman_Time;
var int Daemonenritter_AL;
var int Mod_KnowsTonakZombie;
var int Mod_NL_Kakos;
var int Mod_NL_KakosFleisch;
var int Mod_Enter_FM_01;
var int Mod_Enter_AM_01;
var int Mod_Kimons_Traubenquest;
var int Mod_TemplerBeiThorus;
var int Mod_AL_Gebrandt_Gefangen;
var int AnfangsDialog;
var int OpenRyanBook;
var int Mod_HatGoldGeliehen;
var int Mod_GeldLeihTag;
var int Mod_LoganQuest;
var int Mod_OrikAbgeliefert;
var int Mod_Novi_Drin;
var int Mod_WM_BlutkultAttack;
var int Mod_Enter_GDG_01;
var int Mod_PDV_Bullit_Infos;
var int Mod_PDV_Cutter_Infos;
var int Mod_AL_BelohnungFuerEroberung;
var int Mod_ConstantinoZauberwasser;
var int Mod_PDV_Jackal_Infos;
var int HeroIstKeinZombie;
var int Mod_PDV_Bloodwyn_Infos;
var int Mod_PDV_Fisk_Infos;
var int Mod_PDV_Genug_Infos;
var int Drach_Gespawnt;
var int PortAtBrahim;
var int Mod_Enter_Minental_02;
var int Mod_LocktGardistZuDexter;
var int Mod_Uriela_Verbatscht;
var int Mod_Hexe_Verbatscht;
var int Mod_Sohn_Verbatscht;
var int Mod_Mann_Verbatscht;
var int Mod_UrielaCo_Weg;
var int Mod_BengarsHofLeer;
var int Tojan_Counter;
var int Mod_Enter_Addon_02;
var int Mod_NL_DrachenjaegerOnar;
var int Mod_GarondQuest;
var int Mod_NichtsGegessenCounter;
var int Mod_EssPunkte;
var int Mod_Esssystem;
var int Mod_Spell_BeliarCity;
var int Mod_HeroHasRune;
var int Mod_Andre_WaitForKnast;
var int Mod_CrazyRabbit_Counter;
var int Mod_AL_Esteban_Back;
var int FI_Rede;
var int WM_Boden_01;
var int WM_Boden_02;
var int WM_Boden_03;
var int WM_Boden_04;
var int WM_Boden_05;
var int WM_Boden_06;
var int WM_Boden_07;
var int WM_Boden_08;
var int WM_Boden_09;
var int Mod_WM_Boeden;
var int Mod_FM_AtHexe;
var int SpeekHexe_Counter;
var int Dolchkampf_Sneak;
var int Mod_Orcdog_Insert;
var int Mod_AL_AlissandroBefreit;
var int Mod_HatBonusBeiWetter;
var int Hotkey_Dialog;
var int Scatty_Start_DIA;
var int Mod_PalaKapitel3;
var int Mod_BodoInMT;
var int Mod_AtKastell;
var int Mod_FM_Foki;
var int Sleepermask_Equipped;
var int Mod_Mud_OrksCounter;
var int Mod_Mud_OrksWeg;
var int Mod_NL_DragonKloster;
var int Mod_NL_Dragon_KnowsLich;
var int Mod_NL_Dragon_KnowsBook;
var int Mod_EXP;
var int Mod_GorKarantoSchwach;
var int Mod_OschustMachtOrkring;
var int Mod_OschustRingDay;
var int Mod_DextersJob;
var int Eddas_Wanzen;
var int Mod_AL_BorkaAusgequetscht;
var int Mod_AL_Rattengespawnt;
var int Feldraeubertrank_Used;
var int AxtDamage;
var int AxtUpgrade;
var int Mod_Dexter_AmulettParty;
var int Feldraeubertrank_Counter;
var int Eddas_Wanzen_Back;
var int Mod_Monster;
var int Mod_Wyver_Insert;
var int Mod_Enter_Schatzinsel_02;
var int Bug_Mission;
var int Mod_Enter_Orkfriedhof_02;
var int Mod_Sleepermask_Ausgang;
var int Betrunken_Level;
var int Mod_HasSummonedDragon;
var int VMG_Second_Time;
var int Mod_PalaStory_Mine_Sektis;
var int Nagur_KillAkahasch;
var int EddasWanzen_Tag;
var int BetrunkenBei;
var int HatErstesMalNiesen;
var int Mod_DensGeruechtVerbreitet;
var int Mod_BartokEduard;
var int Mod_AniLog_Status;
var int HatGetrunken;
var int Eistaucher;
var int Mod_NL_Wasserdrache;
var int Erkaeltung;
var int Mod_EgillSelbstmord;
var int Mod_Fliegenpilzgift;
var int Mod_FungoGift;
var int Mod_FungoGift_Counter;
var int Mod_MithridaGift;
var int Mod_MithridaGift_Counter;
var int Mod_PonzolaGift;
var int Mod_PonzolaGift_Counter;
var int Mod_VenenaGift;
var int Mod_VenenaGift_Counter;
var int Mod_PianteGift;
var int Mod_PianteGift_Counter;
var int PATFokus_Counter;
var int Mod_Palamine_Leer;
var int Mod_Fliegenpilzgift_MSG;
var int Mod_EXP_Anzeige;
var int DragonSnapper_Bergwelt_Counter;
var int Mod_HatBeutelWilfried;
var int Mod_WilfriedsQuest;
var int Mod_LawrenceLegtBrief;
var int Mod_Sekte_SH_Counter;
var int Mod_Sekte_SH_Kampf;
var int Mod_LuteroLiestBrief;
var int Mod_Monster_Anzeige;
var int Mod_FM_SM_TOT;
var int SaturasNichtInJharki;
var int Mod_Fliegenpilzgift_Counter;
var int NeuBetrunken;
var int Mod_FM_TrankCounter_Mana;
var int EduardDietrich_Day;
var int Moe_KnowsPort;
var int Mod_FM_TrankCounter_Health;
var int Mod_Betrunken;
var int Mod_OverlayMDS_Wait;
var int Mod_HatSkeletonBook_Gelesen;
var int Mod_AL_EnteredGobboCaveFirstTime;
var int Mod_HoshPakInOC;
var int Mod_KnowsRukharWacholder;
var int Mod_TorInStadt;
var int Mod_OC_Esteban;
var int Mod_OC_Bandit_01;
var int Mod_OC_Bandit_02;
var int Mod_OC_Logan;
var int Mod_OC_Miguel;
var int Mod_OC_Juan;
var int Mod_OC_Skinner;
var int Mod_OC_Morgahard;
var int Mod_SLD_STT_Mordrag;
var int TIMEDEMO_SEEN;
var int Mod_Enter_Orktempel_02;
var int Mod_FM_Barriere;
var int Mod_Enter_VM_02;
var int Mod_Enter_FM_02;
var int Mod_Enter_AM_02;
var int Mod_SLD_Nebel;
var int Mod_SLD_Velaya;
var int Mod_Schwimmpraxis;
var int HeroIstVergiftet;
var int AustauschDialog_Demon;
var int Struk_Abgeliefert;
var int Thorge_Abgeliefert;
var int DemonKnight_Talk;
var int Mod_SanchoHatZettel;
var int Mod_SanchoKampfWegenZettel;
var int Mod_ErsteVerbesserung;
var int Mod_ZweiteVerbesserung;
var int Mod_NL_Chromanin;
var int Mod_NL_Siegelbuch;
var int Mod_NL_SiegelbuchCounter;
var int Mod_Enter_PAT_Second;
var int VMG_Second;
var int Mod_Enter_GDG_02;
var int Mod_Enter_NewWorld_02;
var int RespawnAn;
var int Mod_NL_Bert;
var int Mod_Drago;
var int Mod_HasHexenScroll;
var int Mod_Enter_Minental_03;
var int Mod_DeliriumWert;
var int Mod_Thorge_Dabei;
var int Seele_unterwegs;
var int Mod_Struk_Dabei;
var int TUG_Lorforn;
var int TUG_Matronen;
var int Gidan_Counter;
var int Mod_Enter_Addon_03;
var int Mod_Enter_Schatzinsel_03;
var int Mod_Enter_Orkfriedhof_03;
var int Mod_Almanach_Geheimnis_Gelesen;
var int Mod_Enter_Orktempel_03;
var int Beliar_TalkesselSchlacht;
var int Talkessel_Counter;
var int Mod_BeliarStatue_City_Dabei;
var int Mod_BeliarStatue_OldDementower_Dabei;
var int Mod_BeliarStatue_Magier_Dabei;
var int Mod_BeliarStatue_Krieger_Dabei;
var int Mod_BeliarStatue_Banditenlager_Dabei;
var int Urnol_InOT;
var int Mod_BeliarStatue_Bergfestung_Dabei;
var int Mod_BeliarStatue_Orkstadt_Dabei;
var int Mod_Sumpfkrautruestung;
var int Mod_BeliarStatue_Canyon_Dabei;
var int Mod_AchilFliegt;
var int Mod_BeliarStatue_Strand_Dabei;
var int Mod_BeliarStatue_Eremit_Dabei;
var int Mod_Enter_VM_03;
var int Mod_Enter_FM_03;
var int Mod_Enter_AM_03;
var int Mod_Enter_GDG_03;
var int Mod_Enter_NewWorld_03;
var int Mod_Enter_Minental_04;
var int Mod_Enter_Addon_04;
var int Mod_HildaWeinQuest;
var int Mod_Enter_Schatzinsel_04;
var int Mod_DragomirsLager;
var int LAGERFLUG_GDG_SEEN;
var int Mod_Enter_Orkfriedhof_04;
var int Mod_FercoBesiegt;
var int Mod_Enter_Orktempel_04;
//var int Mod_MilizAufgabe;
var int Mod_Enter_VM_04;
var int Erkaeltungsdauer;
var int Monster_Max;
var int Monster_Hat;
var int Mod_Zufallsdrink_Intus;
var int Mod_ZufallsDrink_Counter;
var int Mod_Zufallsdrink_Att;
var int Mod_Enter_FM_04;
var int Mod_Enter_AM_04;
var int Mod_Enter_GDG_04;
var int Mod_Enter_NewWorld_04;
var int Mod_Enter_Minental_05;
var int Mod_Enter_Addon_05;
var int Mod_VMG_Dabei;
var int Mod_Enter_Schatzinsel_05;
var int Mod_SamuelSkipsTrank;
var int Mod_NL_Herkuleskraut;
var int Mod_SLD_Engardo;
var int Mod_Enter_Orkfriedhof_05;
var int Mod_Enter_Orktempel_05;
var int Mod_Enter_VM_05;
var int SchiffOrk_Counter;
var int Mod_Enter_FM_05;
var int Xardas3IstWeg;
var int Mod_Enter_AM_05;
var int Fokus_Faelschen;
var int Mod_Enter_GDG_05;
var int Mod_Enter_NewWorld_05;
var int Mod_Enter_Minental_06;
var int Mod_AL_Alissandro_WaitForOric;
var int Mod_Enter_Addon_06;
var int Mod_Enter_Schatzinsel_06;
var int Mod_Enter_Orkfriedhof_06;
var int Mod_Enter_Orktempel_06;
var int Mod_Enter_VM_06;
var int Mod_Enter_FM_06;
var int Mod_Enter_AM_06;
var int Mod_Enter_GDG_06;
var int Mod_Enter_NewWorld_06;
var int Mod_PiratenVorbereitungen;
var int Mod_DiegoHoltKristall;
var int Mod_EmerinWillDie;
var int Mod_BalthasarsWoelfe;
var int Mod_HasHerkulesIntus;
var int Mod_AfterHerkulesIntus;
var int Mod_Mud_Unterwegs;
var int Mod_Josephina_In;
var int MyxirDa;
var int Delirium_Wert;
var int Delirium_Level;
var int Delirium_Counter;
var int Mod_BillsRezeptGelesen;
var int Mod_Sekte_Aufnahme;
var int Mod_BillsVerbrechenPetzen;
var int Mod_SabitschAmulettGeklaut;
var int Mod_GornsSold;
var int Mod_MagieKreis;
var int Mod_Orchunter_Counter;
var int Mod_MeldorVerpfiffen;
var int Mod_LanceKristall;
var int Mod_DenVerpfiffen;
var int Mod_DI_InselErkunden;
var int Mod_TraegtFeuerkleidung;
var int Mod_GiftCounter;
var int Mod_PAL_RLChoices;
var int Mod_VorbereitungenFertig;
var int ZaehlDichTotBisBlackScreenBeiTempelKommt;
var int Mod_AnzahlBetrunken;
var int Mod_TrinkLevel;
var int Mod_Getrunken;
var int Mod_KampfGegenBartokVerloren;
var int Mod_SonjaHilftGegenBartok;
var int Fliegenpilz_Used;
var int Mod_HasToTeleport;
var string Mod_TeleportOrt;
var int Mod_UsesFirebolt;
var int Mod_QuatschGrog;
var int Mod_EremitTranslation;
var int Mod_SamuelIstWeg;
var int Mod_InEntertrupp;
var int BEL_TruheMage;
var int Mod_SabitschArenaLooser;
var int Mod_SabitschRingTalk;
var int Mod_SabitschKampf;
var int Mod_NL_UOS_DAY;
var int Mod_NL_UOS;
var int Mod_SabitschHatteRing;
var int SoulStoneEingesetzt;
var int Mod_BrandonWaran;
var int Mod_HaradMachtHammer;
var int Mod_Gunnar_Partner;
var int Mod_Staerke_Praxis;
var int Mod_Staerke_Praxis_Next;
var int Mod_Staerke_Praxis_Level;
var int Mod_Geschick_Praxis;
var int Mod_Geschick_Praxis_Next;
var int Mod_EimerAusgeleert;
var int FI_Story;
var int Mod_Geschick_Praxis_Level;
var int Mod_Mana_Praxis;
var int Mod_PAL_HeroBotFollow;
var int Mod_PAL_GangsterArmor;
var int Mod_Mana_Praxis_Next;
var int Mod_Mana_Praxis_Level;
var int Mod_Einhand_Praxis;
var int GardeAnfangCutscene;
var int Mod_Einhand_Praxis_Next;
var int Ritual_Counter;
var int Mod_Einhand_Praxis_Level;
var int Mod_Zweihand_Praxis;
var int Mod_Zweihand_Praxis_Next;
var int Mod_Zweihand_Praxis_Level;
var int Mod_Bogen_Praxis;
var int Mod_Bogen_Praxis_Next;
var int Mod_Bogen_Praxis_Level;
var int Mod_Armbrust_Praxis;
var int Mod_Armbrust_Praxis_Next;
var int Mod_Armbrust_Praxis_Level;
var int	Mod_Gilde;				//in welcher Gilde ist der Held?
var int Mod_KriegerGetroffen;			//hat der Held bereits einen Schwarzen Krieger oder Dämonenritter getroffen?
var int Mod_MagierGetroffen;			//hat der Held bereits einen Schwarzmagier oder Dämonenbeschwörer getroffen?
var int XardasBriefAnKarrasOpened;		//hat der Held den Brief von Xardas an Karras gelesen?
var int XardasLetterForSaturasOpened;		//hat der Held den Brief von Xardas an Saturas gelesen?
var int Mod_AufnahmeZaehler;			//wieviele Stimmen hat der Held für die Aufnahme als Schwarzer Novize gesammelt?
var int Mod_AufnahmeStimmen;	
var int Mod_HeroKnowsHowToOpenZauberbuch;
var int Mod_MyxirsKraeuter;
var int Mod_KenntBodo;
var int Mod_Borka_Sumpfkraut;
var int Mod_KG_LURKER;
var int Mod_GomezHorn;
var int Monster_Gezaehmt;
var int Mod_Saturas_GDG_Almanach;
var int Mod_SchattenlaeuferGekillt;
var int Mod_BartokUeberzeugt;
var int Mod_BodoZuErol;
var int Mod_SchreinEntweihen;
var int Mod_EntweihteSchreine;
var int Mod_BeliarGebet;
var int Mod_Telbor_Hofbesetzt;
var int Mod_Flugblaetter;
var int Mod_Hofstaat_Alex_Intro;
var int Mod_Hofstaat_Alex_Intro_Counter;
var int Mod_Verhandlungsgeschick;
var int Mod_AutoInventar;
var int Mod_AngebotMatteo;
var int Mod_LehrlingsStimmen;
var int Mod_AttraktiveFrau;
var int Mod_MatteosKaeseAngebot;
var int Mod_MyxirsAuftragOK;
var int Mod_IstLehrling;
var int Mod_TrollfellBosper;
var int Mod_Piratenbefreiung;
var int Mod_MinecrawlerEi;
var int Mod_Dexter_BanditenParty;
var int Mod_CrazyRabbit;
var int SekretStart;
var int StaerkeZiel;
var int StaerkePlus;
var int StaerkeCounter;
var int Fleischwanzen_Zertrampelt;
var int Fleischwanzen_Nachricht;
var int GeschickZiel;
var int GeschickPlus;
var int GeschickCounter;
var C_NPC Mod_GuardRespawn;
var int ManaZiel;
var int ManaPlus;
var int Mod_LaufZeit;
var int Mod_NL_BarriereAttack;
var int Mod_Enter_PAT_First;
var int ManaCounter;
var int Kochen;
var int Mod_KannFischsuppe;
var int Mod_KannEintopf;
var int Mod_KannPilzsuppe;
var int Mod_KannFleischwanzenragout;
var int Hacken;
var int Stampfen;
var int Fellan_Hammer;
var int Mod_NL_XardasSiegelDay;
var int Braten;
var int Mod_DunklerPilger;
var int Mod_DunklerPilger_Counter;
var int Schleifen;
var int Saegen;
var int Mod_AlbertTransforms;
var int Erzhackchance;
var int SpitzhackenAbnutzung;
var int Mod_PfeileSpitzen;
var int Mod_PfeileSchnitzen;
var int Mod_LeihBetrag;
var int Mod_Geliehen;
var int Heilmagier_1_permanent;
var int Heilmagier_2_permanent;
var int Heilmagier_3_permanent;
var int Heilmagier_4_permanent;
var int Mod_MilizTurnier;
var int Mod_GeisterpiratWurdeGekillt;
var int SchwertAuftrag;
var int Mod_SL_Meer;
var int Mod_WM_BalrogDead;
var int Mod_MilizErnst;
var int TimeCounter_Real;
var int Mod_XardasAufnahmeFreund;
var int ParlanBisMana;
var int MiltenBrautTrank;
var int MiltenBautRune;
var int Mod_RealStrength;
var int Mod_RealDexterity;
var int Mod_RealMana;
var int Mod_DialogGoraxAufgabe1;
var int Mod_DialogGoraxAufgabe2;
var int Mod_Handelsfaktor;
var int Mod_BilgotBromorBartok;
var int Mod_BartokZufallZahlen;
var int Mod_BilgotOK;
var int Mod_Circle;
var int BullcosVerarschTrick;
var int Mod_Hermy_KnowsQuest;
var int Fleischwegmachen;
var int Mud_NerveRealized;
var int Mud_Nerve;
var int Mud_Nerve2;
const int NerveSec = 30;
var int Mod_PortalLance;
var int Mod_LanceXardasBrief;
var int Mod_OrnamentNefarius;
var int Mod_Tom_Boese;
var int Mil_309_schonmalreingelassen;
var int Mod_BDT_Orkjagd;
var int Mod_Schwierigkeit;
var int Mod_HakonUeberfall;
var int Mod_TarrokbautUluMulu;
var int Mod_TarrokDarfQuatschen;
var int FokiEingesetzt;
var int Hoelle_First;
var int DiegoGibtDiebesQuest;
var int Mod_TeleportZuFestung;
var int GehtErstesMalInsMinental;
var int Mod_Cords_Axt_Miliz;
var int BeliarSchreibStadtPlus;
var int Mod_Balthasar_Wolf;

var C_NPC NPC_Orkjaeger_01;
var C_NPC NPC_Orkjaeger_02;
var C_NPC NPC_Orkjaeger_03;
var C_NPC NPC_Orkjaeger_04;
var C_NPC NPC_Orkjaeger_05;
var C_NPC NPC_Orkjaeger_06;

var string NewLogEntry_Super;
var string NewLogEntry_Super_2;
var string NewLogEntry_Super_3;

// Salzhacken

var int 	SalzMob_01_Amount;
const int	SalzMob_01_Amount_MAX = 5;

//Erzhacken
var int 	ErzMob_01_Amount;
const int	ErzMob_01_Amount_MAX = 5;
var int 	ErzMob_02_Amount;
const int	ErzMob_02_Amount_MAX = 6;
var int 	ErzMob_03_Amount;
const int	ErzMob_03_Amount_MAX = 7;
var int 	ErzMob_04_Amount;
const int	ErzMob_04_Amount_MAX = 4;
var int 	ErzMob_05_Amount;
const int	ErzMob_05_Amount_MAX = 5;
var int 	ErzMob_06_Amount;
const int	ErzMob_06_Amount_MAX = 6;
var int 	ErzMob_07_Amount;
const int	ErzMob_07_Amount_MAX = 7;
var int 	ErzMob_08_Amount;
const int	ErzMob_08_Amount_MAX = 4;
var int 	ErzMob_09_Amount;
const int	ErzMob_09_Amount_MAX = 5;
var int 	ErzMob_10_Amount;
const int	ErzMob_10_Amount_MAX = 8;
var int 	ErzMob_11_Amount;
const int	ErzMob_11_Amount_MAX = 5;
var int 	ErzMob_12_Amount;
const int	ErzMob_12_Amount_MAX = 6;
var int 	ErzMob_13_Amount;
const int	ErzMob_13_Amount_MAX = 7;
var int 	ErzMob_14_Amount;
const int	ErzMob_14_Amount_MAX = 4;
var int 	ErzMob_15_Amount;
const int	ErzMob_15_Amount_MAX = 5;
var int 	ErzMob_16_Amount;
const int	ErzMob_16_Amount_MAX = 6;
var int 	ErzMob_17_Amount;
const int	ErzMob_17_Amount_MAX = 7;
var int 	ErzMob_18_Amount;
const int	ErzMob_18_Amount_MAX = 4;
var int 	ErzMob_19_Amount;
const int	ErzMob_19_Amount_MAX = 5;
var int 	ErzMob_20_Amount;
const int	ErzMob_20_Amount_MAX = 8;
var int 	ErzMob_21_Amount;
const int	ErzMob_21_Amount_MAX = 5;
var int 	ErzMob_22_Amount;
const int	ErzMob_22_Amount_MAX = 6;
var int 	ErzMob_23_Amount;
const int	ErzMob_23_Amount_MAX = 7;
var int 	ErzMob_24_Amount;
const int	ErzMob_24_Amount_MAX = 4;
var int 	ErzMob_25_Amount;
const int	ErzMob_25_Amount_MAX = 5;
var int 	ErzMob_26_Amount;
const int	ErzMob_26_Amount_MAX = 6;
var int 	ErzMob_27_Amount;
const int	ErzMob_27_Amount_MAX = 7;
var int 	ErzMob_28_Amount;
const int	ErzMob_28_Amount_MAX = 8;
var int 	ErzMob_29_Amount;
const int	ErzMob_29_Amount_MAX = 4;
var int 	ErzMob_30_Amount;
const int	ErzMob_30_Amount_MAX = 5;
var int 	ErzMob_31_Amount;
const int	ErzMob_31_Amount_MAX = 6;
var int 	ErzMob_32_Amount;
const int	ErzMob_32_Amount_MAX = 7;
var int 	ErzMob_33_Amount;
const int	ErzMob_33_Amount_MAX = 8;
var int 	ErzMob_34_Amount;
const int	ErzMob_34_Amount_MAX = 4;
var int 	ErzMob_35_Amount;
const int	ErzMob_35_Amount_MAX = 5;
var int 	ErzMob_36_Amount;
const int	ErzMob_36_Amount_MAX = 6;
var int 	ErzMob_37_Amount;
const int	ErzMob_37_Amount_MAX = 7;
var int 	ErzMob_38_Amount;
const int	ErzMob_38_Amount_MAX = 8;
var int 	ErzMob_39_Amount;
const int	ErzMob_39_Amount_MAX = 4;
var int 	ErzMob_40_Amount;
const int	ErzMob_40_Amount_MAX = 5;
var int 	ErzMob_41_Amount;
const int	ErzMob_41_Amount_MAX = 6;
var int 	ErzMob_42_Amount;
const int	ErzMob_42_Amount_MAX = 7;
var int 	ErzMob_43_Amount;
const int	ErzMob_43_Amount_MAX = 8;
var int 	ErzMob_44_Amount;
const int	ErzMob_44_Amount_MAX = 4;
var int 	ErzMob_45_Amount;
const int	ErzMob_45_Amount_MAX = 5;
var int 	ErzMob_46_Amount;
const int	ErzMob_46_Amount_MAX = 6;
var int 	ErzMob_47_Amount;
const int	ErzMob_47_Amount_MAX = 7;
var int 	ErzMob_48_Amount;
const int	ErzMob_48_Amount_MAX = 8;
var int 	ErzMob_49_Amount;
const int	ErzMob_49_Amount_MAX = 4;
var int 	ErzMob_50_Amount;
const int	ErzMob_50_Amount_MAX = 5;
var int 	ErzMob_51_Amount;
const int	ErzMob_51_Amount_MAX = 6;
var int 	ErzMob_52_Amount;
const int	ErzMob_52_Amount_MAX = 7;
var int 	ErzMob_53_Amount;
const int	ErzMob_53_Amount_MAX = 8;
var int 	ErzMob_54_Amount;
const int	ErzMob_54_Amount_MAX = 4;
var int 	ErzMob_55_Amount;
const int	ErzMob_55_Amount_MAX = 5;
var int 	ErzMob_56_Amount;
const int	ErzMob_56_Amount_MAX = 6;
var int 	ErzMob_57_Amount;
const int	ErzMob_57_Amount_MAX = 7;
var int 	ErzMob_58_Amount;
const int	ErzMob_58_Amount_MAX = 8;
var int 	ErzMob_59_Amount;
const int	ErzMob_59_Amount_MAX = 4;
var int 	ErzMob_60_Amount;
const int	ErzMob_60_Amount_MAX = 5;
var int 	ErzMob_61_Amount;
const int	ErzMob_61_Amount_MAX = 6;
var int 	ErzMob_62_Amount;
const int	ErzMob_62_Amount_MAX = 7;
var int 	ErzMob_63_Amount;
const int	ErzMob_63_Amount_MAX = 8;
var int 	ErzMob_64_Amount;
const int	ErzMob_64_Amount_MAX = 4;
var int 	ErzMob_65_Amount;
const int	ErzMob_65_Amount_MAX = 5;
var int 	ErzMob_66_Amount;
const int	ErzMob_66_Amount_MAX = 6;
var int 	ErzMob_67_Amount;
const int	ErzMob_67_Amount_MAX = 7;
var int 	ErzMob_68_Amount;
const int	ErzMob_68_Amount_MAX = 8;
var int 	ErzMob_69_Amount;
const int	ErzMob_69_Amount_MAX = 4;
var int 	ErzMob_70_Amount;
const int	ErzMob_70_Amount_MAX = 5;
var int 	ErzMob_71_Amount;
const int	ErzMob_71_Amount_MAX = 6;
var int 	ErzMob_72_Amount;
const int	ErzMob_72_Amount_MAX = 7;
var int 	ErzMob_73_Amount;
const int	ErzMob_73_Amount_MAX = 8;
var int 	ErzMob_74_Amount;
const int	ErzMob_74_Amount_MAX = 4;
var int 	ErzMob_75_Amount;
const int	ErzMob_75_Amount_MAX = 5;
var int 	ErzMob_76_Amount;
const int	ErzMob_76_Amount_MAX = 6;
var int 	ErzMob_77_Amount;
const int	ErzMob_77_Amount_MAX = 7;
var int 	ErzMob_78_Amount;
const int	ErzMob_78_Amount_MAX = 8;
var int 	ErzMob_79_Amount;
const int	ErzMob_79_Amount_MAX = 4;
var int 	ErzMob_80_Amount;
const int	ErzMob_80_Amount_MAX = 5;
var int 	ErzMob_81_Amount;
const int	ErzMob_81_Amount_MAX = 6;
var int 	ErzMob_82_Amount;
const int	ErzMob_82_Amount_MAX = 7;
var int 	ErzMob_83_Amount;
const int	ErzMob_83_Amount_MAX = 8;
var int 	ErzMob_84_Amount;
const int	ErzMob_84_Amount_MAX = 4;
var int 	ErzMob_85_Amount;
const int	ErzMob_85_Amount_MAX = 5;
var int 	ErzMob_86_Amount;
const int	ErzMob_86_Amount_MAX = 6;
var int 	ErzMob_87_Amount;
const int	ErzMob_87_Amount_MAX = 7;
var int 	ErzMob_88_Amount;
const int	ErzMob_88_Amount_MAX = 8;
var int 	ErzMob_89_Amount;
const int	ErzMob_89_Amount_MAX = 4;
var int 	ErzMob_90_Amount;
const int	ErzMob_90_Amount_MAX = 5;
var int 	ErzMob_91_Amount;
const int	ErzMob_91_Amount_MAX = 6;

//Runenstein hacken
var int 	RunenMob_01_Amount;
const int	RunenMob_01_Amount_MAX = 2;
var int 	RunenMob_02_Amount;
const int	RunenMob_02_Amount_MAX = 1;
var int 	RunenMob_03_Amount;
const int	RunenMob_03_Amount_MAX = 2;
var int 	RunenMob_04_Amount;
const int	RunenMob_04_Amount_MAX = 1;
var int 	RunenMob_05_Amount;
const int	RunenMob_05_Amount_MAX = 2;
var int 	RunenMob_06_Amount;
const int	RunenMob_06_Amount_MAX = 1;
var int 	RunenMob_07_Amount;
const int	RunenMob_07_Amount_MAX = 2;
var int 	RunenMob_08_Amount;
const int	RunenMob_08_Amount_MAX = 1;
var int 	RunenMob_09_Amount;
const int	RunenMob_09_Amount_MAX = 2;
var int 	RunenMob_10_Amount;
const int	RunenMob_10_Amount_MAX = 1;
var int 	RunenMob_11_Amount;
const int	RunenMob_11_Amount_MAX = 2;


// ------ Teacher MAX Werte ------
const int T_MEGA = 300; //Pyrokar MANA
const int T_MAX = 200;
const int T_HIGH = 120;
const int T_MED = 90;
const int T_LOW = 60;

//**************
//	ADDON
//**************
var int Saturas_KlaueInsMeer;
var int Saturas_AboutWilliam;
var int MIS_Eremit_Klamotten;
var int Diego_angekommen;
var int Diego_IsDead;
var int PlayerTalkedToSkipNW;
var int PlayerTalkedToGregNW;
//---------------------------------------------------
// ITEMS 

//----- Artefakt Set der Bauern (HP)-----------------
var int	HP_Ring_1_Equipped;		
var int	HP_Ring_2_Equipped;	  
var int HP_Amulett_Equipped;     
/*                              
var int HP_Ring_Double_Bonus;	  
var int HP_Artefakt_Bonus;       
var int HP_Amulett_EinRing_Bonus;
*/
var int HP_Artefakt_Effekt;	  

//----- Artefakt Set der Priester (Mana)-----------------

var int	MA_Ring_1_Equipped;		
var int	MA_Ring_2_Equipped;	  
var int MA_Amulett_Equipped;     
/*                              
var int MA_Ring_Double_Bonus;	  
var int MA_Artefakt_Bonus;       
var int MA_Amulett_EinRing_Bonus;
*/
var int MA_Artefakt_Effekt;	  

//----- Artefakt Set der Krieger (STR)-----------------

var int	STR_Ring_1_Equipped;		
var int	STR_Ring_2_Equipped;	  
var int STR_Amulett_Equipped;     
 /*                             
var int STR_Ring_Double_Bonus;	  
var int STR_Artefakt_Bonus;       
var int STR_Amulett_EinRing_Bonus;
*/
var int STR_Artefakt_Effekt;	  

//------------Rüstungen---------
var int LeatherArmor_Equipped;
var int	SLDArmor_Equipped;
var int NOVArmor_Equipped;
var int WNOVArmor_Equipped;
var int SNOVArmor_Equipped;
var int KDFArmor_Equipped;
var int	MILArmor_Equipped;
var int MCArmor_Equipped;
//----------Guertel-----------
/*+ Specials (Diebesgürtel --> DEX zusammen mit?)
	Minecrawler Gürtel Protection Bonus?
	Gürtel der täglichen Erfahrung  XP Ambient *2
	Gürtel des tiere ausnehmens (alle AT TALENTS)
	Gürtel der Heilung (1. Rezept heiltrank oder alle ...)
*/
var int KDF01_Equipped;
var int KDF02_Equipped;
var int KDF03_Equipped;

var int MIL01_Equipped;
var int MIL02_Equipped;
var int MIL03_Equipped;

var int NOV01_Equipped;
var int WNOV01_Equipped;
var int SNOV01_Equipped;

var int SLD01_Equipped;
var int SLD02_Equipped;
var int SLD03_Equipped;

var int Leather01_Equipped;
var int Leather02_Equipped;

var int Rhobar_Equipped;
var int MC_Equipped;
//-----------------------------------------------------

var INT WISPSKILL_LEVEL;


//---------------------------------------------------
var int MIS_Addon_Cavalorn_TheHut;					//SC soll nach Cavalorns Hütte sehen.
var int MIS_Addon_Cavalorn_KillBrago;				//BanditenKlatschen mit Cavalorn
var int MIS_Addon_Cavalorn_Letter2Vatras;			//übergebe Cavalorns Brief an Vatras
var int MIS_Addon_Lester_PickForConstantino;		//SC Alternativweg in die Stadt.
var int MIS_Addon_Greg_BringMeToTheCity;			//SC verhilft Greg in die Stadt zu kommen.
var int MIS_Addon_Lares_Ornament2Saturas;			//Lares : bring datt ding zu SAturas
var int Lares_Angekommen;							//Lares beim Mayatempel
var int SC_GotLaresRing;							//Lares hat SC seinen Aquamarinring gegeben.

var int MIS_Addon_Saturas_BringRiordian2Me;			//Saturas schickt nach Riordian
var int MIS_Addon_Nefarius_BringMissingOrnaments;	//SC soll die 3 restlichen Ornamente finden.
var int MIS_Addon_Martin_GetRangar;					//SC soll den Lagerdieb für Martin erwischen.
var int MIS_Addon_Vatras_Go2Daron;					//SC soll zu Daron gehen wegen seinem Gebetsbuch
var int MIS_Addon_Daron_GetStatue;					//SC soll Daron die Statue von den Gobbos bei Taverne besorgen
var int MIS_Addon_Cord_Look4Patrick;				//SC soll bei Dexter nachsehen, ob sich Patrick immer noch dort aufhält.
var int MIS_Addon_Farim_PaladinFisch;				//SC soll dafür sorgen, dass die Miliz nicht mehr seinen Fisch pfändet.
var int MIS_Addon_Cavalorn_GetOrnamentFromPAL;		//Hol das fehlende Ornament von Lord Hagen
var int MIS_Lares_BringRangerToMe;					//Besorge eine Ablöse für Lares, damit er vom Hafen weg kann.
var int MIS_Addon_Lares_ComeToRangerMeeting;		//SC soll bei Orlan erscheinen um seine Rüstung zu kriegen.
var int MIS_Addon_Greg_RakeCave;					//SC soll für Greg buddeln
var int MIS_Addon_Greg_RakeCave_Day;				
var int MIS_Addon_Baltram_Paket4Skip;				//SC soll Handel zwischen Baltram und Skip abwickeln
var int MIS_Addon_Erol_BanditStuff;					//SC soll dem Händler Erol seine Waren von den Banditen zurück bringen.

const int MinimumPassagePlants = 10;			//Anzahl der zu sammelnden Planzen für Constantino um in die Stadt zu kommen (Spielstart)
var int SaturasFirstMessageOpened;				//= TRUE wenn den Brief geöffnet
var int Vatras_SC_Liar;							//Lügencounter für Vatras
var int Vatras_ToMartin;
var int SC_GotWisp;
var int Vatras_GehZuLares;						//Vatras schickt SC zu Lares
var int Lares_RangerHelp;						//Lares hilft dem Spieler
var int LaresGuide_ZumPortal;					//Lares bringt im moment den SC zu...
var int LaresGuide_ZuOnar;						//Lares bringt im moment den SC zu...
var int LaresGuide_OrnamentForest;				//Lares bringt im moment den SC zu...
var int Andre_Knows_MartinEmpfehlung;			//= TRUE Lord Andre lässt SC zu bei Miliz wegen Martins Empfehlung
var int SC_KnowsKlosterTribut;					//= TRUE Pedro hat ihm die Klosterkosten (Schaf und 1000 GM) offenbart
var int Pedro_NOV_Aufnahme_LostInnosStatue_Daron;	//= TRUE Pedro lässt SC ein aufgrund des LostInnosStatue von Daron
var int SCKnowsBaltramAsPirateTrader;			//= TRUE SC weiß, dass Baltram mit Piraten handelt.
var int SC_GotRangar;							//= TRUE SC hat Rangar beim Plüdern des Proviantlagers erwischt!
var int SC_MeetsGregTime;						//wann und wo hat der SC Greg_NW schon getroffen
var int GregLocation;							//Wo befindet sich Greg_NW gerade
const int Greg_Farm1 	= 0;					//Vor der Stadt
const int Greg_Taverne 	= 1;					//Orlans Kneipe
const int Greg_Bigcross	= 2;					//Auf den Feldern von Onar
const int Greg_Dexter	= 3;					//Dexter
var int SC_KnowsGregsSearchsDexter;			//= TRUE SC weiß, dass Greg Dexter sucht.
var int SC_KnowsConnectionSkipGreg;			//= TRUE SC weiß, dass Greg und Skip zusammen gehören.
var int SC_SawGregInTaverne;				//= TRUE SC hat mit Greg in der Taverne gesprochen.
var int Greg_SuchWeiter;					//= TRUE SC soll auch die anderen Schätze für ihn finden.
var int Skip_Rum4Baltram;					//= TRUE Skip gibt Rum für Baltram mit
var int Knows_GregsHut;
var int Francis_ausgeschissen;				//bei Greg
var int MIS_Brandon_BringHering;

//Missing People
var int Lares_CanBringScToPlaces;				//= TRUE Lares braucht die Boote im Hafen nicht mehr im Auge behalten.
var int SC_HearedAboutMissingPeople;			//= TRUE SC weiß, dass in der Stadt Leute verschwinden.
var int SC_KnowsDexterAsKidnapper;				//= TRUE SC weiß, dass Dexter in der Sache mit den verschwundenen Leuten mit drin hängt
var int Ranger_SCKnowsDexter;					//= TRUE SC weiß, dass Dexter im Castlemine sitzt von einem AddonNPC
var int Dexter_KnowsPatrick;					//= TRUE Dexter kennt Patrick
var int SCKnowsFarimAsWilliamsFriend;			//= TRUE SC kann Farim nach dem verschwundenen William befragen
var int SCKnowsSkipAsKidnapper;					//= TRUE die Spur führt den SC zu Skip
var int SCKnowsMissingPeopleAreInAddonWorld;	//= TRUE die Spur führt den SC zur Addonworld
var int SCKnowsExactlyWhereMissingPeopleAre;	//  wird nicht verwendet
var int SCMetMissingPeople;						//	wird nicht verwendet
var int MissingPeopleReturnedHome;				//= TRUE SC hat die Leute befreit und nach Hause gebracht.
var int MIS_Akil_BringMissPeopleBack;			//Akil will Tonak und Telbor wieder zurück.
var int MIS_Bengar_BringMissPeopleBack;			//Bengar will Pardos wieder zurück.
var int MIS_Addon_Andre_MissingPeople;			//(nur MIL) Andre will die Leute zurück.
var int MIS_Addon_Vatras_WhereAreMissingPeople;	//Vatras will wissen, was mit den Vermissten passiert ist.
var int MIS_Bromor_LuciaStoleGold;				//= TRUE Bromor vermisst seine Ersparnisse. Lucia hat sie mitgehen lassen.
var int Bromor_Hausverbot;						//= TRUE Bromor schmeißt den Spieler aus seinem Laden.
var int MIS_Thorben_BringElvrichBack;			//= TRUE Thorben will Elvrich wieder zurück bei der Arbeit haben.
var int Elvrich_GoesBack2Thorben;				//= TRUE Elvrich geht zurück zu Thorben
var int MIS_LuciasLetter;						//= TRUE Elvrich hat den Abschiedsbrief von Lucia gelesen.
var int MIS_Bartok_MissingTrokar;				//= TRUE Bartok will seinen Jägerfreund Trokar wieder haben.
var int SC_KnowsLuciaCaughtByBandits;			//= TRUE Lucia ist mit den Banditen hinter Sekobs Hof verschwunden.
var int Elvrich_SCKnowsPirats;					//= TRUE Elvrich erzählt von Skip!
var int Dexter_NoMoreSmallTalk;					//= TRUE Noch einmal Dexter anlabern und Dexter greift an.
var int Saturas_WillVertrauensBeweis;			//= TRUE saturas wartet auf antwort von Vatras!
var int SC_GotPORTALTEMPELWALKTHROUGHKey;		//= TRUE SC kann die Tür PORTALTEMPELWALKTHROUGH in NW potentiel öffnen.

//Ranger 
var int SC_KnowsRanger;							//= TRUE SC hat vom RING des Wassers gehört.
var int SC_IsRanger;							//= TRUE  Name ist programm
var int SaturasKnows_SC_IsRanger;				//= TRUE  Saturas akzeptiert die Aufnahme des SC bei den Rangern
var int SCIsWearingRangerRing;					//= TRUE  Name ist programm
var int RangerRingIsLaresRing;					//= TRUE  Name ist programm
var int SC_KnowsCordAsRangerFromLares;			//= TRUE  SC weiß von Lares, dass Cord zum RING gehört
var int SC_KnowsCordAsRangerFromLee;			//= TRUE  SC weiß von Lares, dass Cord zum RING gehört
var int Cavalorn_RangerHint;					//= TRUE  Cavalorn gibt Hint auf Ranger!
var int Baltram_Exchange4Lares;					//= TRUE  Baltram kümmert sich um eine Ablöse am Hafen für Lares
var int SC_KnowsBaltramAsRanger;				//= TRUE  Baltram gehört zum RING
var int Lares_GotRingBack;						//= TRUE  Lares hat seinen Aquamarinring wieder
var int Lares_HaltsMaul;						//= TRUE  Lares hälts Maul nach Ranger meeting
var int RangerHelp_gildeSLD;					//= TRUE Lares hilft dem Spieler schneller bei SLD aufgenommen zu werden.
var int RangerHelp_gildeMIL;					//= TRUE Lares hilft dem Spieler schneller bei MIL aufgenommen zu werden.
var int RangerHelp_gildeKDF;					//= TRUE Lares hilft dem Spieler schneller bei KDF aufgenommen zu werden.
var int RangerHelp_LehmarKohle;					//= TRUE Lares zahlt Schulden des SC bei Lehmar
var int RangerHelp_OrnamentForest;				//= TRUE Lares Boxt SC durch den Medium Wald
var int Orlan_RangerHelpZimmer;					//= TRUE SC kann umsonst bei Orlan wohnen.
var int Cord_RangerHelp_GetSLD;					//= TRUE Cord hilft dem SC SLD zu werden.
var int Cord_RangerHelp_Fight;					//= TRUE Cord hilft dem SC besser im Kampf zu werden.
var int Cord_RangerHelp_TorlofsProbe;			//= TRUE Cord erledigt die SC Probe von Torlof
var int RangerMeetingRunning;					//= TRUE Die Ranger meeten in Orlans Taverne
var int Lares_ComeToRangerMeeting;				//= TRUE Lares schickt den Spieler zum Rangermeeting.
var int Lares_TakeFirstMissionFromVatras;		//= TRUE Lares schickt den Spieler zum Vatras um seinen ersten Auftrag abzuholen.
var int MIS_Vatras_FindTheBanditTrader;			//Vatras will den Namen des Händler aus dem oberen Viertel, der den Banditen Waffen liefert.
var int MIs_Martin_FindTheBanditTrader;			//Martin will den Namen des Händler aus dem oberen Viertel, der den Banditen Waffen liefert.
var int BanditTrader_Lieferung_Gelesen;			//= TRUE SC hat den Lieferungsschein gelesen.
var int Fernando_HatsZugegeben;					//Fernando hat zugegeben Waffen an die Banditen geliefert zu haben.
var int Fernando_ImKnast;						//Fernando Wird inhaftiert
var int SC_ShowedRangerArmor;					//SC Hat die RangerRüstung angehabt als er mit einem NSC geredet hat, der nicht zum 'Ring' gehört.
var int Orlan_KnowsSCAsRanger;					//= TRUE Orlan weiß, dass SC Ranger ist!
var int Orlan_Hint_Lares;						//= TRUE Lares erzählt von Orlan.
var int Martin_KnowsFarim;						//= TRUE  Martin hilft Farim bei seinem Milizproblem
var int MadKillerCount;							//SC's Counter für Ermordung unschuldiger Zivilisten.
var int VatrasPissedOffForever;
var int VatrasMadKillerCount;


// Ornamnet Portal
var int RitualRingRuns;							//= LOG_RUNNING Ritual den Ornamentring zu heilen.
var int SC_KnowsOrnament;						//= TRUE SC weiß, was es mit den Ornamenten auf sich hat.
var int ORNAMENT_SWITCHED_BIGFARM;				//= TRUE  Das Steinkreis-Ornamentevent bei Onars Hof ist aktiviert worden
var int ORNAMENT_SWITCHED_FARM;					//= TRUE  Das Steinkreis-Ornamentevent bei Lobarts Hof ist aktiviert worden
var int ORNAMENT_SWITCHED_FOREST;				//= TRUE  Das Steinkreis-Ornamentevent im Medium Wald ist aktiviert worden
var int SCUsed_AllNWTeleporststones;			//= TRUE SC benutzte alle Teleportstationen in der Newworld
var int SC_SAW_ORNAMENT_MAP;					//= TRUE  SC hat gesehen, wo er hin muss zu den teinkreisen
var int Lord_Hagen_GotOrnament;					//= TRUE  SC hat das fehlende Ornament von hagen bekommen
var int Hagen_BringProof;						// Ohne Guild reinflippern FIX
var int Vatras2Saturas_FindRaven_Open;			//= TRUE SC hat den Brief von Vatras an Saturas geöffnet.

//Teleportsteine
var int SCUsed_TELEPORTER;						//= TRUE SC benutzte irgendeinen Teleporter
var int SCUsed_NW_TELEPORTSTATION_CITY;			//= TRUE SC benutzte die Teleportstation bei...
var int SCUsed_NW_TELEPORTSTATION_TAVERNE;		//= TRUE SC benutzte die Teleportstation bei...
var int SCUsed_NW_TELEPORTSTATION_MAYA;			//= TRUE SC benutzte die Teleportstation bei...
var int SCUsed_ADW_TELEPORTSTATION_PORTALTEMPEL;//= TRUE SC benutzte die Teleportstation bei...
var int SCUsed_ADW_TELEPORTSTATION_ADANOSTEMPEL;//= TRUE SC benutzte die Teleportstation bei...
var int SCUsed_ADW_TELEPORTSTATION_SOUTHEAST;	//= TRUE SC benutzte die Teleportstation bei...
var int SCUsed_ADW_TELEPORTSTATION_SOUTHWEST;	//= TRUE SC benutzte die Teleportstation bei...
var int SCUsed_ADW_TELEPORTSTATION_PIRATES;		//= TRUE SC benutzte die Teleportstation bei...
var int SCUsed_ADW_TELEPORTSTATION_RAVENTELEPORT_OUT;		//= TRUE RAUS AUS aDANOSTEMPEL

var int SCUsed_ADW_TELEPORTSTATION_PIRATES_JACKSMONSTER;//= TRUE Monster gespawnt, die bei AlligatorJack stören


var int SC_ADW_ActivatedAllTelePortStones;		//= TRUE Alle ADW Teleporter sind aktiviert.

//ADDONWORLD KDW
var int NefariusADW_Talk2Saturas;				//= TRUE Infos über die Flut
var int MIS_ADDON_Myxir_GeistBeschwoeren;		//Myxir will, dass SC Quarhodron beschwört
var int SC_KnowsRavensGoldmine;					//SC hörte von der Goldmine.
var int StPl_nDocID;
var int Myxir_CITY_IstDa;						//Ablöse von Vatras ist da.
var int SC_OpenedCavalornsBeutel;				//= TRUE SC hat einen Nugget erhalten, Cavalornsbeutel
var int MIS_Saturas_LookingForHousesOfRulers;	//SC soll die 5 Herrenhäuser finden.
var int MIS_Riordian_HousesOfRulers;			//SC soll die 5 Herrenhäuser finden.


var int 	ENTERED_ADDONWORLD;					//= TRUE war schon in der Addonworld
var int 	VatrasCanLeaveTown_Kap3;			//= TRUE Vatras kann nun zum Umkehrritual aufbrechen (Kapitelbremse fürs Addon)
var int 	VatrasAbloeseIstDa;					//= TRUE Vatras Ablösung (ein KDW aus der ADW) ist in Khorinis eingetroffen.
var int 	Ghost_SCKnowsHow2GetInAdanosTempel;	//= TRUE Quarhodron erzählt SC wie man Ravens Tür aufmacht und in den Tempel kommt.
var int 	Saturas_KnowsHow2GetInTempel;		//= TRUE Saturas weiß wie man Ravens Tür aufmacht und in den Tempel kommt.
var int 	MIS_ADDON_Saturas_GoToRaven; 		//= TRUE SC muss einen Weg finden zu Raven zu gelangen.
var int 	Saturas_RiesenPlan;					//= TRUE SC soll zu Myxir, Geist erwecken geschichte abholen.
var int 	SC_Knows_WeaponInAdanosTempel;		//= TRUE SC weiß vom Schwert im Tempel
var int 	Saturas_KnowsWeaponIsInAdanosTempel;//= TRUE Saturas weiß vom Schwert im Tempel
var int		SC_SummonedAncientGhost;			//= TRUE Quarhodron ist erschienen.
var int 	SC_TalkedToGhost;					//= TRUE SC hat mit Ghost gesprochen.

var int 	RavenIsInTempel;					//= TRUE Raven Video. Raven haut ab in den Temepl Adanos
var int 	GhostAttackWarn;
var int 	SC_TookRhademesTrap;				//= TRUE SC ist an Rhademes vorbei gekommen
var int 	SC_TalkedToRhademAfter;				//= TRUE SC hat danach nochmal mit Rhademes gesprochen
var int 	RavenIsDead;						//= TRUE Raven ist tot und das Hauptziel vom Addon erreicht. 
var int  	BeliarsWeaponSpecialDamage;			//Grundwert für Speziellen Schaden Beliars Klaue
var int  	BeliarDamageChance;					//Chance auf Extraschaden
var int  	SC_FailedToEquipBeliarsWeapon;		//= TRUE SC hat versucht die Waffe anzulegen. -> Blitz in Arsch.
var int  	BeliarsWeaponUpgrated;				//= TRUE SC hat die Waffe wenigstens einmal verbessert!

 
//--------------Banditenlager (Addonwelt)------------------
var int 	Player_HasTalkedToBanditCamp;				//Spieler war schon mal im BDT Camp

var int 	Franco_Exit;
var int 	MIS_HlpLogan;
var int		MIS_HlpEdgor;
var int 	Logan_Inside;
var int		Edgor_Teach;
var int 	Sumpfi_Counter;

var int 	LennarPaket_Open; //ist jetzt FISKs Paket
var int 	Emilio_TellAll;
var int 	Paul_TellAll;
var int 	Finn_TellAll;
var int 	Finn_Petzt;
var int 	Senyan_Called;
var int		Huno_zuSnaf;
var int 	Huno_MEGA_Angepisst;
var int 	Snaf_Tip_Senyan;

var int		Ramon_News;
var int 	MIS_Judas;
var int 	Judas_Counter;
var int 	Bodyguard_Killer;
var int		Snaf_Rechnung;

var int 	Snaf_Einmal;
var int		MIS_SnafHammer;
var int		Snaf_Amount;
var int 	Knows_Finn;
var int		Knows_Huno;
var int		Knows_Fisk;
var int		Knows_Esteban;
var int		Knows_Senyan;

var int		Finn_CONTRA;
var int 	Paul_CONTRA;					

var int 	Senyan_Erpressung;
var int 	Senyan_CONTRA;
var int		Senyan_Gold;

var int 	Erol_Bonus;

var int 	PC_KnowsRedStone;
var int 	MIS_Huno_Stahl;
var int		MIS_Lennar_Lockpick;
const int	Lennar_picklock_amount = 12; //Anzahl seiner dietriche
var int 	Lockpick_gegeben;
var int 	Lennar_Trust;
var int 	Senyan_Start;
var int 	Huno_ArmorCheap;
var int		BDT_Armor_H_Value;

var int		SC_KnowsFortunoInfos;

var int 	Torwache_Greetings;
var int		MIS_Send_Buddler;
var int		Player_SentBuddler;

var int		Juan_Parole;
var int 	Knows_MCELIXIER;
var int		BDT_100018_Einmal;
var int 	BDT_100018_Tells;
var int 	MIS_BloodwynRaus;

var int		Crimson_SayBeliar;
var int		Patrick_trust;
var int 	Sklaven_Flucht;
var int		Sklaven_weg;
var int		Ready_Togo;
//----Tom-----
var int 	knows_losung;
var int 	knows_petze;
var int 	Tom_Angebot;
var int 	Tom_Tells;

//----Fortuno-----
var int		Green_Extrem;
var int 	Fortuno_Einmal;
var int 	Fortuno_Info;						
var int 	Fortuno_Geheilt_01;

//Sklaven
var int 	RemoveSklaven;

//----Ambient BDT-------------
var int 	BDT_13_Nerver;						//Wenn Spieler zu oft das gleiche in EINEM Dialog fragt (bei Voice 13 Lager Banditen)
var int 	BDT_13_Kill;						//und wenn er es dann auf die Spitze treibt...
var int		BDT_13_einmal;						//ein Ambient_13_bandit lacht nur einmal
var int		BDT_1_Ausbuddeln;
//----MC töten (ZS_DEad) Damit bloodwyn rauskommt-----------
var int		Minecrawler_Killed;
var int		Bloodwyn_Spawn;




//-------------GOLDHACKEN---------------------------------
var int 	Hero_HackChance;
var int 	Truemmer_Count;
var int 	Knows_Truemmerschlag;
var int 	Learn_by_doing; 

var int 	Hero_ErzHackChance;
var int		ErzTruemmer_Count;
var int		Knows_ErzTruemmerschlag;
var int		Learn_by_doing_Erz;

var int 	GoldMob_01_Amount;					
var int 	GoldMob_02_Amount;					
var int 	GoldMob_03_Amount;					
var int 	GoldMob_04_Amount;					
var int 	GoldMob_05_Amount;
var int 	GoldMob_06_Amount;
var int 	GoldMob_07_Amount;
var int 	GoldMob_08_Amount;
var int 	GoldMob_09_Amount;
var int 	GoldMob_10_Amount;
var int 	GoldMob_11_Amount;
var int 	GoldMob_12_Amount;
var int 	GoldMob_13_Amount;
var int 	GoldMob_14_Amount;
var int 	GoldMob_15_Amount;
var int 	GoldMob_16_Amount;
var int 	GoldMob_17_Amount;
var int 	GoldMob_18_Amount;
var int 	GoldMob_19_Amount;
var int 	GoldMob_20_Amount;
//Mine (großer Raum)
const int 	GoldMob_01_AmounT_MAX =  5;
const int 	GoldMob_02_AmounT_MAX =  5;
const int 	GoldMob_03_AmounT_MAX =  5;
const int 	GoldMob_04_AmounT_MAX =  5;
const int 	GoldMob_12_AmounT_MAX =  7;

//Mine Sackgassen/Stollen
const int 	GoldMob_05_AmounT_MAX =  9;
const int 	GoldMob_06_AmounT_MAX =  9;
const int 	GoldMob_07_AmounT_MAX =  9;

//Minecrawler Hoehle (Addon Goldmine)
const int 	GoldMob_08_AmounT_MAX = 15;
const int 	GoldMob_09_AmounT_MAX = 15;
const int 	GoldMob_10_AmounT_MAX = 18;
const int 	GoldMob_11_AmounT_MAX = 18;
//Else
const int 	GoldMob_13_AmounT_MAX = 12;
const int 	GoldMob_14_AmounT_MAX = 13;
const int 	GoldMob_15_AmounT_MAX = 14;
const int 	GoldMob_16_AmounT_MAX = 15;
const int 	GoldMob_17_AmounT_MAX = 16;
const int 	GoldMob_18_AmounT_MAX = 17;
const int 	GoldMob_19_AmounT_MAX = 18;
const int 	GoldMob_20_AmounT_MAX = 19;

//----------------Piratenlager (Addonwelt) -------------------------------
var int MIS_LookForMorgan;						// Suche Morgan
var int MIS_MorganRumBringen;					// Bring Morgan seinen Rum wieder
var int MIS_KrokoJagd;							// Alligator Jagd mit Jack
var int AlligatorJack_KrokosKilled;				// Wieviel Alligatoren hat der Player getötet?
var int AlligatorJackTrustYou;					//Er vertraut dir ;-)
var int AlligatorJack_JagdStart;
var int AlligatorJack_PlayersTriesAlone;
var int SC_Knows_JuanMurderedAngus;	
var int MIS_AlligatorJack_BringMeat;	
var int MIS_ADDON_SkipsGrog;	
var int MIS_Addon_MorganLurker;	
var int SC_MadeStunt;
var int TowerBanditsDead;	




var int Francis_100_Told;
var int Francis_500_Told;
var int Francis_HasProof;						//Player hat Beweise für Schmuggel
var int MIS_Francis_FreeBDTTower; //RAUS
var int MIS_Henry_FreeBDTTower;
var int Knows_HenrysEntertrupp;
var int Henry_GetPartyMember;
var int Francis_NoGrog;							// Es gibt kein Grog auf Hawai!
var int Owen_ComesToHenry;
var int Owen_Sc_FoundMalcom; //RAUS
var int MALCOMEXIDENT; //RAUS
var int Malcom_Accident;
var int MIS_Owen_FindMalcom;
var int MIS_Henry_HolOwen;


VAR int Bill_addon_deal;
var int MIS_Addon_Morgan_SeekTraitor;

var int MIS_Addon_JoinHenrysCrew;
var int Henrys_CrewCount;
var int MIS_Addon_JoinMorgansCrew;
var int MalcomBotschaft;


var int MIS_ADDON_GARett_BringKompass;
var int MIS_Addon_Bill_SearchAngusMurder;
var int MIS_Addon_Bill_SearchEsteban;
var int MIS_Addon_Bill_KillEsteban;

var int MIS_ADDON_PIR_6_Duell;
var int MIS_ADDON_PIR_6_BringGrog;
var int MIS_Addon_PIR_7_BringJoint;
var int MIS_Addon_PIR_7_BringGrog;

var int Greg_GaveArmorToBones;
var int PlayerKnowsAboutMIne;
var int MIS_BONES_SCOUTBANDITS;
var int MIS_DuellWithGreg;

var int GregIsBack;
var int Read_JuansText;
var int Skip_Addon_PlayerKnowsAboutBigBusiness;

var int MIS_Addon_Greg_ClearCanyon;
var int CanyonRazorBodyCount ;
var int MIS_Greg_ScoutBandits;
var int SC_KnowsGoldmine;
var int Player_KnowsSchnellerHering;

//diese hier wegmachen!! Sobald es möglich ist!!
var int MIS_Addon_HenryCrewMember;
var int MIS_Addon_MorganCrewMember;
var int MIS_ADDON_ProofHenryCrew;
var int MIS_Addon_ProofHenryCrew_Count;
var int MIS_ADDON_ProofMorganCrew;
var int MIS_Addon_ProofMorganCrew_Count;

//--------------- SCHNAPSBRENNEN - Rezept Kenntnis -----------------------
var int 	Knows_LousHammer;						//Lous Rezept
var int 	Knows_Schlafhammer;						//erweitertes Rezept von Lou mit doppelter Menge Rum 
var int 	Knows_SchnellerHering;					//verbesserte SpeedPotionSchnaps von Samuel 
 
//---obligatorisch angelegt -----------------------------

var int 	Knows_RuebenSchnaps;
var int 	Knows_VinoSchnaps;
var int 	Knows_PiratenSchnaps;	//Weißer Rum				
var int 	Knows_Magierschnaps;
var int 	Knows_Sumpfkrautschnaps;

//---weitere Knows geschichten -----------------------------
var int 	Knows_Banditenaxt;

//--- Stunt Bonus ----

var int StuntBonus_Once;




//Lehrer
var int Cavalorn_Addon_TeachPlayer; 		//Bogen (bis 90),1H (bis 30) und Schleichen
var int Myxir_Addon_TeachPlayer; 			//TeachLanguage
var int AlligatorJack_Addon_TeachPlayer; 	//Häute und Zähne
var int Francis_Addon_TeachPlayer;			//Stärke und Geschick bis 90
var int Henry_Addon_TeachPlayer;			//2h bis 90
var int Morgan_Addon_TeachPlayer;			//1h bis 75
var int Erol_Addon_TeachPlayer;				//Stärke
var int Riordian_Addon_TeachPlayer;			//Irrlicht Fähigkeiten
var int Riordian_ADW_ADDON_TeachWisp;		//Irrlicht Fähigkeiten
var int Riordian_ADW_ADDON_TeachAlchemy;	//Alchemy
var int Saturas_Addon_TeachCircle;			//magische Kreise
var int Merdarion_Addon_TeachMana;			//Mana
var int Nefarius_Addon_TeachRunes;			//Runen erschaffen
var int Bill_Addon_TeachPickPocket;



//**************
// Gothic 2
//**************
var int Kapitel;

var int Saturas_LastPetzCounter;
var int Saturas_LastPetzCrime;

// ------ Petzmaster ------
var int Andre_Schulden;
var int Pyrokar_Schulden;
var int Xardas_Schulden;
var int Angar_Schulden;
var int Saturas_Schulden;
var int Lares_Schulden;
var int Lee_Schulden;
var int Dexter_Schulden;
var int Nagon_Schulden;
var int Thorus_Schulden;
var int Richter_Schulden;

// *************************
// Globalvariablen für Diebstahl 
// *************************

const int Theftdiff = 10; //DEX Diff Wert ab dem der Dialog erscheint
var int TheftDexGlob;  //benötigte Geschicklichkeit um NSC auszuplündern
var int TheftGoldGlob; //Anzahl die NSC in der Tasche hat
var int TheftItemGlob; //Item, welches gestohlen werden kann

//*******************
//	Missionsvariablen		//sollten alle mit "MIS_" anfangen
//*******************

var int DG_gefunden; 

// ------ KAPITEL 1 ------

var int Bdt13_Friend;			//erster Bandit spuckt Infos aus  
var int Bdt13_Dexter_verraten;
var int Bdt_1013_Away;			//weggeschickt wegen Cavalorn ODER Maleth
var int Knows_Dexter;		 	//Spieler hat bei Wache korrekt geantwortet 
var int MIS_Steckbriefe;
// ------ Farm 1 ------
var int Wert_LobartsRuestung;
var int Lobart_Kleidung_Verkauft;
var int Lobart_Kleidung_gestohlen;

var int Lobart_AgainstKing;
var int MIS_Maleth_Bandits;
var int MIS_Vino_Wein;
var int MIS_Lobart_Rueben;
var int MIS_Lobart_RuebenToHilda;
var int	MIS_Hilda_PfanneKaufen;			
var int	MIS_Hilda_PfanneKaufen_Day;	
var int Hilda_Stew_Day;

var int	MIS_LobartKillBugs;			//Lobart: Töte alle Feldräuber

//*********************
//	Punkte für Aufnahme
//********************* 

var int MIL_Aufnahme;
var int SLD_Aufnahme;
var int KDF_Aufnahme;
var int NOV_Aufnahme;

//******************************
var int Player_IsApprentice;
const int APP_NONE 			= 0;
const int APP_Bosper 		= 1;
const int APP_Harad			= 2;
const int APP_Constantino 	= 3;

var int   MIS_Apprentice; //fürs Log
//-------------------------------
var int Bosper_Lehrling_Day;
var int Harad_Lehrling_Day;
var int Constantino_Lehrling_Day;
//*******************************

var int 	MIS_Harad_Orc;
var int 	Harad_HakonMission; //Verweis auf HakonMission
var int 	MIS_HakonBandits;
var int 	MIS_HakonBanditsPay;

var int 	MIS_Constantino_BringHerbs;
var int 	MIS_Constantino_Mushrooms;
var int 	Constantino_DunkelpilzCounter;

var int 	Points_Farm;
var int 	Points_Monastery;

// ------ City ------
var int 	Mil_310_Scheisse_erzaehlt;
var int 	Player_TalkedAboutDragons;
var int 	Player_KnowsLordHagen;
var int 	Hagen_FriedenAbgelehnt;
// -------------------
var int 	Mil_310_schonmalreingelassen;
var int 	Mil_333_schonmalreingelassen;
// -------------------
var int 	Lothar_Regeln;
var int 	Canthar_InStadt;
var int 	Canthar_Gefallen;
var int		Canthar_Sperre;
var int 	Canthar_WiederRaus;
var int 	Canthar_Pay;
const int 	Canthar_Gold = 500;

var int Andre_EyeInnos;



const int 	Kopfgeld = 100;			//Gold pro ausgeleifertem Verbrecher (*3 für Diebesgilde)
var int 	Andre_Diebesgilde_aufgeraeumt; 	//Wenn Andre sich selbst drum kümmert...
var int 	Diebesgilde_Verraten;			//Wenn man Andre vom Versteck erzählt hat...
var int 	MIS_AndreHelpLobart;		//Andre schickt SC zum ersten Bauerhof. Er soll Lobart helfen!
var int 	Andre_GivesChance;			//Spieler will der Miliz beitreten (Vorraussetzung für weitere Missionen )
var int     Andre_Bonus;				//für spezielle Andre Abfrage ;)
var int		Rengaru_Ausgeliefert;
var int		Nagur_Ausgeliefert;
var int		Halvor_Ausgeliefert;
var int 	Canthar_Ausgeliefert;
var int 	Sarah_Ausgeliefert;
var int		Undercover_Failed;
const int	Andre_Sold = 200;
var int 	MIS_Andre_REDLIGHT;
var int 	MIS_Andre_WAREHOUSE;
var int 	MIS_Andre_FISH;
var int 	MIS_Andre_Peck;
var int 	MIS_AndreGotThief;			//SC hat den Dieb gefangen oder die Kohle wieder geschafft!
var int     MIS_Baltram_ScoutAkil;   	//Händler Baltram schickt dich los um Akils Hof zu untersuchen!
var int		MIS_Canthars_KomproBrief; 	//Canthar sagt SC er soll Sarah den KomproBrief unterjubeln um seine Händlerstand wieder zu kriegen. LOG_SUCCESS = Sarah sitzt im Knast, LOG_OBSOLETE = SC hat Canthar bei Andre verraten!
var int		MIS_Canthars_KomproBrief_Day;
var int 	MIS_Meldor_BringGold;		//SC kann Geld von Meldor an Gedlverleiher abgeben
var int 	MIS_Meldor_BringGold_Day;
var int 	MIS_Coragon_Silber;
var int 	Regis_Ring;
var int 	Pablo_AndreMelden;

var int 	Alrik_Kaempfe;				//wie oft schon mit Alrik gekämpft
var int 	Alrik_ArenaKampfVerloren;	//wie oft - Counter
var int 	Alrik_VomSchwertErzaehlt;
var int 	MIS_Alrik_Sword;			//Alrik will sein Schwert zurück

var int 	MIS_Bosper_Bogen;
var int 	MIS_Bosper_WolfFurs;

var int 	Abuyin_Zukunft;
var int 	Abuyin_Erzaehlt;
var int		Abuyin_Honigtabak;
var int		Abuyin_Score;
var int		Bromor_Pay;
var int 	Nadja_Nacht;
var int 	Nadja_tot;

var int 	Diebesgilde_Okay;
var int 	Charm_Test;
var int 	MIS_Ignaz_Charm;
var int 	Alchemy_Explain;

// --------- DIEBE & CO ---------------------------------
var int 	MIS_Andre_GuildOfThieves;


//---------- Halvor der Hehler ---------------------
var int		Knows_Halvor;				//Spieler hat Zettel von Halvor gelesen
var int 	Betrayal_Halvor;			//Spieler hat Halvor verraten
var int     Halvor_Deal;				//Spieler ist Deal mit Halvor eingegangen (mehr Waren zum Kaufen)

//--------- Kardif Hafenkneipe Wirt ----------------
var int 	Kardif_Deal;				//wird mit dem Gold-Betrag gefüllt, den der Spieler für die Infos bezahlen muss
//--------- Nagur (Akil's Bote)  ----------------
var int 	MIS_Nagur_Bote;
var int 	Nagur_Deal;					//Nagur Baltrams Lieferung Mission  
var int 	NagurDay;
//--------- Attila  ----------------
var int 	Knows_Attila_Wer;
var int 	Knows_Attila_Was;
//----------Jora-------------------------
var int  	Jora_Dieb; 
var int 	Jora_Gold;

var int 	Thorben_Deal;
var int 	Dietrichgeben;	
var int 	Wulfgar_First;
//----------Diebesgilde--------------------
var int 	Cassia_Day ;
var int		MIS_CassiaKelche;
var int 	Join_Thiefs;
var int 	Cassia_Frist;
var int		Cassia_Gildencheck;
var int 	Ramirez_Cost;
var int		Ramirez_Sextant;
var int 	MIS_RamirezSextant;
var int 	Ramirez_Zweimal;
var int     Jesper_Cost;
var int 	MIS_CassiaRing;
var int    	Knows_SecretSign;
var int     Halvor_Score;
var int		Halvor_Day;
var int 	Attila_Key;


var int 	Edda_Day;
var int		Edda_Schlafplatz;

var int     Knows_Ork;					//Spieler hat vom Ork vor der Stadt gehört
var int 	MIS_Matteo_Gold;			//Schulden von Gritta eintreiben (von Matteo)
var int 	Knows_Matteo;				//fürs Log
var int 	Gritta_GoldGiven;			//Gritta hat Gold per Dialog rausgerückt!
var int 	Thorben_GotGold;


var int 	MIS_Thorben_GetBlessings;
var int 	Vatras_Segen;
var int 	Daron_Segen;
var int 	Vatras_Return;

var int		MIS_PayAlwin;				//Erpressung von Alwin 
var int 	FellanGeschlagen;			//Fellan im Auftrag von Alwin auf's Maul gegeben
var int 	MIS_AttackFellan;			

var int     Vatras_Trust;				//Vatras vertraut dir (ehrlich!) und gibt dir den KDF - Auftrag
var int  	Vatras_Chance;				//wenn der Spieler Vatras Schwachsinn erzählt
var int  	Vatras_Influence;			//Spieler hat Vatras überzeugt, dieser setzt sich für ihn ein	
var int  	Vatras_First;				//Abfrage zum Dialog basteln
var int  	Vatras_Second;
var int  	Vatras_Third;
var int     MIS_Vatras_Message;			//für die KDF Send Mission 

var int 	MIl_309_News;				//Für die Vergabe der verschiedenen Infos

var int 	Mil_305_schonmalreingelassen;

var int 	Knows_Paladins;				//kennt der Spieler die Infos über die Paladine 
var int 	MIS_Garvell_Infos;			//Mission von Garvell (wer hätte das gedacht?)
var int     Tell_Garvell;				//eine var die sich reimt, kann nicht schlecht sein;) --> damit der Spieler nur einmal den Sermon erzählen muss M.F.
var int 	KnowsPaladins_Ore;			//Weiß warum die paladine da sind


var int  	Lares_Guide; 				//Wie lange ist Spieler mit Lares unterwegs?

var int 	MIS_Lee_Friedensangebot;
var int 	MIS_Bennet_BringOre;
var int 	Sekob_Pachtbezahlt;
var int 	MIS_Sekob_RedeMitOnar;

var int Sekob_RoomFree; //wenn Xardas dich zur Truhe schickt (für Portalraum)

var int Torlof_TheOtherMission_TooLate;
var int MIS_Cipher_BringWeed;
var int MIS_Cipher_Paket;			//hat "Andres" Paket bekommen
var int Dar_Dieb;
var int Dar_Verdacht;
var int Dar_LostAgainstCipher;
var int 	MIS_Thekla_Paket;  			//Kräuterpäckchen von Sagitta besorgen.
var int Sylvio_MenDefeated;
var int Sylvio_angequatscht;
var int Sld_Duelle_gewonnen;	//In ZS_Unconscious 
var int Torlof_GenugStimmen;
var int Onar_Approved;
var int Lee_SendToOnar;
var int SOLD;
var int Onar_WegenSldWerden;
var int Onar_WegenPepe;
var int Onar_WegenSekob;
var int Maria_MehrGold;
var int MIS_Maria_BringPlate;

var int MIS_Torlof_Dmt;
var int Wolf_ProduceCrawlerArmor;

var int		MIS_ThiefGuild_sucked; 		//Wenn SC Rengaru, Halvor oder anderes Mitglied verknackt => TRUE		
var int     Knows_Ruga_Answer;			// für interne Dialogauswahl	
var int		Miliz_Points;				//Punkte für Milizaufnahme 
var int 	Nadja_Money;				//Je nach Spieler Antwort muss er mehr Kohle für die Info locker machen
var int     Knows_Borka_Dealer;			//Spieler weiß von Nadja, das Borka der Dealer ist
var int 	Borka_Deal;					//Borka hat sich auf einen Deal mit dem Spieler eingelassen, Beweis für Mission 
var int 	Nadja_Victim;				//Spieler opfert Nadja, was nicht zu ihrer Gesundheit beiträgt 
var int 	GernodsDrink;				//Getränk für Gerond
var int		GernodHappy;				//Hats ihm auch geschmeckt?					
var int		MIS_DragomirsArmbrust;		//Dragomirs Armbrust beim Ritualkreis				

//---------------------------
//	KLOSTER
//---------------------------
var int 	MIS_KlosterArbeit; 			//Spieler ist Novize und nimmt Arbeiten der Magier entgegen 
var int 	Kloster_Punkte;				//für Abfrage wieviel Punkte hat Spieler um in die Bibliothek zu dürfen
var int 	MIS_NeorasPflanzen;			//für Neoras 7 Feuernesseln besorgen	
var int 	MIS_NeorasRezept;			//Rezept für Neoras
var int 	MIS_ParlanFegen; 			//Novizenkammern ausfegen
var int 	NOV_Helfer;					//Anzahl der Novizen, die dem Spieler helfen die Kammern zu fegen
var int 	MIS_GoraxEssen;				//Essen für die Novizen verteilen 
var int 	Gorax_Gold;
var int 	Wurst_Gegeben;				//
var int 	MIS_MardukBeten;			//Marduk fordert den Spieler zum Gebet auf
var int  	MIS_IsgarothWolf;			//Schwarzer Wolf
var int 	Sergio_Sends;
var int 	Sergio_Follow;
var int		Parlan_Erlaubnis;			//Spieler hat sich Bibliothek freigespielt
var int 	Isgaroth_Segen;
var int 	Parlan_Sends;
var int 	MIS_GoraxWein;
var int 	MIS_KarrasVergessen;
const int 	Summe_Kloster = 1000;

var int 	Fire_Contest;

var int 	Opolos_Rezept;
var int 	Babo_Training;

var int 	MIS_GuardSheep;				//Schafe hüten für Opolos 
var int 	MIS_PickHerb;				//Unkraut jäten mit Agon
var int 	MIS_SweepLibrary;			//Sc soll Bibliothek fegen
var int		ShrineconfessCost;			//Beicht kosten am Wegschrein
var	int		KNOWS_FIRE_CONTEST;			//Spieler kennt das alte Gesetz 
var int 	MIS_HelpDyrian;				//Sc soll ein gutes Wort für Dyraian einlegen.
var int		MIS_HelpBabo;				//Babo will Gärtner werden
var int 	MIS_HelpOpolos;				//Opolos will in die Stadt

var int 	Wegelagerer_Surprise;		//Wegelagerer nach Novizen gefragt
var int   	MIS_SCHNITZELJAGD;			// die Prüfung des Feuers
var int   	MIS_GOLEM;
var int   	MIS_RUNE;
 
var int		MIS_RescueGorn;				//Die "Befreie Gorn" Mission. Wir von Lee und Milten vergeben!
const int   CostRescueGorn  = 500;      //Preis für Gorns Freilassung für Garond!!!!

var int 	Canthar_GotMe;				//== TRUE : Canthar weiß, daß SC Sträfling ist!
var int 	Canthar_Passierschein_Accept; //Deal mit dem Passierschein ist abgeschlossen worden => TRUE
var int 	Canthar_Passierschein_Accept_Day; // Tag des Abschlusses!
var int 	Canthar_AccusePlayerAndre;		//== True wenn Canthar den Player bei Andre angschwärzt hat (Sträfling)
var int 	Canthar_AccusePlayerAndre_Day;	// Tag des Verrats


var int 	Sentenza_GoldTaken;
var int 	Torlof_SentenzaCounted; 
var int 	MIS_Jarvis_SldKO;
var int 	MIS_Fester_KillBugs;
var int 	Festers_Giant_Bug_Killed;		//Wieviele hat SC gekillt?
var int		BusterLOG;
var int		BennetLOG;

var int 	MIS_Pepe_KillWolves;				//SC soll für Pepe die Wölfe töten.
var int 	MIS_Pepe_KickBullco;
var int 	MIS_Torlof_HolPachtVonSekob;		//Torlof schickt SC zu Sekobs Hof um die Pacht einzutreiben!
var int		MIS_Torlof_BengarMilizKlatschen; 	//SC soll Hof 4 von den Milizen befeien.
var int 	MIS_Gaan_Snapper;					//ersten Dragon snapper in der NW platt machen!

var int 	MIS_Sekob_Bronko_eingeschuechtert;	//Bronko wurde mit den SLD gedroht und geht wieder arbeiten.
var int 	MIS_Balthasar_BengarsWeide;			//Balthasar darf nicht mehr auf Bengars Weide. SC muß Bengar überreden.
var int 	MIS_Gaan_Deal;						//Kohledeal mit Gaan wegen Monster im Wald.
var int 	MIS_Rukhar_Wettkampf;				//Wettsaufen in der Taverne
var int 	MIS_Rukhar_Wettkampf_Day;
var int 	Rukhar_Won_Wettkampf;				//Rukhar hat gewonnen
var int 	Rukhar_Einsatz;
var int 	Rukhar_Gewinn;


var int 	Soeldner_Points;			//Punkte-Sammeln zur Sld-Aufnahme
var int 	Sentenza_Friend;			//Wenn Sentenza dir seine Stimme gegeben hat
var int 	Buster_Friend;

var int 	Liesel_Giveaway;			// ob Spieler Liesel abgegeben hat
var int		MIS_Gorax_Ambient;			// Gorax für Ambeint Mission freigeschaltet
var int 	Thief_Absolution;			//Spieler muß büßen
var int 	Hammer_Taken;				//Spieler hat Hammer Innos geklaut
var	int		Igaraz_Anger;				//Spieler erzürnt Igaraz
var int 	Igaraz_Wait;
var int     MIS_Gorax_Bote;				//Ambient Auftrag von Gorax
var int 	Paket_Opend;				//Spieler hat das Paket für Gorax geöffnet
var int		Goraxday; 					//Goarx hat nach einem Tag einen Auftrag für den Spieler

var int		MIS_Jack_KillLighthouseBandits; //Jack will, dass die Banditen aus seinem Leuchturm weg sind.
var int		MIS_Wasili_BringOldCoin; 	//Wasili sammelt OLDCOINs
var int 	MIS_Sagitta_Herb; 			//Sonnenaloe für Sagitta

// ------ KAPITEL 2 ------

var int 	Lutero_Krallen;
var int 	Fernando_Erz;
var int		MIS_ScoutMine;				// AL Kommandant Garond schickt SC in die neue Mine!
var int		MIS_Fajeth_Kill_Snapper;	//Fajeth in der neuen Mine will die Sapper los werden SC soll sie beseitigen!
var int     MIS_Fed_GetRidOfTengron;	//Fed will für Info über Diego Tenron los werden
var int 	MIS_BaltramTrade;			//Baltram handelt wieder mit dir!

var int     MIS_Engor_BringMeat;	// Burg im Minental Ambient Mission Kapitel 2
var int 	Meat_Counter; 			// Burg im Minental Ambient Mission Kapitel 2 
const int 	Meat_Amount = 24;		// Burg im Minental Ambient Mission Kapitel 2 

var int 	MIS_OLDWORLD; 			// HAUPT- MISSION KAPITEL2 Lord Hagen schickt den Spieler in die alte Welt
var int 	MIS_Marcos_Jungs;
var int 	MIS_Brutus_Kasse;	
var int 	MIS_ReadyForChapter3; 	//Mit dieser Varible in den Levelchange zur NW -> Kapitel 3

var int 	Marcos_einmalig;
var int 	Dobar_einmalig;
var int 	Brutus_einmalig;

var int 	Garond_Kerkerauf;
var int		TengronRing;
var int		OricBruder;
var int 	MIS_Kervo_KillLurker;  

// ------ KAPITEL 3 ------
var int 	MIS_NovizenChase;					//Pyrokar schickt SC hinter den Novizen her, der das Auge Innos gestohlen hat.
var int 	MIS_Pyrokar_GoToVatrasInnoseye; 	//Pyrokar schickt SC zu Vatras, wegen dem kaputten Auge Innos.
var int 	MIS_Xardas_GoToVatrasInnoseye;		//Xardas schickt SC zu Vatras, wegen dem kaputten Auge Innos.
var int 	MIS_RitualInnosEyeRepair; 			//Vatras wartet auf Xardas und Pyrokar am Sonnenkreis 
var int 	MIS_ReadyforChapter4; 				//Mit dieser Varible in den Levelchange zur OW -> Kapitel 4
var int		MIS_Bennet_InnosEyeRepairedSetting; //Bennet hat die Fassung des Auge Innos repariert.
var int 	MIS_SCKnowsInnosEyeIsBroken; 		//SC weiß, dass DMT, das Ding zerstört.
var int 	MIS_RescueBennet;					//Berfreie Bennet aus dem Knast
var int 	MIS_FindTheObesessed;				//Finde alle Besessenen 
var int 	MIS_HealHilda;						//Heile Lobarts Frau Hilda!	
var int 	MIS_BabosDocs;						//Babo wird erpresst
var int 	MIS_BengarsHelpingSLD;				//SC kann SLD anheuern, die auf seinen Hof achten!
var int 	MIS_GetMalakBack;					//Malak ist ausgebückst. SC kann ihn zu Bengar zurück schicken.
var int 	MIS_HyglasBringBook;				//Hyglas will das hero ihm ein Buch besorgt.
var int 	MIS_HannaRetrieveLetter;			//besorge das alte Schriftstück für Hanna
var int     MIS_HelpDiegoNW;					//Diego will seinen Schatz haben!
VAR int		MIS_DiegoNWSendsYouToJudge;			//Diego schickt dich zum Richter
var int		MIS_DiegosResidence;				//Diego hat ein neues Haus!
var int		MIS_Akil_SchafDiebe;				//banditen haben Akils schafe gestohlen.
var int 	MIS_Lee_JudgeRichter;  				//Beweise gegen Richter finden.
var int 	MIS_Richter_BringHolyHammer;  		//Dem Richter den heiligen Hammer der Magier bringen.
var int 	MIS_Richter_KillMorgahard;  		//Richter will, dass SC entflohenen Morgahard tötet.
var int 	MIS_InnosEyeStolen;  				//die Kacke is am Dampfen. DMT\Pedro haben das Auge geklaut.
var int 	MIS_RescueBilgot;					//Bilgot aus OW rausholen

//Gildenabhängig
var int		MIS_Buster_KillShadowbeasts_DJG;	//Buster schickt dich los Shadowbiester zu erledigen. 					SLD oder DJG
var int		MIS_Ulthar_HeileSchreine_PAL;		//Ulthar schickt dich los die verhexten Schreine zu heilen. 			PAL oder MIL
var int		MIS_Serpentes_MinenAnteil_KDF;		//Serpentes schickt dich los die gefälschten Minenanteile einzusammeln. KDF


// ------ KAPITEL 4 ------
var int 	MIS_DJG_Sylvio_KillIceGolem;//Sylvio will, daß der SC ihm den Weg frei killt.
var int 	MIS_AllDragonsDead; 		//Die OW ist von den Drachen befreit.
var int 	MIS_KilledDragons;			//Anzahl der schon getöteten Drachen 
var int 	MIS_JanBecomesSmith;		//Jan sucht Arbeit
var int 	MIS_FErrosSword;			//Ferros sucht sein Schwert
var int 	MIS_GeroldGiveFood;			//SC kann Gerold mit Food versorgen!
var int 	MIS_KillHoshPak;			//Hosh-Pak töten
var int 	MIS_Tabin_LookForEngrom;	//Finde Engrom den Jäger!
var int 	MIS_KillOrkOberst;			//Kill den Ork Oberst.
var int 	MIS_Neoras_DragonEgg;		//Bring das Ei zu Neoras 		(PAL und KDF)
var int 	MIS_Dar_BringOrcEliteRing;	//Bring das OrkEliteRing zu Dar (DJG und KDF)
var int 	MIS_KarrasResearchDMT;

// ------ KAPITEL 5 ------
var int 	MIS_Xardas_SCCanOpenIrdorathBook; //SC kann Buch "Die Hallen von Irdorath" lesen
var int 	MIS_SCKnowsWayToIrdorath;	//SC weiß jetzt, dass er das Schiff braucht und kennt den Weg zur Dracheninsel
var int 	MIS_PyrokarClearDemonTower;	//Pyrokar will, dass SC dem DT aufräumt, als Tribut für Jorgens freilassung.->==LOG_SUCCESS Jorgen kann nun als Kapitän angeheuert werden.
var int 	ItWr_HallsofIrdorathIsOpen;	//SC hat das Buch geöffnet
var int 	ItWr_SCReadsHallsofIrdorath;//SC hat das Buch durchgelesen
var int 	MIS_ScoutLibrary;		//Erkunde das Gewölbe Huhu!
var int 	PlayerGetsAmulettOfDeath;
var int 	PlayergetsFinalDJGArmor;
var int 	MIS_bringRosiBackToSekob;
var int 	MIS_HealRandolph;
var int 	MIS_SCvisitShip;
var int 	MIS_Raoul_KillTrollBlack;
var int 	MIS_Raoul_DoesntPayTrollFur;
var int 	MIS_RichtersPermissionForShip;	//Ermächtigungsschreiben fürs Schiff beim Richter erpressen.
var int 	MIS_RosisFlucht;		


var int 	Crewmember_Count;			//Die Anzahl der Crewmitglieder
const int 	Max_Crew = 9;				//Max. Crewmitglieder
const int   Min_Crew = 5;				//Min. Crewmitglieder //Joly: wenn dieser Wert geändert wird, müssen auch die Dialoge angepasst werden!!!!!!!!!

// Crewmembers
var int 	Lee_IsOnBoard;				//Ist Lee an Bord?			-> == LOG_SUCCESS
var int		MiltenNW_IsOnBoard;			//Ist Milten an Bord?		-> == LOG_SUCCESS
var int		Lester_IsOnBoard;			//Ist Lester an Bord?		-> == LOG_SUCCESS
var int		Mario_IsOnBoard;			//Ist Mario an Bord?		-> == LOG_SUCCESS
var int		Wolf_IsOnBoard;				//Ist Wolf an Bord?			-> == LOG_SUCCESS
var int		Lares_IsOnBoard;			//Ist Lares an Bord?		-> == LOG_SUCCESS
var int		Diego_IsOnBoard;			//Ist Diego an Bord?		-> == LOG_SUCCESS
var int		Bennet_IsOnBoard;			//Ist Bennet an Bord?		-> == LOG_SUCCESS
var int		Vatras_IsOnBoard;			//Ist Vatras an Bord?		-> == LOG_SUCCESS
var int		Gorn_IsOnBoard;				//Ist Gorn an Bord?			-> == LOG_SUCCESS
var int		Biff_IsOnBoard;				//Ist Biff an Bord?			-> == LOG_SUCCESS
var int		Angar_IsOnBoard;			//Ist Angar an Bord?		-> == LOG_SUCCESS
var int 	Girion_IsOnBoard;  			//Ist Girion an Bord?		-> == LOG_SUCCESS

var int 	MIS_ShipIsFree;				//Das Schiff ist frei und SC kann mit seinen Jungs draufgehen.
var int 	SCGotCaptain;	 			//== TRUE ->SC hat sich für einen Kapitän entschieden.
var int 	JorgenIsCaptain;  			//== TRUE Jorgen ist der Käptain!
var int 	TorlofIsCaptain;  			// == TRUE Torlof ist der Käptain!
var int 	JackIsCaptain;  			// == TRUE Jack ist der Käptain!

var int 	MIS_ReadyforChapter6; 		//Alles klar für Kapitel 6
var int 	MIS_OCGateOpen;				//== TRUE -> Das Tor vom OC ist geöffnet worden (ORCSturm)
var int 	MIS_Jack_NewLighthouseOfficer; //Jack braucht jemanden, der auf seinen Leuchtturm auspasst!

// ------ KAPITEL 6 ------
var int 	MIS_Mario_Ambush; 			//Mario verrät den SC


//**************************
// Allgemeine Hilfsvariablen
//**************************
var int B_Chapter3_OneTime;
var int B_Chapter4_OneTime;
var int B_Chapter5_OneTime;

// ------ KAPITEL 1 ------
var int	Maleth_ersterWolf;  		//Wolf wird erst insertet und macht Trouble wenn Important abgefeuert!
var int	Lobart_DIA_HALT_WegDamit;	//Important Info ausschalten!
var int Lobart_MILCHANGEBOT;		//Lobart bietet SC den MilchholAuftrag an!

//--------Matteo und Gritta --------------
var int	SCPaysForGritta;			//SC bezahlt für Gritta
var int Matteo_Deal; 				//Spieler läßt sich von Matteo bezahlen
var int Matteo_Day;					//wenn Spieler sich entscheiden sollte, nicht zu Matteo zurückzukehren

var int HannaGaveSword;				//Hanna hat dem Sc das Schwert gegeben
var int DayMeetAlwin;				//Tag der Erpressung
var int MoeOfferedTrain;			//Für 30 Gold trainier ich dich.
var int Kardif_OneQuestion;			//Kardif will 5 Goldmünzen für jede Frage, die der SC stellt.

var int Bartok_Deal;				//Spieler macht einen Deal mit Bartok
var int Bartok_Day;					//und die Tage werden wieder gezählt... - wenn mehr als 10, haut Bartok den Spieler um 
var int Bartok_OrkGesagt;			

var int Constantino_Gehilfe;		//Name ist Programm
var int Constantino_Logpatch1;		//Sermon kommt nur einmal
var int Constantino_Logpatch2;		//Sermon kommt nur einmal

var int Sonja_Says;
	
var int Sarah_WaffenGesehen;		//SC hat sich den Ramsch angesehen, den Sarah verkauft!
var int Lehmar_GeldGeliehen; 		//Geldbetrag den sich SC von Lehmar leiht!
var int Lehmar_GeldGeliehen_MitZinsen;
var int Lehmar_GeldGeliehen_Day;	//Der Tag an dem sich SC von Lehmar Geld leiht!
var int EddaPaid;					//Du hast Edda Geld gegeben
var int Coragon_Trade;				//SC zahlt seine Zeche und Coragon handelt mit SC

var int HelpOpolos;					//Spieler hilft Opolios beim Schafehüten				
var int HelpAgon;					//Spieler hilft Agon bim Kräutergarten
var int	HelpBabo;					//Spieler hilft Babo beim Fegen
var int BaboLikesYou;				//Babo mag den Spieler

var int Rengaru_InKnast;			//Andre fragt ab ob Rengaru in den Knast ging!
var int Nagur_UmsGeldBeschissen;	//Für minuspunkte bei Andre
var int wulfgarWantsMoney;			//Wulfgar will bezahlt werden!!

var int Hagen_GaveInfoKnight;		//Nachfragen wie man Paladin wird

// Bauerhöfe
var int Torlof_Probe;
	const int Probe_Sekob = 1;		//Joly: 0 wird verwendet//ADDON
	const int Probe_Bengar = 2;
var int Torlof_ProbeBestanden;
// ---------------------------
var int Buster_Duell;
var int Sentenza_Stimme;
var int Fester_Paid;
var int Cord_Approved;

// ---------------------------

var int Thekla_SCNaughty;			//=True SC war frech zur guten Küchenfee!
var int Torlof_PissedOff;			//SC hat Torlof verärgert und muß ihm einen Fisch bringen!
var int Torlof_SC_DarfZuLee;		//Torlof lässt SC ins Haupthaus von Onar
var int Torlof_SauerWegenSekob;  	//Torlof verteilt Rüffel, weilSC Sekob zu sanft angefasst hat!
var int Babera_BronkoKeinBauer;		//Babera verrät dem Spieler, daß Bronko gar nicht der Bauer ist!
var int Sekob_ersteChancevertan;  	//falls SC erste mal schon Weichei raushängen läßt, muß er zu Torlof gehen und sich Rüffel abholen.
var int Till_Angebot;				//Die Kohle, die der SC von Till erfeilscht.
var int Till_HatSeinGeldBehalten;	//Till hat dem SC gar nicht gegeben.
var int Till_IchMachsNurEinmal;		//Ich mach´s Bestätigung kommtz nur einmal!
var int Bengar_MILIZKLATSCHEN_Kohle;//Lohn fürs Milizenklatschen auf Hof 4.
var int Rumbold_Bezahlt;			//Miliz von Farm3 bekommen durch Bezahlung.


// ---------------------------
var int Mika_Helps;					//Miliz Mika hilft SC bei den SLD auf Akils Hof.
var int Akil_Sauer;					//SC verärgert Akil, weil er ihn um Kohle erpresst.
var int Akils_SLDStillthere;
var int Engardo_SchonAngeredet;		//Engarde sollte man besser nur einmal ansprechen.
var int	Kati_Mahlzeit;	
var int Lieferung_Geholt;

// ------ KAPITEL 2 ------
var int KnowsGerold;			//SC weiß dass, er mit Gerold sprechen muss.(DIA_PC_Mage und DIA_PAL_267_Sengrath gesetzt, wird  bei DIA_PAL_261_Gerold abgefragt
var int KnowsAboutGorn;			//Sc weiß dass Gorn im Kerker ist. (DIA_PC_Mage und DIA_PAL_267_Sengrath gesetzt, wird  bei DIA_PAL_261_Gerold abgefragt
var int DayContactGorn;			//Tag der Bestechung von Gerold 
var int PriceForGorn;			//Preis für Gorn, wird auf True gesetzt, wenn der SC Gorn freikaufen will.
var int	Gorns_Beutel;
VAR int SLDChooseMoreMoney;		//Sld hat 1000 Gold für die MinenMission bekommen.
var int FoodForGerold;			//Die Bestechung von Gerold (DIA_PAL_261_Gerod)
VAR int WantinDungeon;			//da man keine Permanenten Infos abfragen kann wird sie im DIA_PAL_261_Gerold abgefragt
var int	SetGornFree; 			//Jetzt kann Gerold sir den Schlüssel für Gorn geben!
var int GornsTreasure;			//Gorns Schatzversteck
var int GornDJG_WhatMonsters;	//Gorn berichtet über Draconier
var int Knows_Diego;
var int SearchForDiego;         //Milten (und Sengrath) sagt dem Player Diego sei in der Mine
var int FajethSendsYouBack;		//Snapper erledigt, Fajeth schickt den SC zurück in die Burg im Minental
var int Milten_Equipment;

var int Fajeth_Pay;
var int Fajeth_Ore;
var int Marcos_Ore;
var int Silvestro_Ore;

var int Ore_Counter;

var int Knows_WEAPON_1H_Special_01;	// (für ItWr_Silverblade) Spieler lernt WEAPON_1H_Special_01)

// ------ KAPITEL 3 ------
var int Pedro_Traitor;			//SC erfährt von Pedros Auge Innos Klau
var int RitualInnosEyeRuns;		//Das Umkehrritual läuft
var int Bennet_RepairDay;		//Repariere das Auge Innos
var int heroGIL_KDF2;			//== TRUE -> SC ist hoher KDF
var int Xardas_GoesToRitualInnosEye; //Xardas geht zum Umkehrritual
var int Pyrokar_GoesToRitualInnosEye; //Pyrokar geht zum Umkehrritual
var int Pyrokar_DeniesInnosEyeRitual; //Pyrokar will erst einen Beweis für Xardas Vertrauen
var int CorneliusFlee;			//Cornelius macht die Biege
var int Cornelius_TellTruth;	//Cornelius beichtet alles
var int Cornelius_PayForProof;
var int MiltenNW_GivesMonasteryKey; //Der SC hat den Klosterschlüssel erhalten.
var int Parlan_DontTalkToNovice;	//Rede nicht mit den Novizen
var int NeorasBrewsForYou;			//Neoras braut Tränke für dich!
var int BabosDocsOpen;				//Player hat sich Babos Schmuddelhelt angeguckt
var int Igaraz_ISPartner;			//igaraz und Player erpressen babo
var int MIS_Gorax_KillPedro;		//Serpentes gibt Gorax Geld den SLD-SC dazu zu bringen Pedro zu töten.
var int OpenedDiegosBag;			//Player hat den Sack geöffnet!
const int DiegosTreasure	= 2000;	//Diegos Schatz!
var int SC_KnowsProspektorSalandril;	//== TRUE MinanteilBetrug von Salandril ist aufgeflogen.
var int PyrokarToldKarrasToResearchDMT;	//== TRUE Karras macht DMT Research
var int Pyrokar_AskKarrasAboutDMTAmulett;	//== TRUE Karras fragen, wegen Schutzamulett gegen den Schwarzen Blick
var int MIS_Karras_FindBlessedStone;		//== LOG_SUCCESS SC bringt Karras gesegnetes Gestein, für Schutzamulett gegen den Schwarzen Blick
var int Angar_KnowsMadPsi;			//== TRUE Angar kennt die Wahrheit über die Bruderschaft des Schläfers.
var int Cornelius_IsLiar;
var int RescueBennet_KnowsWitness;	//Der SC hat erfahren, dass es einen Zeugen für den Mord gibt
var int RecueBennet_KnowsCornelius;	//Der SC hat erfahren, dass Cornelius der Zeuge ist.
var int Cornelius_ThreatenByMilSC;
var int SCIstRichtersLakai;
var int SCFoundMorgahard;
const int Gold_BlessSword 	= 5000; //Soviel kostet die erste Segnung deines PalSchwertes (Hoshi: bei Änderung bitte auch in der Text.d ändern!!!!(const string Bless_Sword))
const int CostForPAlSpells = 5; //Soviel kosten Pal Spells!!
var int SalandrilMinenAnteil_MAINCounter; 
var int SalandrilVerteilteMinenAnteil;
var int SCKnowsRichterKomproBrief;

var int Girion_Labercount;
var int TschuessBilgot;

// ------ KAPITEL 4 ------
var int DJG_SwampParty;			//Rod und Cipher greifen mit SC den Drachen an.
var int DJG_BiffParty;			//SCs eigener kleiner Söldner.
var int DJG_BiffSurvivedLastDragon;
var int Angar_willDJGwerden;	//Angar will DJG werden 
var int DJG_Angar_SentToStones; //Angar macht sich auf zum STonehenge
var int DJG_AngarGotAmulett;	//SC gibt Angar das Amulett zurück.
var int DJG_AngarAngriff;		//SC greift SkeletonMage zusammen mit Angar an!

var int HokurnLastDrink;		//Wann hat Hokurn letztes mal getrunken
var int	HokurnGetsDrink;		//Er hat was zu trrinken bekommen
var int HokurnTellsDragon;		//Erzählt dir was über drachen
var int GodarLikesYou;			//Wir wettern gegen die Oberviertelfuzzies!
var int KjornToldDragon;		//erzählt dir was über drachen
var int KjorntoldOrks;			//erzählt was über Orks
var int KjornToldOldCamp;		//erzählt über Burg im Minental
var int KjornToldColony;		//erzählt über das Minental

var int DragonTalk_Exit_Free;	
var int DJG_Biff_Stay; 				//zu nah am Drachen bleibt Biff stehen.
var int Keroloth_HasPayed;			//Keroloth hat Finderlohn bezahlt
var int Keroloths_BeutelLeer; 		//Beutel ist leer
var int OrikToldMissionChapter4;	//Orik hat dem SC den Auftrga erklährt
var int Sengrath_Missing;			//Sengrath ist auf der Suche nach seiner Armbrust gestorben.
var int Talbin_FollowsThroughPass;	//SC bringt Talbin über den Pass!
var int Biff_FollowsThroughPass;	//SC bringt Talbin über den Pass!
var int EngromIsGone;				//Engrom lebte zu Kapitel 4 noch. ist jetzt verschwunden!
var int TalkedTo_AntiPaladin;		//Paladin SC hat mit den Eliteorkanführer gesprochen.
var int Hyglas_SendsToKarras;		//Karras soll dir über die Sterne erzählen
var int Jan_WantsDragonBlood;		//== TRUE Jan kauft (PAL und KDF) Drachenblut ab.
const int Garond_KilledDragonGeld = 300;	//Geld für jeden getöteten Drachen.

var int DJG_BiffParty_nomore;
var int DJG_Biff_HalbeHalbe;	
var int DJG_Biff_SCGold;		//Joly: Biffs Check, wieviel Kohle der SC in der Tasche hat, damit er seinen Anteil bekommt.
var int BiffsAnteil;
var int DJG_Biff_HalbeHalbe_again;

// ------ KAPITEL 5 ------
var int Pyrokar_LetYouPassTalamon;	//Pyrokar gewährt dir Zugang zum Bibliotheks Vorraum.
var int SecretLibraryIsOpen; 		//Geheimtür zur Bibliothek wurde geöffnet
var int	HeroWasInLibrary;			//Spieler war im Keller des klosters
var int DayForFinalDJGArmor;		//Dann kanst du dir deine Rüstung abholen
var int PlayerHasFinalArmor;		//Sc hat DJG Rüstung
var int RosiFoundKap5;				//Rosi steht in der Wildnis
var int PAL_KnowsAbout_FINAL_BLESSING; //Paladine Sc hat rezept für Finale Waffensegnung gelesen!


// ------ KAPITEL 6 ------
var int ORkSturmDI;					//Ork haben das Schiff angegriffen.
var int Angar_DI_Party;				//Angar followt dem SC
var int SC_InnosEyeVergessen_DI;    //Spieler hat das Ding nicht zur DI mitgenommen!
var int SCFoundPedro;
var int UndeadDragonIsDead;			//UndeadDragon ist tot
var int DiegAndGornAreOnboard;		//fürs Video Extro_AllesWirdGut!


//****************************
//	Lehrer (hier sollten alle variablen für die Freischaltung der einzelnen Lehrer stehen
//****************************

//********************************
var int Alrik_TeachPlayer;		//1-hand Lerer in der city (bis 30)
var int Moe_TeachPlayer; 		//Stärkelehrer im Hafen (bis 30)
var int Bartok_TeachPlayer;     //Bogenlehrer in der Stadt (bis 30)
var int Boltan_TeachPlayer;		//Armbrustlehrer der Miliz (bis 60)
var int Wulfgar_TeachPlayer;	//1h Lehrer der Miliz (bis 60)
var int Girion_TeachPlayer;		//2h Lehrer für Pal (bis 60)
var int Thorben_TeachPlayer;	//Picklock Lehrer in Khorinis 
var int Buster_TeachPlayer;		//Einhand und Zweikampf (bis 30)
var int Cord_TeachPlayer;		//Einhand und Zweikampf (bis 60)
var int Lee_TeachPlayer;		//2h (bis 100)
var int Torlof_TeachPlayer;		//Stärkelehrer	(bis 90)
var int Dar_TeachPlayer;		//Geschicklichkeitslehrer (bis 90)
var int Cassia_TeachPlayer;		//Geschicklichkeit bis 90 + Schleichen
var int Jesper_TeachPlayer;		//Taschendiebstahl  
var int Ramirez_TeachPlayer;	//Schlösser öffnen
var int Carl_TeachPlayer;		//Stärke (-30)
var int Gaan_TeachPlayer; 		//Fell, Krallen!

//********************************

//-------------------
//City - ab Kapitel 1
//-------------------
//STR
var int Carl_TeachSTR;				//STR - 30
var int Harad_TeachSTR;				//STR - 45 wenn Schmieden gelernt
var int Mortis_TeachSTR;			//STR - 60 für Miliz oder Pal
var int Ingmar_TeachSTR;			//STR - 90
//DEX
var int Lares_TeachDEX;				//DEX - 30
var int Ruga_TeachDEX;				//DEX - 60 für Miliz oder Pal
var int Cassia_TeachDEX;			//DEX - 90 für 100 Gold oder umsonst (Attila)
//MAN
var int Vatras_TeachMANA;			//MANA - 50
var int Albrecht_TeachMANA;			//MANA - 100 für Pal
//1H
var int Alrik_Teach1H;				//1h - 30
var int Wulfgar_Teach1H;			//1h - 60 für Miliz oder Pal (oder 100 Gold)
var int Cedric_Teach1H;				//1h - 90 für Pal
//2H
var int Wulfgar_Teach2H;			//2h - 60 für Miliz oder Pal (oder 100 Gold)
var int Girion_Teach2H;				//2h - 90 für Pal
var int LordHagen_Teach2H;			//2h - 100 für Pal - Meister, ab 90% (Girion schickt dich auch)
//Bogen
var int Bartok_TeachBow;     		//Bow - 30 
//Armbrust
var int Ruga_TeachCrossbow;			//Crossbow - 60 für Miliz oder Pal
//Diebestalente
var int Cassia_TeachPickpocket;		//für 100 Gold oder umsonst (Attila)
var int Jesper_TeachSneak;			//für 100 Gold ...
var int Ramirez_TeachPicklock;		//für 100 Gold ...
var int Thorben_TeachPicklock;		//für 200, wenn Gritta bezahlt für 100, wenn Schuldenbuch zurück umsonst
//sonstige Talente
var int Harad_TeachSmith;			//Common
var int Constantino_TeachAlchemy; 	//Health_01, Health_02, Health 03, Perm_Health, Mana_01, Mana_02, Perm_STR
var int Ignaz_TeachAlchemy;			//Health_01, Mana_01, Speed, Perm_DEX

//Ignaz verkauft Scrolls...
/*
 SPL_TrfSheep		
 SPL_TrfScavenger	
 SPL_TrfGiantRat	
 SPL_TrfGiantBug	
 SPL_TrfWolf		
 SPL_TrfWaran		
 SPL_TrfSnapper		
 SPL_TrfWarg		
 SPL_TrfFireWaran	
 SPL_TrfLurker		
 SPL_TrfShadowbeast	
 SPL_TrfDragonSnapper
 SPL_Charm		
*/

//----------------------
//BigFarm - ab Kapitel 1
//----------------------
//STR

//var int 
var int Torlof_TeachSTR;			//STR - bis 100
var int Torlof_TeachDEX;			//DEX - bis 100
//DEX
//var int 

//var int 
//MAN
var int XXX_TeachMANA;				//Mana - 50
//1H
var int Buster_Teach1H;				//???
//var int 
//var int 
//2H
//var int 
var int Rod_Teach2H;				//2H bis 30
var int Cord_Teach2H;				//1H und 2H - 60 für SLD
var int Lee_Teach2H;				//2H - 100 für SLD und DJG - Meister, ab 90% (wer tot???)

var int Wolf_TeachBow;
//Bow
//var int 
//var int 
//var int 
//Crossbow
//var int 
//var int 
//var int 
//Sonstige Talente
var int Bennet_TeachCommon;
var int Bennet_TeachSmith; 			//wenn Spieler ihm Common-Waffe zeigt
	//Kapitel 2	oder 1+SLD		//WEAPON_1H_Special_01, WEAPON_2H_Special_01
	//Kapitel 3					//WEAPON_1H_Special_02, WEAPON_2H_Special_02	
	//Kapitel 4					//WEAPON_1H_Special_03, WEAPON_2H_Special_03	
	//Kapitel 5					//WEAPON_1H_Special_04, WEAPON_2H_Special_04

//-------------------------------
//NewWorld Surface - ab Kapitel 1
//-------------------------------
var int Sagitta_TeachAlchemy;		//Health_01 _02 _03, Mana_01_02_03, Perm_Mana, Perm_Health

//Animaltrophy
/*
	TROPHY_Claws			 
 	TROPHY_Fur				
 	TROPHY_Heart			 Golem/Dämon
 	TROPHY_ShadowHorn 		
 	TROPHY_FireTongue		 
 	TROPHY_BFWing			 
 	TROPHY_BFSting			
 	TROPHY_Mandibles		 
 	TROPHY_CrawlerPlate	 
 	TROPHY_DrgSnapperHorn	 
 	TROPHY_DragonScale		
 	TROPHY_DragonBlood		
*/

var int Gaan_TeachAnimalTrophy;		//TROPHY_Claws, TROPHY_Fur, TROPHY_BFSting, TROPHY_BFWing, TROPHY_Teeth, TROPHY_DrgSnapperHorn
var int Grom_TeachAnimalTrophy;  	//TROPHY_Fur, TROPHY_Teeth, TROPHY_Heart, TROPHY_Mandibles, TROPHY_ShadowHorn
var int Grimbald_TeachAnimalTrophy; //TROPHY_BFSting, TROPHY_BFWing, TROPHY_Claws, TROPHY_Mandibles, TROPHY_CrawlerPlate
var int Gestath_TeachAnimalTrophy; 	//TROPHY_FireTongue, TROPHY_CrawlerPlate, TROPHY_Mandibles, TROPHY_DrgSnapperHorn, TROPHY_DragonScale, TROPHY_DragonBlood
var int Godar_TeachAnimalTrophy; 	//NPC_TALENT_SNEAK, TROPHY_Teeth, TROPHY_BFSting, TROPHY_BFWing, TROPHY_DragonScale, TROPHY_DragonBlood
var int Talbin_TeachAnimalTrophy; 	//TROPHY_Fur, TROPHY_Claws, TROPHY_Heart, TROPHY_ShadowHorn

//--------------------
//Kloster ab Kapitel 1
//--------------------
//KREISE
//	Ulthar 		Kreis 1-3 		
//	Serpentes 	Kreis 1-5		//Wenn Ultar tot ODER Kreis 3 erreicht 
//	Pyrokar 	Kreis 1-6		//Wenn Serpentes tot oder Kreis 5 erreicht
//MANA
var int Parlan_TeachMANA; 		//Mana - 100, wenn GIL_KdF
var int Pyrokar_TeachMANA;		//Mana - 250, wenn von Parlan geschickt (schickt nur KdF)
//STR
var int Opolos_TeachSTR;		//STR - 50
//2H
var int XXX_Teach2H;			//2H - 70 für Nov/KdF
//PalRunes
var int Ulthar_TeachPalRunes;	//PalLightHeal, PalMediumHeal, PalFullHeal
var int Pyrokar_TeachPalRunes;	//PalLight
var int Serpentes_TeachPalRunes;//PalHolyBolt, PalRepelEvil, PalDestroyEvil
//Runes
var int Hyglas_TeachRunes; 		//Firebolt (Aufnahme), ***InstantFireball2***, ChargeFireball3, Pyrokinesis4, Firestorm5, FireRain6
var int Karras_TeachRunes; 		//SummonGoblinSkeleton1, SummonWolf2, SummonSkeleton3, SummonGolem4, SummonDemon5, ArmyOfDarkness6
var int Parlan_TeachRunes;		//LightHeal1, Light1, Windfist2, Sleep2, MediumHeal3, Fear3, DestroyUndead4, FullHeal5, Shrink6
var int Marduk_TeachRunes;		//IceBolt1, Zap2, LightningFlash3, IceCube3, Thunderball4, IceWave5
//*** BIBLIOTHEK - BreathOfDeath6, MassDeath6 ***
//Alchemy
var int Neoras_TeachAlchemy;	//Health_01, Health_02, Mana_01 _02 _03, Perm_Mana, Perm_STR (für Magier und Paladine)
var int Babo_TeachPlayer;		//1H + 2H - 70 für Nov/KdF

// ------ Scroll-Händler -------

// *** wo Runen-Scrolls kaufen ??? ***

//--------------------
//Oldcamp ab Kapitel 2
//--------------------
var int	Dobar_Learnsmith;		//(Common) Schmied Burg im Minental
var int Keroloth_TeachPlayer; 	//1-Hand Lehrer Burg im Minental (bis 60) 
var int Udar_TeachPlayer;		//Armbrustlehrer Burg im Minental (bis 30) 
var int Brutus_TeachSTR;		//Stärke Lehrer bis 75
//-----------------------------
//Oldworld Surface ab Kapitel 2
//-----------------------------

//-----------------------------
//Oldworld Surface ab Kapitel 4
//-----------------------------
var int Godar_TeachPlayer;		//Zähne, BFSting, BFWing, Schleichen, - DJG - OW Anfang, später Djg-Lager
var int Jan_TeachPlayer;		//Schmieden, Common, Special 1 beide, Special 2 beide. im OC
var int Hokurn_TeachPlayer;		//Kampflehrer bis 100 - DJG - OW Anfang, später Djg-Lager

//-------------  Sonstige Variablen -------------------------------------
var int Apple_Bonus;
var int Dunkelpilz_Bonus;
var int Honey_Bonus;
var int Mandibles_Bonus;
var int Knows_Bloodfly;
var int Bloodfly_Bonus;
var int Player_KnowsDunkelpilzBonus;
var int Skelett_Spawn;
var int TruheSfx;
var int GoblinGreen_Randomizer;
var int GoblinBlack_Randomizer;
var int Orc_Randomizer;

var int CurrentLevel; 	//Newworld_zen, Oldworld_Zen, Dragonisland_zen -> Level in dem sich der Player befindet!

//--------------------
//DragonIsland Kapitel 6
//--------------------

	/*		
	
	//Kapitäne:
	
	Jack
	Torlof			STR
	Jorgen
	
	//Crew
	
	Lee				1H + 2H 
	Girion			1H + 2H
	Milten			Mana Runen
	Lester			
	Gorn			2H
	Diego			Bow + Lockpick + Dex
	Angar			
	Bennet			Schmieden + STR
	Biff
	Wolf			Bow + Crossbow
	Lares			Dex + 1H
	Mario			
	Vatras			Alchemy + Kreise
	
	*/	


var int Kapitel01_Inventar;
var int Kapitel01_Gold;
var int Kapitel01_Erfahrung;
var int Kapitel01_Level;
var int Kapitel01_Zeit;

var int Kapitel02_Inventar;
var int Kapitel02_Gold;
var int Kapitel02_Erfahrung;
var int Kapitel02_Level;
var int Kapitel02_Zeit;

var int Kapitel03_Inventar;
var int Kapitel03_Gold;
var int Kapitel03_Erfahrung;
var int Kapitel03_Level;
var int Kapitel03_Zeit;

var int Kapitel04_Inventar;
var int Kapitel04_Gold;
var int Kapitel04_Erfahrung;
var int Kapitel04_Level;
var int Kapitel04_Zeit;

var int Kapitel05_Inventar;
var int Kapitel05_Gold;
var int Kapitel05_Erfahrung;
var int Kapitel05_Level;
var int Kapitel05_Zeit;

var int Kapitel06_Inventar;
var int Kapitel06_Gold;
var int Kapitel06_Erfahrung;
var int Kapitel06_Level;
var int Kapitel06_Zeit;

// Vob-Platzhalter

instance Platzhalter_Door (oCMobDoor);

// Onlinekram

var string username;
var string passwort;

var int online_playtime;
var string online_playtime_s;

var string eingabe;

var int Offline_Modus;
var int ValidateUserPasswort;

var string GOTHIC_RESTART;

var int CurrentLevel2;

var int Mod_OnlineMode;


// Savegame-Import

var int Mod_Import_Ghorim;
var int Mod_Import_Thorus;
var int Mod_Import_Mordrag;
var int Mod_Import_Fremde;
var int Mod_Import_Dusty;
var int Mod_Import_PDV;
var int Mod_Import_Dexter;
var int Mod_Import_Snaf;
var int Mod_Import_AL;
var int Mod_Import_NL;
var int Mod_Import_SL;


// XP-Konstanten

const int XP_Bookstand 		= 25;
const int XP_SwordBlessed	= 400;	//Schwert wurde geweiht
const int XP_STUNTBONUS		= 100;
const int XP_EXPLOITBONUS	= -100;
const int XP_OpenSecretLibrary	= 1000;
const int XP_FoundVinosKellerei	= 400; 	//Moleratefett anngewendet und VinosKellerei geöffnet
