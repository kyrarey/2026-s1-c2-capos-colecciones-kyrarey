//2.1
object espadaDelDestino {
    var vecesUsada = 0

    method usarArtefacto() {
        vecesUsada += 1
    }

    method poder(personaje) {
        if (vecesUsada == 0) return personaje.poderBase()
        return (personaje.poderBase() * 0.5)
    }
}

object collarDivino {
    var vecesUsada = 0
    const poderBase = 3

    method usarArtefacto() {
        vecesUsada += 1
    }

    method poder(personaje) {
        if (personaje.poderBase() > 6) return poderBase + vecesUsada
        return poderBase
    }
}

object armaduraDeAceroValyrio {
    var vecesUsada = 0
    const poder = 6

    method usarArtefacto() {
        vecesUsada += 1
    }

    method poder(personaje) = poder
}

//2.2
object libroDeHechizos {
    const hechizos = []
    var vecesUsada = 0

    method hechizos() = hechizos

    method agregarHechizo(hechizo) {
        hechizos.add(hechizo)
    }

    method usarArtefacto() {
        vecesUsada += 1
        hechizos.remove(hechizos.head())
    }

    method poder(personaje) {
        if (hechizos.isEmpty()) {
            return 0
        } else {
            return (hechizos.head().poder(personaje)) //poder del primer hechizo
        }
    }
}

//hechizos
object bendicion {
    const poder = 4

    method poder(personaje) = poder
}

object invisibilidad {
    method poder(personaje) {
        return personaje.poderBase()
    }
}

object invocacion {
    method poder(personaje) {
        personaje.vivienda().artefactoMasPoderoso(personaje).poder(personaje) //debe haber una forma mejor
    }
}