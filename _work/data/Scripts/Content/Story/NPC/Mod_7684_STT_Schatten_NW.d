instance Mod_7684_STT_Schatten_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_MAIN;
	guild 		=		GIL_out;
	level 		=		5;
	
	
	voice 		=		12;
	id 			=		7684;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 58,  1, STT_ARMOR_M);
        
        Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
        
    	//-------- Talente -------- 

	B_SetFightSkills	(self, 40);	
		
	//-------- inventory --------

	B_CreateAmbientInv	(self);
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_prestart_7684;
};

FUNC VOID Rtn_prestart_7684 ()
{
	TA_Stand_Drinking	(06,00,18,00,"NW_BIGMILL_FARM3_07");
	TA_Stand_Drinking	(18,00,06,00,"NW_BIGMILL_FARM3_07");
};

FUNC VOID Rtn_start_7684 ()
{
	TA_Sit_Campfire	(06,00,18,00,"WP_FLUECHTLINGE");
	TA_Sit_Campfire	(18,00,06,00,"WP_FLUECHTLINGE");
};