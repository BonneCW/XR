instance Mod_1454_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	
	
	voice		= 0;
	id =							1454;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald", 68, 1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 10);

	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1454;
};

FUNC VOID Rtn_start_1454 ()
{
	TA_Sleep		(21,00,06,00,"OCR_HUT_74");
	TA_Smalltalk		(07,30,12,00,"OCR_OUTSIDE_HUT_74");
	TA_Pick_FP		(12,00,20,00,"OCC_LADDER_TOP");
	TA_Sit_Bench		(20,00,21,00,"OCR_OUTSIDE_HUT_74");
};