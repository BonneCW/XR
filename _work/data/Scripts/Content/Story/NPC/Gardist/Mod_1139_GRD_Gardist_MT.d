instance Mod_1139_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_mt_gardist;
	guild 		=	GIL_OUT;
	level 		=	10;
	voice 		=	6;
	id 			=	1139;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 17, 1, GRD_ARMOR_L);
        
        Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 60);	
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1139;
};

FUNC VOID Rtn_start_1139 ()
{
	TA_Sleep		(01,35,07,45,"OCC_MERCS_UPPER_LEFT_ROOM_BED5");
	TA_Sit_Campfire		(07,45,11,00,"OCC_WELL_RIGHT_MOVEMENT2");
	TA_Roast_Scavenger 	(11,00,21,00,"OCC_WELL_RIGHT_MOVEMENT2");
	TA_Sit_Campfire		(21,00,01,35,"OCC_WELL_RIGHT_MOVEMENT2");
};