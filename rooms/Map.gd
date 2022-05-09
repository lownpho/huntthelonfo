extends TileMap

export(int, 3, 12) var ROOMS_NUM = 3

export(int, 4, 32) var ROOM_SIZE = 8
export(int, 2, 12) var CORRIDOR_LENGTH = 6
export(int, 2, 6) var CORRIDOR_HEIGHT = 2

export(PackedScene) var light_pck

func createRoom(origin:Vector2):
	for _i in range(ROOM_SIZE):
		for _j in range(ROOM_SIZE):
			set_cell(int(_j+origin.x), int(_i+origin.y), 0)

func createHCorridor(origin:Vector2):
	for _i in range(CORRIDOR_HEIGHT):
		for _j in range(CORRIDOR_LENGTH):
			set_cell(int(_j+origin.x), int(_i+origin.y), 0)

func createVCorridor(origin:Vector2):
	for _i in range(CORRIDOR_LENGTH):
		for _j in range(CORRIDOR_HEIGHT):
			set_cell(int(_j+origin.x), int(_i+origin.y), 0)

func fillWithWalls():
	for _i in range(-ROOM_SIZE, (ROOMS_NUM+2)*ROOM_SIZE):
		for _j in range(-ROOM_SIZE, (ROOMS_NUM+2)*ROOM_SIZE):
			set_cell(_j, _i, 1)

func createMap():
	# this is really unefficient but who cares
	fillWithWalls()
	for _i in range(ROOMS_NUM):
		for _j in range(ROOMS_NUM):
			var room_pos = Vector2(_j, _i)*(ROOM_SIZE+CORRIDOR_LENGTH)
			createRoom(room_pos)
			var light_pos = map_to_world(room_pos+Vector2(ROOM_SIZE/2, ROOM_SIZE/2))
			addLight(light_pos)
			
			if _i < ROOMS_NUM-1:
				createVCorridor(Vector2(room_pos.x+ROOM_SIZE/2-CORRIDOR_HEIGHT/2, room_pos.y+ROOM_SIZE))
			if _j < ROOMS_NUM -1:
				createHCorridor(Vector2(room_pos.x+ROOM_SIZE, room_pos.y+ROOM_SIZE/2-CORRIDOR_HEIGHT/2))
	update_bitmask_region()

func addLight(position:Vector2):
	var light = light_pck.instance()
	light.position = position
	light.setTextureScale((ROOM_SIZE*2)*16/64)
	add_child(light)

func _ready():
	createMap()
