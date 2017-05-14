instance Mod_1145_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	name 		= 	NAME_Gardist;
	npctype		= 	npctype_mt_gardist;
	guild 		=	GIL_OUT;
	level 		=	20;
	voice		= 0;
	id 			=	1145;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Thief", 1,  3, GRD_ARMOR_H);
        
 	Mdl_SetModelFatness(self,0);
    	

	//-------- Talente -------- 
	B_SetFightSkills	(self, 60);


	B_CreateAmbientInv	(self);		
			
	
	//------------- ai -------------
	daily_routine	=	Rtn_start_1145;
   	fight_tactic	=	FAI_HUMAN_STRONG;
};

FUNC VOID Rtn_start_1145 ()
{
	TA_Stand_Guarding	(00,00,06,00,"SPAWN_PATH_GUARD1");
	TA_Stand_Guarding	(06,00,24,00,"SPAWN_PATH_GUARD1");
};

FUNC VOID Rtn_GotoBergkastell_1145 ()
{
	TA_Follow_Player	(00,00,06,00,"CASTLE_MOVEMENT_STRAIGHT");
	TA_Follow_Player	(06,00,24,00,"CASTLE_MOVEMENT_STRAIGHT");
};

FUNC VOID Rtn_Flucht_1145 ()
{
	TA_FleeToWP	(00,00,06,00,"SPAWN_PATH_GUARD1");
	TA_FleeToWP	(06,00,24,00,"SPAWN_PATH_GUARD1");
};