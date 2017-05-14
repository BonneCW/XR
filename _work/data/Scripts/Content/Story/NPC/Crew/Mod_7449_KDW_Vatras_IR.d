INSTANCE Mod_7449_KDW_Vatras_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Vatras"; 
	guild 		= GIL_OUT;
	id 			= 7449;
	voice		= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	aivar[AIV_Partymember] 		= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;															
	EquipItem	(self, ItMW_Addon_Stab03);	
	
	// ------ Equippte Waffen ------																

	
	// ------ Inventory ------
	CreateInvItems	(self, ItSc_IceRain, 3);
	CreateInvItems	(self, ItSc_IceWave, 3);
	CreateInvItems	(self, ItSc_IceCube, 4);
	CreateInvItems	(self, ItSc_InstantIceball, 7);
	CreateInvItems	(self, ItSc_Icelance, 6);
	CreateInvItems	(self, ItPo_Mana_03, 5);
	CreateInvItems	(self, ItPo_Health_03, 5);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_B_Saturas, BodyTex_B, ITAR_KDW_H );	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 100); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7449;
};

FUNC VOID Rtn_Start_7449	()
{	
	TA_Stand_WP	(05,05,20,10,	"SHIP_DECK_38");
	TA_Stand_WP  	(20,10,05,05,	"SHIP_DECK_38");
};

FUNC VOID Rtn_Waiting_7449 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};