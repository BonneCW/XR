instance Mod_1922_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_main;
	guild 		=	GIL_out;
	level 		=	10;
	voice 		=	4;
	id 			=	1922;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 19,  1, GRD_ARMOR_H);
        
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);		
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1922;
};

FUNC VOID Rtn_start_1922 ()
{
    TA_Smoke_Waterpipe	(08,00,20,00,"LOCATION_23_CAVE_1_IN");
    TA_Smoke_Waterpipe	(20,00,08,00,"LOCATION_23_CAVE_1_IN");
};

FUNC VOID Rtn_Psicamp_1922 ()
{
    TA_Smoke_Waterpipe	(08,00,20,00,"PSI_31_HUT_EX");
    TA_Smoke_Waterpipe	(20,00,08,00,"PSI_31_HUT_EX");
};