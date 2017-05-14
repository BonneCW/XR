instance Mod_1909_SMK_SchwarzerKrieger_OM (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_schwarzerkrieger;
	npctype		= 	NPCTYPE_om_schwarzerkrieger;
	guild 		=	GIL_kdf;
	level 		=	10;
	voice		= 0;
	id 			=	1909;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);
	EquipItem	(self, ItMw_BeliarsRache);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 1,  2, itar_smk_L);
        
	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1909;
};

FUNC VOID Rtn_start_1909 ()
{
    TA_Stand_Guarding	(08,00,20,00,"OM_050");	
	TA_Stand_Guarding	(20,00,08,00,"OM_050");
};


