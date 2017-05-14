INSTANCE Mod_7729_OUT_Baro_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Baro"; 
	guild 		= GIL_OUT;
	id 			= 7729;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
		
	// ------ Inventory ------
	// Händler

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Normal_Kirgo, BodyTex_B, ItAr_Eisgebiet_01);	
	Mdl_SetModelFatness	(self,0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7729;
};

FUNC VOID Rtn_Start_7729()
{	
	TA_Saw		(07,05,20,35,"EIS_416");
	TA_Saw		(20,35,07,05,"EIS_416");
};

FUNC VOID Rtn_Dorf_7729()
{	
	TA_Sit_Chair		(07,05,20,35,"EIS_DORF_004");
	TA_Sleep		(20,35,07,05,"EIS_DORF_005");
};

FUNC VOID Rtn_GuideToGarunh_7729()
{	
	TA_Guide_Player		(07,05,20,35,"EIS_443");
	TA_Guide_Player		(20,35,07,05,"EIS_443");
};