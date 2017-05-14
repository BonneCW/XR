instance Mod_1171_STT_Balam_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Balam";
	npctype 	=		NPCTYPE_mt_schatten;
	guild 		=		GIL_out;
	level 		=		3;
	
	
	voice		= 0;
	id 			=		1171;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//							body mesh,				bdytex,	skin,	head mesh,			headtex,	teethtex,	ruestung
	Mdl_SetVisualBody 	(self,	"hum_body_Naked0", 	0, 		1,		"Hum_Head_Fighter", 15,			1,			ItAr_Barkeeper);
	
	Mdl_SetModelFatness(self,2);
    	
    	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 
	B_SetFightSkills	(self, 15);	
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1171;
};

FUNC VOID Rtn_start_1171 ()
{
	TA_Cook_Cauldron		(08,00,18,00,"OCC_BARONS_RIGHT_ROOM_FRONT");
	TA_Cook_Cauldron		(18,00,08,00,"OCC_KITCHEN");
};