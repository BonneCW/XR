// *****************************
// B_SetAttitude
// -----------------------------
// setzt die Attitüde zum Player
// (temp UND perm)
// *****************************

func void B_SetAttitude (var C_NPC slf, var int att)
{
	// ------ perm Att setzen ------
	Npc_SetAttitude (slf, att);

	B_Vergiftet (slf);
	
	// ------ temp Att setzen ------
	Npc_SetTempAttitude (slf, att);
};



