instance Mod_1124_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Gardist";
	npctype		=	NPCTYPE_MT_GARDIST;
	guild 		=	GIL_OUT;
	level 		=	15;
	voice		= 0;
	id 			=	1124;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 4);
		
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 13,  1, GRD_ARMOR_M);
        
	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 60);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1124;
};

FUNC VOID Rtn_start_1124 ()
{
	TA_Sleep	(23,30,08,30,"OCC_MERCS_UPPER_RIGHT_ROOM_BED5");
	TA_Smalltalk	(08,30,23,30,"OCC_MERCS_ENTRANCE");	
};