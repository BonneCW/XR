INSTANCE Mod_7420_OUT_Michael_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Michael"; 
	guild 		= GIL_OUT;
	id 			= 7420;
	voice 		= 11;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Zweihaender); 
	
	
	// ------ Inventory ------
	CreateInvItems (self, ItMi_Joint, 20);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_Ian, BodyTex_L,ITAR_Vlk_L );	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7420;
};

FUNC VOID Rtn_Start_7420()
{	
	TA_Sit_Campfire		(07,45,19,45,"REL_CITY_360");
	TA_Sit_Campfire		(19,45,07,45,"REL_CITY_360");
};

FUNC VOID Rtn_Strafe_7420 ()
{	
	TA_Pick_FP		(08,05,16,05,"REL_SURFACE_107");
	TA_Stand_Guarding	(16,05,18,05,"BRAUERKESSEL");
	TA_Sit_Campfire		(18,05,08,05,"REL_CITY_360");
};