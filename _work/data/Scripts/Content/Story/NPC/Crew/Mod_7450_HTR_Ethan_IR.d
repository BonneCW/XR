instance Mod_7450_HTR_Ethan_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ethan";	
	guild 		= GIL_OUT;
	id 			= 7450;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	aivar[AIV_Partymember] 		= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	aivar[AIV_ToughGuy]		= TRUE;
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Kilgorin);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 196, BodyTex_P, ITAR_Hueter);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7450;
};

FUNC VOID Rtn_Start_7450 ()
{
	TA_Sit_Chair	(08,00,23,00,"SHIP_IN_01");
	TA_Sit_Chair	(23,00,08,00,"SHIP_IN_01");
};

FUNC VOID Rtn_Follow_7450 ()
{	
	TA_Follow_Player	(08,00,20,00,"SHIP_IN_01");
	TA_Follow_Player	(20,00,08,00,"SHIP_IN_01");
};

FUNC VOID Rtn_Waiting_7450 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};