L = rawget(GLOBAL, 'MK_MOD_LANGUAGE_SETTING')

if L == "ENGLISH" then
    modimport("scripts/characterspeech/myth_character_speech_eng")
elseif L == "JAPAN" then
    modimport("scripts/characterspeech/myth_character_speech_jp")
else
    modimport("scripts/characterspeech/myth_character_speech")
end