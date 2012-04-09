instance Mod_1440_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	flags = 2;	
	voice =							3;
	id =							1440;


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
	B_SetFightSkills	(self, 15);

	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1440;
};

FUNC VOID Rtn_Start_1440 ()
{
	TA_Sleep	(22,30,08,15,"OCR_HUT_28");
	TA_Pick_FP	(08,15,22,30,"OCC_CONVOY_01");
};

FUNC VOID Rtn_Killed_1440 ()
{
	TA_Stand_WP		(22,30,08,15,"OCC_BARONS_GREATHALL_CENTER_FRONT");
	TA_Stand_WP	(08,15,22,30,"OCC_BARONS_GREATHALL_CENTER_FRONT");
};

FUNC VOID Rtn_Tot_1440 ()
{
	TA_Stand_WP		(22,30,08,15,"TOT");
	TA_Stand_WP	(08,15,22,30,"TOT");
};





