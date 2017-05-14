instance Mod_1907_SMK_SchwarzerKrieger_OM (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_schwarzerkrieger;
	npctype 	=	NPCTYPE_om_schwarzerkrieger;
	guild 		=	GIL_kdf;
	level 		=	15;
	voice		= 0;
	id 			=	1907;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);
	EquipItem	(self, ItMw_BeliarsRache);


	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Thief", 1,  2, itar_smk_l);
        
	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1907;
};

FUNC VOID Rtn_start_1907 ()
{
    TA_Stand_Guarding	(08,00,18,00,"OM_201");  
	TA_Stand_Guarding	(18,00,08,00,"OM_201");
};
