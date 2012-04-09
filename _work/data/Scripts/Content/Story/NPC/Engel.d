instance ENGEL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Engel"; 
	guild 		= GIL_OUT;
	level		=1;
	id 			= 4024;
	//voice 		= 16;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	effect= "SPELLFX_FEAR_WINGS";
	
	//----------AIVARS--------------
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;
	
	// ------ Attribute ------
	Npc_SetTalentSkill (self, NPC_TALENT_MAGE, 6);

	attribute[ATR_STRENGTH] 		= 200;
	attribute[ATR_DEXTERITY] 		= 200;
	attribute[ATR_MANA_MAX] 		= 500;
	attribute[ATR_MANA] 			= 500;
	attribute[ATR_HITPOINTS_MAX] 	= 500;
	attribute[ATR_HITPOINTS] 		= 500;

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Feuerschwert);
	
	// ------ Inventory ------
	
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", 16, 202, NO_ARMOR);		
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	//daily_routine 		= Rtn_Start_4444;
	start_aistate				=	ZS_Engel;
};

FUNC VOID Rtn_Start_4444()
{	
	TA_Engel 	(07,00,23,00,"NW_CITY_KANAL_ROOM_05_02");
    TA_Engel			(23,00,07,00,"NW_CITY_KANAL_ROOM_05_BED_01");
};
