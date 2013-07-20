instance Mod_7604_STT_Schatten_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_mt_schatten;
	guild 		=		GIL_STRF;
	level 		=		5;
	
	
	voice 		=		10;
	id 			=		7604;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 56,  1, STT_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	B_SetFightSkills	(self, 45);
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7604;
};

FUNC VOID Rtn_start_7604 ()
{
	TA_Sit_Campfire		(08,00,19,00,"NW_FARM2_TO_TAVERN_RANGERBANDITS_02");
	TA_Sit_Campfire		(19,00,08,00,"NW_FARM2_TO_TAVERN_RANGERBANDITS_02");
};

FUNC VOID Rtn_Zuris_7604 ()
{
	TA_Stand_ArmsCrossed		(08,00,19,00,"NW_TAVERN_TO_FOREST_04");
	TA_Stand_ArmsCrossed		(19,00,08,00,"NW_TAVERN_TO_FOREST_04");
};