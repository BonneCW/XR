instance Mod_7762_OUT_Ruediger_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rüdiger"; 
	guild 		= GIL_OUT;
	id 			= 7762;
	voice		= 0;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Inventory ------
	CreateInvItems (self, ItMi_Gold, 50);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Orry, BodyTex_N, ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,1.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7762;
};

FUNC VOID Rtn_Start_7762()
{	
	TA_Sit_Chair		(07,45,19,45,"ALTEFESTUNG_08");
   	TA_Sit_Chair		(19,45,07,45,"ALTEFESTUNG_08");
};