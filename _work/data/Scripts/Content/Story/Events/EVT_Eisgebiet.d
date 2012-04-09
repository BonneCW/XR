//****************************
// 	Das Eisgebiet, sonst nichts.
CONST STRING MOBNAME_HEXENBUCHREGAL			= "Bücherregal";

var int NORDMINEMINEERZ_1_Amount;
var int NORDMINEMINEERZ_2_Amount;
var int NORDMINEMINEERZ_3_Amount;
var int NORDMINEMINEERZ_4_Amount;
var int NORDMINEMINEERZ_5_Amount;
var int NORDMINEMINEERZ_6_Amount;
var int NORDMINEMINEERZ_7_Amount;
var int NORDMINEMINEERZ_8_Amount;
var int NORDMINEMINEERZ_9_Amount;
var int NORDMINEMINEERZ_10_Amount;

var int NORDMINEMINEERZ_11_Amount;
var int NORDMINEMINEERZ_12_Amount;
var int NORDMINEMINEERZ_13_Amount;
var int NORDMINEMINEERZ_14_Amount;
var int NORDMINEMINEERZ_15_Amount;
var int NORDMINEMINEERZ_16_Amount;
var int NORDMINEMINEERZ_17_Amount;
var int NORDMINEMINEERZ_18_Amount;
var int NORDMINEMINEERZ_19_Amount;
var int NORDMINEMINEERZ_20_Amount;

var int NORDMINEMINEERZ_21_Amount;
var int NORDMINEMINEERZ_22_Amount;
var int NORDMINEMINEERZ_23_Amount;
var int NORDMINEMINEERZ_24_Amount;
var int NORDMINEMINEERZ_25_Amount;
var int NORDMINEMINEERZ_26_Amount;

const int NORDMINEMINEERZ_1_Amount_MAX = 3;
const int NORDMINEMINEERZ_2_Amount_MAX = 3;
const int NORDMINEMINEERZ_3_Amount_MAX = 3;
const int NORDMINEMINEERZ_4_Amount_MAX = 3;
const int NORDMINEMINEERZ_5_Amount_MAX = 3;
const int NORDMINEMINEERZ_6_Amount_MAX = 3;
const int NORDMINEMINEERZ_7_Amount_MAX = 3;
const int NORDMINEMINEERZ_8_Amount_MAX = 3;
const int NORDMINEMINEERZ_9_Amount_MAX = 3;
const int NORDMINEMINEERZ_10_Amount_MAX = 3;


const int NORDMINEMINEERZ_11_Amount_MAX = 3;
const int NORDMINEMINEERZ_12_Amount_MAX = 3;
const int NORDMINEMINEERZ_13_Amount_MAX = 3;
const int NORDMINEMINEERZ_14_Amount_MAX = 3;
const int NORDMINEMINEERZ_15_Amount_MAX = 3;
const int NORDMINEMINEERZ_16_Amount_MAX = 3;
const int NORDMINEMINEERZ_17_Amount_MAX = 3;
const int NORDMINEMINEERZ_18_Amount_MAX = 3;
const int NORDMINEMINEERZ_19_Amount_MAX = 3;
const int NORDMINEMINEERZ_20_Amount_MAX = 3;

const int NORDMINEMINEERZ_21_Amount_MAX = 3;
const int NORDMINEMINEERZ_22_Amount_MAX = 3;
const int NORDMINEMINEERZ_23_Amount_MAX = 3;
const int NORDMINEMINEERZ_24_Amount_MAX = 3;
const int NORDMINEMINEERZ_25_Amount_MAX = 3;
const int NORDMINEMINEERZ_26_Amount_MAX = 3;


var int EisgebietThomas;

