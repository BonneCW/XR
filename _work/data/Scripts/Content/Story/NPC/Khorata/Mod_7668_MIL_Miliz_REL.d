instance Mod_7668_MIL_Miliz_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Miliz";	
	guild 		= GIL_OUT;
	id 			= 7668;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough01, BodyTex_L, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7668;
};

FUNC VOID Rtn_Start_7668()
{	
	TA_Saw		(01,00,03,00,"REL_MOOR_208");
	TA_Saw		(03,00,01,00,"REL_MOOR_208");
};

FUNC VOID Rtn_Siedlung_7668()
{
	TA_Smalltalk	(21,00,09,00,	"REL_MOOR_215");
	TA_Smalltalk	(09,00,21,00,	"REL_MOOR_215");
};
