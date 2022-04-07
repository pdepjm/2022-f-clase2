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
