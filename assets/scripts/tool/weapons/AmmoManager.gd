extends Node
class_name AmmoManager
@export var rCapacity: int;
@export var rLoaded: int;
@export var rStashed: int;
@export var reloadOnlyFull: bool = false;


func canReload(num = -1):
	num = clamp(num,0,rCapacity)
	return rLoaded < rCapacity and ((reloadOnlyFull and rStashed >= num) or (not reloadOnlyFull and rStashed >= 1))

func reload(num = -1):
	if num < 0:
		num = rCapacity;
	if canReload(num):
		var effectiveRequired = clamp(rLoaded + num, 0, rCapacity);
		rStashed -= effectiveRequired - rLoaded;
		rLoaded = effectiveRequired;

func canSpendBullets(num = 1):
	return rLoaded >= num

func spendBullets(num = 1):
	if canSpendBullets(num):
		rLoaded -= num
