// *****
// B_Say
// *****

func void B_Say (var C_NPC slf, var C_Npc oth, var string text)
{
	if (slf.guild > GIL_SEPERATOR_HUM && slf.guild != GIL_DRAGON) {
		return;
	};
	AI_OutputSVM (slf, oth, text);
};
