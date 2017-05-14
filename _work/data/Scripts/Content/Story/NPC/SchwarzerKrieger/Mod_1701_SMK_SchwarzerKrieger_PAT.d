instance Mod_1701_SMK_SchwarzerKrieger_PAT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_SchwarzerKrieger;
	npctype =						npctype_PAT_SchwarzerKrieger;
	guild =							GIL_KDF;      
	level =							5;
	
	
	voice		= 0;
	id =							1701;


	//-------- abilities --------
	
	B_SetAttributesToChapter	(self, 5);
	EquipItem	(self, ItMw_BeliarsRache);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Fighter", 73,  1, ITAR_SMK_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------    																
	B_SetFightSkills (self, 60);                                
	
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1701;
};

FUNC VOID Rtn_start_1701 ()
{
	TA_Sleep		(21,00,04,00,"WP_PAT_LAGER_05_03");
    TA_Sleep	    (04,00,21,00,"WP_PAT_LAGER_05_03");	
};

FUNC VOID Rtn_Patherion_1701 ()
{
	TA_Sleep		(21,00,04,00,"WP_PAT_WEG_154");
    TA_Sleep	    (04,00,21,00,"WP_PAT_WEG_154");	
};