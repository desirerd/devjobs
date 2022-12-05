<div>
<div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">

<!-- Mezcla entre foreach y el if, analiza cada una de las vacantes, y si está vacío, muestra el mensaje final -->
   
    @forelse ($vacantes as $vacante)
        <div class="p-6 bg-white border-b border-gray-200 md:flex md:justify-between md:items-center">
            <div class="leading-10">
                <a href="{{ route('vacantes.show', $vacante->id )}}" class="text-xl font-bold">
                    {{$vacante->titulo}}
                </a>
                <p class="text-sm text-gray-600 font-bold"> {{ $vacante->empresa}}</p>
                <p class="text-sm text-gray-500 "> {{ $vacante->ultimo_dia->format('d/m/Y') }}</p>
            </div>

            <div class="flex flex-col md:flex-row items-strech gap-3 mt-5 md:mt-0">
                <a 
                href="{{ route('candidatos.index', $vacante) }}"
                class="bg-slate-800 py-2 px-4 rounded-lg text-white text-center text-xs font-bold uppercase"
                > {{ $vacante->candidatos->count() }} Candidatos
            </a>
            
                <a href="{{ route('vacantes.edit',$vacante->id) }}"
                class="bg-blue-800 py-2 px-4 rounded-lg text-white text-center text-xs font-bold uppercase"
                > Editar</a>
        
                <!-- Emitimos un evento, llamamos al método del primer parámetro y le pasamos variables por el segundo-->

                <button wire:click="$emit('mostrarAlerta', {{ $vacante->id }})"
                class="bg-red-600 py-2 px-4 rounded-lg text-white text-center text-xs font-bold uppercase"
                > Eliminar</button>
            </div>
        </div>
        
    @empty
        <p clas="p-3 text-center text-sm text-gray-600"> No hay vacantes que mostrar </p>
    @endforelse
</div>

<!-- Añadimos la paginación -->
<div>
    {{ $vacantes->links()}}
</div>

</div>

@push('scripts')

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>

        Livewire.on('mostrarAlerta', vacanteId => {
            Swal.fire({
            title: '¿Eliminar Vacante?',
            text: "Una vacante eliminada no se puede recuperar",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, Borrar!',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {

                // Eliminar la vacante desde el servidor
                Livewire.emit('eliminarVacante',vacanteId)

                 Swal.fire(
                'Borrada!',
                'La vacante sido eliminado',
                'success'
                )
            }
        })
        })

      </script>

@endpush