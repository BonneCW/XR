func string Wld_GetPlayerPortalRoom() {
	var oCPortalRoomManager portalman;
	portalman = MEM_PtrToInst (MEM_Game.portalman);
	var oCPortalRoom playerRoom;
	
	if (portalMan.curPlayerPortal) {
		playerRoom = MEM_PtrToInst (portalMan.curPlayerPortal);
		
		return playerRoom.portalName;
	} else {
		return "";
	};
};

func int Wld_GetPortalRoom (var string portalName) {
	var oCPortalRoomManager portalman;
	portalman = MEM_PtrToInst (MEM_Game.portalman);
	
	var oCPortalRoom room;
	
	var int i; i = 0;
	var int loop; loop = MEM_StackPos.position;
	
	if (i < portalman.portals_numInArray) {
        var int roomAdr;
        roomAdr = MEM_ReadIntArray (portalman.portals_array, i);
		room = MEM_PtrToInst (roomAdr); 
		
		if (Hlp_StrCmp (room.portalName, portalName)) {
			return roomAdr;
		};
		
		i += 1;
		MEM_StackPos.position = loop;
	};
	
	MEM_Warn (ConcatStrings ("Wld_GetPortalRoom failed. No such portal: ", portalName));
	return 0;
};

func void Wld_ReassignPortalToGuild(var string portalName, var int guild) {
	var int roomAdr;
	roomAdr = Wld_GetPortalRoom (portalName);
	
	if (roomAdr) {
		var oCPortalRoom room;
		room = MEM_PtrToInst (roomAdr);
		room.ownerGuild = guild;
	};
};

func void Wld_ReassignPortalToNpc(var string portalName, var C_NPC owner) {
	var int roomAdr;
	roomAdr = Wld_GetPortalRoom (portalName);
	
	if (roomAdr) {
		var oCPortalRoom room;
		room = MEM_PtrToInst (roomAdr);
		
		var zCObject ownerObj;
		ownerObj = Hlp_GetNpc (owner);
		room.ownerNpc = ownerObj.objectName;
	};
};