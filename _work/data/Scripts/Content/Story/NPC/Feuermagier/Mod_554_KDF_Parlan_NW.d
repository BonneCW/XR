INSTANCE Mod_554_KDF_Parlan_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Parlan";
	guild 		= GIL_VLK;
	id 		= 554;
	voice 		= 5;
	flags       = 0;
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	B_SetAttributesToChapter (self, 4);																
	fight_tactic		= FAI_HUMAN_STRONG;																	
	EquipItem	(self, ItMW_Addon_Stab01);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	B_CreateAmbientInv 	(self);
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_N_Corristo, BodyTex_N, ITAR_KDF_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 50); 

	daily_routine 		= Rtn_Start_554;
};

FUNC VOID Rtn_Start_554 ()
{	
	TA_Stand_Guarding	(08,00,23,00,"NW_MONASTERY_PLACE_03");
        TA_Stand_Guarding	(23,00,08,00,"NW_MONASTERY_PLACE_03");
};
