instance Mod_1903_SMK_SchwarzerKrieger_OM (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_SchwarzerKrieger;
	npctype		= 	NPCTYPE_om_schwarzerkrieger;
	guild 		=	GIL_KDF;
	level 		=	10;
	voice		= 0;
	id 			=	1903;
		
	B_SetAttributesToChapter	(self, 5);
	EquipItem	(self, ItMw_BeliarsRache);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 12,  2, itar_smk_l);
        
       
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
			
	//-------- inventory --------
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1903;
};

FUNC VOID Rtn_start_1903 ()
{
	TA_Stand_Guarding		(20,00,07,00,"OM_CAVE3_30");
	TA_Stand_Guarding		(07,00,20,00,"OM_CAVE3_30");
};




