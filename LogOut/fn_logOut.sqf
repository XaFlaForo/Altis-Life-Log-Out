/**
 * Author: XaFlaForo
 * Copyright: © XaFlaForo Studios, 2019
 * Rights: All Rights Reserved
 *
 * Filename: fn_logOut.sqf
 *
 * Parameter(s): NONE
 *
 * Description:
 * Function to be used when a unit gets incapacitated and act accordingly.
 *
 * Dependencies:
 * AsYetUntitled Framework, XaFlaForo Base Installation Pack
 */

scriptName "fn_logout";
﻿#define __filename "fn_logout.sqf"

//--- Disable Serialization
disableSerialization;

//--- Sync
[] call SOCK_fnc_updateRequest;

//--- Get highlight colour
_colorHighlight = [ "GUI", "BCG_RGB" ] call BIS_fnc_displayColorGet;

//--- Give the player immunity
﻿player allowDamage false;

//--- Disable user input
disableUserInput true;

//--- Hide chat
showChat false;

//--- Hide hint
hint "";

//--- Fade volume
1 fadeSound 0;
1 fadeMusic 0;
1 fadeRadio 0;
1 fadeSpeech 0;

//--- Fade screen
cutText [ "", "BLACK", 1 ];
sleep 2;

//--- Show sync screen
_effectID = 1 + floor random 3;
_videoFile = "A3\Missions_F_Bootcamp\video\VR_GenericTransition_" + str _effectID + ".ogv";
_video = [ _videoFile ] spawn BIS_fnc_playVideo;
﻿playSound ( "Transition" + str _effectID );
sleep 2;
0 = [ format [ "<br/><t color='%4'>%3</t><br/><br/><t size='0.7'>%1 %2.</t>", "We hope to see you again soon", profileName, "SYNCING DATA WITH SERVER", _colorHighlight ], 0, 0.2, 2, 0.5, 0, 1000 ] spawn BIS_fnc_dynamicText;

//--- Delay
sleep 5;
﻿
//--- Enable user input
disableUserInput false;

//--- End Mission
failMission "AbortFL";
endLoadingScreen;
