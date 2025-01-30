@tool
class_name PlayerReplayResource
extends Resource

@export var timestamp : Array[float]:
	set(value):
		for i in range(1,len(value)):
			if value[i] < value[i - 1]:
				value[i] = value[i - 1]
		timestamp = value
