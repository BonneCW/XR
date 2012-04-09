instance Mod_1876_EBR_Bloodwyn_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bloodwyn";
	guild 		= GIL_OUT;
	id 			= 1876;
	voice 		= 4;//Stimme Lee
	flags      	= 0;
	npctype		= NPCTYPE_main;
	
	//aivars
	aivar[AIV_StoryBandit]	= TRUE; 	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_Sturmbringer);
	
	// ------ Inventory ------
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Bloodwyn, BodyTex_N, EBR_ARMOR_H2);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1876;
};

FUNC VOID Rtn_Start_1876 ()
{
	TA_Stand_Guarding	(08,00,20,00,"LOCATION_11_07");
	TA_Stand_Guarding	(20,00,08,00,"LOCATION_11_07");
};

FUNC VOID Rtn_AltesLager_1876 ()
{
	TA_Sleep			(02,10,07,40,"OCC_BARONS_UPPER_RIGHT_ROOM_BED3");
	TA_Sleep		(07,40,21,05,"OCC_BARONS_GREATHALL_CENTER_FRONT");
	TA_Sleep		(21,05,02,10,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT2");
};

FUNC VOID Rtn_Smalltalk_1876 ()
{
	TA_Smalltalk_Plaudern		(07,40,21,05,"OCC_BARONS_GREATHALL_CENTER_FRONT");
	TA_Smalltalk_Plaudern		(21,05,07,40,"OCC_BARONS_GREATHALL_CENTER_FRONT");
};

FUNC VOID Rtn_Belauschen_1876 ()
{
	TA_Stand_WP	(08,00,20,00,"OCC_CHAPEL_HALL");
	TA_Stand_WP	(20,00,08,00,"OCC_CHAPEL_HALL");
};

FUNC VOID Rtn_Gefangennahme_1876 ()
{
	TA_Guide_Prisoner		(07,40,21,05,"OCC_BARONS_GREATHALL_CENTER_FRONT");
	TA_Guide_Prisoner		(21,05,07,40,"OCC_BARONS_GREATHALL_CENTER_FRONT");
};

FUNC VOID Rtn_GotoBergkastell_1876 ()
{
	TA_Guide_Prisoner		(07,40,21,05,"CASTLE_MOVEMENT_STRAIGHT");
	TA_Guide_Prisoner		(21,05,07,40,"CASTLE_MOVEMENT_STRAIGHT");
};