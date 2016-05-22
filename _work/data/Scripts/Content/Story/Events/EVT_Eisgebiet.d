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
	PrintDebug("Spawn Eisgebiet");
	if (EisgebietThomas == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play 	("Ravens_Earthquake4" );



                 //****************************
                 // 	Meatbugzwerg im Turm
                 // 


  Wld_InsertNpc (Meatbugzwerg,"FP_ROAM_EISGEBIET_MEATBUGZWERG");








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
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_250");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_251");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_252");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_260");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_261");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_262");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_264");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_270");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_271");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_272");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_273");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_274");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_280");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_281");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_282");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_283");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_284");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_290");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_291");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_292");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_293");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_294");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_300");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_301");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_302");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_303");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_304");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_310");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_311");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_312");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_313");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_314");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_310");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_311");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_312");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_313");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_314");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_401");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_402");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_403");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_405");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_409");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_410");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_411");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_412");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_413");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_415");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_419");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_421");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_422");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_423");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_425");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_429");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_459");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_451");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_452");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_453");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_455");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_456");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_470");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_472");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_473");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_475");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_476");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_500");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_501");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_502");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_503");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_520");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_521");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_522");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_523");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_524");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_525");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_526");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_527");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_531");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_532");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_533");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_542");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_544");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_545");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_551");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_552");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_553");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_561");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_562");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_563");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_580");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_581");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_582");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_583");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_584");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_585");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_586");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_587");         
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_652");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_655");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_656");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_657");




                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_700");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_701");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_702");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_703");         
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_704");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_706");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_707");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_708");


          Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_714");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_716");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_717");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_718");


          Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_721");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_723");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_724");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_725");
            Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_726");
                Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_727");
         Wld_InsertNpc (IcewolfEisgebiet,"FP_ROAM_EISGEBIET_WOLF_728");



      //****************************
                 // 	Keiler im  Eisgebiet
                 // 


         Wld_InsertNpc (Troll_Black_Eis,"FP_ROAM_EISGEBIET_Troll_Black_1");

              

      //****************************
                 // 	Keiler im  Eisgebiet
                 // 

                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_2");         
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_1");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_3");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_4");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_5");



                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_16");         
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_11");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_13");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_14");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_15");

               Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_26");         
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_21");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_23");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_24");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_25");

          Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_36");         
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_31");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_33");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_34");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_35");



  Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_47");         
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_41");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_43");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_44");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_45");

  Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_57");         
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_51");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_53");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_54");
                Wld_InsertNpc (Eisdrachensnapper,"FP_ROAM_EISGEBIET_EISDRACHENSNAPPER_55");

      //****************************
                 // 	Keiler im  Eisgebiet
                 // 


   // Wld_InsertNpc (Minotaurus,"FP_ROAM_EISGEBIET_MINOTAURUS_1");






                 //****************************
                 // 	Keiler im  Eisgebiet
                 // 


                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_320");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_321");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_322");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_323");
                Wld_InsertNpc (Riesenkeiler,"FP_ROAM_EISGEBIET_WOLF_324");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_331");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_331");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_332");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_333");
                Wld_InsertNpc (Riesenkeiler,"FP_ROAM_EISGEBIET_WOLF_334");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_340");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_341");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_342");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_343");
                Wld_InsertNpc (Riesenkeiler,"FP_ROAM_EISGEBIET_WOLF_344");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_360");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_361");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_362");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_363");
                Wld_InsertNpc (Riesenkeiler,"FP_ROAM_EISGEBIET_WOLF_364");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_431");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_432");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_433");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_WOLF_434");
                Wld_InsertNpc (Riesenkeiler,"FP_ROAM_EISGEBIET_WOLF_435");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_1");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_2");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_3");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_4");
                Wld_InsertNpc (Riesenkeiler,"FP_ROAM_EISGEBIET_SCHWEIN_5");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_11");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_12");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_13");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_14");
                Wld_InsertNpc (Riesenkeiler,"FP_ROAM_EISGEBIET_SCHWEIN_15");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_16");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_17");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_20");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_2");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_3");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_4");
                Wld_InsertNpc (Riesenkeiler,"FP_ROAM_EISGEBIET_SCHWEIN_5");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_30");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_32");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_33");
                Wld_InsertNpc (Keiler,"FP_ROAM_EISGEBIET_SCHWEIN_34");
                Wld_InsertNpc (Riesenkeiler,"FP_ROAM_EISGEBIET_SCHWEIN_35");
                Wld_InsertNpc (Riesenkeiler,"FP_ROAM_EISGEBIET_SCHWEIN_50");
                Wld_InsertNpc (Riesenkeiler,"FP_ROAM_EISGEBIET_WOLF_564");



 Wld_InsertNpc (Mod_7217_BDT_Bandit_NW,"BANDIT_01");






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
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_252");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_253");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_21");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_275");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_1000");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_1001");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_1002");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_1003");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_470");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_471");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_472");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_475");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_490");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_491");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_492");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_495");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_497");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_498");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_499");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_600");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_601");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_603");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_604");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_605");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_606");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_607");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_613");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_614");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_615");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_616");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_617");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_623");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_624");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_625");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_626");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_627");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_565");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_565");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_565");


                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_701");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_701");
                Wld_InsertNpc (SchneeHase,"FP_ROAM_EISGEBIET_WOLF_701");











    //****************************
                 // 	Untote im  Eisgebiet
                 // 

 Wld_InsertNpc (SkeletonMage,"FP_ROAM_EISGEBIET_SKELETMAGIE_1");
 Wld_InsertNpc (SkeletonMage,"FP_ROAM_EISGEBIET_SKELETMAGIE_2");
 Wld_InsertNpc (SkeletonMage,"FP_ROAM_EISGEBIET_SKELETMAGIE_4");
 Wld_InsertNpc (SkeletonMage,"FP_ROAM_EISGEBIET_SKELETMAGIE_5");
 Wld_InsertNpc (SkeletonMage,"FP_ROAM_EISGEBIET_SKELETMAGIE_6");







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



    Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_GOBLINBANDIT_30");
    Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_GOBLINBANDIT_40");
    Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_GOBLINBANDIT_41");
    Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_GOBLINBANDIT_42");
    Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_GOBLINBANDIT_43");
    Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_GOBLINBANDIT_44");
    Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_GOBLINBANDIT_35");
    Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_GOBLINBANDIT_46");








                 //****************************
                 // 	Goblins in einer Höhle bei der Stadt
                 // 

                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_11");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_12");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_13");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_14");




        //****************************
                 // 	Goblins in einer Höhle auf dem Berg
                 // 

                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_15");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_100");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_101");
                Wld_InsertNpc (Gobbo_Black,"FP_ROAM_GOBLINBANDIT_102");




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
                 // 	Schattenleufer 
                 //
                Wld_InsertNpc (Shadowbeast,"FP_ROAM_EINSIEDLERSCHATTENLEUFER_4");



                 //****************************
                 // 	Schattenleufer im  Eisgebiet
                 // 

     Wld_InsertNpc (Shadowbeast,"FP_ROAM_EINSIEDLERSCHATTENLEUFER_6");
     Wld_InsertNpc (Shadowbeast,"FP_ROAM_EINSIEDLERSCHATTENLEUFER_7");
     Wld_InsertNpc (Shadowbeast_Addon_Fire_CanyonLib,"FP_ROAM_EINSIEDLERSCHATTENLEUFER_8");
     Wld_InsertNpc (Shadowbeast,"FP_ROAM_EINSIEDLERSCHATTENLEUFER_11");
     Wld_InsertNpc (Shadowbeast_Addon_Fire_CanyonLib,"FP_ROAM_EINSIEDLERSCHATTENLEUFER_15");
     Wld_InsertNpc (Shadowbeast,"FP_ROAM_EINSIEDLERSCHATTENLEUFER_18");
     Wld_InsertNpc (Shadowbeast,"FP_ROAM_EINSIEDLERSCHATTENLEUFER_20");
     Wld_InsertNpc (Nightmare_Skeleton,"FP_ROAM_EINSIEDLERSCHATTENLEUFER_25");









       //****************************
                 // 	Drachen im  Eisgebiet
                 // 
 Wld_InsertNpc (Dragon_Ice_EISGEBIT,"FP_ROAM_EISGEBIETDRACHE_1");
 Wld_InsertNpc (Dragon_Ice_EISGEBIT,"FP_ROAM_EISGEBIETDRACHE_2");
 Wld_InsertNpc (Dragon_Ice_EISGEBIT,"FP_ROAM_EISGEBIETDRACHE_3");












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
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_14");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_15");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_16");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_17");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_18");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_20");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_21");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_22");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_23");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_3");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_31");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_32");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_33");

                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_51");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_52");
                   Wld_InsertNpc (IceGolem,"FP_ROAM_EISGOLEM_53");
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
                   Wld_InsertNpc (Troll,"FP_ROAM_NORDMINETROLL_20");
                   Wld_InsertNpc (Troll,"FP_ROAM_NORDMINETROLL_25");
                   Wld_InsertNpc (Troll,"FP_ROAM_NORDMINETROLL_30");
                   Wld_InsertNpc (Troll,"FP_ROAM_NORDMINETROLL_32");
                   Wld_InsertNpc (Troll,"FP_ROAM_NORDMINETROLL_33");
                   Wld_InsertNpc (Troll,"FP_ROAM_NORDMINETROLL_36");
                   Wld_InsertNpc (Troll,"FP_ROAM_NORDMINETROLL_40");
                   Wld_InsertNpc (Troll,"FP_ROAM_NORDMINETROLL_42");
     Wld_InsertNpc (Troll,"FP_ROAM_NORDMINETROLL_44");


                  //****************************
                 // 	Monster im  Nordtempel
                 // 


                   Wld_InsertNpc (Giant_Rat,"FP_ROAM_NORDTEMPELRATEE_01");
                   Wld_InsertNpc (Giant_Rat,"FP_ROAM_NORDTEMPELRATEE_02");
                   Wld_InsertNpc (Giant_Rat,"FP_ROAM_NORDTEMPELRATEE_03");
                   Wld_InsertNpc (Giant_Rat,"FP_ROAM_EISGEBIET_WOLF_264");
                   Wld_InsertNpc (Giant_Rat,"FP_ROAM_EISGEBIET_WOLF_264");
                   Wld_InsertNpc (Giant_Rat,"FP_ROAM_EISGEBIET_WOLF_264");



                   Wld_InsertNpc (StoneguardianEisbebiet,"FP_ROAM_NORDTEMPELSTEINW_01");
                   Wld_InsertNpc (StoneguardianEisbebiet,"FP_ROAM_NORDTEMPELSTEINW_02");
                   Wld_InsertNpc (StoneguardianEisbebiet,"FP_ROAM_NORDTEMPELSTEINW_03");
                   Wld_InsertNpc (StoneguardianEisbebiet,"FP_ROAM_NORDTEMPELSTEINW_04");
                   Wld_InsertNpc (StoneguardianEisbebiet,"FP_ROAM_NORDTEMPELSTEINW_05");
                   Wld_InsertNpc (StoneguardianEisbebiet,"FP_ROAM_NORDTEMPELSTEINW_06");

                 //****************************
                 // 	Erfrorene 
                 // 
                  Wld_InsertNpc (Zombie_Eisschnee,"FP_ROAM_ZOMBIE_EISGEBIET_01");    










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

