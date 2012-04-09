instance Mod_7730_OUT_Brendan_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brendan";	
	guild 		= GIL_OUT;
	id 			= 7730;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart10, BodyTex_N, ITAR_Eisgebiet_Miliz);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7730;
};

FUNC VOID Rtn_Start_7730()
{	
	TA_Sit_Campfire		(07,00,20,00,"NORTDGEBIET_93");
	TA_Sit_Campfire		(20,00,07,00,"NORTDGEBIET_93");
};

FUNC VOID Rtn_Follow_7730 ()
{
	TA_Follow_Player	(08,00,23,00,"NORTDGEBIET_93");
	TA_Follow_Player	(23,00,08,00,"NORTDGEBIET_93");	
};

FUNC VOID Rtn_Willingham_7730 ()
{
	TA_Smalltalk		(08,00,23,00,"EISFESTUNG_18");
	TA_Smalltalk		(23,00,08,00,"EISFESTUNG_18");	
};

FUNC VOID Rtn_Dorf_7730 ()
{
	TA_Stand_Guarding	(08,00,23,00,"EISFESTUNG_24");
	TA_Sleep		(23,00,08,00,"EISFESTUNG_17");	
};
