INSTANCE Mod_724_NOV_Mattheus_NW (Npc_Default) 
{
	// ------ NSC ------
	name 		= "Mattheus";
	guild 		= GIL_VLK;
	id 			= 724;
	voice 		= 9;
	flags       = 0;	//Joly: HAUPTSTORY: NOV_600_Pedro ist erst noch immortel -> Pedro klaut das Auge Innos im Kapitel 3, ist später Knacki auf der Dracheninsel																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
	
	// ------ Aivars ------
	aivar[AIV_NewsOverride] 	= TRUE; //damit du noch ins Kloster kommst, wenn du ihn geschlagen hast
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 
	
	// ------ Inventory ------
	CreateInvItems	(self, Mod_MattheusBotschaft, 1);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_PSIONIC", Face_L_Normal_GorNaBar, BodyTex_L, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_724;
};

FUNC VOID Rtn_Start_724 ()
{	
	TA_Pray_Innos_FP	(05,00,06,30,"NW_MONASTERY_CHURCH_03");
	TA_Stand_WP		(06,30,06,35,"NW_MONASTERY_PLACE_03");
	TA_Sit_Bench		(06,35,07,00,"NW_MONASTERY_SHRINE_05");
	TA_Stand_WP		(07,00,11,30,"NW_CITY_CITYHALL_WARROOM_05");
	TA_Stand_Eating		(11,30,12,00,"NW_TAVERNE_IN_01");
	TA_Stand_Drinking	(12,00,17,30,"NW_TAVERNE_IN_01");
	TA_Sit_Chair		(17,30,18,00,"NW_TAVERNE_IN_05");
	TA_Pray_Innos_FP	(18,00,20,00,"NW_MONASTERY_CHURCH_03");
	TA_Sweep_FP		(20,00,21,00,"NW_MONASTERY_NOVICE03_02");
	TA_Sleep		(21,00,05,00,"NW_MONASTERY_NOVICE03_07");
};