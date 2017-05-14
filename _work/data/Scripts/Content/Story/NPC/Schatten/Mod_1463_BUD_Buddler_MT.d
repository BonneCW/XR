instance Mod_1463_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							3;
	
	
	voice		= 0;
	id =							1463;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,2,"Hum_Head_Psionic", 0,  2, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 10);

	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1463;
};

FUNC VOID Rtn_start_1463 ()
{
	TA_Sleep	(22,45,07,30,"OCR_HUT_29");
	TA_Sit_Bench	(07,30,11,00,"OCR_OUTSIDE_HUT_29");
	TA_Rake_FP	(11,00,17,00,"OCC_CENTER_4_TRAIN2");
	TA_Sit_Bench	(17,00,22,45,"OCR_OUTSIDE_HUT_29");
};