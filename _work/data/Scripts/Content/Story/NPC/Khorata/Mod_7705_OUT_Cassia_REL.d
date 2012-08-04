instance Mod_7705_OUT_Cassia_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cassia"; 
	guild 		= GIL_OUT;
	id 			= 7705;
	voice 		= 16;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//----------AIVARS--------------
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Meisterdegen); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ITKE_Thiefguildkey_Hotel_MIS,1);
	CreateInvItems (self,ItKe_ThiefTreasure	,1);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_BlackHair, BodyTexBabe_N, ITAR_VlkBabe_H);		
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7705;
};

FUNC VOID Rtn_Start_7705()
{	
	TA_Sit_Throne	 	(07,00,23,00,"REL_CITY_310");
	TA_Sit_Throne		(23,00,07,00,"REL_CITY_310");
};

FUNC VOID Rtn_VorTaverne_7705()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"REL_CITY_302");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"REL_CITY_302");
};

FUNC VOID Rtn_ToHaus_7705()
{	
	TA_Guide_Player 	(07,00,23,00,"REL_CITY_053");
	TA_Guide_Player		(23,00,07,00,"REL_CITY_053");
};

FUNC VOID Rtn_Besichtigung_7705()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"REL_CITY_057");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"REL_CITY_057");
};

FUNC VOID Rtn_InHaus_7705()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"REL_CITY_057");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"REL_CITY_057");
};

FUNC VOID Rtn_VorSchneider_7705()
{	
	TA_RunToWP	(08,00,20,00,"REL_CITY_231");
	TA_RunToWP 	(20,00,08,00,"REL_CITY_231");
};

FUNC VOID Rtn_ToBib_7705()
{	
	TA_Guide_Player 	(07,00,23,00,"REL_CITY_145");
	TA_Guide_Player		(23,00,07,00,"REL_CITY_145");
};

FUNC VOID Rtn_AtBib_7705()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"REL_CITY_146");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"REL_CITY_146");
};

FUNC VOID Rtn_Richter_7705()
{	
	TA_Smalltalk_Cassia	(08,00,20,00,"REL_CITY_148");
	TA_Smalltalk_Cassia	(20,00,08,00,"REL_CITY_148");
};

FUNC VOID Rtn_Tot_7705()
{	
	TA_Stand_Guarding 	(07,00,23,00,"TOT");
	TA_Stand_Guarding	(23,00,07,00,"TOT");
};

FUNC VOID Rtn_DokumenteLesen_7705()
{	
	TA_Study_WP	(08,00,20,00,"REL_CITY_057");
	TA_Study_WP	(20,00,08,00,"REL_CITY_057");
};

FUNC VOID Rtn_Hacken_7705()
{	
	TA_Stand_Guarding	(08,00,20,00,"REL_CITY_060");
	TA_Stand_Guarding 	(20,00,08,00,"REL_CITY_060");
};

FUNC VOID Rtn_Schatzkammer_7705()
{	
	TA_Follow_Player	(08,00,20,00,"REL_CITY_060");
	TA_Follow_Player 	(20,00,08,00,"REL_CITY_060");
};

FUNC VOID Rtn_InSchatzkammer_7705()
{	
	TA_Pick_FP		(08,00,20,00,"REL_CITY_KANAL_027");
	TA_Pick_FP	 	(20,00,08,00,"REL_CITY_KANAL_027");
};