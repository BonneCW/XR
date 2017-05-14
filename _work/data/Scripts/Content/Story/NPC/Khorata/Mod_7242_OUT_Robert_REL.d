instance Mod_7242_OUT_Robert_REL (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Robert";
	npctype 		=	NPCTYPE_MAIN;
	guild 		=		GIL_OUT;
	level 		=		7;

	
	voice		= 0;
	id 			=		7242;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Psionic",94 ,  1, ItAr_Nordmann);
        
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 

	//-------- Talente -------- 

	////Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_7242;
};

FUNC VOID Rtn_FMstart_7242 ()	//FM
{	
	TA_Stand_Drinking	(20,00,01,00,"REL_CITY_086");
	TA_Sleep			(01,00,05,00,"REL_CITY_125");
	TA_Sit_Chair		(05,00,06,00,"REL_CITY_125");
	
	TA_Smith_Fire	(06,00,06,10,"REL_CITY_088");
	TA_Smith_Anvil	(06,10,06,20,"REL_CITY_088");
	TA_Smith_Fire	(06,20,06,30,"REL_CITY_088");
	TA_Smith_Anvil	(06,30,06,40,"REL_CITY_088");
	TA_Smith_Cool	(06,40,06,50,"REL_CITY_088");
	TA_Smith_Anvil	(06,50,07,00,"REL_CITY_088");
	
	TA_Smith_Fire	(07,00,07,10,"REL_CITY_088");
	TA_Smith_Anvil	(07,10,07,20,"REL_CITY_088");
	TA_Smith_Fire	(07,20,07,30,"REL_CITY_088");
	TA_Smith_Anvil	(07,30,07,40,"REL_CITY_088");
	TA_Smith_Cool	(07,40,07,50,"REL_CITY_088");
	TA_Smith_Anvil	(07,50,08,00,"REL_CITY_088");
	
	TA_Smith_Fire	(08,00,08,10,"REL_CITY_088");
	TA_Smith_Anvil	(08,10,08,20,"REL_CITY_088");
	TA_Smith_Fire	(08,20,08,30,"REL_CITY_088");
	TA_Smith_Anvil	(08,30,08,40,"REL_CITY_088");
	TA_Smith_Cool	(08,40,08,50,"REL_CITY_088");
	TA_Smith_Anvil	(08,50,09,00,"REL_CITY_088");

	TA_Smith_Fire	(09,00,09,10,"REL_CITY_088");
	TA_Smith_Anvil	(09,10,09,20,"REL_CITY_088");
	TA_Smith_Fire	(09,20,09,30,"REL_CITY_088");
	TA_Smith_Anvil	(09,30,09,40,"REL_CITY_088");
	TA_Smith_Cool	(09,40,09,50,"REL_CITY_088");
	TA_Smith_Anvil	(09,50,10,00,"REL_CITY_088");

	TA_Smith_Fire	(10,00,10,10,"REL_CITY_088");
	TA_Smith_Anvil	(10,10,10,20,"REL_CITY_088");
	TA_Smith_Fire	(10,20,10,30,"REL_CITY_088");
	TA_Smith_Anvil	(10,30,10,40,"REL_CITY_088");
	TA_Smith_Cool	(10,40,10,50,"REL_CITY_088");
	TA_Smith_Anvil	(10,50,11,00,"REL_CITY_088");    
          
	TA_Smith_Fire	(11,00,11,10,"REL_CITY_088");
	TA_Smith_Anvil	(11,10,11,20,"REL_CITY_088");
	TA_Smith_Fire	(11,20,11,30,"REL_CITY_088");
	TA_Smith_Anvil	(11,30,11,40,"REL_CITY_088");
	TA_Smith_Cool	(11,40,11,50,"REL_CITY_088");
	TA_Smith_Anvil	(11,50,12,00,"REL_CITY_088");

	TA_Smith_Fire	(12,00,12,10,"REL_CITY_088");
	TA_Smith_Anvil	(12,10,12,20,"REL_CITY_088");
	TA_Smith_Fire	(12,20,12,30,"REL_CITY_088");
	TA_Smith_Anvil	(12,30,12,40,"REL_CITY_088");
	TA_Smith_Cool	(12,40,12,50,"REL_CITY_088");
	TA_Smith_Anvil	(12,50,13,00,"REL_CITY_088");
          
	TA_Smith_Fire	(13,00,13,10,"REL_CITY_088");
	TA_Smith_Anvil	(13,10,13,20,"REL_CITY_088");
	TA_Smith_Fire	(13,20,13,30,"REL_CITY_088");
	TA_Smith_Anvil	(13,30,13,40,"REL_CITY_088");
	TA_Smith_Cool	(13,40,13,50,"REL_CITY_088");
	TA_Smith_Anvil	(13,50,14,00,"REL_CITY_088");

	TA_Smith_Fire	(14,00,14,10,"REL_CITY_088");
	TA_Smith_Anvil	(14,10,14,20,"REL_CITY_088");
	TA_Smith_Fire	(14,20,14,30,"REL_CITY_088");
	TA_Smith_Anvil	(14,30,14,40,"REL_CITY_088");
	TA_Smith_Cool	(14,40,14,50,"REL_CITY_088");
	TA_Smith_Anvil	(14,50,15,00,"REL_CITY_088");

	TA_Smith_Fire	(15,00,15,10,"REL_CITY_088");
	TA_Smith_Anvil	(15,10,15,20,"REL_CITY_088");
	TA_Smith_Fire	(15,20,15,30,"REL_CITY_088");
	TA_Smith_Anvil	(15,30,15,40,"REL_CITY_088");
	TA_Smith_Cool	(15,40,15,50,"REL_CITY_088");
 	TA_Smith_Anvil	(15,50,16,00,"REL_CITY_088");

	TA_Smith_Fire	(16,00,16,10,"REL_CITY_088");
	TA_Smith_Anvil	(16,10,16,20,"REL_CITY_088");
	TA_Smith_Fire	(16,20,16,30,"REL_CITY_088");
	TA_Smith_Anvil	(16,30,16,40,"REL_CITY_088");
	TA_Smith_Cool	(16,40,16,50,"REL_CITY_088");
	TA_Smith_Anvil	(16,50,17,00,"REL_CITY_088");

	TA_Smith_Fire	(17,00,17,10,"REL_CITY_088");
	TA_Smith_Anvil	(17,10,17,20,"REL_CITY_088");
	TA_Smith_Fire	(17,20,17,30,"REL_CITY_088");
	TA_Smith_Anvil	(17,30,17,40,"REL_CITY_088");
	TA_Smith_Cool	(17,40,17,50,"REL_CITY_088");
	TA_Smith_Anvil	(17,50,18,00,"REL_CITY_088");

	TA_Smith_Fire	(18,00,18,10,"REL_CITY_088");
	TA_Smith_Anvil	(18,10,18,20,"REL_CITY_088");
	TA_Smith_Fire	(18,20,18,30,"REL_CITY_088");
	TA_Smith_Anvil	(18,30,18,40,"REL_CITY_088");
	TA_Smith_Cool	(18,40,18,50,"REL_CITY_088");
	TA_Smith_Anvil	(18,50,19,00,"REL_CITY_088");

	TA_Smith_Fire	(19,00,19,10,"REL_CITY_088");
	TA_Smith_Anvil	(19,10,19,20,"REL_CITY_088");
	TA_Smith_Fire	(19,20,19,30,"REL_CITY_088");
	TA_Smith_Anvil	(19,30,19,40,"REL_CITY_088");
	TA_Smith_Cool	(19,40,19,50,"REL_CITY_088");
	TA_Smith_Anvil	(19,50,20,00,"REL_CITY_088");
};


