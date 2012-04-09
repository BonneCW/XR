instance Mod_1446_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Buddler;
	npctype =						NPCTYPE_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	
	
	voice =							1;
	id =							1446;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony", 0,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
    	
    	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents --------                                    
	B_SetFightSkills	(self, 10);

	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1446;
};

FUNC VOID Rtn_start_1446 () //Marktplatz Bank
{
	TA_Sleep	(23,30,07,00,"OCR_HUT_46");
	TA_Smalltalk	(07,00,11,00,"OCR_OUTSIDE_HUT_47_SMALT2");
	TA_Sit_Bench	(11,00,13,00,"OCR_OUTSIDE_MCAMP_01");
	TA_Smalltalk	(13,00,16,00,"OCR_OUTSIDE_HUT_47_SMALT2");
	TA_Sit_Bench	(16,00,23,30,"OCR_OUTSIDE_MCAMP_01");
};