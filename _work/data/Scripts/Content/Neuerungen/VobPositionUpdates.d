func void GetPositionWorldVec(var int vobPtr, var int vecPtr) {
    var zCVob vob; vob = MEM_PtrToInst(vobPtr);
    MEM_WriteIntArray(vecPtr, 0, vob.trafoObjToWorld[3]);
    MEM_WriteIntArray(vecPtr, 1, vob.trafoObjToWorld[7]);
    MEM_WriteIntArray(vecPtr, 2, vob.trafoObjToWorld[11]);
};

func void SetPositionWorldVec(var int vobPtr, var int vecPtr) {
    const int zCVob_SetPositionWorld = 6404976; //0x61BB70

    CALL_PtrParam(vecPtr);
    CALL__thiscall(vobPtr, zCVob_SetPositionWorld);
};

//Wenn manuell an der Position rumgeschmiert wird, werden Bounding Box usw. nicht angepasst.
//Vobs flackern oder haben Fokusnamen an der falschen Stelle etc.
func void VobPositionUpdated(var int vobPtr) {
    var int pos[3];
    GetPositionWorldVec(vobPtr, _@(pos));
    SetPositionWorldVec(vobPtr, _@(pos));
};