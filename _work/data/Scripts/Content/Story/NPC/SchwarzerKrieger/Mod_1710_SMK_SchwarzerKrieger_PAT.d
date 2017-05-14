instance Mod_1710_SMK_SchwarzerKrieger_PAT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_SchwarzerKrieger;
	npctype =						npctype_PAT_SchwarzerKrieger;
	guild =							GIL_KDF;      
	level =							5;
	
	
	voice		= 0;
	id =							1710;


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
	daily_routine = Rtn_start_1710;
};

FUNC VOID Rtn_start_1710 ()
{
	TA_Sit_Campfire		(04,00,24,00,"WP_PAT_LAGER_04_07");
    TA_Sleep	    (24,00,04,00,"WP_PAT_LAGER_04_08");		
};

FUNC VOID Rtn_Patherion_1710 ()
{
	TA_Practice_Sword		(04,00,24,00,"WP_PAT_WEG_209");
    TA_Practice_Sword	    (24,00,04,00,"WP_PAT_WEG_209");		
};