FUNC INT IsVobAtOrigin(var int vobPtr) {
	var int epsilon;
	epsilon = divf(mkf(1), mkf(1000));
	
	var zCVob vob; vob = _^(vobPtr);
	MEM_AssignInst(vob, vobPtr);

	var int x; x = absf(vob.trafoObjToWorld[3]);
	var int y; y = absf(vob.trafoObjToWorld[7]);
	var int z; z = absf(vob.trafoObjToWorld[11]);
	
	return x < epsilon && y < epsilon && z < epsilon;
};

FUNC VOID RemoveWrongEffects() {
	// Gothic 1 addresses and offsets
    const int zCVob__classDef_G1                =  9269976; //0x8D72D8
    const int zCWorld__SearchVobListByClass_G1  =  6249792; //0x5F5D40
    const int oCVisualFX__classDef_G1           =  8822272; //0x869E00
    const int oCVisualFX__Stop_G1               =  4766512; //0x48BB30
    const int oCVisualFX_originVob_offset_G1    =     1112; //0x0458
    const int oCVisualFX_targetVob_offset_G1    =     1120; //0x0460
    const int oCVisualFX_instanceName_offset_G1 =     1140; //0x0474

    // Gothic 2 addresses and offsets
    const int zCVob__classDef_G2                = 10106072; //0x9A34D8
    const int zCWorld__SearchVobListByClass_G2  =  6439504; //0x624250
    const int oCVisualFX__classDef_G2           =  9234008; //0x8CE658
    const int oCVisualFX__Stop_G2               =  4799456; //0x493BE0
    const int oCVisualFX_originVob_offset_G2    =     1192; //0x04A8
    const int oCVisualFX_targetVob_offset_G2    =     1200; //0x04B0
    const int oCVisualFX_instanceName_offset_G2 =     1220; //0x04C4

    var int zCVob__classDef;
    var int zCWorld__SearchVobListByClass;
    var int oCVisualFX__classDef;
    var int oCVisualFX__Stop;
    var int oCVisualFX_originVob_offset;
    var int oCVisualFX_targetVob_offset;
    var int oCVisualFX_instanceName_offset;
    zCVob__classDef                = MEMINT_SwitchG1G2(zCVob__classDef_G1,
                                                       zCVob__classDef_G2);
    zCWorld__SearchVobListByClass  = MEMINT_SwitchG1G2(zCWorld__SearchVobListByClass_G1,
                                                       zCWorld__SearchVobListByClass_G2);
    oCVisualFX__classDef           = MEMINT_SwitchG1G2(oCVisualFX__classDef_G1,
                                                       oCVisualFX__classDef_G2);
    oCVisualFX__Stop               = MEMINT_SwitchG1G2(oCVisualFX__Stop_G1,
                                                       oCVisualFX__Stop_G2);
    oCVisualFX_originVob_offset    = MEMINT_SwitchG1G2(oCVisualFX_originVob_offset_G1,
                                                       oCVisualFX_originVob_offset_G2);
    oCVisualFX_targetVob_offset    = MEMINT_SwitchG1G2(oCVisualFX_targetVob_offset_G1,
                                                       oCVisualFX_targetVob_offset_G2);
    oCVisualFX_instanceName_offset = MEMINT_SwitchG1G2(oCVisualFX_instanceName_offset_G1,
                                                       oCVisualFX_instanceName_offset_G2);

    var int worldPtr; worldPtr = _@(MEM_World);
    if (!worldPtr) {
        return;
    };
	
	var int vobArrayPtr; vobArrayPtr = MEM_ArrayCreate();
    var zCArray vobArray; vobArray = _^(vobArrayPtr);
    const int call = 0; var int zero;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(zero));                 // Vob tree (0 == globalVobTree)
        CALL_PtrParam(_@(vobArrayPtr));          // Array to store found vobs in
        CALL_PtrParam(_@(oCVisualFX__classDef)); // Class definition
        CALL__thiscall(_@(worldPtr), zCWorld__SearchVobListByClass);
        call = CALL_End();
    };

    if (!vobArray.numInArray) {
        MEM_ArrayFree(vobArrayPtr);
        return;
    };
	
    repeat(i, vobArray.numInArray); var int i;
        var int vobPtr; vobPtr = MEM_ArrayRead(vobArrayPtr, i);
        if (!vobPtr) {
            continue;
        };		
		
		if (IsVobAtOrigin(vobPtr)) {
			// Stop the oCVisualFX
			const int call2 = 0; const int one = 1;
			if (CALL_Begin(call2)) {
				CALL_PtrParam(_@(one));
				CALL__thiscall(_@(vobPtr), oCVisualFX__Stop);
				call2 = CALL_End();
			};
		};
    end;
    MEM_ArrayFree(vobArrayPtr);
};
