instance Mod_7225_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	NpcType_mt_gardist;
	guild 		=	GIL_STRF;
	level 		=	10;
	voice 		=	7;
	id 			=	7225;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 2, 0,"Hum_Head_FatBald", 3,  0, GRD_ARMOR_L);
        
	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);//### Palisadenwache		
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_prestart_7225;
};

FUNC VOID Rtn_Prestart_7225 ()
{
	TA_RunToWP (00,00,12,00,"OW_PATH_066");
	TA_RunToWP (12,00,00,00,"OW_PATH_066");
};

FUNC VOID Rtn_start_7225 ()
{
	TA_RunToWP (00,00,12,00,"OW_PATH_07_21");
	TA_RunToWP (12,00,00,00,"OW_PATH_07_21");
};

