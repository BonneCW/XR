INSTANCE Mod_7360_OUT_Setta_WS (Npc_Default)
{
	name 		= "Setta";
	guild 		= GIL_DMT;
	id 		= 7360;
	voice 		= 16;
	flags           = 2;
	npctype		= NPCTYPE_MAIN;

	B_SetAttributesToChapter (self, 1);
	fight_tactic		= FAI_HUMAN_STRONG;

	EquipItem (self, ItMw_1H_quantarie_Schwert_01);

	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_Blondie, BodyTexBabe_N, ITAR_Buergerinkleid8);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds");

	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 40);

	daily_routine 		= Rtn_Start_7360;
};

FUNC VOID Rtn_Start_7360 ()
{
	TA_Sit_Bench	(08,00,20,00,"WS_14");
	TA_Sit_Bench	(20,00,08,00,"WS_14");
};