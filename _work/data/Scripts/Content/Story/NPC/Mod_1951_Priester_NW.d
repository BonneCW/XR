instance Mod_1951_Priester_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Priester";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_out;
	level 		=		30;
	 	
	voice 		=		2;
	id 			=		1950;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	level = 5;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 28,  1, ITAR_RyansPriester);

	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 10);
	B_CreateAmbientInv 	(self);

	EquipItem	(self, DreiGoetterStab);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1950;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_1950 ()
{
	TA_Stand_ArmsCrossed	(02,00,08,00,"NW_MAGECAVE_CROSSING");
	TA_Stand_ArmsCrossed	(08,00,02,00,"NW_MAGECAVE_CROSSING"); 
};

FUNC VOID Rtn_Tot_1950 ()
{
	TA_RunToWP		(02,00,08,00,"TOT");
	TA_RunToWP		(08,00,02,00,"TOT"); 
};