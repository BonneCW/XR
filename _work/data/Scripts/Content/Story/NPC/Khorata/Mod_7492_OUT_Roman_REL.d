instance Mod_7492_OUT_Roman_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Roman"; 
	guild 		= GIL_OUT;
	id 			= 7492;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Olli_Kahn, BodyTex_N,SFB_ARMOR_L);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7492;
};

FUNC VOID Rtn_Start_7492()
{	
	TA_Stand_ArmsCrossed		(05,35,11,30,"REL_CITY_294");
	TA_Stand_ArmsCrossed 		(11,30,05,35,"REL_CITY_294");
};

FUNC VOID Rtn_AtMine_7492()
{	
	TA_Stand_ArmsCrossed		(05,35,11,30,"REL_SURFACE_207");
	TA_Stand_ArmsCrossed 		(11,30,05,35,"REL_SURFACE_207");
};

FUNC VOID Rtn_Tot_7492()
{	
	TA_Stand_ArmsCrossed		(05,35,11,30,"TOT");
	TA_Stand_ArmsCrossed 		(11,30,05,35,"TOT");
};

FUNC VOID Rtn_Theodorus_7492()
{	
	TA_Stand_Eating	(08,00,23,00,"REL_CITY_001");
	TA_Stand_Eating	(23,00,08,00,"REL_CITY_001");
};

FUNC VOID Rtn_InCity_7492()
{	
	TA_Stand_Drinking	(08,00,23,00,"ALTEFESTUNG_014");
	TA_Stand_Drinking	(23,00,08,00,"ALTEFESTUNG_014");
};

FUNC VOID Rtn_FollowToWendel_7492()
{	
	TA_Follow_Player	(08,00,23,00,"RATHAUSUNTEN_01");
	TA_Follow_Player	(23,00,08,00,"RATHAUSUNTEN_01");
};

FUNC VOID Rtn_AtWendel_7492()
{	
	TA_Smalltalk_Plaudern	(08,00,23,00,"RATHAUSUNTEN_01");
	TA_Smalltalk_Plaudern	(23,00,08,00,"RATHAUSUNTEN_01");
};