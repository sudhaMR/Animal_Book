local composer = require "composer"
require "sqlite3"
local widget = require "widget"


local path = system.pathForFile("infoDomestic.db", system.DocumentsDirectory)
db = sqlite3.open( path )  
-- load first scene
print( display.pixelWidth / display.actualContentWidth )
local tablesetup = [[CREATE TABLE IF NOT EXISTS domesticanimal (id INTEGER PRIMARY KEY,description,image,audio,sounds);]]
print(tablesetup)
db:exec( tablesetup )

local insertionTable = [[INSERT OR REPLACE INTO domesticanimal VALUES("1","One of the first animals domesticated by ancient man, the dog has long been accurately described as man's best friend.","dog.png","spelldog.mp3","dogsound.mp3")]]
db:exec(insertionTable)


local insertionTable = [[INSERT OR REPLACE INTO domesticanimal VALUES("2","Cat is an interlligent domestic animal. There are dozens of breeds of cat, some hairless or tailless, and they exist in a variety of different colors.","cat.png","spellcat.mp3","catsound.mp3")]]
db:exec(insertionTable)


local insertionTable = [[INSERT OR REPLACE INTO domesticanimal VALUES("3","Horse is a four legged mammal which is known for its speed. A female horse is called a Mare while male horse is called a stallion. Younger ones are called foals.","horse.png","spellhorse.mp3","horsesound.mp3")]]
db:exec(insertionTable)


local insertionTable = [[INSERT OR REPLACE INTO domesticanimal VALUES("4","Rabbits are small furry mammals. They have a stub tail and long floppy ears. They are known to love carrots. In the wild, rabbits live in underground burrows.","rabbit.png","spellrabbit.mp3","rabbitsound.mp3")]]
db:exec(insertionTable)


local path = system.pathForFile("infoFarm.db", system.DocumentsDirectory)
db2 = sqlite3.open( path )  
-- load first scene
print( display.pixelWidth / display.actualContentWidth )
local tablesetup = [[CREATE TABLE IF NOT EXISTS farmanimalInfo (id INTEGER PRIMARY KEY autoincrement,description,image,audio,sounds);]]
print(tablesetup)
db2:exec( tablesetup )

local insertionTable = [[INSERT OR REPLACE INTO farmanimalInfo VALUES(NULL,"Cow is a four legged mammal raised in farms mainly for their milk. They have two distinct horns on their forehead. Cows graze on fields and mainly consume grass, hay and green plants.","cow.png","spellcow.mp3","cowsound.mp3")]]
db2:exec(insertionTable)


local insertionTable = [[INSERT OR REPLACE INTO farmanimalInfo VALUES(NULL,"Domestic goats are one of the oldest domesticated species. Goats have very special hooves which enable them to climb any terrain. ","goat.png","spellgoat.mp3","goatsound.mp3")]]
db2:exec(insertionTable)


local insertionTable = [[INSERT OR REPLACE INTO farmanimalInfo VALUES(NULL,"Sheep are very useful animals. Raising sheep employed many farmers in ancient times, given that this animal can give milk, cheese and wool.","sheep.png","spellsheep.mp3","sheepsound.mp3")]]
db2:exec(insertionTable)


local insertionTable = [[INSERT OR REPLACE INTO farmanimalInfo VALUES(NULL,"Pigs are highly trainable animals, and some, such as the Asian pot-bellied pig, are kept as pets. Pigs do not sweat and cool themselves using water or mud during hot weather. ","pig.png","spellpig.mp3","pigsound.mp3")]]
db2:exec(insertionTable)



local path = system.pathForFile("infoWild.db", system.DocumentsDirectory)
db2 = sqlite3.open( path )  
-- load first scene
print( display.pixelWidth / display.actualContentWidth )
local tablesetup = [[CREATE TABLE IF NOT EXISTS wildanimalInfo (id INTEGER PRIMARY KEY ,description,image,audio,sounds);]]
print(tablesetup)
db2:exec( tablesetup )

local insertionTable = [[INSERT OR REPLACE INTO wildanimalInfo VALUES("2","Lions are big cats known as the King of the Jungle. They are found in Africa and India. A group of lions is called a pride. Baby lions are called cubs.","lion.png","spelllion.mp3","lionsound.mp3")]]
db2:exec(insertionTable)


