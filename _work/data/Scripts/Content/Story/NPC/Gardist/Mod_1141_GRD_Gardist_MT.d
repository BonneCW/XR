instance Mod_1141_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_mt_gardist;
	guild 		=	GIL_out;
	level 		=	20;
	voice		=	13;
	id 			=	1141;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Psionic", 2,  0, GRD_ARMOR_H);
        
	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_Strong;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 65);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1141;
};

FUNC VOID Rtn_start_1141 ()//### unbeschäftigter Gardist!
{
	TA_Practice_Sword	(08,00,22,00,"OCC_RUIN_PRACTICE");
	TA_Sleep		(22,00,08,00,"OCC_MERCS_UPPER_RIGHT_ROOM_FRONT");
};

FUNC VOID Rtn_AtTurm_1141 ()//### unbeschäftigter Gardist!
{
	TA_Stand_ArmsCrossed(08,00,22,00,"MT10");
	TA_Stand_ArmsCrossed		(22,00,08,00,"MT10");
};