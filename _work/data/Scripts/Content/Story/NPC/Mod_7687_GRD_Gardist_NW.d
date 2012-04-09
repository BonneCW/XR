instance Mod_7687_GRD_Gardist_NW (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_mt_gardist;
	guild 		=	GIL_OUT;
	level 		=	10;
	voice 		=	6;
	id 			=	7687;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 17, 1, GRD_ARMOR_L);
        
        Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 60);	
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7687;
};

FUNC VOID Rtn_start_7687 ()
{
	TA_Stand_Guarding		(08,00,18,00,"NW_TAVERNE_TROLLAREA_15");
	TA_Stand_Guarding		(18,00,08,00,"NW_TAVERNE_TROLLAREA_15");
};