//*************
//	Visuals
//*************



//*********************
//	Icedragon 
//*********************

INSTANCE Dragon_Ice_EISGEBIT	(Mst_Default_Dragon_Ice)
{
	name	=	"Winterdrache";
	B_SetVisuals_Dragon_Ice();

	Npc_SetToFistMode(self);
};

func void B_SetVisuals_IcewolfEISGEBIET()
{
	Mdl_SetVisual			(self, "Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"SnoWol_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//************
//	Eiswolf
//************

INSTANCE IcewolfEISGEBIET	(Mst_Default_Icewolf)
{

	//----- Monster ----
	name							=	"Eiswolf";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_Icewolf;
	level							=	10;		
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	160;
	attribute	[ATR_DEXTERITY]		=	160;
	attribute	[ATR_HITPOINTS_MAX]	=	400;	
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	160;
	protection	[PROT_EDGE]			=	160;
	protection	[PROT_POINT]		=	160;
	protection	[PROT_FIRE]			=	160;
	protection	[PROT_FLY]			=	160;
	protection	[PROT_MAGIC]		=	0;




	B_SetVisuals_IcewolfEISGEBIET();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};


instance SchneeHase (Mst_Default_Rabbit)
{
	//B_GiveAll();

	B_SetVisuals_IceRabbit();
	Npc_SetToFistMode(self);
};


INSTANCE StoneguardianEisbebiet	(Mst_Addon_Stoneguardian)
{
	B_SetVisuals_Stoneguardian ();
};


INSTANCE OrkScout_Schnee_Ork (Mst_Default_OrcScout)			
{
	//----- Monster -----
	name							=	"Ork Jäger";
	guild							=	GIL_ORC;
	id			= 	10015;
	voice							=	18;
	level							=	20;
	Npctype 	=		NPCTYPE_MAIN;

	fight_tactic	=	FAI_ORC;
	
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"ORC_BODY_WINTER",	DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
	
	attribute[ATR_STRENGTH] = 150;	

	EquipItem	(self, ItMw_2H_OrcAxe_01);

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	daily_routine	=	Rtn_Start_11119;
};

FUNC VOID Rtn_Start_11119()
{
	//TA_Stand_WP_Orc		(04,00,22,00,"WP_ORKPATROULLIE");
	//TA_Sleep_Orc		(22,00,04,00,"WP_ORKPATROULLIE");
};

//-------------------------------------------------------------
// Eisgebietzombie
//-------------------------------------------------------------
func void B_SetVisuals_Zombie_Eisschnee()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"ZOM_WINTER_BODY",		0,			0,			"Zom_Head", 0,  		DEFAULT,	-1);
};


