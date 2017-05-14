instance Mod_1774_KDF_Orakel_PAT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Orakel";
	npctype		=	NPCTYPE_MAIN;
	flags       = NPC_FLAG_GHOST|NPC_FLAG_IMMORTAL;	
	guild 		=	GIL_VLK;
	level 		=	36;
	voice		= 0;
	id 			=	1774;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 142;
	attribute[ATR_DEXTERITY] 	= 98;
	attribute[ATR_MANA_MAX] 	= 120;
	attribute[ATR_MANA] 		= 120;
	attribute[ATR_HITPOINTS_MAX]= 845;
	attribute[ATR_HITPOINTS] 	= 845;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	


	
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 13,  1, ITAR_KDF_VeryHigh);
        
	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 60); 
	B_SetAttributesToChapter (self, 4);		
			
	//-------- inventory --------
	
	//EquipItem	(self, ItRw_Bow_M_01);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1774;
};

FUNC VOID Rtn_start_1774 ()
{
	TA_Stand_ArmsCrossed	(00,00,08,30,"WP_PAT_WEG_185");
	TA_Stand_ArmsCrossed	(08,30,15,00,"WP_PAT_WEG_185");	
	
};
