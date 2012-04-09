INSTANCE Mod_7763_RDW_Diego_XW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Diego";
	guild 		= GIL_OUT;
	id 			= 7763;
	voice 		= 11;
	flags       = 2;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ aivar ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_Partymember] 		= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------
	EquipItem	(self, ItMw_AdanosKurzschwert);																	
	EquipItem (self, ItRw_Bow_War_05); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief",Face_L_Diego, BodyTex_L, ITAR_RANGER_ADDON);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7763;
};

FUNC VOID Rtn_Start_7763()
{
	TA_Smalltalk_Plaudern	(08,00,20,00,"ARENA_01");
	TA_Smalltalk_Plaudern	(20,00,08,00,"ARENA_01");
};

FUNC VOID Rtn_Tribuene_7763 ()
{	
	TA_RunToWP		(08,00,20,00,"ARENA_18");
	TA_RunToWP		(20,00,08,00,"ARENA_18");
};