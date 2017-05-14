instance Mod_800_GRD_Stone_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Stone";
	npctype		= 	npctype_main;
	guild 		=	GIL_OUT;
	level 		=	15;
	voice		= 0;
	id 			=	800;
	flags       =   0;	
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 4);	
		
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Stone, BodyTex_N, ITAR_SMITH);	
	 
    		
    	fight_tactic	=	FAI_HUMAN_STRONG;

	B_SetFightSkills	(self, 50);

	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_800;
};

FUNC VOID Rtn_start_800 ()
{
	TA_Smith_Fire	(08,00,08,10,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(08,10,08,20,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Fire	(08,20,08,30,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(08,30,08,40,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Cool	(08,40,08,50,"OCC_STABLE_LEFT_FRONT");
        TA_Smith_Sharp	(08,50,08,55,"OCC_STABLE_LEFT_FRONT");
        TA_Sit_Bench	(08,55,09,00,"OCC_STABLE_LEFT_FRONT");

	TA_Smith_Fire	(09,00,09,10,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(09,10,09,20,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Fire	(09,20,09,30,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(09,30,09,40,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Cool	(09,40,09,50,"OCC_STABLE_LEFT_FRONT");
        TA_Smith_Sharp	(09,50,09,55,"OCC_STABLE_LEFT_FRONT");
        TA_Sit_Bench	(09,55,10,00,"OCC_STABLE_LEFT_FRONT");

	TA_Smith_Fire	(10,00,10,10,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(10,10,10,20,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Fire	(10,20,10,30,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(10,30,10,40,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Cool	(10,40,10,50,"OCC_STABLE_LEFT_FRONT");
        TA_Smith_Sharp	(10,50,10,55,"OCC_STABLE_LEFT_FRONT");
        TA_Sit_Bench	(10,55,11,00,"OCC_STABLE_LEFT_FRONT");
          
	TA_Smith_Fire	(11,00,11,10,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(11,10,11,20,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Fire	(11,20,11,30,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(11,30,11,40,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Cool	(11,40,11,50,"OCC_STABLE_LEFT_FRONT");
        TA_Smith_Sharp	(11,50,11,55,"OCC_STABLE_LEFT_FRONT");
        TA_Sit_Bench	(11,55,12,00,"OCC_STABLE_LEFT_FRONT");

	TA_Smith_Fire	(12,00,12,10,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(12,10,12,20,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Fire	(12,20,12,30,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(12,30,12,40,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Cool	(12,40,12,50,"OCC_STABLE_LEFT_FRONT");
        TA_Smith_Sharp	(12,50,12,55,"OCC_STABLE_LEFT_FRONT");
        TA_Sit_Bench	(12,55,13,00,"OCC_STABLE_LEFT_FRONT");
          
	TA_Smith_Fire	(13,00,13,10,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(13,10,13,20,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Fire	(13,20,13,30,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(13,30,13,40,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Cool	(13,40,13,50,"OCC_STABLE_LEFT_FRONT");
        TA_Smith_Sharp	(13,50,13,55,"OCC_STABLE_LEFT_FRONT");
        TA_Sit_Bench	(13,55,14,00,"OCC_STABLE_LEFT_FRONT");

	TA_Smith_Fire	(14,00,14,10,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(14,10,14,20,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Fire	(14,20,14,30,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(14,30,14,40,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Cool	(14,40,14,50,"OCC_STABLE_LEFT_FRONT");
        TA_Smith_Sharp	(14,50,14,55,"OCC_STABLE_LEFT_FRONT");
        TA_Sit_Bench	(14,55,15,00,"OCC_STABLE_LEFT_FRONT");

	TA_Smith_Fire	(15,00,15,10,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(15,10,15,20,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Fire	(15,20,15,30,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(15,30,15,40,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Cool	(15,40,15,50,"OCC_STABLE_LEFT_FRONT");
        TA_Smith_Sharp	(15,50,15,55,"OCC_STABLE_LEFT_FRONT");
        TA_Sit_Bench	(15,55,16,00,"OCC_STABLE_LEFT_FRONT");

	TA_Smith_Fire	(16,00,16,10,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(16,10,16,20,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Fire	(16,20,16,30,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(16,30,16,40,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Cool	(16,40,16,50,"OCC_STABLE_LEFT_FRONT");
        TA_Smith_Sharp	(16,50,16,55,"OCC_STABLE_LEFT_FRONT");
        TA_Sit_Bench	(16,55,17,00,"OCC_STABLE_LEFT_FRONT");

	TA_Smith_Fire	(17,00,17,10,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(17,10,17,20,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Fire	(17,20,17,30,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(17,30,17,40,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Cool	(17,40,17,50,"OCC_STABLE_LEFT_FRONT");
        TA_Smith_Sharp	(17,50,17,55,"OCC_STABLE_LEFT_FRONT");
        TA_Sit_Bench	(17,55,18,00,"OCC_STABLE_LEFT_FRONT");

	TA_Smith_Fire	(18,00,18,10,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(18,10,18,20,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Fire	(18,20,18,30,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(18,30,18,40,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Cool	(18,40,18,50,"OCC_STABLE_LEFT_FRONT");
        TA_Smith_Sharp	(18,50,18,55,"OCC_STABLE_LEFT_FRONT");
        TA_Sit_Bench	(18,55,19,00,"OCC_STABLE_LEFT_FRONT");

	TA_Smith_Fire	(19,00,19,10,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(19,10,19,20,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Fire	(19,20,19,30,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Anvil	(19,30,19,40,"OCC_STABLE_LEFT_FRONT");
	TA_Smith_Cool	(19,40,19,50,"OCC_STABLE_LEFT_FRONT");
        TA_Smith_Sharp	(19,50,19,55,"OCC_STABLE_LEFT_FRONT");
        TA_Sit_Bench	(19,55,20,05,"OCC_STABLE_LEFT_FRONT");
   
	TA_Smalltalk	(20,05,01,05,"OCC_STABLE_ENTRANCE_INSERT"); //mit Scorpio

	TA_Sleep		(01,05,08,00,"OCC_MERCS_LEFT_ROOM_BED3");
};