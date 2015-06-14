INSTANCE Mod_7175_BDT_Oschust_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Oschust";
	if (Mod_AlbertTransforms == 0)
	{
		guild 		= GIL_OUT;
	}
	else
	{
		guild		= GIL_ORC;
	};
	id 			= 7175;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;

	level = 50;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;

	// ------ Attribute ------
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_STRENGTH] = 160;																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Mil_Sword);
		
	// ------ Inventory ------

	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Weak_BaalNetbek, BodyTex_N, Ritual_Krieger);

	Mdl_SetModelFatness	(self, 1);
	//Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7175;
};

FUNC VOID Rtn_Start_7175 ()
{	
	TA_Follow_Player	(08,00,20,00,"WP_MT_ORKS_OSCHUST_03");
	TA_Follow_Player	(20,00,08,00,"WP_MT_ORKS_OSCHUST_03");
};

FUNC VOID Rtn_Tot_7175 ()
{
	TA_Drained	(08,00,20,00,"TOT");
	TA_Drained	(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Angriff_7175()
{
	TA_Stand_Guarding	(08,00,20,00,"LOCATION_11_12_09");
	TA_Stand_Guarding	(20,00,08,00,"LOCATION_11_12_09");
};