FUNC VOID ENTER_EVT_EISGEBIETMONSTER ()
{
	if (EisgebietThomas == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play 	("Ravens_Earthquake4" );

/*
                 //****************************
                 // 	Eiswölfe im  Eisgebiet
                 // 


        
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_1");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_2");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_3");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_4");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_5");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_11");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_12");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_13");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_14");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_15");                 
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_21");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_22");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_23");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_24");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_25"); 
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_31");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_32");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_33");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_34");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_35");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_41");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_42");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_43");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_44");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_45");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_51");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_52");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_53");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_54");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_55");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_61");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_62");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_63");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_64");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_65");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_71");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_72");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_73");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_74");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_75");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_81");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_82");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_83");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_84");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_85");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_91");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_92");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_93");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_94");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_95");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_101");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_102");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_103");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_104");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_105");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_111");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_112");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_113");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_114");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_115");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_121");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_122");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_123");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_124");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_125");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_131");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_132");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_133");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_134");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_135");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_141");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_142");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_143");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_144");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_145");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_151");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_152");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_153");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_154");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_155");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_161");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_162");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_163");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_164");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_165");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_171");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_172");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_173");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_174");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_185");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_181");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_182");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_183");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_184");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_185");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_191");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_192");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_193");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_194");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_205");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_201");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_202");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_203");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_204");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_215");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_211");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_212");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_213");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_214");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_215");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_221");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_222");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_223");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_224");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_225");





                 //****************************
                 // 	Schneehasen im  Eisgebiet
                 // 


                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_1");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_2");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_4");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_5");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_7");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_8");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_11");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_12");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_14");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_15");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_17");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_18");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_21");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_22");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_24");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_25");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_27");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_28");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_31");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_32");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_34");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_35");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_37");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_38");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_41");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_42");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_44");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_45");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_47");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_SCHNEEHASEN_48");




                 //****************************
                 // 	Goblins im  Eisgebiet
                 // 


                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_1");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_2");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_3");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_4");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_5");




                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_6");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_7");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_8");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_9");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_10");





                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_16");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_17");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_18");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_19");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_20");



                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_21");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_22");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_23");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_24");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_25");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_26");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_27");






                 //****************************
                 // 	Goblins in einer Höhle bei der Stadt
                 // 

                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_11");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_12");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_13");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_14");



                  //****************************
                 // 	Goblins im Nordostteleporter mit dem Steindachmover ist eher östlich
                 // 

                   Wld_InsertNpc (Gobbo_Black,"FP_ROAM_NORDOSTWACHE_1");
                   Wld_InsertNpc (Gobbo_Black,"FP_ROAM_NORDOSTWACHE_1");



                  //****************************
                 // 	Schattenleufer beim Einsiedler Ein Ork kamm auf besuch und hatte einen Schattenleufer im Schleptau.
                 //  Der ork sah die fallgrube nicht und stürtze sich tötlich zu tode. Der Schattenleufer blieb weil es schön warm wa.


               Wld_InsertNpc (Shadowbeast,"FP_ROAM_EINSIEDLERSCHATTENLEUFER_1");


                 //****************************
                 // 	Schattenleufer im Norden
                 //

               Wld_InsertNpc (Shadowbeast,"FP_ROAM_NORDSCHATTENLEUFER_1");
               Wld_InsertNpc (Shadowbeast,"FP_ROAM_NORDSCHATTENLEUFER_3");




                 //****************************
                 // 	Eisgolems im  Eisgebiet
                 // 



                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_1");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_2");

                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_3");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_4");

                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_5");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_6");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_7");

                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_8");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_9");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_10");

                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_11");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_12");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_13");

                 //****************************
                 // 	Feuergolems im  Eisgebiet als Wächter der heißen Quellen
                 // 



                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_1");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_2");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_3");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_4");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_5");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_6");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_7");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_8");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_9");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_10");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_11");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_12");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_13");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_14");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_15");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_16");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_17");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_18");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_19");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_20");
                   Wld_InsertNpc (FireGolem,"FP_ROAM_FEUERGOLEM_21");






                 //****************************
                 // 	TROLLE im  Eisgebiet
                 // 



                   Wld_InsertNpc (Troll,"FP_ROAM_NORDMINETROLL_1");
                   Wld_InsertNpc (Troll,"FP_ROAM_NORDMINETROLL_5");
                   Wld_InsertNpc (Troll,"FP_ROAM_NORDMINETROLL_6");
                   Wld_InsertNpc (Troll,"FP_ROAM_NORDMINETROLL_9");
                   Wld_InsertNpc (Troll,"FP_ROAM_NORDMINETROLL_11");

                  //****************************
                 // 	Monster im  Nordtempel
                 // 


                   Wld_InsertNpc (Giant_Rat,"FP_ROAM_NORDTEMPELRATEE_01");
                   Wld_InsertNpc (Giant_Rat,"FP_ROAM_NORDTEMPELRATEE_02");
                   Wld_InsertNpc (Giant_Rat,"FP_ROAM_NORDTEMPELRATEE_03");




                   Wld_InsertNpc (StoneguardianEisbebiet,"FP_ROAM_NORDTEMPELSTEINW_01");
                   Wld_InsertNpc (StoneguardianEisbebiet,"FP_ROAM_NORDTEMPELSTEINW_02");
                   Wld_InsertNpc (StoneguardianEisbebiet,"FP_ROAM_NORDTEMPELSTEINW_03");
                   Wld_InsertNpc (StoneguardianEisbebiet,"FP_ROAM_NORDTEMPELSTEINW_04");
                   Wld_InsertNpc (StoneguardianEisbebiet,"FP_ROAM_NORDTEMPELSTEINW_05");
                   Wld_InsertNpc (StoneguardianEisbebiet,"FP_ROAM_NORDTEMPELSTEINW_06");


*/

		Wld_SendTrigger ("SCHNEEMOVER");

		EisgebietThomas = TRUE;
	};	
};



