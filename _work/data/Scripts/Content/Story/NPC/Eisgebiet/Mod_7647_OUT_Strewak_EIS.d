INSTANCE Mod_7647_OUT_Strewak_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "gefrorener Leichnam"; 
	guild 		= GIL_NONE;
	id 			= 7647;
	voice		= 0;
	flags       = 2;																
	npctype		= NPCTYPE_FRIEND; //plündert nicht!!! (und ein Freischlag)
	nofocus = 1;
	
	// ------ AIVARs ------
	aivar[AIV_ToughGuy] = TRUE;	
	aivar[AIV_ToughGuyNewsOverride] = TRUE; 

	aivar[AIV_MM_FollowTime] = 1000;
	aivar[AIV_FightDistCancel] = 600;

	aivar[AIV_MaxDistToWp]			= 300;
	aivar[AIV_OriginalFightTactic] 	= FAI_HUMAN_NORMAL;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);

	level = 20;
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------	
	CreateInvItems	(self, ItWr_Strewak_01, 1);
	CreateInvItems	(self, ItWr_Strewak_02, 1);
	CreateInvItems	(self, ItWr_Strewak_03, 1);
	CreateInvItems	(self, ItWr_ManaStonePlate2_Addon, 1);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Bloodwyn, BodyTex_N, ITAR_Eisgebiet_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,10);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7647;
};

FUNC VOID Rtn_Start_7647() //NICHT ÄNDERN --> DIALOG!
{	
	TA_Eingefroren		(10,55,19,15,"EISRIESE_02");
	TA_Eingefroren		(03,30,10,55,"EISRIESE_02");
};

FUNC VOID Rtn_Tot_7647()
{
	TA_Stand_WP		(08,00,22,00,"EISRIESE_02");
	TA_Stand_WP		(22,00,08,00,"EISRIESE_02");
};