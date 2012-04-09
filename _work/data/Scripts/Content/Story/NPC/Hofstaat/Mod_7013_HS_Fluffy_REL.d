instance Mod_7013_HS_Fluffy_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fluffy";
	guild 		= GIL_SHEEP;
	id 			= 7013;
	voice 		= 6;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_TROLL;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------			
	
	// ------ Inventory ------
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Tro_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Npc_SetToFistMode(self);
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 

	// ------ NSC-relevante Talente vergeben ------
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7013;
};

FUNC VOID Rtn_PreStart_7013 ()
{	
	TA_Stand_WP_Troll			(08,00,22,00,"REL_252");
    	TA_Stand_WP_Troll			(22,00,08,00,"REL_252");
};

FUNC VOID Rtn_Killer_7013 ()
{	
	TA_Stand_WP_Troll				(08,00,22,00,"REL_250");
    	TA_Stand_WP_Troll				(22,00,08,00,"REL_250");
};

FUNC VOID Rtn_WaitingForNewFood_7013 ()
{	
	TA_Stand_WP_Troll				(08,00,22,00,"REL_251");
    	TA_Stand_WP_Troll				(22,00,08,00,"REL_251");
};

FUNC VOID Rtn_Tot_7013 ()
{	
	TA_Stand_WP_Troll				(08,00,22,00,"TOT");
    TA_Stand_WP_Troll				(22,00,08,00,"TOT");
};