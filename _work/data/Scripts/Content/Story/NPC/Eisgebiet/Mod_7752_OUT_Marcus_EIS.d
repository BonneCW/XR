instance Mod_7752_OUT_Marcus_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Marcus";	
	guild 		= GIL_OUT;
	id 			= 7752;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
	aivar[AIV_ToughGuy]		= TRUE;		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	CreateInvItems (self,ItKe_City_Tower_02,1);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Tough_Skip, BodyTex_N, ITAR_Eisgebiet_Miliz);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7752;
};

FUNC VOID Rtn_Start_7752()
{	
	TA_Cook_Stove		(08,00,20,00,"EISFESTUNGHERD");
	TA_Sleep		(20,00,08,00,"EISFESTUNG_17");
};

FUNC VOID Rtn_Sendak_7752 ()
{
	TA_Guide_Player		 (08,00,22,00,"EIS_324"); 
    	TA_Guide_Player		 (22,00,08,00,"EIS_324");
};

FUNC VOID Rtn_Melchior_7752 ()
{
	TA_Guide_Player		 (08,00,22,00,"MELCHIORSLAGER_01"); 
    	TA_Guide_Player		 (22,00,08,00,"MELCHIORSLAGER_01");
};

FUNC VOID Rtn_AtMelchior_7752()
{	
	TA_Waermen	 	(08,00,22,00,"MELCHIORSLAGER_01");
	TA_Sleep		(22,00,08,00,"MELCHIORSLAGER_02");
};