INSTANCE Mod_4020_VMG_Hermy_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hermy";	
	guild 		= GIL_OUT;
	id 			= 4020;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------			
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", 232, BodyTex_N, ITAR_Naturmagier);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4020;
};

FUNC VOID Rtn_Start_4020 ()
{	
	TA_Sit_Chair			(06,55,21,00,"VMG_10");
  	TA_Practice_Magic		(21,00,06,55,"VMG_15");
  	TA_Cook_Cauldron		(21,00,06,55,"VMG_11");
};

FUNC VOID Rtn_Ritual_4020 ()
{	
	TA_Ritual_VM		(08,00,23,00,"VMG_06");
	TA_Ritual_VM		(23,00,08,00,"VMG_06");
};