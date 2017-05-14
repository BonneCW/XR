instance Mod_1961_VMK_Struk_TUG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Struk";	
	guild 		= GIL_out;
	id 			= 1961;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_2H_Eminem_Goldschwert_01);
	
	aivar[AIV_Partymember] = TRUE;
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 239, BodyTex_B, ITAR_Verwandlungskrieger);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1961;
};

FUNC VOID Rtn_AtCity_1961 ()
{	
	TA_Smith_Sharp		(08,00,10,00,"TUG_50");
	TA_Sit_Chair		(10,00,12,00,"TUG_46");
	TA_Pee			(12,00,12,30,"TUG_32");
	TA_Roast_Scavenger	(12,30,15,00,"TUG_39");
	TA_Smith_Sharp		(15,00,17,00,"TUG_50");
	TA_Smoke_Joint		(17,00,18,00,"TUG_55");
	TA_Stand_Eating		(18,00,18,30,"TUG_45");
	TA_Stand_Drinking	(18,30,19,00,"TUG_45");
	TA_Stand_Guarding	(19,00,22,00,"TUG_74");
	TA_Waermen		(22,00,23,00,"TUG_72");
	TA_Sleep		(23,00,08,00,"TUG_56");
};

FUNC VOID Rtn_Start_1961 ()
{	
	TA_Follow_Player	(08,00,20,00,"START_TUGETTSO");
	TA_Follow_Player	(20,00,08,00,"START_TUGETTSO");
};