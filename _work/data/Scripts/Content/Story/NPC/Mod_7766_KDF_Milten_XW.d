INSTANCE Mod_7766_KDF_Milten_XW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Milten";
	guild 		= GIL_OUT;
	id 			= 7766;
	voice		= 28;
	flags       = 2;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ aivar ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_Partymember] 		= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;																
	EquipItem	(self, ItMW_Addon_Stab01);	
	
	// ------ Equippte Waffen ------																	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_N_Milten, BodyTex_N, ITAR_KDF_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7766;
};

FUNC VOID Rtn_Start_7766()
{
	TA_Smalltalk_Plaudern	(08,00,20,00,"ARENA_01");
	TA_Smalltalk_Plaudern	(20,00,08,00,"ARENA_01");
};

FUNC VOID Rtn_Tribuene_7766 ()
{	
	TA_RunToWP		(08,00,20,00,"ARENA_15");
	TA_RunToWP		(20,00,08,00,"ARENA_15");
};