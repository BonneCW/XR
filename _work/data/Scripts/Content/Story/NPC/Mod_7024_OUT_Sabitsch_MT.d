instance Mod_7024_OUT_Sabitsch_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sabitsch";
	guild 		= GIL_OUT;
	id 			= 7024;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;

	B_SetAttributesToChapter (self, 5);
	attribute[ATR_STRENGTH] = 175;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;	
	level = 100;																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Berserkeraxt);

	CreateInvItems	(self, ItAm_MegaAmulett, 1);
	CreateInvItems	(self, ItMi_GoldRing, 7);
	CreateInvItems	(self, ItMi_SilverRing, 2);
	CreateInvItems	(self, ItMi_GoldNecklace, 3);
	CreateInvItems	(self, ItAm_Hp_01, 1);
	CreateInvItems	(self, ItRi_Str_02, 1);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal06, BodyTex_N, ITAR_DJG_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7024;
};

FUNC VOID Rtn_Start_7024 ()
{
	TA_Sit_Campfire	(08,00,23,00,"OCR_CAMPFIRE_I_2");
	TA_Sleep	(23,00,08,00,"OCR_HUT_31");	
};

func VOID Rtn_Arena_7024 ()
{
	TA_Stand_WP (08,00,20,00,"OCR_ARENABATTLE_TRAIN");
	TA_Stand_WP (20,00,08,00,"OCR_ARENABATTLE_TRAIN");
};

