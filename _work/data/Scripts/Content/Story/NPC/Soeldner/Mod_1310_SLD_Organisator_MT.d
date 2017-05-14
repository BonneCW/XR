instance Mod_1310_SLD_Organisator_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				Npctype_mt_soeldner;
	guild =					GIL_mil;      
	level =					8;

	
	voice		= 0;
	id =					1310;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Bald", 38,  1, SLD_ARMOR_L);
	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	
	//-------- inventory --------   
	                                 
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1310;
	};

FUNC VOID Rtn_start_1310 ()
{
	TA_Sleep		(00,05,08,05,"NC_HUT28_IN");
	TA_Smalltalk	(08,05,00,05,"NC_HUT28_OUT");
};











