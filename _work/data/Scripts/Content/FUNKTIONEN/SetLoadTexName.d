const int LOADINGTEXNAME_OFFSET = 9118980; //0x8B2504;

func void SetLoadTexNameTo_XXXXing (var string XXXX)
{
	var int XXXXptr;

	XXXXptr = STRINT_ToChar (XXXX);

	MEM_WriteInt (LOADINGTEXNAME_OFFSET, MEM_ReadInt (XXXXptr));
};