// übernommener nsc, den man dann steuert
// zustand wird von programmlogik beendet
// Befehle, die hier stehen werden ignoriert, da der Spieler entweder nur Tastatur- oder Zustandsgesteuert sein kann
// andere NSCs können aber den Zustand des Spielers abfragen

//////////////////////////////////////////////////////////////////////////
//	B_RegainDroppedWeapon
//	=====================
//	Guckt sich um und sammelt die Waffe, die am nächsten liegt wieder auf.
//	VORSICHT: Löscht die globale Variable 'item' !
//////////////////////////////////////////////////////////////////////////
func void B_RegainDroppedWeapon(var C_NPC slf)
{
	//-------- fallgelassene Waffe aufheben... --------
	Npc_PerceiveAll (slf);
	if ( Wld_DetectItem (slf, ITEM_KAT_NF) ||  Wld_DetectItem (slf, ITEM_KAT_FF) )
	{
		if	!Npc_IsPlayer(slf)
		&&	Npc_CanSeeItem(slf,item)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...NSC hebt seine Waffen wieder auf!" );				
			AI_TakeItem (slf, item);
			AI_EquipBestMeleeWeapon(slf);
			AI_EquipBestRangedWeapon(slf);
		};
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_RegainDroppedArmor
//	=====================
//	Guckt sich um und sammelt die Rüstung, die am nächsten liegt wieder auf.
//	VORSICHT: Löscht die globale Variable 'item' !
//////////////////////////////////////////////////////////////////////////
func void B_RegainDroppedArmor(var C_NPC slf)
{
	//-------- fallgelassene Waffe aufheben... --------
	Npc_PerceiveAll (slf);
	if ( Wld_DetectItem (slf, ITEM_KAT_ARMOR) )
	{
		if (!Npc_IsPlayer(slf))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...NSC hebt seine Rüstung wieder auf!" );				
			AI_TakeItem (slf, item);
			AI_EquipBestArmor(slf);
		};
	};
};

func void ZS_Controlled()
{
	PrintDebugNpc			(PD_ZS_FRAME,	"ZS_Controlled");	
};


func void ZS_Controlled_Loop()
{		
	PrintDebugNpc			(PD_ZS_LOOP, "ZS_Controlled_Loop" );
};


func void ZS_Controlled_End()
{
	PrintDebugNpc			(PD_ZS_FRAME, "ZS_Controlled_End" );

	//-------- zu Boden fallen ! --------
	B_FullStop				(self);
	AI_PlayAni				(self,	"T_PSI_VICTIM");
	AI_Wait					(self,	3.5);
	
	//-------- fallgelassene Waffe aufheben ! --------
	B_RegainDroppedWeapon	(self);		// Check ob Waffe/Rüstung herumliegt ist leider vom Stand vor der Ani T_PSI_VICTIM und könnte veraltet sein!!!
	B_RegainDroppedArmor	(self);		// dito
	
	//-------- Gegner behandeln ! --------
	Npc_SetTarget			(self,	hero);
	Npc_GetTarget			(self);
	B_AssessEnemy();
};
