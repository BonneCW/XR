instance Mod_7433_JG_Zelar_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Zelar";
	npctype =						npctype_main;
	guild =							GIL_out;      	
	voice =							3;
	id =							7433;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_naked0",3,1,"Hum_Head_Thief", 70, 1, ITAR_Waldlaeufer_01);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents --------    																
	B_SetAttributesToChapter (self, 4);                                

	
	//-------- inventory --------  
	EquipItem (self, ItRw_Bow_L_03);                             

	


	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_7433;
};

FUNC VOID Rtn_Start_7433 ()
{
	TA_Stand_Eating		(00,00,12,00,"WP_MT_JAEGERLAGER_01");
	TA_Stand_Drinking	(12,00,24,00,"WP_MT_JAEGERLAGER_01");
};

FUNC VOID Rtn_Mine_7433()
{	
	TA_Follow_Player		(06,05,20,15,"WP_MT_JAEGERLAGER_01");
	TA_Follow_Player		(20,15,06,05,"WP_MT_JAEGERLAGER_01"); 
};

FUNC VOID Rtn_KapThree_7433 ()
{
	TA_Stand_Eating		(00,00,12,00,"WP_MT_JAEGERLAGER_01");
	TA_Stand_Drinking	(12,00,16,00,"WP_MT_JAEGERLAGER_01");
	TA_Smalltalk_Waldis1	(16,00,20,00,"WP_MT_JAEGERLAGER_04");
	TA_Stand_Drinking	(20,00,24,00,"WP_MT_JAEGERLAGER_01");
};

FUNC VOID Rtn_Irrlichter_7433()
{	
	TA_Guide_Player		(06,05,20,15,"ALTERWALD_20");
	TA_Guide_Player		(20,15,06,05,"ALTERWALD_20"); 
};