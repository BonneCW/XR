instance Mod_6007_SLD_Lares_GDG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lares"; 
	guild 		= GIL_NONE;
	id 			= 6007;
	voice 		= 9;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ aivars ------
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_NPCIsRanger] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, Lares_Axt); 
	
	
	// ------ Inventory ------
	CreateInvItems (self, Lares_Axt,1);//zur Sicherheit - bei Waffenverlust hat er 'ne neue M.F.
	CreateInvItems (self, ItMi_Gold, 100);	
	CreateInvItems (self, ItMi_OldCoin, 1);	//Joly: damit er gefunden wird, wenn er im Kampf stirbt
	CreateInvItems (self, ItPo_Health_02, 5);	//Mattes: damit er frisch bei Taverne ankommt.								
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Lares,BodyTex_N, ITAR_SLD_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_6007;
};

FUNC VOID Rtn_PreStart_6007()
{
	TA_Stand_Guarding		(08,00,20,00,"LGR_RATSHAUS_17");
	TA_Stand_Guarding		(20,00,08,00,"LGR_RATSHAUS_17");
};