instance Mod_7802_TPL_Templer_OM (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	Npctype =						NpcType_mt_templer;
	guild =							GIL_out;
	level =							17;
	flags =							0;
	
	voice		= 0;
	id =							7802;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 65 , 0, TPL_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_Zweihaender1);

	B_CreateAmbientInv	(self);

	CreateInvItems	(self, ItAt_CrawlerMandibles, 8);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7802;
};

FUNC VOID Rtn_start_7802 ()
{
	TA_Stand_Guarding	(00,00,22,00,"OM_033");
	TA_Stand_Guarding	(22,00,24,00,"OM_033");	
};