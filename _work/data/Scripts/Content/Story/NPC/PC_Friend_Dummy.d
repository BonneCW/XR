instance PC_Friend_Dummy (Npc_Default)
{
	// ------ NSC ------
	name 		= "Argez"; 
	guild 		= GIL_DMT;
	id 			= 7624;
	voice		= 0;
	flags       = 2;																
	npctype		= NPCTYPE_FRIEND;
	
	// ------ AIVARs ------
	aivar[AIV_ToughGuy] 			= TRUE;	
	aivar[AIV_ToughGuyNewsOverride] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_Sword); 
	
	CreateInvItems	(self, ItRu_ArgezVision, 1);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 178, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 100); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7624;
};

FUNC VOID Rtn_Start_7624()
{	
	TA_Smalltalk_Plaudern	(10,55,18,50,"WP_SEQUENZ_ARGEZ");
	TA_Smalltalk_Plaudern	(18,50,10,55,"WP_SEQUENZ_ARGEZ");
};