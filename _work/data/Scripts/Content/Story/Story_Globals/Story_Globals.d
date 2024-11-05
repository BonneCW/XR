// *************************
// Globalvariablen für Story
// *************************

// Vampir
var int Blood;

var int Mod_LastLoaded;

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
var int Pickaxe_Fix;
var int Pickaxe_Count;

var int Mod_AMQ_DRM_Spawned;
var int Mod_RupertSpawnedSeelenpeiniger;
var int Mod_SleeperHint;
var int Mod_Treffen_Ende;
var int Mod_Brunhild_AW;
var int Mod_Meldor_Save;
var int Mod_RavenGomezInNW;
var int Mod_Uriziel_Background;
var int Mod_Uriziel_Frame;
var int Mod_Uriziel_Piece1;
var int Mod_Uriziel_Piece2;
var int Mod_Uriziel_Piece3;
var int Mod_Uriziel_Piece4;
var int Mod_Uriziel_Piece5;
var int Mod_Uriziel_Piece6;
var int Mod_Uriziel_Piece7;
var int Mod_Uriziel_Piece8;
var int Mod_Uriziel_PuzzleDescription1;
var int Mod_Uriziel_PuzzleDescription2;
var int Mod_Argez_Puzzle;
var int View_GomezTimer;
var int View_GomezKillsIch;
var int View_GomezKills;
var int Mod_EstebanOschust;
var int Mod_JG_PassNovize;
var int Mod_RatfordDrax_Weg;
var int Eduard_SpawnUpOne;
var int Eduard_SpawnUpTwo;
var int Mod_HedwigBeiAnselm;
var int Mod_Thorben_Robert;
var int Mod_DragonScales;
var int Mod_DragonBlood;
var int Mod_DragonElixier;
var int Mod_DragonSehne;
var int Mod_Miliz_Armbrust;
var int Mod_Cronos_ZiegenScroll;
var int Mod_Den_Problem;
var int TimeSwitch;
var int Mod_Aerwak;
var int Mod_Eivar;
var int Mod_Leichengase_InsertProbe;
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
var int Mod_PrismaZauber_Eremit;
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
var int Mod_Alax_Zutat_ManaEssenz;
var int Mod_Alax_Zutat_ManaExtrakt;
var int Mod_Alax_Zutat_ManaElixier;
var int Mod_Alax_Zutat_EssenzDerHeilung;
var int Mod_Alax_Zutat_ExtraktDerHeilung;
var int Mod_Alax_Zutat_ElixierDerHeilung;
var int Mod_Alax_Zutat_SchnelleHeilung;
var int Mod_Alax_Zutat_LeichteHeilung;
var int Mod_Alax_Zutat_LeichterManatrank;
var int Mod_Alax_Zutat_LeichtesMana;
var int Mod_Alax_Zutat_Buddlerfleisch;
var int Mod_Alax_Zutat_Dunkelpilz;
var int Mod_Alax_Zutat_Fliegenpilz;
var int Mod_Alax_Zutat_Sumpfkraut;
var int Mod_Alax_Zutat_Snapperkraut;
var int Mod_Alax_Zutat_Weidenbeere;
var int Mod_Alax_Zutat_Waldbeere;
var int Mod_Alax_Zutat_Blauflieder;
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
var int Mod_Argez_Stab;
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
var int Mod_EIS_Gestath_LurkerClaw;
var int Mod_EIS_Gestath_Keilerhauer;
var int Mod_EIS_Gestath_Flammenzunge;
var int Mod_EIS_Gestath_ShadowHorn;
var int Mod_EIS_Gestath_SharkTeeth;
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
var int Mod_Prisma_Array[3];
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
var int Mod_Diebe_FackelAn;
var int Mod_Diebe_Weg;
var int Mod_Diebe_Elvira;
var int Mod_RemoveAttilaFromKhorinis;
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
var int Mod_REL_FuegoDay;
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
var int Mod_Scavengerdung;
var int Mod_Scavengerdung_Tag;
var int Mod_WM_HexenSpruch;
var int Mod_Jim_Schutz;
var int Mod_Jim_FakeGeist;
var int Mod_Jim_AnselmDay;
var int Mod_LesterInRelendel;
var int Mod_LesterRELGuide;
var int Mod_LesterRELToMeeting;
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
var int Mod_IR_Keroloth;
var int Mod_IR_Marcos;
var int Mod_IR_Gerold;
var int Mod_IR_HebelProb;
var int Mod_IR_HebelProb2;
var int Mod_Mutantengolem;
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
var int Mod_Fernando_Mitternachtsspuk;
var int Mod_Valentino_Kidnapped;
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
var int Mod_JG_SuchenderDT;
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
var int Mod_HalsketteDerEhre;
var int Mod_GuertelDerEhre;
var int Mod_LinkerRingDerEhre;
var int Mod_RechterRingDerEhre;
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
var int Mod_BaboVerwirrt_Day;
var int Mod_ALTor_01;
var int Mod_ALTor_02;
var int Mod_ALTor_03;
var int Mod_XeresGetroffen;
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
var int Mod_Enter_AM_01;
var int Mod_Kimons_Traubenquest;
var int Mod_TemplerBeiThorus;
var int Mod_AL_Gebrandt_Gefangen;
var int AnfangsDialog;
var int OpenRyanBook;
var int Mod_HatGoldGeliehen;
var int Mod_LoganQuest;
var int Mod_OrikAbgeliefert;
var int Mod_Novi_Drin;
var int Mod_WM_BlutkultAttack;
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
var int Mod_Respawn;
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
var int Mod_Orcdog_Insert;
var int Mod_AL_AlissandroBefreit;
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
var int Mod_Wyver_Insert;
var int Bug_Mission;
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
var int Mod_FM_Barriere;
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
var int Mod_Enter_NewWorld_02;
var int Mod_NL_Bert;
var int Mod_Drago;
var int Mod_HasHexenScroll;
var int Mod_Enter_Minental_03;
var int Mod_Thorge_Dabei;
var int Seele_unterwegs;
var int Mod_Struk_Dabei;
var int TUG_Lorforn;
var int TUG_Matronen;
var int Gidan_Counter;
var int Mod_Enter_Addon_03;
var int Mod_Almanach_Geheimnis_Gelesen;
var int Beliar_TalkesselSchlacht;
var int Talkessel_Counter;
var int Mod_BeliarStatue_City_Dabei;
var int Mod_BeliarStatue_OldDementower_Dabei;
var int Mod_BeliarStatue_Krieger_Dabei;
var int Mod_BeliarStatue_Banditenlager_Dabei;
var int Urnol_InOT;
var int Mod_BeliarStatue_Bergfestung_Dabei;
var int Mod_BeliarStatue_Orkstadt_Dabei;
var int Mod_BeliarStatue_Canyon_Dabei;
var int Mod_AchilFliegt;
var int Mod_BeliarStatue_Strand_Dabei;
var int Mod_BeliarStatue_Eremit_Dabei;
var int Mod_Enter_NewWorld_03;
var int Mod_Enter_Minental_04;
var int Mod_Enter_Addon_04;
var int Mod_DragomirsLager;
var int LAGERFLUG_GDG_SEEN;
var int Mod_FercoBesiegt;
var int Mod_Enter_Orktempel_04;
var int Erkaeltungsdauer;
var int Monster_Max;
var int Monster_Hat;
var int Mod_Zufallsdrink_Intus;
var int Mod_ZufallsDrink_Counter;
var int Mod_Zufallsdrink_Att;
var int Mod_Enter_NewWorld_04;
var int Mod_Enter_Minental_05;
var int Mod_Enter_Addon_05;
var int Mod_VMG_Dabei;
var int Mod_SamuelSkipsTrank;
var int Mod_NL_Herkuleskraut;
var int Mod_SLD_Engardo;
var int Xardas3IstWeg;
var int Mod_Enter_NewWorld_05;
var int Mod_Enter_Minental_06;
var int Mod_AL_Alissandro_WaitForOric;
var int Mod_Enter_Addon_06;
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
var int Mod_Getrunken;
var int Mod_KampfGegenBartokVerloren;
var int Mod_SonjaHilftGegenBartok;
var string Mod_TeleportOrt;
var int Mod_UsesFirebolt;
var int Mod_QuatschGrog;
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
var int XardasBriefAnKarrasOpened;		//hat der Held den Brief von Xardas an Karras gelesen?
var int XardasLetterForSaturasOpened;		//hat der Held den Brief von Xardas an Saturas gelesen?
var int Mod_MyxirsKraeuter;
var int Mod_KenntBodo;
var int Mod_Borka_Sumpfkraut;
var int Mod_KG_LURKER;
var int Mod_GomezHorn;
var int Monster_Gezaehmt;
var int Mod_BartokUeberzeugt;
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
var int Fleischwanzen_Zertrampelt;
var int Fleischwanzen_Nachricht;
var C_NPC Mod_GuardRespawn;
var int Mod_LaufZeit;
var int Mod_NL_BarriereAttack;
var int Mod_Enter_PAT_First;
var int Kochen;
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
var int Mod_SL_Meer;
var int Mod_MilizErnst;
var int TimeCounter_Real;
var int MiltenBrautTrank;
var int MiltenBautRune;
var int Mod_RealStrength;
var int Mod_RealDexterity;
var int Mod_RealMana;
var int Mod_DialogGoraxAufgabe1;
var int Mod_DialogGoraxAufgabe2;
var int Mod_BilgotBromorBartok;
var int Mod_BartokZufallZahlen;
var int Mod_BilgotOK;
var int Mod_Circle;
var int Mod_Hermy_KnowsQuest;
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
var int BeliarSchreibStadtPlus;
var int Mod_Balthasar_Wolf;
var int Mod_View_Prisma;
var string Mod_ActionKey;
var int Mod_Soja_01;
var int Mod_Soja_02;
var int Mod_Soja_03;
var int Mod_Soja_04;
var int Mod_Soja_05;
var int Mod_Soja_06;
var int Mod_Soja_07;
var int Mod_Soja_08;
var int Mod_Soja_09;
var int Mod_Soja_010;
var int Mod_Soja_011;
var int Mod_Soja_012;
var int Mod_Soja_013;
var int Mod_Soja_014;
var int Mod_Soja_015;
var int Mod_Soja_016;
var int Mod_Soja_017;
var int Mod_Soja_018;
var int Mod_Soja_019;
var int Mod_Soja_020;
var int Mod_Soja_021;
var int Mod_Soja_022;
var int Mod_Soja_023;
var int Mod_Soja_024;
var int Mod_Soja_025;
var int Mod_Soja_026;
var int Mod_Soja_027;
var int Mod_Soja_028;
var int Mod_Soja_029;
var int Mod_Soja_030;
var int Mod_PolochTretor;
var int Mod_Poloch_Beat;
var int Mod_Tretor_Beat;
var int Mod_Darrion_Sumpfmensch;
var int Mod_BDS_FightStart;
var int Mod_Xardas_OrcsForGuildQuestSpawned;
var int Mod_SwimBonusCounter;
var int Mod_Argez_PrepareToDie;

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
var int 	ErzMob_92_Amount;
const int	ErzMob_92_Amount_MAX = 7;
var int 	ErzMob_93_Amount;
const int	ErzMob_93_Amount_MAX = 8;
var int 	ErzMob_94_Amount;
const int	ErzMob_94_Amount_MAX = 4;
var int 	ErzMob_95_Amount;
const int	ErzMob_95_Amount_MAX = 5;
var int 	ErzMob_96_Amount;
const int	ErzMob_96_Amount_MAX = 6;
var int 	ErzMob_97_Amount;
const int	ErzMob_97_Amount_MAX = 7;
var int 	ErzMob_98_Amount;
const int	ErzMob_98_Amount_MAX = 8;
var int 	ErzMob_99_Amount;
const int	ErzMob_99_Amount_MAX = 4;
var int 	ErzMob_100_Amount;
const int	ErzMob_100_Amount_MAX = 5;
var int 	ErzMob_101_Amount;
const int	ErzMob_101_Amount_MAX = 6;
var int 	ErzMob_102_Amount;
const int	ErzMob_102_Amount_MAX = 7;
var int 	ErzMob_103_Amount;
const int	ErzMob_103_Amount_MAX = 8;
var int 	ErzMob_104_Amount;
const int	ErzMob_104_Amount_MAX = 4;
var int 	ErzMob_105_Amount;
const int	ErzMob_105_Amount_MAX = 5;
var int 	ErzMob_106_Amount;
const int	ErzMob_106_Amount_MAX = 6;
var int 	ErzMob_107_Amount;
const int	ErzMob_107_Amount_MAX = 7;
var int 	ErzMob_108_Amount;
const int	ErzMob_108_Amount_MAX = 8;
var int 	ErzMob_109_Amount;
const int	ErzMob_109_Amount_MAX = 4;
var int 	ErzMob_110_Amount;
const int	ErzMob_110_Amount_MAX = 5;
var int 	ErzMob_111_Amount;
const int	ErzMob_111_Amount_MAX = 6;
var int 	ErzMob_112_Amount;
const int	ErzMob_112_Amount_MAX = 7;
var int 	ErzMob_113_Amount;
const int	ErzMob_113_Amount_MAX = 8;
var int 	ErzMob_114_Amount;
const int	ErzMob_114_Amount_MAX = 4;
var int 	ErzMob_115_Amount;
const int	ErzMob_115_Amount_MAX = 5;
var int 	ErzMob_116_Amount;
const int	ErzMob_116_Amount_MAX = 6;
var int 	ErzMob_117_Amount;
const int	ErzMob_117_Amount_MAX = 7;
var int 	ErzMob_118_Amount;
const int	ErzMob_118_Amount_MAX = 8;
var int 	ErzMob_119_Amount;
const int	ErzMob_119_Amount_MAX = 4;
var int 	ErzMob_120_Amount;
const int	ErzMob_120_Amount_MAX = 5;
var int 	ErzMob_121_Amount;
const int	ErzMob_121_Amount_MAX = 6;
var int 	ErzMob_122_Amount;
const int	ErzMob_122_Amount_MAX = 7;
var int 	ErzMob_123_Amount;
const int	ErzMob_123_Amount_MAX = 8;
var int 	ErzMob_124_Amount;
const int	ErzMob_124_Amount_MAX = 4;
var int 	ErzMob_125_Amount;
const int	ErzMob_125_Amount_MAX = 5;
var int 	ErzMob_126_Amount;
const int	ErzMob_126_Amount_MAX = 6;
var int 	ErzMob_127_Amount;
const int	ErzMob_127_Amount_MAX = 7;
var int 	ErzMob_128_Amount;
const int	ErzMob_128_Amount_MAX = 8;
var int 	ErzMob_129_Amount;
const int	ErzMob_129_Amount_MAX = 4;
var int 	ErzMob_130_Amount;
const int	ErzMob_130_Amount_MAX = 5;
var int 	ErzMob_131_Amount;
const int	ErzMob_131_Amount_MAX = 6;
var int 	ErzMob_132_Amount;
const int	ErzMob_132_Amount_MAX = 7;
var int 	ErzMob_133_Amount;
const int	ErzMob_133_Amount_MAX = 8;
var int 	ErzMob_134_Amount;
const int	ErzMob_134_Amount_MAX = 4;
var int 	ErzMob_135_Amount;
const int	ErzMob_135_Amount_MAX = 5;
var int 	ErzMob_136_Amount;
const int	ErzMob_136_Amount_MAX = 6;
var int 	ErzMob_137_Amount;
const int	ErzMob_137_Amount_MAX = 7;
var int 	ErzMob_138_Amount;
const int	ErzMob_138_Amount_MAX = 8;
var int 	ErzMob_139_Amount;
const int	ErzMob_139_Amount_MAX = 4;
var int 	ErzMob_140_Amount;
const int	ErzMob_140_Amount_MAX = 5;
var int 	ErzMob_141_Amount;
const int	ErzMob_141_Amount_MAX = 6;
var int 	ErzMob_142_Amount;
const int	ErzMob_142_Amount_MAX = 7;
var int 	ErzMob_143_Amount;
const int	ErzMob_143_Amount_MAX = 8;
var int 	ErzMob_144_Amount;
const int	ErzMob_144_Amount_MAX = 4;
var int 	ErzMob_145_Amount;
const int	ErzMob_145_Amount_MAX = 5;
var int 	ErzMob_146_Amount;
const int	ErzMob_146_Amount_MAX = 6;
var int 	ErzMob_147_Amount;
const int	ErzMob_147_Amount_MAX = 7;
var int 	ErzMob_148_Amount;
const int	ErzMob_148_Amount_MAX = 8;
var int 	ErzMob_149_Amount;
const int	ErzMob_149_Amount_MAX = 4;
var int 	ErzMob_150_Amount;
const int	ErzMob_150_Amount_MAX = 5;
var int 	ErzMob_151_Amount;
const int	ErzMob_151_Amount_MAX = 6;
var int 	ErzMob_152_Amount;
const int	ErzMob_152_Amount_MAX = 7;
var int 	ErzMob_153_Amount;
const int	ErzMob_153_Amount_MAX = 8;
var int 	ErzMob_154_Amount;
const int	ErzMob_154_Amount_MAX = 4;
var int 	ErzMob_155_Amount;
const int	ErzMob_155_Amount_MAX = 5;
var int 	ErzMob_156_Amount;
const int	ErzMob_156_Amount_MAX = 6;
var int 	ErzMob_157_Amount;
const int	ErzMob_157_Amount_MAX = 7;
var int 	ErzMob_158_Amount;
const int	ErzMob_158_Amount_MAX = 8;
var int 	ErzMob_159_Amount;
const int	ErzMob_159_Amount_MAX = 4;
var int 	ErzMob_160_Amount;
const int	ErzMob_160_Amount_MAX = 5;

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

