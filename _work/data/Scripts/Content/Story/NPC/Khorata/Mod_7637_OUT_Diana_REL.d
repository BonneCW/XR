INSTANCE Mod_7637_OUT_Diana_REL (Npc_Default)
{
	name 		= "Diana";
	guild 		= GIL_OUT;
	id 		= 7637;
	voice		= 43;
	flags           = 0;
	npctype		= NPCTYPE_MAIN;

	B_SetAttributesToChapter (self, 1);
	fight_tactic		= FAI_HUMAN_STRONG;

	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_Blondie, BodyTexBabe_N, ITAR_BAUBABE_M);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds");

	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 40);

	daily_routine 		= Rtn_Start_7637;
};

FUNC VOID Rtn_Start_7637 ()
{
	TA_Stand_ArmsCrossed	(08,00,11,15,"REL_SURFACE_219");
	TA_Cook_Stove		(11,15,13,25,"REL_SURFACE_219");
	TA_Stand_Sweeping	(13,25,16,05,"REL_SURFACE_211");
	TA_Stand_ArmsCrossed	(16,05,18,15,"REL_SURFACE_219");
	TA_Sit_Throne		(18,15,21,15,"REL_SURFACE_216");
        TA_Sleep		(21,15,08,00,"REL_SCHEUNESCHLAFEN4");
};