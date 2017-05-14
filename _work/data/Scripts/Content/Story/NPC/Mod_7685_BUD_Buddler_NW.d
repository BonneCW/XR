instance Mod_7685_BUD_Buddler_NW (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Buddler;
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_out;      
	level =							2;

	voice		= 0;
	id =							7685;


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
	daily_routine = Rtn_prestart_7685;
};

FUNC VOID Rtn_prestart_7685 ()
{
	TA_Stand_Eating	(06,00,18,00,"NW_BIGMILL_FARM3_07");
	TA_Stand_Eating	(18,00,06,00,"NW_BIGMILL_FARM3_07");
};

FUNC VOID Rtn_start_7685 ()
{
	TA_Sit_Campfire	(06,00,18,00,"WP_FLUECHTLINGE");
	TA_Sit_Campfire	(18,00,06,00,"WP_FLUECHTLINGE");
};










