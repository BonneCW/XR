instance Mod_7605_STT_Schatten_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_mt_schatten;
	guild 		=		GIL_STRF;
	level 		=		7;

	
	voice		= 0;
	id 			=		7605;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     57,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic",108 ,  1, STT_ARMOR_M);
        
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	B_SetFightSkills	(self, 40);	
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7605;
};

FUNC VOID Rtn_start_7605 ()
{
	TA_Cook_Cauldron	(07,30,15,00,"WP_JAEGERLAGER_03");
	TA_Cook_Cauldron	(15,00,07,30,"WP_JAEGERLAGER_03");
};

FUNC VOID Rtn_Zuris_7605 ()
{
	TA_Stand_ArmsCrossed		(08,00,19,00,"NW_TAVERN_TO_FOREST_04");
	TA_Stand_ArmsCrossed		(19,00,08,00,"NW_TAVERN_TO_FOREST_04");
};