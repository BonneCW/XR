instance Mod_7601_GRD_Gardist_NW (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_MAIN;
	guild 		=	GIL_STRF;
	level 		=	15;
	voice 		=	13;
	id 			=	7601;
	
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13,  1, GRD_ARMOR_M);
        
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 
	B_SetFightSkills	(self, 65);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7601;
};

FUNC VOID Rtn_start_7601 ()
{
	TA_Stand_ArmsCrossed(06,00,23,00,"NW_FARM2_TO_TAVERN_RANGERBANDITS_02");	
	TA_Stand_ArmsCrossed(23,00,06,00,"NW_FARM2_TO_TAVERN_RANGERBANDITS_02");	
};

FUNC VOID Rtn_Zuris_7601 ()
{
	TA_Stand_ArmsCrossed		(08,00,19,00,"NW_TAVERN_TO_FOREST_04");
	TA_Stand_ArmsCrossed		(19,00,08,00,"NW_TAVERN_TO_FOREST_04");
};