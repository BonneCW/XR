instance Mod_1104_BAU_Homer_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Homer";
	npctype	 =						npctype_main;
	guild =							GIL_MIL;      
	level =							6;
	flags =							0;
	
	voice		= 0;
	id =							1104;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		11;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	112;
	attribute[ATR_HITPOINTS] =		112;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 5, 1,DEFAULT);
	
	Mdl_SetModelFatness(self,2);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);		
	
	
	//-------- inventory --------                                    

		
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_1104;
};

FUNC VOID Rtn_PreStart_1104 ()
{
	TA_Sit_Chair	(07,30,21,30,"NC_HUT13_OUT"); 
	TA_Sleep		(21,30,07,30,"NC_HUT13_IN");
};
