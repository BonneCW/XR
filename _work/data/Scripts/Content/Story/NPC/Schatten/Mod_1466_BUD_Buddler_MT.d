instance Mod_1466_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							3;
	
	
	voice		= 0;
	id =							1466;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Psionic", 67,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    
	B_SetFightSkills	(self, 10);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1466;
};

FUNC VOID Rtn_start_1466 ()
{
	TA_Sleep	(23,00,06,30,"OCR_HUT_16");
	TA_Pick_FP	(06,30,11,00,"OCC_CENTER_4_TRAIN2");
	TA_Wash_FP	(11,00,11,20,"OCR_TO_HUT_17");
	TA_Sit_Campfire	(11,20,23,00,"OCR_OUTSIDE_HUT_16");
};