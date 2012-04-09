//######################################################################################
// item: Futter fassen
func void B_Orc_ItemEat()
{
	PrintDebugNpc( PD_TA_FRAME, "B_Orc_ItemEat" );
	
	//evtl. Waffe wegpacken
	if ( Npc_HasReadiedWeapon( self ) )
	{
		AI_RemoveWeapon( self );
	};
	
	//Guten Appetitt
	if ( Hlp_Random ( 10 ) < 5 )
	{
		if (Npc_HasItems (self,ItFo_Cheese) == 0)
		{
			CreateInvItem (self,ItFo_Cheese);
		};
		if ( Npc_GetBodyState( self ) != BS_ITEMINTERACT )
		{
			AI_UseItemToState( self, ItFo_Cheese, 1 );
		};
		AI_UseItemToState( self, ItFo_Cheese, -1 );
	}
	else
	{
		if (Npc_HasItems (self,ItFo_MuttonRaw) == 0)
		{
			CreateInvItem (self,ItFo_MuttonRaw);
		};
		if ( Npc_GetBodyState( self ) != BS_ITEMINTERACT )
		{
			AI_UseItemToState( self, ItFo_MuttonRaw, 1 );
		};
		AI_UseItemToState( self, ItFo_MuttonRaw, -1 );
	};
	

};


//######################################################################################
// item: Potion trinken
func void B_Orc_ItemPotion()
{
	PrintDebugNpc( PD_TA_FRAME,"B_Orc_ItemPotion" );

	//evtl. Waffe wegpacken
	if ( Npc_HasReadiedWeapon( self ) )
	{
		AI_RemoveWeapon( self );
	};

	
	//evtl. in Inv packen
	if ( !Npc_HasItems( self, ItFo_Wine ) )
	{
		CreateInvItem( self, ItFo_Wine );
	};	
	
	//Prost
	if ( Npc_GetBodyState( self ) != BS_ITEMINTERACT )
	{
		EquipItem( self, ItFo_Beer );
		AI_UseItemToState( self, ItFo_Beer, 1 );
	};
	AI_UseItemToState( self, ItFo_Beer, -1 );

};
