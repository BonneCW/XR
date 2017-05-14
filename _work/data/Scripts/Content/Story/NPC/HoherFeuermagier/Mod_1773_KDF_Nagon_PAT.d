instance Mod_1773_KDF_Nagon_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Nagon";
	guild 		= GIL_VLK;
	id 			= 1773;
	voice		= 0;
	flags       = 0;	//Joly: NPC_FLAG_IMMORTAL																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																			
	EquipItem	(self, ItMW_Addon_Stab01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Raven, BodyTex_N, ITAR_KDF_VeryHigh);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 100); 
		
	// ------ TA anmelden ------
	daily_routine 	= Rtn_PreStart_1773;
};
FUNC VOID Rtn_PreStart_1773 ()
{	
	TA_Sit_Throne  (08,00,21,00,"WP_PAT_WEG_184");
    TA_Sleep  (22,00,05,00,"WP_PAT_WEG_197");
};