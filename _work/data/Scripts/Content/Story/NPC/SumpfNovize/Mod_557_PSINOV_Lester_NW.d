INSTANCE Mod_557_PSINOV_Lester_NW (Npc_Default)
{
	name 		= "Lester";
	guild 		= GIL_OUT;
	id 		= 557;
	voice 		= 13;
	flags           = 0;
	npctype		= NPCTYPE_FRIEND;

	B_SetAttributesToChapter (self, 6);																

	fight_tactic		= FAI_HUMAN_MASTER;	

	B_CreateAmbientInv 	(self);
	EquipItem (self,Streitschlichter);

	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_P_Lester, BodyTex_P, ITAR_LESTER);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	B_GiveNpcTalents (self);

	B_SetFightSkills (self, 30); 

	daily_routine 		= Rtn_Start_557;
};

FUNC VOID Rtn_Start_557()
{	
    TA_Stand_Armscrossed	        (08,00,23,00,"NW_XARDAS_BANDITS_RIGHT");
    TA_Stand_Armscrossed	        (23,00,08,00,"NW_XARDAS_BANDITS_LEFT");
};

FUNC VOID Rtn_Treffen_557()
{	
	TA_Stand_ArmsCrossed	(05,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");	
	TA_Stand_ArmsCrossed	(20,00,05,00,"NW_TAVERNE_IN_RANGERMEETING");
};

FUNC VOID Rtn_Karras_557()
{	
	TA_Follow_Player	(05,00,20,00,"NW_XARDAS_TOWER_LESTER");	
	TA_Follow_Player	(20,00,05,00,"NW_XARDAS_TOWER_LESTER");
};

FUNC VOID Rtn_Tot_557()
{	
	TA_Stand_ArmsCrossed	(05,00,20,00,"TOT");	
	TA_Stand_ArmsCrossed	(20,00,05,00,"TOT");
};

FUNC VOID Rtn_Schiff_557()
{	
	TA_Smalltalk	(05,00,20,00,"SHIP_CREW_19");	
	TA_Smalltalk	(20,00,05,00,"SHIP_CREW_19");
};

FUNC VOID Rtn_AtXardas_557()
{
	TA_Smalltalk_Plaudern		(08,00,20,00,"NW_XARDAS_TOWER_IN1_25");
	TA_Smalltalk_Plaudern		(20,00,08,00,"NW_XARDAS_TOWER_IN1_25");
};