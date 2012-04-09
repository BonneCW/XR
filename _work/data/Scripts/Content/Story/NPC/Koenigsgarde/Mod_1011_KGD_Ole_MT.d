instance Mod_1011_KGD_Ole_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Ole";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_OUT;
	voice 		=	2;
	id 		=	1011;
		
	//-------- abilities --------

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	


	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 13,  1, SSLD_ARMOR);
        
	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 60); 
	B_SetAttributesToChapter (self, 4);
				
			
	//-------- inventory --------
	EquipItem	(self, ItMw_1h_Pal_Sword);


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1011;
};

FUNC VOID Rtn_start_1011 ()
{
	TA_Sleep	(23,00,08,00,"KG_006");
	TA_Stand_WP	(08,00,16,00,"MC_THRON_1");
	TA_Smalltalk	(16,00,20,00,"MC_FP_3"); // mit Melcador
	TA_Smalltalk	(20,00,21,00,"MC_02"); // mit Jerry
	TA_Stand_WP	(21,00,23,00,"MC_THRON_1");	
	
};
