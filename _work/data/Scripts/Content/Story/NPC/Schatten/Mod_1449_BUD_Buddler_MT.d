instance Mod_1449_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	
	
	voice		= 0;
	id =							1449;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 67,  1, VLK_ARMOR_L);
        
        Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
  	//-------- Talents --------                                    
	B_SetFightSkills	(self, 10);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1449;
};

FUNC VOID Rtn_start_1449 () //Marktplatz Playtune
{
	TA_Sleep	(22,30,07,00,"OCR_HUT_45");
	TA_Smalltalk	(07,00,11,00,"OCR_OUTSIDE_HUT_47_SMALT2");
	TA_Smoke_Joint 	(11,00,13,00,"OCR_OUTSIDE_HUT_45");
	TA_Smalltalk	(13,00,16,00,"OCR_OUTSIDE_HUT_47_SMALT2");
	TA_Play_Lute	(16,00,22,30,"OCR_OUTSIDE_HUT_48");
};