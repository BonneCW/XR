instance Mod_7714_BUD_Viper_OM (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Viper";
	npctype =						npctype_MAIN;
	guild =							GIL_OUT;      
	level =							3;
	
	
	voice		= 0;
	id =							7714;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 73,  1, VLK_ARMOR_M);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents --------     																
	B_SetFightSkills (self, 100); 
	B_SetAttributesToChapter (self, 6);    
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7714;
};

FUNC VOID Rtn_start_7714 ()
{
	TA_Stand_WP	(00,00,12,00,"OM_084_QUEEN_05");
	TA_Stand_WP	(12,00,24,00,"OM_084_QUEEN_05");
};