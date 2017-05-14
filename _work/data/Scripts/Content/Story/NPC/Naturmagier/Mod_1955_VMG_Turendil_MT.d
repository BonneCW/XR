INSTANCE Mod_1955_VMG_Turendil_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Turendil";
	guild 		= GIL_OUT;
	id 			= 1955;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMW_Addon_Stab01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",242, BodyTex_P, ITAR_DRUIDEWALDMAGIER);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1955;
};

FUNC VOID Rtn_Start_1955 ()
{	
	TA_Potion_Alchemy		(08,00,23,00,"WP_VMG_01");
    TA_Potion_Alchemy				(23,00,08,00,"WP_VMG_01");
};

FUNC VOID Rtn_Ritual_1955 ()
{	
	TA_Ritual_VM		(08,00,23,00,"VMG_19");
	TA_Ritual_VM		(23,00,08,00,"VMG_19");
};

FUNC VOID Rtn_Faice_1955 ()
{	
	TA_Read_Bookstand		(08,00,11,00,"VMG_01");
	TA_Study_WP	(11,00,12,00,"VMG_02");
    TA_Potion_Alchemy		(12,00,22,30,"VMG_01");
    TA_Sleep			(22,30,08,00,"VMG_05");
};