local insertionTable = [[INSERT OR REPLACE INTO wildanimalInfo VALUES("1","The tiger is the largest of the big cats. It's most famous for its unique orange coloring and black and white stripes. Tigers are excellent swimmers .","tiger.png","spelltiger.mp3","tigersound.mp3")]]
db2:exec(insertionTable)


local insertionTable = [[INSERT OR REPLACE INTO wildanimalInfo VALUES("3","Elephants are the biggest land animals in the world. It is found in Africa and Asia. Elephants have giant ears, long tusks, and a huge trunk. ","elephant.png","spellelephant.mp3","elephantsound.mp3")]]
db2:exec(insertionTable)


local insertionTable = [[INSERT OR REPLACE INTO wildanimalInfo VALUES("4","Monkeys live in trees, grasslands, mountains, forests, and on high plains. All monkeys can use their hands and feet for holding on to branches. ","monkey.png","spellmonkey.mp3","monkeysound.mp3")]]
db2:exec(insertionTable)


local insertionTable = [[INSERT OR REPLACE INTO wildanimalInfo VALUES("5","Bear live in trees, grasslands, mountains, forests, and on high plains. All monkeys can use their hands and feet for holding on to branches. ","bear.png","spellbear.mp3","bearsound.mp3")]]
db2:exec(insertionTable)

local insertionTable = [[INSERT OR REPLACE INTO wildanimalInfo VALUES("6","Deer live in trees, grasslands, mountains, forests, and on high plains. All monkeys can use their hands and feet for holding on to branches. ","deer.png","spelldeer.mp3","deersound.mp3")]]
db2:exec(insertionTable)

local insertionTable = [[INSERT OR REPLACE INTO wildanimalInfo VALUES("7","Giraffe live in trees, grasslands, mountains, forests, and on high plains. All monkeys can use their hands and feet for holding on to branches. ","giraffe.png","spellgiraffe.mp3","giraffesound.mp3")]]
db2:exec(insertionTable)

local insertionTable = [[INSERT OR REPLACE INTO wildanimalInfo VALUES("8","Rhinoceros live in trees, grasslands, mountains, forests, and on high plains. All monkeys can use their hands and feet for holding on to branches. ","rhinoceros.png","spellrhinoceros.mp3","rhinocerossound.mp3")]]
db2:exec(insertionTable)

local insertionTable = [[INSERT OR REPLACE INTO wildanimalInfo VALUES("9","Hippopotamus live in trees, grasslands, mountains, forests, and on high plains. All monkeys can use their hands and feet for holding on to branches. ","hippopotamus.png","spellhippopotamus.mp3","hippopotamussound.mp3")]]
db2:exec(insertionTable)


local path = system.pathForFile("infoMarineAnimals.db", system.DocumentsDirectory)
db3 = sqlite3.open( path )  
-- load first scene
print( display.pixelWidth / display.actualContentWidth )
local tablesetup = [[CREATE TABLE IF NOT EXISTS marineInfo (id INTEGER PRIMARY KEY,description,image,audio,sounds);]]
print(tablesetup)
db3:exec( tablesetup )

local insertionTable = [[INSERT OR REPLACE INTO marineInfo VALUES("1","Dolphins are aquatic mammals. They can stay up to 15 minutes under water, but they cannot breath under the water. They are intelligent creatures and learn very quickly.","dolphin.png","spelldolphin.mp3","dolphinsound.mp3")]]
db3:exec(insertionTable)


local insertionTable = [[INSERT OR REPLACE INTO marineInfo VALUES("2","Turtles are reptiles and are characterised by a special bony shell which acts as a shield against predators. They can live for around 200 years. Turtles can stay under water for a long time. ","turtle.png","spellturtle.mp3","turtlesound.mp3")]]
db3:exec(insertionTable)


local insertionTable = [[INSERT OR REPLACE INTO marineInfo VALUES("3","Seahorses are tiny fishes that are named for the shape of their head, which looks like the head of a tiny horse. They swim upright by moving their dorsal fin up and down. They also use their tail to move around.","seahorse.png","spellseahorse.mp3","seahorsesound.mp3")]]
db3:exec(insertionTable)


local insertionTable = [[INSERT OR REPLACE INTO marineInfo VALUES("4","Octopuses have rounded bodies, bulging eyes, and eight long arms. They mostly live deep under the sea and swim up during dusk to hunt. They can also change their color and swim backwards.","octopus.png","spelloctopus.mp3","octopussound.mp3")]]
db3:exec(insertionTable)

db:close()

db2:close()

db3:close()

composer.gotoScene( "splash", "fade", 400 )
