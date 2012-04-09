instance Mod_539_PAL_Lothar_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lothar";
	guild 		= GIL_PAL;
	id 			= 539;
	voice 		= 1;
	flags       = NPC_FLAG_IMMORTAL;	//Bitte nicht ändern er stirbt zum 3. Kapitel															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Paladinschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_P_NormalBart_Nefarius, BodyTex_P, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_539;
};

FUNC VOID Rtn_PreStart_539 ()
{
	TA_Stand_Guarding	(08,00,23,00,"NW_CITY_LOTHAR");
   	TA_Stand_Guarding	(23,00,08,00,"NW_CITY_LOTHAR");	
};