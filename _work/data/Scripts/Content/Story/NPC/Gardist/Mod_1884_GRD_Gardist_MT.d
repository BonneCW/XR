instance Mod_1884_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_mt_gardistATBANDIT;
	guild 		=	GIL_out;
	level 		=	15;
	voice		= 0;
	id 			=	1884;
	
	//-------- abilities --------
	B_SetAttributesToChapter (self, 2);
	
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 17,  1, GRD_ARMOR_M);
        
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 													
	B_SetFightSkills (self, 55); 			
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1884;
};

FUNC VOID Rtn_start_1884 ()
{
	TA_Stand_Guarding(06,00,23,00,"OW_PATH_188");
	TA_Stand_Guarding(23,00,06,00,"OW_PATH_188");
};

FUNC VOID Rtn_Feuerregen_1884 ()
{
	TA_Stand_Guarding	(06,00,21,00,"LOCATION_11_08");
	TA_Stand_Guarding	(21,00,06,00,"LOCATION_11_08");	
};