instance Mod_7801_TPL_GorNaBar_OM (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Bar";
	Npctype =						NpcType_MAIN;
	guild =							GIL_out;
	level =							17;
	
	voice		= 0;
	id =							7801;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		130;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	244;
	attribute[ATR_HITPOINTS] =		244;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 2,"Hum_Head_FatBald", 16 , 1, TPL_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	senses 			=	SENSE_SEE|SENSE_HEAR|SENSE_SMELL;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);

	B_CreateAmbientInv	(self);

	CreateInvItems	(self, ItMi_ZeichenDerBruderschaft, 1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_Zweihaender1);
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7801;
};

FUNC VOID Rtn_start_7801 ()
{
    TA_Guard_Passage	(06,00,18,00,"OM_032");	
    TA_Guard_Passage	(18,00,06,00,"OM_032");	
};