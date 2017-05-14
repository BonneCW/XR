INSTANCE Mod_4019_VMG_Faice_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Faice";
	guild 		= GIL_OUT;
	id 			= 4019;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 229, BodyTex_N, ITAR_DRUIDEWALDMAGIER);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4019;
};

FUNC VOID Rtn_Start_4019 ()
{	
	TA_Read_Bookstand		(08,00,11,00,"VMG_01");
	TA_Study_WP	(11,00,12,00,"VMG_02");
    TA_Potion_Alchemy		(12,00,22,30,"VMG_01");
    TA_Sleep			(22,30,08,00,"VMG_05");
};

FUNC VOID Rtn_Ritual_4019 ()
{	
	TA_Ritual_VM		(08,00,23,00,"VMG_19");
	TA_Ritual_VM		(23,00,08,00,"VMG_19");
};

FUNC VOID Rtn_Drained_4019 ()
{	
	TA_Drained		(08,00,23,00,"VMG_19");
	TA_Drained		(23,00,08,00,"VMG_19");
};

FUNC VOID Rtn_Gift_4019 ()
{	
	TA_Sleep_Deep		(08,00,23,00,"VMG_05");
	TA_Sleep_Deep		(23,00,08,00,"VMG_05");
};
