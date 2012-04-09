instance Mod_1931_DJG_Lost_MT (Npc_Default)
{
     // ----- NSC -----
     name        = "Lost";
     guild       = GIL_MIL;
     id          = 1931;
     voice       = 7;
     flags       = 0;
     npctype     = NPCTYPE_MAIN;

     // ----- Attribue -----
     B_SetAttributesToChapter  (self, 5);

     // ----- Kampf-Taktik -----
     fight_tactic       = FAI_HUMAN_MASTER;     // MASTER / STRONG / COWARD

     // ----- Equippte Waffen -----
     EquipItem               (self, ItMw_Drachenaxt);

     // ----- Inventory -----
     B_CreateAmbientInv        (self);   

     // ----- visuals-----
     B_SetNpcVisual          (self, Male, "Hum_Head_Pony", Face_N_Normal16, BodyTex_N,ITAR_DJG_H);
     Mdl_SetModelFatness     (self, 1);
     Mdl_ApplyOverlayMds     (self,  "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance /Relaxed

     // ----- Nsc-relevante Talente vergeben -----
     B_GiveNpcTalents (self);

     // ----- Kampf-Talente -----
     B_SetFightSkills (self, 75);

     // ----- TA anmelden -----
     daily_routine        = Rtn_Start_1931;
}; 

FUNC VOID Rtn_Start_1931()
{
        TA_Stand_ArmsCrossed             (07,00,12,00, "HAUS1");
        TA_Stand_Eating                  (12,00,12,30, "HAUS2");
        TA_Practice_Sword                (12,30,20,00, "WIESE1");
        TA_Sleep                         (20,00,7,00,  "BETT1");
}; 