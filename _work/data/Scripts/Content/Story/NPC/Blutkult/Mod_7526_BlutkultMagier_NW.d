instance Mod_7526_BlutkultMagier_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Blutkult Magier";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_DMT;
	level 		=		60;
	 	
	voice 		=		2;
	id 			=		7526;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);

	level 		=		65;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 211, 21, Ritual_Magier);		
	
	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 65);
	B_CreateAmbientInv 	(self);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7526;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_7526 ()
{
	TA_Read_Bookstand	(02,00,08,00,"WP_BK_09");
	TA_Read_Bookstand	(08,00,02,00,"WP_BK_09"); 
};

FUNC VOID Rtn_Ritual_7526 ()
{
	TA_Stand_Guarding	(02,00,08,00,"WP_BK_03");
	TA_Stand_Guarding	(08,00,02,00,"WP_BK_03"); 
};