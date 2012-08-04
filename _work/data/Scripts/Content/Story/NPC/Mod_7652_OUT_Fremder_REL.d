instance Mod_7652_OUT_Fremder_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fremder"; 
	guild 		= GIL_STRF;
	id 			= 7652;
	voice 		= 13;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;

	effect	= "SPELLFX_FIREARMOR";
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_2H_Sword_M_01);
	
	
	// ------ Inventory ------
	CreateInvItems	(self, ItAr_Maxim_Fake, 1);
	CreateInvItems	(self, ItMw_Ritualdolch_Versengen, 1);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal06, BodyTex_N, Itar_Maxim);	
	Mdl_SetModelFatness	(self,0);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 100); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7652;
};

FUNC VOID Rtn_Start_7652()
{	
	TA_Smalltalk_Plaudern	(08,00,23,00,"REL_MOOR_171");
	TA_Smalltalk_Plaudern	(23,00,08,00,"REL_MOOR_171");
};