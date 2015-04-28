instance Mod_1106_EBR_Bartholo_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Bartholo";
	npctype 	= 	npctype_main;
   	guild 		=	GIL_OUT;      
	level 		=	70;
	voice 		=	12;
	id 			=	1106;
	flags = 2;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 65;
	attribute[ATR_DEXTERITY] 	= 60;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 388;
	attribute[ATR_HITPOINTS] 	= 388;
	B_SetAttributesToChapter (self, 4);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 11, 3, EBR_ARMOR_M);

	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", FACE_N_Bartholo, BodyTex_N, EBR_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	

	//-------- Talente --------  
																		
	B_SetFightSkills (self, 65); 
			
	//-------- inventory --------                                    
	EquipItem(self,Prankenhieb);
	

	//------------- ai -------------
	daily_routine	=	Rtn_PreStart_1106;
	fight_tactic	=	FAI_HUMAN_MASTER;
	senses			=	SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_PreStart_1106 ()
{
	TA_Stand_WP		(07,35,21,10,"OCC_BARONS_DOOR");
	TA_Stand_WP		(21,10,07,35,"OCC_BARONS_DOOR");
};

FUNC VOID Rtn_start_1106 ()
{
	TA_Sleep			(01,00,08,00,	"OCC_BARONS_UPSTAIRS_RIGHT_BACK_ROOM_RIGHT");
	TA_Stand_WP			(08,00,15,55,	"OCC_BARONS_RIGHT_ROOM_BACK");
	TA_Play_Lute			(15,55,22,00,	"OCC_BARONS_GREATHALL_RIGHT_BACK");
	TA_Stand_WP			(22,00,01,00,	"OCC_BARONS_GREATHALL_LEFT_BACK");
};

FUNC VOID Rtn_Burgfried_1106 ()
{
	TA_Stand_WP			(01,00,08,00,	"WP_MT_AL_BARTHOLO_ATTACK");
	TA_Stand_WP			(08,00,15,55,	"WP_MT_AL_BARTHOLO_ATTACK");
	TA_Stand_WP			(15,55,22,00,	"WP_MT_AL_BARTHOLO_ATTACK");
	TA_Stand_WP			(22,00,01,00,	"WP_MT_AL_BARTHOLO_ATTACK");
};

FUNC VOID Rtn_Smalltalk_1106 ()
{
	TA_Smalltalk_Plaudern		(07,40,21,05,"OCC_BARONS_GREATHALL_CENTER_FRONT");
	TA_Smalltalk_Plaudern		(21,05,07,40,"OCC_BARONS_GREATHALL_CENTER_FRONT");
};

FUNC VOID Rtn_Boss_1106 ()
{
	TA_Sit_Throne		(07,35,21,10,"OCC_BARONS_GREATHALL_THRONE");
	TA_Sit_Throne		(21,10,07,35,"OCC_BARONS_GREATHALL_THRONE");
};

FUNC VOID Rtn_FluchtInKerker_1106 ()
{
	TA_FleeToWP		(07,35,21,10,"WP_MT_OC_BARTHOLO_KERKER");
	TA_FleeToWP		(21,10,07,35,"WP_MT_OC_BARTHOLO_KERKER");
};
