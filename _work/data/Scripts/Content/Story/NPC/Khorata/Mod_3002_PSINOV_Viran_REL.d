instance Mod_3002_PSINOV_Viran_REL (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Viran";
	Npctype	 	=		Npctype_Main;
	guild 		=		GIL_OUT;
	level 		=		15;
	
	voice 		=		7;
	id 			=		3002;
		
	
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 26,  1, NOV_ARMOR_L);

	Mdl_SetModelFatness(self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3002;

};

FUNC VOID Rtn_start_3002 () //Sumpfkraut-Sammler-Chef
{
	TA_Pick_FP		(07,00,17,00,"REL_MOOR_139");
	TA_Potion_Alchemy	(17,00,23,00,"REL_MOOR_156");
	TA_Sleep		(23,00,07,00,"REL_MOOR_156");
};