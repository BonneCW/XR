instance Mod_1109_GRD_Scorpio_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Scorpio";
	npctype		=	npctype_main;
	guild 		=	GIL_OUT;
	level 		=	15;
	voice 		=	13;
	id 			=	1109;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 5);
		
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 18, 1, GRD_ARMOR_M);
        
	Mdl_SetModelFatness(self,0);
    	
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 75);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1109;
};

FUNC VOID Rtn_start_1109 ()
{
	TA_Stand_ArmsCrossed	(07,25,20,00,"OCC_CENTER_4");
	TA_Smalltalk		(20,00,01,00,"OCC_STABLE_ENTRANCE_INSERT"); //mit Stone
	TA_Sleep		(20,00,07,25,"OCC_MERCS_UPPER_RIGHT_ROOM_BED4");
};