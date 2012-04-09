instance Mod_1705_SMK_SchwarzerKrieger_PAT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_SchwarzerKrieger;
	npctype =						npctype_pat_schwarzerkrieger;
	guild =							GIL_kdf;      
	level =							4;
	
	
	voice =							3;
	id =							1705;


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
	daily_routine = Rtn_start_1705;
};

FUNC VOID Rtn_start_1705 ()
{
	TA_Roast_Scavenger  		(08,00,23,00,"WP_PAT_LAGER_04_09");
	TA_Sleep 			(23,00,08,00,"WP_PAT_LAGER_04_02");	
};

FUNC VOID Rtn_Patherion_1705 ()
{
	TA_Roast_Scavenger  		(08,00,23,00,"WP_PAT_WEG_205");
	TA_Sleep 			(23,00,08,00,"WP_PAT_WEG_157");	
};