//***********
//	Zombie_Eisschnee  
//***********

INSTANCE Zombie_Eisschnee		(Mst_Default_Zombie)
{
	name = "Erfrorener";

	B_SetVisuals_Zombie_Eisschnee();
	Npc_SetToFistMode(self);
};







//***********
//	Visuals Meatbugzwerg
//***********

func void B_SetVisuals_Meatbugzwerg()
{
	Mdl_SetVisual			(self,	"Meatbug.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gartenzwerg_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

};



//***************
//	Meatbugzwerg   	
//***************

INSTANCE Meatbugzwerg	(Mst_Default_Meatbug)
{

name	= "IbuHexal akut";
	B_SetVisuals_Meatbugzwerg();
};



func void B_SetVisuals_Troll_Black_Eis()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Troll_Black_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};




INSTANCE Troll_Black_Eis	(Mst_Default_Troll_Black)
{




	//----- Monster ----
	name							=	"Schwarzer Troll";
	guild							=	GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLL_BLACK;
	level							=	200; //40
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	300;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	4000;
	attribute	[ATR_HITPOINTS]		=	4000;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----	
	protection	[PROT_BLUNT]		=	200000;
	protection	[PROT_EDGE]			=	200000;
	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FIRE]			=	200;
	protection	[PROT_FLY]			=	IMMUNE;	
	protection	[PROT_MAGIC]		=	IMMUNE;

	B_SetVisuals_Troll_Black_Eis();
	Npc_SetToFistMode(self);

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




