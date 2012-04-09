instance Mod_7333_KDS_SchwarzerMagier_PAT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_SchwarzerMagier;
	npctype =						npctype_PAT_SchwarzerMagier;
	guild =							GIL_KDF;      
	level =							5;
	
	
	voice =							3;
	id =							7333;


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
	B_SetFightSkills (self, 35);    																		
	EquipItem	(self, ItMW_BeliarStab);                          
	
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7333;
};

FUNC VOID Rtn_start_7333 ()
{	
	TA_Stand_WP		(08,05,22,05,"WP_PAT_WEG_178");
	TA_Stand_WP		(22,05,08,05,"WP_PAT_WEG_178");
};

FUNC VOID Rtn_Follow_7333 ()
{	
	TA_Follow_Player		(08,05,22,05,"WP_PAT_WEG_53");
	TA_Follow_Player		(22,05,08,05,"WP_PAT_WEG_53");
};