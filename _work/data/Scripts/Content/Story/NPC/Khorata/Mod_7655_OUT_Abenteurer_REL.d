INSTANCE Mod_7655_OUT_Abenteurer_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Abenteurer";	
	guild 		= GIL_OUT;
	id 			= 7655;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, itmw_1h_bau_mace);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_Normal02, BodyTex_P, ITAR_Schaf);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7655;
};

FUNC VOID Rtn_PreStart_7655 ()
{	
	TA_Smalltalk	(21,00,09,00,	"REL_MOOR_143");
	TA_Smalltalk	(09,00,21,00,	"REL_MOOR_143");
};

FUNC VOID Rtn_Abenteurer_7655()
{
	TA_Smalltalk_Plaudern	(21,00,09,00,	"REL_MOOR_143");
	TA_Smalltalk_Plaudern	(09,00,21,00,	"REL_MOOR_143");
};

FUNC VOID Rtn_Start_7655 ()
{	
	TA_Stand_Drinking	(21,00,09,00,	"REL_MOOR_145");
	TA_Stand_Drinking	(09,00,21,00,	"REL_MOOR_145");
};