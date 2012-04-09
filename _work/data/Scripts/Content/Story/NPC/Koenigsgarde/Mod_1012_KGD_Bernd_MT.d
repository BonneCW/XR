instance Mod_1012_KGD_Bernd_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Bernd";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_OUT;
	voice 		=	1;
	id 		=	1012;
		
	//-------- abilities --------

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	


	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 13,1, ITAR_SMITH);
        
	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 60); 
	B_SetAttributesToChapter (self, 4);
				
			
	//-------- inventory --------
	EquipItem	(self, ItMw_1h_Sld_Sword);
	

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1012;
};

FUNC VOID Rtn_start_1012 ()
{
	TA_Stand_ArmsCrossed	(09,00,20,00,"MC_S_TILL");
	TA_Smalltalk		(20,00,24,00,"KG_001");	
	TA_Pee			(24,00,00,15,"MC_GU_8");	
	TA_Sleep		(00,15,09,00,"MC_S_003");		
	
};
