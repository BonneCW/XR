instance Mod_7688_STT_Schatten_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_mt_schatten;
	guild 		=		GIL_out;
	level 		=		7;

	
	voice		= 0;
	id 			=		7688;
		
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
	daily_routine = Rtn_start_7688;
};

FUNC VOID Rtn_start_7688 ()
{
	TA_Sit_Campfire		(08,00,18,00,"NW_TAVERNE_TROLLAREA_15");
	TA_Sit_Campfire		(18,00,08,00,"NW_TAVERNE_TROLLAREA_15");	
};