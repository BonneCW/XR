instance Mod_1508_SLD_Soeldner_MT (Npc_Default)
{                
	//-------- primary data --------
	
	name 		=	NAME_Soeldner;
	npctype		= 	npctype_mt_soeldner;
	flags		=	NPC_FLAG_IMMORTAL;	// weil Windenwache !!! wird in Kapitel 4 gelöscht!
	guild 		=	GIL_mil;
	level 		=	20;
	voice 		=	6;
	id 			=	1508;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 19,  1, ITAR_SLD_M);
        
	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1508;
};

FUNC VOID Rtn_start_1508 ()
{
    TA_Stand_Guarding	(05,00,23,00,"NC_MAINGATE_VWHEEL");
    TA_Stand_Guarding	(23,00,05,00,"NC_MAINGATE_VWHEEL");	//SN 09.01.01: geändert, damit Tore rund um die Uhr offen sind
};




