INSTANCE Mod_7728_OUT_Willingham_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kommander Willingham";	
	guild 		= GIL_OUT;
	id 			= 7728;
	voice		= 0;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: NPC_FLAG_IMMORTAL																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Paladinschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak12, BodyTex_N, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7728;
};

FUNC VOID Rtn_Start_7728 ()
{
	TA_Sit_Throne	 	(00,00,12,00,"EISFESTUNG_18"); 
	TA_Sit_Throne	 	(12,00,00,00,"EISFESTUNG_18");
};

FUNC VOID Rtn_Brendan_7728 ()
{
	TA_Smalltalk		(08,00,23,00,"EISFESTUNG_18");
	TA_Smalltalk		(23,00,08,00,"EISFESTUNG_18");	
};