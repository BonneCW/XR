instance Mod_1930_GRD_Gardist_NW (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_nw_gardist;
	guild 		=	GIL_OUT;
	level 		=	10;
	voice 		=	7;
	id 			=	1930;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 3);				
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
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);		
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1930;
};

FUNC VOID Rtn_start_1930 ()
{
	TA_Stand_Guarding	(06,00,21,00,"NW_CITY_HABOUR_KASERN_01"); 
	TA_Stand_Guarding	(21,00,06,00,"NW_CITY_HABOUR_KASERN_01"); 
};




