var int MG_Spielfeld[80];
var int MG_Spielfeld_Texturen[80];
var int MG_Spielfeld_Possibilities[80];
var int MG_Spielfeld_Figur[80];

var int MG_Spielbrett;

var int MG_EigeneFiguren[5];
var int MG_GegnerFiguren[5];

var int MG_EigeneFiguren2[10];
var int MG_GegnerFiguren2[10];

var int MG_EigeneFiguren3[10];
var int MG_GegnerFiguren3[10];

var int MG_Own_Counter;
var int MG_Opp_Counter;

var int MG_Opp_Index;

var int MG_Opp_Time;

var int MG_Starter;

const int MG_FIGUR_MINECRAWLERQUEEN	= 1;
const int MG_FIGUR_TROLL		= 2;
const int MG_FIGUR_HASE			= 3;
const int MG_FIGUR_MEATBUG		= 4;
const int MG_FIGUR_STONEGUARDIAN	= 5;
const int MG_FIGUR_BLOODFLY		= 6;
const int MG_FIGUR_BALROG		= 7;
const int MG_FIGUR_SNAPPER		= 8;
const int MG_FIGUR_GOBLIN		= 9;
const int MG_FIGUR_SCHAF		= 10;

var int MG_Spieler01;
var int MG_Spieler02;

var int PlayerHas_MinecrawlerQueen;
var int PlayerHas_Troll;
var int PlayerHas_Hase;
var int PlayerHas_Meatbug;
var int PlayerHas_Stoneguardian;
var int PlayerHas_Bloodfly;
var int PlayerHas_Balrog;
var int PlayerHas_Snapper;
var int PlayerHas_Goblin;
var int PlayerHas_Schaf;

const int MG_GEGNER_RUEDIGER		= 1;
const int MG_GEGNER_SPIELER_ORLAN	= 2;
const int MG_GEGNER_ONLINE			= 3;
const int MG_GEGNER_FALLBACK		= 4;

var int MG_Ruediger_Runde;
var int MG_Spieler_Orlan_Runde;

var int MG_CurrentOpp;

var int tempFigur;

const int MSGTYPE_STARTER = 0;
const int MSGTYPE_PLACEMENT = 1;
const int MSGTYPE_MOVE = 2;
const int MSGTYPE_FINISHEDMOVE = 3;

var int Online_Host;
var int MP_TimeOut;
var int MG_WaitingForMatch;
