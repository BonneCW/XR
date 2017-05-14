instance Mod_1018_KGD_Berdin_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Berdin";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_OUT;
	voice		= 0;
	id 			=	1018;
		
	//-------- abilities --------

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	


	
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 13,  1, SSLD_ARMOR);
        
	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 60); 
	B_SetAttributesToChapter (self, 4);		
			
	//-------- inventory --------	
	EquipItem	(self, ItMw_1h_Vlk_Sword);
	EquipItem	(self, ItRw_Bow_M_02);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1018;
};

FUNC VOID Rtn_start_1018 ()
{
	TA_Smalltalk	(10,00,13,00,"MC_WA_BOW_1"); // mit Bamrad
	TA_Stand_WP	(13,00,17,00,"MC_WA_BOW_2");	
	TA_Stand_WP	(17,00,20,00,"MC_EINGANG");
	TA_Sit_Campfire	(20,00,21,00,"MC_FP_3");	
	TA_Smalltalk	(21,00,23,00,"MC_FP_3"); // mit Melcador
	TA_Sleep	(24,00,10,00,"MC_S_005");
	
};
