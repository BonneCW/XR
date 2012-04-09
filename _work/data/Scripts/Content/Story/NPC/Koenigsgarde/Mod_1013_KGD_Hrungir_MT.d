instance Mod_1013_KGD_Hrungir_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Hrungir";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;
	level 		=	22;
	voice 		=	7;
	id 		=	1013;
		
	//-------- abilities --------

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");


	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 2, 2,"Hum_Head_Bald", 70,  2, GRD_ARMOR_L);
        
	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 60); 
	B_SetAttributesToChapter (self, 4);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_2h_Sld_Sword);
	


	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1013;
};

FUNC VOID Rtn_start_1013 ()
{

	TA_Stand_WP	(00,00,20,00,"MC_INTRO_03");	
	TA_Stand_WP	(20,00,00,00,"MC_INTRO_04");	
};
