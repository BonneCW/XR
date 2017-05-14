instance Mod_1473_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							4;
	
	
	voice		= 0;
	id =							1473;


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
	daily_routine = Rtn_start_1473;
};

FUNC VOID Rtn_start_1473 () //Kyle-Platz Koch
{
	TA_Sleep		(23,00,06,30,"OCR_HUT_70");
	TA_Smalltalk		(06,30,12,00,"OCR_OUTSIDE_HUT_68_BENCH");
	TA_Cook_Cauldron	(12,00,17,30,"OCR_OUTSIDE_HUT_68");
	TA_Sit_Campfire 	(17,30,23,00,"OCR_OUTSIDE_CAMPFIRE_D_3");
};