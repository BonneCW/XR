INSTANCE Kakos_11006_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kakos";	
	guild 		= GIL_OUT;
	id 			= 11006;
	voice 		= 10;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	level = 400;
	
	// ------ Attribute ------
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_STRENGTH] = 500;	

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	-1;
	protection	[PROT_MAGIC]		=	80;																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, itmw_1h_bau_mace);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic.", 217, BodyTex_N, NO_ARMOR);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 

	Mdl_SetModelScale(self, 3.0, 2.0, 3.0);

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11006;
};

FUNC VOID Rtn_Start_11006 ()
{	
	TA_Sit_Campfire	(08,00,22,00,"WP_KAKOS");
	TA_Sit_Campfire	(22,00,08,00,"WP_KAKOS");
};