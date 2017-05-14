instance Mod_1594_SLD_Soeldner_FM (Npc_Default)
{                
	//-------- primary data --------
	
	name 		=	NAME_soeldner;
	guild 		=	GIL_mil;
	npctype		=	npctype_fm_soeldner;
	level 		=	20;
	voice		= 0;
	id 			=	1594;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 			animations
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald",19, 0, Itar_SLD_L);
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);		
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_1594;
};

FUNC VOID Rtn_FMstart_1594 ()	//FM
{
	TA_Stand_Guarding (0,00,13,00,  "FM_18");
	TA_Stand_Guarding (13,00,00,00, "FM_18");
};