//////////////////////////////////////////////////////////////////////////////
//
//	MAPS
//
//////////////////////////////////////////////////////////////////////////////

instance ItWr_Map_Eiswelt_Thomas (C_Item)
{
	name 		= "Eiswelt.";  

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 250;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Map_Eiswelt_Thomas;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_Map_Eiswelt_Thomas()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItWr_Map_Eiswelt_Thomas);
		};

		var int Document;
		Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_Eiswelt.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "EISGEBIET_SURFACE.ZEN");
					Doc_SetLevelCoords	(Document, -83353, 87241, 100023, -84430);
					Doc_Show			(Document);
	};

//////////////////////////////////////////////////////////////////////////////
//
//	Ast 
//
//////////////////////////////////////////////////////////////////////////////


instance CA_ITMI_BRANCH(C_Item)

{
	
name = "Wooden branch";
	
mainflag = ITEM_KAT_NONE;
	
flags = ITEM_MULTI;
	
value = 1;
	
visual = "CA_ITMI_BRANCH.3ds";
	
material = MAT_WOOD;
	
description = name;
	
text[5] = NAME_Value;
	
count[5] = value;

};


/********************************************************************************/
INSTANCE ItMw_Nordschwert (C_Item) 
{	
	name 				=	"Nordschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender2;

	damageTotal			= 	Damage_Zweihaender2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Zweihaender2;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Zweihaender2;
	visual 				=	"NordSword_2h.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Minotaurenhammer (C_Item)
{	
	name 				=	"Minotaurenhammer";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Kriegshammer2;

	damageTotal  		= 	Damage_Kriegshammer2;
	damagetype 			=	DAM_BLUNT;	
	range    			=  	Range_Kriegshammer2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Kriegshammer2;
	visual 				=	"warhamerek.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};




////////////////////////////////////////////////////////////////////////////////
// Constanten
const int Damage_TrollCross		            =    100;	
const int Condition_TrollCross	            =     75;
const int Value_TrollCross		            =   2575; 

INSTANCE ItRw_TrollCrossbow(C_Item)
{
	name 				  =   "Trolljäger-Armbrust";
	
	mainflag 			  =   ITEM_KAT_FF;
	flags 				  =   ITEM_CROSSBOW;
	material 			  =   MAT_WOOD;
	
	value 				  =   Value_TrollCross;
	
	wear				  =	  WEAR_EFFECT;
	
	damageTotal			  =   Damage_TrollCross;
	damagetype			  =   DAM_POINT;
	munition			  =   ItRw_Bolt;
	cond_atr[2]   	      =   ATR_STRENGTH;
	cond_value[2]         =   Condition_TrollCross;
	visual                =   "ITRW_CROSSBOW_SLD_01.MMS";
	
	description			  =   name;
	TEXT[2]				  =   NAME_Damage;              COUNT[2]  =  damageTotal;
	TEXT[3] 			  =   NAME_Str_needed;          COUNT[3]  =  cond_value[2];
	TEXT[5]				  =   NAME_Value;               COUNT[5]  =  value;
};


