INSTANCE Mod_7417_JG_Cyrco_JL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cyrco";
	guild 		= GIL_OUT;
	id 			= 7417;
	voice 		= 10;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------											
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Corristo , BodyTex_N, ITAR_Swampshark);
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7417;
};

FUNC VOID Rtn_PreStart_7417 ()
{	
	TA_Stand_Guarding	(07,00,10,00,"JL_02");
	TA_Stand_Guarding	(10,00,12,00,"JL_05");
	TA_Sit_Bench		(12,00,15,00,"JL_20");
	TA_Stand_Guarding	(15,00,18,00,"JL_07");
	TA_Stand_Guarding	(18,00,22,00,"JL_02");
    	TA_Sleep		(22,00,07,00,"ZELT_01");
};

FUNC VOID Rtn_Khorgor_7417 ()
{	
	TA_Smalltalk	(07,00,22,00,"JL_02");
    	TA_Smalltalk	(22,00,07,00,"JL_02");
};