INSTANCE Mod_7765_SLD_Gorn_XW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gorn";
	guild 		= GIL_OUT;
	id 			= 7765;
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
	B_SetFightSkills (self, 100); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7765;
};

//-------------------------------------
FUNC VOID Rtn_Start_7765 ()
{	
	TA_Smalltalk_Plaudern	(08,00,20,00,"ARENA_01");
	TA_Smalltalk_Plaudern	(20,00,08,00,"ARENA_01");
};

FUNC VOID Rtn_Tribuene_7765 ()
{	
	TA_RunToWP		(08,00,20,00,"ARENA_12");
	TA_RunToWP		(20,00,08,00,"ARENA_12");
};

FUNC VOID Rtn_Controlled_7765 ()
{	
	TA_RunToWP		(08,00,20,00,"ARENA_01");
	TA_RunToWP		(20,00,08,00,"ARENA_01");
};
