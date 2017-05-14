INSTANCE Mod_7490_OUT_Wache_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Minenwache"; 
	guild 		= GIL_OUT;
	id 			= 7490;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------															
	EquipItem	(self, ItMw_ShortSword3); 																
	
	// ------ Inventory ------
	// Händler


		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_CoolPock, BodyTex_N, KhorataWache_03);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,10); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7490;
};

FUNC VOID Rtn_Start_7490()
{	
	TA_Stand_Guarding		(08,00,22,00,"RM_30");
	TA_Stand_Guarding		(22,00,08,00,"RM_30");
};