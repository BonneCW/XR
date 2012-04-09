instance Mod_7697_STT_Mud_REL (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Mud";
	npctype =						npctype_main;
	guild =							GIL_OUT;      
	level =							0;
	
	
	voice =							3;
	id =							7697;
	flags = 2;


	//-------- abilities --------

	B_SetAttributesToChapter	(self, 2);
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				69hairmesh,	face-tex,	hair-tex,	skin	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Mud, BodyTex_N, VLK_ARMOR_L);	
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Senses --------                                    
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;// für DIREKTES ansprechen

	B_SetFightSkills	(self, 20);
	
	//-------- inventory --------                                    

	
	daily_routine = Rtn_start_7697;
};

FUNC VOID Rtn_Start_7697 ()
{
	TA_Stand_Eating		(23,00,06,00,"REL_SURFACE_222");
	TA_Stand_Eating		(06,00,23,00,"REL_SURFACE_222");
};