INSTANCE Mod_1540_PIR_Skip_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Skip";
	guild 		= GIL_out;
	id 			= 1540;
	voice 		= 8;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 300;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_ShortSword2);
	EquipItem (self, ItRw_sld_bow); 
	
	// ------ Inventory ------
	CreateInvItems (self, itpo_Health_03, 2);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Pirat01, BodyTex_N, ITAR_PIR_L_Addon);
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1540;
};

FUNC VOID Rtn_PreStart_1540 ()
{	
	TA_Follow_Player		(07,30,11,30,"WP_DI_SKIP_WAITFORPLAYER");
	TA_Follow_Player		(11,30,07,30,"WP_DI_SKIP_WAITFORPLAYER");
};

FUNC VOID Rtn_Start_1540()
{
	TA_Stand_ArmsCrossed		(08,00,20,00,"WP_DI_SKIPKOMMTANLAND");
	TA_Stand_ArmsCrossed		(20,00,08,00,"WP_DI_SKIPKOMMTANLAND");
};

FUNC VOID Rtn_Unterwegs_1540 ()
{	
	TA_Stand_WP			(07,30,11,30,"WP_DI_SKIP_WAITFORPLAYER");
	TA_Stand_WP			(11,30,07,30,"WP_DI_SKIP_WAITFORPLAYER");
};