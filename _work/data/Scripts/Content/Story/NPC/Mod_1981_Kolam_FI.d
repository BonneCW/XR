instance Mod_1981_Kolam_FI (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Kolam";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_DMT;
	level 		=		20;
	 	
	voice		= 3;
	id 			=		1981;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);


	EquipItem	(self, ItMw_1h_Mil_Sword);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 28,  1, ITAR_Kolam);

	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 65);
	B_CreateAmbientInv 	(self);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1981;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_1981 ()
{
	TA_Stand_ArmsCrossed	(02,00,08,00,"FI_67");
	TA_Stand_ArmsCrossed	(08,00,02,00,"FI_67"); 
};

FUNC VOID Rtn_Rede_1981 ()
{
	TA_Smalltalk_Plaudern	(02,00,08,00,"FI_59");
	TA_Smalltalk_Plaudern	(08,00,02,00,"FI_59"); 
};

FUNC VOID Rtn_Ende_1981 ()
{
	TA_Stand_ArmsCrossed	(02,00,08,00,"FI_81");
	TA_Stand_ArmsCrossed	(08,00,02,00,"FI_81"); 
};

FUNC VOID Rtn_Tot_1981 ()
{
	TA_Stand_ArmsCrossed	(02,00,08,00,"TOT");
	TA_Stand_ArmsCrossed	(08,00,02,00,"TOT"); 
};