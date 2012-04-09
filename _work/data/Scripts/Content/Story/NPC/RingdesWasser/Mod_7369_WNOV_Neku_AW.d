instance Mod_7369_WNOV_Neku_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Neku"; 
	guild 		= GIL_NOV;
	id 			= 7369;
	voice 		= 9;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------			
	
	// ------ Inventory ------
	//CreateInvItems (self, ItWr_Passierschein, 1);wird jetzt über Dialog vergeben, damit nicht mehr im Trade auftaucht 
	CreateInvItems (self, ItMi_Gold, 50);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Orry, BodyTex_N, ITAR_Wassernovize1);	
	Mdl_SetModelFatness	(self,1.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7369;
};

FUNC VOID Rtn_Start_7369()
{		
	TA_Stand_Guarding	(07,00,23,00,"ADW_ENTRANCE_PATH2BANDITS_13A");
	TA_Stand_Guarding	(23,00,07,00,"ADW_ENTRANCE_PATH2BANDITS_13A");
};