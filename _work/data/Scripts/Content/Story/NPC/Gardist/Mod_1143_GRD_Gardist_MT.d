instance Mod_1143_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_mt_gardist;
	guild 		=	GIL_OUT;
	level 		=	10;
	voice 		=	13;
	id 			=	1143;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 2,"Hum_Head_Thief", 4,  2, GRD_ARMOR_L);
	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 60);

	B_CreateAmbientInv	(self);		
			
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1143;
};

FUNC VOID Rtn_start_1143 ()
{
	TA_Sleep 	(01,40,07,50,"OCC_MERCS_UPPER_LEFT_ROOM_BED7");
	TA_Sit_Campfire	(07,50,01,40,"OCC_WELL_RIGHT_MOVEMENT3");
};