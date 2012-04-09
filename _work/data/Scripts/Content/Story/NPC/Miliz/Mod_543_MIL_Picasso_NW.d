INSTANCE Mod_543_MIL_Picasso_NW (Npc_Default)
{
	name 		= "Picasso";
	guild 		= GIL_PAL;
	id 		= 543;
	voice 		= 12;
	flags           = 0;
	npctype		= NPCTYPE_MAIN;
	aivar[AIV_ToughGuy]		= TRUE;

	B_SetAttributesToChapter (self, 3);
	fight_tactic		= FAI_HUMAN_STRONG;
	EquipItem			(self, ItMw_Milizschwert);
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItKe_City_Tower_01,1);
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart_Dusty, BodyTex_N, ITAR_MIL_L);
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds");

	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 30);
	daily_routine 		= Rtn_Start_543;
};

FUNC VOID Rtn_Start_543()
{
	TA_Stand_Guarding	(01,00,12,00,"NW_CITY_HABOUR_KASERN_18");
	TA_Stand_Eating  	(12,00,12,30,"NW_CITY_HABOUR_KASERN_18");
	TA_Stand_Drinking	(12,30,13,00,"NW_CITY_HABOUR_KASERN_18");
	TA_Stand_Guarding	(13,00,01,00,"NW_CITY_HABOUR_KASERN_18");
};
