instance Mod_1895_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	NpcType_mt_gardist;
	guild 		=	GIL_out;
	level 		=	10;
	voice		= 0;
	id 			=	1895;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;
	B_SetAttributesToChapter (self, 2);
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 2, 0,"Hum_Head_FatBald", 3,  0, GRD_ARMOR_H);
        
	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;															
	EquipItem (self, ItMw_2h_Sld_Sword);																
	B_SetFightSkills (self, 65); 

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);//### Palisadenwache		
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1895;
};

FUNC VOID Rtn_start_1895 ()
{
	TA_Stand_Guarding (00,00,12,00,"OCC_MERCS_HALLWAY_FRONT");
	TA_Stand_Guarding (12,00,00,00,"OCC_MERCS_HALLWAY_FRONT");
};

