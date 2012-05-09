func void NDC_SetInput(var int on) {
	const int oCGame__HandleEvent = 7324016;
	MemoryProtectionOverride(oCGame__HandleEvent, 7);
	if(on) {
		MEM_WriteByte(oCGame__HandleEvent,   106);
		MEM_WriteByte(oCGame__HandleEvent+1, 255);
		MEM_WriteByte(oCGame__HandleEvent+2, 104);
	}
	else {
		MEM_WriteByte(oCGame__HandleEvent,   194);
		MEM_WriteByte(oCGame__HandleEvent+1, 4);
		MEM_WriteByte(oCGame__HandleEvent+2, 0);
	};
};