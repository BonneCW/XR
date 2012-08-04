instance Mod_7794_KDS_SchwarzerMagier_PAT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_SchwarzerMagier;
	npctype =						npctype_MAIN;
	guild =							GIL_OUT;  
	level =							5;
	flags	=	2;
	
	voice =							3;
	id =							7794;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Fighter", 73,  1, SCHWARZMAGIERROBE);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------    																
	B_SetFightSkills (self, 40); 															
	EquipItem	(self, ItMW_BeliarStab);                          
	
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_7794;
};

FUNC VOID Rtn_Start_7794 ()
{
	TA_Stand_Guarding	(21,00,04,00,"WP_PAT_FOKUS_01_04");
	TA_Stand_Guarding	(04,00,21,00,"WP_PAT_FOKUS_01_04");	
};

FUNC VOID Rtn_Follow_7794 ()
{
	TA_Follow_Player	(21,00,04,00,"WP_PAT_UNTERGRUND_20");
	TA_Follow_Player	(04,00,21,00,"WP_PAT_UNTERGRUND_20");	
};

FUNC VOID Rtn_Hoehle_7794 ()
{
	TA_RunToWP		(21,00,04,00,"WP_PAT_HOEHLE_10");
	TA_RunToWP		(04,00,21,00,"WP_PAT_HOEHLE_10");	
};

FUNC VOID Rtn_Tot_7794 ()
{
	TA_Stand_Guarding	(21,00,04,00,"TOT");
	TA_Stand_Guarding	(04,00,21,00,"TOT");	
};