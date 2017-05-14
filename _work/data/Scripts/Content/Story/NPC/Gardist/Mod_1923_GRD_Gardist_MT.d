instance Mod_1923_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_main;
	guild 		=	GIL_out;
	level 		=	10;
	voice		= 0;
	id 			=	1923;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 1,  0, GRD_ARMOR_H);
        
	Mdl_SetModelFatness(self,0);
    	
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);

    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);		
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1923;
};

FUNC VOID Rtn_start_1923 ()
{
    TA_Stand_ArmsCrossed	(08,00,20,00,"OW_PATH_093");
    TA_Stand_ArmsCrossed	(20,00,08,00,"OW_PATH_093");
};

FUNC VOID Rtn_Psicamp_1923 ()
{
    TA_Practice_Sword	(08,00,20,00,"PSI_PATH_6_7");
    TA_Practice_Sword	(20,00,08,00,"PSI_PATH_6_7");
};