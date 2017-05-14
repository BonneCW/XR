instance Mod_7721_OUT_Rank_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Rank";
	Npctype =				Npctype_Main;
	guild =							GIL_OUT;      
	level =							3;
	
	voice		= 0;
	id =							7721;

	//-------- abilities --------
	B_SetAttributesToChapter (self, 5);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Drax, BodyTex_N, ITAR_BDT_M_01);

	Mdl_SetModelFatness (self, 0);	
	
	EquipItem	(self, ItMw_Banditenschwert);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------                        																	
	B_SetFightSkills (self, 60); 
	
	
	//-------- inventory --------   
	                                 
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_Start_7721;

};

FUNC VOID Rtn_Start_7721 ()
{
	TA_Stand_ArmsCrossed (00,00,23,00,"MT_EREMIT_06");
	TA_Stand_ArmsCrossed (23,00,00,00,"MT_EREMIT_06");
};

FUNC VOID Rtn_Tot_7721()
{
	TA_RunToWP	(08,00,20,00,"TOT");
	TA_RunToWP	(20,00,08,00,"TOT");
};