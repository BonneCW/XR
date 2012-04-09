func void FixPlayerControllsTurnOnNpcAttackMoveBug () {
    const int jmp1adr = 7673973; //0x751875
    const int jmp2adr = 7673984; //0x751880
    
    const int newJumpTarget = 7674204; //0x75195C
    
    //sind wahrscheinlich auf der selben Seite, aber egal.
    //ein zusätzlicher Aufruf tut nicht weh
    MemoryProtectionOverride (jmp1adr, 4);
    MemoryProtectionOverride (jmp2adr, 4);
    
    MEM_WriteInt (jmp1adr, newJumpTarget - jmp1adr - 4);
    MEM_WriteInt (jmp2adr, newJumpTarget - jmp2adr - 4);
};