FUNC VOID B_RemoveDeadBodies(var C_NPC slf) {
	if (Npc_IsDead(slf)) {
		AI_Teleport	(slf, "TOT");
	};
};