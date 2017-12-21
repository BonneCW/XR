INSTANCE Mod_1858_KDF_Aaron_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Garan";
	guild 		= GIL_VLK;
	id 			= 1858;
	voice		= 3;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																			
	EquipItem	(self, ItMW_Addon_Stab01);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Inventory ------
	// Händler

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald.", Face_L_Tough_Santino, BodyTex_L,ITAR_KDF_H);	
	
	Mdl_SetModelFatness	(self, 0.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 95); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1858;
};

FUNC VOID Rtn_Start_1858 ()
{	
	TA_RunToWP		(05,00,00,00,"WP_PAT_TURM_03");
	TA_RunToWP		(00,00,05,00,"WP_PAT_TURM_03");
};

FUNC VOID Rtn_Follow_1858 ()
{	
	TA_Follow_Player		(05,00,00,00,"WP_PAT_TURM_19");
	TA_Follow_Player		(00,00,05,00,"WP_PAT_TURM_19");
};