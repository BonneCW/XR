instance Mod_1023_KGD_Turmwache_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Turmwache";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;
	level 		=	20;
	voice 		=	3;
	id 			=	1023;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");



	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 2, 1,"Hum_Head_Thief", 70,  1, SSLD_ARMOR);
        
	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 60); 
	B_SetAttributesToChapter (self, 4);		
			
	//-------- inventory --------
	EquipItem	(self, ItMw_2h_Sld_Sword);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1023;
};

FUNC VOID Rtn_start_1023 ()
{

	TA_Stand_WP	(00,00,20,00,"MC_T_LOOK");	
	TA_Stand_WP	(20,00,00,00,"MC_T_LOOK");	
};