// Angeln
var int 	AngelMob_01_Amount;
const int	AngelMob_01_Amount_MAX = 2;
var int 	AngelMob_02_Amount;
const int	AngelMob_02_Amount_MAX = 1;
var int 	AngelMob_03_Amount;
const int	AngelMob_03_Amount_MAX = 2;
var int 	AngelMob_04_Amount;
const int	AngelMob_04_Amount_MAX = 1;
var int 	AngelMob_05_Amount;
const int	AngelMob_05_Amount_MAX = 2;
var int 	AngelMob_06_Amount;
const int	AngelMob_06_Amount_MAX = 1;


// ------ Teacher MAX Werte ------
const int T_MEGA = 300; //Pyrokar MANA
const int T_MAX = 200;
const int T_HIGH = 120;
const int T_MED = 90;
const int T_LOW = 60;

//----- Artefakt Set der Bauern (HP)-----------------
var int	HP_Ring_1_Equipped;
var int	HP_Ring_2_Equipped;
var int HP_Amulett_Equipped;
/*
var int HP_Ring_Double_Bonus;
var int HP_Amulett_EinRing_Bonus;
*/
var int HP_Artefakt_Effekt;

//----- Artefakt Set der Priester (Mana)-----------------

var int	MA_Ring_1_Equipped;
var int	MA_Ring_2_Equipped;
var int MA_Amulett_Equipped;
/*
var int MA_Ring_Double_Bonus;
var int MA_Amulett_EinRing_Bonus;
*/
var int MA_Artefakt_Effekt;

