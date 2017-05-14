INSTANCE Gnom_11005_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Betrunkener Gnom";
	guild 		= GIL_OUT;
	id 			= 11005;
	voice		= 0;
	flags = 2;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);	

	attribute[ATR_STRENGTH] = 1000;	
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;	

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];													
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	
	// ------ Inventory ------
	// Händler	

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald.", 218, 25, NO_ARMOR);	
	
	Mdl_SetModelFatness	(self, 1.2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	Mdl_SetModelScale(self, 0.7, 0.5, 0.7);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11005;
};

FUNC VOID Rtn_Start_11005 ()
{	
	TA_Sit_Campfire		(05,00,00,00,"WP_GNOM_01");
	TA_Sit_Campfire		(00,00,05,00,"WP_GNOM_01");
};