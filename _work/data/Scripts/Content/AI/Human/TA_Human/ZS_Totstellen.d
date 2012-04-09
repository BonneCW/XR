/****************************************************
*               personalisierter TA                 *
*   Y´Berion liegt nach großer Beschwörung 		    *
*   am Boden 										*
****************************************************/
func void ZS_Totstellen () 
{
	//B_ClearPerceptions();
	
	B_UseHat (self);

   	AI_PlayAniBS 	(self,	"T_DEAD",	BS_LIE);
};

func void ZS_Totstellen_Loop ()
{
	AI_Wait			(self,	1);
};

func void ZS_Totstellen_End ()
{
};


		
		
		
		
		
		
		