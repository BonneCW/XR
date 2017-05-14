instance Mod_1156_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_mt_gardist;
	guild 		=	GIL_out;
	level 		=	15;
	voice		= 0;
	id 			=	1156;
	flags = 2;
	
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13,  1, GRD_ARMOR_M);
        
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 
	B_SetFightSkills	(self, 60);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1156;	
};

FUNC VOID Rtn_start_1156 ()
{
	TA_Stand_Guarding (06,00,23,00,"OCC_BARONS_LEFT_ROOM_FRONT");	
	TA_Stand_Guarding (23,00,06,00,"OCC_BARONS_LEFT_ROOM_FRONT");	
};

FUNC VOID Rtn_Angriff_1156 ()
{
	TA_RunToWP (06,00,23,00,"OCC_BARONS_DANCE2");	
	TA_RunToWP (23,00,06,00,"OCC_BARONS_DANCE2");	
};