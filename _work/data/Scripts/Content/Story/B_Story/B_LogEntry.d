// **********
// B_LogEntry
// **********

func void B_LogEntry (var string topic, var string entry)
{
	Log_AddEntry	(topic, entry);

	NewLogEntry_Super	=	PRINT_NewLogEntry;
	NewLogEntry_Super	=	ConcatStrings (NewLogEntry_Super, " (");
	NewLogEntry_Super	=	ConcatStrings (NewLogEntry_Super, topic);
	NewLogEntry_Super	=	ConcatStrings (NewLogEntry_Super, ")");

	PrintScreen		(NewLogEntry_Super, -1, YPOS_LOGENTRY, FONT_ScreenSmall, 4);
	Snd_Play 		("LogEntry");
};

func void B_LogEntry_More (var string topic1, var string topic2, var string entry1, var string entry2)
{
	Log_AddEntry	(topic1, entry1);
	Log_AddEntry	(topic2, entry2);

	NewLogEntry_Super_2	=	PRINT_NewLogEntry_2;
	NewLogEntry_Super_2	=	ConcatStrings (NewLogEntry_Super_2, " (");
	NewLogEntry_Super_2	=	ConcatStrings (NewLogEntry_Super_2, topic1);
	NewLogEntry_Super_2	=	ConcatStrings (NewLogEntry_Super_2, ", ");
	NewLogEntry_Super_2	=	ConcatStrings (NewLogEntry_Super_2, topic2);
	NewLogEntry_Super_2	=	ConcatStrings (NewLogEntry_Super_2, ")");
	
	PrintScreen		(NewLogEntry_Super_2, -1, YPOS_LOGENTRY, FONT_ScreenSmall, 4);
	Snd_Play 		("LogEntry");
};

func void B_LogEntry_NMore (var string topic1, var string topic2, var string topic3, var string entry1, var string entry2, var string entry3)
{
	Log_AddEntry	(topic1, entry1);
	Log_AddEntry	(topic2, entry2);
	Log_AddEntry	(topic3, entry3);

	NewLogEntry_Super_3	=	PRINT_NewLogEntry_2;
	NewLogEntry_Super_3	=	ConcatStrings (NewLogEntry_Super_3, " (");
	NewLogEntry_Super_3	=	ConcatStrings (NewLogEntry_Super_3, topic1);
	NewLogEntry_Super_3	=	ConcatStrings (NewLogEntry_Super_3, ", ");
	NewLogEntry_Super_3	=	ConcatStrings (NewLogEntry_Super_3, topic2);
	NewLogEntry_Super_3	=	ConcatStrings (NewLogEntry_Super_3, ", ");
	NewLogEntry_Super_3	=	ConcatStrings (NewLogEntry_Super_3, topic3);
	NewLogEntry_Super_3	=	ConcatStrings (NewLogEntry_Super_3, ")");
	
	PrintScreen		(NewLogEntry_Super_3, -1, YPOS_LOGENTRY, FONT_ScreenSmall, 4);
	Snd_Play 		("LogEntry");
};

func void B_LogEntry_NS (var string topic, var string entry)
{
	Log_AddEntry	(topic, entry);
};

FUNC VOID B_SucceedTopic (var string topic)
{
	Erfolg_OpenQuests -= 1;
	PrintScreen		(ConcatStrings("Quest erfüllt: ", topic), -1, YPOS_LOGENTRY+3+LogState_PosY, FONT_ScreenSmall_Green, 4);

	LogState_PosY += 3;

	Log_SetTopicStatus	(topic, LOG_SUCCESS);
	
	if (Erfolg_ClosedQuestsDay != Wld_GetDay()) {
		Erfolg_ClosedQuestsDay = Wld_GetDay();
		Erfolg_ClosedQuestsToday = 1;
	} else {
		Erfolg_ClosedQuestsToday += 1;
		if (Erfolg_ClosedQuestsToday >= 10) {
			Spine_UnlockAchievement(SPINE_ACHIEVEMENT_43);
		};
	};
	
	var int questAlreadySolvedBefore; questAlreadySolvedBefore = Spine_OverallSaveGetInt(topic);
	if (questAlreadySolvedBefore != 1) {
		Spine_OverallSaveSetInt(topic, 1);
		var int oldScore; oldScore = Spine_GetUserScore(SPINE_SCORE_2);
		if (oldScore < 0) {
			oldScore = 0;
		};
		Spine_UpdateScore(SPINE_SCORE_2, oldScore + 1);
	};
};

FUNC VOID B_StartTopic (var string topic)
{
	Erfolg_OpenQuests += 1;
	PrintScreen		(ConcatStrings("Neue Quest: ", topic), -1, YPOS_LOGENTRY+3+LogState_PosY, FONT_ScreenSmall, 4);

	LogState_PosY += 3;

	Log_SetTopicStatus	(topic, LOG_RUNNING);
	
	if (Erfolg_OpenQuests >= 100) {
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_41);
	};
};

FUNC VOID B_FailTopic (var string topic)
{
	Erfolg_OpenQuests -= 1;
	PrintScreen		(ConcatStrings("Quest gescheitert: ", topic), -1, YPOS_LOGENTRY+3+LogState_PosY, FONT_ScreenSmall_Red, 4);

	LogState_PosY += 3;

	Log_SetTopicStatus	(topic, LOG_FAILED);
};

FUNC VOID B_SetTopicStatus (var string topic, var int state)
{
	if (state == LOG_SUCCESS)
	{
		B_SucceedTopic (topic);
	}
	else if (state == LOG_FAILED)
	{
		B_FailTopic (topic);
	}
	else
	{
		B_StartTopic (topic);
	};
};