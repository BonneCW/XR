instance Mod_1132_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	npctype_mt_gardist;
	guild 		=	GIL_OUT;
	level 		=	20;
	voice		= 0;
	id 			=	1132;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 15, 1, GRD_ARMOR_H);
        
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 60);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1132;
};

FUNC VOID Rtn_start_1132 ()
{
	TA_Stand_Guarding	(06,00,21,00,"OCC_BARONS_RIGHT_GUARD");
	TA_Stand_Guarding	(21,00,06,00,"OCC_BARONS_RIGHT_GUARD");	
};