//##########################################################################
//##
//##	Bookstand Animals
//##
//##########################################################################

var int Hexe_1_permanent;

FUNC VOID Use_BookstandHexe1_S1()		//Tierbücher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, "Die Riesen der Vorzeit"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Nicht weit im Osten residiert der Riese Talos. Sein Körper ist fest wie Eisen, seine Widerstandskraft gegen Magie, Waffen, Eis und Feuer immens. Die Legende besagt, dass auf jenen, der ihn bezwingen kann, ein Teil seiner Macht übergeht."						);
				
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Im Westen wiederum erhebt sich der Frostriese über die Umgebung. Seine Aura lässt alles in der Nähe zu Eis erstarren, so heißt es. Schon viele Unglückliche, die ihm sich nährten, ereilte das Verderben ..."						);
					Doc_Show		( nDocID );
					
					if (Hexe_1_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);

						Hexe_1_permanent = TRUE;
					};	

	};
};