instance Mod_1432_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	
	
	voice =							4;
	id =							1432;

	//-------- abilities --------              
        B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony", 68,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
    	
    	
	fight_tactic	=	FAI_HUMAN_COWARD;               
                                                  
	//-------- Talents --------               
        B_SetFightSkills	(self, 12);
	                                                            
	//-------- inventory --------             
        B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1432;
};

FUNC VOID Rtn_start_1432 ()
{
	TA_Sleep		(22,00,07,00,"OCR_HUT_10");
	TA_Cook_Cauldron	(07,00,17,00,"OCR_COOK_AT_HUT_10");
	TA_Play_Lute		(17,00,22,00,"OCR_OUTSIDE_HUT_10");
};