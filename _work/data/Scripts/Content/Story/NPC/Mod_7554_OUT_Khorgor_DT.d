instance Mod_7554_OUT_Khorgor_DT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Khorgor";	
	guild 		= GIL_OUT;
	id 			= 7554;
	voice 		= 4;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;

	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
			
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------			
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems	(hero, ItAt_KhorgorKopf, 1);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart06, BodyTex_N, Ritual_Magier);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 100); 

	EquipItem	(self, ItMw_Kriegshammer2);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7554;
};

FUNC VOID Rtn_Start_7554 ()
{	
	 TA_Pray_Innos_FP	(08,00,20,00,"DT_045");        
   	 TA_Pray_Innos_FP	(20,00,08,00,"DT_045");     
};