instance Mod_1629_VMG_Valdemar_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Valdemar";
	npctype =						npctype_main;
	guild =							GIL_out;      
	level =							2;
	
	
	voice		= 0;
	id =							1629;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_mage.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_naked0",3,1,"Hum_Head_Thief", 70, 1, ITAR_DRUIDEWALDMAGIER);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_master; 
	
	//-------- Talents --------    																
	B_SetAttributesToChapter (self, 6);                                

	
	//-------- inventory --------                                    

	


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1629;
	};

FUNC VOID Rtn_start_1629 ()
{
	TA_Study_WP (00,00,12,00,"WP_VK_VALDEMAR_STUDY");
	TA_Study_WP (12,00,24,00,"WP_VK_VALDEMAR_STUDY");
};