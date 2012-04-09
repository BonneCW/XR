instance Mod_1125_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Gardist";
	npctype		=	NPCTYPE_MT_GARDIST;
	guild 		=	GIL_OUT;
	level 		=	15;
	voice 		=	6;
	id 			=	1125;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 4);	
		
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 2,"Hum_Head_Thief", 3,  2, GRD_ARMOR_M);        
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 60);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1125;
};

FUNC VOID Rtn_start_1125 ()
{
	TA_Sleep 		(00,20,07,20,"OCC_MERCS_UPPER_LEFT_ROOM_BED1");
	TA_Smalltalk	(07,20,21,20,"OCC_GATE_INSIDE_SMALLTALK");
	TA_Smalltalk	(21,20,00,20,"OCC_SHADOWS_CORNER_MOVEMENT4");
};