const int trade_Value_multiplier_ptr = 11211032; //0xAB1118

func void SetSellingValuePercent (var int percent) {
    //int to float:
    percent = divf (mkf (percent), mkf (100));
    MEM_WriteInt (trade_Value_multiplier_ptr, percent);
    
    /* This line does basically the following:
        MEM_InformationMan -> DlgTrade -> DlgInventoryNpc -> ValueMultiplier = percent; */
    MEM_WriteInt (MEM_ReadInt(MEM_InformationMan.DlgTrade + 248/*0xF8*/) + 268 /*0x10C*/, percent);
};