/********************************************************************************/
/*************************Teleporter im Eisgebiet Turm Teleporter****************************************/

func void TELEPORTERFUNKTION_EIS_DORF  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE ); 

	Snd_Play ("MFX_TELEPORT_CAST"); 

	Npc_ClearAIQueue (hero);
 
	AI_Teleport        (hero, "EIS_39");
};

func void TELEPORTERFUNKTION_EIS_NORD_OST  () 
{
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE );

	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_ClearAIQueue (hero);

	AI_Teleport        (hero, "NORD_OST_TELEPORT");
};

func void TELEPORTERFUNKTION_EIS_OST  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE );

	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_ClearAIQueue (hero);

	AI_Teleport        (self, "OST_TELEPORT");
};

func void TELEPORTERFUNKTION_EIS_TURM  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE );

	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_ClearAIQueue (hero);

	AI_Teleport        (self, "EIS_380");
};

func void TELEPORTERFUNKTION_EIS_TURM2  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE );

	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_ClearAIQueue (hero);

	AI_Teleport        (self, "TURMOBEN");
};

func void TELEPORTERFUNKTION_EIS_OSTDUNEGN  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE );

	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_ClearAIQueue (hero);

	AI_Teleport        (self, "TURMOBEN");
};

func void TELEPORTERFUNKTION_EIS_NORDOSTDUNGEON  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE );

	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_ClearAIQueue (hero);

	AI_Teleport        (self, "TURMOBEN");
};


/********************************************************************************/
/*************************Teleporter im Eisgebiet Süd tempel Teleporter****************************************/

func void TELEPORTERFUNKTION_EIS_SUEDOSTDUNGEON  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE );

	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_ClearAIQueue (hero);

	AI_Teleport        (self, "OST_TELEPORT");
};

func void TELEPORTERFUNKTION_EIS_ZUMSUEDOSTDUNGEON  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE );

	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_ClearAIQueue (hero);

	AI_Teleport        (self, "SUEDTEMPEL");
};


/********************************************************************************/
/*************************Teleporter im Eisgebiet Nordtempel Teleporter nach oben aus dem Tempel raus****************************************/

func void TELEPORTERFUNKTION_EIS_NORDDUNGEON  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE );

	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_ClearAIQueue (hero);

	AI_Teleport        (self, "TELEPORTNORDDUNGEON");
};

func void TELEPORTERFUNKTION_EIS_NORDTURMOBEN  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE );

	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_ClearAIQueue (hero);

	AI_Teleport        (self, "TURMOBEN");
};

func void TELEPORTERFUNKTION_EIS_TELEPORTTURMOBENZUMNORDTURM  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE );

	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_ClearAIQueue (hero);

	AI_Teleport        (self, "TELEPORTNORDDUNGEON");
};



/********************************************************************************/
/*************************Teleporter im Eisgebiet Haubteingang zum Turm****************************************/


func void TELEPORTERFUNKTION_EIS_NORD  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE );

	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_ClearAIQueue (hero);

	AI_Teleport        (self, "NORD_TELEPORT");
};

func void TELEPORTERFUNKTION_EIS_NORD_TURM  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE );

	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_ClearAIQueue (hero);

	AI_Teleport        (self, "TURMOBEN");
};


/*************************Gegenstände********************/


