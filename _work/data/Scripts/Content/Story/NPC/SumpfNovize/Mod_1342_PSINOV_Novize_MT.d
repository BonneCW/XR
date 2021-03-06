instance Mod_1342_PSINOV_Novize_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype	 	=		Npctype_mt_sumpfnovize;
	guild 		=		GIL_out;
	level 		=		3;
	
	voice		= 0;
	id 			=		1342;
		
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 26,  1, NOV_ARMOR_L);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
		
	//-------- inventory --------

	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1342;
};

FUNC VOID Rtn_start_1342 () //Sumpfkraut-Sammler
{
	TA_PickRice (07,00,19,00,"PATH_TAKE_HERB_2_1");
	TA_PickRice (19,00,07,00,"PATH_TAKE_HERB_2_1");
};

FUNC VOID Rtn_Tot_1342 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};