INSTANCE Mod_7276_OUT_Regina_REL (Npc_Default)
{

	name 		= "Regina";
	guild 		= GIL_OUT;
	id 		= 7276;
	voice 		= 43;
	flags           = 0;
	npctype		= NPCTYPE_MAIN;


	B_SetAttributesToChapter (self, 3);
	fight_tactic		= FAI_HUMAN_STRONG;

        B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_PinkHair, BodyTexBabe_N, ITAR_BauBabe_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	B_GiveNpcTalents (self);

	B_SetFightSkills (self, 50);

	daily_routine 		= Rtn_PreStart_7276;
};

FUNC VOID Rtn_PreStart_7276()
{
        TA_Sleep	(22,00,07,00,"REL_CITY_117");
	TA_Sit_Throne	(07,00,22,00,"REL_CITY_116");
};