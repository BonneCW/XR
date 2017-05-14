INSTANCE Mod_545_NONE_Gildo_NW (Npc_Default)
{
	name = "Bauer";
   	level = 5;
   	guild = GIL_OUT;
   	id = 545;
   	voice		= 0;
   	flags = 0;
   	npctype = NPCTYPE_NW_BAUER;

 	B_SetAttributesToChapter (self, 4);
   	B_GiveNpcTalents (self);
   	B_SetFightSkills (self, 30);

   	fight_tactic = FAI_HUMAN_STRONG;
   	EquipItem (self, ItMw_1H_Mace_L_01);

	CreateInvItems (self, ItPl_Health_Herb_01, 5);
   	CreateInvItems (self, ItPl_Mushroom_01, 3);
   	CreateInvItems (self, ItMi_Gold, 50);

   	B_SetNpcVisual (self, MALE, "Hum_Head_Bald", Face_P_Weak_Cutter, BodyTex_P, ITAR_Bau_M);
   	Mdl_SetModelFatness	(self, 2);
   	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds");

   	daily_routine = Rtn_Start_545;
};


FUNC VOID Rtn_Start_545 ()
{
	TA_Rake_FP	(08,00,22,00,"NW_FARM1_FIELD_09");
	TA_Sleep	(22,00,08,00,"NW_FARM1_INSTABLE_01");
};

FUNC VOID Rtn_DemonWalker_545 ()
{
	TA_Sit_Chair	(08,00,20,00,"NW_FARM1_INHOUSE_02");
	TA_Sit_Chair	(20,00,08,00,"NW_FARM1_INHOUSE_02");
};