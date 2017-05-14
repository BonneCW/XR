instance Mod_1166_STT_Schatten_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_mt_schatten;
	guild 		=		GIL_out;
	level 		=		7;

	
	voice		= 0;
	id 			=		1166;
		
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
	daily_routine = Rtn_start_1166;
};

FUNC VOID Rtn_start_1166 ()
{
	TA_Sleep	   	(23,00,07,00,"OCR_HUT_60");
	TA_Stand_Eating		(07,00,07,30,"OCR_OUTSIDE_HUT_60");
	TA_Cook_Cauldron	(07,30,15,00,"OCR_CAMPFIRE_F_1");
	TA_Sit_Campfire		(15,00,17,00,"OCR_CAMPFIRE_F_2");
	TA_Stand_Drinking	(17,25,23,00,"OCR_ARENA_03");	
};