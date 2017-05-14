instance Mod_966_GRD_Thorus_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Thorus";
	guild 		= GIL_OUT;
	id 			= 966;
	voice		= 0;
	flags      	= 2;
	npctype		= NPCTYPE_main;
	
	
	//aivars

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, Thorus_Schwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Thorus, BodyTex_B, EBR_ARMOR_H2);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 85); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_PReStart_966;
};

FUNC VOID Rtn_Prestart_966()
{
	TA_Sit_Throne	(08,00,23,00,"OCC_BARONS_GREATHALL_THRONE");
   	TA_Sleep	(23,00,08,00,"OCC_BARONS_UPPER_RIGHT_ROOM_BED1");
};

FUNC VOID Rtn_Templer_966()
{
	TA_Smalltalk	(08,00,23,00,"OCC_BARONS_DANCE2");
   	TA_Smalltalk		(23,00,08,00,"OCC_BARONS_DANCE2");
};

FUNC VOID Rtn_Falle_966()
{
	TA_Smalltalk	(08,00,23,00,"SPAWN_OW_MOLERAT_CAVE1_OC");
   	TA_Smalltalk		(23,00,08,00,"SPAWN_OW_MOLERAT_CAVE1_OC");
};