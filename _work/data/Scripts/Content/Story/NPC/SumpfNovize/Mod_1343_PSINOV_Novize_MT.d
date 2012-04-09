instance Mod_1343_PSINOV_Novize_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype	 	=		Npctype_mt_sumpfnovize;
	guild 		=		GIL_out;
	level 		=		9;
	
	voice 		=		3;
	id 			=		1343;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	15;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	12;
	attribute[ATR_MANA] 			=	12;
	attribute[ATR_HITPOINTS_MAX] 	=	148;
	attribute[ATR_HITPOINTS] 		=	148;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1 ,"Hum_Head_FatBald", 29 ,  1, NOV_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
	//-------- inventory --------

	
 
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1343;
};

FUNC VOID Rtn_start_1343 () //Sumpfkraut-Sammler
{
	TA_PickRice (07,00,19,00,"PATH_TAKE_HERB_06");
	TA_PickRice (19,00,07,00,"PATH_TAKE_HERB_06");
};

FUNC VOID Rtn_Tot_1343 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};