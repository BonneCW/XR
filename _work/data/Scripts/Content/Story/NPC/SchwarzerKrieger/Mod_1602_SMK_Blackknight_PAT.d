instance Mod_1602_SMK_Blackknight_PAT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_schwarzerkrieger;
	npctype =						npctype_pat_schwarzerkrieger;
	guild =							GIL_kdf;      
	level =							5;
	
	
	voice =							1;
	id =							1602;


	//-------- abilities --------
	
	B_SetAttributesToChapter	(self, 5);
	EquipItem	(self, ItMw_BeliarsRache);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,0,"Hum_Head_Psionic", 16, 3, itar_smk_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_strong; 
	
	//-------- Talents  --------   																
	B_SetFightSkills (self, 70);                                
	
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1602;
	};

FUNC VOID Rtn_start_1602 ()
{
	TA_Sleep		(23,00,06,00,"WP_PAT_LAGER_05_07");
    TA_Stand_Guarding	    (06,00,23,00,"WP_PAT_WIESE_01");
};

FUNC VOID Rtn_Patherion_1602 ()
{
	TA_Smalltalk  		(08,00,23,00,"WP_PAT_WEG_204");
	TA_Smalltalk 			(23,00,08,00,"WP_PAT_WEG_204");	
};