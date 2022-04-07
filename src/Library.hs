module Library where
import PdePreludat

{-
int doble(int numero){
    return numero + numero
}
-}

doble :: Number -> Number
doble numero = numero + numero

-- Labo Azul
esPar :: Number -> Bool
esPar nro = mod nro 2 == 0

esLargo :: String -> Bool
esLargo nombre = length nombre > 3

-- Vimos las funciones mod (resto de la división), elem (saber si un caracter está en un string), not (negación lógica), && y || (el and y el or).

-- Propuesta para practicar:
-- Hacer una función que diga si un password es bueno: cuando es largo y no tiene una 'a'. 
-- Pueden pasar y discutir las soluciones por #consultas de Discord

-- Labo Rojo

tieneMuchasLetras :: String -> Bool
tieneMuchasLetras palabra = length palabra > 15

sumaCuadrados :: Number -> Number -> Number
sumaCuadrados x y = cuadrado x + cuadrado y

cuadrado :: Number -> Number
cuadrado nro = nro * nro

anioActual :: Number
anioActual = 2022

between bajo alto medio = bajo <= medio && medio <= alto

type Hora = Number
type Dia = String

horaCierre :: Dia -> Bool -> Hora
horaCierre "domingo" True = 13
horaCierre "sabado" False = 21
horaCierre dia True = 20
horaCierre dia False = 12 + length dia

---otherwise = True

descuento :: Hora -> Number
descuento hora | hora <= 10  = 10
    | hora >= 18 = 0
    | otherwise = 5

-- LISTAS Y DATA

listaVacia = [] 
impares = [1,3,5,7,9]
unaListaDeCaracteres = ['a','b','c'] 
laListaDeCaracteresEsUnString = "abc"
cualquierVerdura = ["lechuga", "papa", "alcaucil", "tomate"]


listaDeListas:: [[Number]] 
listaDeListas = [[1,2], [2,3,4], [], impares]

siempreListas:: [Bool]
siempreListas = [True,True,True,True,True,True,True]

capicua::Eq a => [a] -> Bool
capicua palabra = palabra == reverse palabra 

rango:: [Number] -> Number
rango valores = maximum valores - minimum valores

separador::Show a => [a]->String
separador nombre = 
    show (primeraMitad nombre) ++ " - " 
    ++ show (segundaMitad nombre) 

primeraMitad nombre = take (mitadDelLargo nombre) nombre
segundaMitad nombre = drop (mitadDelLargo nombre) nombre

mitadDelLargo nombre  = div (length nombre) 2

empiezoPorElFinal:: [a]->[a]
empiezoPorElFinal elementos = last elementos:(init (tail elementos) ++ [head elementos])


--------- TUPLAS

ubicaciont = (3,-1)  
hundidot = ('A', 7) 
procert = ("San Martín", 1850, "Boulogne sur mer") 

parejat:: (String,String)
parejat = ("Romeo", "Julieta")

pdept::(String,Char,Number,Number,Bool)
pdept = ("Paradigmas", 'K', 2, 4, True)

tuplaConTuplas::(String,(Number,String),(Number,String))
tuplaConTuplas = ("otoño", (21,"marzo"),(20, "junio"))

laDeAbajo::(Char,Number)->(Char,Number) 
laDeAbajo (columna, fila) = (columna, fila + 1)

estaAbajo:: (Char,Number)->(Char,Number) -> Bool
estaAbajo posicion1 posicion2 = laDeAbajo posicion1 == posicion2


------------ DATA

data Relacion = Pareja String String

pareja::Relacion
pareja = Pareja "Romeo" "Julieta"

--data Asignatura = Materia String Char Number Number Bool

pdep :: Asignatura
pdep = Materia "Paradigmas" 'K' 2 4 True

data Fecha = Dia Number String
data Estacion = Estacion String Fecha Fecha

dataConData::Estacion 
dataConData = Estacion "otoño" (Dia 21 "marzo") (Dia 20 "junio")

fusion:: Relacion->Relacion->Relacion
fusion (Pareja uno una) (Pareja otro otra) = Pareja una otro

----------- Data con Syntax Record
data Asignatura = Materia {
    nombre:: String,
    departamento:: Char,
    nivel:: Number,
    horas:: Number,
    laMejorMateriaDelUniverso:: Bool } deriving (Show, Eq)

pdep2 = Materia "Paradigmas" 'K' 2 4 True
otra = Materia {nombre = "Otra Materia", departamento = 'X', nivel = 1, horas = 4, laMejorMateriaDelUniverso = False}

esIntensa::Asignatura -> Bool
esIntensa asignatura = horas asignatura > 4 || departamento asignatura == 'X'


cambioCarrera :: Char -> Asignatura -> Asignatura
cambioCarrera nuevoDepartamento asignatura = Materia {
    nombre = nombre asignatura,
    departamento = nuevoDepartamento,
    nivel = 1,
    horas = horas asignatura * 2,
    laMejorMateriaDelUniverso = not (laMejorMateriaDelUniverso asignatura) }


------ Pruebas varias
{-

take 3 impares
[1,3,5]

"Guate" ++ "mala"
"Guatemala"

1:[2,3]
[1,2,3]

concat [[1,2],[3,4,5],[6]]
[1,2,3,4,5,6]

length "cinco"
5

elem 2 impares
False

minimum ["Zoe","Ana","Juan"]
"Ana"

reverse "Neuquén"
"néuqueN"


pdep = Materia "Paradigmas" 'K' 2 4 True

nombre pdep 
"Otra Materia"

horas pdep
4

-}