//************************************************
//   Pfeile sollen von Npcs abprallen 
//************************************************

const int ZaphodArrowPatchAdr = 6949734; //0x6A0B66
//immer abprallen
func void ZaphodArrowPatch() {
    MemoryProtectionOverride(ZaphodArrowPatchAdr, 2);
    MEM_WriteByte(ZaphodArrowPatchAdr, ASMINT_OP_nop);
    MEM_WriteByte(ZaphodArrowPatchAdr + 1, ASMINT_OP_nop);
};

//Standardeinstellung
func void ZaphodArrowUnPatch() {
    MemoryProtectionOverride(ZaphodArrowPatchAdr, 2);
    MEM_WriteByte(ZaphodArrowPatchAdr, /*74*/ 116);
    MEM_WriteByte(ZaphodArrowPatchAdr + 1, /*3B*/  59);
};

//************************************************
//   Verschossene Muni sammeln und austauschen.
//************************************************

func void ZaphodPfeilExchange() {
    var int arrPtr; arrPtr = MEM_SearchAllVobsByName("PFEIL VON NSCICH");
    var zCArray arr; arr = MEM_PtrToInst(arrPtr);
    
    var int i; i = -1;
    var int loop; loop = MEM_StackPos.position; i += 1;
    
    if (i >= arr.numInArray) {
        MEM_Free(arrPtr);
        return;
    };
    
    var int vobPtr;
    vobPtr = MEM_ReadIntArray(arr.array, i);
    var zCVob  deadArrow;     deadArrow     = MEM_PtrToInst(vobPtr);
    var C_ITEM deadArrowItem; deadArrowItem = MEM_PtrToInst(vobPtr);
    
    if !(deadArrow.bitfield[0] & zCVob_bitfield0_physicsEnabled) {
        var int theInst; theInst = Hlp_GetInstanceID(deadArrow);
        //Pfeil gefunden, der keine Physik mehr hat.
        if (theInst == ITRW_ARROW) || (theInst == ITRW_BOLT) || (theInst == ITRW_SCHMETTERARROW) || (theInst == ITRW_WIDERHAKENARROW) || (theInst == ITRW_PRAEZISIONSARROW) || (theInst == ITRW_HOLYARROW) || (theInst == ITRW_TIERGIFTARROW) || (theInst == ITRW_GEWAECHSGIFTARROW) || (theInst == ITRW_GOLDERZARROW) || (theInst == ITRW_GOLDERZBLUTARROW) || (theInst == ITRW_ADDON_FIREARROW) || (theInst == ITRW_ADDON_MAGICARROW) || (theInst == ITRW_ICEARROW) || (theInst == ITRW_SCHMETTERBOLT) || (theInst == ITRW_WIDERHAKENBOLT) || (theInst == ITRW_PRAEZISIONSBOLT) || (theInst == ITRW_HOLYBOLT) || (theInst == ITRW_TIERGIFTBOLT) || (theInst == ITRW_GEWAECHSGIFTBOLT) || (theInst == ITRW_GOLDERZBOLT) || (theInst == ITRW_GOLDERZBLUTBOLT) || (theInst == ITRW_ADDON_FIREBOLT) || (theInst == ITRW_ADDON_MAGICBOLT) || (theInst == ITRW_ICEBOLT) {
            /* erstmal markieren und schauen ob er schnell verschwindet...
             * munition wird nicht gebraucht, kann ich missbrauchen. */
            if (!deadArrowItem.munition) {
                deadArrowItem.munition = addf(MEM_Timer.totalTimeFloat, mkf(200)); //200 ms warten
                //Wartezeit setzen.
                MEM_StackPos.position = loop; //continue
            } else if (deadArrowItem.munition > MEM_Timer.totalTimeFloat)
            || (deadArrow.visualAlpha <= FLOATHALB) { //wenn schon halb unsichtbar, dann auch warten.
                //nichts unternehmen, noch warten.
                MEM_StackPos.position = loop; //continue
            };

		if (theInst == ITRW_TIERGIFTARROW)
		|| (theInst == ITRW_GEWAECHSGIFTARROW)
		{
			theInst = ItRw_Arrow;
		}
		else if (theInst == ITRW_TIERGIFTBOLT)
		|| (theInst == ITRW_GEWAECHSGIFTBOLT)
		{
			theInst = ItRw_Bolt;
		};
            
            deadArrow.bitfield[0] = deadArrow.bitfield[0] & ~ zCVob_bitfield0_showVisual; //Visual Weg.
            
            Wld_InsertItem(theInst, "PC_HERO");
            var zCVob newArrow; newArrow = MEM_PtrToInst(MEM_InstToPtr(theInst));
            
            var int j; j = 0;
            var int loop2; loop2 = MEM_StackPos.position;
            if (j < 16) {
                MEM_WriteStatArr(newArrow.trafoObjToWorld, j, MEM_ReadStatArr(deadArrow.trafoObjToWorld, j));
                j += 1;
                MEM_StackPos.position = loop2;
            };
            VobPositionUpdated(MEM_InstToPtr(newArrow));
        };
        
        //damit er nicht nochmal gefunden wird.
        MEM_RenameVob(vobPtr, "TOTER PFEIL");
    };
    
    MEM_StackPos.position = loop;
};