// B_RangerMeeting

func void B_MakeRangerReadyForMeeting (VAR C_NPC Ranger)	
{				
	CreateInvItems 	(Ranger, ITAR_Fake_RANGER, 1 );	
	AI_UnequipArmor	(Ranger);
	AI_EquipArmor 	(Ranger, ITAR_Fake_RANGER);
	Ranger.npctype		= NPCTYPE_FRIEND;
};
func void B_MakeRangerReadyToLeaveMeeting (VAR C_NPC Ranger)	
{				
	AI_UnequipArmor	(Ranger);
	Npc_RemoveInvItems	(Ranger, ITAR_RANGER_Addon,	Npc_HasItems (Ranger, ITAR_RANGER_Addon ) );
	Npc_RemoveInvItems	(Ranger, ITAR_Fake_RANGER,	Npc_HasItems (Ranger, ITAR_Fake_RANGER ) );
	AI_EquipBestArmor (Ranger); //Joly:ITAR_Fake_RANGER wegen diesem hier, falls die Armor nicht gelöscht wurde.
};
func void B_MakeRangerReadyForMeetingALL ()
{
	
};
func void B_MakeRangerReadyToLeaveMeetingALL ()
{
	
};
////////////////////////////////////////////////
//Ready
////////////////////////////////////////////////
func void B_Addon_Orlan_RangersReadyForComing ()
{
	
};
////////////////////////////////////////////////
//Coming
////////////////////////////////////////////////
func void B_Addon_Orlan_ComingRanger ()
{
	
};
func VOID B_RangerMeetingParking () // im Lares dialog
{
	
};

func VOID B_SchlussMitRangerMeeting () //im Vatras dialog
{
			
};
