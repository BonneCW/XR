instance Mod_1506_BUD_Jesse_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Jesse";
	npctype =						npctype_main;
	guild =							GIL_out;      
	level =							4;
	
	
	voice =							36;
	id =							564;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_FatBald", 71,  1,VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
    	
    	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	
	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 15);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);

	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_1506;
};

FUNC VOID Rtn_start_1506 ()
{
	TA_Sleep		(23,00,06,45,"FMC_HUT11_IN");
	TA_Pick_Ore 		(06,45,23,00,"FMC_ORE_09");
};

FUNC VOID Rtn_Abgemurkst_1506 ()
{
	TA_Sleep		(23,00,06,45,"WP_MT_JACKAL_BEFREIUNG");
	TA_Pick_Ore 		(06,45,23,00,"WP_MT_JACKAL_BEFREIUNG");
};