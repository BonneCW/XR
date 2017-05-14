INSTANCE Mod_7444_SLD_Gorn_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gorn";
	guild 		= GIL_OUT;
	id 			= 7444;
	voice		= 0;
	flags       = 2;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
	
	aivar[AIV_IgnoresArmor] 	= TRUE;
	aivar[AIV_Partymember] 		= TRUE;

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self,	Gorns_Rache);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter",Face_B_Gorn, BodyTex_B, ITAR_SLD_H2);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7444;
};

//-------------------------------------
FUNC VOID Rtn_Start_7444 ()
{	
	TA_Stand_WP		(08,00,20,00,"SHIP_DECK_32");
	TA_Stand_WP		(20,00,08,00,"SHIP_DECK_32");
};

FUNC VOID Rtn_Follow_7444 ()
{	
	TA_Follow_Player	(08,00,20,00,"SHIP_DECK_32");
	TA_Follow_Player	(20,00,08,00,"SHIP_DECK_32");
};

FUNC VOID Rtn_Waiting_7444 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};