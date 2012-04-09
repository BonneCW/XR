instance Mod_1130_GRD_Torwache_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Torwache;
	npctype		=	npctype_main;
	guild 		=	GIL_out;
	level 		=	15;
	voice 		=	13;
	id 			=	1130;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 4);			
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Bald", 3,  3, GRD_ARMOR_M);
        
    	Mdl_SetModelFatness(self,0);
    	
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
			
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1130;
	
	//------------- //MISSIONs------------------
};

FUNC VOID Rtn_start_1130 ()
{
	TA_Stand_Guarding		(06,00,14,00,"OCR_NORTHGATE_RIGHT_GUARD");// in späteren Kapiteln, wenn SC nicht mehr durchdarf TA_Stand_GuardingPassage
	TA_Stand_Guarding		(14,00,06,00,"OCR_NORTHGATE_RIGHT_GUARD");// in späteren Kapiteln, wenn SC nicht mehr durchdarf TA_Stand_GuardingPassage
};
