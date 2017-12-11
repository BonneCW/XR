instance Mod_7410_OUT_Frau_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Frau";	//Halvors Frau
	guild 		= GIL_OUT;
	id 			= 7410;
	voice		= 19;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1h_Bau_Mace);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_GreyCloth, BodyTex_N, ItAr_Eisgebiet_03);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7410;
};

FUNC VOID Rtn_Start_7410 ()
{	
	TA_Stand_WP		(04,55,22,05,"EIS_EINSAMEBUDE_1");
	TA_Stand_WP	 	(22,05,04,55,"EIS_EINSAMEBUDE_1");
};

FUNC VOID Rtn_City_7410 ()
{	
	TA_Sleep		(04,55,22,05,"EIS_161");
	TA_Sleep	 	(22,05,04,55,"EIS_161");
};

FUNC VOID Rtn_FollowToSteinkreis_7410 ()
{	
	TA_Follow_Player	(04,55,22,05,"EIS_161");
	TA_Follow_Player 	(22,05,04,55,"EIS_161");
};

FUNC VOID Rtn_AtSteinkreis_7410 ()
{	
	TA_RunToWP		(04,55,22,05,"EIS_01");
	TA_RunToWP	 	(22,05,04,55,"EIS_01");
};

FUNC VOID Rtn_Tot_7410 ()
{	
	TA_Stand_WP		(04,55,22,05,"TOT");
	TA_Stand_WP	 	(22,05,04,55,"TOT");
};