INSTANCE Mod_843_DMB_Xardas_GDG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Xardas";
	guild 		= GIL_NONE;
	id 			= 843;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																			
	EquipItem	(self, ItMW_BeliarStab);
	
	// ------ Inventory ------
	//B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic",Face_N_Xardas , BodyTex_N, ITAR_DMB_S);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 100); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_843;
};

FUNC VOID Rtn_Start_843()
{
	TA_Sit_Throne		(08,00,20,00,"LGR_RATSHAUS_11");
	TA_Sit_Throne		(20,00,08,00,"LGR_RATSHAUS_11");
};

FUNC VOID Rtn_WaitForRitual_843 ()
{
	TA_Stand_WP		(08,00,20,00,"WP_GDG_RITUAL_XARDAS");
	TA_Stand_WP		(20,00,08,00,"WP_GDG_RITUAL_XARDAS");
};

FUNC VOID Rtn_Ritual_843 ()
{
	TA_Ritual_Xardas		(08,00,20,00,"WP_GDG_RITUAL_PYROKAR");
	TA_Ritual_Xardas		(20,00,08,00,"WP_GDG_RITUAL_PYROKAR");
};