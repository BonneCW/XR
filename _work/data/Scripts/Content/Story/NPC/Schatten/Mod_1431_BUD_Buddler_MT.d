instance Mod_1431_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	
	voice		= 0;
	id =							1431;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_FatBald", 67,  1, VLK_ARMOR_M);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
			
	//-------- Talents --------                                    
	B_SetFightSkills	(self, 10);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1431;
};

FUNC VOID Rtn_start_1431 ()
{
	TA_Sleep		(22,00,08,00,"OCR_HUT_79");
	TA_Smalltalk	(08,00,22,00,"OCR_OUTSIDE_HUT_79");
};