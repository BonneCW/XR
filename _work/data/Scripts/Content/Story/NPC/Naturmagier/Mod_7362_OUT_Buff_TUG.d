instance Mod_7362_OUT_Buff_TUG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Buff"; 
	guild 		= GIL_OUT;
	id 			= 7362;
	voice 		= 6;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																		
	EquipItem (self, ItRw_Bow_L_03); 
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N,ITAR_Leather_L);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7362;
};

FUNC VOID Rtn_Start_7362()
{	
	TA_Stand_Guarding	(06,05,22,15,"TUG_83");
	TA_Stand_Guarding	(22,15,06,05,"TUG_83"); 
};

FUNC VOID Rtn_Dorf_7362()
{	
	TA_Sit_Chair		(06,05,22,15,"TUG_46");
	TA_Sleep		(22,15,06,05,"TUG_53"); 
};