var int MG_GameState;
var int MG_SiegState;

CLASS C_MG_SPIELFIGUR
{
	var int field; // damit die Position dem Monster bekannt ist
	var int owner; // damit ich weiß, zu wem das Monster gehört und in welche Richtung es muss
	var int direction; // Richtung, in die das Monster standardmäßig muss (1 für Spieler, -1 für Gegner)
	var int type;  // Monster-Art
	var int button; // View des Monsters
	var int left;
	var int right;
	var int front;
	var int back;
	var int walked;	// diese Runde schon gelaufen?
};

/** Konstruktor **/
 
instance C_MG_SPIELFIGUR@(C_MG_SPIELFIGUR) {
};
 
/** Destruktor **/
 
func void C_MG_SPIELFIGUR_Delete(var C_MG_SPIELFIGUR m) {
	Button_Delete(m.button);
};

var C_MG_SPIELFIGUR Hero_MinecrawlerQueen;
var C_MG_SPIELFIGUR Hero_Troll;
var C_MG_SPIELFIGUR Hero_Hase;
var C_MG_SPIELFIGUR Hero_Meatbug;
var C_MG_SPIELFIGUR Hero_Stoneguardian;
var C_MG_SPIELFIGUR Hero_Bloodfly;
var C_MG_SPIELFIGUR Hero_Balrog;
var C_MG_SPIELFIGUR Hero_Snapper;
var C_MG_SPIELFIGUR Hero_Goblin;
var C_MG_SPIELFIGUR Hero_Schaf;

var C_MG_SPIELFIGUR Opp_MinecrawlerQueen;
var C_MG_SPIELFIGUR Opp_Troll;
var C_MG_SPIELFIGUR Opp_Hase;
var C_MG_SPIELFIGUR Opp_Meatbug;
var C_MG_SPIELFIGUR Opp_Stoneguardian;
var C_MG_SPIELFIGUR Opp_Bloodfly;
var C_MG_SPIELFIGUR Opp_Balrog;
var C_MG_SPIELFIGUR Opp_Snapper;
var C_MG_SPIELFIGUR Opp_Goblin;
var C_MG_SPIELFIGUR Opp_Schaf;
