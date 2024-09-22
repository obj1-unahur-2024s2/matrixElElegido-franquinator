object neo {
    var energia = 100
    method energia() = 10
    method saltar(){
        energia *= 0.5
    }
    method vitalidad() = energia * 0.1
    method esElElegido() = true
}
object morfeo{
    var vitalidad = 8
    var estaDescansado = false
    method vitalidad() = vitalidad
    method estaDescansado() = estaDescansado
    method saltar(){
        estaDescansado = !estaDescansado
        vitalidad = 0.max(vitalidad-1)
    }
    method esElElegido() = false
}
object trinity{
    method vitalidad()=0
    method saltar(){}
    method esElElegido()=false
}
object nave{

    const property pasajeros = [neo,neo,morfeo,trinity]
    method subirA(unPasajero){
        pasajeros.add(unPasajero)
    }
    method bajarA(unPasajero){
        pasajeros.remove(unPasajero)
    }
    method cantidadDePasajeros() = pasajeros.count()
    method masVital() = pasajeros.max({p => p.vitalidad()})
    method menosVital() = pasajeros.min({p => p.vitalidad()})
    method estaElElegido() = pasajeros.any({p => p.esElElegido()})
    method estaEquilibrada(){
        self.masVital().vitalidad() <= self.menosVital().vitalidad() *2
    }
    method chocar(){
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }
    method pasajerosSinElegido() = 
    pasajeros.filter({p => !p.esElElegido()})
    method acelerar () {
        self.pasajerosSinElegido().forEach({p => p.saltar()})
    }
}