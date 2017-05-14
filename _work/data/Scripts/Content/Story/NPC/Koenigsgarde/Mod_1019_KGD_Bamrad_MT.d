instance Mod_1019_KGD_Bamrad_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Bramrad";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_OUT;
	voice		= 0;
	id 			=	1019;
		
	//-------- abilities --------

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	


	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 13,  1, SSLD_ARMOR);
        
	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 60); 
	B_SetAttributesToChapter (self, 4);		
			
	//-------- inventory --------	
	EquipItem	(self, ItMw_ShortSword4);
	EquipItem	(self, ItRw_Bow_M_01);

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1019;
};

FUNC VOID Rtn_start_1019 ()
{
	TA_Sleep	(22,00,07,00,"KG_006");
	TA_Stand_WP	(07,00,10,00,"MC_WA_BOW_1");	
	TA_Smalltalk	(10,00,13,00,"MC_WA_BOW_1"); // mit Berdin
	TA_Sit_Campfire	(13,00,22,00,"MC_FP_2");
	
};
