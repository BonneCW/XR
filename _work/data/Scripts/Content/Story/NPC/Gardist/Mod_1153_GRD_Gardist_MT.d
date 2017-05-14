instance Mod_1153_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	npctype_mt_gardist;
	guild 		=	GIL_OUT;
	level 		=	20;
	voice		= 0;
	id 			=	1153;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Psionic", 2,  0, GRD_ARMOR_H);
        
	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 65);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1153;
};

FUNC VOID Rtn_start_1153 ()
{
	TA_Stand_Guarding	(06,00,21,00,"OCC_BARONS_LEFT_GUARD");
	TA_Stand_Guarding	(21,00,06,00,"OCC_BARONS_LEFT_GUARD");
};