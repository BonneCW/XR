instance Mod_1147_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NPCTYPE_mt_gardist;
	guild 		= 	GIL_OUT;
	level 		= 	15;
	voice		= 0;
	id 			= 	1147;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_FatBald", 10,  0, GRD_ARMOR_M);
        
    	Mdl_SetModelFatness(self,0);
    	
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 60);


	B_CreateAmbientInv	(self);		
			
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1147;
};

FUNC VOID Rtn_start_1147 ()
{
	TA_Stand_Guarding (18,00,19,00,"OCC_CELLAR_HALL");
	TA_Stand_Guarding (19,00,18,00,"OCC_CELLAR_HALL");
};