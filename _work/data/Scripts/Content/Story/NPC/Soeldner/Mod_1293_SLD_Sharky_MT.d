instance Mod_1293_SLD_Sharky_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =			"Sharky";
	Npctype =		NPCTYPE_MAIN;
	guild =			GIL_mil;      
	level =			8;
	
	voice =			10;
	id =			1293;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", FACE_B_Normal_Sharky, BodyTex_B, SLD_ARMOR_L);
	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;			
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
				
	
	//-------- inventory --------   
		
	
	
	
	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1293;
	};

FUNC VOID Rtn_start_1293 ()
{
	TA_Sleep		(03,00,08,00,"NC_HUT25_IN");
	TA_Sit_Bench		(08,00,00,00,"NC_HUT25_OUT");
	TA_Stand_Drinking	(00,00,03,00,"NC_TAVERN_BAR"); //trifft Cipher
};