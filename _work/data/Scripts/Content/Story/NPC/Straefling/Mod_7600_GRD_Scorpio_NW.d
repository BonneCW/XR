instance Mod_7600_GRD_Scorpio_NW (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Scorpio";
	npctype		=	npctype_main;
	guild 		=	GIL_STRF;
	level 		=	15;
	voice		= 0;
	id 			=	7600;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 5);
		
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 18, 1, GRD_ARMOR_H);
        
	Mdl_SetModelFatness(self,0);
    	
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 75);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7600;
};

FUNC VOID Rtn_start_7600 ()
{
	TA_Stand_ArmsCrossed	(07,25,20,00,"WP_JAEGERLAGER_12");
	TA_Stand_ArmsCrossed	(20,00,07,25,"WP_JAEGERLAGER_12");
};