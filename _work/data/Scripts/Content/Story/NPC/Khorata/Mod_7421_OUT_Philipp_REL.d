INSTANCE Mod_7421_OUT_Philipp_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Philipp"; 
	guild 		= GIL_OUT;
	id 			= 7421;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	
	// ------ Inventory ------
	// Händler


		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_CoolPock, BodyTex_N,ITAR_Vlk_L );	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7421;
};

FUNC VOID Rtn_Start_7421()
{	
	TA_Sit_Campfire		(07,45,19,45,"REL_CITY_360");
	TA_Sit_Campfire		(19,45,07,45,"REL_CITY_360");
};

FUNC VOID Rtn_Strafe_7421 ()
{	
	TA_Pick_FP		(08,05,16,05,"REL_SURFACE_107");
	TA_Stand_Guarding	(16,05,18,05,"BRAUERKESSEL");
	TA_Sit_Campfire		(18,05,08,05,"REL_CITY_360");
};