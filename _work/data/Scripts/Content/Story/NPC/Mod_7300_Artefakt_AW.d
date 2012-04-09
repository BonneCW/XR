INSTANCE Mod_7300_Artefakt_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Magisches Artefakt";
	guild 		= GIL_STRF;
	id 			= 7300;
	flags       = 0;				
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;
	
	// ------ Equippte Waffen ------		
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------				
	Mdl_SetVisual (self,"LAMPE.MDS");
	// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
	Mdl_SetVisualBody (self, "lampe_body", 0,				0,			"", 	0,	0, 			NO_ARMOR);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------	

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7300;
};

FUNC VOID Rtn_Start_7300()
{
	TA_Stand_WP	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
	TA_Stand_WP	(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
};