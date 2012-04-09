INSTANCE Dschinn_11012_FM (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dschinn";	
	guild 		= GIL_SKELETON_MAGE;
	id 			= 11012;
	voice 		= 10;
	flags       = NPC_FLAG_GHOST;																	
	npctype		= NPCTYPE_MAIN;
	level = 400;
	
	// ------ Attribute ------
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_STRENGTH] = 500;	

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------				
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton_fly.mds");

	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Fly_Body",	1,			DEFAULT,	"",			1,  		DEFAULT,	-1);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11012;
};

FUNC VOID Rtn_Start_11012 ()
{	
	TA_Roam	(08,00,22,00,Npc_GetNearestWP(hero));
	TA_Roam	(22,00,08,00,Npc_GetNearestWP(hero));
};

FUNC VOID Rtn_Tot_11012 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"TOT");
	TA_Stand_ArmsCrossed	(22,00,08,00,"TOT");
};