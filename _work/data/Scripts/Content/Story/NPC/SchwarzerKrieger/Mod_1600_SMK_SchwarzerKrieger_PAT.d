instance Mod_1600_SMK_SchwarzerKrieger_PAT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_SchwarzerKrieger;
	npctype =						npctype_pat_schwarzerkrieger;
	guild =							GIL_kdf;      
	level =							4;
	
	
	voice		= 0;
	id =							1600;


	//-------- abilities --------
	
	B_SetAttributesToChapter	(self, 5);
	EquipItem	(self, ItMw_BeliarsRache);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Fighter", 73,  1, itar_smk_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_strong; 
	
	//-------- Talents  --------  																
	B_SetFightSkills (self, 60);                                
	
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1600;
};

FUNC VOID Rtn_start_1600 ()
{
	TA_Sit_Campfire  		(08,00,23,00,"WP_PAT_LAGER_05_06");
	TA_Sleep 			(23,00,08,00,"WP_PAT_LAGER_05_07");	
};

FUNC VOID Rtn_Patherion_1600 ()
{
	TA_Smalltalk  		(08,00,23,00,"WP_PAT_WEG_204");
	TA_Smalltalk 			(23,00,08,00,"WP_PAT_WEG_204");	
};