INSTANCE Kristallhammer1 (C_Item) 
{	
	name 				=	"Kristallhammer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Kriegshammer1;

	damageTotal			= 	Damage_Kriegshammer1;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Kriegshammer1;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Kriegshammer1;
	visual 				=	"Kristallhammer.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


FUNC INT B_NORDMINE_Bestimmung()
{
	//bin ich mobsi X und habe ich noch Erz übrig?
	if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_2") && (NORDMINEMINEERZ_1_Amount_MAX > NORDMINEMINEERZ_1_Amount)
	{
		NORDMINEMINEERZ_1_Amount = (NORDMINEMINEERZ_1_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_60") && (NORDMINEMINEERZ_2_Amount_MAX > NORDMINEMINEERZ_2_Amount)
	{
		NORDMINEMINEERZ_2_Amount = (NORDMINEMINEERZ_2_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_58") && (NORDMINEMINEERZ_3_Amount_MAX > NORDMINEMINEERZ_3_Amount)
	{
		NORDMINEMINEERZ_3_Amount = (NORDMINEMINEERZ_3_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_59") && (NORDMINEMINEERZ_4_Amount_MAX > NORDMINEMINEERZ_4_Amount)
	{
		NORDMINEMINEERZ_4_Amount = (NORDMINEMINEERZ_4_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_57") && (NORDMINEMINEERZ_5_Amount_MAX > NORDMINEMINEERZ_5_Amount)
	{
		NORDMINEMINEERZ_5_Amount = (NORDMINEMINEERZ_5_Amount +1);
		return TRUE;
	}
        else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_56") && (NORDMINEMINEERZ_6_Amount_MAX > NORDMINEMINEERZ_6_Amount)
	{
		NORDMINEMINEERZ_6_Amount = (NORDMINEMINEERZ_6_Amount +1);
		return TRUE;
	}
        else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_55") && (NORDMINEMINEERZ_7_Amount_MAX > NORDMINEMINEERZ_7_Amount)
	{
		NORDMINEMINEERZ_7_Amount = (NORDMINEMINEERZ_7_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_52") && (NORDMINEMINEERZ_8_Amount_MAX > NORDMINEMINEERZ_8_Amount)
	{
		NORDMINEMINEERZ_8_Amount = (NORDMINEMINEERZ_8_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_50") && (NORDMINEMINEERZ_9_Amount_MAX > NORDMINEMINEERZ_9_Amount)
	{
		NORDMINEMINEERZ_9_Amount = (NORDMINEMINEERZ_9_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_51") && (NORDMINEMINEERZ_10_Amount_MAX > NORDMINEMINEERZ_10_Amount)
	{
		NORDMINEMINEERZ_10_Amount = (NORDMINEMINEERZ_10_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_49") && (NORDMINEMINEERZ_11_Amount_MAX > NORDMINEMINEERZ_11_Amount)
	{
		NORDMINEMINEERZ_11_Amount = (NORDMINEMINEERZ_11_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_48") && (NORDMINEMINEERZ_12_Amount_MAX > NORDMINEMINEERZ_12_Amount)
	{
		NORDMINEMINEERZ_12_Amount = (NORDMINEMINEERZ_12_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_47") && (NORDMINEMINEERZ_13_Amount_MAX > NORDMINEMINEERZ_13_Amount)
	{
		NORDMINEMINEERZ_13_Amount = (NORDMINEMINEERZ_13_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_46") && (NORDMINEMINEERZ_14_Amount_MAX > NORDMINEMINEERZ_14_Amount)
	{
		NORDMINEMINEERZ_14_Amount = (NORDMINEMINEERZ_14_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_45") && (NORDMINEMINEERZ_15_Amount_MAX > NORDMINEMINEERZ_15_Amount)
	{
		NORDMINEMINEERZ_15_Amount = (NORDMINEMINEERZ_15_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_44") && (NORDMINEMINEERZ_16_Amount_MAX > NORDMINEMINEERZ_16_Amount)
	{
		NORDMINEMINEERZ_16_Amount = (NORDMINEMINEERZ_16_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_42") && (NORDMINEMINEERZ_17_Amount_MAX > NORDMINEMINEERZ_17_Amount)
	{
		NORDMINEMINEERZ_17_Amount = (NORDMINEMINEERZ_17_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_41") && (NORDMINEMINEERZ_18_Amount_MAX > NORDMINEMINEERZ_18_Amount)
	{
		NORDMINEMINEERZ_18_Amount = (NORDMINEMINEERZ_18_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_40") && (NORDMINEMINEERZ_19_Amount_MAX > NORDMINEMINEERZ_19_Amount)
	{
		NORDMINEMINEERZ_19_Amount = (NORDMINEMINEERZ_19_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_39") && (NORDMINEMINEERZ_20_Amount_MAX > NORDMINEMINEERZ_20_Amount)
	{
		NORDMINEMINEERZ_20_Amount = (NORDMINEMINEERZ_20_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_38") && (NORDMINEMINEERZ_21_Amount_MAX > NORDMINEMINEERZ_21_Amount)
	{
		NORDMINEMINEERZ_21_Amount = (NORDMINEMINEERZ_21_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_31") && (NORDMINEMINEERZ_22_Amount_MAX > NORDMINEMINEERZ_22_Amount)
	{
		NORDMINEMINEERZ_22_Amount = (NORDMINEMINEERZ_22_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_32") && (NORDMINEMINEERZ_23_Amount_MAX > NORDMINEMINEERZ_23_Amount)
	{
		NORDMINEMINEERZ_23_Amount = (NORDMINEMINEERZ_23_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_33") && (NORDMINEMINEERZ_24_Amount_MAX > NORDMINEMINEERZ_24_Amount)
	{
		NORDMINEMINEERZ_24_Amount = (NORDMINEMINEERZ_24_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_34") && (NORDMINEMINEERZ_25_Amount_MAX > NORDMINEMINEERZ_25_Amount)
	{
		NORDMINEMINEERZ_25_Amount = (NORDMINEMINEERZ_25_Amount +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "SUEDMINE_35") && (NORDMINEMINEERZ_26_Amount_MAX > NORDMINEMINEERZ_26_Amount)
	{
		NORDMINEMINEERZ_26_Amount = (NORDMINEMINEERZ_26_Amount +1);
		return TRUE;
	};

	//sonst nicht
	return FALSE;
};