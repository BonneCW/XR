//************************************************
//   Weniger Strenger External Test
//************************************************

const int _ExternalAcceptVobsCount = 0;
const int _oCNpcTypeInfo = 8983472;  //0x8913B0
const int _zCVobTypeInfo = 8970208;  //0x88DFE0

func void ExternalAcceptVobs() {
    if (!_ExternalAcceptVobsCount) {
        const int once = 0;
    
        var int ptr; ptr = 7188726; //0x6DB0F6
        if (!once) { MemoryProtectionOverride(ptr, 4); };
        MEM_WriteInt(ptr, _zCVobTypeInfo); //0x88DFE0
        
        ptr = 7188773; //0x6DB125
        if (!once) { MemoryProtectionOverride(ptr, 4); };
        MEM_WriteInt(ptr, _zCVobTypeInfo); //0x88DFE0
        
        once = true;
    };
    
    _ExternalAcceptVobsCount += 1;
};

func void ExternalDenyVobs() {
    _ExternalAcceptVobsCount -= 1;
    
    if (!_ExternalAcceptVobsCount) {
        var int ptr; ptr = 7188726; //0x6DB0F6
        MEM_WriteInt(ptr, _oCNpcTypeInfo); //0x88DFE0
        
        ptr = 7188773; //0x6DB125
        MEM_WriteInt(ptr, _oCNpcTypeInfo); //0x88DFE0
    };
};

FUNC INT Npc_GetDistToVob (var C_NPC slf, var int vobPtr)
{
	var zCVob vob; vob = MEM_PtrToInst(vobPtr);

	return Npc_GetDistToNpc(slf, vob);
};

var C_NPC gameLoaded;

FUNC INT C_HeroAtLight()
{    
	ExternalAcceptVobs(); //Weniger strikte Bedingung.

	const int Fireplaces = 0;

	if (!Hlp_IsValidNpc(gameLoaded)) { //oder anderes Verfahren um geladenes Spiel zu erkennen.
		gameLoaded = Hlp_GetNpc(hero);
        
		if (Fireplaces)
		{
			MEM_ArrayClear(Fireplaces);
		};

		Fireplaces = MEM_SearchAllVobsByName("FIREPLACE");
	};

	var zCArray arr; arr = MEM_PtrToInst(Fireplaces);
    
	var int i; i = 0;

	var int loop; loop = MEM_StackPos.position;

	if (i < arr.numInArray) {
		if (Npc_GetDistToVob(hero, MEM_ReadIntArray(arr.array, i)) < 750)
		{
			var ocMobFire firemob;
			MEM_AssignInst(firemob, MEM_ReadIntArray(arr.array, i));

			if (firemob.fireVobtree != 0)
			{
				ExternalDenyVobs(); //Wieder zurück auf normal.

				return TRUE;
			};
		};

		i += 1;

		MEM_StackPos.position = loop;
	};
};