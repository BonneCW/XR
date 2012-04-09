INSTANCE Mod_556_NOV_Theodor_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Novize";
	guild 		= GIL_VLK;
	id 		= 556;
	voice 		= 13;
	flags           = 0;
	npctype		= NPCTYPE_nw_feuernovize;
	
	B_SetAttributesToChapter (self, 2);	
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	EquipItem	(self, ItMw_1h_Nov_Mace); 																
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItSc_Sleep,1);
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_Tough_Torrez, BodyTex_P, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 25); 

	daily_routine 		= Rtn_Start_556;
};

FUNC VOID Rtn_Start_556()
{	
	TA_Stomp_Herb		(08,00,10,00,"NW_MONASTERY_WINEMAKER_04");
	TA_Stomp_Herb	(10,00,11,00,"NW_MONASTERY_WINEMAKER_04");
        TA_Stomp_Herb		(11,00,23,30,"NW_MONASTERY_WINEMAKER_04");
        TA_Stomp_Herb		(23,30,08,00,"NW_MONASTERY_WINEMAKER_04");
};
