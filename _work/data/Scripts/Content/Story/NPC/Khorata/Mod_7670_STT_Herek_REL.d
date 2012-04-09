instance Mod_7670_STT_Herek_REL (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Herek";
	npctype =						npctype_main;
	guild =							GIL_OUT;      
	level =							2;	
	voice =							1;
	id =							7670;

	//-------- abilities --------
	
	B_SetAttributesToChapter	(self, 2);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				70hairmesh,	face-tex,	hair-tex,	skin	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Weak_Herek, BodyTex_N, VLK_ARMOR_M);	
	
		fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 25);

	B_CreateAmbientInv	(self);
		
	//-------- inventory --------                                    
	CreateInvItems	(self, ItMi_Gold, 60);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7670;
};

FUNC VOID Rtn_start_7670 ()
{
	TA_Sit_Chair		(22,00,07,00,"REL_MOOR_144");
	TA_Sit_Chair   		(07,00,22,00,"REL_MOOR_144");  
};

FUNC VOID Rtn_AtZombie_7670 ()
{
	TA_Rake_FP		(22,00,07,00,"REL_MOOR_210");
	TA_Rake_FP   		(07,00,22,00,"REL_MOOR_210");  
};

FUNC VOID Rtn_Tot_7670 ()
{
	TA_FleeToWP		(22,00,07,00,"TOT");
	TA_FleeToWP		(07,00,22,00,"TOT");
};