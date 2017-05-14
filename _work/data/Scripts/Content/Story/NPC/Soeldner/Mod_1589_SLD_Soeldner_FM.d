instance Mod_1589_SLD_Soeldner_FM (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_soeldner;
	npctype		= 	npctype_fm_soeldner;
	guild 		=	GIL_mil;
	level 		=	30;
	voice		= 0;
	id 			=	1589;
	
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 			animations
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", 1, 0, Itar_SLD_M);
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_1589;
};

FUNC VOID Rtn_FMstart_1589 ()	//FM
{
	TA_Stand_Guarding (0,00,13,00,  "FM_81");
	TA_Stand_Guarding (13,00,00,00, "FM_81");
};