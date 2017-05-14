instance Mod_1295_SLD_Schlaeger_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =			Name_Schlaeger;
	Npctype =		NPCTYPE_MAIN;
	guild =			GIL_mil;       
	level =			4;
	
	voice		= 0;
	id =			1295;



	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_FatBald", 10, 2, SLD_ARMOR_L);
	
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
		
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
	
	Npc_SetTalentSkill (self, NPC_TALENT_SNEAK,	1);	
	
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1295;

};

FUNC VOID Rtn_start_1295 ()
{	
	TA_Stand_WP		(08,10,20,20,"NC_PATH69");
	TA_Sit_Campfire 	(20,20,08,10,"NC_PATH53"); 
};










