instance Mod_1135_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_mt_gardist;
	guild 		=	GIL_OUT;
	level 		=	15;
	voice 		=	13;
	id 			=	1135;
	
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	
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
	B_SetFightSkills	(self, 66);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1135;
};

FUNC VOID Rtn_start_1135 ()
{
	TA_Stand_Guarding(06,00,23,00,"OCC_BARONS_UPSTAIRS_PROMENADE_RIGHT_GUARD");
	TA_Stand_Guarding(23,00,06,00,"OCC_BARONS_UPSTAIRS_PROMENADE_RIGHT_GUARD");
};