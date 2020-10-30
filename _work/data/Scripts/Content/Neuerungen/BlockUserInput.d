/*
 * blockAllPlayerInput.d
 *
 * Block all player input with or without blocking the main menu as well.
 *
 * - Requires Ikarus, LeGo (HookEngine, >= 2.5.0), LeGo Cursor optional
 * - Compatible with Gothic 1 and Gothic 2
 * - Resetting with unblockAllPlayerInput() in Init_Global recommended to restore player input on loading/new game!
 *
 * Blocking the main menu is not recommended and should only be done in highly controlled cases!
 *
 *
 * Main functions to use:
 *  blockAllPlayerInput(int blockGameMenu) once to block all player input and keep it blocked.
 *  unblockAllPlayerInput()                once to unblock all again.
 *
 * Sub-functions (called from the functions above):
 *  blockInGameMenus(int on)
 *  blockMainMenu(int on)
 *  blockHotkeys(int on)
 *  blockControls(int on)
 *  blockMouse(int on)
 */


/*
 * Block all in-game menus (status screen, log screen, map)
 */
func void blockInGameMenus(var int on) {
    const int set = 0;
    if (set == on) {
        return;
    };

    const int oCGame__HandleEvent_G1 = 6680288; //0x65EEE0
    const int oCGame__HandleEvent_G2 = 7324016; //0x6FC170
    var int addr; addr = MEMINT_SwitchG1G2(oCGame__HandleEvent_G1, oCGame__HandleEvent_G2);

    if (on) {
        ReplaceEngineFuncF(addr, 1, Hook_ReturnFalse);
    } else {
        RemoveHookF(addr, 5, Hook_ReturnFalse);
        if (!IsHooked(addr)) {
            MEM_WriteInt(addr, MEMINT_SwitchG1G2(/*0xA164*/ 41316, /*0x8568FF6A*/ 2238250858));
        };
    };

    set = on;
};


/*
 * Block game menu (ESC key). This actually also disables the hot keys
 */
func void blockMainMenu(var int on) {
    const int set = 0;
    if (set == on) {
        return;
    };

    const int cGameManager__HandleEvent_G1 = 4363200; //0x4293C0
    const int cGameManager__HandleEvent_G2 = 4369744; //0x42AD50
    var int addr; addr = MEMINT_SwitchG1G2(cGameManager__HandleEvent_G1, cGameManager__HandleEvent_G2);

    if (on) {
        ReplaceEngineFuncF(addr, 1, Hook_ReturnFalse);
    } else {
        RemoveHookF(addr, 5, Hook_ReturnFalse);
        if (!IsHooked(addr)) {
            MEM_WriteInt(addr, MEMINT_SwitchG1G2(/*0xD98B5351*/ 3649786705, /*0xA164*/ 41316));
        };
    };

    set = on;
};


/*
 * Disable hot keys
 */
func void blockHotkeys(var int on) {
    const int set = 0;
    if (set == on) {
        return;
    };

    const int cGameManager__HandleEvent_quickload_G1 = 4363453; //0x4294BD
    const int cGameManager__HandleEvent_quicksave_G1 = 4363312; //0x429430
    const int oCGame__s_bUsePotionKeys_G2            = 9118156; //0x8B21CC
    const int oCGame__s_bUseQuickSave_G2             = 9118160; //0x8B21D0
    const int cGameManager__HandleEvent_F9keyJZ_G2   = 4369832; //0x42ADA8

    const int enabled_G2 = 0;

    if (on) {
        if (GOTHIC_BASE_VERSION == 1) {
            // Disable quick saving
            MemoryProtectionOverride(cGameManager__HandleEvent_quicksave_G1, 1);
            MEM_WriteByte(cGameManager__HandleEvent_quicksave_G1, /*EB short jmp*/ 235);

            // Disable quick loading
            MemoryProtectionOverride(cGameManager__HandleEvent_quickload_G1, 1);
            MEM_WriteByte(cGameManager__HandleEvent_quickload_G1, /*EB short jmp*/ 235);
        } else {
            // Back up if they were enabled beforehand
            enabled_G2 = enabled_G2 | (MEM_ReadInt(oCGame__s_bUsePotionKeys_G2) << 0);
            enabled_G2 = enabled_G2 | (MEM_ReadInt(oCGame__s_bUseQuickSave_G2)  << 1);

            // Disabled them
            MEM_WriteInt(oCGame__s_bUsePotionKeys_G2, 0);
            MEM_WriteInt(oCGame__s_bUseQuickSave_G2,  0);

            // Quick loading is always possible due to a logic mistake in the engine
            MemoryProtectionOverride(cGameManager__HandleEvent_F9keyJZ_G2, 4);
            MEM_WriteInt(cGameManager__HandleEvent_F9keyJZ_G2, 995); // jump beyond broken logic: 4370831-(4369830+6)
        };
    } else {
        if (GOTHIC_BASE_VERSION == 1) {
            MEM_WriteByte(cGameManager__HandleEvent_quicksave_G1, /*74 short jz*/ 116);
            MEM_WriteByte(cGameManager__HandleEvent_quickload_G1, /*74 short jz*/ 116);
        } else {
            // Re-enabled if they were enabled beforehand
            MEM_WriteInt(oCGame__s_bUsePotionKeys_G2, (enabled_G2 &  1));
            MEM_WriteInt(oCGame__s_bUseQuickSave_G2,  (enabled_G2 >> 1));

            // Re-instate original, broken logic
            MEM_WriteInt(cGameManager__HandleEvent_F9keyJZ_G2, 237); //ED 00 00 00
        };
    };

    set = on;
};


