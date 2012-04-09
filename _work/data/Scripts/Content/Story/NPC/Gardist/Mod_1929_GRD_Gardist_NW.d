instance Mod_1929_GRD_Gardist_NW (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_nw_gardist;
	guild 		=	GIL_out;
	level 		=	15;
	voice 		=	13;
	id 			=	1929;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13,  1, GRD_ARMOR_H);
        
    	Mdl_SetModelFatness(self,0);
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1929;
};

FUNC VOID Rtn_start_1929 ()
{
	TA_Stand_Guarding(06,00,23,00,"NW_CITY_HABOUR_KASERN_01");	
	TA_Stand_Guarding(23,00,06,00,"NW_CITY_HABOUR_KASERN_01");	
};