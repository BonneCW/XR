instance Mod_1022_KGD_Turmwache_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Turmwache";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;
	level 		=	20;
	voice 		=	9;
	id 			=	1022;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	


	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 55,  1, SSLD_ARMOR);
        
	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 60); 
	B_SetAttributesToChapter (self, 4);		
			
	//-------- inventory --------
	EquipItem	(self, ItMw_2h_Sld_Sword);
	
		        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1022;
};

FUNC VOID Rtn_start_1022 ()
{

	TA_Stand_WP	(00,00,20,00,"MC_T2_03");	
	TA_Stand_WP	(20,00,00,00,"MC_T2_03");	
};
