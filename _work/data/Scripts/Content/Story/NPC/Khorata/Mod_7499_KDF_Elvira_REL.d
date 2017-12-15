instance Mod_7499_KDF_Elvira_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Elvira";
	guild 		= GIL_OUT;
	id 			= 7499;
	voice		= 21;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);		
														
	EquipItem	(self, ItMW_Addon_Stab01);

	CreateInvItems	(self, ItKe_RELMagier, 1);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Lilo, BodyTex_N, ITAR_KDF_F);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 45); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7499;
};

FUNC VOID Rtn_Start_7499 ()
{	
	TA_Sit_Throne		(08,00,20,00,"REL_CITY_283");
	TA_Sit_Throne		(20,00,08,00,"REL_CITY_283");
};

FUNC VOID Rtn_Busse_7499 ()
{	
	TA_Pray_Innos_FP	(08,00,20,00,"REL_CITY_284");
	TA_Pray_Innos_FP	(20,00,08,00,"REL_CITY_284");
};

FUNC VOID Rtn_Tot_7499 ()
{	
	TA_Sit_Throne		(08,00,20,00,"TOT");
	TA_Sit_Throne		(20,00,08,00,"TOT");
};