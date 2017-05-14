instance Mod_1910_SMK_SchwarzerKrieger_OM (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_schwarzerkrieger;
	npctype		=	NPCTYPE_om_schwarzerkrieger;
	guild 		=	GIL_kdf;
	level 		=	15;
	voice		= 0;
	id 			=	1910;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);
	EquipItem	(self, ItMw_BeliarsRache);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Fighter", 1,  1, itar_smk_l);

	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1910;
};

FUNC VOID Rtn_start_1910 ()
{
    TA_Stand_Guarding     	(00,00,08,00,"OM_CAVE1_16");	
    TA_Stand_Guarding		(08,00,24,00,"OM_CAVE1_16");	
    
};