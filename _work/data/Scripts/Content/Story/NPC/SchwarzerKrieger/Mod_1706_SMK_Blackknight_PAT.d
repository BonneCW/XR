instance Mod_1706_SMK_Blackknight_PAT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_SchwarzerKrieger;
	npctype =						npctype_pat_schwarzerkrieger;
	guild =							GIL_kdf;      
	level =							5;
	
	
	voice =							2;
	id =							1706;


	//-------- abilities --------
	
	B_SetAttributesToChapter	(self, 5);
	EquipItem	(self, ItMw_BeliarsRache);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_FatBald", 74,  1, itar_smk_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_strong; 

	//-------- Talents  --------    																
	B_SetFightSkills (self, 60);
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1706;
	};

FUNC VOID Rtn_start_1706 ()
{
	TA_Sleep		(23,00,06,00,"WP_PAT_LAGER_04_02");
    TA_Sit_Campfire	    (06,00,23,00,"WP_PAT_LAGER_04_01");
};

FUNC VOID Rtn_Patherion_1706 ()
{
	TA_Sit_Campfire		(23,00,06,00,"WP_PAT_WEG_205");
    TA_Sit_Campfire	    (06,00,23,00,"WP_PAT_WEG_205");
};