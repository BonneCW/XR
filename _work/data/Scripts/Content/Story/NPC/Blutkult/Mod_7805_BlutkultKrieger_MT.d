instance Mod_7805_BlutkultKrieger_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Blutkult-Krieger";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_STRF;
	level 		=		60;
	 	
	voice 		=		2;
	id 			=		7805;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);

	level 		=		60;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 212, 21, Ritual_Krieger);		
	
	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 65);
	B_CreateAmbientInv 	(self);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7805;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_7805 ()
{
	TA_Stand_Guarding	(02,00,08,00,"HOEHLE_16");
	TA_Stand_Guarding	(08,00,02,00,"HOEHLE_16"); 
};