instance Mod_7338_OUT_Lebensmittelhaendler_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rudolf"; 
	guild 		= GIL_OUT;
	id 			= 7338;
	voice		= 5;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_2H_Eminem_Goldschwert_01); 
	
	// ------ Inventory ------
	//CreateInvItems (self, ItWr_Passierschein, 1);wird jetzt über Dialog vergeben, damit nicht mehr im Trade auftaucht 
	CreateInvItems (self, ItMi_Gold, 50);
		
	// ------ visuals ------
	if (Mod_RudolfSchnaps == 0)
	{																			
		B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", 10, BodyTex_N, KhorataHaendler_01);	
	}
	else
	{						
		B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", 222, BodyTex_N, KhorataHaendler_01);
	};
	Mdl_SetModelFatness	(self,1.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7338;
};

FUNC VOID Rtn_Start_7338()
{
	TA_Stand_ArmsCrossed		(07,45,21,45,"REL_CITY_049"); 	
   	TA_Sleep			(21,45,07,45,"REL_CITY_258");
};

FUNC VOID Rtn_Tot_7338()
{	
	TA_Stand_ArmsCrossed	(07,00,23,00,"TOT");
	TA_Sit_Throne		(23,00,07,00,"TOT");
};