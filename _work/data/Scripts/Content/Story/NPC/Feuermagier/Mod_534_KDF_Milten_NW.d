INSTANCE Mod_534_KDF_Milten_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Milten";
	guild 		= GIL_OUT;
	id 			= 534;
	voice		= 0;
	flags       = 2;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ aivar ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;																
	EquipItem	(self, ItMW_Addon_Stab01);	
	
	// ------ Equippte Waffen ------																	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_N_Milten, BodyTex_N, ITAR_KDF_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_534;
};

FUNC VOID Rtn_Start_534()
{	
	TA_Potion_Alchemy	(08,00,23,00,"NW_MONASTERY_ALCHEMY_01");
   	TA_Potion_Alchemy	(23,00,08,00,"NW_MONASTERY_ALCHEMY_01");
};

FUNC VOID Rtn_Treffen_534()
{	
	TA_Stand_ArmsCrossed	(05,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");	
	TA_Stand_ArmsCrossed	(20,00,05,00,"NW_TAVERNE_IN_RANGERMEETING");
};

FUNC VOID Rtn_Privat_534()
{	
	TA_Stand_ArmsCrossed	(05,00,20,00,"NW_KDF_LIBRARY_15");	
	TA_Stand_ArmsCrossed	(20,00,05,00,"NW_KDF_LIBRARY_15");
};

FUNC VOID Rtn_GuideToTrollPartOne_534()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_TROLLAREA_PATH_47B");
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_TROLLAREA_PATH_47B");
};

FUNC VOID Rtn_GuideToTrollPartTwo_534()
{
	TA_Guide_Player	(08,00,20,00,"NW_TROLLAREA_PATH_41");
	TA_Guide_Player	(20,00,08,00,"NW_TROLLAREA_PATH_41");
};

FUNC VOID Rtn_GuideToTrollPartThree_534()
{
	TA_Guide_Player	(08,00,20,00,"NW_TROLLAREA_PATH_13");
	TA_Guide_Player	(20,00,08,00,"NW_TROLLAREA_PATH_13");
};

FUNC VOID Rtn_GuideToTrollPartFour_534()
{
	TA_Guide_Player	(08,00,20,00,"NW_TROLLAREA_PATH_81");
	TA_Guide_Player	(20,00,08,00,"NW_TROLLAREA_PATH_81");
};

FUNC VOID Rtn_StayAtTroll_534()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_TROLLAREA_PATH_81");
	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_TROLLAREA_PATH_81");
};

FUNC VOID Rtn_WaitForPlayer_534()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_MONASTERY_ALCHEMY_01");
	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_MONASTERY_ALCHEMY_01");
};

FUNC VOID Rtn_Schiff_534()
{
	TA_Smalltalk	(08,00,20,00,"SHIP_CREW_19");
	TA_Smalltalk	(20,00,08,00,"SHIP_CREW_19");
};

FUNC VOID Rtn_AtXardas_534()
{
	TA_Smalltalk_Plaudern		(08,00,20,00,"NW_XARDAS_TOWER_IN1_25");
	TA_Smalltalk_Plaudern		(20,00,08,00,"NW_XARDAS_TOWER_IN1_25");
};

FUNC VOID Rtn_Marduk_534()
{
	TA_RunToWP	(08,00,20,00,"NW_MONASTERY_PLACE_08");
	TA_RunToWP	(20,00,08,00,"NW_MONASTERY_PLACE_08");
};