import provincias.*
import profesionales.*

class Profesional{
  var property tipo
  var property universidad

  method pciasQuePuedeTrabajar() = tipo.pciasHabilitadas(self)
  method honorarioProf() = tipo.honorario(self)
}


class Universidad{
    var property localizacionPcia
    var property honorariosRecomendados
}

class Empresa {
    const property empleadosContratados = #{}
    var property honorarioReferencia

    method contratar(unEmpleado) = empleadosContratados.add(unEmpleado)
    method despedir(unEmpleado) = empleadosContratados.remove(unEmpleado)

    method estudiadosEnUniversidad(unaUniversidad) = empleadosContratados.count({e => e.universidad() == unaUniversidad})

    method profesionalesCaros() = empleadosContratados.filter({e => e.honorarioProf() > honorarioReferencia})

    method universidadesFormadoras() = empleadosContratados.map({e => e.universidad()}).asSet()

    method profesionalMasBarato() = empleadosContratados.min({e => e.honorarioProf()})

    method esDeGenteAcotada() = empleadosContratados.all({e => e.count({e => e.pciasQuePuedeTrabajar()}) <= 3})

}