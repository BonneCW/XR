instance Mod_1437_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	
	
	voice		= 0;
	id =							1437;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,0,"Hum_Head_Thief", 16,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 10);
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1437;
};

FUNC VOID Rtn_start_1437 ()
{
	TA_Sleep		(22,30,07,15,"OCR_HUT_54");
	TA_Smoke_Joint 		(07,15,11,00,"OCR_OUTSIDE_HUT_54");
	TA_Smalltalk		(11,00,17,00,"OCR_OUTSIDE_HUT_53");
	TA_Stand_Eating 	(17,00,22,30,"OCR_OUTSIDE_HUT_54");
};