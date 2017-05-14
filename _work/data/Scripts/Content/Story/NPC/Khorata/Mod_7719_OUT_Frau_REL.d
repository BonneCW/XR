instance Mod_7719_OUT_Frau_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Frau";	//Halvors Frau
	guild 		= GIL_OUT;
	id 			= 7719;
	voice		= 0;
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
	daily_routine 		= Rtn_Start_7719;
};

FUNC VOID Rtn_Start_7719 ()
{	
	TA_Sit_Chair		(06,55,11,05,"REL_CITY_130");
	TA_Sweep_FP		(11,05,18,05,"REL_CITY_128");
	TA_Sit_Chair		(18,05,22,05,"REL_CITY_130");
	TA_Sleep	 	(22,05,06,55,"REL_CITY_134");
};