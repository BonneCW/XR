instance Mod_6005_PAL_Hagen_GDG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lord Hagen";
	guild 		= GIL_OUT;
	id 			= 6005;
	voice 		= 36;
	flags       = 0;	//Joly: NPC_FLAG_IMMORTAL																
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Paladinschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Tough_Okyl, BodyTex_N, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 1.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_6005;
};
FUNC VOID Rtn_Start_6005 ()
{
	TA_Stand_Guarding		(08,00,20,00,"LGR_EINGANGSWACHE_01");
	TA_Stand_Guarding		(20,00,08,00,"LGR_EINGANGSWACHE_01");
};