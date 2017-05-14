instance Mod_7332_SMK_SchwarzerKrieger_PAT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_SchwarzerKrieger;
	npctype =						npctype_PAT_SchwarzerKrieger;
	guild =							GIL_KDF;      
	level =							5;
	
	
	voice		= 0;
	id =							7332;


	//-------- abilities --------

	B_SetAttributesToChapter	(self, 5);
	EquipItem	(self, ItMw_BeliarsRache);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Psionic", 67,  1, ITAR_SMK_l);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------    																
	B_SetFightSkills (self, 60);

	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7332;
};

FUNC VOID Rtn_start_7332 ()
{	
	TA_Stand_WP		(08,05,22,05,"WP_PAT_WEG_178");
	TA_Stand_WP		(22,05,08,05,"WP_PAT_WEG_178");
};

FUNC VOID Rtn_Follow_7332 ()
{	
	TA_Follow_Player		(08,05,22,05,"WP_PAT_WEG_53");
	TA_Follow_Player		(22,05,08,05,"WP_PAT_WEG_53");
};