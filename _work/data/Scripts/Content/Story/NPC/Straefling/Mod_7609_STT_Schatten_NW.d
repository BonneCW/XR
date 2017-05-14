instance Mod_7609_STT_Schatten_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Schatten;
	npctype 		=		NPCTYPE_mt_schatten;
	guild 		=		GIL_STRF;
	level 		=		7;
	
	
	voice		= 0;
	id 			=		7609;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 5, 0,"Hum_Head_FatBald", 2,  0, STT_ARMOR_M);
        
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	B_SetFightSkills	(self, 40);
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_7609;
};


FUNC VOID Rtn_PreStart_7609 () //Südtor Unten
{
	TA_Saw		(08,00,22,00,"WP_JAEGERLAGER_11");
	TA_Sit_Campfire	(22,00,08,00,"WP_JAEGERLAGER_07");
};

FUNC VOID Rtn_Zuris_7609 ()
{
	TA_Stand_ArmsCrossed		(08,00,19,00,"NW_TAVERN_TO_FOREST_04");
	TA_Stand_ArmsCrossed		(19,00,08,00,"NW_TAVERN_TO_FOREST_04");
};