/*
 * Remove player control (essentially turns the hero AI into an NPC AI)
 */
func void blockControls(var int on) {
    const int set = 0;
    if (set == on) {
        return;
    };

    const int oCAIHuman__DoAI_player_G1 = 6381143; //0x615E57
    const int oCAIHuman__DoAI_player_G2 = 6930571; //0x69C08B
    const int oCNpc__CanDrawWeapon_G1   = 7647728; //0x74B1F0
    const int oCNpc__CanDrawWeapon_G2   = 6817216; //0x6805C0

    var int doAIplayerAddr; doAIplayerAddr = MEMINT_SwitchG1G2(oCAIHuman__DoAI_player_G1, oCAIHuman__DoAI_player_G2);
    var int canDrawWeaponAddr; canDrawWeaponAddr = MEMINT_SwitchG1G2(oCNpc__CanDrawWeapon_G1, oCNpc__CanDrawWeapon_G2);

    if (on) {
        // Detach player AI
        MemoryProtectionOverride(doAIplayerAddr, 5);
        MEM_WriteByte(doAIplayerAddr, MEMINT_SwitchG1G2(/*EB short jmp*/ 235, /*long jmp*/ ASMINT_OP_jmp));
        if (GOTHIC_BASE_VERSION == 2) {
            MEM_WriteInt(doAIplayerAddr+1, 432); // Jump to 0x69C240: 6931008-6930571-5
        };

        // Block combat keys (1-0)
        ReplaceEngineFuncF(canDrawWeaponAddr, 0, Hook_ReturnFalse);
    } else {
        // Restore player AI
        MEM_WriteByte(doAIplayerAddr, MEMINT_SwitchG1G2(/*75 jnz*/ 117, /*0F jne*/ 15));
        if (GOTHIC_BASE_VERSION == 2) {
            MEM_WriteInt(doAIplayerAddr+1, 110469); //0x01AF85
        };

        // Re-instate combat keys (1-0)
        RemoveHookF(canDrawWeaponAddr, 5, Hook_ReturnFalse);
        if (!IsHooked(canDrawWeaponAddr)) {
            MEM_WriteInt(canDrawWeaponAddr, /*0xE8F18B56*/ -386823338);
        };
    };

    set = on;
};


/*
 * Backup mouse enable state and then disable it (requires LeGo_Cursor)
 */
func void blockMouse(var int on) {
    Cursor_NoEngine = on;
};


/*
 * Block all player input with or without blocking the game menu (not recommended)
 */
func void blockAllPlayerInput(var int blockGameMenu) {
    MEM_SendToSpy(zERR_TYPE_WARN, "Blocking all player input");

    blockInGameMenus(1);
    blockHotkeys(1);
    blockControls(1);
    //blockMouse(1);

    if (blockGameMenu) {
        // Kenny Loggins was here in 1986
        blockMainMenu(1);
    };
};


/*
 * Re-enable all player input
 */
func void unblockAllPlayerInput() {
    MEM_SendToSpy(zERR_TYPE_WARN, "Unblocking all player input");

    blockInGameMenus(0);
    blockHotkeys(0);
    blockControls(0);
    //blockMouse(0);
    blockMainMenu(0);
};