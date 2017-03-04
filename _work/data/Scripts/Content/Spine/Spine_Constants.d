const string SPINE_VERSION_STRING = "1.2.0";

// Spine modules

const int SPINE_MODULE_GETCURRENTUSERNAME	= 1<<0;
const int SPINE_MODULE_ACHIEVEMENTS			= 1<<1;
const int SPINE_MODULE_SCORES				= 1<<2;
const int SPINE_MODULE_MULTIPLAYER			= 1<<3;
const int SPINE_MODULE_OVERALLSAVE			= 1<<4;

const int SPINE_ALL							= (1<<5) - 1;

const int SPINE_TOPLEFT = 0;
const int SPINE_TOPRIGHT = 1;
const int SPINE_BOTTOMLEFT = 2;
const int SPINE_BOTTOMRIGHT = 3;

const int SPINE_ACHIEVEMENT_WIDTH = 300;
const int SPINE_ACHIEVEMENT_HEIGHT = 80;
const int SPINE_ACHIEVEMENT_IMAGE_WIDTH = 64;
const int SPINE_ACHIEVEMENT_IMAGE_HEIGHT = 64;

// MessageTypes for Spine_Multiplayer
const int SPINE_MESSAGETYPE_BASE = 0;
const int SPINE_MESSAGETYPE_INT = 1;
const int SPINE_MESSAGETYPE_STRING = 2;
