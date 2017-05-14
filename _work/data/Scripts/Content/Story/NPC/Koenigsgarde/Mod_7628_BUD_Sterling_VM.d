instance Mod_7628_BUD_Sterling_VM (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Sterling";
	npctype =						npctype_MAIN;
	guild =							GIL_out;      
	level =							2;
	
	
	voice		= 0;
	id =							7628;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 2);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_FatBald", 0,  2, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 15);

	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7628;
};

FUNC VOID Rtn_start_7628 ()
{
	TA_Pick_Ore	(08,00,23,00,"MINE_GO_14");
	TA_Pick_Ore	(23,00,08,00,"MINE_GO_14");
};