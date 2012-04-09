instance Mod_13037_SP_Seelenpeiniger_OM (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Seelenpeiniger";
	npctype		= 	npctype_main;
	guild 		=	GIL_DMT;
	level 		=	25;
	voice		=	5;
	id 			=	13037;
	flags       = NPC_FLAG_GHOST;
		
	//-------- abilities --------
	
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_HITPOINTS_MAX]= 600;
	attribute[ATR_HITPOINTS] 	= 600;

	protection[PROT_EDGE] = -1;
	protection[PROT_BLUNT] = -1;
	protection[PROT_POINT] = -1;
	protection[PROT_MAGIC] = -1;
	protection[PROT_FIRE] = -1;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_FatBald", 2,  1, ITAR_TARNUNG);
    	Mdl_SetModelFatness(self,0);
	effect	= "SPELLFX_DARKARMOR";
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;		
			
	//-------- inventory --------
	

	B_SetFightSkillS	(self, 20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_13037;
};

FUNC VOID Rtn_start_13037 ()
{
	TA_Stand_WP (06,00,20,00,"OM_132");
	TA_Stand_WP (20,00,06,00,"OM_132");
};