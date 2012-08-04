instance Mod_7220_SLD_Thofeistos_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Thofeistos"; 
	guild 		= GIL_MIL;
	id 			= 7220;
	voice 		= 29;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------
	EquipItem (self, ItMw_GrobesKurzschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_NormalBart01, BodyTex_L, ITAR_SMITH);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7220;
};

FUNC VOID Rtn_Start_7220()
{	
	TA_Stand_Drinking	(20,00,01,00,"NC_HUT11_OUT");
	TA_Sleep			(01,00,05,00,"NC_HUT11_IN");
	TA_Sit_Bench		(05,00,06,00,"NC_PLACE04");
	
	TA_Smith_Fire	(06,00,06,10,"NC_PATH04");
	TA_Smith_Anvil	(06,10,06,20,"NC_PATH04");
	TA_Smith_Fire	(06,20,06,30,"NC_PATH04");
	TA_Smith_Anvil	(06,30,06,40,"NC_PATH04");
	TA_Smith_Cool	(06,40,06,50,"NC_PATH04");
	TA_Smith_Anvil	(06,50,07,00,"NC_PATH04");
	
	TA_Smith_Fire	(07,00,07,10,"NC_PATH04");
	TA_Smith_Anvil	(07,10,07,20,"NC_PATH04");
	TA_Smith_Fire	(07,20,07,30,"NC_PATH04");
	TA_Smith_Anvil	(07,30,07,40,"NC_PATH04");
	TA_Smith_Cool	(07,40,07,50,"NC_PATH04");
	TA_Smith_Anvil	(07,50,08,00,"NC_PATH04");
	
	TA_Smith_Fire	(08,00,08,10,"NC_PATH04");
	TA_Smith_Anvil	(08,10,08,20,"NC_PATH04");
	TA_Smith_Fire	(08,20,08,30,"NC_PATH04");
	TA_Smith_Anvil	(08,30,08,40,"NC_PATH04");
	TA_Smith_Cool	(08,40,08,50,"NC_PATH04");
	TA_Smith_Anvil	(08,50,09,00,"NC_PATH04");

	TA_Smith_Fire	(09,00,09,10,"NC_PATH04");
	TA_Smith_Anvil	(09,10,09,20,"NC_PATH04");
	TA_Smith_Fire	(09,20,09,30,"NC_PATH04");
	TA_Smith_Anvil	(09,30,09,40,"NC_PATH04");
	TA_Smith_Cool	(09,40,09,50,"NC_PATH04");
	TA_Smith_Anvil	(09,50,10,00,"NC_PATH04");

	TA_Smith_Fire	(10,00,10,10,"NC_PATH04");
	TA_Smith_Anvil	(10,10,10,20,"NC_PATH04");
	TA_Smith_Fire	(10,20,10,30,"NC_PATH04");
	TA_Smith_Anvil	(10,30,10,40,"NC_PATH04");
	TA_Smith_Cool	(10,40,10,50,"NC_PATH04");
	TA_Smith_Anvil	(10,50,11,00,"NC_PATH04");    
          
	TA_Smith_Fire	(11,00,11,10,"NC_PATH04");
	TA_Smith_Anvil	(11,10,11,20,"NC_PATH04");
	TA_Smith_Fire	(11,20,11,30,"NC_PATH04");
	TA_Smith_Anvil	(11,30,11,40,"NC_PATH04");
	TA_Smith_Cool	(11,40,11,50,"NC_PATH04");
	TA_Smith_Anvil	(11,50,12,00,"NC_PATH04");

	TA_Smith_Fire	(12,00,12,10,"NC_PATH04");
	TA_Smith_Anvil	(12,10,12,20,"NC_PATH04");
	TA_Smith_Fire	(12,20,12,30,"NC_PATH04");
	TA_Smith_Anvil	(12,30,12,40,"NC_PATH04");
	TA_Smith_Cool	(12,40,12,50,"NC_PATH04");
	TA_Smith_Anvil	(12,50,13,00,"NC_PATH04");
          
	TA_Smith_Fire	(13,00,13,10,"NC_PATH04");
	TA_Smith_Anvil	(13,10,13,20,"NC_PATH04");
	TA_Smith_Fire	(13,20,13,30,"NC_PATH04");
	TA_Smith_Anvil	(13,30,13,40,"NC_PATH04");
	TA_Smith_Cool	(13,40,13,50,"NC_PATH04");
	TA_Smith_Anvil	(13,50,14,00,"NC_PATH04");

	TA_Smith_Fire	(14,00,14,10,"NC_PATH04");
	TA_Smith_Anvil	(14,10,14,20,"NC_PATH04");
	TA_Smith_Fire	(14,20,14,30,"NC_PATH04");
	TA_Smith_Anvil	(14,30,14,40,"NC_PATH04");
	TA_Smith_Cool	(14,40,14,50,"NC_PATH04");
	TA_Smith_Anvil	(14,50,15,00,"NC_PATH04");

	TA_Smith_Fire	(15,00,15,10,"NC_PATH04");
	TA_Smith_Anvil	(15,10,15,20,"NC_PATH04");
	TA_Smith_Fire	(15,20,15,30,"NC_PATH04");
	TA_Smith_Anvil	(15,30,15,40,"NC_PATH04");
	TA_Smith_Cool	(15,40,15,50,"NC_PATH04");
 	TA_Smith_Anvil	(15,50,16,00,"NC_PATH04");

	TA_Smith_Fire	(16,00,16,10,"NC_PATH04");
	TA_Smith_Anvil	(16,10,16,20,"NC_PATH04");
	TA_Smith_Fire	(16,20,16,30,"NC_PATH04");
	TA_Smith_Anvil	(16,30,16,40,"NC_PATH04");
	TA_Smith_Cool	(16,40,16,50,"NC_PATH04");
	TA_Smith_Anvil	(16,50,17,00,"NC_PATH04");

	TA_Smith_Fire	(17,00,17,10,"NC_PATH04");
	TA_Smith_Anvil	(17,10,17,20,"NC_PATH04");
	TA_Smith_Fire	(17,20,17,30,"NC_PATH04");
	TA_Smith_Anvil	(17,30,17,40,"NC_PATH04");
	TA_Smith_Cool	(17,40,17,50,"NC_PATH04");
	TA_Smith_Anvil	(17,50,18,00,"NC_PATH04");

	TA_Smith_Fire	(18,00,18,10,"NC_PATH04");
	TA_Smith_Anvil	(18,10,18,20,"NC_PATH04");
	TA_Smith_Fire	(18,20,18,30,"NC_PATH04");
	TA_Smith_Anvil	(18,30,18,40,"NC_PATH04");
	TA_Smith_Cool	(18,40,18,50,"NC_PATH04");
	TA_Smith_Anvil	(18,50,19,00,"NC_PATH04");

	TA_Smith_Fire	(19,00,19,10,"NC_PATH04");
	TA_Smith_Anvil	(19,10,19,20,"NC_PATH04");
	TA_Smith_Fire	(19,20,19,30,"NC_PATH04");
	TA_Smith_Anvil	(19,30,19,40,"NC_PATH04");
	TA_Smith_Cool	(19,40,19,50,"NC_PATH04");
	TA_Smith_Anvil	(19,50,20,00,"NC_PATH04");
};