//----- Artefakt Set der Krieger (STR)-----------------

var int	STR_Ring_1_Equipped;
var int	STR_Ring_2_Equipped;
var int STR_Amulett_Equipped;
 /*
var int STR_Ring_Double_Bonus;
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

var int MIL01_Equipped;

var int NOV01_Equipped;
var int WNOV01_Equipped;
var int SNOV01_Equipped;

var int SLD01_Equipped;

var int Leather01_Equipped;

var int MC_Equipped;
//-----------------------------------------------------

var INT WISPSKILL_LEVEL;


//---------------------------------------------------
var int MIS_Addon_Cavalorn_Letter2Vatras;			//übergebe Cavalorns Brief an Vatras


const int MinimumPassagePlants = 10;			//Anzahl der zu sammelnden Planzen für Constantino um in die Stadt zu kommen (Spielstart)
var int SaturasFirstMessageOpened;				//= TRUE wenn den Brief geöffnet
const int Greg_Farm1 	= 0;					//Vor der Stadt
const int Greg_Taverne 	= 1;					//Orlans Kneipe
const int Greg_Bigcross	= 2;					//Auf den Feldern von Onar
const int Greg_Dexter	= 3;					//Dexter

//Missing People
var int SCKnowsMissingPeopleAreInAddonWorld;	//= TRUE die Spur führt den SC zur Addonworld
var int MIS_Addon_Vatras_WhereAreMissingPeople;	//Vatras will wissen, was mit den Vermissten passiert ist.
var int MIS_LuciasLetter;						//= TRUE Elvrich hat den Abschiedsbrief von Lucia gelesen.

//Ranger
var int SC_KnowsRanger;							//= TRUE SC hat vom RING des Wassers gehört.
var int SC_IsRanger;							//= TRUE  Name ist programm
var int SCIsWearingRangerRing;					//= TRUE  Name ist programm
var int RangerRingIsLaresRing;					//= TRUE  Name ist programm
var int MIS_Vatras_FindTheBanditTrader;			//Vatras will den Namen des Händler aus dem oberen Viertel, der den Banditen Waffen liefert.
var int BanditTrader_Lieferung_Gelesen;			//= TRUE SC hat den Lieferungsschein gelesen.


// Ornamnet Portal
var int ORNAMENT_SWITCHED_BIGFARM;				//= TRUE  Das Steinkreis-Ornamentevent bei Onars Hof ist aktiviert worden
var int ORNAMENT_SWITCHED_FARM;					//= TRUE  Das Steinkreis-Ornamentevent bei Lobarts Hof ist aktiviert worden
var int ORNAMENT_SWITCHED_FOREST;				//= TRUE  Das Steinkreis-Ornamentevent im Medium Wald ist aktiviert worden
var int SC_SAW_ORNAMENT_MAP;					//= TRUE  SC hat gesehen, wo er hin muss zu den teinkreisen
var int Vatras2Saturas_FindRaven_Open;			//= TRUE SC hat den Brief von Vatras an Saturas geöffnet.

//Teleportsteine
var int SCUsed_TELEPORTER;						//= TRUE SC benutzte irgendeinen Teleporter



var int SC_ADW_ActivatedAllTelePortStones;		//= TRUE Alle ADW Teleporter sind aktiviert.

//ADDONWORLD KDW
var int StPl_nDocID;
var int SC_OpenedCavalornsBeutel;				//= TRUE SC hat einen Nugget erhalten, Cavalornsbeutel


var int 	ENTERED_ADDONWORLD;					//= TRUE war schon in der Addonworld
var int 	SC_Knows_WeaponInAdanosTempel;		//= TRUE SC weiß vom Schwert im Tempel
var int		SC_SummonedAncientGhost;			//= TRUE Quarhodron ist erschienen.

var int 	RavenIsInTempel;					//= TRUE Raven Video. Raven haut ab in den Temepl Adanos
var int 	RavenIsDead;						//= TRUE Raven ist tot und das Hauptziel vom Addon erreicht.
var int  	BeliarsWeaponSpecialDamage;			//Grundwert für Speziellen Schaden Beliars Klaue
var int  	BeliarDamageChance;					//Chance auf Extraschaden
var int  	SC_FailedToEquipBeliarsWeapon;		//= TRUE SC hat versucht die Waffe anzulegen. -> Blitz in Arsch.
var int  	BeliarsWeaponUpgrated;				//= TRUE SC hat die Waffe wenigstens einmal verbessert!


//--------------Banditenlager (Addonwelt)------------------
var int 	Player_HasTalkedToBanditCamp;				//Spieler war schon mal im BDT Camp


var int 	LennarPaket_Open; //ist jetzt FISKs Paket






const int	Lennar_picklock_amount = 12; //Anzahl seiner dietriche



var int 	Knows_MCELIXIER;

//----Tom-----

//----Fortuno-----
var int		Green_Extrem;

//Sklaven

//----Ambient BDT-------------
//----MC töten (ZS_DEad) Damit bloodwyn rauskommt-----------




//-------------GOLDHACKEN---------------------------------
var int 	Hero_HackChance;
var int 	Truemmer_Count;
var int 	Knows_Truemmerschlag;
var int 	Learn_by_doing;


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
var int SC_MadeStunt;




var int Francis_HasProof;						//Player hat Beweise für Schmuggel
var int Malcom_Accident;







var int Greg_GaveArmorToBones;

var int GregIsBack;
var int Read_JuansText;

var int Player_KnowsSchnellerHering;

//diese hier wegmachen!! Sobald es möglich ist!!

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


// ------ KAPITEL 1 ------

var int Bdt13_Dexter_verraten;
var int MIS_Steckbriefe;
// ------ Farm 1 ------
var int Lobart_Kleidung_Verkauft;



//*********************
//	Punkte für Aufnahme
//*********************


//******************************
const int APP_NONE 			= 0;
const int APP_Bosper 		= 1;
const int APP_Harad			= 2;
const int APP_Constantino 	= 3;

//-------------------------------
//*******************************




// ------ City ------
// -------------------
var int 	Mil_310_schonmalreingelassen;
var int 	Mil_333_schonmalreingelassen;
// -------------------
const int 	Canthar_Gold = 500;




const int 	Kopfgeld = 100;			//Gold pro ausgeleifertem Verbrecher (*3 für Diebesgilde)
const int	Andre_Sold = 200;
var int 	MIS_Andre_WAREHOUSE;




var int 	Charm_Test;
var int 	MIS_Ignaz_Charm;

// --------- DIEBE & CO ---------------------------------


//---------- Halvor der Hehler ---------------------

//--------- Kardif Hafenkneipe Wirt ----------------
//--------- Nagur (Akil's Bote)  ----------------
//--------- Attila  ----------------
//----------Jora-------------------------

//----------Diebesgilde--------------------
var int    	Knows_SecretSign;


var int		Edda_Schlafplatz;







var int 	Mil_305_schonmalreingelassen;





var int Sekob_RoomFree; //wenn Xardas dich zur Truhe schickt (für Portalraum)

var int Sld_Duelle_gewonnen;	//In ZS_Unconscious
var int SOLD;



//---------------------------
//	KLOSTER
//---------------------------
var int 	MIS_ParlanFegen; 			//Novizenkammern ausfegen
const int 	Summe_Kloster = 1000;



var	int		KNOWS_FIRE_CONTEST;			//Spieler kennt das alte Gesetz


const int   CostRescueGorn  = 500;      //Preis für Gorns Freilassung für Garond!!!!








var int 	Hammer_Taken;				//Spieler hat Hammer Innos geklaut


// ------ KAPITEL 2 ------


const int 	Meat_Amount = 24;		// Burg im Minental Ambient Mission Kapitel 2




// ------ KAPITEL 3 ------
var int 	MIS_ReadyforChapter4; 				//Mit dieser Varible in den Levelchange zur OW -> Kapitel 4

//Gildenabhängig
var int		MIS_Serpentes_MinenAnteil_KDF;		//Serpentes schickt dich los die gefälschten Minenanteile einzusammeln. KDF


// ------ KAPITEL 4 ------
var int 	MIS_KillOrkOberst;			//Kill den Ork Oberst.

// ------ KAPITEL 5 ------
var int 	MIS_Xardas_SCCanOpenIrdorathBook; //SC kann Buch "Die Hallen von Irdorath" lesen
var int 	MIS_SCKnowsWayToIrdorath;	//SC weiß jetzt, dass er das Schiff braucht und kennt den Weg zur Dracheninsel
var int 	ItWr_HallsofIrdorathIsOpen;	//SC hat das Buch geöffnet
var int 	ItWr_SCReadsHallsofIrdorath;//SC hat das Buch durchgelesen
var int 	PlayerGetsAmulettOfDeath;
var int 	PlayergetsFinalDJGArmor;


const int 	Max_Crew = 9;				//Max. Crewmitglieder
const int   Min_Crew = 5;				//Min. Crewmitglieder //Joly: wenn dieser Wert geändert wird, müssen auch die Dialoge angepasst werden!!!!!!!!!

// Crewmembers

var int 	MIS_ShipIsFree;				//Das Schiff ist frei und SC kann mit seinen Jungs draufgehen.


// ------ KAPITEL 6 ------


//**************************
// Allgemeine Hilfsvariablen
//**************************
var int B_Chapter4_OneTime;

// ------ KAPITEL 1 ------

//--------Matteo und Gritta --------------









// Bauerhöfe
	const int Probe_Sekob = 1;		//Joly: 0 wird verwendet//ADDON
	const int Probe_Bengar = 2;
// ---------------------------

// ---------------------------



// ---------------------------

// ------ KAPITEL 2 ------
var int	Gorns_Beutel;




// ------ KAPITEL 3 ------
var int BabosDocsOpen;				//Player hat sich Babos Schmuddelhelt angeguckt
var int OpenedDiegosBag;			//Player hat den Sack geöffnet!
const int DiegosTreasure	= 2000;	//Diegos Schatz!
var int SC_KnowsProspektorSalandril;	//== TRUE MinanteilBetrug von Salandril ist aufgeflogen.
var int Cornelius_IsLiar;
const int Gold_BlessSword 	= 5000; //Soviel kostet die erste Segnung deines PalSchwertes (Hoshi: bei Änderung bitte auch in der Text.d ändern!!!!(const string Bless_Sword))
const int CostForPAlSpells = 5; //Soviel kosten Pal Spells!!
var int SCKnowsRichterKomproBrief;

var int TschuessBilgot;

// ------ KAPITEL 4 ------


const int Garond_KilledDragonGeld = 300;	//Geld für jeden getöteten Drachen.


// ------ KAPITEL 5 ------
var int SecretLibraryIsOpen; 		//Geheimtür zur Bibliothek wurde geöffnet
var int	HeroWasInLibrary;			//Spieler war im Keller des klosters
var int PAL_KnowsAbout_FINAL_BLESSING; //Paladine Sc hat rezept für Finale Waffensegnung gelesen!


// ------ KAPITEL 6 ------


//****************************
//	Lehrer (hier sollten alle variablen für die Freischaltung der einzelnen Lehrer stehen
//****************************

//********************************

//********************************

//-------------------
//City - ab Kapitel 1
//-------------------
//STR
//DEX
//MAN
var int Albrecht_TeachMANA;			//MANA - 100 für Pal
//1H
//2H
//Bogen
//Armbrust
//Diebestalente
//sonstige Talente

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

var int Bennet_TeachCommon;
var int Bennet_TeachSmith;

//-------------  Sonstige Variablen -------------------------------------
var int Apple_Bonus;
var int Dunkelpilz_Bonus;
var int Honey_Bonus;
var int Mandibles_Bonus;
var int Knows_Bloodfly;
var int Bloodfly_Bonus;
var int Skelett_Spawn;
var int TruheSfx;
var int GoblinGreen_Randomizer;
var int GoblinBlack_Randomizer;
var int Orc_Randomizer;

var int CurrentLevel;

// Vob-Platzhalter

instance Platzhalter_Door (oCMobDoor);

var string GOTHIC_RESTART;

var int CurrentLevel2;


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

var int Mod_Seelenstein_Urnol;
var int Mod_Seelenstein_Formwandler;
var int Mod_Seelenstein_UD;
var int Mod_Seelenstein_Complete;
var int Mod_DickeLuft_Running;

var int Mod_AddedSonorAtLares;
var int Mod_Removed_Sonor;
var int Mod_ChangeCollision_Temple;

var int Mod_EchsenTot;
