INSTANCE Mod_524_KDW_Vatras_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Vatras"; 
	guild 		= GIL_NOV;
	id 			= 524;
	voice 		= 5;
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;															
	EquipItem	(self, ItMW_Addon_Stab03);	
	
	// ------ Equippte Waffen ------																

	
	// ------ Inventory ------
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_B_Saturas, BodyTex_B, ITAR_KDW_H );	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 100); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_524;
};

FUNC VOID Rtn_Start_524	()
{	
	TA_Preach_Vatras	(05,05,20,10,	"NW_CITY_MERCHANT_TEMPLE_FRONT");
    TA_Pray_Innos_FP  	(20,10,05,05,	"NW_CITY_MERCHANT_TEMPLE_IN");
};

FUNC VOID Rtn_Tot_524	()
{	
	TA_Stand_WP	(05,05,20,10,	"TOT");
    TA_Stand_WP  	(20,10,05,05,	"TOT");
};

FUNC VOID Rtn_Daemonisch_524	()
{	
	TA_RunToWP	(05,05,20,10,	"NW_CITY_TAVERN_IN_02");
	TA_RunToWP  	(20,10,05,05,	"NW_CITY_TAVERN_IN_02");
};

FUNC VOID Rtn_Schiff_524	()
{	
	TA_Stand_WP	(05,05,20,10,	"SHIP_DECK_38");
	TA_Stand_WP  	(20,10,05,05,	"SHIP_DECK_38");
};