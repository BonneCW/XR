// ************
// B_StopLookAt
// ************

func void B_StopLookAt (var C_NPC slf)
{
	var C_NPC target; target = Npc_GetLookAtTarget(slf);

	B_Vergiftet (slf);
	
	if (Hlp_IsValidNpc(target))
	{
		AI_StopLookAt (slf);
	};
};

// ***********
// B_LookAtNpc
// ***********

func void B_LookAtNpc (var C_NPC slf, var C_NPC oth)
{

	B_Vergiftet (slf);

	B_StopLookAt (slf);
	AI_LookAtNpc (slf, oth);
};

// ***********
// B_TurnToNpc
// ***********

func void B_TurnToNpc (var C_NPC slf, var C_Npc oth)
{

	B_Vergiftet (slf);

	AI_TurnToNpc (slf, oth);
};
