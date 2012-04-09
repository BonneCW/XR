instance Mod_592_PAL_Hagen_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lord Hagen";
	guild 		= GIL_PAL;
	id 			= 592;
	voice 		= 4;
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
	if (FokiEingesetzt == 4)
	&& (FokusBlockade == 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Hagen_StellDichEin))
	{																			
		B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Tough_Okyl, 22, NO_ARMOR);	
	}
	else
	{						
		B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Tough_Okyl, 22, ITAR_PAL_H);
	};
	Mdl_SetModelFatness	(self, 1.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_592;
};
FUNC VOID Rtn_Start_592 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_CITY_HAGEN");
	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_CITY_HAGEN");
};

FUNC VOID Rtn_Rat_592()
{
	TA_Stand_Guarding		(08,00,20,00,"WP_KLOSTER_KELLER_RAT_PYROKAR");
	TA_Stand_Guarding		(20,00,08,00,"WP_KLOSTER_KELLER_RAT_PYROKAR");
};

FUNC VOID Rtn_Tot_592()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Surprise_592 ()
{	
	TA_Smalltalk	(08,00,20,00,"NW_CITY_LARIUS_BED");
	TA_Smalltalk	(20,00,08,00,"NW_CITY_LARIUS_BED");
};

FUNC VOID Rtn_HagenKO_592 ()
{	
	TA_Smalltalk_Plaudern	(08,00,23,00,"NW_CITY_HAGEN");
	TA_Smalltalk_Plaudern	(23,00,08,00,"NW_CITY_HAGEN");
};