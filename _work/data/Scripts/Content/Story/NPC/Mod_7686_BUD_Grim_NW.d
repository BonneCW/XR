instance Mod_7686_BUD_Grim_NW (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Grim";
	npctype =						npctype_main;
	guild =							GIL_out;      
	level =							5;
	
	
	voice		= 0;
	id =							7686;


	//-------- abilities --------
	
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 72,  1, STT_ARMOR_M);

	Mdl_SetModelFatness (self, 0);
	
	
	fight_tactic	=	FAI_HUMAN_STRONG; 

	
	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 30);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_7686;
};

FUNC VOID Rtn_Start_7686 ()
{
	TA_Stand_Drinking		(08,00,18,00,"NW_TAVERNE_TROLLAREA_15");
	TA_Stand_Drinking		(18,00,08,00,"NW_TAVERNE_TROLLAREA_15");
};