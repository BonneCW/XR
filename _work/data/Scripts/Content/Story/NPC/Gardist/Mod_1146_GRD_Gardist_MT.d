instance Mod_1146_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype 	=	npctype_mt_gardist;
	guild 		=	GIL_OUT;
	level 		=	15;
	voice		= 0;
	id 			=	1146;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);


	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Thief", 14,  1, GRD_ARMOR_M);
        
    	Mdl_SetModelFatness(self,0);
    	

	//-------- Talente -------- 
	B_SetFightSkills	(self, 65);

	B_CreateAmbientInv	(self);		
			
	
	
	//-------------Daily Routine-------------
	daily_routine	=	Rtn_start_1146;
   	fight_tactic	=	FAI_HUMAN_STRONG;
};

FUNC VOID Rtn_start_1146 ()
{
	TA_Stand_Guarding	(00,00,06,00,"SPAWN_PATH_GUARD1");
	TA_Stand_Guarding	(06,00,24,00,"SPAWN_PATH_GUARD1");
};