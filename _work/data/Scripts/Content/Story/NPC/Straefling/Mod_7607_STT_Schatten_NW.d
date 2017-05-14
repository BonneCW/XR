instance Mod_7607_STT_Schatten_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 	=		NPCTYPE_mt_schatten;
	guild 		=		GIL_STRF;
	level 		=		7;
	
	voice		= 0;
	id 			=		7607;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 57,  1, STT_ARMOR_M);
        
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	B_SetFightSkills	(self, 50);
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7607;
};

FUNC VOID Rtn_start_7607 ()
{
	TA_Sit_Campfire		(06,45,10,00,"WP_JAEGERLAGER_02");
	TA_Sit_Campfire		(10,00,06,45,"WP_JAEGERLAGER_02");
};

FUNC VOID Rtn_Zuris_7607 ()
{
	TA_Stand_ArmsCrossed		(08,00,19,00,"NW_TAVERN_TO_FOREST_04");
	TA_Stand_ArmsCrossed		(19,00,08,00,"NW_TAVERN_TO_FOREST_04");
};