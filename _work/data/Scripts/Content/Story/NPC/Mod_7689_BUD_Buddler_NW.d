instance Mod_7689_BUD_Buddler_NW (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Buddler;
	npctype =						NPCTYPE_mt_buddler;
	guild =							GIL_out;      
	level =							2;

	voice =							2;
	id =							7689;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Thief", 74,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
    	
 	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    
	B_SetFightSkills	(self, 10);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7689;
};

FUNC VOID Rtn_start_7689 ()
{
	TA_Sit_Campfire		(08,00,18,00,"NW_TAVERNE_TROLLAREA_15");
	TA_Sit_Campfire		(18,00,08,00,"NW_TAVERNE_TROLLAREA_15");
};










