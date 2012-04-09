instance Mod_1885_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	NpcType_mt_gardistATBANDIT;
	guild 		=	GIL_out;
	level 		=	10;
	voice 		=	7;
	id 			=	1885;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 2);
	
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 2, 0,"Hum_Head_FatBald", 3,  0, GRD_ARMOR_L);
        
	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 													
	B_SetFightSkills (self, 55); 	
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1885;
};

FUNC VOID Rtn_start_1885 ()
{
	TA_Stand_Guarding (00,00,12,00,"OW_PATH_188");
	TA_Stand_Guarding (12,00,00,00,"OW_PATH_188");
};

FUNC VOID Rtn_Feuerregen_1885 ()
{
	TA_Stand_Guarding	(06,00,21,00,"LOCATION_11_08");
	TA_Stand_Guarding	(21,00,06,00,"LOCATION_11_08");	
};

