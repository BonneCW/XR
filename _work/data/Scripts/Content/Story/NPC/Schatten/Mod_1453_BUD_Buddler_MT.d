instance Mod_1453_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	
	
	voice		= 0;
	id =							1453;

	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Bald", 72,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
    	
    	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 10);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	
		
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1453;
};

FUNC VOID Rtn_start_1453 ()
{
	TA_Sleep		(23,15,07,00,"OCR_HUT_77");
	TA_Stand_Eating		(07,00,07,30,"OCR_OUTSIDE_HUT_77");
	TA_Wash_FP		(07,30,08,30,"OCR_LAKE_1");
	TA_Pick_FP  		(08,30,18,00,"OCC_OUTSIDE_KITCHEN");
	TA_Sit_Campfire		(18,00,23,00,"OCR_OUTSIDE_HUT_77");
};