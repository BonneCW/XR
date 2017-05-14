instance Mod_1129_GRD_Torwache_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Torwache;
	npctype		=	npctype_main;
	guild 		=	GIL_OUT;
	level 		=	15;
	voice		= 0;
	id 			=	1129;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 4);			
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 12,  1, GRD_ARMOR_M);
        
        Mdl_SetModelFatness(self,0);
    	
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);		
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1129;
};

FUNC VOID Rtn_start_1129 ()
{
    TA_Stand_Guarding		(06,00,21,00,"OCR_MAINGATE_RIGHT_GUARD");
    TA_Stand_Guarding		(21,00,06,00,"OCR_MAINGATE_RIGHT_GUARD");	
};

