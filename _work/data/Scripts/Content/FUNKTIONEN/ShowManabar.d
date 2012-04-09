const int MANABAR_SHOW = /*0x0D8B14EB*/ 227218667;
const int MANABAR_HIDE = /*0x0000BCE9*/ 48361;
const int MANABAR_DEFAULT = /*0x0D8B1475*/ 227218549;

//  1 = Show 
//  0 = Default 
// -1 = Hide


func void ShowManabar(var int cond) {
        var int tmp; 
        
        MemoryProtectionOverride(/*0x006C33EC*/7091180, 4);
        
        if (cond == 1) {
        	tmp = MANABAR_SHOW;
     	} else if (cond == 0) {
     		tmp = MANABAR_DEFAULT;
        } else if (cond == -1) {
            tmp = /*000000BC*/ 188;
            MEM_WriteInt(/*0x006C33EC*/ 7091181, tmp);
        	tmp = MANABAR_HIDE;
        };
                
        MEM_WriteInt(/*0x006C33EC*/ 7091180, tmp);
};