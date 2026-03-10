extends Node

const CLICK_1 = preload("res://Assets/Sound/click1.ogg")
const FRUIT = preload("res://Assets/Sound/impactBell_heavy_004.ogg")
const HIT = preload("res://Assets/Sound/impactWood_medium_002.ogg")
const JUMPING_SFX = preload("res://Assets/Sound/jumping sfx.mp3")

@onready var sfx_streams: Node = $SFXStreams

func play_fruit() -> void:
	play_audio(FRUIT)

func play_impact() -> void:
	play_audio(HIT)

func play_jump() -> void:
	play_audio(JUMPING_SFX)

func play_audio(audio: AudioStream) -> void:
	var audio_stream := get_free_stream()
	audio_stream.stream = audio
	audio_stream.play()

func get_free_stream() -> AudioStreamPlayer:
	for stream: AudioStreamPlayer in sfx_streams.get_children():
		if not stream.playing:
			return stream
	return null
