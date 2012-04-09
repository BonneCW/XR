INSTANCE Mod_7764_PSINOV_Lester_XW (Npc_Default)
{
	name 		= "Lester";
	guild 		= GIL_OUT;
	id 		= 7764;
	voice 		= 13;
	flags           = 2;
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

	daily_routine 		= Rtn_Start_7764;
};

FUNC VOID Rtn_Start_7764()
{
	TA_Smalltalk_Plaudern	(08,00,20,00,"ARENA_01");
	TA_Smalltalk_Plaudern	(20,00,08,00,"ARENA_01");
};

FUNC VOID Rtn_Tribuene_7764 ()
{	
	TA_RunToWP		(08,00,20,00,"ARENA_21");
	TA_RunToWP		(20,00,08,00,"ARENA_21");
};