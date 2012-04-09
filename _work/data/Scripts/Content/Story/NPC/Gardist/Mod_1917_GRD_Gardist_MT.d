instance Mod_1917_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_main;
	guild 		=	GIL_out;
	level 		=	10;
	voice 		=	13;
	id 			=	1917;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 1,  0, GRD_ARMOR_H);
        
	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);		
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1917;
};

FUNC VOID Rtn_start_1917 ()
{
    TA_Sit_Bench		(08,00,20,00,"LOCATION_02_04");
    TA_Sit_Bench            (20,00,08,00,"LOCATION_02_04");
};

FUNC VOID Rtn_Psicamp_1917 ()
{
    TA_Stand_Eating		(08,00,20,00,"PSI_32_HUT_EX");
    TA_Stand_Eating            (20,00,08,00,"PSI_32_HUT_EX");
};