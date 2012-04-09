instance Mod_7768_OUT_Amorite_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Amorite";	//Halvors Frau
	guild 		= GIL_OUT;
	id 			= 7768;
	voice 		= 17;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_GreyCloth, BodyTex_N, ITAR_Eisgebiet_04);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7768;
};

FUNC VOID Rtn_Start_7768 ()
{	
	TA_Sit_Chair		(04,55,22,05,"EIS_DORF_006");
	TA_Sit_Chair		(22,05,04,55,"EIS_DORF_006");
};