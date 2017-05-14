INSTANCE Mod_7445_PSINOV_Lester_IR (Npc_Default)
{
	name 		= "Lester";
	guild 		= GIL_OUT;
	id 		= 7445;
	voice		= 0;
	flags           = 0;
	npctype		= NPCTYPE_FRIEND;

	B_SetAttributesToChapter (self, 6);																

	fight_tactic		= FAI_HUMAN_MASTER;	
	aivar[AIV_Partymember] 		= TRUE;

	B_CreateAmbientInv 	(self);
	EquipItem (self,Streitschlichter);

	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_P_Lester, BodyTex_P, ITAR_LESTER);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	B_GiveNpcTalents (self);

	B_SetFightSkills (self, 30); 

	daily_routine 		= Rtn_Start_7445;
};

FUNC VOID Rtn_Start_7445()
{
	TA_Smalltalk	(05,00,20,00,"SHIP_CREW_19");	
	TA_Smalltalk	(20,00,05,00,"SHIP_CREW_19");
};

FUNC VOID Rtn_Follow_7445 ()
{	
	TA_Follow_Player	(08,00,20,00,"SHIP_CREW_19");
	TA_Follow_Player	(20,00,08,00,"SHIP_CREW_19");
};

FUNC VOID Rtn_Waiting_7445 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};