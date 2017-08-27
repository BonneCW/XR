func void stopAllSounds() {
    MEM_InitAll();

    const int zsound_G1 =  9236044; //0x8CEE4C 
    const int zsound_G2 = 10072124; //0x99B03C
    const int zCSndSys_MSS__RemoveAllActiveSounds_G1 = 5112224; //0x4E01A0 
    const int zCSndSys_MSS__RemoveAllActiveSounds_G2 = 5167008; //0x4ED7A0

    var int zsoundPtr; zsoundPtr = MEMINT_SwitchG1G2(MEM_ReadInt(zsound_G1), MEM_ReadInt(zsound_G2));
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL__thiscall(_@(zsoundPtr), MEMINT_SwitchG1G2(zCSndSys_MSS__RemoveAllActiveSounds_G1,
                                                        zCSndSys_MSS__RemoveAllActiveSounds_G2));
        call = CALL_End();
    };
};
