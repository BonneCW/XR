instance Mod_1566_SLD_Soeldner_FM (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Soeldner;
	npctype 		=	NPCTYPE_fm_soeldner;
	guild 		=		GIL_mil;
	level 		=		7;

	
	voice 		=		5;
	id 			=		1566;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Psionic",94 ,  1, ITAR_SLD_L);
        
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	////Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_1566;
};

FUNC VOID Rtn_FMstart_1566 ()	//FM
{
	TA_Stand_Guarding (0,00,13,00,  "FM_80");
	TA_Stand_Guarding (13,00,00,00, "FM_80");
};


