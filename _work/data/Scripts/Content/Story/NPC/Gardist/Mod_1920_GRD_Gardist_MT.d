instance Mod_1920_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_main;
	guild 		=	GIL_out;
	level 		=	15;
	voice		= 0;
	id 			=	1920;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 17,  1, GRD_ARMOR_H);
        
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1920;
};

FUNC VOID Rtn_start_1920 ()
{
	TA_Stand_Guarding(06,00,23,00,"WP_ZUFLUCHT_LAGER_06");
	TA_Stand_Guarding(23,00,06,00,"WP_ZUFLUCHT_LAGER_06");
};

FUNC VOID Rtn_Psicamp_1920 ()
{
	TA_Stand_Guarding(06,00,23,00,"PSI_TEMPLE_STAIRS_2");
	TA_Stand_Guarding(23,00,06,00,"PSI_TEMPLE_STAIRS_2");
};