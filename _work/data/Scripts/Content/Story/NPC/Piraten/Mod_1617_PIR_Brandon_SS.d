INSTANCE Mod_1617_PIR_Brandon_SS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brandon";
	guild 		= GIL_out;
	id 			= 1617;
	voice		= 0;
	flags       = 2;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_Partymember] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hAxe);
	
	// ------ Inventory ------
	CreateInvItems (self, itpo_Health_03, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Tough_Okyl, BodyTex_N, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1617;
};

FUNC VOID Rtn_Start_1617 ()
{	
	TA_Follow_Player 		(07,03,21,03,"NEUERPUNKT");
	TA_Follow_Player		(21,03,22,03,"NEUERPUNKT");
};