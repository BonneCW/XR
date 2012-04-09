INSTANCE Mod_7361_OUT_Setta_TUG (Npc_Default)
{
	name 		= "Setta";
	guild 		= GIL_OUT;
	id 		= 7361;
	voice 		= 16;
	flags           = 2;
	npctype		= NPCTYPE_MAIN;

	B_SetAttributesToChapter (self, 4);
	fight_tactic		= FAI_HUMAN_STRONG;

	EquipItem (self, ItMw_1H_quantarie_Schwert_01);

	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_Blondie, BodyTexBabe_N, ITAR_Buergerinkleid8);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds");

	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 55);

	daily_routine 		= Rtn_Start_7361;
};

FUNC VOID Rtn_Start_7361 ()
{
	TA_Stand_Guarding	(08,00,20,00,"TUG_83");
	TA_Stand_Guarding	(20,00,08,00,"TUG_83");
};

FUNC VOID Rtn_Dorf_7361()
{	
	TA_Sit_Chair		(06,05,22,15,"TUG_46");
	TA_Sleep		(22,15,06,05,"TUG_53"); 
};