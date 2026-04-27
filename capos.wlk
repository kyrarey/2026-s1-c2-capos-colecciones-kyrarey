import artefactos.*
import enemigos.*


object rolando {
    const artefactosEnMochila = []
    const historialDeEncuentros = []
    var tamañoMochila = 0
    var morada = castilloDePiedra
    var poderBase = 5

    method poderBase() = poderBase

    method poderBase(_poderBase) {
        poderBase = _poderBase
    }

    method tamañoMochila() = tamañoMochila

    method tamañoMochila(_tamañoMochila) {
        tamañoMochila = _tamañoMochila
    }

    method morada(lugar) {
        morada = lugar
    }

    method historialDeEncuentros() = historialDeEncuentros

    method poderConArtefactos() = poderBase + self.sumatoriaPoderDeArtefactos()

    method sumatoriaPoderDeArtefactos() = artefactosEnMochila.sum({a => a.poder(self)})

    method artefactosEnMochila() = artefactosEnMochila

    method recolectarObjeto(artefacto) { 
        historialDeEncuentros.add(artefacto) //lo añade aunque no lo recolecte
        if (self.esCapacidadSuficiente()) {
            artefactosEnMochila.add(artefacto)
        }
    }

    method eliminarObjeto(artefacto) {
        if (self.tieneArtefacto(artefacto)) {
            artefactosEnMochila.remove(artefacto)
        }
    }

    method tieneArtefacto(artefactoABuscar) = artefactosEnMochila.contains(artefactoABuscar)
    //artefactosEnMochila.contains({artefacto => artefacto == artefactoABuscar})
    
    method esCapacidadSuficiente() = (tamañoMochila > artefactosEnMochila.size()) 
    //self.error ("rolando no tiene la capacidad suficiente")

    method cantidadArtefactos() = artefactosEnMochila.size()

    method artefactosTotales() = artefactosEnMochila.union(morada.artefactos())

    method batallar() {
        self.poderBase (self.poderBase() + 1 ) //despues de batallar su poder base aumenta
        artefactosEnMochila.forEach({ a => a.usarArtefacto() })
    }

    //2.3 enemigos
    method puedeVencer(enemigo) = (enemigo.poder() < self.poderConArtefactos())

    method puedeConquistarMorada(moradaDeEnemigo) = self.puedeVencer(moradaDeEnemigo.dueño())

    //method artefactoMasPoderosoDeLaMochila() = morada.artefactoMasPoderoso(self)

    //2.4 poderoso
    method esPoderosoEnErethia() = erethia.enemigos().all({ e => self.puedeVencer(e) })

    //2.5 artefacto fatal
    method tieneUnArtefactoFatal(enemigo) = artefactosEnMochila.find({ a => ( a.poder(self) > enemigo.poderBase())}) 
}

object castilloDePiedra {
    const artefactos = [] //conjunto
    const dueño = rolando

    method artefactos() = artefactos

    method artefactoMasPoderoso(personaje) = artefactos.max({ a => a.poder(personaje) })

    method almacenarObjeto(artefacto) {
        dueño.eliminarObjeto(artefacto)
        artefactos.add(artefacto)
    }
}

