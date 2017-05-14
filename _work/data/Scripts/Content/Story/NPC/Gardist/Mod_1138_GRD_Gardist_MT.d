instance Mod_1138_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_mt_gardist;
	guild 		=	GIL_OUT;
	level 		=	10;
	voice		= 0;
	id 			=	1138;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Fighter", 16,  1, GRD_ARMOR_L);
        
       Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 60);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1138;
};

FUNC VOID Rtn_start_1138 ()
{
	TA_Sleep 	(00,25,07,25,"OCC_MERCS_UPPER_LEFT_ROOM_BED2");
	TA_Smalltalk	(07,25,21,25,"OCC_MAINGATE_TALK");
	TA_Smalltalk	(21,25,00,25,"OCC_SHADOWS_CORNER_MOVEMENT4");
};