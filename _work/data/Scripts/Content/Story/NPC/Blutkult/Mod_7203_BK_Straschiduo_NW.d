instance Mod_7203_BK_Straschiduo_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Straschiduo";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_OUT;
	level 		=		60;
	 	
	voice 		=		29;
	id 			=		7203;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);

	level 		=		60;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 210, 21, Ritual_Magier);		
	
	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 65);
	B_CreateAmbientInv 	(self);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------
	CreateInvItems	(self, ItPo_Blood, 1);
	CreateInvItems	(self, ItPl_Mushroom_03, 1);
	CreateInvItems	(self, ItAt_WaranFireTongue, 2);
	CreateInvItems	(self, ItAt_DemonHeart, 1);
	CreateInvItems	(self, ItWr_Rezept_Blutkult, 1);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7203;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_7203 ()
{
	TA_Guard_Passage	(02,00,08,00,"WP_BK_02");
	TA_Guard_Passage	(08,00,02,00,"WP_BK_02"); 
};